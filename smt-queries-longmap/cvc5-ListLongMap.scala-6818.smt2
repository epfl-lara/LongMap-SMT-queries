; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85726 () Bool)

(assert start!85726)

(declare-fun res!665219 () Bool)

(declare-fun e!561232 () Bool)

(assert (=> start!85726 (=> (not res!665219) (not e!561232))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85726 (= res!665219 (validMask!0 mask!3464))))

(assert (=> start!85726 e!561232))

(declare-datatypes ((array!62879 0))(
  ( (array!62880 (arr!30278 (Array (_ BitVec 32) (_ BitVec 64))) (size!30782 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62879)

(declare-fun array_inv!23421 (array!62879) Bool)

(assert (=> start!85726 (array_inv!23421 a!3219)))

(assert (=> start!85726 true))

(declare-fun b!994584 () Bool)

(assert (=> b!994584 (= e!561232 false)))

(declare-datatypes ((SeekEntryResult!9235 0))(
  ( (MissingZero!9235 (index!39311 (_ BitVec 32))) (Found!9235 (index!39312 (_ BitVec 32))) (Intermediate!9235 (undefined!10047 Bool) (index!39313 (_ BitVec 32)) (x!86767 (_ BitVec 32))) (Undefined!9235) (MissingVacant!9235 (index!39314 (_ BitVec 32))) )
))
(declare-fun lt!440536 () SeekEntryResult!9235)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62879 (_ BitVec 32)) SeekEntryResult!9235)

(assert (=> b!994584 (= lt!440536 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994585 () Bool)

(declare-fun res!665217 () Bool)

(assert (=> b!994585 (=> (not res!665217) (not e!561232))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994585 (= res!665217 (validKeyInArray!0 (select (arr!30278 a!3219) j!170)))))

(declare-fun b!994586 () Bool)

(declare-fun res!665215 () Bool)

(assert (=> b!994586 (=> (not res!665215) (not e!561232))))

(declare-fun arrayContainsKey!0 (array!62879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994586 (= res!665215 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994587 () Bool)

(declare-fun res!665216 () Bool)

(assert (=> b!994587 (=> (not res!665216) (not e!561232))))

(assert (=> b!994587 (= res!665216 (validKeyInArray!0 k!2224))))

(declare-fun b!994588 () Bool)

(declare-fun res!665218 () Bool)

(assert (=> b!994588 (=> (not res!665218) (not e!561232))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994588 (= res!665218 (and (= (size!30782 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30782 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30782 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!85726 res!665219) b!994588))

(assert (= (and b!994588 res!665218) b!994585))

(assert (= (and b!994585 res!665217) b!994587))

(assert (= (and b!994587 res!665216) b!994586))

(assert (= (and b!994586 res!665215) b!994584))

(declare-fun m!921617 () Bool)

(assert (=> b!994584 m!921617))

(declare-fun m!921619 () Bool)

(assert (=> b!994586 m!921619))

(declare-fun m!921621 () Bool)

(assert (=> b!994585 m!921621))

(assert (=> b!994585 m!921621))

(declare-fun m!921623 () Bool)

(assert (=> b!994585 m!921623))

(declare-fun m!921625 () Bool)

(assert (=> start!85726 m!921625))

(declare-fun m!921627 () Bool)

(assert (=> start!85726 m!921627))

(declare-fun m!921629 () Bool)

(assert (=> b!994587 m!921629))

(push 1)

(assert (not start!85726))

(assert (not b!994584))

(assert (not b!994585))

(assert (not b!994586))

(assert (not b!994587))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

