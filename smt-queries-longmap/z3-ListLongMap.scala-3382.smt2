; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46706 () Bool)

(assert start!46706)

(declare-fun b!515512 () Bool)

(declare-fun res!315081 () Bool)

(declare-fun e!300981 () Bool)

(assert (=> b!515512 (=> (not res!315081) (not e!300981))))

(declare-datatypes ((array!33018 0))(
  ( (array!33019 (arr!15877 (Array (_ BitVec 32) (_ BitVec 64))) (size!16241 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33018)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515512 (= res!315081 (validKeyInArray!0 (select (arr!15877 a!3235) j!176)))))

(declare-fun b!515513 () Bool)

(declare-fun res!315085 () Bool)

(assert (=> b!515513 (=> (not res!315085) (not e!300981))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!515513 (= res!315085 (validKeyInArray!0 k0!2280))))

(declare-fun b!515514 () Bool)

(declare-fun res!315076 () Bool)

(assert (=> b!515514 (=> (not res!315076) (not e!300981))))

(declare-fun arrayContainsKey!0 (array!33018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515514 (= res!315076 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515515 () Bool)

(declare-fun e!300980 () Bool)

(declare-fun e!300982 () Bool)

(assert (=> b!515515 (= e!300980 (not e!300982))))

(declare-fun res!315079 () Bool)

(assert (=> b!515515 (=> res!315079 e!300982)))

(declare-datatypes ((SeekEntryResult!4344 0))(
  ( (MissingZero!4344 (index!19564 (_ BitVec 32))) (Found!4344 (index!19565 (_ BitVec 32))) (Intermediate!4344 (undefined!5156 Bool) (index!19566 (_ BitVec 32)) (x!48531 (_ BitVec 32))) (Undefined!4344) (MissingVacant!4344 (index!19567 (_ BitVec 32))) )
))
(declare-fun lt!235998 () SeekEntryResult!4344)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!235996 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33018 (_ BitVec 32)) SeekEntryResult!4344)

(assert (=> b!515515 (= res!315079 (= lt!235998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235996 (select (store (arr!15877 a!3235) i!1204 k0!2280) j!176) (array!33019 (store (arr!15877 a!3235) i!1204 k0!2280) (size!16241 a!3235)) mask!3524)))))

(declare-fun lt!235999 () (_ BitVec 32))

(assert (=> b!515515 (= lt!235998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235999 (select (arr!15877 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515515 (= lt!235996 (toIndex!0 (select (store (arr!15877 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515515 (= lt!235999 (toIndex!0 (select (arr!15877 a!3235) j!176) mask!3524))))

(declare-fun e!300984 () Bool)

(assert (=> b!515515 e!300984))

(declare-fun res!315077 () Bool)

(assert (=> b!515515 (=> (not res!315077) (not e!300984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33018 (_ BitVec 32)) Bool)

(assert (=> b!515515 (= res!315077 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15946 0))(
  ( (Unit!15947) )
))
(declare-fun lt!235995 () Unit!15946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15946)

(assert (=> b!515515 (= lt!235995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515516 () Bool)

(declare-fun res!315078 () Bool)

(assert (=> b!515516 (=> res!315078 e!300982)))

(get-info :version)

(assert (=> b!515516 (= res!315078 (or (undefined!5156 lt!235998) (not ((_ is Intermediate!4344) lt!235998))))))

(declare-fun b!515517 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33018 (_ BitVec 32)) SeekEntryResult!4344)

(assert (=> b!515517 (= e!300984 (= (seekEntryOrOpen!0 (select (arr!15877 a!3235) j!176) a!3235 mask!3524) (Found!4344 j!176)))))

(declare-fun b!515518 () Bool)

(assert (=> b!515518 (= e!300981 e!300980)))

(declare-fun res!315083 () Bool)

(assert (=> b!515518 (=> (not res!315083) (not e!300980))))

(declare-fun lt!235997 () SeekEntryResult!4344)

(assert (=> b!515518 (= res!315083 (or (= lt!235997 (MissingZero!4344 i!1204)) (= lt!235997 (MissingVacant!4344 i!1204))))))

(assert (=> b!515518 (= lt!235997 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515519 () Bool)

(declare-fun res!315082 () Bool)

(assert (=> b!515519 (=> (not res!315082) (not e!300981))))

(assert (=> b!515519 (= res!315082 (and (= (size!16241 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16241 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16241 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!315084 () Bool)

(assert (=> start!46706 (=> (not res!315084) (not e!300981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46706 (= res!315084 (validMask!0 mask!3524))))

(assert (=> start!46706 e!300981))

(assert (=> start!46706 true))

(declare-fun array_inv!11673 (array!33018) Bool)

(assert (=> start!46706 (array_inv!11673 a!3235)))

(declare-fun b!515520 () Bool)

(declare-fun res!315086 () Bool)

(assert (=> b!515520 (=> (not res!315086) (not e!300980))))

(assert (=> b!515520 (= res!315086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515521 () Bool)

(assert (=> b!515521 (= e!300982 true)))

(assert (=> b!515521 (and (bvslt (x!48531 lt!235998) #b01111111111111111111111111111110) (or (= (select (arr!15877 a!3235) (index!19566 lt!235998)) (select (arr!15877 a!3235) j!176)) (= (select (arr!15877 a!3235) (index!19566 lt!235998)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15877 a!3235) (index!19566 lt!235998)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515522 () Bool)

(declare-fun res!315080 () Bool)

(assert (=> b!515522 (=> (not res!315080) (not e!300980))))

(declare-datatypes ((List!10035 0))(
  ( (Nil!10032) (Cons!10031 (h!10929 (_ BitVec 64)) (t!16263 List!10035)) )
))
(declare-fun arrayNoDuplicates!0 (array!33018 (_ BitVec 32) List!10035) Bool)

(assert (=> b!515522 (= res!315080 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10032))))

(assert (= (and start!46706 res!315084) b!515519))

(assert (= (and b!515519 res!315082) b!515512))

(assert (= (and b!515512 res!315081) b!515513))

(assert (= (and b!515513 res!315085) b!515514))

(assert (= (and b!515514 res!315076) b!515518))

(assert (= (and b!515518 res!315083) b!515520))

(assert (= (and b!515520 res!315086) b!515522))

(assert (= (and b!515522 res!315080) b!515515))

(assert (= (and b!515515 res!315077) b!515517))

(assert (= (and b!515515 (not res!315079)) b!515516))

(assert (= (and b!515516 (not res!315078)) b!515521))

(declare-fun m!496859 () Bool)

(assert (=> b!515522 m!496859))

(declare-fun m!496861 () Bool)

(assert (=> b!515518 m!496861))

(declare-fun m!496863 () Bool)

(assert (=> b!515512 m!496863))

(assert (=> b!515512 m!496863))

(declare-fun m!496865 () Bool)

(assert (=> b!515512 m!496865))

(declare-fun m!496867 () Bool)

(assert (=> b!515520 m!496867))

(declare-fun m!496869 () Bool)

(assert (=> b!515513 m!496869))

(declare-fun m!496871 () Bool)

(assert (=> b!515521 m!496871))

(assert (=> b!515521 m!496863))

(declare-fun m!496873 () Bool)

(assert (=> start!46706 m!496873))

(declare-fun m!496875 () Bool)

(assert (=> start!46706 m!496875))

(declare-fun m!496877 () Bool)

(assert (=> b!515514 m!496877))

(assert (=> b!515517 m!496863))

(assert (=> b!515517 m!496863))

(declare-fun m!496879 () Bool)

(assert (=> b!515517 m!496879))

(declare-fun m!496881 () Bool)

(assert (=> b!515515 m!496881))

(declare-fun m!496883 () Bool)

(assert (=> b!515515 m!496883))

(declare-fun m!496885 () Bool)

(assert (=> b!515515 m!496885))

(assert (=> b!515515 m!496885))

(declare-fun m!496887 () Bool)

(assert (=> b!515515 m!496887))

(assert (=> b!515515 m!496863))

(declare-fun m!496889 () Bool)

(assert (=> b!515515 m!496889))

(assert (=> b!515515 m!496863))

(assert (=> b!515515 m!496863))

(declare-fun m!496891 () Bool)

(assert (=> b!515515 m!496891))

(declare-fun m!496893 () Bool)

(assert (=> b!515515 m!496893))

(assert (=> b!515515 m!496885))

(declare-fun m!496895 () Bool)

(assert (=> b!515515 m!496895))

(check-sat (not b!515522) (not b!515515) (not b!515514) (not b!515517) (not b!515512) (not b!515518) (not b!515513) (not start!46706) (not b!515520))
(check-sat)
