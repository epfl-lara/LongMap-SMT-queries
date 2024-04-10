; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48028 () Bool)

(assert start!48028)

(declare-fun b!529078 () Bool)

(declare-fun e!308309 () Bool)

(assert (=> b!529078 (= e!308309 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!243844 () (_ BitVec 64))

(declare-datatypes ((array!33521 0))(
  ( (array!33522 (arr!16109 (Array (_ BitVec 32) (_ BitVec 64))) (size!16473 (_ BitVec 32))) )
))
(declare-fun lt!243834 () array!33521)

(declare-datatypes ((SeekEntryResult!4576 0))(
  ( (MissingZero!4576 (index!20528 (_ BitVec 32))) (Found!4576 (index!20529 (_ BitVec 32))) (Intermediate!4576 (undefined!5388 Bool) (index!20530 (_ BitVec 32)) (x!49496 (_ BitVec 32))) (Undefined!4576) (MissingVacant!4576 (index!20531 (_ BitVec 32))) )
))
(declare-fun lt!243836 () SeekEntryResult!4576)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33521 (_ BitVec 32)) SeekEntryResult!4576)

(assert (=> b!529078 (= (seekEntryOrOpen!0 lt!243844 lt!243834 mask!3524) lt!243836)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!16756 0))(
  ( (Unit!16757) )
))
(declare-fun lt!243838 () Unit!16756)

(declare-fun a!3235 () array!33521)

(declare-fun lt!243841 () SeekEntryResult!4576)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!243837 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16756)

(assert (=> b!529078 (= lt!243838 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!243837 #b00000000000000000000000000000000 (index!20530 lt!243841) (x!49496 lt!243841) mask!3524))))

(declare-fun e!308302 () Bool)

(declare-fun b!529079 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33521 (_ BitVec 32)) SeekEntryResult!4576)

(assert (=> b!529079 (= e!308302 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243837 (index!20530 lt!243841) (select (arr!16109 a!3235) j!176) a!3235 mask!3524) lt!243836)))))

(declare-fun b!529080 () Bool)

(declare-fun e!308304 () Bool)

(declare-fun e!308310 () Bool)

(assert (=> b!529080 (= e!308304 (not e!308310))))

(declare-fun res!324993 () Bool)

(assert (=> b!529080 (=> res!324993 e!308310)))

(declare-fun lt!243842 () SeekEntryResult!4576)

(assert (=> b!529080 (= res!324993 (or (= lt!243841 lt!243842) (undefined!5388 lt!243841) (not (is-Intermediate!4576 lt!243841))))))

(declare-fun lt!243840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33521 (_ BitVec 32)) SeekEntryResult!4576)

(assert (=> b!529080 (= lt!243842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243840 lt!243844 lt!243834 mask!3524))))

