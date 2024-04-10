; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45660 () Bool)

(assert start!45660)

(declare-fun b!503758 () Bool)

(declare-datatypes ((Unit!15296 0))(
  ( (Unit!15297) )
))
(declare-fun e!294998 () Unit!15296)

(declare-fun Unit!15298 () Unit!15296)

(assert (=> b!503758 (= e!294998 Unit!15298)))

(declare-fun b!503760 () Bool)

(declare-fun res!305028 () Bool)

(declare-fun e!294996 () Bool)

(assert (=> b!503760 (=> res!305028 e!294996)))

(declare-fun e!294992 () Bool)

(assert (=> b!503760 (= res!305028 e!294992)))

(declare-fun res!305026 () Bool)

(assert (=> b!503760 (=> (not res!305026) (not e!294992))))

(declare-datatypes ((SeekEntryResult!4055 0))(
  ( (MissingZero!4055 (index!18408 (_ BitVec 32))) (Found!4055 (index!18409 (_ BitVec 32))) (Intermediate!4055 (undefined!4867 Bool) (index!18410 (_ BitVec 32)) (x!47432 (_ BitVec 32))) (Undefined!4055) (MissingVacant!4055 (index!18411 (_ BitVec 32))) )
))
(declare-fun lt!229234 () SeekEntryResult!4055)

