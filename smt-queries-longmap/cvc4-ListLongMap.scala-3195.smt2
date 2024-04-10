; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44800 () Bool)

(assert start!44800)

(declare-fun b!491927 () Bool)

(declare-fun res!294869 () Bool)

(declare-fun e!288987 () Bool)

(assert (=> b!491927 (=> (not res!294869) (not e!288987))))

(declare-datatypes ((array!31859 0))(
  ( (array!31860 (arr!15317 (Array (_ BitVec 32) (_ BitVec 64))) (size!15681 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31859)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31859 (_ BitVec 32)) Bool)

(assert (=> b!491927 (= res!294869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491928 () Bool)

(declare-fun res!294864 () Bool)

(assert (=> b!491928 (=> (not res!294864) (not e!288987))))

(declare-datatypes ((List!9475 0))(
  ( (Nil!9472) (Cons!9471 (h!10333 (_ BitVec 64)) (t!15703 List!9475)) )
))
(declare-fun arrayNoDuplicates!0 (array!31859 (_ BitVec 32) List!9475) Bool)

(assert (=> b!491928 (= res!294864 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9472))))

(declare-fun b!491929 () Bool)

(declare-fun res!294868 () Bool)

(declare-fun e!288986 () Bool)

(assert (=> b!491929 (=> (not res!294868) (not e!288986))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491929 (= res!294868 (validKeyInArray!0 k!2280))))

(declare-fun b!491930 () Bool)

(declare-fun res!294865 () Bool)

(assert (=> b!491930 (=> (not res!294865) (not e!288986))))

(declare-fun arrayContainsKey!0 (array!31859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491930 (= res!294865 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491932 () Bool)

(declare-fun e!288989 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3784 0))(
  ( (MissingZero!3784 (index!17315 (_ BitVec 32))) (Found!3784 (index!17316 (_ BitVec 32))) (Intermediate!3784 (undefined!4596 Bool) (index!17317 (_ BitVec 32)) (x!46394 (_ BitVec 32))) (Undefined!3784) (MissingVacant!3784 (index!17318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31859 (_ BitVec 32)) SeekEntryResult!3784)

(assert (=> b!491932 (= e!288989 (= (seekEntryOrOpen!0 (select (arr!15317 a!3235) j!176) a!3235 mask!3524) (Found!3784 j!176)))))

(declare-fun b!491933 () Bool)

(declare-fun e!288988 () Bool)

(assert (=> b!491933 (= e!288987 (not e!288988))))

(declare-fun res!294866 () Bool)

(assert (=> b!491933 (=> res!294866 e!288988)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31859 (_ BitVec 32)) SeekEntryResult!3784)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491933 (= res!294866 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15317 a!3235) j!176) mask!3524) (select (arr!15317 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) (array!31860 (store (arr!15317 a!3235) i!1204 k!2280) (size!15681 a!3235)) mask!3524)))))

(assert (=> b!491933 e!288989))

(declare-fun res!294871 () Bool)

(assert (=> b!491933 (=> (not res!294871) (not e!288989))))

(assert (=> b!491933 (= res!294871 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14514 0))(
  ( (Unit!14515) )
))
(declare-fun lt!222394 () Unit!14514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14514)

