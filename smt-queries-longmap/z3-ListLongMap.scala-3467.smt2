; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48122 () Bool)

(assert start!48122)

(declare-fun b!530076 () Bool)

(declare-fun res!325844 () Bool)

(declare-fun e!308862 () Bool)

(assert (=> b!530076 (=> (not res!325844) (not e!308862))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530076 (= res!325844 (validKeyInArray!0 k0!2280))))

(declare-fun b!530077 () Bool)

(declare-fun res!325845 () Bool)

(assert (=> b!530077 (=> (not res!325845) (not e!308862))))

(declare-datatypes ((array!33559 0))(
  ( (array!33560 (arr!16126 (Array (_ BitVec 32) (_ BitVec 64))) (size!16490 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33559)

(declare-fun arrayContainsKey!0 (array!33559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530077 (= res!325845 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530078 () Bool)

(declare-fun res!325837 () Bool)

(declare-fun e!308859 () Bool)

(assert (=> b!530078 (=> (not res!325837) (not e!308859))))

(declare-datatypes ((List!10191 0))(
  ( (Nil!10188) (Cons!10187 (h!11127 (_ BitVec 64)) (t!16411 List!10191)) )
))
(declare-fun arrayNoDuplicates!0 (array!33559 (_ BitVec 32) List!10191) Bool)

(assert (=> b!530078 (= res!325837 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10188))))

(declare-fun res!325838 () Bool)

(assert (=> start!48122 (=> (not res!325838) (not e!308862))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48122 (= res!325838 (validMask!0 mask!3524))))

(assert (=> start!48122 e!308862))

(assert (=> start!48122 true))

(declare-fun array_inv!11985 (array!33559) Bool)

(assert (=> start!48122 (array_inv!11985 a!3235)))

(declare-fun b!530079 () Bool)

(declare-fun res!325846 () Bool)

(assert (=> b!530079 (=> (not res!325846) (not e!308862))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!530079 (= res!325846 (validKeyInArray!0 (select (arr!16126 a!3235) j!176)))))

(declare-fun b!530080 () Bool)

(declare-fun e!308861 () Bool)

(assert (=> b!530080 (= e!308861 true)))

(declare-fun lt!244551 () array!33559)

(declare-datatypes ((SeekEntryResult!4549 0))(
  ( (MissingZero!4549 (index!20420 (_ BitVec 32))) (Found!4549 (index!20421 (_ BitVec 32))) (Intermediate!4549 (undefined!5361 Bool) (index!20422 (_ BitVec 32)) (x!49536 (_ BitVec 32))) (Undefined!4549) (MissingVacant!4549 (index!20423 (_ BitVec 32))) )
))
(declare-fun lt!244550 () SeekEntryResult!4549)

(declare-fun lt!244552 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33559 (_ BitVec 32)) SeekEntryResult!4549)

(assert (=> b!530080 (= lt!244550 (seekEntryOrOpen!0 lt!244552 lt!244551 mask!3524))))

(assert (=> b!530080 false))

(declare-fun b!530081 () Bool)

(declare-fun res!325836 () Bool)

(assert (=> b!530081 (=> (not res!325836) (not e!308862))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530081 (= res!325836 (and (= (size!16490 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16490 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16490 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530082 () Bool)

(declare-fun e!308858 () Bool)

(assert (=> b!530082 (= e!308859 (not e!308858))))

(declare-fun res!325843 () Bool)

(assert (=> b!530082 (=> res!325843 e!308858)))

(declare-fun lt!244548 () (_ BitVec 32))

(declare-fun lt!244547 () SeekEntryResult!4549)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33559 (_ BitVec 32)) SeekEntryResult!4549)

(assert (=> b!530082 (= res!325843 (= lt!244547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244548 lt!244552 lt!244551 mask!3524)))))

(declare-fun lt!244544 () (_ BitVec 32))

(assert (=> b!530082 (= lt!244547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244544 (select (arr!16126 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530082 (= lt!244548 (toIndex!0 lt!244552 mask!3524))))

(assert (=> b!530082 (= lt!244552 (select (store (arr!16126 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!530082 (= lt!244544 (toIndex!0 (select (arr!16126 a!3235) j!176) mask!3524))))

(assert (=> b!530082 (= lt!244551 (array!33560 (store (arr!16126 a!3235) i!1204 k0!2280) (size!16490 a!3235)))))

(declare-fun e!308857 () Bool)

(assert (=> b!530082 e!308857))

(declare-fun res!325840 () Bool)

(assert (=> b!530082 (=> (not res!325840) (not e!308857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33559 (_ BitVec 32)) Bool)

(assert (=> b!530082 (= res!325840 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16771 0))(
  ( (Unit!16772) )
))
(declare-fun lt!244549 () Unit!16771)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16771)

(assert (=> b!530082 (= lt!244549 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530083 () Bool)

(assert (=> b!530083 (= e!308862 e!308859)))

(declare-fun res!325839 () Bool)

(assert (=> b!530083 (=> (not res!325839) (not e!308859))))

(declare-fun lt!244545 () SeekEntryResult!4549)

(assert (=> b!530083 (= res!325839 (or (= lt!244545 (MissingZero!4549 i!1204)) (= lt!244545 (MissingVacant!4549 i!1204))))))

(assert (=> b!530083 (= lt!244545 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!530084 () Bool)

(assert (=> b!530084 (= e!308858 e!308861)))

(declare-fun res!325841 () Bool)

(assert (=> b!530084 (=> res!325841 e!308861)))

(declare-fun lt!244546 () Bool)

(assert (=> b!530084 (= res!325841 (or (and (not lt!244546) (undefined!5361 lt!244547)) (and (not lt!244546) (not (undefined!5361 lt!244547)))))))

(get-info :version)

(assert (=> b!530084 (= lt!244546 (not ((_ is Intermediate!4549) lt!244547)))))

(declare-fun b!530085 () Bool)

(assert (=> b!530085 (= e!308857 (= (seekEntryOrOpen!0 (select (arr!16126 a!3235) j!176) a!3235 mask!3524) (Found!4549 j!176)))))

(declare-fun b!530086 () Bool)

(declare-fun res!325842 () Bool)

(assert (=> b!530086 (=> (not res!325842) (not e!308859))))

(assert (=> b!530086 (= res!325842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!48122 res!325838) b!530081))

(assert (= (and b!530081 res!325836) b!530079))

(assert (= (and b!530079 res!325846) b!530076))

(assert (= (and b!530076 res!325844) b!530077))

(assert (= (and b!530077 res!325845) b!530083))

(assert (= (and b!530083 res!325839) b!530086))

(assert (= (and b!530086 res!325842) b!530078))

(assert (= (and b!530078 res!325837) b!530082))

(assert (= (and b!530082 res!325840) b!530085))

(assert (= (and b!530082 (not res!325843)) b!530084))

(assert (= (and b!530084 (not res!325841)) b!530080))

(declare-fun m!510859 () Bool)

(assert (=> b!530083 m!510859))

(declare-fun m!510861 () Bool)

(assert (=> b!530079 m!510861))

(assert (=> b!530079 m!510861))

(declare-fun m!510863 () Bool)

(assert (=> b!530079 m!510863))

(declare-fun m!510865 () Bool)

(assert (=> b!530082 m!510865))

(declare-fun m!510867 () Bool)

(assert (=> b!530082 m!510867))

(declare-fun m!510869 () Bool)

(assert (=> b!530082 m!510869))

(declare-fun m!510871 () Bool)

(assert (=> b!530082 m!510871))

(assert (=> b!530082 m!510861))

(declare-fun m!510873 () Bool)

(assert (=> b!530082 m!510873))

(declare-fun m!510875 () Bool)

(assert (=> b!530082 m!510875))

(assert (=> b!530082 m!510861))

(declare-fun m!510877 () Bool)

(assert (=> b!530082 m!510877))

(assert (=> b!530082 m!510861))

(declare-fun m!510879 () Bool)

(assert (=> b!530082 m!510879))

(declare-fun m!510881 () Bool)

(assert (=> b!530086 m!510881))

(declare-fun m!510883 () Bool)

(assert (=> start!48122 m!510883))

(declare-fun m!510885 () Bool)

(assert (=> start!48122 m!510885))

(declare-fun m!510887 () Bool)

(assert (=> b!530078 m!510887))

(declare-fun m!510889 () Bool)

(assert (=> b!530080 m!510889))

(assert (=> b!530085 m!510861))

(assert (=> b!530085 m!510861))

(declare-fun m!510891 () Bool)

(assert (=> b!530085 m!510891))

(declare-fun m!510893 () Bool)

(assert (=> b!530077 m!510893))

(declare-fun m!510895 () Bool)

(assert (=> b!530076 m!510895))

(check-sat (not b!530080) (not b!530085) (not b!530082) (not b!530078) (not b!530077) (not start!48122) (not b!530076) (not b!530086) (not b!530079) (not b!530083))
(check-sat)
