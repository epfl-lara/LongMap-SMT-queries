; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124158 () Bool)

(assert start!124158)

(declare-fun b!1437313 () Bool)

(declare-fun res!970196 () Bool)

(declare-fun e!810906 () Bool)

(assert (=> b!1437313 (=> (not res!970196) (not e!810906))))

(declare-datatypes ((array!97762 0))(
  ( (array!97763 (arr!47175 (Array (_ BitVec 32) (_ BitVec 64))) (size!47725 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97762)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97762 (_ BitVec 32)) Bool)

(assert (=> b!1437313 (= res!970196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!970197 () Bool)

(assert (=> start!124158 (=> (not res!970197) (not e!810906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124158 (= res!970197 (validMask!0 mask!2687))))

(assert (=> start!124158 e!810906))

(assert (=> start!124158 true))

(declare-fun array_inv!36203 (array!97762) Bool)

(assert (=> start!124158 (array_inv!36203 a!2862)))

(declare-fun b!1437314 () Bool)

(declare-fun e!810908 () Bool)

(assert (=> b!1437314 (= e!810908 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun b!1437315 () Bool)

(declare-fun res!970199 () Bool)

(assert (=> b!1437315 (=> (not res!970199) (not e!810908))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11427 0))(
  ( (MissingZero!11427 (index!48100 (_ BitVec 32))) (Found!11427 (index!48101 (_ BitVec 32))) (Intermediate!11427 (undefined!12239 Bool) (index!48102 (_ BitVec 32)) (x!129828 (_ BitVec 32))) (Undefined!11427) (MissingVacant!11427 (index!48103 (_ BitVec 32))) )
))
(declare-fun lt!632262 () SeekEntryResult!11427)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97762 (_ BitVec 32)) SeekEntryResult!11427)

(assert (=> b!1437315 (= res!970199 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47175 a!2862) j!93) a!2862 mask!2687) lt!632262))))

(declare-fun b!1437316 () Bool)

(declare-fun res!970200 () Bool)

(assert (=> b!1437316 (=> (not res!970200) (not e!810906))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437316 (= res!970200 (validKeyInArray!0 (select (arr!47175 a!2862) i!1006)))))

(declare-fun b!1437317 () Bool)

(declare-fun res!970202 () Bool)

(assert (=> b!1437317 (=> (not res!970202) (not e!810906))))

(assert (=> b!1437317 (= res!970202 (validKeyInArray!0 (select (arr!47175 a!2862) j!93)))))

(declare-fun b!1437318 () Bool)

(declare-fun res!970203 () Bool)

(assert (=> b!1437318 (=> (not res!970203) (not e!810906))))

(assert (=> b!1437318 (= res!970203 (and (= (size!47725 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47725 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47725 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437319 () Bool)

(declare-fun res!970198 () Bool)

(assert (=> b!1437319 (=> (not res!970198) (not e!810906))))

(declare-datatypes ((List!33676 0))(
  ( (Nil!33673) (Cons!33672 (h!35010 (_ BitVec 64)) (t!48370 List!33676)) )
))
(declare-fun arrayNoDuplicates!0 (array!97762 (_ BitVec 32) List!33676) Bool)

(assert (=> b!1437319 (= res!970198 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33673))))

(declare-fun b!1437320 () Bool)

(declare-fun res!970201 () Bool)

(assert (=> b!1437320 (=> (not res!970201) (not e!810906))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437320 (= res!970201 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47725 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47725 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47725 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47175 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437321 () Bool)

(assert (=> b!1437321 (= e!810906 e!810908)))

(declare-fun res!970204 () Bool)

(assert (=> b!1437321 (=> (not res!970204) (not e!810908))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437321 (= res!970204 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47175 a!2862) j!93) mask!2687) (select (arr!47175 a!2862) j!93) a!2862 mask!2687) lt!632262))))

(assert (=> b!1437321 (= lt!632262 (Intermediate!11427 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124158 res!970197) b!1437318))

(assert (= (and b!1437318 res!970203) b!1437316))

(assert (= (and b!1437316 res!970200) b!1437317))

(assert (= (and b!1437317 res!970202) b!1437313))

(assert (= (and b!1437313 res!970196) b!1437319))

(assert (= (and b!1437319 res!970198) b!1437320))

(assert (= (and b!1437320 res!970201) b!1437321))

(assert (= (and b!1437321 res!970204) b!1437315))

(assert (= (and b!1437315 res!970199) b!1437314))

(declare-fun m!1326633 () Bool)

(assert (=> b!1437319 m!1326633))

(declare-fun m!1326635 () Bool)

(assert (=> b!1437321 m!1326635))

(assert (=> b!1437321 m!1326635))

(declare-fun m!1326637 () Bool)

(assert (=> b!1437321 m!1326637))

(assert (=> b!1437321 m!1326637))

(assert (=> b!1437321 m!1326635))

(declare-fun m!1326639 () Bool)

(assert (=> b!1437321 m!1326639))

(declare-fun m!1326641 () Bool)

(assert (=> start!124158 m!1326641))

(declare-fun m!1326643 () Bool)

(assert (=> start!124158 m!1326643))

(assert (=> b!1437315 m!1326635))

(assert (=> b!1437315 m!1326635))

(declare-fun m!1326645 () Bool)

(assert (=> b!1437315 m!1326645))

(declare-fun m!1326647 () Bool)

(assert (=> b!1437316 m!1326647))

(assert (=> b!1437316 m!1326647))

(declare-fun m!1326649 () Bool)

(assert (=> b!1437316 m!1326649))

(declare-fun m!1326651 () Bool)

(assert (=> b!1437313 m!1326651))

(assert (=> b!1437317 m!1326635))

(assert (=> b!1437317 m!1326635))

(declare-fun m!1326653 () Bool)

(assert (=> b!1437317 m!1326653))

(declare-fun m!1326655 () Bool)

(assert (=> b!1437320 m!1326655))

(declare-fun m!1326657 () Bool)

(assert (=> b!1437320 m!1326657))

(check-sat (not b!1437313) (not start!124158) (not b!1437319) (not b!1437317) (not b!1437316) (not b!1437321) (not b!1437315))
(check-sat)
(get-model)

(declare-fun b!1437367 () Bool)

(declare-fun lt!632271 () SeekEntryResult!11427)

(assert (=> b!1437367 (and (bvsge (index!48102 lt!632271) #b00000000000000000000000000000000) (bvslt (index!48102 lt!632271) (size!47725 a!2862)))))

(declare-fun res!970238 () Bool)

(assert (=> b!1437367 (= res!970238 (= (select (arr!47175 a!2862) (index!48102 lt!632271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810931 () Bool)

(assert (=> b!1437367 (=> res!970238 e!810931)))

(declare-fun b!1437369 () Bool)

(declare-fun e!810932 () Bool)

(assert (=> b!1437369 (= e!810932 (bvsge (x!129828 lt!632271) #b01111111111111111111111111111110))))

(declare-fun b!1437370 () Bool)

(declare-fun e!810929 () SeekEntryResult!11427)

(declare-fun e!810928 () SeekEntryResult!11427)

(assert (=> b!1437370 (= e!810929 e!810928)))

(declare-fun lt!632270 () (_ BitVec 64))

(declare-fun c!133071 () Bool)

(assert (=> b!1437370 (= c!133071 (or (= lt!632270 (select (arr!47175 a!2862) j!93)) (= (bvadd lt!632270 lt!632270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437371 () Bool)

(assert (=> b!1437371 (and (bvsge (index!48102 lt!632271) #b00000000000000000000000000000000) (bvslt (index!48102 lt!632271) (size!47725 a!2862)))))

(declare-fun res!970239 () Bool)

(assert (=> b!1437371 (= res!970239 (= (select (arr!47175 a!2862) (index!48102 lt!632271)) (select (arr!47175 a!2862) j!93)))))

(assert (=> b!1437371 (=> res!970239 e!810931)))

(declare-fun e!810930 () Bool)

(assert (=> b!1437371 (= e!810930 e!810931)))

(declare-fun b!1437372 () Bool)

(assert (=> b!1437372 (= e!810929 (Intermediate!11427 true index!646 x!665))))

(declare-fun b!1437373 () Bool)

(assert (=> b!1437373 (= e!810928 (Intermediate!11427 false index!646 x!665))))

(declare-fun b!1437374 () Bool)

(assert (=> b!1437374 (and (bvsge (index!48102 lt!632271) #b00000000000000000000000000000000) (bvslt (index!48102 lt!632271) (size!47725 a!2862)))))

(assert (=> b!1437374 (= e!810931 (= (select (arr!47175 a!2862) (index!48102 lt!632271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437375 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437375 (= e!810928 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47175 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1437368 () Bool)

(assert (=> b!1437368 (= e!810932 e!810930)))

(declare-fun res!970240 () Bool)

(get-info :version)

(assert (=> b!1437368 (= res!970240 (and ((_ is Intermediate!11427) lt!632271) (not (undefined!12239 lt!632271)) (bvslt (x!129828 lt!632271) #b01111111111111111111111111111110) (bvsge (x!129828 lt!632271) #b00000000000000000000000000000000) (bvsge (x!129828 lt!632271) x!665)))))

(assert (=> b!1437368 (=> (not res!970240) (not e!810930))))

(declare-fun d!154637 () Bool)

(assert (=> d!154637 e!810932))

(declare-fun c!133069 () Bool)

(assert (=> d!154637 (= c!133069 (and ((_ is Intermediate!11427) lt!632271) (undefined!12239 lt!632271)))))

(assert (=> d!154637 (= lt!632271 e!810929)))

(declare-fun c!133070 () Bool)

(assert (=> d!154637 (= c!133070 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!154637 (= lt!632270 (select (arr!47175 a!2862) index!646))))

(assert (=> d!154637 (validMask!0 mask!2687)))

(assert (=> d!154637 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47175 a!2862) j!93) a!2862 mask!2687) lt!632271)))

(assert (= (and d!154637 c!133070) b!1437372))

(assert (= (and d!154637 (not c!133070)) b!1437370))

(assert (= (and b!1437370 c!133071) b!1437373))

(assert (= (and b!1437370 (not c!133071)) b!1437375))

(assert (= (and d!154637 c!133069) b!1437369))

(assert (= (and d!154637 (not c!133069)) b!1437368))

(assert (= (and b!1437368 res!970240) b!1437371))

(assert (= (and b!1437371 (not res!970239)) b!1437367))

(assert (= (and b!1437367 (not res!970238)) b!1437374))

(declare-fun m!1326685 () Bool)

(assert (=> b!1437367 m!1326685))

(assert (=> b!1437371 m!1326685))

(declare-fun m!1326687 () Bool)

(assert (=> d!154637 m!1326687))

(assert (=> d!154637 m!1326641))

(assert (=> b!1437374 m!1326685))

(declare-fun m!1326689 () Bool)

(assert (=> b!1437375 m!1326689))

(assert (=> b!1437375 m!1326689))

(assert (=> b!1437375 m!1326635))

(declare-fun m!1326691 () Bool)

(assert (=> b!1437375 m!1326691))

(assert (=> b!1437315 d!154637))

(declare-fun b!1437376 () Bool)

(declare-fun lt!632273 () SeekEntryResult!11427)

(assert (=> b!1437376 (and (bvsge (index!48102 lt!632273) #b00000000000000000000000000000000) (bvslt (index!48102 lt!632273) (size!47725 a!2862)))))

(declare-fun res!970241 () Bool)

(assert (=> b!1437376 (= res!970241 (= (select (arr!47175 a!2862) (index!48102 lt!632273)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810936 () Bool)

(assert (=> b!1437376 (=> res!970241 e!810936)))

(declare-fun b!1437378 () Bool)

(declare-fun e!810937 () Bool)

(assert (=> b!1437378 (= e!810937 (bvsge (x!129828 lt!632273) #b01111111111111111111111111111110))))

(declare-fun b!1437379 () Bool)

(declare-fun e!810934 () SeekEntryResult!11427)

(declare-fun e!810933 () SeekEntryResult!11427)

(assert (=> b!1437379 (= e!810934 e!810933)))

(declare-fun lt!632272 () (_ BitVec 64))

(declare-fun c!133074 () Bool)

(assert (=> b!1437379 (= c!133074 (or (= lt!632272 (select (arr!47175 a!2862) j!93)) (= (bvadd lt!632272 lt!632272) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437380 () Bool)

(assert (=> b!1437380 (and (bvsge (index!48102 lt!632273) #b00000000000000000000000000000000) (bvslt (index!48102 lt!632273) (size!47725 a!2862)))))

(declare-fun res!970242 () Bool)

(assert (=> b!1437380 (= res!970242 (= (select (arr!47175 a!2862) (index!48102 lt!632273)) (select (arr!47175 a!2862) j!93)))))

(assert (=> b!1437380 (=> res!970242 e!810936)))

(declare-fun e!810935 () Bool)

(assert (=> b!1437380 (= e!810935 e!810936)))

(declare-fun b!1437381 () Bool)

(assert (=> b!1437381 (= e!810934 (Intermediate!11427 true (toIndex!0 (select (arr!47175 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437382 () Bool)

(assert (=> b!1437382 (= e!810933 (Intermediate!11427 false (toIndex!0 (select (arr!47175 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437383 () Bool)

(assert (=> b!1437383 (and (bvsge (index!48102 lt!632273) #b00000000000000000000000000000000) (bvslt (index!48102 lt!632273) (size!47725 a!2862)))))

(assert (=> b!1437383 (= e!810936 (= (select (arr!47175 a!2862) (index!48102 lt!632273)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437384 () Bool)

(assert (=> b!1437384 (= e!810933 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47175 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47175 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1437377 () Bool)

(assert (=> b!1437377 (= e!810937 e!810935)))

(declare-fun res!970243 () Bool)

(assert (=> b!1437377 (= res!970243 (and ((_ is Intermediate!11427) lt!632273) (not (undefined!12239 lt!632273)) (bvslt (x!129828 lt!632273) #b01111111111111111111111111111110) (bvsge (x!129828 lt!632273) #b00000000000000000000000000000000) (bvsge (x!129828 lt!632273) #b00000000000000000000000000000000)))))

(assert (=> b!1437377 (=> (not res!970243) (not e!810935))))

(declare-fun d!154641 () Bool)

(assert (=> d!154641 e!810937))

(declare-fun c!133072 () Bool)

(assert (=> d!154641 (= c!133072 (and ((_ is Intermediate!11427) lt!632273) (undefined!12239 lt!632273)))))

(assert (=> d!154641 (= lt!632273 e!810934)))

(declare-fun c!133073 () Bool)

(assert (=> d!154641 (= c!133073 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154641 (= lt!632272 (select (arr!47175 a!2862) (toIndex!0 (select (arr!47175 a!2862) j!93) mask!2687)))))

(assert (=> d!154641 (validMask!0 mask!2687)))

(assert (=> d!154641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47175 a!2862) j!93) mask!2687) (select (arr!47175 a!2862) j!93) a!2862 mask!2687) lt!632273)))

(assert (= (and d!154641 c!133073) b!1437381))

(assert (= (and d!154641 (not c!133073)) b!1437379))

(assert (= (and b!1437379 c!133074) b!1437382))

(assert (= (and b!1437379 (not c!133074)) b!1437384))

(assert (= (and d!154641 c!133072) b!1437378))

(assert (= (and d!154641 (not c!133072)) b!1437377))

(assert (= (and b!1437377 res!970243) b!1437380))

(assert (= (and b!1437380 (not res!970242)) b!1437376))

(assert (= (and b!1437376 (not res!970241)) b!1437383))

(declare-fun m!1326693 () Bool)

(assert (=> b!1437376 m!1326693))

(assert (=> b!1437380 m!1326693))

(assert (=> d!154641 m!1326637))

(declare-fun m!1326695 () Bool)

(assert (=> d!154641 m!1326695))

(assert (=> d!154641 m!1326641))

(assert (=> b!1437383 m!1326693))

(assert (=> b!1437384 m!1326637))

(declare-fun m!1326697 () Bool)

(assert (=> b!1437384 m!1326697))

(assert (=> b!1437384 m!1326697))

(assert (=> b!1437384 m!1326635))

(declare-fun m!1326699 () Bool)

(assert (=> b!1437384 m!1326699))

(assert (=> b!1437321 d!154641))

(declare-fun d!154643 () Bool)

(declare-fun lt!632279 () (_ BitVec 32))

(declare-fun lt!632278 () (_ BitVec 32))

(assert (=> d!154643 (= lt!632279 (bvmul (bvxor lt!632278 (bvlshr lt!632278 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154643 (= lt!632278 ((_ extract 31 0) (bvand (bvxor (select (arr!47175 a!2862) j!93) (bvlshr (select (arr!47175 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154643 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970244 (let ((h!35012 ((_ extract 31 0) (bvand (bvxor (select (arr!47175 a!2862) j!93) (bvlshr (select (arr!47175 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129831 (bvmul (bvxor h!35012 (bvlshr h!35012 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129831 (bvlshr x!129831 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970244 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970244 #b00000000000000000000000000000000))))))

(assert (=> d!154643 (= (toIndex!0 (select (arr!47175 a!2862) j!93) mask!2687) (bvand (bvxor lt!632279 (bvlshr lt!632279 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437321 d!154643))

(declare-fun d!154647 () Bool)

(assert (=> d!154647 (= (validKeyInArray!0 (select (arr!47175 a!2862) i!1006)) (and (not (= (select (arr!47175 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47175 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437316 d!154647))

(declare-fun d!154649 () Bool)

(assert (=> d!154649 (= (validKeyInArray!0 (select (arr!47175 a!2862) j!93)) (and (not (= (select (arr!47175 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47175 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437317 d!154649))

(declare-fun b!1437393 () Bool)

(declare-fun e!810945 () Bool)

(declare-fun call!67627 () Bool)

(assert (=> b!1437393 (= e!810945 call!67627)))

(declare-fun b!1437394 () Bool)

(declare-fun e!810944 () Bool)

(assert (=> b!1437394 (= e!810944 e!810945)))

(declare-fun lt!632286 () (_ BitVec 64))

(assert (=> b!1437394 (= lt!632286 (select (arr!47175 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48556 0))(
  ( (Unit!48557) )
))
(declare-fun lt!632288 () Unit!48556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97762 (_ BitVec 64) (_ BitVec 32)) Unit!48556)

(assert (=> b!1437394 (= lt!632288 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632286 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1437394 (arrayContainsKey!0 a!2862 lt!632286 #b00000000000000000000000000000000)))

(declare-fun lt!632287 () Unit!48556)

(assert (=> b!1437394 (= lt!632287 lt!632288)))

(declare-fun res!970249 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97762 (_ BitVec 32)) SeekEntryResult!11427)

(assert (=> b!1437394 (= res!970249 (= (seekEntryOrOpen!0 (select (arr!47175 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11427 #b00000000000000000000000000000000)))))

(assert (=> b!1437394 (=> (not res!970249) (not e!810945))))

(declare-fun b!1437395 () Bool)

(declare-fun e!810946 () Bool)

(assert (=> b!1437395 (= e!810946 e!810944)))

(declare-fun c!133077 () Bool)

(assert (=> b!1437395 (= c!133077 (validKeyInArray!0 (select (arr!47175 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154651 () Bool)

(declare-fun res!970250 () Bool)

(assert (=> d!154651 (=> res!970250 e!810946)))

(assert (=> d!154651 (= res!970250 (bvsge #b00000000000000000000000000000000 (size!47725 a!2862)))))

(assert (=> d!154651 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810946)))

(declare-fun bm!67624 () Bool)

(assert (=> bm!67624 (= call!67627 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1437396 () Bool)

(assert (=> b!1437396 (= e!810944 call!67627)))

(assert (= (and d!154651 (not res!970250)) b!1437395))

(assert (= (and b!1437395 c!133077) b!1437394))

(assert (= (and b!1437395 (not c!133077)) b!1437396))

(assert (= (and b!1437394 res!970249) b!1437393))

(assert (= (or b!1437393 b!1437396) bm!67624))

(declare-fun m!1326701 () Bool)

(assert (=> b!1437394 m!1326701))

(declare-fun m!1326703 () Bool)

(assert (=> b!1437394 m!1326703))

(declare-fun m!1326705 () Bool)

(assert (=> b!1437394 m!1326705))

(assert (=> b!1437394 m!1326701))

(declare-fun m!1326707 () Bool)

(assert (=> b!1437394 m!1326707))

(assert (=> b!1437395 m!1326701))

(assert (=> b!1437395 m!1326701))

(declare-fun m!1326709 () Bool)

(assert (=> b!1437395 m!1326709))

(declare-fun m!1326711 () Bool)

(assert (=> bm!67624 m!1326711))

(assert (=> b!1437313 d!154651))

(declare-fun d!154657 () Bool)

(assert (=> d!154657 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124158 d!154657))

(declare-fun d!154663 () Bool)

(assert (=> d!154663 (= (array_inv!36203 a!2862) (bvsge (size!47725 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124158 d!154663))

(declare-fun d!154665 () Bool)

(declare-fun res!970281 () Bool)

(declare-fun e!810990 () Bool)

(assert (=> d!154665 (=> res!970281 e!810990)))

(assert (=> d!154665 (= res!970281 (bvsge #b00000000000000000000000000000000 (size!47725 a!2862)))))

(assert (=> d!154665 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33673) e!810990)))

(declare-fun b!1437470 () Bool)

(declare-fun e!810991 () Bool)

(declare-fun e!810993 () Bool)

(assert (=> b!1437470 (= e!810991 e!810993)))

(declare-fun c!133101 () Bool)

(assert (=> b!1437470 (= c!133101 (validKeyInArray!0 (select (arr!47175 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437471 () Bool)

(declare-fun call!67630 () Bool)

(assert (=> b!1437471 (= e!810993 call!67630)))

(declare-fun b!1437472 () Bool)

(assert (=> b!1437472 (= e!810993 call!67630)))

(declare-fun b!1437473 () Bool)

(assert (=> b!1437473 (= e!810990 e!810991)))

(declare-fun res!970282 () Bool)

(assert (=> b!1437473 (=> (not res!970282) (not e!810991))))

(declare-fun e!810992 () Bool)

(assert (=> b!1437473 (= res!970282 (not e!810992))))

(declare-fun res!970280 () Bool)

(assert (=> b!1437473 (=> (not res!970280) (not e!810992))))

(assert (=> b!1437473 (= res!970280 (validKeyInArray!0 (select (arr!47175 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67627 () Bool)

(assert (=> bm!67627 (= call!67630 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133101 (Cons!33672 (select (arr!47175 a!2862) #b00000000000000000000000000000000) Nil!33673) Nil!33673)))))

(declare-fun b!1437474 () Bool)

(declare-fun contains!9886 (List!33676 (_ BitVec 64)) Bool)

(assert (=> b!1437474 (= e!810992 (contains!9886 Nil!33673 (select (arr!47175 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154665 (not res!970281)) b!1437473))

(assert (= (and b!1437473 res!970280) b!1437474))

(assert (= (and b!1437473 res!970282) b!1437470))

(assert (= (and b!1437470 c!133101) b!1437472))

(assert (= (and b!1437470 (not c!133101)) b!1437471))

(assert (= (or b!1437472 b!1437471) bm!67627))

(assert (=> b!1437470 m!1326701))

(assert (=> b!1437470 m!1326701))

(assert (=> b!1437470 m!1326709))

(assert (=> b!1437473 m!1326701))

(assert (=> b!1437473 m!1326701))

(assert (=> b!1437473 m!1326709))

(assert (=> bm!67627 m!1326701))

(declare-fun m!1326737 () Bool)

(assert (=> bm!67627 m!1326737))

(assert (=> b!1437474 m!1326701))

(assert (=> b!1437474 m!1326701))

(declare-fun m!1326739 () Bool)

(assert (=> b!1437474 m!1326739))

(assert (=> b!1437319 d!154665))

(check-sat (not d!154637) (not d!154641) (not b!1437474) (not b!1437394) (not b!1437473) (not bm!67624) (not b!1437395) (not b!1437384) (not b!1437470) (not b!1437375) (not bm!67627))
(check-sat)
