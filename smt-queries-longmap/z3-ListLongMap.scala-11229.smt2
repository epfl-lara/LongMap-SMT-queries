; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130956 () Bool)

(assert start!130956)

(declare-fun b!1536720 () Bool)

(declare-fun res!1053996 () Bool)

(declare-fun e!855259 () Bool)

(assert (=> b!1536720 (=> (not res!1053996) (not e!855259))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102052 0))(
  ( (array!102053 (arr!49243 (Array (_ BitVec 32) (_ BitVec 64))) (size!49795 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102052)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536720 (= res!1053996 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49795 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49795 a!2792)) (= (select (arr!49243 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536721 () Bool)

(declare-fun res!1053990 () Bool)

(assert (=> b!1536721 (=> (not res!1053990) (not e!855259))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536721 (= res!1053990 (validKeyInArray!0 (select (arr!49243 a!2792) i!951)))))

(declare-fun res!1053998 () Bool)

(assert (=> start!130956 (=> (not res!1053998) (not e!855259))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130956 (= res!1053998 (validMask!0 mask!2480))))

(assert (=> start!130956 e!855259))

(assert (=> start!130956 true))

(declare-fun array_inv!38476 (array!102052) Bool)

(assert (=> start!130956 (array_inv!38476 a!2792)))

(declare-fun b!1536722 () Bool)

(declare-fun res!1054000 () Bool)

(assert (=> b!1536722 (=> (not res!1054000) (not e!855259))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1536722 (= res!1054000 (validKeyInArray!0 (select (arr!49243 a!2792) j!64)))))

(declare-fun b!1536723 () Bool)

(declare-fun res!1053994 () Bool)

(assert (=> b!1536723 (=> (not res!1053994) (not e!855259))))

(declare-datatypes ((List!35795 0))(
  ( (Nil!35792) (Cons!35791 (h!37237 (_ BitVec 64)) (t!50481 List!35795)) )
))
(declare-fun arrayNoDuplicates!0 (array!102052 (_ BitVec 32) List!35795) Bool)

(assert (=> b!1536723 (= res!1053994 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35792))))

(declare-fun b!1536724 () Bool)

(declare-fun res!1053993 () Bool)

(assert (=> b!1536724 (=> (not res!1053993) (not e!855259))))

(assert (=> b!1536724 (= res!1053993 (and (= (size!49795 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49795 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49795 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536725 () Bool)

(declare-fun e!855255 () Bool)

(assert (=> b!1536725 (= e!855259 e!855255)))

(declare-fun res!1053992 () Bool)

(assert (=> b!1536725 (=> (not res!1053992) (not e!855255))))

(declare-datatypes ((SeekEntryResult!13400 0))(
  ( (MissingZero!13400 (index!55995 (_ BitVec 32))) (Found!13400 (index!55996 (_ BitVec 32))) (Intermediate!13400 (undefined!14212 Bool) (index!55997 (_ BitVec 32)) (x!137725 (_ BitVec 32))) (Undefined!13400) (MissingVacant!13400 (index!55998 (_ BitVec 32))) )
))
(declare-fun lt!664284 () SeekEntryResult!13400)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102052 (_ BitVec 32)) SeekEntryResult!13400)

(assert (=> b!1536725 (= res!1053992 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49243 a!2792) j!64) a!2792 mask!2480) lt!664284))))

(assert (=> b!1536725 (= lt!664284 (Found!13400 j!64))))

(declare-fun b!1536726 () Bool)

(declare-fun res!1053991 () Bool)

(assert (=> b!1536726 (=> (not res!1053991) (not e!855255))))

(assert (=> b!1536726 (= res!1053991 (not (= (select (arr!49243 a!2792) index!463) (select (arr!49243 a!2792) j!64))))))

(declare-fun b!1536727 () Bool)

(declare-fun res!1053997 () Bool)

(assert (=> b!1536727 (=> (not res!1053997) (not e!855259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102052 (_ BitVec 32)) Bool)

(assert (=> b!1536727 (= res!1053997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536728 () Bool)

(declare-fun e!855257 () Bool)

(assert (=> b!1536728 (= e!855255 e!855257)))

(declare-fun res!1053999 () Bool)

(assert (=> b!1536728 (=> (not res!1053999) (not e!855257))))

(declare-fun lt!664282 () (_ BitVec 32))

(assert (=> b!1536728 (= res!1053999 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664282 #b00000000000000000000000000000000) (bvslt lt!664282 (size!49795 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536728 (= lt!664282 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536729 () Bool)

(declare-fun e!855258 () Bool)

(assert (=> b!1536729 (= e!855257 e!855258)))

(declare-fun res!1053995 () Bool)

(assert (=> b!1536729 (=> (not res!1053995) (not e!855258))))

(declare-fun lt!664281 () SeekEntryResult!13400)

(assert (=> b!1536729 (= res!1053995 (= lt!664281 lt!664284))))

(assert (=> b!1536729 (= lt!664281 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664282 vacantIndex!5 (select (arr!49243 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536730 () Bool)

(assert (=> b!1536730 (= e!855258 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(assert (=> b!1536730 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664282 vacantIndex!5 (select (store (arr!49243 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102053 (store (arr!49243 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49795 a!2792)) mask!2480) lt!664281)))

(declare-datatypes ((Unit!51207 0))(
  ( (Unit!51208) )
))
(declare-fun lt!664283 () Unit!51207)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51207)

(assert (=> b!1536730 (= lt!664283 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664282 vacantIndex!5 mask!2480))))

(assert (= (and start!130956 res!1053998) b!1536724))

(assert (= (and b!1536724 res!1053993) b!1536721))

(assert (= (and b!1536721 res!1053990) b!1536722))

(assert (= (and b!1536722 res!1054000) b!1536727))

(assert (= (and b!1536727 res!1053997) b!1536723))

(assert (= (and b!1536723 res!1053994) b!1536720))

(assert (= (and b!1536720 res!1053996) b!1536725))

(assert (= (and b!1536725 res!1053992) b!1536726))

(assert (= (and b!1536726 res!1053991) b!1536728))

(assert (= (and b!1536728 res!1053999) b!1536729))

(assert (= (and b!1536729 res!1053995) b!1536730))

(declare-fun m!1418633 () Bool)

(assert (=> b!1536722 m!1418633))

(assert (=> b!1536722 m!1418633))

(declare-fun m!1418635 () Bool)

(assert (=> b!1536722 m!1418635))

(declare-fun m!1418637 () Bool)

(assert (=> b!1536730 m!1418637))

(declare-fun m!1418639 () Bool)

(assert (=> b!1536730 m!1418639))

(assert (=> b!1536730 m!1418639))

(declare-fun m!1418641 () Bool)

(assert (=> b!1536730 m!1418641))

(declare-fun m!1418643 () Bool)

(assert (=> b!1536730 m!1418643))

(declare-fun m!1418645 () Bool)

(assert (=> b!1536721 m!1418645))

(assert (=> b!1536721 m!1418645))

(declare-fun m!1418647 () Bool)

(assert (=> b!1536721 m!1418647))

(declare-fun m!1418649 () Bool)

(assert (=> b!1536720 m!1418649))

(assert (=> b!1536729 m!1418633))

(assert (=> b!1536729 m!1418633))

(declare-fun m!1418651 () Bool)

(assert (=> b!1536729 m!1418651))

(declare-fun m!1418653 () Bool)

(assert (=> b!1536728 m!1418653))

(declare-fun m!1418655 () Bool)

(assert (=> b!1536727 m!1418655))

(declare-fun m!1418657 () Bool)

(assert (=> b!1536723 m!1418657))

(declare-fun m!1418659 () Bool)

(assert (=> b!1536726 m!1418659))

(assert (=> b!1536726 m!1418633))

(declare-fun m!1418661 () Bool)

(assert (=> start!130956 m!1418661))

(declare-fun m!1418663 () Bool)

(assert (=> start!130956 m!1418663))

(assert (=> b!1536725 m!1418633))

(assert (=> b!1536725 m!1418633))

(declare-fun m!1418665 () Bool)

(assert (=> b!1536725 m!1418665))

(check-sat (not b!1536729) (not b!1536728) (not start!130956) (not b!1536721) (not b!1536727) (not b!1536725) (not b!1536723) (not b!1536722) (not b!1536730))
(check-sat)
