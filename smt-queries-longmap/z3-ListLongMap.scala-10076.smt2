; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118592 () Bool)

(assert start!118592)

(declare-fun b!1386418 () Bool)

(declare-fun res!927627 () Bool)

(declare-fun e!785387 () Bool)

(assert (=> b!1386418 (=> (not res!927627) (not e!785387))))

(declare-datatypes ((array!94868 0))(
  ( (array!94869 (arr!45810 (Array (_ BitVec 32) (_ BitVec 64))) (size!46360 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94868)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386418 (= res!927627 (and (not (= (select (arr!45810 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45810 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386419 () Bool)

(declare-fun res!927623 () Bool)

(assert (=> b!1386419 (=> (not res!927623) (not e!785387))))

(declare-datatypes ((List!32338 0))(
  ( (Nil!32335) (Cons!32334 (h!33543 (_ BitVec 64)) (t!47032 List!32338)) )
))
(declare-fun arrayNoDuplicates!0 (array!94868 (_ BitVec 32) List!32338) Bool)

(assert (=> b!1386419 (= res!927623 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32335))))

(declare-fun res!927624 () Bool)

(assert (=> start!118592 (=> (not res!927624) (not e!785387))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118592 (= res!927624 (validMask!0 mask!2987))))

(assert (=> start!118592 e!785387))

(assert (=> start!118592 true))

(declare-fun array_inv!34838 (array!94868) Bool)

(assert (=> start!118592 (array_inv!34838 a!2938)))

(declare-fun b!1386420 () Bool)

(declare-fun res!927626 () Bool)

(assert (=> b!1386420 (=> (not res!927626) (not e!785387))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386420 (= res!927626 (and (= (size!46360 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46360 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46360 a!2938))))))

(declare-fun b!1386421 () Bool)

(assert (=> b!1386421 (= e!785387 false)))

(declare-datatypes ((Unit!46301 0))(
  ( (Unit!46302) )
))
(declare-fun lt!609458 () Unit!46301)

(declare-fun e!785388 () Unit!46301)

(assert (=> b!1386421 (= lt!609458 e!785388)))

(declare-fun c!128838 () Bool)

(declare-fun e!785390 () Bool)

(assert (=> b!1386421 (= c!128838 e!785390)))

(declare-fun res!927625 () Bool)

(assert (=> b!1386421 (=> (not res!927625) (not e!785390))))

(assert (=> b!1386421 (= res!927625 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386422 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386422 (= e!785390 (validKeyInArray!0 (select (arr!45810 a!2938) startIndex!16)))))

(declare-fun b!1386423 () Bool)

(declare-fun res!927628 () Bool)

(assert (=> b!1386423 (=> (not res!927628) (not e!785387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94868 (_ BitVec 32)) Bool)

(assert (=> b!1386423 (= res!927628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386424 () Bool)

(declare-fun res!927622 () Bool)

(assert (=> b!1386424 (=> (not res!927622) (not e!785387))))

(assert (=> b!1386424 (= res!927622 (validKeyInArray!0 (select (arr!45810 a!2938) i!1065)))))

(declare-fun b!1386425 () Bool)

(declare-fun Unit!46303 () Unit!46301)

(assert (=> b!1386425 (= e!785388 Unit!46303)))

(declare-fun b!1386426 () Bool)

(declare-fun lt!609457 () Unit!46301)

(assert (=> b!1386426 (= e!785388 lt!609457)))

(declare-fun lt!609459 () Unit!46301)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46301)

(assert (=> b!1386426 (= lt!609459 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10153 0))(
  ( (MissingZero!10153 (index!42983 (_ BitVec 32))) (Found!10153 (index!42984 (_ BitVec 32))) (Intermediate!10153 (undefined!10965 Bool) (index!42985 (_ BitVec 32)) (x!124602 (_ BitVec 32))) (Undefined!10153) (MissingVacant!10153 (index!42986 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94868 (_ BitVec 32)) SeekEntryResult!10153)

(assert (=> b!1386426 (= (seekEntryOrOpen!0 (select (arr!45810 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45810 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94869 (store (arr!45810 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46360 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46301)

(assert (=> b!1386426 (= lt!609457 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386426 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118592 res!927624) b!1386420))

(assert (= (and b!1386420 res!927626) b!1386424))

(assert (= (and b!1386424 res!927622) b!1386419))

(assert (= (and b!1386419 res!927623) b!1386423))

(assert (= (and b!1386423 res!927628) b!1386418))

(assert (= (and b!1386418 res!927627) b!1386421))

(assert (= (and b!1386421 res!927625) b!1386422))

(assert (= (and b!1386421 c!128838) b!1386426))

(assert (= (and b!1386421 (not c!128838)) b!1386425))

(declare-fun m!1271781 () Bool)

(assert (=> b!1386423 m!1271781))

(declare-fun m!1271783 () Bool)

(assert (=> b!1386422 m!1271783))

(assert (=> b!1386422 m!1271783))

(declare-fun m!1271785 () Bool)

(assert (=> b!1386422 m!1271785))

(declare-fun m!1271787 () Bool)

(assert (=> b!1386419 m!1271787))

(declare-fun m!1271789 () Bool)

(assert (=> start!118592 m!1271789))

(declare-fun m!1271791 () Bool)

(assert (=> start!118592 m!1271791))

(declare-fun m!1271793 () Bool)

(assert (=> b!1386426 m!1271793))

(declare-fun m!1271795 () Bool)

(assert (=> b!1386426 m!1271795))

(assert (=> b!1386426 m!1271795))

(declare-fun m!1271797 () Bool)

(assert (=> b!1386426 m!1271797))

(declare-fun m!1271799 () Bool)

(assert (=> b!1386426 m!1271799))

(declare-fun m!1271801 () Bool)

(assert (=> b!1386426 m!1271801))

(assert (=> b!1386426 m!1271783))

(declare-fun m!1271803 () Bool)

(assert (=> b!1386426 m!1271803))

(assert (=> b!1386426 m!1271783))

(declare-fun m!1271805 () Bool)

(assert (=> b!1386426 m!1271805))

(declare-fun m!1271807 () Bool)

(assert (=> b!1386418 m!1271807))

(assert (=> b!1386424 m!1271807))

(assert (=> b!1386424 m!1271807))

(declare-fun m!1271809 () Bool)

(assert (=> b!1386424 m!1271809))

(check-sat (not b!1386423) (not start!118592) (not b!1386419) (not b!1386424) (not b!1386426) (not b!1386422))
