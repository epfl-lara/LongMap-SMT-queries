; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44110 () Bool)

(assert start!44110)

(declare-fun b!486053 () Bool)

(declare-fun e!286103 () Bool)

(declare-datatypes ((array!31478 0))(
  ( (array!31479 (arr!15137 (Array (_ BitVec 32) (_ BitVec 64))) (size!15501 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31478)

(assert (=> b!486053 (= e!286103 (bvsgt #b00000000000000000000000000000000 (size!15501 a!3235)))))

(declare-fun res!289656 () Bool)

(declare-fun e!286102 () Bool)

(assert (=> start!44110 (=> (not res!289656) (not e!286102))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44110 (= res!289656 (validMask!0 mask!3524))))

(assert (=> start!44110 e!286102))

(assert (=> start!44110 true))

(declare-fun array_inv!10933 (array!31478) Bool)

(assert (=> start!44110 (array_inv!10933 a!3235)))

(declare-fun b!486054 () Bool)

(declare-fun res!289660 () Bool)

(assert (=> b!486054 (=> (not res!289660) (not e!286103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31478 (_ BitVec 32)) Bool)

(assert (=> b!486054 (= res!289660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486055 () Bool)

(assert (=> b!486055 (= e!286102 e!286103)))

(declare-fun res!289659 () Bool)

(assert (=> b!486055 (=> (not res!289659) (not e!286103))))

(declare-datatypes ((SeekEntryResult!3604 0))(
  ( (MissingZero!3604 (index!16595 (_ BitVec 32))) (Found!3604 (index!16596 (_ BitVec 32))) (Intermediate!3604 (undefined!4416 Bool) (index!16597 (_ BitVec 32)) (x!45728 (_ BitVec 32))) (Undefined!3604) (MissingVacant!3604 (index!16598 (_ BitVec 32))) )
))
(declare-fun lt!219619 () SeekEntryResult!3604)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486055 (= res!289659 (or (= lt!219619 (MissingZero!3604 i!1204)) (= lt!219619 (MissingVacant!3604 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31478 (_ BitVec 32)) SeekEntryResult!3604)

(assert (=> b!486055 (= lt!219619 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486056 () Bool)

(declare-fun res!289661 () Bool)

(assert (=> b!486056 (=> (not res!289661) (not e!286102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486056 (= res!289661 (validKeyInArray!0 k!2280))))

(declare-fun b!486057 () Bool)

(declare-fun res!289658 () Bool)

(assert (=> b!486057 (=> (not res!289658) (not e!286102))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486057 (= res!289658 (and (= (size!15501 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15501 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15501 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486058 () Bool)

(declare-fun res!289657 () Bool)

(assert (=> b!486058 (=> (not res!289657) (not e!286102))))

(assert (=> b!486058 (= res!289657 (validKeyInArray!0 (select (arr!15137 a!3235) j!176)))))

(declare-fun b!486059 () Bool)

(declare-fun res!289655 () Bool)

(assert (=> b!486059 (=> (not res!289655) (not e!286102))))

(declare-fun arrayContainsKey!0 (array!31478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486059 (= res!289655 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44110 res!289656) b!486057))

(assert (= (and b!486057 res!289658) b!486058))

(assert (= (and b!486058 res!289657) b!486056))

(assert (= (and b!486056 res!289661) b!486059))

(assert (= (and b!486059 res!289655) b!486055))

(assert (= (and b!486055 res!289659) b!486054))

(assert (= (and b!486054 res!289660) b!486053))

(declare-fun m!466097 () Bool)

(assert (=> b!486056 m!466097))

(declare-fun m!466099 () Bool)

(assert (=> start!44110 m!466099))

(declare-fun m!466101 () Bool)

(assert (=> start!44110 m!466101))

(declare-fun m!466103 () Bool)

(assert (=> b!486059 m!466103))

(declare-fun m!466105 () Bool)

(assert (=> b!486054 m!466105))

(declare-fun m!466107 () Bool)

(assert (=> b!486058 m!466107))

(assert (=> b!486058 m!466107))

(declare-fun m!466109 () Bool)

(assert (=> b!486058 m!466109))

(declare-fun m!466111 () Bool)

(assert (=> b!486055 m!466111))

(push 1)

(assert (not b!486055))

(assert (not b!486058))

(assert (not start!44110))

(assert (not b!486059))

(assert (not b!486054))

(assert (not b!486056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

