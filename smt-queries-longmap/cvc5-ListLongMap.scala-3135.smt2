; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44106 () Bool)

(assert start!44106)

(declare-fun b!486011 () Bool)

(declare-fun res!289617 () Bool)

(declare-fun e!286085 () Bool)

(assert (=> b!486011 (=> (not res!289617) (not e!286085))))

(declare-datatypes ((array!31474 0))(
  ( (array!31475 (arr!15135 (Array (_ BitVec 32) (_ BitVec 64))) (size!15499 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31474)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486011 (= res!289617 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486012 () Bool)

(declare-fun res!289615 () Bool)

(assert (=> b!486012 (=> (not res!289615) (not e!286085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486012 (= res!289615 (validKeyInArray!0 k!2280))))

(declare-fun b!486013 () Bool)

(declare-fun e!286084 () Bool)

(assert (=> b!486013 (= e!286084 (bvsgt #b00000000000000000000000000000000 (size!15499 a!3235)))))

(declare-fun b!486014 () Bool)

(declare-fun res!289618 () Bool)

(assert (=> b!486014 (=> (not res!289618) (not e!286084))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31474 (_ BitVec 32)) Bool)

(assert (=> b!486014 (= res!289618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486015 () Bool)

(assert (=> b!486015 (= e!286085 e!286084)))

(declare-fun res!289614 () Bool)

(assert (=> b!486015 (=> (not res!289614) (not e!286084))))

(declare-datatypes ((SeekEntryResult!3602 0))(
  ( (MissingZero!3602 (index!16587 (_ BitVec 32))) (Found!3602 (index!16588 (_ BitVec 32))) (Intermediate!3602 (undefined!4414 Bool) (index!16589 (_ BitVec 32)) (x!45726 (_ BitVec 32))) (Undefined!3602) (MissingVacant!3602 (index!16590 (_ BitVec 32))) )
))
(declare-fun lt!219613 () SeekEntryResult!3602)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486015 (= res!289614 (or (= lt!219613 (MissingZero!3602 i!1204)) (= lt!219613 (MissingVacant!3602 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31474 (_ BitVec 32)) SeekEntryResult!3602)

(assert (=> b!486015 (= lt!219613 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486016 () Bool)

(declare-fun res!289616 () Bool)

(assert (=> b!486016 (=> (not res!289616) (not e!286085))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486016 (= res!289616 (and (= (size!15499 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15499 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15499 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!289619 () Bool)

(assert (=> start!44106 (=> (not res!289619) (not e!286085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44106 (= res!289619 (validMask!0 mask!3524))))

(assert (=> start!44106 e!286085))

(assert (=> start!44106 true))

(declare-fun array_inv!10931 (array!31474) Bool)

(assert (=> start!44106 (array_inv!10931 a!3235)))

(declare-fun b!486017 () Bool)

(declare-fun res!289613 () Bool)

(assert (=> b!486017 (=> (not res!289613) (not e!286085))))

(assert (=> b!486017 (= res!289613 (validKeyInArray!0 (select (arr!15135 a!3235) j!176)))))

(assert (= (and start!44106 res!289619) b!486016))

(assert (= (and b!486016 res!289616) b!486017))

(assert (= (and b!486017 res!289613) b!486012))

(assert (= (and b!486012 res!289615) b!486011))

(assert (= (and b!486011 res!289617) b!486015))

(assert (= (and b!486015 res!289614) b!486014))

(assert (= (and b!486014 res!289618) b!486013))

(declare-fun m!466065 () Bool)

(assert (=> start!44106 m!466065))

(declare-fun m!466067 () Bool)

(assert (=> start!44106 m!466067))

(declare-fun m!466069 () Bool)

(assert (=> b!486017 m!466069))

(assert (=> b!486017 m!466069))

(declare-fun m!466071 () Bool)

(assert (=> b!486017 m!466071))

(declare-fun m!466073 () Bool)

(assert (=> b!486015 m!466073))

(declare-fun m!466075 () Bool)

(assert (=> b!486012 m!466075))

(declare-fun m!466077 () Bool)

(assert (=> b!486014 m!466077))

(declare-fun m!466079 () Bool)

(assert (=> b!486011 m!466079))

(push 1)

(assert (not b!486012))

(assert (not b!486017))

(assert (not b!486015))

(assert (not b!486014))

(assert (not start!44106))

(assert (not b!486011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

