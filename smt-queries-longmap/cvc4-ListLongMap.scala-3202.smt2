; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44962 () Bool)

(assert start!44962)

(declare-fun b!493095 () Bool)

(declare-fun res!295665 () Bool)

(declare-fun e!289631 () Bool)

(assert (=> b!493095 (=> (not res!295665) (not e!289631))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31907 0))(
  ( (array!31908 (arr!15338 (Array (_ BitVec 32) (_ BitVec 64))) (size!15702 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31907)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493095 (= res!295665 (and (= (size!15702 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15702 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15702 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493096 () Bool)

(declare-fun res!295669 () Bool)

(assert (=> b!493096 (=> (not res!295669) (not e!289631))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493096 (= res!295669 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493097 () Bool)

(declare-fun res!295670 () Bool)

(declare-fun e!289630 () Bool)

(assert (=> b!493097 (=> (not res!295670) (not e!289630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31907 (_ BitVec 32)) Bool)

(assert (=> b!493097 (= res!295670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493098 () Bool)

(declare-fun res!295666 () Bool)

(assert (=> b!493098 (=> (not res!295666) (not e!289631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493098 (= res!295666 (validKeyInArray!0 k!2280))))

(declare-fun b!493100 () Bool)

(declare-fun res!295667 () Bool)

(assert (=> b!493100 (=> (not res!295667) (not e!289631))))

(assert (=> b!493100 (= res!295667 (validKeyInArray!0 (select (arr!15338 a!3235) j!176)))))

(declare-fun b!493101 () Bool)

(assert (=> b!493101 (= e!289630 (not true))))

(declare-datatypes ((SeekEntryResult!3805 0))(
  ( (MissingZero!3805 (index!17399 (_ BitVec 32))) (Found!3805 (index!17400 (_ BitVec 32))) (Intermediate!3805 (undefined!4617 Bool) (index!17401 (_ BitVec 32)) (x!46483 (_ BitVec 32))) (Undefined!3805) (MissingVacant!3805 (index!17402 (_ BitVec 32))) )
))
(declare-fun lt!222964 () SeekEntryResult!3805)

(declare-fun lt!222966 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31907 (_ BitVec 32)) SeekEntryResult!3805)

(assert (=> b!493101 (= lt!222964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222966 (select (store (arr!15338 a!3235) i!1204 k!2280) j!176) (array!31908 (store (arr!15338 a!3235) i!1204 k!2280) (size!15702 a!3235)) mask!3524))))

(declare-fun lt!222963 () SeekEntryResult!3805)

(declare-fun lt!222965 () (_ BitVec 32))

(assert (=> b!493101 (= lt!222963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222965 (select (arr!15338 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493101 (= lt!222966 (toIndex!0 (select (store (arr!15338 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493101 (= lt!222965 (toIndex!0 (select (arr!15338 a!3235) j!176) mask!3524))))

(declare-fun e!289632 () Bool)

(assert (=> b!493101 e!289632))

(declare-fun res!295673 () Bool)

(assert (=> b!493101 (=> (not res!295673) (not e!289632))))

(assert (=> b!493101 (= res!295673 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14556 0))(
  ( (Unit!14557) )
))
(declare-fun lt!222962 () Unit!14556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14556)

(assert (=> b!493101 (= lt!222962 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493102 () Bool)

(assert (=> b!493102 (= e!289631 e!289630)))

(declare-fun res!295672 () Bool)

(assert (=> b!493102 (=> (not res!295672) (not e!289630))))

(declare-fun lt!222967 () SeekEntryResult!3805)

(assert (=> b!493102 (= res!295672 (or (= lt!222967 (MissingZero!3805 i!1204)) (= lt!222967 (MissingVacant!3805 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31907 (_ BitVec 32)) SeekEntryResult!3805)

(assert (=> b!493102 (= lt!222967 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493103 () Bool)

(assert (=> b!493103 (= e!289632 (= (seekEntryOrOpen!0 (select (arr!15338 a!3235) j!176) a!3235 mask!3524) (Found!3805 j!176)))))

(declare-fun b!493099 () Bool)

(declare-fun res!295668 () Bool)

(assert (=> b!493099 (=> (not res!295668) (not e!289630))))

(declare-datatypes ((List!9496 0))(
  ( (Nil!9493) (Cons!9492 (h!10360 (_ BitVec 64)) (t!15724 List!9496)) )
))
(declare-fun arrayNoDuplicates!0 (array!31907 (_ BitVec 32) List!9496) Bool)

(assert (=> b!493099 (= res!295668 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9493))))

(declare-fun res!295671 () Bool)

(assert (=> start!44962 (=> (not res!295671) (not e!289631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44962 (= res!295671 (validMask!0 mask!3524))))

(assert (=> start!44962 e!289631))

(assert (=> start!44962 true))

(declare-fun array_inv!11134 (array!31907) Bool)

(assert (=> start!44962 (array_inv!11134 a!3235)))

(assert (= (and start!44962 res!295671) b!493095))

(assert (= (and b!493095 res!295665) b!493100))

(assert (= (and b!493100 res!295667) b!493098))

(assert (= (and b!493098 res!295666) b!493096))

(assert (= (and b!493096 res!295669) b!493102))

(assert (= (and b!493102 res!295672) b!493097))

(assert (= (and b!493097 res!295670) b!493099))

(assert (= (and b!493099 res!295668) b!493101))

(assert (= (and b!493101 res!295673) b!493103))

(declare-fun m!473847 () Bool)

(assert (=> b!493100 m!473847))

(assert (=> b!493100 m!473847))

(declare-fun m!473849 () Bool)

(assert (=> b!493100 m!473849))

(declare-fun m!473851 () Bool)

(assert (=> b!493098 m!473851))

(declare-fun m!473853 () Bool)

(assert (=> b!493101 m!473853))

(declare-fun m!473855 () Bool)

(assert (=> b!493101 m!473855))

(assert (=> b!493101 m!473855))

(declare-fun m!473857 () Bool)

(assert (=> b!493101 m!473857))

(assert (=> b!493101 m!473847))

(declare-fun m!473859 () Bool)

(assert (=> b!493101 m!473859))

(assert (=> b!493101 m!473847))

(declare-fun m!473861 () Bool)

(assert (=> b!493101 m!473861))

(assert (=> b!493101 m!473855))

(declare-fun m!473863 () Bool)

(assert (=> b!493101 m!473863))

(assert (=> b!493101 m!473847))

(declare-fun m!473865 () Bool)

(assert (=> b!493101 m!473865))

(declare-fun m!473867 () Bool)

(assert (=> b!493101 m!473867))

(declare-fun m!473869 () Bool)

(assert (=> b!493099 m!473869))

(declare-fun m!473871 () Bool)

(assert (=> b!493097 m!473871))

(declare-fun m!473873 () Bool)

(assert (=> b!493102 m!473873))

(assert (=> b!493103 m!473847))

(assert (=> b!493103 m!473847))

(declare-fun m!473875 () Bool)

(assert (=> b!493103 m!473875))

(declare-fun m!473877 () Bool)

(assert (=> start!44962 m!473877))

(declare-fun m!473879 () Bool)

(assert (=> start!44962 m!473879))

(declare-fun m!473881 () Bool)

(assert (=> b!493096 m!473881))

(push 1)

