; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26324 () Bool)

(assert start!26324)

(declare-fun b!272793 () Bool)

(declare-fun res!136786 () Bool)

(declare-fun e!174973 () Bool)

(assert (=> b!272793 (=> (not res!136786) (not e!174973))))

(declare-datatypes ((array!13421 0))(
  ( (array!13422 (arr!6360 (Array (_ BitVec 32) (_ BitVec 64))) (size!6712 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13421)

(declare-datatypes ((List!4168 0))(
  ( (Nil!4165) (Cons!4164 (h!4831 (_ BitVec 64)) (t!9250 List!4168)) )
))
(declare-fun arrayNoDuplicates!0 (array!13421 (_ BitVec 32) List!4168) Bool)

(assert (=> b!272793 (= res!136786 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4165))))

(declare-fun b!272794 () Bool)

(declare-fun res!136785 () Bool)

(assert (=> b!272794 (=> (not res!136785) (not e!174973))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!272794 (= res!136785 (and (= (size!6712 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6712 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6712 a!3325))))))

(declare-fun b!272795 () Bool)

(declare-fun e!174972 () Bool)

(assert (=> b!272795 (= e!174972 (not true))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!272795 (arrayNoDuplicates!0 (array!13422 (store (arr!6360 a!3325) i!1267 k0!2581) (size!6712 a!3325)) #b00000000000000000000000000000000 Nil!4165)))

(declare-datatypes ((Unit!8523 0))(
  ( (Unit!8524) )
))
(declare-fun lt!136081 () Unit!8523)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13421 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4168) Unit!8523)

(assert (=> b!272795 (= lt!136081 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4165))))

(declare-fun b!272796 () Bool)

(assert (=> b!272796 (= e!174973 e!174972)))

(declare-fun res!136791 () Bool)

(assert (=> b!272796 (=> (not res!136791) (not e!174972))))

(declare-datatypes ((SeekEntryResult!1518 0))(
  ( (MissingZero!1518 (index!8242 (_ BitVec 32))) (Found!1518 (index!8243 (_ BitVec 32))) (Intermediate!1518 (undefined!2330 Bool) (index!8244 (_ BitVec 32)) (x!26555 (_ BitVec 32))) (Undefined!1518) (MissingVacant!1518 (index!8245 (_ BitVec 32))) )
))
(declare-fun lt!136080 () SeekEntryResult!1518)

(assert (=> b!272796 (= res!136791 (or (= lt!136080 (MissingZero!1518 i!1267)) (= lt!136080 (MissingVacant!1518 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13421 (_ BitVec 32)) SeekEntryResult!1518)

(assert (=> b!272796 (= lt!136080 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272797 () Bool)

(declare-fun res!136787 () Bool)

(assert (=> b!272797 (=> (not res!136787) (not e!174973))))

(declare-fun arrayContainsKey!0 (array!13421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272797 (= res!136787 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272798 () Bool)

(declare-fun res!136783 () Bool)

(assert (=> b!272798 (=> (not res!136783) (not e!174973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272798 (= res!136783 (validKeyInArray!0 k0!2581))))

(declare-fun b!272799 () Bool)

(declare-fun res!136788 () Bool)

(assert (=> b!272799 (=> (not res!136788) (not e!174972))))

(assert (=> b!272799 (= res!136788 (not (= startIndex!26 i!1267)))))

(declare-fun res!136789 () Bool)

(assert (=> start!26324 (=> (not res!136789) (not e!174973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26324 (= res!136789 (validMask!0 mask!3868))))

(assert (=> start!26324 e!174973))

(declare-fun array_inv!4323 (array!13421) Bool)

(assert (=> start!26324 (array_inv!4323 a!3325)))

(assert (=> start!26324 true))

(declare-fun b!272800 () Bool)

(declare-fun res!136784 () Bool)

(assert (=> b!272800 (=> (not res!136784) (not e!174972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13421 (_ BitVec 32)) Bool)

(assert (=> b!272800 (= res!136784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272801 () Bool)

(declare-fun res!136790 () Bool)

(assert (=> b!272801 (=> (not res!136790) (not e!174972))))

(assert (=> b!272801 (= res!136790 (validKeyInArray!0 (select (arr!6360 a!3325) startIndex!26)))))

(assert (= (and start!26324 res!136789) b!272794))

(assert (= (and b!272794 res!136785) b!272798))

(assert (= (and b!272798 res!136783) b!272793))

(assert (= (and b!272793 res!136786) b!272797))

(assert (= (and b!272797 res!136787) b!272796))

(assert (= (and b!272796 res!136791) b!272800))

(assert (= (and b!272800 res!136784) b!272799))

(assert (= (and b!272799 res!136788) b!272801))

(assert (= (and b!272801 res!136790) b!272795))

(declare-fun m!287853 () Bool)

(assert (=> b!272798 m!287853))

(declare-fun m!287855 () Bool)

(assert (=> b!272793 m!287855))

(declare-fun m!287857 () Bool)

(assert (=> b!272796 m!287857))

(declare-fun m!287859 () Bool)

(assert (=> start!26324 m!287859))

(declare-fun m!287861 () Bool)

(assert (=> start!26324 m!287861))

(declare-fun m!287863 () Bool)

(assert (=> b!272795 m!287863))

(declare-fun m!287865 () Bool)

(assert (=> b!272795 m!287865))

(declare-fun m!287867 () Bool)

(assert (=> b!272795 m!287867))

(declare-fun m!287869 () Bool)

(assert (=> b!272800 m!287869))

(declare-fun m!287871 () Bool)

(assert (=> b!272797 m!287871))

(declare-fun m!287873 () Bool)

(assert (=> b!272801 m!287873))

(assert (=> b!272801 m!287873))

(declare-fun m!287875 () Bool)

(assert (=> b!272801 m!287875))

(check-sat (not b!272797) (not start!26324) (not b!272798) (not b!272793) (not b!272796) (not b!272795) (not b!272801) (not b!272800))
(check-sat)
