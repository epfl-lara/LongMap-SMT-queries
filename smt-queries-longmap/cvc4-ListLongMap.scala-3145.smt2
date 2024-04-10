; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44296 () Bool)

(assert start!44296)

(declare-fun b!487120 () Bool)

(declare-fun e!286659 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!487120 (= e!286659 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!31547 0))(
  ( (array!31548 (arr!15167 (Array (_ BitVec 32) (_ BitVec 64))) (size!15531 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31547)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31547 (_ BitVec 32)) Bool)

(assert (=> b!487120 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14214 0))(
  ( (Unit!14215) )
))
(declare-fun lt!219946 () Unit!14214)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14214)

(assert (=> b!487120 (= lt!219946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!290511 () Bool)

(declare-fun e!286657 () Bool)

(assert (=> start!44296 (=> (not res!290511) (not e!286657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44296 (= res!290511 (validMask!0 mask!3524))))

(assert (=> start!44296 e!286657))

(assert (=> start!44296 true))

(declare-fun array_inv!10963 (array!31547) Bool)

(assert (=> start!44296 (array_inv!10963 a!3235)))

(declare-fun b!487121 () Bool)

(declare-fun res!290509 () Bool)

(assert (=> b!487121 (=> (not res!290509) (not e!286659))))

(declare-datatypes ((List!9325 0))(
  ( (Nil!9322) (Cons!9321 (h!10177 (_ BitVec 64)) (t!15553 List!9325)) )
))
(declare-fun arrayNoDuplicates!0 (array!31547 (_ BitVec 32) List!9325) Bool)

(assert (=> b!487121 (= res!290509 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9322))))

(declare-fun b!487122 () Bool)

(assert (=> b!487122 (= e!286657 e!286659)))

(declare-fun res!290513 () Bool)

(assert (=> b!487122 (=> (not res!290513) (not e!286659))))

(declare-datatypes ((SeekEntryResult!3634 0))(
  ( (MissingZero!3634 (index!16715 (_ BitVec 32))) (Found!3634 (index!16716 (_ BitVec 32))) (Intermediate!3634 (undefined!4446 Bool) (index!16717 (_ BitVec 32)) (x!45838 (_ BitVec 32))) (Undefined!3634) (MissingVacant!3634 (index!16718 (_ BitVec 32))) )
))
(declare-fun lt!219945 () SeekEntryResult!3634)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487122 (= res!290513 (or (= lt!219945 (MissingZero!3634 i!1204)) (= lt!219945 (MissingVacant!3634 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31547 (_ BitVec 32)) SeekEntryResult!3634)

(assert (=> b!487122 (= lt!219945 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487123 () Bool)

(declare-fun res!290510 () Bool)

(assert (=> b!487123 (=> (not res!290510) (not e!286657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487123 (= res!290510 (validKeyInArray!0 (select (arr!15167 a!3235) j!176)))))

(declare-fun b!487124 () Bool)

(declare-fun res!290507 () Bool)

(assert (=> b!487124 (=> (not res!290507) (not e!286659))))

(assert (=> b!487124 (= res!290507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487125 () Bool)

(declare-fun res!290508 () Bool)

(assert (=> b!487125 (=> (not res!290508) (not e!286657))))

(declare-fun arrayContainsKey!0 (array!31547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487125 (= res!290508 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487126 () Bool)

(declare-fun res!290506 () Bool)

(assert (=> b!487126 (=> (not res!290506) (not e!286657))))

(assert (=> b!487126 (= res!290506 (validKeyInArray!0 k!2280))))

(declare-fun b!487127 () Bool)

(declare-fun res!290512 () Bool)

(assert (=> b!487127 (=> (not res!290512) (not e!286657))))

(assert (=> b!487127 (= res!290512 (and (= (size!15531 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15531 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15531 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44296 res!290511) b!487127))

(assert (= (and b!487127 res!290512) b!487123))

(assert (= (and b!487123 res!290510) b!487126))

(assert (= (and b!487126 res!290506) b!487125))

(assert (= (and b!487125 res!290508) b!487122))

(assert (= (and b!487122 res!290513) b!487124))

(assert (= (and b!487124 res!290507) b!487121))

(assert (= (and b!487121 res!290509) b!487120))

(declare-fun m!466967 () Bool)

(assert (=> b!487120 m!466967))

(declare-fun m!466969 () Bool)

(assert (=> b!487120 m!466969))

(declare-fun m!466971 () Bool)

(assert (=> b!487123 m!466971))

(assert (=> b!487123 m!466971))

(declare-fun m!466973 () Bool)

(assert (=> b!487123 m!466973))

(declare-fun m!466975 () Bool)

(assert (=> b!487126 m!466975))

(declare-fun m!466977 () Bool)

(assert (=> b!487125 m!466977))

(declare-fun m!466979 () Bool)

(assert (=> start!44296 m!466979))

(declare-fun m!466981 () Bool)

(assert (=> start!44296 m!466981))

(declare-fun m!466983 () Bool)

(assert (=> b!487122 m!466983))

(declare-fun m!466985 () Bool)

(assert (=> b!487121 m!466985))

(declare-fun m!466987 () Bool)

(assert (=> b!487124 m!466987))

(push 1)

(assert (not b!487121))

(assert (not b!487122))

(assert (not b!487123))

(assert (not start!44296))

(assert (not b!487124))

(assert (not b!487125))

(assert (not b!487126))

(assert (not b!487120))

(check-sat)

(pop 1)

