; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120008 () Bool)

(assert start!120008)

(declare-fun b!1396636 () Bool)

(declare-fun e!790772 () Bool)

(declare-fun e!790773 () Bool)

(assert (=> b!1396636 (= e!790772 (not e!790773))))

(declare-fun res!935203 () Bool)

(assert (=> b!1396636 (=> res!935203 e!790773)))

(declare-datatypes ((SeekEntryResult!10355 0))(
  ( (MissingZero!10355 (index!43791 (_ BitVec 32))) (Found!10355 (index!43792 (_ BitVec 32))) (Intermediate!10355 (undefined!11167 Bool) (index!43793 (_ BitVec 32)) (x!125608 (_ BitVec 32))) (Undefined!10355) (MissingVacant!10355 (index!43794 (_ BitVec 32))) )
))
(declare-fun lt!613404 () SeekEntryResult!10355)

(get-info :version)

(assert (=> b!1396636 (= res!935203 (or (not ((_ is Intermediate!10355) lt!613404)) (undefined!11167 lt!613404)))))

(declare-fun e!790774 () Bool)

(assert (=> b!1396636 e!790774))

(declare-fun res!935197 () Bool)

(assert (=> b!1396636 (=> (not res!935197) (not e!790774))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95561 0))(
  ( (array!95562 (arr!46135 (Array (_ BitVec 32) (_ BitVec 64))) (size!46686 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95561)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95561 (_ BitVec 32)) Bool)

(assert (=> b!1396636 (= res!935197 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46741 0))(
  ( (Unit!46742) )
))
(declare-fun lt!613406 () Unit!46741)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46741)

