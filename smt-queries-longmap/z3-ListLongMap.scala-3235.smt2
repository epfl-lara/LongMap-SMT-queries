; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45204 () Bool)

(assert start!45204)

(declare-fun e!290927 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32102 0))(
  ( (array!32103 (arr!15434 (Array (_ BitVec 32) (_ BitVec 64))) (size!15799 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32102)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!496116 () Bool)

(declare-datatypes ((SeekEntryResult!3898 0))(
  ( (MissingZero!3898 (index!17771 (_ BitVec 32))) (Found!3898 (index!17772 (_ BitVec 32))) (Intermediate!3898 (undefined!4710 Bool) (index!17773 (_ BitVec 32)) (x!46841 (_ BitVec 32))) (Undefined!3898) (MissingVacant!3898 (index!17774 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32102 (_ BitVec 32)) SeekEntryResult!3898)

(assert (=> b!496116 (= e!290927 (= (seekEntryOrOpen!0 (select (arr!15434 a!3235) j!176) a!3235 mask!3524) (Found!3898 j!176)))))

(declare-fun b!496117 () Bool)

(declare-fun res!298651 () Bool)

(declare-fun e!290928 () Bool)

(assert (=> b!496117 (=> (not res!298651) (not e!290928))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496117 (= res!298651 (validKeyInArray!0 k0!2280))))

(declare-fun b!496118 () Bool)

(declare-fun e!290926 () Bool)

(assert (=> b!496118 (= e!290928 e!290926)))

(declare-fun res!298654 () Bool)

(assert (=> b!496118 (=> (not res!298654) (not e!290926))))

(declare-fun lt!224485 () SeekEntryResult!3898)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496118 (= res!298654 (or (= lt!224485 (MissingZero!3898 i!1204)) (= lt!224485 (MissingVacant!3898 i!1204))))))

(assert (=> b!496118 (= lt!224485 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496119 () Bool)

(declare-fun res!298648 () Bool)

(assert (=> b!496119 (=> (not res!298648) (not e!290926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32102 (_ BitVec 32)) Bool)

(assert (=> b!496119 (= res!298648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496120 () Bool)

(declare-fun res!298650 () Bool)

(assert (=> b!496120 (=> (not res!298650) (not e!290928))))

(assert (=> b!496120 (= res!298650 (validKeyInArray!0 (select (arr!15434 a!3235) j!176)))))

(declare-fun b!496121 () Bool)

(declare-fun e!290925 () Bool)

(assert (=> b!496121 (= e!290926 (not e!290925))))

(declare-fun res!298646 () Bool)

(assert (=> b!496121 (=> res!298646 e!290925)))

(declare-fun lt!224487 () SeekEntryResult!3898)

(declare-fun lt!224488 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32102 (_ BitVec 32)) SeekEntryResult!3898)

(assert (=> b!496121 (= res!298646 (= lt!224487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224488 (select (store (arr!15434 a!3235) i!1204 k0!2280) j!176) (array!32103 (store (arr!15434 a!3235) i!1204 k0!2280) (size!15799 a!3235)) mask!3524)))))

(declare-fun lt!224486 () (_ BitVec 32))

(assert (=> b!496121 (= lt!224487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224486 (select (arr!15434 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496121 (= lt!224488 (toIndex!0 (select (store (arr!15434 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496121 (= lt!224486 (toIndex!0 (select (arr!15434 a!3235) j!176) mask!3524))))

(assert (=> b!496121 e!290927))

(declare-fun res!298652 () Bool)

(assert (=> b!496121 (=> (not res!298652) (not e!290927))))

(assert (=> b!496121 (= res!298652 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14728 0))(
  ( (Unit!14729) )
))
(declare-fun lt!224484 () Unit!14728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14728)

(assert (=> b!496121 (= lt!224484 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!298645 () Bool)

(assert (=> start!45204 (=> (not res!298645) (not e!290928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45204 (= res!298645 (validMask!0 mask!3524))))

(assert (=> start!45204 e!290928))

(assert (=> start!45204 true))

(declare-fun array_inv!11317 (array!32102) Bool)

(assert (=> start!45204 (array_inv!11317 a!3235)))

(declare-fun b!496122 () Bool)

(declare-fun res!298649 () Bool)

(assert (=> b!496122 (=> (not res!298649) (not e!290928))))

(assert (=> b!496122 (= res!298649 (and (= (size!15799 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15799 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15799 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496123 () Bool)

(assert (=> b!496123 (= e!290925 true)))

(assert (=> b!496123 (and (bvslt (x!46841 lt!224487) #b01111111111111111111111111111110) (or (= (select (arr!15434 a!3235) (index!17773 lt!224487)) (select (arr!15434 a!3235) j!176)) (= (select (arr!15434 a!3235) (index!17773 lt!224487)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15434 a!3235) (index!17773 lt!224487)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496124 () Bool)

(declare-fun res!298653 () Bool)

(assert (=> b!496124 (=> (not res!298653) (not e!290928))))

(declare-fun arrayContainsKey!0 (array!32102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496124 (= res!298653 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496125 () Bool)

(declare-fun res!298647 () Bool)

(assert (=> b!496125 (=> (not res!298647) (not e!290926))))

(declare-datatypes ((List!9631 0))(
  ( (Nil!9628) (Cons!9627 (h!10498 (_ BitVec 64)) (t!15850 List!9631)) )
))
(declare-fun arrayNoDuplicates!0 (array!32102 (_ BitVec 32) List!9631) Bool)

(assert (=> b!496125 (= res!298647 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9628))))

(declare-fun b!496126 () Bool)

(declare-fun res!298655 () Bool)

(assert (=> b!496126 (=> res!298655 e!290925)))

(get-info :version)

(assert (=> b!496126 (= res!298655 (or (undefined!4710 lt!224487) (not ((_ is Intermediate!3898) lt!224487))))))

(assert (= (and start!45204 res!298645) b!496122))

(assert (= (and b!496122 res!298649) b!496120))

(assert (= (and b!496120 res!298650) b!496117))

(assert (= (and b!496117 res!298651) b!496124))

(assert (= (and b!496124 res!298653) b!496118))

(assert (= (and b!496118 res!298654) b!496119))

(assert (= (and b!496119 res!298648) b!496125))

(assert (= (and b!496125 res!298647) b!496121))

(assert (= (and b!496121 res!298652) b!496116))

(assert (= (and b!496121 (not res!298646)) b!496126))

(assert (= (and b!496126 (not res!298655)) b!496123))

(declare-fun m!476863 () Bool)

(assert (=> b!496119 m!476863))

(declare-fun m!476865 () Bool)

(assert (=> b!496117 m!476865))

(declare-fun m!476867 () Bool)

(assert (=> b!496118 m!476867))

(declare-fun m!476869 () Bool)

(assert (=> b!496116 m!476869))

(assert (=> b!496116 m!476869))

(declare-fun m!476871 () Bool)

(assert (=> b!496116 m!476871))

(declare-fun m!476873 () Bool)

(assert (=> start!45204 m!476873))

(declare-fun m!476875 () Bool)

(assert (=> start!45204 m!476875))

(declare-fun m!476877 () Bool)

(assert (=> b!496124 m!476877))

(assert (=> b!496120 m!476869))

(assert (=> b!496120 m!476869))

(declare-fun m!476879 () Bool)

(assert (=> b!496120 m!476879))

(declare-fun m!476881 () Bool)

(assert (=> b!496123 m!476881))

(assert (=> b!496123 m!476869))

(declare-fun m!476883 () Bool)

(assert (=> b!496121 m!476883))

(declare-fun m!476885 () Bool)

(assert (=> b!496121 m!476885))

(assert (=> b!496121 m!476869))

(declare-fun m!476887 () Bool)

(assert (=> b!496121 m!476887))

(assert (=> b!496121 m!476869))

(declare-fun m!476889 () Bool)

(assert (=> b!496121 m!476889))

(declare-fun m!476891 () Bool)

(assert (=> b!496121 m!476891))

(declare-fun m!476893 () Bool)

(assert (=> b!496121 m!476893))

(assert (=> b!496121 m!476869))

(declare-fun m!476895 () Bool)

(assert (=> b!496121 m!476895))

(assert (=> b!496121 m!476891))

(declare-fun m!476897 () Bool)

(assert (=> b!496121 m!476897))

(assert (=> b!496121 m!476891))

(declare-fun m!476899 () Bool)

(assert (=> b!496125 m!476899))

(check-sat (not b!496124) (not start!45204) (not b!496120) (not b!496117) (not b!496125) (not b!496118) (not b!496116) (not b!496119) (not b!496121))
(check-sat)
