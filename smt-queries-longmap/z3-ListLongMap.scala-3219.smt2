; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45050 () Bool)

(assert start!45050)

(declare-fun b!494485 () Bool)

(declare-fun e!290187 () Bool)

(assert (=> b!494485 (= e!290187 true)))

(declare-datatypes ((SeekEntryResult!3805 0))(
  ( (MissingZero!3805 (index!17399 (_ BitVec 32))) (Found!3805 (index!17400 (_ BitVec 32))) (Intermediate!3805 (undefined!4617 Bool) (index!17401 (_ BitVec 32)) (x!46616 (_ BitVec 32))) (Undefined!3805) (MissingVacant!3805 (index!17402 (_ BitVec 32))) )
))
(declare-fun lt!223847 () SeekEntryResult!3805)

(assert (=> b!494485 (= lt!223847 Undefined!3805)))

(declare-fun b!494486 () Bool)

(declare-fun res!297109 () Bool)

(declare-fun e!290188 () Bool)

(assert (=> b!494486 (=> (not res!297109) (not e!290188))))

(declare-datatypes ((array!31996 0))(
  ( (array!31997 (arr!15382 (Array (_ BitVec 32) (_ BitVec 64))) (size!15746 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31996)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494486 (= res!297109 (validKeyInArray!0 (select (arr!15382 a!3235) j!176)))))

(declare-fun res!297115 () Bool)

(assert (=> start!45050 (=> (not res!297115) (not e!290188))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45050 (= res!297115 (validMask!0 mask!3524))))

(assert (=> start!45050 e!290188))

(assert (=> start!45050 true))

(declare-fun array_inv!11241 (array!31996) Bool)

(assert (=> start!45050 (array_inv!11241 a!3235)))

(declare-fun b!494487 () Bool)

(declare-fun res!297118 () Bool)

(assert (=> b!494487 (=> (not res!297118) (not e!290188))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494487 (= res!297118 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494488 () Bool)

(declare-fun res!297112 () Bool)

(declare-fun e!290190 () Bool)

(assert (=> b!494488 (=> (not res!297112) (not e!290190))))

(declare-datatypes ((List!9447 0))(
  ( (Nil!9444) (Cons!9443 (h!10311 (_ BitVec 64)) (t!15667 List!9447)) )
))
(declare-fun arrayNoDuplicates!0 (array!31996 (_ BitVec 32) List!9447) Bool)

(assert (=> b!494488 (= res!297112 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9444))))

(declare-fun b!494489 () Bool)

(declare-fun res!297116 () Bool)

(assert (=> b!494489 (=> (not res!297116) (not e!290190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31996 (_ BitVec 32)) Bool)

(assert (=> b!494489 (= res!297116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494490 () Bool)

(assert (=> b!494490 (= e!290190 (not e!290187))))

(declare-fun res!297111 () Bool)

(assert (=> b!494490 (=> res!297111 e!290187)))

(declare-fun lt!223849 () (_ BitVec 32))

(declare-fun lt!223848 () SeekEntryResult!3805)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31996 (_ BitVec 32)) SeekEntryResult!3805)

(assert (=> b!494490 (= res!297111 (= lt!223848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223849 (select (store (arr!15382 a!3235) i!1204 k0!2280) j!176) (array!31997 (store (arr!15382 a!3235) i!1204 k0!2280) (size!15746 a!3235)) mask!3524)))))

(declare-fun lt!223852 () (_ BitVec 32))

(assert (=> b!494490 (= lt!223848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223852 (select (arr!15382 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494490 (= lt!223849 (toIndex!0 (select (store (arr!15382 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494490 (= lt!223852 (toIndex!0 (select (arr!15382 a!3235) j!176) mask!3524))))

(assert (=> b!494490 (= lt!223847 (Found!3805 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31996 (_ BitVec 32)) SeekEntryResult!3805)

(assert (=> b!494490 (= lt!223847 (seekEntryOrOpen!0 (select (arr!15382 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494490 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14617 0))(
  ( (Unit!14618) )
))
(declare-fun lt!223851 () Unit!14617)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14617)

(assert (=> b!494490 (= lt!223851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494491 () Bool)

(assert (=> b!494491 (= e!290188 e!290190)))

(declare-fun res!297114 () Bool)

(assert (=> b!494491 (=> (not res!297114) (not e!290190))))

(declare-fun lt!223850 () SeekEntryResult!3805)

(assert (=> b!494491 (= res!297114 (or (= lt!223850 (MissingZero!3805 i!1204)) (= lt!223850 (MissingVacant!3805 i!1204))))))

(assert (=> b!494491 (= lt!223850 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494492 () Bool)

(declare-fun res!297110 () Bool)

(assert (=> b!494492 (=> (not res!297110) (not e!290188))))

(assert (=> b!494492 (= res!297110 (validKeyInArray!0 k0!2280))))

(declare-fun b!494493 () Bool)

(declare-fun res!297113 () Bool)

(assert (=> b!494493 (=> res!297113 e!290187)))

(get-info :version)

(assert (=> b!494493 (= res!297113 (or (not ((_ is Intermediate!3805) lt!223848)) (not (undefined!4617 lt!223848))))))

(declare-fun b!494494 () Bool)

(declare-fun res!297117 () Bool)

(assert (=> b!494494 (=> (not res!297117) (not e!290188))))

(assert (=> b!494494 (= res!297117 (and (= (size!15746 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15746 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15746 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45050 res!297115) b!494494))

(assert (= (and b!494494 res!297117) b!494486))

(assert (= (and b!494486 res!297109) b!494492))

(assert (= (and b!494492 res!297110) b!494487))

(assert (= (and b!494487 res!297118) b!494491))

(assert (= (and b!494491 res!297114) b!494489))

(assert (= (and b!494489 res!297116) b!494488))

(assert (= (and b!494488 res!297112) b!494490))

(assert (= (and b!494490 (not res!297111)) b!494493))

(assert (= (and b!494493 (not res!297113)) b!494485))

(declare-fun m!475795 () Bool)

(assert (=> b!494486 m!475795))

(assert (=> b!494486 m!475795))

(declare-fun m!475797 () Bool)

(assert (=> b!494486 m!475797))

(declare-fun m!475799 () Bool)

(assert (=> b!494488 m!475799))

(declare-fun m!475801 () Bool)

(assert (=> start!45050 m!475801))

(declare-fun m!475803 () Bool)

(assert (=> start!45050 m!475803))

(declare-fun m!475805 () Bool)

(assert (=> b!494490 m!475805))

(declare-fun m!475807 () Bool)

(assert (=> b!494490 m!475807))

(declare-fun m!475809 () Bool)

(assert (=> b!494490 m!475809))

(assert (=> b!494490 m!475809))

(declare-fun m!475811 () Bool)

(assert (=> b!494490 m!475811))

(assert (=> b!494490 m!475795))

(declare-fun m!475813 () Bool)

(assert (=> b!494490 m!475813))

(assert (=> b!494490 m!475795))

(declare-fun m!475815 () Bool)

(assert (=> b!494490 m!475815))

(assert (=> b!494490 m!475795))

(declare-fun m!475817 () Bool)

(assert (=> b!494490 m!475817))

(assert (=> b!494490 m!475809))

(declare-fun m!475819 () Bool)

(assert (=> b!494490 m!475819))

(assert (=> b!494490 m!475795))

(declare-fun m!475821 () Bool)

(assert (=> b!494490 m!475821))

(declare-fun m!475823 () Bool)

(assert (=> b!494491 m!475823))

(declare-fun m!475825 () Bool)

(assert (=> b!494487 m!475825))

(declare-fun m!475827 () Bool)

(assert (=> b!494489 m!475827))

(declare-fun m!475829 () Bool)

(assert (=> b!494492 m!475829))

(check-sat (not b!494491) (not b!494492) (not b!494490) (not b!494486) (not b!494488) (not b!494489) (not start!45050) (not b!494487))
(check-sat)