(assert (=> b!491933 (= lt!222394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491934 () Bool)

(declare-fun res!294872 () Bool)

(assert (=> b!491934 (=> (not res!294872) (not e!288986))))

(assert (=> b!491934 (= res!294872 (and (= (size!15681 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15681 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15681 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491935 () Bool)

(assert (=> b!491935 (= e!288988 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(declare-fun b!491936 () Bool)

(assert (=> b!491936 (= e!288986 e!288987)))

(declare-fun res!294870 () Bool)

(assert (=> b!491936 (=> (not res!294870) (not e!288987))))

(declare-fun lt!222393 () SeekEntryResult!3784)

(assert (=> b!491936 (= res!294870 (or (= lt!222393 (MissingZero!3784 i!1204)) (= lt!222393 (MissingVacant!3784 i!1204))))))

(assert (=> b!491936 (= lt!222393 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491931 () Bool)

(declare-fun res!294867 () Bool)

(assert (=> b!491931 (=> (not res!294867) (not e!288986))))

(assert (=> b!491931 (= res!294867 (validKeyInArray!0 (select (arr!15317 a!3235) j!176)))))

(declare-fun res!294863 () Bool)

(assert (=> start!44800 (=> (not res!294863) (not e!288986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44800 (= res!294863 (validMask!0 mask!3524))))

(assert (=> start!44800 e!288986))

(assert (=> start!44800 true))

(declare-fun array_inv!11113 (array!31859) Bool)

(assert (=> start!44800 (array_inv!11113 a!3235)))

(assert (= (and start!44800 res!294863) b!491934))

(assert (= (and b!491934 res!294872) b!491931))

(assert (= (and b!491931 res!294867) b!491929))

(assert (= (and b!491929 res!294868) b!491930))

(assert (= (and b!491930 res!294865) b!491936))

(assert (= (and b!491936 res!294870) b!491927))

(assert (= (and b!491927 res!294869) b!491928))

(assert (= (and b!491928 res!294864) b!491933))

(assert (= (and b!491933 res!294871) b!491932))

(assert (= (and b!491933 (not res!294866)) b!491935))

(declare-fun m!472689 () Bool)

(assert (=> b!491932 m!472689))

(assert (=> b!491932 m!472689))

(declare-fun m!472691 () Bool)

(assert (=> b!491932 m!472691))

(declare-fun m!472693 () Bool)

(assert (=> b!491928 m!472693))

(declare-fun m!472695 () Bool)

(assert (=> b!491930 m!472695))

(declare-fun m!472697 () Bool)

(assert (=> start!44800 m!472697))

(declare-fun m!472699 () Bool)

(assert (=> start!44800 m!472699))

(declare-fun m!472701 () Bool)

(assert (=> b!491936 m!472701))

(assert (=> b!491931 m!472689))

(assert (=> b!491931 m!472689))

(declare-fun m!472703 () Bool)

(assert (=> b!491931 m!472703))

(declare-fun m!472705 () Bool)

(assert (=> b!491927 m!472705))

(declare-fun m!472707 () Bool)

(assert (=> b!491933 m!472707))

(declare-fun m!472709 () Bool)

(assert (=> b!491933 m!472709))

(declare-fun m!472711 () Bool)

(assert (=> b!491933 m!472711))

(declare-fun m!472713 () Bool)

(assert (=> b!491933 m!472713))

(assert (=> b!491933 m!472689))

(declare-fun m!472715 () Bool)

(assert (=> b!491933 m!472715))

(assert (=> b!491933 m!472689))

(assert (=> b!491933 m!472713))

(declare-fun m!472717 () Bool)

(assert (=> b!491933 m!472717))

(assert (=> b!491933 m!472711))

(declare-fun m!472719 () Bool)

(assert (=> b!491933 m!472719))

(assert (=> b!491933 m!472689))

(declare-fun m!472721 () Bool)

(assert (=> b!491933 m!472721))

(assert (=> b!491933 m!472711))

(assert (=> b!491933 m!472717))

(declare-fun m!472723 () Bool)

(assert (=> b!491929 m!472723))

(push 1)

(assert (not b!491928))

(assert (not b!491929))

(assert (not b!491936))

(assert (not b!491932))

(assert (not b!491931))

(assert (not b!491933))

(assert (not start!44800))

(assert (not b!491930))

(assert (not b!491927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!491974 () Bool)

(declare-fun e!289021 () Bool)

(declare-fun contains!2710 (List!9475 (_ BitVec 64)) Bool)

(assert (=> b!491974 (= e!289021 (contains!2710 Nil!9472 (select (arr!15317 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!491975 () Bool)

(declare-fun e!289020 () Bool)

(declare-fun call!31376 () Bool)

(assert (=> b!491975 (= e!289020 call!31376)))

(declare-fun bm!31373 () Bool)

(declare-fun c!58811 () Bool)

(assert (=> bm!31373 (= call!31376 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58811 (Cons!9471 (select (arr!15317 a!3235) #b00000000000000000000000000000000) Nil!9472) Nil!9472)))))

(declare-fun b!491977 () Bool)

(assert (=> b!491977 (= e!289020 call!31376)))

(declare-fun b!491978 () Bool)

(declare-fun e!289022 () Bool)

(declare-fun e!289023 () Bool)

(assert (=> b!491978 (= e!289022 e!289023)))

(declare-fun res!294894 () Bool)

(assert (=> b!491978 (=> (not res!294894) (not e!289023))))

(assert (=> b!491978 (= res!294894 (not e!289021))))

(declare-fun res!294896 () Bool)

(assert (=> b!491978 (=> (not res!294896) (not e!289021))))

(assert (=> b!491978 (= res!294896 (validKeyInArray!0 (select (arr!15317 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78009 () Bool)

(declare-fun res!294895 () Bool)

(assert (=> d!78009 (=> res!294895 e!289022)))

(assert (=> d!78009 (= res!294895 (bvsge #b00000000000000000000000000000000 (size!15681 a!3235)))))

(assert (=> d!78009 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9472) e!289022)))

(declare-fun b!491976 () Bool)

(assert (=> b!491976 (= e!289023 e!289020)))

(assert (=> b!491976 (= c!58811 (validKeyInArray!0 (select (arr!15317 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78009 (not res!294895)) b!491978))

(assert (= (and b!491978 res!294896) b!491974))

(assert (= (and b!491978 res!294894) b!491976))

(assert (= (and b!491976 c!58811) b!491977))

(assert (= (and b!491976 (not c!58811)) b!491975))

(assert (= (or b!491977 b!491975) bm!31373))

(declare-fun m!472741 () Bool)

(assert (=> b!491974 m!472741))

(assert (=> b!491974 m!472741))

(declare-fun m!472743 () Bool)

(assert (=> b!491974 m!472743))

(assert (=> bm!31373 m!472741))

(declare-fun m!472745 () Bool)

(assert (=> bm!31373 m!472745))

(assert (=> b!491978 m!472741))

(assert (=> b!491978 m!472741))

(declare-fun m!472747 () Bool)

(assert (=> b!491978 m!472747))

(assert (=> b!491976 m!472741))

(assert (=> b!491976 m!472741))

(assert (=> b!491976 m!472747))

(assert (=> b!491928 d!78009))

(declare-fun d!78011 () Bool)

(declare-fun e!289043 () Bool)

(assert (=> d!78011 e!289043))

(declare-fun c!58829 () Bool)

(declare-fun lt!222418 () SeekEntryResult!3784)

(assert (=> d!78011 (= c!58829 (and (is-Intermediate!3784 lt!222418) (undefined!4596 lt!222418)))))

(declare-fun e!289045 () SeekEntryResult!3784)

(assert (=> d!78011 (= lt!222418 e!289045)))

(declare-fun c!58828 () Bool)

(assert (=> d!78011 (= c!58828 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222417 () (_ BitVec 64))

(assert (=> d!78011 (= lt!222417 (select (arr!15317 a!3235) (toIndex!0 (select (arr!15317 a!3235) j!176) mask!3524)))))

(assert (=> d!78011 (validMask!0 mask!3524)))

(assert (=> d!78011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15317 a!3235) j!176) mask!3524) (select (arr!15317 a!3235) j!176) a!3235 mask!3524) lt!222418)))

(declare-fun b!492015 () Bool)

(assert (=> b!492015 (= e!289045 (Intermediate!3784 true (toIndex!0 (select (arr!15317 a!3235) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492016 () Bool)

(declare-fun e!289047 () SeekEntryResult!3784)

(assert (=> b!492016 (= e!289045 e!289047)))

(declare-fun c!58827 () Bool)

(assert (=> b!492016 (= c!58827 (or (= lt!222417 (select (arr!15317 a!3235) j!176)) (= (bvadd lt!222417 lt!222417) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492017 () Bool)

(declare-fun e!289044 () Bool)

(assert (=> b!492017 (= e!289043 e!289044)))

(declare-fun res!294903 () Bool)

(assert (=> b!492017 (= res!294903 (and (is-Intermediate!3784 lt!222418) (not (undefined!4596 lt!222418)) (bvslt (x!46394 lt!222418) #b01111111111111111111111111111110) (bvsge (x!46394 lt!222418) #b00000000000000000000000000000000) (bvsge (x!46394 lt!222418) #b00000000000000000000000000000000)))))

(assert (=> b!492017 (=> (not res!294903) (not e!289044))))

(declare-fun b!492018 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492018 (= e!289047 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!15317 a!3235) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (arr!15317 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492019 () Bool)

(assert (=> b!492019 (= e!289043 (bvsge (x!46394 lt!222418) #b01111111111111111111111111111110))))

(declare-fun b!492020 () Bool)

(assert (=> b!492020 (= e!289047 (Intermediate!3784 false (toIndex!0 (select (arr!15317 a!3235) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492021 () Bool)

(assert (=> b!492021 (and (bvsge (index!17317 lt!222418) #b00000000000000000000000000000000) (bvslt (index!17317 lt!222418) (size!15681 a!3235)))))

(declare-fun res!294904 () Bool)

(assert (=> b!492021 (= res!294904 (= (select (arr!15317 a!3235) (index!17317 lt!222418)) (select (arr!15317 a!3235) j!176)))))

(declare-fun e!289046 () Bool)

(assert (=> b!492021 (=> res!294904 e!289046)))

(assert (=> b!492021 (= e!289044 e!289046)))

(declare-fun b!492022 () Bool)

(assert (=> b!492022 (and (bvsge (index!17317 lt!222418) #b00000000000000000000000000000000) (bvslt (index!17317 lt!222418) (size!15681 a!3235)))))

(declare-fun res!294905 () Bool)

(assert (=> b!492022 (= res!294905 (= (select (arr!15317 a!3235) (index!17317 lt!222418)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492022 (=> res!294905 e!289046)))

(declare-fun b!492023 () Bool)

(assert (=> b!492023 (and (bvsge (index!17317 lt!222418) #b00000000000000000000000000000000) (bvslt (index!17317 lt!222418) (size!15681 a!3235)))))

(assert (=> b!492023 (= e!289046 (= (select (arr!15317 a!3235) (index!17317 lt!222418)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!78011 c!58828) b!492015))

(assert (= (and d!78011 (not c!58828)) b!492016))

(assert (= (and b!492016 c!58827) b!492020))

(assert (= (and b!492016 (not c!58827)) b!492018))

(assert (= (and d!78011 c!58829) b!492019))

(assert (= (and d!78011 (not c!58829)) b!492017))

(assert (= (and b!492017 res!294903) b!492021))

(assert (= (and b!492021 (not res!294904)) b!492022))

(assert (= (and b!492022 (not res!294905)) b!492023))

(assert (=> d!78011 m!472713))

(declare-fun m!472759 () Bool)

(assert (=> d!78011 m!472759))

(assert (=> d!78011 m!472697))

(declare-fun m!472761 () Bool)

(assert (=> b!492023 m!472761))

(assert (=> b!492022 m!472761))

(assert (=> b!492018 m!472713))

(declare-fun m!472763 () Bool)

(assert (=> b!492018 m!472763))

(assert (=> b!492018 m!472763))

(assert (=> b!492018 m!472689))

(declare-fun m!472765 () Bool)

(assert (=> b!492018 m!472765))

(assert (=> b!492021 m!472761))

(assert (=> b!491933 d!78011))

(declare-fun d!78019 () Bool)

(declare-fun lt!222428 () (_ BitVec 32))

(declare-fun lt!222427 () (_ BitVec 32))

(assert (=> d!78019 (= lt!222428 (bvmul (bvxor lt!222427 (bvlshr lt!222427 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78019 (= lt!222427 ((_ extract 31 0) (bvand (bvxor (select (arr!15317 a!3235) j!176) (bvlshr (select (arr!15317 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78019 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!294906 (let ((h!10334 ((_ extract 31 0) (bvand (bvxor (select (arr!15317 a!3235) j!176) (bvlshr (select (arr!15317 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46397 (bvmul (bvxor h!10334 (bvlshr h!10334 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46397 (bvlshr x!46397 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!294906 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!294906 #b00000000000000000000000000000000))))))

(assert (=> d!78019 (= (toIndex!0 (select (arr!15317 a!3235) j!176) mask!3524) (bvand (bvxor lt!222428 (bvlshr lt!222428 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!491933 d!78019))

(declare-fun d!78021 () Bool)

(declare-fun res!294923 () Bool)

(declare-fun e!289079 () Bool)

(assert (=> d!78021 (=> res!294923 e!289079)))

(assert (=> d!78021 (= res!294923 (bvsge j!176 (size!15681 a!3235)))))

(assert (=> d!78021 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!289079)))

(declare-fun b!492075 () Bool)

(declare-fun e!289078 () Bool)

(assert (=> b!492075 (= e!289079 e!289078)))

(declare-fun c!58848 () Bool)

(assert (=> b!492075 (= c!58848 (validKeyInArray!0 (select (arr!15317 a!3235) j!176)))))

(declare-fun b!492076 () Bool)

(declare-fun e!289080 () Bool)

(declare-fun call!31380 () Bool)

(assert (=> b!492076 (= e!289080 call!31380)))

(declare-fun b!492077 () Bool)

(assert (=> b!492077 (= e!289078 call!31380)))

(declare-fun b!492078 () Bool)

(assert (=> b!492078 (= e!289078 e!289080)))

(declare-fun lt!222454 () (_ BitVec 64))

(assert (=> b!492078 (= lt!222454 (select (arr!15317 a!3235) j!176))))

(declare-fun lt!222453 () Unit!14514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31859 (_ BitVec 64) (_ BitVec 32)) Unit!14514)

(assert (=> b!492078 (= lt!222453 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222454 j!176))))

(assert (=> b!492078 (arrayContainsKey!0 a!3235 lt!222454 #b00000000000000000000000000000000)))

(declare-fun lt!222452 () Unit!14514)

(assert (=> b!492078 (= lt!222452 lt!222453)))

(declare-fun res!294924 () Bool)

(assert (=> b!492078 (= res!294924 (= (seekEntryOrOpen!0 (select (arr!15317 a!3235) j!176) a!3235 mask!3524) (Found!3784 j!176)))))

(assert (=> b!492078 (=> (not res!294924) (not e!289080))))

(declare-fun bm!31377 () Bool)

(assert (=> bm!31377 (= call!31380 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78021 (not res!294923)) b!492075))

(assert (= (and b!492075 c!58848) b!492078))

(assert (= (and b!492075 (not c!58848)) b!492077))

(assert (= (and b!492078 res!294924) b!492076))

(assert (= (or b!492076 b!492077) bm!31377))

(assert (=> b!492075 m!472689))

(assert (=> b!492075 m!472689))

(assert (=> b!492075 m!472703))

(assert (=> b!492078 m!472689))

(declare-fun m!472781 () Bool)

(assert (=> b!492078 m!472781))

(declare-fun m!472783 () Bool)

(assert (=> b!492078 m!472783))

(assert (=> b!492078 m!472689))

(assert (=> b!492078 m!472691))

(declare-fun m!472785 () Bool)

(assert (=> bm!31377 m!472785))

(assert (=> b!491933 d!78021))

(declare-fun d!78029 () Bool)

(assert (=> d!78029 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222467 () Unit!14514)

(declare-fun choose!38 (array!31859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14514)

(assert (=> d!78029 (= lt!222467 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78029 (validMask!0 mask!3524)))

(assert (=> d!78029 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!222467)))

(declare-fun bs!15689 () Bool)

(assert (= bs!15689 d!78029))

(assert (=> bs!15689 m!472721))

(declare-fun m!472811 () Bool)

(assert (=> bs!15689 m!472811))

(assert (=> bs!15689 m!472697))

(assert (=> b!491933 d!78029))

(declare-fun d!78039 () Bool)

(declare-fun lt!222469 () (_ BitVec 32))

(declare-fun lt!222468 () (_ BitVec 32))

(assert (=> d!78039 (= lt!222469 (bvmul (bvxor lt!222468 (bvlshr lt!222468 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78039 (= lt!222468 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78039 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!294906 (let ((h!10334 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46397 (bvmul (bvxor h!10334 (bvlshr h!10334 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46397 (bvlshr x!46397 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!294906 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!294906 #b00000000000000000000000000000000))))))

(assert (=> d!78039 (= (toIndex!0 (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!222469 (bvlshr lt!222469 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!491933 d!78039))

(declare-fun d!78041 () Bool)

(declare-fun e!289089 () Bool)

(assert (=> d!78041 e!289089))

(declare-fun c!58857 () Bool)

(declare-fun lt!222471 () SeekEntryResult!3784)

(assert (=> d!78041 (= c!58857 (and (is-Intermediate!3784 lt!222471) (undefined!4596 lt!222471)))))

(declare-fun e!289091 () SeekEntryResult!3784)

(assert (=> d!78041 (= lt!222471 e!289091)))

(declare-fun c!58856 () Bool)

(assert (=> d!78041 (= c!58856 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222470 () (_ BitVec 64))

(assert (=> d!78041 (= lt!222470 (select (arr!15317 (array!31860 (store (arr!15317 a!3235) i!1204 k!2280) (size!15681 a!3235))) (toIndex!0 (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) mask!3524)))))

(assert (=> d!78041 (validMask!0 mask!3524)))

(assert (=> d!78041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) (array!31860 (store (arr!15317 a!3235) i!1204 k!2280) (size!15681 a!3235)) mask!3524) lt!222471)))

(declare-fun b!492094 () Bool)

(assert (=> b!492094 (= e!289091 (Intermediate!3784 true (toIndex!0 (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492095 () Bool)

(declare-fun e!289093 () SeekEntryResult!3784)

(assert (=> b!492095 (= e!289091 e!289093)))

(declare-fun c!58855 () Bool)

(assert (=> b!492095 (= c!58855 (or (= lt!222470 (select (store (arr!15317 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!222470 lt!222470) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492096 () Bool)

(declare-fun e!289090 () Bool)

(assert (=> b!492096 (= e!289089 e!289090)))

(declare-fun res!294928 () Bool)

(assert (=> b!492096 (= res!294928 (and (is-Intermediate!3784 lt!222471) (not (undefined!4596 lt!222471)) (bvslt (x!46394 lt!222471) #b01111111111111111111111111111110) (bvsge (x!46394 lt!222471) #b00000000000000000000000000000000) (bvsge (x!46394 lt!222471) #b00000000000000000000000000000000)))))

(assert (=> b!492096 (=> (not res!294928) (not e!289090))))

(declare-fun b!492097 () Bool)

(assert (=> b!492097 (= e!289093 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) (array!31860 (store (arr!15317 a!3235) i!1204 k!2280) (size!15681 a!3235)) mask!3524))))

(declare-fun b!492098 () Bool)

(assert (=> b!492098 (= e!289089 (bvsge (x!46394 lt!222471) #b01111111111111111111111111111110))))

(declare-fun b!492099 () Bool)

(assert (=> b!492099 (= e!289093 (Intermediate!3784 false (toIndex!0 (select (store (arr!15317 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492100 () Bool)

(assert (=> b!492100 (and (bvsge (index!17317 lt!222471) #b00000000000000000000000000000000) (bvslt (index!17317 lt!222471) (size!15681 (array!31860 (store (arr!15317 a!3235) i!1204 k!2280) (size!15681 a!3235)))))))

(declare-fun res!294929 () Bool)

(assert (=> b!492100 (= res!294929 (= (select (arr!15317 (array!31860 (store (arr!15317 a!3235) i!1204 k!2280) (size!15681 a!3235))) (index!17317 lt!222471)) (select (store (arr!15317 a!3235) i!1204 k!2280) j!176)))))

(declare-fun e!289092 () Bool)

(assert (=> b!492100 (=> res!294929 e!289092)))

(assert (=> b!492100 (= e!289090 e!289092)))

(declare-fun b!492101 () Bool)

(assert (=> b!492101 (and (bvsge (index!17317 lt!222471) #b00000000000000000000000000000000) (bvslt (index!17317 lt!222471) (size!15681 (array!31860 (store (arr!15317 a!3235) i!1204 k!2280) (size!15681 a!3235)))))))

(declare-fun res!294930 () Bool)

(assert (=> b!492101 (= res!294930 (= (select (arr!15317 (array!31860 (store (arr!15317 a!3235) i!1204 k!2280) (size!15681 a!3235))) (index!17317 lt!222471)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492101 (=> res!294930 e!289092)))

(declare-fun b!492102 () Bool)

(assert (=> b!492102 (and (bvsge (index!17317 lt!222471) #b00000000000000000000000000000000) (bvslt (index!17317 lt!222471) (size!15681 (array!31860 (store (arr!15317 a!3235) i!1204 k!2280) (size!15681 a!3235)))))))

(assert (=> b!492102 (= e!289092 (= (select (arr!15317 (array!31860 (store (arr!15317 a!3235) i!1204 k!2280) (size!15681 a!3235))) (index!17317 lt!222471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!78041 c!58856) b!492094))

(assert (= (and d!78041 (not c!58856)) b!492095))

(assert (= (and b!492095 c!58855) b!492099))

(assert (= (and b!492095 (not c!58855)) b!492097))

(assert (= (and d!78041 c!58857) b!492098))

(assert (= (and d!78041 (not c!58857)) b!492096))

(assert (= (and b!492096 res!294928) b!492100))

(assert (= (and b!492100 (not res!294929)) b!492101))

(assert (= (and b!492101 (not res!294930)) b!492102))

(assert (=> d!78041 m!472717))

(declare-fun m!472813 () Bool)

(assert (=> d!78041 m!472813))

(assert (=> d!78041 m!472697))

(declare-fun m!472815 () Bool)

(assert (=> b!492102 m!472815))

(assert (=> b!492101 m!472815))

(assert (=> b!492097 m!472717))

(declare-fun m!472817 () Bool)

(assert (=> b!492097 m!472817))

(assert (=> b!492097 m!472817))

(assert (=> b!492097 m!472711))

(declare-fun m!472819 () Bool)

(assert (=> b!492097 m!472819))

(assert (=> b!492100 m!472815))

(assert (=> b!491933 d!78041))

(declare-fun d!78043 () Bool)

(declare-fun res!294931 () Bool)

(declare-fun e!289095 () Bool)

(assert (=> d!78043 (=> res!294931 e!289095)))

(assert (=> d!78043 (= res!294931 (bvsge #b00000000000000000000000000000000 (size!15681 a!3235)))))

(assert (=> d!78043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!289095)))

(declare-fun b!492103 () Bool)

(declare-fun e!289094 () Bool)

(assert (=> b!492103 (= e!289095 e!289094)))

(declare-fun c!58858 () Bool)

(assert (=> b!492103 (= c!58858 (validKeyInArray!0 (select (arr!15317 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!492104 () Bool)

(declare-fun e!289096 () Bool)

(declare-fun call!31381 () Bool)

(assert (=> b!492104 (= e!289096 call!31381)))

(declare-fun b!492105 () Bool)

(assert (=> b!492105 (= e!289094 call!31381)))

(declare-fun b!492106 () Bool)

(assert (=> b!492106 (= e!289094 e!289096)))

(declare-fun lt!222474 () (_ BitVec 64))

(assert (=> b!492106 (= lt!222474 (select (arr!15317 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!222473 () Unit!14514)

(assert (=> b!492106 (= lt!222473 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222474 #b00000000000000000000000000000000))))

(assert (=> b!492106 (arrayContainsKey!0 a!3235 lt!222474 #b00000000000000000000000000000000)))

(declare-fun lt!222472 () Unit!14514)

(assert (=> b!492106 (= lt!222472 lt!222473)))

(declare-fun res!294932 () Bool)

(assert (=> b!492106 (= res!294932 (= (seekEntryOrOpen!0 (select (arr!15317 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3784 #b00000000000000000000000000000000)))))

(assert (=> b!492106 (=> (not res!294932) (not e!289096))))

(declare-fun bm!31378 () Bool)

(assert (=> bm!31378 (= call!31381 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!78043 (not res!294931)) b!492103))

(assert (= (and b!492103 c!58858) b!492106))

(assert (= (and b!492103 (not c!58858)) b!492105))

(assert (= (and b!492106 res!294932) b!492104))

(assert (= (or b!492104 b!492105) bm!31378))

(assert (=> b!492103 m!472741))

(assert (=> b!492103 m!472741))

(assert (=> b!492103 m!472747))

