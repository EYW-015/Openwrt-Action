# 恢复小米commit
git revert edbd8d2e9839357f3a4f0a06174d243f362b1544 -n
# 消除冲突
sed -i '/<<</d'  target/linux/ipq807x/patches-5.10/900-arm64-dts-add-OpenWrt-DTS-files.patch
sed -i '/===/,/>>>/d'  target/linux/ipq807x/patches-5.10/900-arm64-dts-add-OpenWrt-DTS-files.patch
git add target/linux/ipq807x/patches-5.10/900-arm64-dts-add-OpenWrt-DTS-files.patch
git add target/linux/ipq807x/files-5.10/arch/arm64/boot/dts/qcom/ipq8071-ax6.dts
git add target/linux/ipq807x/files-5.10/arch/arm64/boot/dts/qcom/ipq8071-ax3600.dts
git add target/linux/ipq807x/files-5.10/arch/arm64/boot/dts/qcom/ipq8071-ax3600.dtsi
# 完成revert
#git revert --continue
