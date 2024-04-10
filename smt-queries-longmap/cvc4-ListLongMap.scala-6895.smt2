; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86736 () Bool)

(assert start!86736)

(declare-fun b!1005460 () Bool)

(declare-fun res!674549 () Bool)

(declare-fun e!566173 () Bool)

(assert (=> b!1005460 (=> (not res!674549) (not e!566173))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005460 (= res!674549 (validKeyInArray!0 k!2224))))

(declare-fun b!1005461 () Bool)

(declare-fun res!674551 () Bool)

(assert (=> b!1005461 (=> (not res!674551) (not e!566173))))

(declare-datatypes ((array!63435 0))(
  ( (array!63436 (arr!30540 (Array (_ BitVec 32) (_ BitVec 64))) (size!31042 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63435)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1005461 (= res!674551 (and (= (size!31042 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31042 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31042 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005462 () Bool)

(declare-fun e!566172 () Bool)

(assert (=> b!1005462 (= e!566173 e!566172)))

(declare-fun res!674554 () Bool)

(assert (=> b!1005462 (=> (not res!674554) (not e!566172))))

(declare-datatypes ((SeekEntryResult!9472 0))(
  ( (MissingZero!9472 (index!40259 (_ BitVec 32))) (Found!9472 (index!40260 (_ BitVec 32))) (Intermediate!9472 (undefined!10284 Bool) (index!40261 (_ BitVec 32)) (x!87664 (_ BitVec 32))) (Undefined!9472) (MissingVacant!9472 (index!40262 (_ BitVec 32))) )
))
(declare-fun lt!444557 () SeekEntryResult!9472)

(assert (=> b!1005462 (= res!674554 (or (= lt!444557 (MissingVacant!9472 i!1194)) (= lt!444557 (MissingZero!9472 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63435 (_ BitVec 32)) SeekEntryResult!9472)

(assert (=> b!1005462 (= lt!444557 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005463 () Bool)

(declare-fun res!674552 () Bool)

(assert (=> b!1005463 (=> (not res!674552) (not e!566172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63435 (_ BitVec 32)) Bool)

(assert (=> b!1005463 (= res!674552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005464 () Bool)

(assert (=> b!1005464 (= e!566172 false)))

(declare-fun lt!444556 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005464 (= lt!444556 (toIndex!0 (select (arr!30540 a!3219) j!170) mask!3464))))

(declare-fun b!1005465 () Bool)

(declare-fun res!674556 () Bool)

(assert (=> b!1005465 (=> (not res!674556) (not e!566172))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005465 (= res!674556 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31042 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31042 a!3219))))))

(declare-fun b!1005466 () Bool)

(declare-fun res!674548 () Bool)

(assert (=> b!1005466 (=> (not res!674548) (not e!566173))))

(declare-fun arrayContainsKey!0 (array!63435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005466 (= res!674548 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!674555 () Bool)

(assert (=> start!86736 (=> (not res!674555) (not e!566173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86736 (= res!674555 (validMask!0 mask!3464))))

(assert (=> start!86736 e!566173))

(declare-fun array_inv!23664 (array!63435) Bool)

(assert (=> start!86736 (array_inv!23664 a!3219)))

(assert (=> start!86736 true))

(declare-fun b!1005467 () Bool)

(declare-fun res!674553 () Bool)

(assert (=> b!1005467 (=> (not res!674553) (not e!566173))))

(assert (=> b!1005467 (= res!674553 (validKeyInArray!0 (select (arr!30540 a!3219) j!170)))))

(declare-fun b!1005468 () Bool)

(declare-fun res!674550 () Bool)

(assert (=> b!1005468 (=> (not res!674550) (not e!566172))))

(declare-datatypes ((List!21216 0))(
  ( (Nil!21213) (Cons!21212 (h!22395 (_ BitVec 64)) (t!30217 List!21216)) )
))
(declare-fun arrayNoDuplicates!0 (array!63435 (_ BitVec 32) List!21216) Bool)

(assert (=> b!1005468 (= res!674550 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21213))))

(assert (= (and start!86736 res!674555) b!1005461))

(assert (= (and b!1005461 res!674551) b!1005467))

(assert (= (and b!1005467 res!674553) b!1005460))

(assert (= (and b!1005460 res!674549) b!1005466))

(assert (= (and b!1005466 res!674548) b!1005462))

(assert (= (and b!1005462 res!674554) b!1005463))

(assert (= (and b!1005463 res!674552) b!1005468))

(assert (= (and b!1005468 res!674550) b!1005465))

(assert (= (and b!1005465 res!674556) b!1005464))

(declare-fun m!930699 () Bool)

(assert (=> b!1005467 m!930699))

(assert (=> b!1005467 m!930699))

(declare-fun m!930701 () Bool)

(assert (=> b!1005467 m!930701))

(declare-fun m!930703 () Bool)

(assert (=> b!1005463 m!930703))

(declare-fun m!930705 () Bool)

(assert (=> b!1005468 m!930705))

(assert (=> b!1005464 m!930699))

(assert (=> b!1005464 m!930699))

(declare-fun m!930707 () Bool)

(assert (=> b!1005464 m!930707))

(declare-fun m!930709 () Bool)

(assert (=> start!86736 m!930709))

(declare-fun m!930711 () Bool)

(assert (=> start!86736 m!930711))

(declare-fun m!930713 () Bool)

(assert (=> b!1005466 m!930713))

(declare-fun m!930715 () Bool)

(assert (=> b!1005460 m!930715))

(declare-fun m!930717 () Bool)

(assert (=> b!1005462 m!930717))

(push 1)

(assert (not b!1005464))

(assert (not b!1005467))

(assert (not start!86736))

(assert (not b!1005468))

(assert (not b!1005462))

(assert (not b!1005466))

(assert (not b!1005460))

(assert (not b!1005463))