(assert (=> b!1396636 (= lt!613406 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95561 (_ BitVec 32)) SeekEntryResult!10355)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396636 (= lt!613404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46135 a!2901) j!112) mask!2840) (select (arr!46135 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!935200 () Bool)

(assert (=> start!120008 (=> (not res!935200) (not e!790772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120008 (= res!935200 (validMask!0 mask!2840))))

(assert (=> start!120008 e!790772))

(assert (=> start!120008 true))

(declare-fun array_inv!35416 (array!95561) Bool)

(assert (=> start!120008 (array_inv!35416 a!2901)))

(declare-fun b!1396637 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95561 (_ BitVec 32)) SeekEntryResult!10355)

(assert (=> b!1396637 (= e!790774 (= (seekEntryOrOpen!0 (select (arr!46135 a!2901) j!112) a!2901 mask!2840) (Found!10355 j!112)))))

(declare-fun b!1396638 () Bool)

(declare-fun res!935201 () Bool)

(assert (=> b!1396638 (=> (not res!935201) (not e!790772))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396638 (= res!935201 (validKeyInArray!0 (select (arr!46135 a!2901) i!1037)))))

(declare-fun b!1396639 () Bool)

(declare-fun res!935202 () Bool)

(assert (=> b!1396639 (=> (not res!935202) (not e!790772))))

(declare-datatypes ((List!32641 0))(
  ( (Nil!32638) (Cons!32637 (h!33881 (_ BitVec 64)) (t!47327 List!32641)) )
))
(declare-fun arrayNoDuplicates!0 (array!95561 (_ BitVec 32) List!32641) Bool)

(assert (=> b!1396639 (= res!935202 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32638))))

(declare-fun b!1396640 () Bool)

(declare-fun e!790771 () Bool)

(declare-fun lt!613405 () (_ BitVec 32))

(assert (=> b!1396640 (= e!790771 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!613405 #b00000000000000000000000000000000) (bvslt lt!613405 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun b!1396641 () Bool)

(declare-fun res!935196 () Bool)

(assert (=> b!1396641 (=> (not res!935196) (not e!790772))))

(assert (=> b!1396641 (= res!935196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396642 () Bool)

(assert (=> b!1396642 (= e!790773 e!790771)))

(declare-fun res!935199 () Bool)

(assert (=> b!1396642 (=> res!935199 e!790771)))

(assert (=> b!1396642 (= res!935199 (= lt!613404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613405 (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95562 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901)) mask!2840)))))

(assert (=> b!1396642 (= lt!613405 (toIndex!0 (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1396643 () Bool)

(declare-fun res!935198 () Bool)

(assert (=> b!1396643 (=> (not res!935198) (not e!790772))))

(assert (=> b!1396643 (= res!935198 (validKeyInArray!0 (select (arr!46135 a!2901) j!112)))))

(declare-fun b!1396644 () Bool)

(declare-fun res!935195 () Bool)

(assert (=> b!1396644 (=> (not res!935195) (not e!790772))))

(assert (=> b!1396644 (= res!935195 (and (= (size!46686 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46686 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46686 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120008 res!935200) b!1396644))

(assert (= (and b!1396644 res!935195) b!1396638))

(assert (= (and b!1396638 res!935201) b!1396643))

(assert (= (and b!1396643 res!935198) b!1396641))

(assert (= (and b!1396641 res!935196) b!1396639))

(assert (= (and b!1396639 res!935202) b!1396636))

(assert (= (and b!1396636 res!935197) b!1396637))

(assert (= (and b!1396636 (not res!935203)) b!1396642))

(assert (= (and b!1396642 (not res!935199)) b!1396640))

(declare-fun m!1283371 () Bool)

(assert (=> b!1396641 m!1283371))

(declare-fun m!1283373 () Bool)

(assert (=> b!1396638 m!1283373))

(assert (=> b!1396638 m!1283373))

(declare-fun m!1283375 () Bool)

(assert (=> b!1396638 m!1283375))

(declare-fun m!1283377 () Bool)

(assert (=> b!1396636 m!1283377))

(declare-fun m!1283379 () Bool)

(assert (=> b!1396636 m!1283379))

(assert (=> b!1396636 m!1283377))

(declare-fun m!1283381 () Bool)

(assert (=> b!1396636 m!1283381))

(assert (=> b!1396636 m!1283379))

(assert (=> b!1396636 m!1283377))

(declare-fun m!1283383 () Bool)

(assert (=> b!1396636 m!1283383))

(declare-fun m!1283385 () Bool)

(assert (=> b!1396636 m!1283385))

(declare-fun m!1283387 () Bool)

(assert (=> b!1396639 m!1283387))

(assert (=> b!1396637 m!1283377))

(assert (=> b!1396637 m!1283377))

(declare-fun m!1283389 () Bool)

(assert (=> b!1396637 m!1283389))

(declare-fun m!1283391 () Bool)

(assert (=> start!120008 m!1283391))

(declare-fun m!1283393 () Bool)

(assert (=> start!120008 m!1283393))

(assert (=> b!1396643 m!1283377))

(assert (=> b!1396643 m!1283377))

(declare-fun m!1283395 () Bool)

(assert (=> b!1396643 m!1283395))

(declare-fun m!1283397 () Bool)

(assert (=> b!1396642 m!1283397))

(declare-fun m!1283399 () Bool)

(assert (=> b!1396642 m!1283399))

(assert (=> b!1396642 m!1283399))

(declare-fun m!1283401 () Bool)

(assert (=> b!1396642 m!1283401))

(assert (=> b!1396642 m!1283399))

(declare-fun m!1283403 () Bool)

(assert (=> b!1396642 m!1283403))

(check-sat (not b!1396641) (not b!1396639) (not b!1396642) (not b!1396637) (not start!120008) (not b!1396643) (not b!1396636) (not b!1396638))
(check-sat)
(get-model)

(declare-fun b!1396717 () Bool)

(declare-fun e!790818 () SeekEntryResult!10355)

(declare-fun e!790819 () SeekEntryResult!10355)

(assert (=> b!1396717 (= e!790818 e!790819)))

(declare-fun lt!613430 () (_ BitVec 64))

(declare-fun c!130189 () Bool)

(assert (=> b!1396717 (= c!130189 (or (= lt!613430 (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!613430 lt!613430) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1396718 () Bool)

(declare-fun lt!613429 () SeekEntryResult!10355)

(assert (=> b!1396718 (and (bvsge (index!43793 lt!613429) #b00000000000000000000000000000000) (bvslt (index!43793 lt!613429) (size!46686 (array!95562 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901)))))))

(declare-fun res!935265 () Bool)

(assert (=> b!1396718 (= res!935265 (= (select (arr!46135 (array!95562 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901))) (index!43793 lt!613429)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790820 () Bool)

(assert (=> b!1396718 (=> res!935265 e!790820)))

(declare-fun b!1396719 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396719 (= e!790819 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!613405 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95562 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901)) mask!2840))))

(declare-fun b!1396720 () Bool)

(assert (=> b!1396720 (= e!790818 (Intermediate!10355 true lt!613405 #b00000000000000000000000000000000))))

(declare-fun b!1396721 () Bool)

(assert (=> b!1396721 (= e!790819 (Intermediate!10355 false lt!613405 #b00000000000000000000000000000000))))

(declare-fun b!1396722 () Bool)

(declare-fun e!790817 () Bool)

(assert (=> b!1396722 (= e!790817 (bvsge (x!125608 lt!613429) #b01111111111111111111111111111110))))

(declare-fun b!1396723 () Bool)

(assert (=> b!1396723 (and (bvsge (index!43793 lt!613429) #b00000000000000000000000000000000) (bvslt (index!43793 lt!613429) (size!46686 (array!95562 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901)))))))

(assert (=> b!1396723 (= e!790820 (= (select (arr!46135 (array!95562 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901))) (index!43793 lt!613429)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1396724 () Bool)

(assert (=> b!1396724 (and (bvsge (index!43793 lt!613429) #b00000000000000000000000000000000) (bvslt (index!43793 lt!613429) (size!46686 (array!95562 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901)))))))

(declare-fun res!935264 () Bool)

(assert (=> b!1396724 (= res!935264 (= (select (arr!46135 (array!95562 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901))) (index!43793 lt!613429)) (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1396724 (=> res!935264 e!790820)))

(declare-fun e!790816 () Bool)

(assert (=> b!1396724 (= e!790816 e!790820)))

(declare-fun b!1396725 () Bool)

(assert (=> b!1396725 (= e!790817 e!790816)))

(declare-fun res!935266 () Bool)

(assert (=> b!1396725 (= res!935266 (and ((_ is Intermediate!10355) lt!613429) (not (undefined!11167 lt!613429)) (bvslt (x!125608 lt!613429) #b01111111111111111111111111111110) (bvsge (x!125608 lt!613429) #b00000000000000000000000000000000) (bvsge (x!125608 lt!613429) #b00000000000000000000000000000000)))))

(assert (=> b!1396725 (=> (not res!935266) (not e!790816))))

(declare-fun d!151065 () Bool)

(assert (=> d!151065 e!790817))

(declare-fun c!130187 () Bool)

(assert (=> d!151065 (= c!130187 (and ((_ is Intermediate!10355) lt!613429) (undefined!11167 lt!613429)))))

(assert (=> d!151065 (= lt!613429 e!790818)))

(declare-fun c!130188 () Bool)

(assert (=> d!151065 (= c!130188 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151065 (= lt!613430 (select (arr!46135 (array!95562 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901))) lt!613405))))

(assert (=> d!151065 (validMask!0 mask!2840)))

(assert (=> d!151065 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613405 (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95562 (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46686 a!2901)) mask!2840) lt!613429)))

(assert (= (and d!151065 c!130188) b!1396720))

(assert (= (and d!151065 (not c!130188)) b!1396717))

(assert (= (and b!1396717 c!130189) b!1396721))

(assert (= (and b!1396717 (not c!130189)) b!1396719))

(assert (= (and d!151065 c!130187) b!1396722))

(assert (= (and d!151065 (not c!130187)) b!1396725))

(assert (= (and b!1396725 res!935266) b!1396724))

(assert (= (and b!1396724 (not res!935264)) b!1396718))

(assert (= (and b!1396718 (not res!935265)) b!1396723))

(declare-fun m!1283473 () Bool)

(assert (=> b!1396719 m!1283473))

(assert (=> b!1396719 m!1283473))

(assert (=> b!1396719 m!1283399))

(declare-fun m!1283475 () Bool)

(assert (=> b!1396719 m!1283475))

(declare-fun m!1283477 () Bool)

(assert (=> d!151065 m!1283477))

(assert (=> d!151065 m!1283391))

(declare-fun m!1283479 () Bool)

(assert (=> b!1396723 m!1283479))

(assert (=> b!1396718 m!1283479))

(assert (=> b!1396724 m!1283479))

(assert (=> b!1396642 d!151065))

(declare-fun d!151071 () Bool)

(declare-fun lt!613445 () (_ BitVec 32))

(declare-fun lt!613444 () (_ BitVec 32))

(assert (=> d!151071 (= lt!613445 (bvmul (bvxor lt!613444 (bvlshr lt!613444 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151071 (= lt!613444 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151071 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935267 (let ((h!33884 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125612 (bvmul (bvxor h!33884 (bvlshr h!33884 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125612 (bvlshr x!125612 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935267 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935267 #b00000000000000000000000000000000))))))

(assert (=> d!151071 (= (toIndex!0 (select (store (arr!46135 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!613445 (bvlshr lt!613445 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1396642 d!151071))

(declare-fun d!151073 () Bool)

(declare-fun lt!613474 () SeekEntryResult!10355)

(assert (=> d!151073 (and (or ((_ is Undefined!10355) lt!613474) (not ((_ is Found!10355) lt!613474)) (and (bvsge (index!43792 lt!613474) #b00000000000000000000000000000000) (bvslt (index!43792 lt!613474) (size!46686 a!2901)))) (or ((_ is Undefined!10355) lt!613474) ((_ is Found!10355) lt!613474) (not ((_ is MissingZero!10355) lt!613474)) (and (bvsge (index!43791 lt!613474) #b00000000000000000000000000000000) (bvslt (index!43791 lt!613474) (size!46686 a!2901)))) (or ((_ is Undefined!10355) lt!613474) ((_ is Found!10355) lt!613474) ((_ is MissingZero!10355) lt!613474) (not ((_ is MissingVacant!10355) lt!613474)) (and (bvsge (index!43794 lt!613474) #b00000000000000000000000000000000) (bvslt (index!43794 lt!613474) (size!46686 a!2901)))) (or ((_ is Undefined!10355) lt!613474) (ite ((_ is Found!10355) lt!613474) (= (select (arr!46135 a!2901) (index!43792 lt!613474)) (select (arr!46135 a!2901) j!112)) (ite ((_ is MissingZero!10355) lt!613474) (= (select (arr!46135 a!2901) (index!43791 lt!613474)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10355) lt!613474) (= (select (arr!46135 a!2901) (index!43794 lt!613474)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!790857 () SeekEntryResult!10355)

(assert (=> d!151073 (= lt!613474 e!790857)))

(declare-fun c!130215 () Bool)

(declare-fun lt!613475 () SeekEntryResult!10355)

(assert (=> d!151073 (= c!130215 (and ((_ is Intermediate!10355) lt!613475) (undefined!11167 lt!613475)))))

(assert (=> d!151073 (= lt!613475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46135 a!2901) j!112) mask!2840) (select (arr!46135 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151073 (validMask!0 mask!2840)))

(assert (=> d!151073 (= (seekEntryOrOpen!0 (select (arr!46135 a!2901) j!112) a!2901 mask!2840) lt!613474)))

(declare-fun b!1396784 () Bool)

(assert (=> b!1396784 (= e!790857 Undefined!10355)))

(declare-fun b!1396785 () Bool)

(declare-fun c!130214 () Bool)

(declare-fun lt!613476 () (_ BitVec 64))

(assert (=> b!1396785 (= c!130214 (= lt!613476 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790855 () SeekEntryResult!10355)

(declare-fun e!790856 () SeekEntryResult!10355)

(assert (=> b!1396785 (= e!790855 e!790856)))

(declare-fun b!1396786 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95561 (_ BitVec 32)) SeekEntryResult!10355)

(assert (=> b!1396786 (= e!790856 (seekKeyOrZeroReturnVacant!0 (x!125608 lt!613475) (index!43793 lt!613475) (index!43793 lt!613475) (select (arr!46135 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396787 () Bool)

(assert (=> b!1396787 (= e!790857 e!790855)))

(assert (=> b!1396787 (= lt!613476 (select (arr!46135 a!2901) (index!43793 lt!613475)))))

(declare-fun c!130216 () Bool)

(assert (=> b!1396787 (= c!130216 (= lt!613476 (select (arr!46135 a!2901) j!112)))))

(declare-fun b!1396788 () Bool)

(assert (=> b!1396788 (= e!790855 (Found!10355 (index!43793 lt!613475)))))

(declare-fun b!1396789 () Bool)

(assert (=> b!1396789 (= e!790856 (MissingZero!10355 (index!43793 lt!613475)))))

(assert (= (and d!151073 c!130215) b!1396784))

(assert (= (and d!151073 (not c!130215)) b!1396787))

(assert (= (and b!1396787 c!130216) b!1396788))

(assert (= (and b!1396787 (not c!130216)) b!1396785))

(assert (= (and b!1396785 c!130214) b!1396789))

(assert (= (and b!1396785 (not c!130214)) b!1396786))

(assert (=> d!151073 m!1283377))

(assert (=> d!151073 m!1283379))

(assert (=> d!151073 m!1283391))

(declare-fun m!1283499 () Bool)

(assert (=> d!151073 m!1283499))

(assert (=> d!151073 m!1283379))

(assert (=> d!151073 m!1283377))

(assert (=> d!151073 m!1283383))

(declare-fun m!1283501 () Bool)

(assert (=> d!151073 m!1283501))

(declare-fun m!1283505 () Bool)

(assert (=> d!151073 m!1283505))

(assert (=> b!1396786 m!1283377))

(declare-fun m!1283509 () Bool)

(assert (=> b!1396786 m!1283509))

(declare-fun m!1283513 () Bool)

(assert (=> b!1396787 m!1283513))

(assert (=> b!1396637 d!151073))

(declare-fun d!151081 () Bool)

(assert (=> d!151081 (= (validKeyInArray!0 (select (arr!46135 a!2901) j!112)) (and (not (= (select (arr!46135 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46135 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1396643 d!151081))

(declare-fun d!151087 () Bool)

(assert (=> d!151087 (= (validKeyInArray!0 (select (arr!46135 a!2901) i!1037)) (and (not (= (select (arr!46135 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46135 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1396638 d!151087))

(declare-fun b!1396828 () Bool)

(declare-fun e!790885 () Bool)

(declare-fun call!66892 () Bool)

(assert (=> b!1396828 (= e!790885 call!66892)))

(declare-fun b!1396829 () Bool)

(assert (=> b!1396829 (= e!790885 call!66892)))

(declare-fun b!1396830 () Bool)

(declare-fun e!790886 () Bool)

(declare-fun e!790883 () Bool)

(assert (=> b!1396830 (= e!790886 e!790883)))

(declare-fun res!935298 () Bool)

(assert (=> b!1396830 (=> (not res!935298) (not e!790883))))

(declare-fun e!790884 () Bool)

(assert (=> b!1396830 (= res!935298 (not e!790884))))

(declare-fun res!935299 () Bool)

(assert (=> b!1396830 (=> (not res!935299) (not e!790884))))

(assert (=> b!1396830 (= res!935299 (validKeyInArray!0 (select (arr!46135 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151089 () Bool)

(declare-fun res!935300 () Bool)

(assert (=> d!151089 (=> res!935300 e!790886)))

(assert (=> d!151089 (= res!935300 (bvsge #b00000000000000000000000000000000 (size!46686 a!2901)))))

(assert (=> d!151089 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32638) e!790886)))

(declare-fun b!1396827 () Bool)

(assert (=> b!1396827 (= e!790883 e!790885)))

(declare-fun c!130226 () Bool)

(assert (=> b!1396827 (= c!130226 (validKeyInArray!0 (select (arr!46135 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396831 () Bool)

(declare-fun contains!9819 (List!32641 (_ BitVec 64)) Bool)

(assert (=> b!1396831 (= e!790884 (contains!9819 Nil!32638 (select (arr!46135 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66889 () Bool)

(assert (=> bm!66889 (= call!66892 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130226 (Cons!32637 (select (arr!46135 a!2901) #b00000000000000000000000000000000) Nil!32638) Nil!32638)))))

(assert (= (and d!151089 (not res!935300)) b!1396830))

(assert (= (and b!1396830 res!935299) b!1396831))

(assert (= (and b!1396830 res!935298) b!1396827))

(assert (= (and b!1396827 c!130226) b!1396829))

(assert (= (and b!1396827 (not c!130226)) b!1396828))

(assert (= (or b!1396829 b!1396828) bm!66889))

(declare-fun m!1283537 () Bool)

(assert (=> b!1396830 m!1283537))

(assert (=> b!1396830 m!1283537))

(declare-fun m!1283539 () Bool)

(assert (=> b!1396830 m!1283539))

(assert (=> b!1396827 m!1283537))

(assert (=> b!1396827 m!1283537))

(assert (=> b!1396827 m!1283539))

(assert (=> b!1396831 m!1283537))

(assert (=> b!1396831 m!1283537))

(declare-fun m!1283541 () Bool)

(assert (=> b!1396831 m!1283541))

(assert (=> bm!66889 m!1283537))

(declare-fun m!1283543 () Bool)

(assert (=> bm!66889 m!1283543))

(assert (=> b!1396639 d!151089))

(declare-fun d!151095 () Bool)

(assert (=> d!151095 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120008 d!151095))

(declare-fun d!151099 () Bool)

(assert (=> d!151099 (= (array_inv!35416 a!2901) (bvsge (size!46686 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120008 d!151099))

(declare-fun b!1396879 () Bool)

(declare-fun e!790915 () Bool)

(declare-fun call!66895 () Bool)

(assert (=> b!1396879 (= e!790915 call!66895)))

(declare-fun bm!66892 () Bool)

(assert (=> bm!66892 (= call!66895 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151101 () Bool)

(declare-fun res!935315 () Bool)

(declare-fun e!790916 () Bool)

(assert (=> d!151101 (=> res!935315 e!790916)))

(assert (=> d!151101 (= res!935315 (bvsge #b00000000000000000000000000000000 (size!46686 a!2901)))))

(assert (=> d!151101 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!790916)))

(declare-fun b!1396880 () Bool)

(declare-fun e!790914 () Bool)

(assert (=> b!1396880 (= e!790916 e!790914)))

(declare-fun c!130244 () Bool)

(assert (=> b!1396880 (= c!130244 (validKeyInArray!0 (select (arr!46135 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396881 () Bool)

(assert (=> b!1396881 (= e!790914 call!66895)))

(declare-fun b!1396882 () Bool)

(assert (=> b!1396882 (= e!790914 e!790915)))

(declare-fun lt!613513 () (_ BitVec 64))

(assert (=> b!1396882 (= lt!613513 (select (arr!46135 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!613512 () Unit!46741)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95561 (_ BitVec 64) (_ BitVec 32)) Unit!46741)

(assert (=> b!1396882 (= lt!613512 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613513 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1396882 (arrayContainsKey!0 a!2901 lt!613513 #b00000000000000000000000000000000)))

(declare-fun lt!613514 () Unit!46741)

(assert (=> b!1396882 (= lt!613514 lt!613512)))

(declare-fun res!935314 () Bool)

(assert (=> b!1396882 (= res!935314 (= (seekEntryOrOpen!0 (select (arr!46135 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10355 #b00000000000000000000000000000000)))))

(assert (=> b!1396882 (=> (not res!935314) (not e!790915))))

(assert (= (and d!151101 (not res!935315)) b!1396880))

(assert (= (and b!1396880 c!130244) b!1396882))

(assert (= (and b!1396880 (not c!130244)) b!1396881))

(assert (= (and b!1396882 res!935314) b!1396879))

(assert (= (or b!1396879 b!1396881) bm!66892))

(declare-fun m!1283553 () Bool)

(assert (=> bm!66892 m!1283553))

(assert (=> b!1396880 m!1283537))

(assert (=> b!1396880 m!1283537))

(assert (=> b!1396880 m!1283539))

(assert (=> b!1396882 m!1283537))

(declare-fun m!1283555 () Bool)

(assert (=> b!1396882 m!1283555))

(declare-fun m!1283557 () Bool)

(assert (=> b!1396882 m!1283557))

(assert (=> b!1396882 m!1283537))

(declare-fun m!1283559 () Bool)

(assert (=> b!1396882 m!1283559))

(assert (=> b!1396641 d!151101))

(declare-fun b!1396883 () Bool)

(declare-fun e!790918 () Bool)

(declare-fun call!66896 () Bool)

(assert (=> b!1396883 (= e!790918 call!66896)))

(declare-fun bm!66893 () Bool)

(assert (=> bm!66893 (= call!66896 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151105 () Bool)

(declare-fun res!935318 () Bool)

(declare-fun e!790919 () Bool)

(assert (=> d!151105 (=> res!935318 e!790919)))

(assert (=> d!151105 (= res!935318 (bvsge j!112 (size!46686 a!2901)))))

(assert (=> d!151105 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!790919)))

(declare-fun b!1396884 () Bool)

(declare-fun e!790917 () Bool)

(assert (=> b!1396884 (= e!790919 e!790917)))

(declare-fun c!130245 () Bool)

(assert (=> b!1396884 (= c!130245 (validKeyInArray!0 (select (arr!46135 a!2901) j!112)))))

(declare-fun b!1396885 () Bool)

(assert (=> b!1396885 (= e!790917 call!66896)))

(declare-fun b!1396886 () Bool)

(assert (=> b!1396886 (= e!790917 e!790918)))

(declare-fun lt!613516 () (_ BitVec 64))

(assert (=> b!1396886 (= lt!613516 (select (arr!46135 a!2901) j!112))))

(declare-fun lt!613515 () Unit!46741)

(assert (=> b!1396886 (= lt!613515 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613516 j!112))))

(assert (=> b!1396886 (arrayContainsKey!0 a!2901 lt!613516 #b00000000000000000000000000000000)))

(declare-fun lt!613517 () Unit!46741)

(assert (=> b!1396886 (= lt!613517 lt!613515)))

(declare-fun res!935317 () Bool)

(assert (=> b!1396886 (= res!935317 (= (seekEntryOrOpen!0 (select (arr!46135 a!2901) j!112) a!2901 mask!2840) (Found!10355 j!112)))))

(assert (=> b!1396886 (=> (not res!935317) (not e!790918))))

(assert (= (and d!151105 (not res!935318)) b!1396884))

(assert (= (and b!1396884 c!130245) b!1396886))

(assert (= (and b!1396884 (not c!130245)) b!1396885))

(assert (= (and b!1396886 res!935317) b!1396883))

(assert (= (or b!1396883 b!1396885) bm!66893))

(declare-fun m!1283561 () Bool)

(assert (=> bm!66893 m!1283561))

(assert (=> b!1396884 m!1283377))

(assert (=> b!1396884 m!1283377))

(assert (=> b!1396884 m!1283395))

(assert (=> b!1396886 m!1283377))

(declare-fun m!1283563 () Bool)

(assert (=> b!1396886 m!1283563))

(declare-fun m!1283565 () Bool)

(assert (=> b!1396886 m!1283565))

(assert (=> b!1396886 m!1283377))

(assert (=> b!1396886 m!1283389))

(assert (=> b!1396636 d!151105))

(declare-fun d!151107 () Bool)

(assert (=> d!151107 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613529 () Unit!46741)

(declare-fun choose!38 (array!95561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46741)

(assert (=> d!151107 (= lt!613529 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151107 (validMask!0 mask!2840)))

(assert (=> d!151107 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!613529)))

(declare-fun bs!40623 () Bool)

(assert (= bs!40623 d!151107))

(assert (=> bs!40623 m!1283385))

(declare-fun m!1283577 () Bool)

(assert (=> bs!40623 m!1283577))

(assert (=> bs!40623 m!1283391))

(assert (=> b!1396636 d!151107))

(declare-fun b!1396893 () Bool)

(declare-fun e!790925 () SeekEntryResult!10355)

(declare-fun e!790926 () SeekEntryResult!10355)

(assert (=> b!1396893 (= e!790925 e!790926)))

(declare-fun lt!613531 () (_ BitVec 64))

(declare-fun c!130251 () Bool)

(assert (=> b!1396893 (= c!130251 (or (= lt!613531 (select (arr!46135 a!2901) j!112)) (= (bvadd lt!613531 lt!613531) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1396894 () Bool)

(declare-fun lt!613530 () SeekEntryResult!10355)

(assert (=> b!1396894 (and (bvsge (index!43793 lt!613530) #b00000000000000000000000000000000) (bvslt (index!43793 lt!613530) (size!46686 a!2901)))))

(declare-fun res!935320 () Bool)

(assert (=> b!1396894 (= res!935320 (= (select (arr!46135 a!2901) (index!43793 lt!613530)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790927 () Bool)

(assert (=> b!1396894 (=> res!935320 e!790927)))

(declare-fun b!1396895 () Bool)

(assert (=> b!1396895 (= e!790926 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46135 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46135 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396896 () Bool)

(assert (=> b!1396896 (= e!790925 (Intermediate!10355 true (toIndex!0 (select (arr!46135 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396897 () Bool)

(assert (=> b!1396897 (= e!790926 (Intermediate!10355 false (toIndex!0 (select (arr!46135 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396898 () Bool)

(declare-fun e!790924 () Bool)

(assert (=> b!1396898 (= e!790924 (bvsge (x!125608 lt!613530) #b01111111111111111111111111111110))))

(declare-fun b!1396899 () Bool)

(assert (=> b!1396899 (and (bvsge (index!43793 lt!613530) #b00000000000000000000000000000000) (bvslt (index!43793 lt!613530) (size!46686 a!2901)))))

(assert (=> b!1396899 (= e!790927 (= (select (arr!46135 a!2901) (index!43793 lt!613530)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1396900 () Bool)

(assert (=> b!1396900 (and (bvsge (index!43793 lt!613530) #b00000000000000000000000000000000) (bvslt (index!43793 lt!613530) (size!46686 a!2901)))))

(declare-fun res!935319 () Bool)

(assert (=> b!1396900 (= res!935319 (= (select (arr!46135 a!2901) (index!43793 lt!613530)) (select (arr!46135 a!2901) j!112)))))

(assert (=> b!1396900 (=> res!935319 e!790927)))

(declare-fun e!790923 () Bool)

(assert (=> b!1396900 (= e!790923 e!790927)))

(declare-fun b!1396901 () Bool)

(assert (=> b!1396901 (= e!790924 e!790923)))

(declare-fun res!935321 () Bool)

(assert (=> b!1396901 (= res!935321 (and ((_ is Intermediate!10355) lt!613530) (not (undefined!11167 lt!613530)) (bvslt (x!125608 lt!613530) #b01111111111111111111111111111110) (bvsge (x!125608 lt!613530) #b00000000000000000000000000000000) (bvsge (x!125608 lt!613530) #b00000000000000000000000000000000)))))

(assert (=> b!1396901 (=> (not res!935321) (not e!790923))))

(declare-fun d!151115 () Bool)

(assert (=> d!151115 e!790924))

(declare-fun c!130249 () Bool)

(assert (=> d!151115 (= c!130249 (and ((_ is Intermediate!10355) lt!613530) (undefined!11167 lt!613530)))))

(assert (=> d!151115 (= lt!613530 e!790925)))

(declare-fun c!130250 () Bool)

(assert (=> d!151115 (= c!130250 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151115 (= lt!613531 (select (arr!46135 a!2901) (toIndex!0 (select (arr!46135 a!2901) j!112) mask!2840)))))

(assert (=> d!151115 (validMask!0 mask!2840)))

(assert (=> d!151115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46135 a!2901) j!112) mask!2840) (select (arr!46135 a!2901) j!112) a!2901 mask!2840) lt!613530)))

(assert (= (and d!151115 c!130250) b!1396896))

(assert (= (and d!151115 (not c!130250)) b!1396893))

(assert (= (and b!1396893 c!130251) b!1396897))

(assert (= (and b!1396893 (not c!130251)) b!1396895))

(assert (= (and d!151115 c!130249) b!1396898))

(assert (= (and d!151115 (not c!130249)) b!1396901))

(assert (= (and b!1396901 res!935321) b!1396900))

(assert (= (and b!1396900 (not res!935319)) b!1396894))

(assert (= (and b!1396894 (not res!935320)) b!1396899))

(assert (=> b!1396895 m!1283379))

(declare-fun m!1283579 () Bool)

(assert (=> b!1396895 m!1283579))

(assert (=> b!1396895 m!1283579))

(assert (=> b!1396895 m!1283377))

(declare-fun m!1283581 () Bool)

(assert (=> b!1396895 m!1283581))

(assert (=> d!151115 m!1283379))

(declare-fun m!1283583 () Bool)

(assert (=> d!151115 m!1283583))

(assert (=> d!151115 m!1283391))

(declare-fun m!1283585 () Bool)

(assert (=> b!1396899 m!1283585))

(assert (=> b!1396894 m!1283585))

(assert (=> b!1396900 m!1283585))

(assert (=> b!1396636 d!151115))

(declare-fun d!151117 () Bool)

(declare-fun lt!613533 () (_ BitVec 32))

(declare-fun lt!613532 () (_ BitVec 32))

(assert (=> d!151117 (= lt!613533 (bvmul (bvxor lt!613532 (bvlshr lt!613532 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151117 (= lt!613532 ((_ extract 31 0) (bvand (bvxor (select (arr!46135 a!2901) j!112) (bvlshr (select (arr!46135 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151117 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935267 (let ((h!33884 ((_ extract 31 0) (bvand (bvxor (select (arr!46135 a!2901) j!112) (bvlshr (select (arr!46135 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125612 (bvmul (bvxor h!33884 (bvlshr h!33884 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125612 (bvlshr x!125612 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935267 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935267 #b00000000000000000000000000000000))))))

(assert (=> d!151117 (= (toIndex!0 (select (arr!46135 a!2901) j!112) mask!2840) (bvand (bvxor lt!613533 (bvlshr lt!613533 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1396636 d!151117))

(check-sat (not d!151107) (not bm!66889) (not b!1396831) (not bm!66893) (not b!1396895) (not b!1396884) (not b!1396786) (not b!1396719) (not d!151073) (not b!1396882) (not b!1396880) (not d!151115) (not b!1396886) (not bm!66892) (not b!1396827) (not b!1396830) (not d!151065))
(check-sat)
