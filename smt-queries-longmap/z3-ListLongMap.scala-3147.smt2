; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44294 () Bool)

(assert start!44294)

(declare-fun b!487155 () Bool)

(declare-fun res!290597 () Bool)

(declare-fun e!286655 () Bool)

(assert (=> b!487155 (=> (not res!290597) (not e!286655))))

(declare-datatypes ((array!31546 0))(
  ( (array!31547 (arr!15166 (Array (_ BitVec 32) (_ BitVec 64))) (size!15530 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31546)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487155 (= res!290597 (validKeyInArray!0 (select (arr!15166 a!3235) j!176)))))

(declare-fun b!487156 () Bool)

(declare-fun e!286656 () Bool)

(assert (=> b!487156 (= e!286655 e!286656)))

(declare-fun res!290598 () Bool)

(assert (=> b!487156 (=> (not res!290598) (not e!286656))))

(declare-datatypes ((SeekEntryResult!3589 0))(
  ( (MissingZero!3589 (index!16535 (_ BitVec 32))) (Found!3589 (index!16536 (_ BitVec 32))) (Intermediate!3589 (undefined!4401 Bool) (index!16537 (_ BitVec 32)) (x!45806 (_ BitVec 32))) (Undefined!3589) (MissingVacant!3589 (index!16538 (_ BitVec 32))) )
))
(declare-fun lt!219982 () SeekEntryResult!3589)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487156 (= res!290598 (or (= lt!219982 (MissingZero!3589 i!1204)) (= lt!219982 (MissingVacant!3589 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31546 (_ BitVec 32)) SeekEntryResult!3589)

(assert (=> b!487156 (= lt!219982 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487157 () Bool)

(declare-fun res!290599 () Bool)

(assert (=> b!487157 (=> (not res!290599) (not e!286655))))

(assert (=> b!487157 (= res!290599 (and (= (size!15530 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15530 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15530 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487158 () Bool)

(declare-fun res!290602 () Bool)

(assert (=> b!487158 (=> (not res!290602) (not e!286656))))

(declare-datatypes ((List!9231 0))(
  ( (Nil!9228) (Cons!9227 (h!10083 (_ BitVec 64)) (t!15451 List!9231)) )
))
(declare-fun arrayNoDuplicates!0 (array!31546 (_ BitVec 32) List!9231) Bool)

(assert (=> b!487158 (= res!290602 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9228))))

(declare-fun b!487159 () Bool)

(assert (=> b!487159 (= e!286656 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31546 (_ BitVec 32)) Bool)

(assert (=> b!487159 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14185 0))(
  ( (Unit!14186) )
))
(declare-fun lt!219981 () Unit!14185)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14185)

(assert (=> b!487159 (= lt!219981 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487160 () Bool)

(declare-fun res!290595 () Bool)

(assert (=> b!487160 (=> (not res!290595) (not e!286655))))

(declare-fun arrayContainsKey!0 (array!31546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487160 (= res!290595 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!290600 () Bool)

(assert (=> start!44294 (=> (not res!290600) (not e!286655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44294 (= res!290600 (validMask!0 mask!3524))))

(assert (=> start!44294 e!286655))

(assert (=> start!44294 true))

(declare-fun array_inv!11025 (array!31546) Bool)

(assert (=> start!44294 (array_inv!11025 a!3235)))

(declare-fun b!487161 () Bool)

(declare-fun res!290601 () Bool)

(assert (=> b!487161 (=> (not res!290601) (not e!286656))))

(assert (=> b!487161 (= res!290601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487162 () Bool)

(declare-fun res!290596 () Bool)

(assert (=> b!487162 (=> (not res!290596) (not e!286655))))

(assert (=> b!487162 (= res!290596 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44294 res!290600) b!487157))

(assert (= (and b!487157 res!290599) b!487155))

(assert (= (and b!487155 res!290597) b!487162))

(assert (= (and b!487162 res!290596) b!487160))

(assert (= (and b!487160 res!290595) b!487156))

(assert (= (and b!487156 res!290598) b!487161))

(assert (= (and b!487161 res!290601) b!487158))

(assert (= (and b!487158 res!290602) b!487159))

(declare-fun m!467239 () Bool)

(assert (=> b!487159 m!467239))

(declare-fun m!467241 () Bool)

(assert (=> b!487159 m!467241))

(declare-fun m!467243 () Bool)

(assert (=> b!487158 m!467243))

(declare-fun m!467245 () Bool)

(assert (=> b!487160 m!467245))

(declare-fun m!467247 () Bool)

(assert (=> start!44294 m!467247))

(declare-fun m!467249 () Bool)

(assert (=> start!44294 m!467249))

(declare-fun m!467251 () Bool)

(assert (=> b!487161 m!467251))

(declare-fun m!467253 () Bool)

(assert (=> b!487155 m!467253))

(assert (=> b!487155 m!467253))

(declare-fun m!467255 () Bool)

(assert (=> b!487155 m!467255))

(declare-fun m!467257 () Bool)

(assert (=> b!487162 m!467257))

(declare-fun m!467259 () Bool)

(assert (=> b!487156 m!467259))

(check-sat (not b!487161) (not b!487160) (not b!487162) (not b!487156) (not b!487158) (not b!487155) (not b!487159) (not start!44294))
(check-sat)
