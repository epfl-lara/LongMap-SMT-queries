; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86732 () Bool)

(assert start!86732)

(declare-fun b!1005406 () Bool)

(declare-fun res!674494 () Bool)

(declare-fun e!566153 () Bool)

(assert (=> b!1005406 (=> (not res!674494) (not e!566153))))

(declare-datatypes ((array!63431 0))(
  ( (array!63432 (arr!30538 (Array (_ BitVec 32) (_ BitVec 64))) (size!31040 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63431)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005406 (= res!674494 (and (= (size!31040 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31040 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31040 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005407 () Bool)

(declare-fun e!566155 () Bool)

(assert (=> b!1005407 (= e!566153 e!566155)))

(declare-fun res!674502 () Bool)

(assert (=> b!1005407 (=> (not res!674502) (not e!566155))))

(declare-datatypes ((SeekEntryResult!9470 0))(
  ( (MissingZero!9470 (index!40251 (_ BitVec 32))) (Found!9470 (index!40252 (_ BitVec 32))) (Intermediate!9470 (undefined!10282 Bool) (index!40253 (_ BitVec 32)) (x!87662 (_ BitVec 32))) (Undefined!9470) (MissingVacant!9470 (index!40254 (_ BitVec 32))) )
))
(declare-fun lt!444544 () SeekEntryResult!9470)

(assert (=> b!1005407 (= res!674502 (or (= lt!444544 (MissingVacant!9470 i!1194)) (= lt!444544 (MissingZero!9470 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63431 (_ BitVec 32)) SeekEntryResult!9470)

(assert (=> b!1005407 (= lt!444544 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005408 () Bool)

(declare-fun res!674500 () Bool)

(assert (=> b!1005408 (=> (not res!674500) (not e!566155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63431 (_ BitVec 32)) Bool)

(assert (=> b!1005408 (= res!674500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005409 () Bool)

(declare-fun res!674501 () Bool)

(assert (=> b!1005409 (=> (not res!674501) (not e!566155))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005409 (= res!674501 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31040 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31040 a!3219))))))

(declare-fun b!1005410 () Bool)

(declare-fun res!674497 () Bool)

(assert (=> b!1005410 (=> (not res!674497) (not e!566153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005410 (= res!674497 (validKeyInArray!0 k!2224))))

(declare-fun b!1005411 () Bool)

(declare-fun res!674498 () Bool)

(assert (=> b!1005411 (=> (not res!674498) (not e!566153))))

(assert (=> b!1005411 (= res!674498 (validKeyInArray!0 (select (arr!30538 a!3219) j!170)))))

(declare-fun b!1005412 () Bool)

(assert (=> b!1005412 (= e!566155 false)))

(declare-fun lt!444545 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005412 (= lt!444545 (toIndex!0 (select (arr!30538 a!3219) j!170) mask!3464))))

(declare-fun res!674496 () Bool)

(assert (=> start!86732 (=> (not res!674496) (not e!566153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86732 (= res!674496 (validMask!0 mask!3464))))

(assert (=> start!86732 e!566153))

(declare-fun array_inv!23662 (array!63431) Bool)

(assert (=> start!86732 (array_inv!23662 a!3219)))

(assert (=> start!86732 true))

(declare-fun b!1005413 () Bool)

(declare-fun res!674499 () Bool)

(assert (=> b!1005413 (=> (not res!674499) (not e!566153))))

(declare-fun arrayContainsKey!0 (array!63431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005413 (= res!674499 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005414 () Bool)

(declare-fun res!674495 () Bool)

(assert (=> b!1005414 (=> (not res!674495) (not e!566155))))

(declare-datatypes ((List!21214 0))(
  ( (Nil!21211) (Cons!21210 (h!22393 (_ BitVec 64)) (t!30215 List!21214)) )
))
(declare-fun arrayNoDuplicates!0 (array!63431 (_ BitVec 32) List!21214) Bool)

(assert (=> b!1005414 (= res!674495 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21211))))

(assert (= (and start!86732 res!674496) b!1005406))

(assert (= (and b!1005406 res!674494) b!1005411))

(assert (= (and b!1005411 res!674498) b!1005410))

(assert (= (and b!1005410 res!674497) b!1005413))

(assert (= (and b!1005413 res!674499) b!1005407))

(assert (= (and b!1005407 res!674502) b!1005408))

(assert (= (and b!1005408 res!674500) b!1005414))

(assert (= (and b!1005414 res!674495) b!1005409))

(assert (= (and b!1005409 res!674501) b!1005412))

(declare-fun m!930659 () Bool)

(assert (=> b!1005413 m!930659))

(declare-fun m!930661 () Bool)

(assert (=> b!1005408 m!930661))

(declare-fun m!930663 () Bool)

(assert (=> b!1005412 m!930663))

(assert (=> b!1005412 m!930663))

(declare-fun m!930665 () Bool)

(assert (=> b!1005412 m!930665))

(declare-fun m!930667 () Bool)

(assert (=> b!1005410 m!930667))

(declare-fun m!930669 () Bool)

(assert (=> start!86732 m!930669))

(declare-fun m!930671 () Bool)

(assert (=> start!86732 m!930671))

(declare-fun m!930673 () Bool)

(assert (=> b!1005407 m!930673))

(assert (=> b!1005411 m!930663))

(assert (=> b!1005411 m!930663))

(declare-fun m!930675 () Bool)

(assert (=> b!1005411 m!930675))

(declare-fun m!930677 () Bool)

(assert (=> b!1005414 m!930677))

(push 1)

