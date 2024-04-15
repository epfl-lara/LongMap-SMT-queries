; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85702 () Bool)

(assert start!85702)

(declare-fun b!994404 () Bool)

(declare-fun e!561161 () Bool)

(assert (=> b!994404 (= e!561161 false)))

(declare-datatypes ((array!62855 0))(
  ( (array!62856 (arr!30266 (Array (_ BitVec 32) (_ BitVec 64))) (size!30770 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62855)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9223 0))(
  ( (MissingZero!9223 (index!39263 (_ BitVec 32))) (Found!9223 (index!39264 (_ BitVec 32))) (Intermediate!9223 (undefined!10035 Bool) (index!39265 (_ BitVec 32)) (x!86723 (_ BitVec 32))) (Undefined!9223) (MissingVacant!9223 (index!39266 (_ BitVec 32))) )
))
(declare-fun lt!440500 () SeekEntryResult!9223)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62855 (_ BitVec 32)) SeekEntryResult!9223)

(assert (=> b!994404 (= lt!440500 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!994405 () Bool)

(declare-fun res!665039 () Bool)

(assert (=> b!994405 (=> (not res!665039) (not e!561161))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994405 (= res!665039 (validKeyInArray!0 (select (arr!30266 a!3219) j!170)))))

(declare-fun b!994406 () Bool)

(declare-fun res!665037 () Bool)

(assert (=> b!994406 (=> (not res!665037) (not e!561161))))

(assert (=> b!994406 (= res!665037 (validKeyInArray!0 k!2224))))

(declare-fun b!994407 () Bool)

(declare-fun res!665038 () Bool)

(assert (=> b!994407 (=> (not res!665038) (not e!561161))))

(declare-fun arrayContainsKey!0 (array!62855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!994407 (= res!665038 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!994408 () Bool)

(declare-fun res!665035 () Bool)

(assert (=> b!994408 (=> (not res!665035) (not e!561161))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994408 (= res!665035 (and (= (size!30770 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30770 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30770 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!665036 () Bool)

(assert (=> start!85702 (=> (not res!665036) (not e!561161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85702 (= res!665036 (validMask!0 mask!3464))))

(assert (=> start!85702 e!561161))

(declare-fun array_inv!23409 (array!62855) Bool)

(assert (=> start!85702 (array_inv!23409 a!3219)))

(assert (=> start!85702 true))

(assert (= (and start!85702 res!665036) b!994408))

(assert (= (and b!994408 res!665035) b!994405))

(assert (= (and b!994405 res!665039) b!994406))

(assert (= (and b!994406 res!665037) b!994407))

(assert (= (and b!994407 res!665038) b!994404))

(declare-fun m!921449 () Bool)

(assert (=> b!994406 m!921449))

(declare-fun m!921451 () Bool)

(assert (=> start!85702 m!921451))

(declare-fun m!921453 () Bool)

(assert (=> start!85702 m!921453))

(declare-fun m!921455 () Bool)

(assert (=> b!994407 m!921455))

(declare-fun m!921457 () Bool)

(assert (=> b!994405 m!921457))

(assert (=> b!994405 m!921457))

(declare-fun m!921459 () Bool)

(assert (=> b!994405 m!921459))

(declare-fun m!921461 () Bool)

(assert (=> b!994404 m!921461))

(push 1)

(assert (not b!994405))

(assert (not b!994407))

(assert (not b!994406))

(assert (not start!85702))

(assert (not b!994404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