(assert (=> b!529080 (= lt!243841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243837 (select (arr!16109 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529080 (= lt!243840 (toIndex!0 lt!243844 mask!3524))))

(assert (=> b!529080 (= lt!243844 (select (store (arr!16109 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!529080 (= lt!243837 (toIndex!0 (select (arr!16109 a!3235) j!176) mask!3524))))

(assert (=> b!529080 (= lt!243834 (array!33522 (store (arr!16109 a!3235) i!1204 k!2280) (size!16473 a!3235)))))

(assert (=> b!529080 (= lt!243836 (Found!4576 j!176))))

(declare-fun e!308306 () Bool)

(assert (=> b!529080 e!308306))

(declare-fun res!324992 () Bool)

(assert (=> b!529080 (=> (not res!324992) (not e!308306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33521 (_ BitVec 32)) Bool)

(assert (=> b!529080 (= res!324992 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243833 () Unit!16756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16756)

(assert (=> b!529080 (= lt!243833 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529081 () Bool)

(assert (=> b!529081 (= e!308310 e!308309)))

(declare-fun res!324995 () Bool)

(assert (=> b!529081 (=> res!324995 e!308309)))

(assert (=> b!529081 (= res!324995 (or (bvsgt (x!49496 lt!243841) #b01111111111111111111111111111110) (bvslt lt!243837 #b00000000000000000000000000000000) (bvsge lt!243837 (size!16473 a!3235)) (bvslt (index!20530 lt!243841) #b00000000000000000000000000000000) (bvsge (index!20530 lt!243841) (size!16473 a!3235)) (not (= lt!243841 (Intermediate!4576 false (index!20530 lt!243841) (x!49496 lt!243841))))))))

(assert (=> b!529081 (= (index!20530 lt!243841) i!1204)))

(declare-fun lt!243839 () Unit!16756)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16756)

(assert (=> b!529081 (= lt!243839 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243837 #b00000000000000000000000000000000 (index!20530 lt!243841) (x!49496 lt!243841) mask!3524))))

(assert (=> b!529081 (and (or (= (select (arr!16109 a!3235) (index!20530 lt!243841)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16109 a!3235) (index!20530 lt!243841)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16109 a!3235) (index!20530 lt!243841)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16109 a!3235) (index!20530 lt!243841)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243843 () Unit!16756)

(declare-fun e!308303 () Unit!16756)

(assert (=> b!529081 (= lt!243843 e!308303)))

(declare-fun c!62354 () Bool)

(assert (=> b!529081 (= c!62354 (= (select (arr!16109 a!3235) (index!20530 lt!243841)) (select (arr!16109 a!3235) j!176)))))

(assert (=> b!529081 (and (bvslt (x!49496 lt!243841) #b01111111111111111111111111111110) (or (= (select (arr!16109 a!3235) (index!20530 lt!243841)) (select (arr!16109 a!3235) j!176)) (= (select (arr!16109 a!3235) (index!20530 lt!243841)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16109 a!3235) (index!20530 lt!243841)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529082 () Bool)

(declare-fun res!324997 () Bool)

(declare-fun e!308308 () Bool)

(assert (=> b!529082 (=> (not res!324997) (not e!308308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529082 (= res!324997 (validKeyInArray!0 k!2280))))

(declare-fun res!324989 () Bool)

(assert (=> start!48028 (=> (not res!324989) (not e!308308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48028 (= res!324989 (validMask!0 mask!3524))))

(assert (=> start!48028 e!308308))

(assert (=> start!48028 true))

(declare-fun array_inv!11905 (array!33521) Bool)

(assert (=> start!48028 (array_inv!11905 a!3235)))

(declare-fun b!529083 () Bool)

(declare-fun res!324998 () Bool)

(assert (=> b!529083 (=> (not res!324998) (not e!308304))))

(assert (=> b!529083 (= res!324998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529084 () Bool)

(declare-fun res!324987 () Bool)

(assert (=> b!529084 (=> (not res!324987) (not e!308308))))

(assert (=> b!529084 (= res!324987 (validKeyInArray!0 (select (arr!16109 a!3235) j!176)))))

(declare-fun b!529085 () Bool)

(declare-fun res!324999 () Bool)

(assert (=> b!529085 (=> res!324999 e!308309)))

(assert (=> b!529085 (= res!324999 (not (= lt!243842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243837 lt!243844 lt!243834 mask!3524))))))

(declare-fun b!529086 () Bool)

(declare-fun Unit!16758 () Unit!16756)

(assert (=> b!529086 (= e!308303 Unit!16758)))

(declare-fun lt!243835 () Unit!16756)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16756)

(assert (=> b!529086 (= lt!243835 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243837 #b00000000000000000000000000000000 (index!20530 lt!243841) (x!49496 lt!243841) mask!3524))))

(declare-fun res!324994 () Bool)

(assert (=> b!529086 (= res!324994 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243837 lt!243844 lt!243834 mask!3524) (Intermediate!4576 false (index!20530 lt!243841) (x!49496 lt!243841))))))

(declare-fun e!308305 () Bool)

(assert (=> b!529086 (=> (not res!324994) (not e!308305))))

(assert (=> b!529086 e!308305))

(declare-fun b!529087 () Bool)

(declare-fun res!324996 () Bool)

(assert (=> b!529087 (=> res!324996 e!308309)))

(assert (=> b!529087 (= res!324996 e!308302)))

(declare-fun res!324991 () Bool)

(assert (=> b!529087 (=> (not res!324991) (not e!308302))))

(assert (=> b!529087 (= res!324991 (bvsgt #b00000000000000000000000000000000 (x!49496 lt!243841)))))

(declare-fun b!529088 () Bool)

(assert (=> b!529088 (= e!308308 e!308304)))

(declare-fun res!324990 () Bool)

(assert (=> b!529088 (=> (not res!324990) (not e!308304))))

(declare-fun lt!243832 () SeekEntryResult!4576)

(assert (=> b!529088 (= res!324990 (or (= lt!243832 (MissingZero!4576 i!1204)) (= lt!243832 (MissingVacant!4576 i!1204))))))

(assert (=> b!529088 (= lt!243832 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!529089 () Bool)

(declare-fun Unit!16759 () Unit!16756)

(assert (=> b!529089 (= e!308303 Unit!16759)))

(declare-fun b!529090 () Bool)

(declare-fun res!324988 () Bool)

(assert (=> b!529090 (=> (not res!324988) (not e!308308))))

(assert (=> b!529090 (= res!324988 (and (= (size!16473 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16473 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16473 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529091 () Bool)

(assert (=> b!529091 (= e!308305 false)))

(declare-fun b!529092 () Bool)

(declare-fun res!325000 () Bool)

(assert (=> b!529092 (=> (not res!325000) (not e!308308))))

(declare-fun arrayContainsKey!0 (array!33521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529092 (= res!325000 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529093 () Bool)

(declare-fun res!325001 () Bool)

(assert (=> b!529093 (=> (not res!325001) (not e!308304))))

(declare-datatypes ((List!10267 0))(
  ( (Nil!10264) (Cons!10263 (h!11200 (_ BitVec 64)) (t!16495 List!10267)) )
))
(declare-fun arrayNoDuplicates!0 (array!33521 (_ BitVec 32) List!10267) Bool)

(assert (=> b!529093 (= res!325001 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10264))))

(declare-fun b!529094 () Bool)

(assert (=> b!529094 (= e!308306 (= (seekEntryOrOpen!0 (select (arr!16109 a!3235) j!176) a!3235 mask!3524) (Found!4576 j!176)))))

(assert (= (and start!48028 res!324989) b!529090))

(assert (= (and b!529090 res!324988) b!529084))

(assert (= (and b!529084 res!324987) b!529082))

(assert (= (and b!529082 res!324997) b!529092))

(assert (= (and b!529092 res!325000) b!529088))

(assert (= (and b!529088 res!324990) b!529083))

(assert (= (and b!529083 res!324998) b!529093))

(assert (= (and b!529093 res!325001) b!529080))

(assert (= (and b!529080 res!324992) b!529094))

(assert (= (and b!529080 (not res!324993)) b!529081))

(assert (= (and b!529081 c!62354) b!529086))

(assert (= (and b!529081 (not c!62354)) b!529089))

(assert (= (and b!529086 res!324994) b!529091))

(assert (= (and b!529081 (not res!324995)) b!529087))

(assert (= (and b!529087 res!324991) b!529079))

(assert (= (and b!529087 (not res!324996)) b!529085))

(assert (= (and b!529085 (not res!324999)) b!529078))

(declare-fun m!509605 () Bool)

(assert (=> b!529083 m!509605))

(declare-fun m!509607 () Bool)

(assert (=> b!529079 m!509607))

(assert (=> b!529079 m!509607))

(declare-fun m!509609 () Bool)

(assert (=> b!529079 m!509609))

(declare-fun m!509611 () Bool)

(assert (=> b!529092 m!509611))

(declare-fun m!509613 () Bool)

(assert (=> b!529082 m!509613))

(declare-fun m!509615 () Bool)

(assert (=> b!529086 m!509615))

(declare-fun m!509617 () Bool)

(assert (=> b!529086 m!509617))

(assert (=> b!529094 m!509607))

(assert (=> b!529094 m!509607))

(declare-fun m!509619 () Bool)

(assert (=> b!529094 m!509619))

(assert (=> b!529084 m!509607))

(assert (=> b!529084 m!509607))

(declare-fun m!509621 () Bool)

(assert (=> b!529084 m!509621))

(declare-fun m!509623 () Bool)

(assert (=> start!48028 m!509623))

(declare-fun m!509625 () Bool)

(assert (=> start!48028 m!509625))

(declare-fun m!509627 () Bool)

(assert (=> b!529088 m!509627))

(declare-fun m!509629 () Bool)

(assert (=> b!529093 m!509629))

(declare-fun m!509631 () Bool)

(assert (=> b!529080 m!509631))

(declare-fun m!509633 () Bool)

(assert (=> b!529080 m!509633))

(declare-fun m!509635 () Bool)

(assert (=> b!529080 m!509635))

(declare-fun m!509637 () Bool)

(assert (=> b!529080 m!509637))

(declare-fun m!509639 () Bool)

(assert (=> b!529080 m!509639))

(assert (=> b!529080 m!509607))

(declare-fun m!509641 () Bool)

(assert (=> b!529080 m!509641))

(assert (=> b!529080 m!509607))

(declare-fun m!509643 () Bool)

(assert (=> b!529080 m!509643))

(assert (=> b!529080 m!509607))

(declare-fun m!509645 () Bool)

(assert (=> b!529080 m!509645))

(declare-fun m!509647 () Bool)

(assert (=> b!529081 m!509647))

(declare-fun m!509649 () Bool)

(assert (=> b!529081 m!509649))

(assert (=> b!529081 m!509607))

(assert (=> b!529085 m!509617))

(declare-fun m!509651 () Bool)

(assert (=> b!529078 m!509651))

(declare-fun m!509653 () Bool)

(assert (=> b!529078 m!509653))

(push 1)