(assert (=> b!503760 (= res!305026 (bvsgt #b00000000000000000000000000000000 (x!47432 lt!229234)))))

(declare-fun b!503761 () Bool)

(declare-fun Unit!15299 () Unit!15296)

(assert (=> b!503761 (= e!294998 Unit!15299)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32416 0))(
  ( (array!32417 (arr!15588 (Array (_ BitVec 32) (_ BitVec 64))) (size!15952 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32416)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!229232 () Unit!15296)

(declare-fun lt!229239 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32416 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15296)

(assert (=> b!503761 (= lt!229232 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229239 #b00000000000000000000000000000000 (index!18410 lt!229234) (x!47432 lt!229234) mask!3524))))

(declare-fun lt!229240 () array!32416)

(declare-fun res!305029 () Bool)

(declare-fun lt!229238 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32416 (_ BitVec 32)) SeekEntryResult!4055)

(assert (=> b!503761 (= res!305029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229239 lt!229238 lt!229240 mask!3524) (Intermediate!4055 false (index!18410 lt!229234) (x!47432 lt!229234))))))

(declare-fun e!294991 () Bool)

(assert (=> b!503761 (=> (not res!305029) (not e!294991))))

(assert (=> b!503761 e!294991))

(declare-fun b!503762 () Bool)

(assert (=> b!503762 (= e!294996 true)))

(declare-fun lt!229235 () SeekEntryResult!4055)

(assert (=> b!503762 (= lt!229235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229239 lt!229238 lt!229240 mask!3524))))

(declare-fun b!503763 () Bool)

(declare-fun res!305023 () Bool)

(declare-fun e!294997 () Bool)

(assert (=> b!503763 (=> (not res!305023) (not e!294997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32416 (_ BitVec 32)) Bool)

(assert (=> b!503763 (= res!305023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503764 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32416 (_ BitVec 32)) SeekEntryResult!4055)

(assert (=> b!503764 (= e!294992 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229239 (index!18410 lt!229234) (select (arr!15588 a!3235) j!176) a!3235 mask!3524) (Found!4055 j!176))))))

(declare-fun b!503765 () Bool)

(declare-fun res!305019 () Bool)

(assert (=> b!503765 (=> (not res!305019) (not e!294997))))

(declare-datatypes ((List!9746 0))(
  ( (Nil!9743) (Cons!9742 (h!10619 (_ BitVec 64)) (t!15974 List!9746)) )
))
(declare-fun arrayNoDuplicates!0 (array!32416 (_ BitVec 32) List!9746) Bool)

(assert (=> b!503765 (= res!305019 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9743))))

(declare-fun b!503766 () Bool)

(declare-fun e!294995 () Bool)

(assert (=> b!503766 (= e!294995 e!294996)))

(declare-fun res!305020 () Bool)

(assert (=> b!503766 (=> res!305020 e!294996)))

(assert (=> b!503766 (= res!305020 (or (bvsgt (x!47432 lt!229234) #b01111111111111111111111111111110) (bvslt lt!229239 #b00000000000000000000000000000000) (bvsge lt!229239 (size!15952 a!3235)) (bvslt (index!18410 lt!229234) #b00000000000000000000000000000000) (bvsge (index!18410 lt!229234) (size!15952 a!3235)) (not (= lt!229234 (Intermediate!4055 false (index!18410 lt!229234) (x!47432 lt!229234))))))))

(assert (=> b!503766 (= (index!18410 lt!229234) i!1204)))

(declare-fun lt!229233 () Unit!15296)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32416 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15296)

(assert (=> b!503766 (= lt!229233 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229239 #b00000000000000000000000000000000 (index!18410 lt!229234) (x!47432 lt!229234) mask!3524))))

(assert (=> b!503766 (and (or (= (select (arr!15588 a!3235) (index!18410 lt!229234)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15588 a!3235) (index!18410 lt!229234)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15588 a!3235) (index!18410 lt!229234)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15588 a!3235) (index!18410 lt!229234)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229230 () Unit!15296)

(assert (=> b!503766 (= lt!229230 e!294998)))

(declare-fun c!59648 () Bool)

(assert (=> b!503766 (= c!59648 (= (select (arr!15588 a!3235) (index!18410 lt!229234)) (select (arr!15588 a!3235) j!176)))))

(assert (=> b!503766 (and (bvslt (x!47432 lt!229234) #b01111111111111111111111111111110) (or (= (select (arr!15588 a!3235) (index!18410 lt!229234)) (select (arr!15588 a!3235) j!176)) (= (select (arr!15588 a!3235) (index!18410 lt!229234)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15588 a!3235) (index!18410 lt!229234)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503767 () Bool)

(declare-fun res!305032 () Bool)

(declare-fun e!294994 () Bool)

(assert (=> b!503767 (=> (not res!305032) (not e!294994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503767 (= res!305032 (validKeyInArray!0 k!2280))))

(declare-fun b!503768 () Bool)

(declare-fun res!305031 () Bool)

(assert (=> b!503768 (=> (not res!305031) (not e!294994))))

(assert (=> b!503768 (= res!305031 (validKeyInArray!0 (select (arr!15588 a!3235) j!176)))))

(declare-fun b!503769 () Bool)

(declare-fun e!294999 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32416 (_ BitVec 32)) SeekEntryResult!4055)

(assert (=> b!503769 (= e!294999 (= (seekEntryOrOpen!0 (select (arr!15588 a!3235) j!176) a!3235 mask!3524) (Found!4055 j!176)))))

(declare-fun b!503770 () Bool)

(assert (=> b!503770 (= e!294991 false)))

(declare-fun b!503771 () Bool)

(declare-fun res!305021 () Bool)

(assert (=> b!503771 (=> res!305021 e!294995)))

(assert (=> b!503771 (= res!305021 (or (undefined!4867 lt!229234) (not (is-Intermediate!4055 lt!229234))))))

(declare-fun b!503759 () Bool)

(assert (=> b!503759 (= e!294997 (not e!294995))))

(declare-fun res!305033 () Bool)

(assert (=> b!503759 (=> res!305033 e!294995)))

(declare-fun lt!229236 () (_ BitVec 32))

(assert (=> b!503759 (= res!305033 (= lt!229234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229236 lt!229238 lt!229240 mask!3524)))))

(assert (=> b!503759 (= lt!229234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229239 (select (arr!15588 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503759 (= lt!229236 (toIndex!0 lt!229238 mask!3524))))

(assert (=> b!503759 (= lt!229238 (select (store (arr!15588 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503759 (= lt!229239 (toIndex!0 (select (arr!15588 a!3235) j!176) mask!3524))))

(assert (=> b!503759 (= lt!229240 (array!32417 (store (arr!15588 a!3235) i!1204 k!2280) (size!15952 a!3235)))))

(assert (=> b!503759 e!294999))

(declare-fun res!305030 () Bool)

(assert (=> b!503759 (=> (not res!305030) (not e!294999))))

(assert (=> b!503759 (= res!305030 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229237 () Unit!15296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15296)

(assert (=> b!503759 (= lt!229237 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!305024 () Bool)

(assert (=> start!45660 (=> (not res!305024) (not e!294994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45660 (= res!305024 (validMask!0 mask!3524))))

(assert (=> start!45660 e!294994))

(assert (=> start!45660 true))

(declare-fun array_inv!11384 (array!32416) Bool)

(assert (=> start!45660 (array_inv!11384 a!3235)))

(declare-fun b!503772 () Bool)

(declare-fun res!305025 () Bool)

(assert (=> b!503772 (=> (not res!305025) (not e!294994))))

(assert (=> b!503772 (= res!305025 (and (= (size!15952 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15952 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15952 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503773 () Bool)

(assert (=> b!503773 (= e!294994 e!294997)))

(declare-fun res!305022 () Bool)

(assert (=> b!503773 (=> (not res!305022) (not e!294997))))

(declare-fun lt!229231 () SeekEntryResult!4055)

(assert (=> b!503773 (= res!305022 (or (= lt!229231 (MissingZero!4055 i!1204)) (= lt!229231 (MissingVacant!4055 i!1204))))))

(assert (=> b!503773 (= lt!229231 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503774 () Bool)

(declare-fun res!305027 () Bool)

(assert (=> b!503774 (=> (not res!305027) (not e!294994))))

(declare-fun arrayContainsKey!0 (array!32416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503774 (= res!305027 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45660 res!305024) b!503772))

(assert (= (and b!503772 res!305025) b!503768))

(assert (= (and b!503768 res!305031) b!503767))

(assert (= (and b!503767 res!305032) b!503774))

(assert (= (and b!503774 res!305027) b!503773))

(assert (= (and b!503773 res!305022) b!503763))

(assert (= (and b!503763 res!305023) b!503765))

(assert (= (and b!503765 res!305019) b!503759))

(assert (= (and b!503759 res!305030) b!503769))

(assert (= (and b!503759 (not res!305033)) b!503771))

(assert (= (and b!503771 (not res!305021)) b!503766))

(assert (= (and b!503766 c!59648) b!503761))

(assert (= (and b!503766 (not c!59648)) b!503758))

(assert (= (and b!503761 res!305029) b!503770))

(assert (= (and b!503766 (not res!305020)) b!503760))

(assert (= (and b!503760 res!305026) b!503764))

(assert (= (and b!503760 (not res!305028)) b!503762))

(declare-fun m!484563 () Bool)

(assert (=> b!503766 m!484563))

(declare-fun m!484565 () Bool)

(assert (=> b!503766 m!484565))

(declare-fun m!484567 () Bool)

(assert (=> b!503766 m!484567))

(assert (=> b!503768 m!484567))

(assert (=> b!503768 m!484567))

(declare-fun m!484569 () Bool)

(assert (=> b!503768 m!484569))

(declare-fun m!484571 () Bool)

(assert (=> b!503767 m!484571))

(assert (=> b!503764 m!484567))

(assert (=> b!503764 m!484567))

(declare-fun m!484573 () Bool)

(assert (=> b!503764 m!484573))

(assert (=> b!503769 m!484567))

(assert (=> b!503769 m!484567))

(declare-fun m!484575 () Bool)

(assert (=> b!503769 m!484575))

(declare-fun m!484577 () Bool)

(assert (=> b!503761 m!484577))

(declare-fun m!484579 () Bool)

(assert (=> b!503761 m!484579))

(declare-fun m!484581 () Bool)

(assert (=> b!503763 m!484581))

(assert (=> b!503762 m!484579))

(declare-fun m!484583 () Bool)

(assert (=> start!45660 m!484583))

(declare-fun m!484585 () Bool)

(assert (=> start!45660 m!484585))

(declare-fun m!484587 () Bool)

(assert (=> b!503774 m!484587))

(declare-fun m!484589 () Bool)

(assert (=> b!503759 m!484589))

(declare-fun m!484591 () Bool)

(assert (=> b!503759 m!484591))

(declare-fun m!484593 () Bool)

(assert (=> b!503759 m!484593))

(assert (=> b!503759 m!484567))

(declare-fun m!484595 () Bool)

(assert (=> b!503759 m!484595))

(assert (=> b!503759 m!484567))

(declare-fun m!484597 () Bool)

(assert (=> b!503759 m!484597))

(assert (=> b!503759 m!484567))

(declare-fun m!484599 () Bool)

(assert (=> b!503759 m!484599))

(declare-fun m!484601 () Bool)

(assert (=> b!503759 m!484601))

(declare-fun m!484603 () Bool)

(assert (=> b!503759 m!484603))

(declare-fun m!484605 () Bool)

(assert (=> b!503765 m!484605))

(declare-fun m!484607 () Bool)

(assert (=> b!503773 m!484607))

(push 1)

