; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47370 () Bool)

(assert start!47370)

(declare-fun b!520719 () Bool)

(declare-fun res!318733 () Bool)

(declare-fun e!303816 () Bool)

(assert (=> b!520719 (=> (not res!318733) (not e!303816))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520719 (= res!318733 (validKeyInArray!0 k0!2280))))

(declare-fun b!520720 () Bool)

(declare-fun e!303822 () Bool)

(assert (=> b!520720 (= e!303822 false)))

(declare-fun b!520721 () Bool)

(declare-fun res!318730 () Bool)

(assert (=> b!520721 (=> (not res!318730) (not e!303816))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33206 0))(
  ( (array!33207 (arr!15959 (Array (_ BitVec 32) (_ BitVec 64))) (size!16324 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33206)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!520721 (= res!318730 (and (= (size!16324 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16324 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16324 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520722 () Bool)

(declare-fun res!318724 () Bool)

(declare-fun e!303820 () Bool)

(assert (=> b!520722 (=> (not res!318724) (not e!303820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33206 (_ BitVec 32)) Bool)

(assert (=> b!520722 (= res!318724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!318731 () Bool)

(assert (=> start!47370 (=> (not res!318731) (not e!303816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47370 (= res!318731 (validMask!0 mask!3524))))

(assert (=> start!47370 e!303816))

(assert (=> start!47370 true))

(declare-fun array_inv!11842 (array!33206) Bool)

(assert (=> start!47370 (array_inv!11842 a!3235)))

(declare-fun b!520723 () Bool)

(declare-datatypes ((Unit!16138 0))(
  ( (Unit!16139) )
))
(declare-fun e!303821 () Unit!16138)

(declare-fun Unit!16140 () Unit!16138)

(assert (=> b!520723 (= e!303821 Unit!16140)))

(declare-fun lt!238442 () Unit!16138)

(declare-fun lt!238438 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4423 0))(
  ( (MissingZero!4423 (index!19895 (_ BitVec 32))) (Found!4423 (index!19896 (_ BitVec 32))) (Intermediate!4423 (undefined!5235 Bool) (index!19897 (_ BitVec 32)) (x!48892 (_ BitVec 32))) (Undefined!4423) (MissingVacant!4423 (index!19898 (_ BitVec 32))) )
))
(declare-fun lt!238437 () SeekEntryResult!4423)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33206 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16138)

(assert (=> b!520723 (= lt!238442 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238438 #b00000000000000000000000000000000 (index!19897 lt!238437) (x!48892 lt!238437) mask!3524))))

(declare-fun lt!238440 () array!33206)

(declare-fun lt!238441 () (_ BitVec 64))

(declare-fun res!318734 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33206 (_ BitVec 32)) SeekEntryResult!4423)

(assert (=> b!520723 (= res!318734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238438 lt!238441 lt!238440 mask!3524) (Intermediate!4423 false (index!19897 lt!238437) (x!48892 lt!238437))))))

(assert (=> b!520723 (=> (not res!318734) (not e!303822))))

(assert (=> b!520723 e!303822))

(declare-fun b!520724 () Bool)

(assert (=> b!520724 (= e!303816 e!303820)))

(declare-fun res!318728 () Bool)

(assert (=> b!520724 (=> (not res!318728) (not e!303820))))

(declare-fun lt!238443 () SeekEntryResult!4423)

(assert (=> b!520724 (= res!318728 (or (= lt!238443 (MissingZero!4423 i!1204)) (= lt!238443 (MissingVacant!4423 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33206 (_ BitVec 32)) SeekEntryResult!4423)

(assert (=> b!520724 (= lt!238443 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520725 () Bool)

(declare-fun res!318725 () Bool)

(assert (=> b!520725 (=> (not res!318725) (not e!303820))))

(declare-datatypes ((List!10156 0))(
  ( (Nil!10153) (Cons!10152 (h!11074 (_ BitVec 64)) (t!16375 List!10156)) )
))
(declare-fun arrayNoDuplicates!0 (array!33206 (_ BitVec 32) List!10156) Bool)

(assert (=> b!520725 (= res!318725 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10153))))

(declare-fun b!520726 () Bool)

(declare-fun e!303818 () Bool)

(assert (=> b!520726 (= e!303818 (= (seekEntryOrOpen!0 (select (arr!15959 a!3235) j!176) a!3235 mask!3524) (Found!4423 j!176)))))

(declare-fun b!520727 () Bool)

(declare-fun res!318727 () Bool)

(assert (=> b!520727 (=> (not res!318727) (not e!303816))))

(assert (=> b!520727 (= res!318727 (validKeyInArray!0 (select (arr!15959 a!3235) j!176)))))

(declare-fun b!520728 () Bool)

(declare-fun res!318729 () Bool)

(declare-fun e!303819 () Bool)

(assert (=> b!520728 (=> res!318729 e!303819)))

(get-info :version)

(assert (=> b!520728 (= res!318729 (or (undefined!5235 lt!238437) (not ((_ is Intermediate!4423) lt!238437))))))

(declare-fun b!520729 () Bool)

(declare-fun res!318726 () Bool)

(assert (=> b!520729 (=> (not res!318726) (not e!303816))))

(declare-fun arrayContainsKey!0 (array!33206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520729 (= res!318726 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520730 () Bool)

(declare-fun Unit!16141 () Unit!16138)

(assert (=> b!520730 (= e!303821 Unit!16141)))

(declare-fun b!520731 () Bool)

(assert (=> b!520731 (= e!303820 (not e!303819))))

(declare-fun res!318732 () Bool)

(assert (=> b!520731 (=> res!318732 e!303819)))

(declare-fun lt!238436 () (_ BitVec 32))

(assert (=> b!520731 (= res!318732 (= lt!238437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238436 lt!238441 lt!238440 mask!3524)))))

(assert (=> b!520731 (= lt!238437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238438 (select (arr!15959 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520731 (= lt!238436 (toIndex!0 lt!238441 mask!3524))))

(assert (=> b!520731 (= lt!238441 (select (store (arr!15959 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520731 (= lt!238438 (toIndex!0 (select (arr!15959 a!3235) j!176) mask!3524))))

(assert (=> b!520731 (= lt!238440 (array!33207 (store (arr!15959 a!3235) i!1204 k0!2280) (size!16324 a!3235)))))

(assert (=> b!520731 e!303818))

(declare-fun res!318723 () Bool)

(assert (=> b!520731 (=> (not res!318723) (not e!303818))))

(assert (=> b!520731 (= res!318723 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238439 () Unit!16138)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16138)

(assert (=> b!520731 (= lt!238439 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520732 () Bool)

(assert (=> b!520732 (= e!303819 true)))

(assert (=> b!520732 (and (or (= (select (arr!15959 a!3235) (index!19897 lt!238437)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15959 a!3235) (index!19897 lt!238437)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15959 a!3235) (index!19897 lt!238437)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15959 a!3235) (index!19897 lt!238437)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238444 () Unit!16138)

(assert (=> b!520732 (= lt!238444 e!303821)))

(declare-fun c!61299 () Bool)

(assert (=> b!520732 (= c!61299 (= (select (arr!15959 a!3235) (index!19897 lt!238437)) (select (arr!15959 a!3235) j!176)))))

(assert (=> b!520732 (and (bvslt (x!48892 lt!238437) #b01111111111111111111111111111110) (or (= (select (arr!15959 a!3235) (index!19897 lt!238437)) (select (arr!15959 a!3235) j!176)) (= (select (arr!15959 a!3235) (index!19897 lt!238437)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15959 a!3235) (index!19897 lt!238437)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47370 res!318731) b!520721))

(assert (= (and b!520721 res!318730) b!520727))

(assert (= (and b!520727 res!318727) b!520719))

(assert (= (and b!520719 res!318733) b!520729))

(assert (= (and b!520729 res!318726) b!520724))

(assert (= (and b!520724 res!318728) b!520722))

(assert (= (and b!520722 res!318724) b!520725))

(assert (= (and b!520725 res!318725) b!520731))

(assert (= (and b!520731 res!318723) b!520726))

(assert (= (and b!520731 (not res!318732)) b!520728))

(assert (= (and b!520728 (not res!318729)) b!520732))

(assert (= (and b!520732 c!61299) b!520723))

(assert (= (and b!520732 (not c!61299)) b!520730))

(assert (= (and b!520723 res!318734) b!520720))

(declare-fun m!501151 () Bool)

(assert (=> b!520727 m!501151))

(assert (=> b!520727 m!501151))

(declare-fun m!501153 () Bool)

(assert (=> b!520727 m!501153))

(declare-fun m!501155 () Bool)

(assert (=> start!47370 m!501155))

(declare-fun m!501157 () Bool)

(assert (=> start!47370 m!501157))

(declare-fun m!501159 () Bool)

(assert (=> b!520724 m!501159))

(assert (=> b!520726 m!501151))

(assert (=> b!520726 m!501151))

(declare-fun m!501161 () Bool)

(assert (=> b!520726 m!501161))

(declare-fun m!501163 () Bool)

(assert (=> b!520731 m!501163))

(declare-fun m!501165 () Bool)

(assert (=> b!520731 m!501165))

(declare-fun m!501167 () Bool)

(assert (=> b!520731 m!501167))

(assert (=> b!520731 m!501151))

(declare-fun m!501169 () Bool)

(assert (=> b!520731 m!501169))

(assert (=> b!520731 m!501151))

(declare-fun m!501171 () Bool)

(assert (=> b!520731 m!501171))

(declare-fun m!501173 () Bool)

(assert (=> b!520731 m!501173))

(declare-fun m!501175 () Bool)

(assert (=> b!520731 m!501175))

(declare-fun m!501177 () Bool)

(assert (=> b!520731 m!501177))

(assert (=> b!520731 m!501151))

(declare-fun m!501179 () Bool)

(assert (=> b!520725 m!501179))

(declare-fun m!501181 () Bool)

(assert (=> b!520723 m!501181))

(declare-fun m!501183 () Bool)

(assert (=> b!520723 m!501183))

(declare-fun m!501185 () Bool)

(assert (=> b!520719 m!501185))

(declare-fun m!501187 () Bool)

(assert (=> b!520722 m!501187))

(declare-fun m!501189 () Bool)

(assert (=> b!520729 m!501189))

(declare-fun m!501191 () Bool)

(assert (=> b!520732 m!501191))

(assert (=> b!520732 m!501151))

(check-sat (not b!520727) (not b!520726) (not b!520723) (not b!520724) (not start!47370) (not b!520722) (not b!520731) (not b!520729) (not b!520719) (not b!520725))
(check-sat)
