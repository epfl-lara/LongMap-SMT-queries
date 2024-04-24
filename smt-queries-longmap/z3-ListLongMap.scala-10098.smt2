; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119234 () Bool)

(assert start!119234)

(declare-fun b!1390402 () Bool)

(declare-fun e!787684 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!610904 () (_ BitVec 32))

(assert (=> b!1390402 (= e!787684 (and (bvsge mask!2840 #b00000000000000000000000000000000) (or (bvslt lt!610904 #b00000000000000000000000000000000) (bvsge lt!610904 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-datatypes ((array!95126 0))(
  ( (array!95127 (arr!45928 (Array (_ BitVec 32) (_ BitVec 64))) (size!46479 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95126)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390402 (= lt!610904 (toIndex!0 (select (arr!45928 a!2901) j!112) mask!2840))))

(declare-fun b!1390403 () Bool)

(declare-fun res!929915 () Bool)

(assert (=> b!1390403 (=> (not res!929915) (not e!787684))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390403 (= res!929915 (validKeyInArray!0 (select (arr!45928 a!2901) i!1037)))))

(declare-fun res!929916 () Bool)

(assert (=> start!119234 (=> (not res!929916) (not e!787684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119234 (= res!929916 (validMask!0 mask!2840))))

(assert (=> start!119234 e!787684))

(assert (=> start!119234 true))

(declare-fun array_inv!35209 (array!95126) Bool)

(assert (=> start!119234 (array_inv!35209 a!2901)))

(declare-fun b!1390404 () Bool)

(declare-fun res!929913 () Bool)

(assert (=> b!1390404 (=> (not res!929913) (not e!787684))))

(assert (=> b!1390404 (= res!929913 (validKeyInArray!0 (select (arr!45928 a!2901) j!112)))))

(declare-fun b!1390405 () Bool)

(declare-fun res!929914 () Bool)

(assert (=> b!1390405 (=> (not res!929914) (not e!787684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95126 (_ BitVec 32)) Bool)

(assert (=> b!1390405 (= res!929914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390406 () Bool)

(declare-fun res!929912 () Bool)

(assert (=> b!1390406 (=> (not res!929912) (not e!787684))))

(assert (=> b!1390406 (= res!929912 (and (= (size!46479 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46479 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46479 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390407 () Bool)

(declare-fun res!929917 () Bool)

(assert (=> b!1390407 (=> (not res!929917) (not e!787684))))

(declare-datatypes ((List!32434 0))(
  ( (Nil!32431) (Cons!32430 (h!33653 (_ BitVec 64)) (t!47120 List!32434)) )
))
(declare-fun arrayNoDuplicates!0 (array!95126 (_ BitVec 32) List!32434) Bool)

(assert (=> b!1390407 (= res!929917 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32431))))

(assert (= (and start!119234 res!929916) b!1390406))

(assert (= (and b!1390406 res!929912) b!1390403))

(assert (= (and b!1390403 res!929915) b!1390404))

(assert (= (and b!1390404 res!929913) b!1390405))

(assert (= (and b!1390405 res!929914) b!1390407))

(assert (= (and b!1390407 res!929917) b!1390402))

(declare-fun m!1276309 () Bool)

(assert (=> b!1390405 m!1276309))

(declare-fun m!1276311 () Bool)

(assert (=> b!1390403 m!1276311))

(assert (=> b!1390403 m!1276311))

(declare-fun m!1276313 () Bool)

(assert (=> b!1390403 m!1276313))

(declare-fun m!1276315 () Bool)

(assert (=> b!1390402 m!1276315))

(assert (=> b!1390402 m!1276315))

(declare-fun m!1276317 () Bool)

(assert (=> b!1390402 m!1276317))

(declare-fun m!1276319 () Bool)

(assert (=> b!1390407 m!1276319))

(declare-fun m!1276321 () Bool)

(assert (=> start!119234 m!1276321))

(declare-fun m!1276323 () Bool)

(assert (=> start!119234 m!1276323))

(assert (=> b!1390404 m!1276315))

(assert (=> b!1390404 m!1276315))

(declare-fun m!1276325 () Bool)

(assert (=> b!1390404 m!1276325))

(check-sat (not start!119234) (not b!1390405) (not b!1390403) (not b!1390407) (not b!1390404) (not b!1390402))
(check-sat)
(get-model)

(declare-fun d!150459 () Bool)

(assert (=> d!150459 (= (validKeyInArray!0 (select (arr!45928 a!2901) i!1037)) (and (not (= (select (arr!45928 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45928 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390403 d!150459))

(declare-fun d!150461 () Bool)

(declare-fun lt!610916 () (_ BitVec 32))

(declare-fun lt!610915 () (_ BitVec 32))

(assert (=> d!150461 (= lt!610916 (bvmul (bvxor lt!610915 (bvlshr lt!610915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150461 (= lt!610915 ((_ extract 31 0) (bvand (bvxor (select (arr!45928 a!2901) j!112) (bvlshr (select (arr!45928 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150461 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!929954 (let ((h!33656 ((_ extract 31 0) (bvand (bvxor (select (arr!45928 a!2901) j!112) (bvlshr (select (arr!45928 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124816 (bvmul (bvxor h!33656 (bvlshr h!33656 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124816 (bvlshr x!124816 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!929954 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!929954 #b00000000000000000000000000000000))))))

(assert (=> d!150461 (= (toIndex!0 (select (arr!45928 a!2901) j!112) mask!2840) (bvand (bvxor lt!610916 (bvlshr lt!610916 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1390402 d!150461))

(declare-fun d!150463 () Bool)

(declare-fun res!929961 () Bool)

(declare-fun e!787706 () Bool)

(assert (=> d!150463 (=> res!929961 e!787706)))

(assert (=> d!150463 (= res!929961 (bvsge #b00000000000000000000000000000000 (size!46479 a!2901)))))

(assert (=> d!150463 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32431) e!787706)))

(declare-fun b!1390454 () Bool)

(declare-fun e!787709 () Bool)

(declare-fun call!66741 () Bool)

(assert (=> b!1390454 (= e!787709 call!66741)))

(declare-fun b!1390455 () Bool)

(declare-fun e!787708 () Bool)

(assert (=> b!1390455 (= e!787706 e!787708)))

(declare-fun res!929962 () Bool)

(assert (=> b!1390455 (=> (not res!929962) (not e!787708))))

(declare-fun e!787707 () Bool)

(assert (=> b!1390455 (= res!929962 (not e!787707))))

(declare-fun res!929963 () Bool)

(assert (=> b!1390455 (=> (not res!929963) (not e!787707))))

(assert (=> b!1390455 (= res!929963 (validKeyInArray!0 (select (arr!45928 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390456 () Bool)

(assert (=> b!1390456 (= e!787709 call!66741)))

(declare-fun b!1390457 () Bool)

(declare-fun contains!9800 (List!32434 (_ BitVec 64)) Bool)

(assert (=> b!1390457 (= e!787707 (contains!9800 Nil!32431 (select (arr!45928 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390458 () Bool)

(assert (=> b!1390458 (= e!787708 e!787709)))

(declare-fun c!129697 () Bool)

(assert (=> b!1390458 (= c!129697 (validKeyInArray!0 (select (arr!45928 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66738 () Bool)

(assert (=> bm!66738 (= call!66741 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129697 (Cons!32430 (select (arr!45928 a!2901) #b00000000000000000000000000000000) Nil!32431) Nil!32431)))))

(assert (= (and d!150463 (not res!929961)) b!1390455))

(assert (= (and b!1390455 res!929963) b!1390457))

(assert (= (and b!1390455 res!929962) b!1390458))

(assert (= (and b!1390458 c!129697) b!1390456))

(assert (= (and b!1390458 (not c!129697)) b!1390454))

(assert (= (or b!1390456 b!1390454) bm!66738))

(declare-fun m!1276363 () Bool)

(assert (=> b!1390455 m!1276363))

(assert (=> b!1390455 m!1276363))

(declare-fun m!1276365 () Bool)

(assert (=> b!1390455 m!1276365))

(assert (=> b!1390457 m!1276363))

(assert (=> b!1390457 m!1276363))

(declare-fun m!1276367 () Bool)

(assert (=> b!1390457 m!1276367))

(assert (=> b!1390458 m!1276363))

(assert (=> b!1390458 m!1276363))

(assert (=> b!1390458 m!1276365))

(assert (=> bm!66738 m!1276363))

(declare-fun m!1276369 () Bool)

(assert (=> bm!66738 m!1276369))

(assert (=> b!1390407 d!150463))

(declare-fun b!1390501 () Bool)

(declare-fun e!787744 () Bool)

(declare-fun e!787742 () Bool)

(assert (=> b!1390501 (= e!787744 e!787742)))

(declare-fun c!129708 () Bool)

(assert (=> b!1390501 (= c!129708 (validKeyInArray!0 (select (arr!45928 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390502 () Bool)

(declare-fun e!787743 () Bool)

(declare-fun call!66752 () Bool)

(assert (=> b!1390502 (= e!787743 call!66752)))

(declare-fun b!1390503 () Bool)

(assert (=> b!1390503 (= e!787742 e!787743)))

(declare-fun lt!610943 () (_ BitVec 64))

(assert (=> b!1390503 (= lt!610943 (select (arr!45928 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46371 0))(
  ( (Unit!46372) )
))
(declare-fun lt!610942 () Unit!46371)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95126 (_ BitVec 64) (_ BitVec 32)) Unit!46371)

(assert (=> b!1390503 (= lt!610942 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610943 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1390503 (arrayContainsKey!0 a!2901 lt!610943 #b00000000000000000000000000000000)))

(declare-fun lt!610941 () Unit!46371)

(assert (=> b!1390503 (= lt!610941 lt!610942)))

(declare-fun res!929987 () Bool)

(declare-datatypes ((SeekEntryResult!10155 0))(
  ( (MissingZero!10155 (index!42991 (_ BitVec 32))) (Found!10155 (index!42992 (_ BitVec 32))) (Intermediate!10155 (undefined!10967 Bool) (index!42993 (_ BitVec 32)) (x!124820 (_ BitVec 32))) (Undefined!10155) (MissingVacant!10155 (index!42994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95126 (_ BitVec 32)) SeekEntryResult!10155)

(assert (=> b!1390503 (= res!929987 (= (seekEntryOrOpen!0 (select (arr!45928 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10155 #b00000000000000000000000000000000)))))

(assert (=> b!1390503 (=> (not res!929987) (not e!787743))))

(declare-fun d!150469 () Bool)

(declare-fun res!929988 () Bool)

(assert (=> d!150469 (=> res!929988 e!787744)))

(assert (=> d!150469 (= res!929988 (bvsge #b00000000000000000000000000000000 (size!46479 a!2901)))))

(assert (=> d!150469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787744)))

(declare-fun bm!66749 () Bool)

(assert (=> bm!66749 (= call!66752 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1390504 () Bool)

(assert (=> b!1390504 (= e!787742 call!66752)))

(assert (= (and d!150469 (not res!929988)) b!1390501))

(assert (= (and b!1390501 c!129708) b!1390503))

(assert (= (and b!1390501 (not c!129708)) b!1390504))

(assert (= (and b!1390503 res!929987) b!1390502))

(assert (= (or b!1390502 b!1390504) bm!66749))

(assert (=> b!1390501 m!1276363))

(assert (=> b!1390501 m!1276363))

(assert (=> b!1390501 m!1276365))

(assert (=> b!1390503 m!1276363))

(declare-fun m!1276395 () Bool)

(assert (=> b!1390503 m!1276395))

(declare-fun m!1276397 () Bool)

(assert (=> b!1390503 m!1276397))

(assert (=> b!1390503 m!1276363))

(declare-fun m!1276399 () Bool)

(assert (=> b!1390503 m!1276399))

(declare-fun m!1276401 () Bool)

(assert (=> bm!66749 m!1276401))

(assert (=> b!1390405 d!150469))

(declare-fun d!150477 () Bool)

(assert (=> d!150477 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119234 d!150477))

(declare-fun d!150485 () Bool)

(assert (=> d!150485 (= (array_inv!35209 a!2901) (bvsge (size!46479 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119234 d!150485))

(declare-fun d!150487 () Bool)

(assert (=> d!150487 (= (validKeyInArray!0 (select (arr!45928 a!2901) j!112)) (and (not (= (select (arr!45928 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45928 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390404 d!150487))

(check-sat (not b!1390503) (not b!1390501) (not b!1390458) (not b!1390455) (not b!1390457) (not bm!66749) (not bm!66738))
(check-sat)
