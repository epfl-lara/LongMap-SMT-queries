; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44292 () Bool)

(assert start!44292)

(declare-fun b!487072 () Bool)

(declare-fun res!290465 () Bool)

(declare-fun e!286639 () Bool)

(assert (=> b!487072 (=> (not res!290465) (not e!286639))))

(declare-datatypes ((array!31543 0))(
  ( (array!31544 (arr!15165 (Array (_ BitVec 32) (_ BitVec 64))) (size!15529 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31543)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487072 (= res!290465 (validKeyInArray!0 (select (arr!15165 a!3235) j!176)))))

(declare-fun b!487073 () Bool)

(declare-fun res!290460 () Bool)

(assert (=> b!487073 (=> (not res!290460) (not e!286639))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!487073 (= res!290460 (validKeyInArray!0 k!2280))))

(declare-fun b!487074 () Bool)

(declare-fun res!290464 () Bool)

(declare-fun e!286641 () Bool)

(assert (=> b!487074 (=> (not res!290464) (not e!286641))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31543 (_ BitVec 32)) Bool)

(assert (=> b!487074 (= res!290464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487075 () Bool)

(declare-fun res!290459 () Bool)

(assert (=> b!487075 (=> (not res!290459) (not e!286639))))

(declare-fun arrayContainsKey!0 (array!31543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487075 (= res!290459 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487076 () Bool)

(assert (=> b!487076 (= e!286639 e!286641)))

(declare-fun res!290462 () Bool)

(assert (=> b!487076 (=> (not res!290462) (not e!286641))))

(declare-datatypes ((SeekEntryResult!3632 0))(
  ( (MissingZero!3632 (index!16707 (_ BitVec 32))) (Found!3632 (index!16708 (_ BitVec 32))) (Intermediate!3632 (undefined!4444 Bool) (index!16709 (_ BitVec 32)) (x!45836 (_ BitVec 32))) (Undefined!3632) (MissingVacant!3632 (index!16710 (_ BitVec 32))) )
))
(declare-fun lt!219933 () SeekEntryResult!3632)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487076 (= res!290462 (or (= lt!219933 (MissingZero!3632 i!1204)) (= lt!219933 (MissingVacant!3632 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31543 (_ BitVec 32)) SeekEntryResult!3632)

(assert (=> b!487076 (= lt!219933 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!290463 () Bool)

(assert (=> start!44292 (=> (not res!290463) (not e!286639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44292 (= res!290463 (validMask!0 mask!3524))))

(assert (=> start!44292 e!286639))

(assert (=> start!44292 true))

(declare-fun array_inv!10961 (array!31543) Bool)

(assert (=> start!44292 (array_inv!10961 a!3235)))

(declare-fun b!487077 () Bool)

(declare-fun res!290461 () Bool)

(assert (=> b!487077 (=> (not res!290461) (not e!286641))))

(declare-datatypes ((List!9323 0))(
  ( (Nil!9320) (Cons!9319 (h!10175 (_ BitVec 64)) (t!15551 List!9323)) )
))
(declare-fun arrayNoDuplicates!0 (array!31543 (_ BitVec 32) List!9323) Bool)

(assert (=> b!487077 (= res!290461 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9320))))

(declare-fun b!487078 () Bool)

(declare-fun res!290458 () Bool)

(assert (=> b!487078 (=> (not res!290458) (not e!286639))))

(assert (=> b!487078 (= res!290458 (and (= (size!15529 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15529 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15529 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487079 () Bool)

(assert (=> b!487079 (= e!286641 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!487079 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14210 0))(
  ( (Unit!14211) )
))
(declare-fun lt!219934 () Unit!14210)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14210)

(assert (=> b!487079 (= lt!219934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44292 res!290463) b!487078))

(assert (= (and b!487078 res!290458) b!487072))

(assert (= (and b!487072 res!290465) b!487073))

(assert (= (and b!487073 res!290460) b!487075))

(assert (= (and b!487075 res!290459) b!487076))

(assert (= (and b!487076 res!290462) b!487074))

(assert (= (and b!487074 res!290464) b!487077))

(assert (= (and b!487077 res!290461) b!487079))

(declare-fun m!466923 () Bool)

(assert (=> start!44292 m!466923))

(declare-fun m!466925 () Bool)

(assert (=> start!44292 m!466925))

(declare-fun m!466927 () Bool)

(assert (=> b!487079 m!466927))

(declare-fun m!466929 () Bool)

(assert (=> b!487079 m!466929))

(declare-fun m!466931 () Bool)

(assert (=> b!487077 m!466931))

(declare-fun m!466933 () Bool)

(assert (=> b!487075 m!466933))

(declare-fun m!466935 () Bool)

(assert (=> b!487076 m!466935))

(declare-fun m!466937 () Bool)

(assert (=> b!487073 m!466937))

(declare-fun m!466939 () Bool)

(assert (=> b!487074 m!466939))

(declare-fun m!466941 () Bool)

(assert (=> b!487072 m!466941))

(assert (=> b!487072 m!466941))

(declare-fun m!466943 () Bool)

(assert (=> b!487072 m!466943))

(push 1)

