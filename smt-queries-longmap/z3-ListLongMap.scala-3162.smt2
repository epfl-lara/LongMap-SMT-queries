; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44588 () Bool)

(assert start!44588)

(declare-fun b!489095 () Bool)

(declare-fun e!287694 () Bool)

(assert (=> b!489095 (= e!287694 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31648 0))(
  ( (array!31649 (arr!15211 (Array (_ BitVec 32) (_ BitVec 64))) (size!15575 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31648)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!220704 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489095 (= lt!220704 (toIndex!0 (select (store (arr!15211 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287691 () Bool)

(assert (=> b!489095 e!287691))

(declare-fun res!292091 () Bool)

(assert (=> b!489095 (=> (not res!292091) (not e!287691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31648 (_ BitVec 32)) Bool)

(assert (=> b!489095 (= res!292091 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14275 0))(
  ( (Unit!14276) )
))
(declare-fun lt!220703 () Unit!14275)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14275)

(assert (=> b!489095 (= lt!220703 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489097 () Bool)

(declare-fun res!292093 () Bool)

(assert (=> b!489097 (=> (not res!292093) (not e!287694))))

(declare-datatypes ((List!9276 0))(
  ( (Nil!9273) (Cons!9272 (h!10134 (_ BitVec 64)) (t!15496 List!9276)) )
))
(declare-fun arrayNoDuplicates!0 (array!31648 (_ BitVec 32) List!9276) Bool)

(assert (=> b!489097 (= res!292093 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9273))))

(declare-fun b!489098 () Bool)

(declare-fun res!292085 () Bool)

(assert (=> b!489098 (=> (not res!292085) (not e!287694))))

(assert (=> b!489098 (= res!292085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489099 () Bool)

(declare-fun res!292088 () Bool)

(declare-fun e!287692 () Bool)

(assert (=> b!489099 (=> (not res!292088) (not e!287692))))

(declare-fun arrayContainsKey!0 (array!31648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489099 (= res!292088 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489100 () Bool)

(declare-datatypes ((SeekEntryResult!3634 0))(
  ( (MissingZero!3634 (index!16715 (_ BitVec 32))) (Found!3634 (index!16716 (_ BitVec 32))) (Intermediate!3634 (undefined!4446 Bool) (index!16717 (_ BitVec 32)) (x!45977 (_ BitVec 32))) (Undefined!3634) (MissingVacant!3634 (index!16718 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31648 (_ BitVec 32)) SeekEntryResult!3634)

(assert (=> b!489100 (= e!287691 (= (seekEntryOrOpen!0 (select (arr!15211 a!3235) j!176) a!3235 mask!3524) (Found!3634 j!176)))))

(declare-fun b!489101 () Bool)

(declare-fun res!292086 () Bool)

(assert (=> b!489101 (=> (not res!292086) (not e!287692))))

(assert (=> b!489101 (= res!292086 (and (= (size!15575 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15575 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15575 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489102 () Bool)

(declare-fun res!292090 () Bool)

(assert (=> b!489102 (=> (not res!292090) (not e!287692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489102 (= res!292090 (validKeyInArray!0 (select (arr!15211 a!3235) j!176)))))

(declare-fun b!489103 () Bool)

(assert (=> b!489103 (= e!287692 e!287694)))

(declare-fun res!292087 () Bool)

(assert (=> b!489103 (=> (not res!292087) (not e!287694))))

(declare-fun lt!220705 () SeekEntryResult!3634)

(assert (=> b!489103 (= res!292087 (or (= lt!220705 (MissingZero!3634 i!1204)) (= lt!220705 (MissingVacant!3634 i!1204))))))

(assert (=> b!489103 (= lt!220705 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489096 () Bool)

(declare-fun res!292092 () Bool)

(assert (=> b!489096 (=> (not res!292092) (not e!287692))))

(assert (=> b!489096 (= res!292092 (validKeyInArray!0 k0!2280))))

(declare-fun res!292089 () Bool)

(assert (=> start!44588 (=> (not res!292089) (not e!287692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44588 (= res!292089 (validMask!0 mask!3524))))

(assert (=> start!44588 e!287692))

(assert (=> start!44588 true))

(declare-fun array_inv!11070 (array!31648) Bool)

(assert (=> start!44588 (array_inv!11070 a!3235)))

(assert (= (and start!44588 res!292089) b!489101))

(assert (= (and b!489101 res!292086) b!489102))

(assert (= (and b!489102 res!292090) b!489096))

(assert (= (and b!489096 res!292092) b!489099))

(assert (= (and b!489099 res!292088) b!489103))

(assert (= (and b!489103 res!292087) b!489098))

(assert (= (and b!489098 res!292085) b!489097))

(assert (= (and b!489097 res!292093) b!489095))

(assert (= (and b!489095 res!292091) b!489100))

(declare-fun m!469063 () Bool)

(assert (=> b!489100 m!469063))

(assert (=> b!489100 m!469063))

(declare-fun m!469065 () Bool)

(assert (=> b!489100 m!469065))

(declare-fun m!469067 () Bool)

(assert (=> b!489096 m!469067))

(declare-fun m!469069 () Bool)

(assert (=> b!489095 m!469069))

(declare-fun m!469071 () Bool)

(assert (=> b!489095 m!469071))

(declare-fun m!469073 () Bool)

(assert (=> b!489095 m!469073))

(declare-fun m!469075 () Bool)

(assert (=> b!489095 m!469075))

(assert (=> b!489095 m!469073))

(declare-fun m!469077 () Bool)

(assert (=> b!489095 m!469077))

(declare-fun m!469079 () Bool)

(assert (=> start!44588 m!469079))

(declare-fun m!469081 () Bool)

(assert (=> start!44588 m!469081))

(declare-fun m!469083 () Bool)

(assert (=> b!489099 m!469083))

(declare-fun m!469085 () Bool)

(assert (=> b!489097 m!469085))

(declare-fun m!469087 () Bool)

(assert (=> b!489098 m!469087))

(declare-fun m!469089 () Bool)

(assert (=> b!489103 m!469089))

(assert (=> b!489102 m!469063))

(assert (=> b!489102 m!469063))

(declare-fun m!469091 () Bool)

(assert (=> b!489102 m!469091))

(check-sat (not start!44588) (not b!489102) (not b!489103) (not b!489096) (not b!489098) (not b!489099) (not b!489095) (not b!489100) (not b!489097))
(check-sat)
