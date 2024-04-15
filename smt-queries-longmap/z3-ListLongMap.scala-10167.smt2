; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119816 () Bool)

(assert start!119816)

(declare-fun res!934714 () Bool)

(declare-fun e!789997 () Bool)

(assert (=> start!119816 (=> (not res!934714) (not e!789997))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119816 (= res!934714 (validMask!0 mask!2840))))

(assert (=> start!119816 e!789997))

(assert (=> start!119816 true))

(declare-datatypes ((array!95400 0))(
  ( (array!95401 (arr!46057 (Array (_ BitVec 32) (_ BitVec 64))) (size!46609 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95400)

(declare-fun array_inv!35290 (array!95400) Bool)

(assert (=> start!119816 (array_inv!35290 a!2901)))

(declare-fun b!1395415 () Bool)

(declare-fun res!934709 () Bool)

(assert (=> b!1395415 (=> (not res!934709) (not e!789997))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395415 (= res!934709 (validKeyInArray!0 (select (arr!46057 a!2901) j!112)))))

(declare-fun b!1395416 () Bool)

(declare-fun e!789996 () Bool)

(assert (=> b!1395416 (= e!789997 (not e!789996))))

(declare-fun res!934713 () Bool)

(assert (=> b!1395416 (=> res!934713 e!789996)))

(declare-datatypes ((SeekEntryResult!10400 0))(
  ( (MissingZero!10400 (index!43971 (_ BitVec 32))) (Found!10400 (index!43972 (_ BitVec 32))) (Intermediate!10400 (undefined!11212 Bool) (index!43973 (_ BitVec 32)) (x!125631 (_ BitVec 32))) (Undefined!10400) (MissingVacant!10400 (index!43974 (_ BitVec 32))) )
))
(declare-fun lt!612816 () SeekEntryResult!10400)

(get-info :version)

(assert (=> b!1395416 (= res!934713 (or (not ((_ is Intermediate!10400) lt!612816)) (undefined!11212 lt!612816)))))

(declare-fun e!789998 () Bool)

(assert (=> b!1395416 e!789998))

(declare-fun res!934716 () Bool)

(assert (=> b!1395416 (=> (not res!934716) (not e!789998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95400 (_ BitVec 32)) Bool)

(assert (=> b!1395416 (= res!934716 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46647 0))(
  ( (Unit!46648) )
))
(declare-fun lt!612818 () Unit!46647)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46647)

(assert (=> b!1395416 (= lt!612818 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95400 (_ BitVec 32)) SeekEntryResult!10400)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395416 (= lt!612816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46057 a!2901) j!112) mask!2840) (select (arr!46057 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395417 () Bool)

(declare-fun e!789995 () Bool)

(assert (=> b!1395417 (= e!789996 e!789995)))

(declare-fun res!934715 () Bool)

(assert (=> b!1395417 (=> res!934715 e!789995)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612817 () (_ BitVec 32))

(assert (=> b!1395417 (= res!934715 (= lt!612816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612817 (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95401 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901)) mask!2840)))))

(assert (=> b!1395417 (= lt!612817 (toIndex!0 (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1395418 () Bool)

(declare-fun res!934711 () Bool)

(assert (=> b!1395418 (=> (not res!934711) (not e!789997))))

(declare-datatypes ((List!32654 0))(
  ( (Nil!32651) (Cons!32650 (h!33886 (_ BitVec 64)) (t!47340 List!32654)) )
))
(declare-fun arrayNoDuplicates!0 (array!95400 (_ BitVec 32) List!32654) Bool)

(assert (=> b!1395418 (= res!934711 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32651))))

(declare-fun b!1395419 () Bool)

(declare-fun res!934710 () Bool)

(assert (=> b!1395419 (=> (not res!934710) (not e!789997))))

(assert (=> b!1395419 (= res!934710 (validKeyInArray!0 (select (arr!46057 a!2901) i!1037)))))

(declare-fun b!1395420 () Bool)

(declare-fun res!934712 () Bool)

(assert (=> b!1395420 (=> (not res!934712) (not e!789997))))

(assert (=> b!1395420 (= res!934712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395421 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95400 (_ BitVec 32)) SeekEntryResult!10400)

(assert (=> b!1395421 (= e!789998 (= (seekEntryOrOpen!0 (select (arr!46057 a!2901) j!112) a!2901 mask!2840) (Found!10400 j!112)))))

(declare-fun b!1395422 () Bool)

(declare-fun res!934717 () Bool)

(assert (=> b!1395422 (=> (not res!934717) (not e!789997))))

(assert (=> b!1395422 (= res!934717 (and (= (size!46609 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46609 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46609 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395423 () Bool)

(assert (=> b!1395423 (= e!789995 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!612817 #b00000000000000000000000000000000) (bvslt lt!612817 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(assert (= (and start!119816 res!934714) b!1395422))

(assert (= (and b!1395422 res!934717) b!1395419))

(assert (= (and b!1395419 res!934710) b!1395415))

(assert (= (and b!1395415 res!934709) b!1395420))

(assert (= (and b!1395420 res!934712) b!1395418))

(assert (= (and b!1395418 res!934711) b!1395416))

(assert (= (and b!1395416 res!934716) b!1395421))

(assert (= (and b!1395416 (not res!934713)) b!1395417))

(assert (= (and b!1395417 (not res!934715)) b!1395423))

(declare-fun m!1281463 () Bool)

(assert (=> start!119816 m!1281463))

(declare-fun m!1281465 () Bool)

(assert (=> start!119816 m!1281465))

(declare-fun m!1281467 () Bool)

(assert (=> b!1395415 m!1281467))

(assert (=> b!1395415 m!1281467))

(declare-fun m!1281469 () Bool)

(assert (=> b!1395415 m!1281469))

(assert (=> b!1395421 m!1281467))

(assert (=> b!1395421 m!1281467))

(declare-fun m!1281471 () Bool)

(assert (=> b!1395421 m!1281471))

(declare-fun m!1281473 () Bool)

(assert (=> b!1395418 m!1281473))

(assert (=> b!1395416 m!1281467))

(declare-fun m!1281475 () Bool)

(assert (=> b!1395416 m!1281475))

(assert (=> b!1395416 m!1281467))

(declare-fun m!1281477 () Bool)

(assert (=> b!1395416 m!1281477))

(assert (=> b!1395416 m!1281475))

(assert (=> b!1395416 m!1281467))

(declare-fun m!1281479 () Bool)

(assert (=> b!1395416 m!1281479))

(declare-fun m!1281481 () Bool)

(assert (=> b!1395416 m!1281481))

(declare-fun m!1281483 () Bool)

(assert (=> b!1395419 m!1281483))

(assert (=> b!1395419 m!1281483))

(declare-fun m!1281485 () Bool)

(assert (=> b!1395419 m!1281485))

(declare-fun m!1281487 () Bool)

(assert (=> b!1395420 m!1281487))

(declare-fun m!1281489 () Bool)

(assert (=> b!1395417 m!1281489))

(declare-fun m!1281491 () Bool)

(assert (=> b!1395417 m!1281491))

(assert (=> b!1395417 m!1281491))

(declare-fun m!1281493 () Bool)

(assert (=> b!1395417 m!1281493))

(assert (=> b!1395417 m!1281491))

(declare-fun m!1281495 () Bool)

(assert (=> b!1395417 m!1281495))

(check-sat (not start!119816) (not b!1395418) (not b!1395419) (not b!1395415) (not b!1395417) (not b!1395416) (not b!1395421) (not b!1395420))
(check-sat)
(get-model)

(declare-fun b!1395496 () Bool)

(declare-fun lt!612842 () SeekEntryResult!10400)

(assert (=> b!1395496 (and (bvsge (index!43973 lt!612842) #b00000000000000000000000000000000) (bvslt (index!43973 lt!612842) (size!46609 (array!95401 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901)))))))

(declare-fun res!934780 () Bool)

(assert (=> b!1395496 (= res!934780 (= (select (arr!46057 (array!95401 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901))) (index!43973 lt!612842)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790039 () Bool)

(assert (=> b!1395496 (=> res!934780 e!790039)))

(declare-fun b!1395497 () Bool)

(declare-fun e!790041 () SeekEntryResult!10400)

(assert (=> b!1395497 (= e!790041 (Intermediate!10400 true lt!612817 #b00000000000000000000000000000000))))

(declare-fun b!1395498 () Bool)

(assert (=> b!1395498 (and (bvsge (index!43973 lt!612842) #b00000000000000000000000000000000) (bvslt (index!43973 lt!612842) (size!46609 (array!95401 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901)))))))

(assert (=> b!1395498 (= e!790039 (= (select (arr!46057 (array!95401 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901))) (index!43973 lt!612842)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395499 () Bool)

(declare-fun e!790043 () SeekEntryResult!10400)

(assert (=> b!1395499 (= e!790041 e!790043)))

(declare-fun c!129816 () Bool)

(declare-fun lt!612841 () (_ BitVec 64))

(assert (=> b!1395499 (= c!129816 (or (= lt!612841 (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!612841 lt!612841) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395501 () Bool)

(assert (=> b!1395501 (and (bvsge (index!43973 lt!612842) #b00000000000000000000000000000000) (bvslt (index!43973 lt!612842) (size!46609 (array!95401 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901)))))))

(declare-fun res!934778 () Bool)

(assert (=> b!1395501 (= res!934778 (= (select (arr!46057 (array!95401 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901))) (index!43973 lt!612842)) (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1395501 (=> res!934778 e!790039)))

(declare-fun e!790040 () Bool)

(assert (=> b!1395501 (= e!790040 e!790039)))

(declare-fun b!1395502 () Bool)

(declare-fun e!790042 () Bool)

(assert (=> b!1395502 (= e!790042 e!790040)))

(declare-fun res!934779 () Bool)

(assert (=> b!1395502 (= res!934779 (and ((_ is Intermediate!10400) lt!612842) (not (undefined!11212 lt!612842)) (bvslt (x!125631 lt!612842) #b01111111111111111111111111111110) (bvsge (x!125631 lt!612842) #b00000000000000000000000000000000) (bvsge (x!125631 lt!612842) #b00000000000000000000000000000000)))))

(assert (=> b!1395502 (=> (not res!934779) (not e!790040))))

(declare-fun b!1395503 () Bool)

(assert (=> b!1395503 (= e!790042 (bvsge (x!125631 lt!612842) #b01111111111111111111111111111110))))

(declare-fun b!1395504 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395504 (= e!790043 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!612817 #b00000000000000000000000000000000 mask!2840) (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95401 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901)) mask!2840))))

(declare-fun d!150595 () Bool)

(assert (=> d!150595 e!790042))

(declare-fun c!129815 () Bool)

(assert (=> d!150595 (= c!129815 (and ((_ is Intermediate!10400) lt!612842) (undefined!11212 lt!612842)))))

(assert (=> d!150595 (= lt!612842 e!790041)))

(declare-fun c!129817 () Bool)

(assert (=> d!150595 (= c!129817 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150595 (= lt!612841 (select (arr!46057 (array!95401 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901))) lt!612817))))

(assert (=> d!150595 (validMask!0 mask!2840)))

(assert (=> d!150595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612817 (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95401 (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901)) mask!2840) lt!612842)))

(declare-fun b!1395500 () Bool)

(assert (=> b!1395500 (= e!790043 (Intermediate!10400 false lt!612817 #b00000000000000000000000000000000))))

(assert (= (and d!150595 c!129817) b!1395497))

(assert (= (and d!150595 (not c!129817)) b!1395499))

(assert (= (and b!1395499 c!129816) b!1395500))

(assert (= (and b!1395499 (not c!129816)) b!1395504))

(assert (= (and d!150595 c!129815) b!1395503))

(assert (= (and d!150595 (not c!129815)) b!1395502))

(assert (= (and b!1395502 res!934779) b!1395501))

(assert (= (and b!1395501 (not res!934778)) b!1395496))

(assert (= (and b!1395496 (not res!934780)) b!1395498))

(declare-fun m!1281565 () Bool)

(assert (=> b!1395498 m!1281565))

(assert (=> b!1395496 m!1281565))

(assert (=> b!1395501 m!1281565))

(declare-fun m!1281567 () Bool)

(assert (=> d!150595 m!1281567))

(assert (=> d!150595 m!1281463))

(declare-fun m!1281569 () Bool)

(assert (=> b!1395504 m!1281569))

(assert (=> b!1395504 m!1281569))

(assert (=> b!1395504 m!1281491))

(declare-fun m!1281571 () Bool)

(assert (=> b!1395504 m!1281571))

(assert (=> b!1395417 d!150595))

(declare-fun d!150603 () Bool)

(declare-fun lt!612848 () (_ BitVec 32))

(declare-fun lt!612847 () (_ BitVec 32))

(assert (=> d!150603 (= lt!612848 (bvmul (bvxor lt!612847 (bvlshr lt!612847 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150603 (= lt!612847 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150603 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934781 (let ((h!33889 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125635 (bvmul (bvxor h!33889 (bvlshr h!33889 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125635 (bvlshr x!125635 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934781 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934781 #b00000000000000000000000000000000))))))

(assert (=> d!150603 (= (toIndex!0 (select (store (arr!46057 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!612848 (bvlshr lt!612848 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1395417 d!150603))

(declare-fun e!790103 () SeekEntryResult!10400)

(declare-fun lt!612883 () SeekEntryResult!10400)

(declare-fun b!1395590 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95400 (_ BitVec 32)) SeekEntryResult!10400)

(assert (=> b!1395590 (= e!790103 (seekKeyOrZeroReturnVacant!0 (x!125631 lt!612883) (index!43973 lt!612883) (index!43973 lt!612883) (select (arr!46057 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395591 () Bool)

(declare-fun e!790101 () SeekEntryResult!10400)

(declare-fun e!790102 () SeekEntryResult!10400)

(assert (=> b!1395591 (= e!790101 e!790102)))

(declare-fun lt!612882 () (_ BitVec 64))

(assert (=> b!1395591 (= lt!612882 (select (arr!46057 a!2901) (index!43973 lt!612883)))))

(declare-fun c!129845 () Bool)

(assert (=> b!1395591 (= c!129845 (= lt!612882 (select (arr!46057 a!2901) j!112)))))

(declare-fun b!1395592 () Bool)

(declare-fun c!129846 () Bool)

(assert (=> b!1395592 (= c!129846 (= lt!612882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395592 (= e!790102 e!790103)))

(declare-fun d!150609 () Bool)

(declare-fun lt!612884 () SeekEntryResult!10400)

(assert (=> d!150609 (and (or ((_ is Undefined!10400) lt!612884) (not ((_ is Found!10400) lt!612884)) (and (bvsge (index!43972 lt!612884) #b00000000000000000000000000000000) (bvslt (index!43972 lt!612884) (size!46609 a!2901)))) (or ((_ is Undefined!10400) lt!612884) ((_ is Found!10400) lt!612884) (not ((_ is MissingZero!10400) lt!612884)) (and (bvsge (index!43971 lt!612884) #b00000000000000000000000000000000) (bvslt (index!43971 lt!612884) (size!46609 a!2901)))) (or ((_ is Undefined!10400) lt!612884) ((_ is Found!10400) lt!612884) ((_ is MissingZero!10400) lt!612884) (not ((_ is MissingVacant!10400) lt!612884)) (and (bvsge (index!43974 lt!612884) #b00000000000000000000000000000000) (bvslt (index!43974 lt!612884) (size!46609 a!2901)))) (or ((_ is Undefined!10400) lt!612884) (ite ((_ is Found!10400) lt!612884) (= (select (arr!46057 a!2901) (index!43972 lt!612884)) (select (arr!46057 a!2901) j!112)) (ite ((_ is MissingZero!10400) lt!612884) (= (select (arr!46057 a!2901) (index!43971 lt!612884)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10400) lt!612884) (= (select (arr!46057 a!2901) (index!43974 lt!612884)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150609 (= lt!612884 e!790101)))

(declare-fun c!129847 () Bool)

(assert (=> d!150609 (= c!129847 (and ((_ is Intermediate!10400) lt!612883) (undefined!11212 lt!612883)))))

(assert (=> d!150609 (= lt!612883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46057 a!2901) j!112) mask!2840) (select (arr!46057 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150609 (validMask!0 mask!2840)))

(assert (=> d!150609 (= (seekEntryOrOpen!0 (select (arr!46057 a!2901) j!112) a!2901 mask!2840) lt!612884)))

(declare-fun b!1395589 () Bool)

(assert (=> b!1395589 (= e!790101 Undefined!10400)))

(declare-fun b!1395593 () Bool)

(assert (=> b!1395593 (= e!790103 (MissingZero!10400 (index!43973 lt!612883)))))

(declare-fun b!1395594 () Bool)

(assert (=> b!1395594 (= e!790102 (Found!10400 (index!43973 lt!612883)))))

(assert (= (and d!150609 c!129847) b!1395589))

(assert (= (and d!150609 (not c!129847)) b!1395591))

(assert (= (and b!1395591 c!129845) b!1395594))

(assert (= (and b!1395591 (not c!129845)) b!1395592))

(assert (= (and b!1395592 c!129846) b!1395593))

(assert (= (and b!1395592 (not c!129846)) b!1395590))

(assert (=> b!1395590 m!1281467))

(declare-fun m!1281615 () Bool)

(assert (=> b!1395590 m!1281615))

(declare-fun m!1281617 () Bool)

(assert (=> b!1395591 m!1281617))

(assert (=> d!150609 m!1281463))

(declare-fun m!1281619 () Bool)

(assert (=> d!150609 m!1281619))

(declare-fun m!1281621 () Bool)

(assert (=> d!150609 m!1281621))

(assert (=> d!150609 m!1281475))

(assert (=> d!150609 m!1281467))

(assert (=> d!150609 m!1281479))

(declare-fun m!1281623 () Bool)

(assert (=> d!150609 m!1281623))

(assert (=> d!150609 m!1281467))

(assert (=> d!150609 m!1281475))

(assert (=> b!1395421 d!150609))

(declare-fun b!1395639 () Bool)

(declare-fun e!790130 () Bool)

(declare-fun call!66818 () Bool)

(assert (=> b!1395639 (= e!790130 call!66818)))

(declare-fun b!1395640 () Bool)

(declare-fun e!790131 () Bool)

(assert (=> b!1395640 (= e!790130 e!790131)))

(declare-fun lt!612899 () (_ BitVec 64))

(assert (=> b!1395640 (= lt!612899 (select (arr!46057 a!2901) j!112))))

(declare-fun lt!612900 () Unit!46647)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95400 (_ BitVec 64) (_ BitVec 32)) Unit!46647)

(assert (=> b!1395640 (= lt!612900 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612899 j!112))))

(declare-fun arrayContainsKey!0 (array!95400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1395640 (arrayContainsKey!0 a!2901 lt!612899 #b00000000000000000000000000000000)))

(declare-fun lt!612901 () Unit!46647)

(assert (=> b!1395640 (= lt!612901 lt!612900)))

(declare-fun res!934829 () Bool)

(assert (=> b!1395640 (= res!934829 (= (seekEntryOrOpen!0 (select (arr!46057 a!2901) j!112) a!2901 mask!2840) (Found!10400 j!112)))))

(assert (=> b!1395640 (=> (not res!934829) (not e!790131))))

(declare-fun b!1395641 () Bool)

(assert (=> b!1395641 (= e!790131 call!66818)))

(declare-fun b!1395642 () Bool)

(declare-fun e!790132 () Bool)

(assert (=> b!1395642 (= e!790132 e!790130)))

(declare-fun c!129862 () Bool)

(assert (=> b!1395642 (= c!129862 (validKeyInArray!0 (select (arr!46057 a!2901) j!112)))))

(declare-fun bm!66815 () Bool)

(assert (=> bm!66815 (= call!66818 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150621 () Bool)

(declare-fun res!934828 () Bool)

(assert (=> d!150621 (=> res!934828 e!790132)))

(assert (=> d!150621 (= res!934828 (bvsge j!112 (size!46609 a!2901)))))

(assert (=> d!150621 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!790132)))

(assert (= (and d!150621 (not res!934828)) b!1395642))

(assert (= (and b!1395642 c!129862) b!1395640))

(assert (= (and b!1395642 (not c!129862)) b!1395639))

(assert (= (and b!1395640 res!934829) b!1395641))

(assert (= (or b!1395641 b!1395639) bm!66815))

(assert (=> b!1395640 m!1281467))

(declare-fun m!1281625 () Bool)

(assert (=> b!1395640 m!1281625))

(declare-fun m!1281627 () Bool)

(assert (=> b!1395640 m!1281627))

(assert (=> b!1395640 m!1281467))

(assert (=> b!1395640 m!1281471))

(assert (=> b!1395642 m!1281467))

(assert (=> b!1395642 m!1281467))

(assert (=> b!1395642 m!1281469))

(declare-fun m!1281637 () Bool)

(assert (=> bm!66815 m!1281637))

(assert (=> b!1395416 d!150621))

(declare-fun d!150623 () Bool)

(assert (=> d!150623 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612917 () Unit!46647)

(declare-fun choose!38 (array!95400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46647)

(assert (=> d!150623 (= lt!612917 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150623 (validMask!0 mask!2840)))

(assert (=> d!150623 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!612917)))

(declare-fun bs!40588 () Bool)

(assert (= bs!40588 d!150623))

(assert (=> bs!40588 m!1281481))

(declare-fun m!1281653 () Bool)

(assert (=> bs!40588 m!1281653))

(assert (=> bs!40588 m!1281463))

(assert (=> b!1395416 d!150623))

(declare-fun b!1395665 () Bool)

(declare-fun lt!612919 () SeekEntryResult!10400)

(assert (=> b!1395665 (and (bvsge (index!43973 lt!612919) #b00000000000000000000000000000000) (bvslt (index!43973 lt!612919) (size!46609 a!2901)))))

(declare-fun res!934842 () Bool)

(assert (=> b!1395665 (= res!934842 (= (select (arr!46057 a!2901) (index!43973 lt!612919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790146 () Bool)

(assert (=> b!1395665 (=> res!934842 e!790146)))

(declare-fun b!1395666 () Bool)

(declare-fun e!790148 () SeekEntryResult!10400)

(assert (=> b!1395666 (= e!790148 (Intermediate!10400 true (toIndex!0 (select (arr!46057 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395667 () Bool)

(assert (=> b!1395667 (and (bvsge (index!43973 lt!612919) #b00000000000000000000000000000000) (bvslt (index!43973 lt!612919) (size!46609 a!2901)))))

(assert (=> b!1395667 (= e!790146 (= (select (arr!46057 a!2901) (index!43973 lt!612919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395668 () Bool)

(declare-fun e!790150 () SeekEntryResult!10400)

(assert (=> b!1395668 (= e!790148 e!790150)))

(declare-fun lt!612918 () (_ BitVec 64))

(declare-fun c!129871 () Bool)

(assert (=> b!1395668 (= c!129871 (or (= lt!612918 (select (arr!46057 a!2901) j!112)) (= (bvadd lt!612918 lt!612918) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395670 () Bool)

(assert (=> b!1395670 (and (bvsge (index!43973 lt!612919) #b00000000000000000000000000000000) (bvslt (index!43973 lt!612919) (size!46609 a!2901)))))

(declare-fun res!934840 () Bool)

(assert (=> b!1395670 (= res!934840 (= (select (arr!46057 a!2901) (index!43973 lt!612919)) (select (arr!46057 a!2901) j!112)))))

(assert (=> b!1395670 (=> res!934840 e!790146)))

(declare-fun e!790147 () Bool)

(assert (=> b!1395670 (= e!790147 e!790146)))

(declare-fun b!1395671 () Bool)

(declare-fun e!790149 () Bool)

(assert (=> b!1395671 (= e!790149 e!790147)))

(declare-fun res!934841 () Bool)

(assert (=> b!1395671 (= res!934841 (and ((_ is Intermediate!10400) lt!612919) (not (undefined!11212 lt!612919)) (bvslt (x!125631 lt!612919) #b01111111111111111111111111111110) (bvsge (x!125631 lt!612919) #b00000000000000000000000000000000) (bvsge (x!125631 lt!612919) #b00000000000000000000000000000000)))))

(assert (=> b!1395671 (=> (not res!934841) (not e!790147))))

(declare-fun b!1395672 () Bool)

(assert (=> b!1395672 (= e!790149 (bvsge (x!125631 lt!612919) #b01111111111111111111111111111110))))

(declare-fun b!1395673 () Bool)

(assert (=> b!1395673 (= e!790150 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46057 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46057 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!150633 () Bool)

(assert (=> d!150633 e!790149))

(declare-fun c!129870 () Bool)

(assert (=> d!150633 (= c!129870 (and ((_ is Intermediate!10400) lt!612919) (undefined!11212 lt!612919)))))

(assert (=> d!150633 (= lt!612919 e!790148)))

(declare-fun c!129872 () Bool)

(assert (=> d!150633 (= c!129872 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150633 (= lt!612918 (select (arr!46057 a!2901) (toIndex!0 (select (arr!46057 a!2901) j!112) mask!2840)))))

(assert (=> d!150633 (validMask!0 mask!2840)))

(assert (=> d!150633 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46057 a!2901) j!112) mask!2840) (select (arr!46057 a!2901) j!112) a!2901 mask!2840) lt!612919)))

(declare-fun b!1395669 () Bool)

(assert (=> b!1395669 (= e!790150 (Intermediate!10400 false (toIndex!0 (select (arr!46057 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!150633 c!129872) b!1395666))

(assert (= (and d!150633 (not c!129872)) b!1395668))

(assert (= (and b!1395668 c!129871) b!1395669))

(assert (= (and b!1395668 (not c!129871)) b!1395673))

(assert (= (and d!150633 c!129870) b!1395672))

(assert (= (and d!150633 (not c!129870)) b!1395671))

(assert (= (and b!1395671 res!934841) b!1395670))

(assert (= (and b!1395670 (not res!934840)) b!1395665))

(assert (= (and b!1395665 (not res!934842)) b!1395667))

(declare-fun m!1281655 () Bool)

(assert (=> b!1395667 m!1281655))

(assert (=> b!1395665 m!1281655))

(assert (=> b!1395670 m!1281655))

(assert (=> d!150633 m!1281475))

(declare-fun m!1281657 () Bool)

(assert (=> d!150633 m!1281657))

(assert (=> d!150633 m!1281463))

(assert (=> b!1395673 m!1281475))

(declare-fun m!1281659 () Bool)

(assert (=> b!1395673 m!1281659))

(assert (=> b!1395673 m!1281659))

(assert (=> b!1395673 m!1281467))

(declare-fun m!1281661 () Bool)

(assert (=> b!1395673 m!1281661))

(assert (=> b!1395416 d!150633))

(declare-fun d!150635 () Bool)

(declare-fun lt!612923 () (_ BitVec 32))

(declare-fun lt!612922 () (_ BitVec 32))

(assert (=> d!150635 (= lt!612923 (bvmul (bvxor lt!612922 (bvlshr lt!612922 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150635 (= lt!612922 ((_ extract 31 0) (bvand (bvxor (select (arr!46057 a!2901) j!112) (bvlshr (select (arr!46057 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150635 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934781 (let ((h!33889 ((_ extract 31 0) (bvand (bvxor (select (arr!46057 a!2901) j!112) (bvlshr (select (arr!46057 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125635 (bvmul (bvxor h!33889 (bvlshr h!33889 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125635 (bvlshr x!125635 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934781 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934781 #b00000000000000000000000000000000))))))

(assert (=> d!150635 (= (toIndex!0 (select (arr!46057 a!2901) j!112) mask!2840) (bvand (bvxor lt!612923 (bvlshr lt!612923 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1395416 d!150635))

(declare-fun d!150637 () Bool)

(assert (=> d!150637 (= (validKeyInArray!0 (select (arr!46057 a!2901) j!112)) (and (not (= (select (arr!46057 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46057 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1395415 d!150637))

(declare-fun d!150641 () Bool)

(assert (=> d!150641 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119816 d!150641))

(declare-fun d!150659 () Bool)

(assert (=> d!150659 (= (array_inv!35290 a!2901) (bvsge (size!46609 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119816 d!150659))

(declare-fun b!1395696 () Bool)

(declare-fun e!790164 () Bool)

(declare-fun call!66821 () Bool)

(assert (=> b!1395696 (= e!790164 call!66821)))

(declare-fun b!1395697 () Bool)

(declare-fun e!790165 () Bool)

(assert (=> b!1395697 (= e!790164 e!790165)))

(declare-fun lt!612945 () (_ BitVec 64))

(assert (=> b!1395697 (= lt!612945 (select (arr!46057 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!612946 () Unit!46647)

(assert (=> b!1395697 (= lt!612946 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612945 #b00000000000000000000000000000000))))

(assert (=> b!1395697 (arrayContainsKey!0 a!2901 lt!612945 #b00000000000000000000000000000000)))

(declare-fun lt!612947 () Unit!46647)

(assert (=> b!1395697 (= lt!612947 lt!612946)))

(declare-fun res!934852 () Bool)

(assert (=> b!1395697 (= res!934852 (= (seekEntryOrOpen!0 (select (arr!46057 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10400 #b00000000000000000000000000000000)))))

(assert (=> b!1395697 (=> (not res!934852) (not e!790165))))

(declare-fun b!1395698 () Bool)

(assert (=> b!1395698 (= e!790165 call!66821)))

(declare-fun b!1395699 () Bool)

(declare-fun e!790166 () Bool)

(assert (=> b!1395699 (= e!790166 e!790164)))

(declare-fun c!129880 () Bool)

(assert (=> b!1395699 (= c!129880 (validKeyInArray!0 (select (arr!46057 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66818 () Bool)

(assert (=> bm!66818 (= call!66821 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150661 () Bool)

(declare-fun res!934851 () Bool)

(assert (=> d!150661 (=> res!934851 e!790166)))

(assert (=> d!150661 (= res!934851 (bvsge #b00000000000000000000000000000000 (size!46609 a!2901)))))

(assert (=> d!150661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!790166)))

(assert (= (and d!150661 (not res!934851)) b!1395699))

(assert (= (and b!1395699 c!129880) b!1395697))

(assert (= (and b!1395699 (not c!129880)) b!1395696))

(assert (= (and b!1395697 res!934852) b!1395698))

(assert (= (or b!1395698 b!1395696) bm!66818))

(declare-fun m!1281689 () Bool)

(assert (=> b!1395697 m!1281689))

(declare-fun m!1281691 () Bool)

(assert (=> b!1395697 m!1281691))

(declare-fun m!1281693 () Bool)

(assert (=> b!1395697 m!1281693))

(assert (=> b!1395697 m!1281689))

(declare-fun m!1281695 () Bool)

(assert (=> b!1395697 m!1281695))

(assert (=> b!1395699 m!1281689))

(assert (=> b!1395699 m!1281689))

(declare-fun m!1281697 () Bool)

(assert (=> b!1395699 m!1281697))

(declare-fun m!1281699 () Bool)

(assert (=> bm!66818 m!1281699))

(assert (=> b!1395420 d!150661))

(declare-fun d!150663 () Bool)

(assert (=> d!150663 (= (validKeyInArray!0 (select (arr!46057 a!2901) i!1037)) (and (not (= (select (arr!46057 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46057 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1395419 d!150663))

(declare-fun bm!66821 () Bool)

(declare-fun call!66824 () Bool)

(declare-fun c!129883 () Bool)

(assert (=> bm!66821 (= call!66824 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129883 (Cons!32650 (select (arr!46057 a!2901) #b00000000000000000000000000000000) Nil!32651) Nil!32651)))))

(declare-fun b!1395710 () Bool)

(declare-fun e!790178 () Bool)

(assert (=> b!1395710 (= e!790178 call!66824)))

(declare-fun b!1395711 () Bool)

(declare-fun e!790177 () Bool)

(assert (=> b!1395711 (= e!790177 e!790178)))

(assert (=> b!1395711 (= c!129883 (validKeyInArray!0 (select (arr!46057 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150665 () Bool)

(declare-fun res!934861 () Bool)

(declare-fun e!790175 () Bool)

(assert (=> d!150665 (=> res!934861 e!790175)))

(assert (=> d!150665 (= res!934861 (bvsge #b00000000000000000000000000000000 (size!46609 a!2901)))))

(assert (=> d!150665 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32651) e!790175)))

(declare-fun b!1395712 () Bool)

(declare-fun e!790176 () Bool)

(declare-fun contains!9741 (List!32654 (_ BitVec 64)) Bool)

(assert (=> b!1395712 (= e!790176 (contains!9741 Nil!32651 (select (arr!46057 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395713 () Bool)

(assert (=> b!1395713 (= e!790175 e!790177)))

(declare-fun res!934860 () Bool)

(assert (=> b!1395713 (=> (not res!934860) (not e!790177))))

(assert (=> b!1395713 (= res!934860 (not e!790176))))

(declare-fun res!934859 () Bool)

(assert (=> b!1395713 (=> (not res!934859) (not e!790176))))

(assert (=> b!1395713 (= res!934859 (validKeyInArray!0 (select (arr!46057 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395714 () Bool)

(assert (=> b!1395714 (= e!790178 call!66824)))

(assert (= (and d!150665 (not res!934861)) b!1395713))

(assert (= (and b!1395713 res!934859) b!1395712))

(assert (= (and b!1395713 res!934860) b!1395711))

(assert (= (and b!1395711 c!129883) b!1395710))

(assert (= (and b!1395711 (not c!129883)) b!1395714))

(assert (= (or b!1395710 b!1395714) bm!66821))

(assert (=> bm!66821 m!1281689))

(declare-fun m!1281701 () Bool)

(assert (=> bm!66821 m!1281701))

(assert (=> b!1395711 m!1281689))

(assert (=> b!1395711 m!1281689))

(assert (=> b!1395711 m!1281697))

(assert (=> b!1395712 m!1281689))

(assert (=> b!1395712 m!1281689))

(declare-fun m!1281703 () Bool)

(assert (=> b!1395712 m!1281703))

(assert (=> b!1395713 m!1281689))

(assert (=> b!1395713 m!1281689))

(assert (=> b!1395713 m!1281697))

(assert (=> b!1395418 d!150665))

(check-sat (not d!150633) (not b!1395673) (not b!1395713) (not bm!66821) (not b!1395590) (not b!1395642) (not b!1395711) (not b!1395697) (not b!1395504) (not d!150595) (not b!1395712) (not d!150623) (not bm!66818) (not d!150609) (not bm!66815) (not b!1395640) (not b!1395699))
(check-sat)
