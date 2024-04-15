; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44268 () Bool)

(assert start!44268)

(declare-fun b!486664 () Bool)

(declare-fun res!290194 () Bool)

(declare-fun e!286413 () Bool)

(assert (=> b!486664 (=> (not res!290194) (not e!286413))))

(declare-datatypes ((array!31529 0))(
  ( (array!31530 (arr!15158 (Array (_ BitVec 32) (_ BitVec 64))) (size!15523 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31529)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486664 (= res!290194 (validKeyInArray!0 (select (arr!15158 a!3235) j!176)))))

(declare-fun b!486665 () Bool)

(declare-fun res!290193 () Bool)

(assert (=> b!486665 (=> (not res!290193) (not e!286413))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486665 (= res!290193 (and (= (size!15523 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15523 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15523 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290192 () Bool)

(assert (=> start!44268 (=> (not res!290192) (not e!286413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44268 (= res!290192 (validMask!0 mask!3524))))

(assert (=> start!44268 e!286413))

(assert (=> start!44268 true))

(declare-fun array_inv!11041 (array!31529) Bool)

(assert (=> start!44268 (array_inv!11041 a!3235)))

(declare-fun b!486666 () Bool)

(declare-fun e!286411 () Bool)

(assert (=> b!486666 (= e!286411 false)))

(declare-fun lt!219663 () Bool)

(declare-datatypes ((List!9355 0))(
  ( (Nil!9352) (Cons!9351 (h!10207 (_ BitVec 64)) (t!15574 List!9355)) )
))
(declare-fun arrayNoDuplicates!0 (array!31529 (_ BitVec 32) List!9355) Bool)

(assert (=> b!486666 (= lt!219663 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9352))))

(declare-fun b!486667 () Bool)

(assert (=> b!486667 (= e!286413 e!286411)))

(declare-fun res!290195 () Bool)

(assert (=> b!486667 (=> (not res!290195) (not e!286411))))

(declare-datatypes ((SeekEntryResult!3622 0))(
  ( (MissingZero!3622 (index!16667 (_ BitVec 32))) (Found!3622 (index!16668 (_ BitVec 32))) (Intermediate!3622 (undefined!4434 Bool) (index!16669 (_ BitVec 32)) (x!45805 (_ BitVec 32))) (Undefined!3622) (MissingVacant!3622 (index!16670 (_ BitVec 32))) )
))
(declare-fun lt!219664 () SeekEntryResult!3622)

(assert (=> b!486667 (= res!290195 (or (= lt!219664 (MissingZero!3622 i!1204)) (= lt!219664 (MissingVacant!3622 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31529 (_ BitVec 32)) SeekEntryResult!3622)

(assert (=> b!486667 (= lt!219664 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486668 () Bool)

(declare-fun res!290197 () Bool)

(assert (=> b!486668 (=> (not res!290197) (not e!286411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31529 (_ BitVec 32)) Bool)

(assert (=> b!486668 (= res!290197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486669 () Bool)

(declare-fun res!290196 () Bool)

(assert (=> b!486669 (=> (not res!290196) (not e!286413))))

(declare-fun arrayContainsKey!0 (array!31529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486669 (= res!290196 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486670 () Bool)

(declare-fun res!290198 () Bool)

(assert (=> b!486670 (=> (not res!290198) (not e!286413))))

(assert (=> b!486670 (= res!290198 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44268 res!290192) b!486665))

(assert (= (and b!486665 res!290193) b!486664))

(assert (= (and b!486664 res!290194) b!486670))

(assert (= (and b!486670 res!290198) b!486669))

(assert (= (and b!486669 res!290196) b!486667))

(assert (= (and b!486667 res!290195) b!486668))

(assert (= (and b!486668 res!290197) b!486666))

(declare-fun m!466051 () Bool)

(assert (=> b!486670 m!466051))

(declare-fun m!466053 () Bool)

(assert (=> b!486669 m!466053))

(declare-fun m!466055 () Bool)

(assert (=> b!486668 m!466055))

(declare-fun m!466057 () Bool)

(assert (=> b!486664 m!466057))

(assert (=> b!486664 m!466057))

(declare-fun m!466059 () Bool)

(assert (=> b!486664 m!466059))

(declare-fun m!466061 () Bool)

(assert (=> start!44268 m!466061))

(declare-fun m!466063 () Bool)

(assert (=> start!44268 m!466063))

(declare-fun m!466065 () Bool)

(assert (=> b!486666 m!466065))

(declare-fun m!466067 () Bool)

(assert (=> b!486667 m!466067))

(check-sat (not b!486664) (not start!44268) (not b!486667) (not b!486670) (not b!486668) (not b!486669) (not b!486666))
(check-sat)
