; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46206 () Bool)

(assert start!46206)

(declare-fun b!511489 () Bool)

(declare-fun res!312298 () Bool)

(declare-fun e!298819 () Bool)

(assert (=> b!511489 (=> res!312298 e!298819)))

(declare-datatypes ((SeekEntryResult!4276 0))(
  ( (MissingZero!4276 (index!19292 (_ BitVec 32))) (Found!4276 (index!19293 (_ BitVec 32))) (Intermediate!4276 (undefined!5088 Bool) (index!19294 (_ BitVec 32)) (x!48254 (_ BitVec 32))) (Undefined!4276) (MissingVacant!4276 (index!19295 (_ BitVec 32))) )
))
(declare-fun lt!233944 () SeekEntryResult!4276)

(get-info :version)

(assert (=> b!511489 (= res!312298 (or (not ((_ is Intermediate!4276) lt!233944)) (not (undefined!5088 lt!233944))))))

(declare-fun b!511490 () Bool)

(declare-fun res!312300 () Bool)

(declare-fun e!298820 () Bool)

(assert (=> b!511490 (=> (not res!312300) (not e!298820))))

(declare-datatypes ((array!32870 0))(
  ( (array!32871 (arr!15812 (Array (_ BitVec 32) (_ BitVec 64))) (size!16177 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32870)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511490 (= res!312300 (validKeyInArray!0 (select (arr!15812 a!3235) j!176)))))

(declare-fun b!511491 () Bool)

(declare-fun res!312297 () Bool)

(declare-fun e!298821 () Bool)

(assert (=> b!511491 (=> (not res!312297) (not e!298821))))

(declare-datatypes ((List!10009 0))(
  ( (Nil!10006) (Cons!10005 (h!10885 (_ BitVec 64)) (t!16228 List!10009)) )
))
(declare-fun arrayNoDuplicates!0 (array!32870 (_ BitVec 32) List!10009) Bool)

(assert (=> b!511491 (= res!312297 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10006))))

(declare-fun b!511492 () Bool)

(assert (=> b!511492 (= e!298821 (not e!298819))))

(declare-fun res!312299 () Bool)

(assert (=> b!511492 (=> res!312299 e!298819)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!233941 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32870 (_ BitVec 32)) SeekEntryResult!4276)

(assert (=> b!511492 (= res!312299 (= lt!233944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233941 (select (store (arr!15812 a!3235) i!1204 k0!2280) j!176) (array!32871 (store (arr!15812 a!3235) i!1204 k0!2280) (size!16177 a!3235)) mask!3524)))))

(declare-fun lt!233942 () (_ BitVec 32))

