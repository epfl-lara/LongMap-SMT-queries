; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85714 () Bool)

(assert start!85714)

(declare-fun b!994494 () Bool)

(declare-fun res!665128 () Bool)

(declare-fun e!561196 () Bool)

(assert (=> b!994494 (=> (not res!665128) (not e!561196))))

(declare-datatypes ((array!62867 0))(
  ( (array!62868 (arr!30272 (Array (_ BitVec 32) (_ BitVec 64))) (size!30776 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62867)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994494 (= res!665128 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994495 () Bool)

(declare-fun res!665127 () Bool)

(assert (=> b!994495 (=> (not res!665127) (not e!561196))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994495 (= res!665127 (validKeyInArray!0 (select (arr!30272 a!3219) j!170)))))

(declare-fun b!994496 () Bool)

(declare-fun res!665125 () Bool)

(assert (=> b!994496 (=> (not res!665125) (not e!561196))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994496 (= res!665125 (and (= (size!30776 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30776 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30776 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994497 () Bool)

(declare-fun res!665126 () Bool)

(assert (=> b!994497 (=> (not res!665126) (not e!561196))))

(assert (=> b!994497 (= res!665126 (validKeyInArray!0 k!2224))))

(declare-fun res!665129 () Bool)

(assert (=> start!85714 (=> (not res!665129) (not e!561196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85714 (= res!665129 (validMask!0 mask!3464))))

(assert (=> start!85714 e!561196))

(declare-fun array_inv!23415 (array!62867) Bool)

(assert (=> start!85714 (array_inv!23415 a!3219)))

(assert (=> start!85714 true))

(declare-fun b!994498 () Bool)

(assert (=> b!994498 (= e!561196 false)))

(declare-datatypes ((SeekEntryResult!9229 0))(
  ( (MissingZero!9229 (index!39287 (_ BitVec 32))) (Found!9229 (index!39288 (_ BitVec 32))) (Intermediate!9229 (undefined!10041 Bool) (index!39289 (_ BitVec 32)) (x!86745 (_ BitVec 32))) (Undefined!9229) (MissingVacant!9229 (index!39290 (_ BitVec 32))) )
))
(declare-fun lt!440518 () SeekEntryResult!9229)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62867 (_ BitVec 32)) SeekEntryResult!9229)

(assert (=> b!994498 (= lt!440518 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85714 res!665129) b!994496))

(assert (= (and b!994496 res!665125) b!994495))

(assert (= (and b!994495 res!665127) b!994497))

(assert (= (and b!994497 res!665126) b!994494))

(assert (= (and b!994494 res!665128) b!994498))

(declare-fun m!921533 () Bool)

(assert (=> b!994494 m!921533))

(declare-fun m!921535 () Bool)

(assert (=> b!994498 m!921535))

(declare-fun m!921537 () Bool)

(assert (=> b!994495 m!921537))

(assert (=> b!994495 m!921537))

(declare-fun m!921539 () Bool)

(assert (=> b!994495 m!921539))

(declare-fun m!921541 () Bool)

(assert (=> start!85714 m!921541))

(declare-fun m!921543 () Bool)

(assert (=> start!85714 m!921543))

(declare-fun m!921545 () Bool)

(assert (=> b!994497 m!921545))

(push 1)

(assert (not b!994494))

(assert (not start!85714))

(assert (not b!994495))

(assert (not b!994498))

(assert (not b!994497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