(assert (=> b!511492 (= lt!233944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233942 (select (arr!15812 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511492 (= lt!233941 (toIndex!0 (select (store (arr!15812 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511492 (= lt!233942 (toIndex!0 (select (arr!15812 a!3235) j!176) mask!3524))))

(declare-fun lt!233939 () SeekEntryResult!4276)

(assert (=> b!511492 (= lt!233939 (Found!4276 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32870 (_ BitVec 32)) SeekEntryResult!4276)

(assert (=> b!511492 (= lt!233939 (seekEntryOrOpen!0 (select (arr!15812 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32870 (_ BitVec 32)) Bool)

(assert (=> b!511492 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15796 0))(
  ( (Unit!15797) )
))
(declare-fun lt!233943 () Unit!15796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15796)

(assert (=> b!511492 (= lt!233943 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511493 () Bool)

(assert (=> b!511493 (= e!298820 e!298821)))

(declare-fun res!312296 () Bool)

(assert (=> b!511493 (=> (not res!312296) (not e!298821))))

(declare-fun lt!233940 () SeekEntryResult!4276)

(assert (=> b!511493 (= res!312296 (or (= lt!233940 (MissingZero!4276 i!1204)) (= lt!233940 (MissingVacant!4276 i!1204))))))

(assert (=> b!511493 (= lt!233940 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511494 () Bool)

(declare-fun res!312301 () Bool)

(assert (=> b!511494 (=> (not res!312301) (not e!298820))))

(assert (=> b!511494 (= res!312301 (validKeyInArray!0 k0!2280))))

(declare-fun res!312294 () Bool)

(assert (=> start!46206 (=> (not res!312294) (not e!298820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46206 (= res!312294 (validMask!0 mask!3524))))

(assert (=> start!46206 e!298820))

(assert (=> start!46206 true))

(declare-fun array_inv!11695 (array!32870) Bool)

(assert (=> start!46206 (array_inv!11695 a!3235)))

(declare-fun b!511495 () Bool)

(declare-fun res!312295 () Bool)

(assert (=> b!511495 (=> (not res!312295) (not e!298821))))

(assert (=> b!511495 (= res!312295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511496 () Bool)

(assert (=> b!511496 (= e!298819 true)))

(assert (=> b!511496 (= lt!233939 Undefined!4276)))

(declare-fun b!511497 () Bool)

(declare-fun res!312302 () Bool)

(assert (=> b!511497 (=> (not res!312302) (not e!298820))))

(assert (=> b!511497 (= res!312302 (and (= (size!16177 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16177 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16177 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511498 () Bool)

(declare-fun res!312293 () Bool)

(assert (=> b!511498 (=> (not res!312293) (not e!298820))))

(declare-fun arrayContainsKey!0 (array!32870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511498 (= res!312293 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46206 res!312294) b!511497))

(assert (= (and b!511497 res!312302) b!511490))

(assert (= (and b!511490 res!312300) b!511494))

(assert (= (and b!511494 res!312301) b!511498))

(assert (= (and b!511498 res!312293) b!511493))

(assert (= (and b!511493 res!312296) b!511495))

(assert (= (and b!511495 res!312295) b!511491))

(assert (= (and b!511491 res!312297) b!511492))

(assert (= (and b!511492 (not res!312299)) b!511489))

(assert (= (and b!511489 (not res!312298)) b!511496))

(declare-fun m!492529 () Bool)

(assert (=> b!511494 m!492529))

(declare-fun m!492531 () Bool)

(assert (=> b!511498 m!492531))

(declare-fun m!492533 () Bool)

(assert (=> b!511492 m!492533))

(declare-fun m!492535 () Bool)

(assert (=> b!511492 m!492535))

(declare-fun m!492537 () Bool)

(assert (=> b!511492 m!492537))

(declare-fun m!492539 () Bool)

(assert (=> b!511492 m!492539))

(declare-fun m!492541 () Bool)

(assert (=> b!511492 m!492541))

(assert (=> b!511492 m!492537))

(declare-fun m!492543 () Bool)

(assert (=> b!511492 m!492543))

(assert (=> b!511492 m!492539))

(declare-fun m!492545 () Bool)

(assert (=> b!511492 m!492545))

(assert (=> b!511492 m!492539))

(declare-fun m!492547 () Bool)

(assert (=> b!511492 m!492547))

(assert (=> b!511492 m!492539))

(declare-fun m!492549 () Bool)

(assert (=> b!511492 m!492549))

(assert (=> b!511492 m!492537))

(declare-fun m!492551 () Bool)

(assert (=> b!511492 m!492551))

(declare-fun m!492553 () Bool)

(assert (=> b!511491 m!492553))

(declare-fun m!492555 () Bool)

(assert (=> start!46206 m!492555))

(declare-fun m!492557 () Bool)

(assert (=> start!46206 m!492557))

(declare-fun m!492559 () Bool)

(assert (=> b!511493 m!492559))

(assert (=> b!511490 m!492539))

(assert (=> b!511490 m!492539))

(declare-fun m!492561 () Bool)

(assert (=> b!511490 m!492561))

(declare-fun m!492563 () Bool)

(assert (=> b!511495 m!492563))

(check-sat (not b!511498) (not start!46206) (not b!511492) (not b!511495) (not b!511494) (not b!511491) (not b!511493) (not b!511490))
(check-sat)
