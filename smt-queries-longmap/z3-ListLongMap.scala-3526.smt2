; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48714 () Bool)

(assert start!48714)

(declare-fun b!535380 () Bool)

(declare-fun res!330735 () Bool)

(declare-fun e!310941 () Bool)

(assert (=> b!535380 (=> (not res!330735) (not e!310941))))

(declare-datatypes ((array!33936 0))(
  ( (array!33937 (arr!16307 (Array (_ BitVec 32) (_ BitVec 64))) (size!16672 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33936)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535380 (= res!330735 (validKeyInArray!0 (select (arr!16307 a!3154) j!147)))))

(declare-fun b!535381 () Bool)

(declare-fun res!330728 () Bool)

(assert (=> b!535381 (=> (not res!330728) (not e!310941))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535381 (= res!330728 (and (= (size!16672 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16672 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16672 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535382 () Bool)

(declare-fun e!310940 () Bool)

(declare-fun e!310938 () Bool)

(assert (=> b!535382 (= e!310940 e!310938)))

(declare-fun res!330733 () Bool)

(assert (=> b!535382 (=> (not res!330733) (not e!310938))))

(declare-datatypes ((SeekEntryResult!4762 0))(
  ( (MissingZero!4762 (index!21272 (_ BitVec 32))) (Found!4762 (index!21273 (_ BitVec 32))) (Intermediate!4762 (undefined!5574 Bool) (index!21274 (_ BitVec 32)) (x!50228 (_ BitVec 32))) (Undefined!4762) (MissingVacant!4762 (index!21275 (_ BitVec 32))) )
))
(declare-fun lt!245629 () SeekEntryResult!4762)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535382 (= res!330733 (= lt!245629 (Intermediate!4762 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33936 (_ BitVec 32)) SeekEntryResult!4762)

(assert (=> b!535382 (= lt!245629 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16307 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535383 () Bool)

(declare-fun res!330736 () Bool)

(assert (=> b!535383 (=> (not res!330736) (not e!310938))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535383 (= res!330736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16307 a!3154) j!147) mask!3216) (select (arr!16307 a!3154) j!147) a!3154 mask!3216) lt!245629))))

(declare-fun b!535384 () Bool)

(declare-fun res!330729 () Bool)

(assert (=> b!535384 (=> (not res!330729) (not e!310940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33936 (_ BitVec 32)) Bool)

(assert (=> b!535384 (= res!330729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535385 () Bool)

(assert (=> b!535385 (= e!310938 (and (not (= (select (arr!16307 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16307 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16307 a!3154) index!1177) (select (arr!16307 a!3154) j!147))) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun res!330730 () Bool)

(assert (=> start!48714 (=> (not res!330730) (not e!310941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48714 (= res!330730 (validMask!0 mask!3216))))

(assert (=> start!48714 e!310941))

(assert (=> start!48714 true))

(declare-fun array_inv!12190 (array!33936) Bool)

(assert (=> start!48714 (array_inv!12190 a!3154)))

(declare-fun b!535386 () Bool)

(declare-fun res!330732 () Bool)

(assert (=> b!535386 (=> (not res!330732) (not e!310941))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!535386 (= res!330732 (validKeyInArray!0 k0!1998))))

(declare-fun b!535387 () Bool)

(declare-fun res!330727 () Bool)

(assert (=> b!535387 (=> (not res!330727) (not e!310940))))

(declare-datatypes ((List!10465 0))(
  ( (Nil!10462) (Cons!10461 (h!11404 (_ BitVec 64)) (t!16684 List!10465)) )
))
(declare-fun arrayNoDuplicates!0 (array!33936 (_ BitVec 32) List!10465) Bool)

(assert (=> b!535387 (= res!330727 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10462))))

(declare-fun b!535388 () Bool)

(declare-fun res!330734 () Bool)

(assert (=> b!535388 (=> (not res!330734) (not e!310941))))

(declare-fun arrayContainsKey!0 (array!33936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535388 (= res!330734 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535389 () Bool)

(declare-fun res!330731 () Bool)

(assert (=> b!535389 (=> (not res!330731) (not e!310940))))

(assert (=> b!535389 (= res!330731 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16672 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16672 a!3154)) (= (select (arr!16307 a!3154) resIndex!32) (select (arr!16307 a!3154) j!147))))))

(declare-fun b!535390 () Bool)

(assert (=> b!535390 (= e!310941 e!310940)))

(declare-fun res!330737 () Bool)

(assert (=> b!535390 (=> (not res!330737) (not e!310940))))

(declare-fun lt!245628 () SeekEntryResult!4762)

(assert (=> b!535390 (= res!330737 (or (= lt!245628 (MissingZero!4762 i!1153)) (= lt!245628 (MissingVacant!4762 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33936 (_ BitVec 32)) SeekEntryResult!4762)

(assert (=> b!535390 (= lt!245628 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48714 res!330730) b!535381))

(assert (= (and b!535381 res!330728) b!535380))

(assert (= (and b!535380 res!330735) b!535386))

(assert (= (and b!535386 res!330732) b!535388))

(assert (= (and b!535388 res!330734) b!535390))

(assert (= (and b!535390 res!330737) b!535384))

(assert (= (and b!535384 res!330729) b!535387))

(assert (= (and b!535387 res!330727) b!535389))

(assert (= (and b!535389 res!330731) b!535382))

(assert (= (and b!535382 res!330733) b!535383))

(assert (= (and b!535383 res!330736) b!535385))

(declare-fun m!514453 () Bool)

(assert (=> b!535382 m!514453))

(assert (=> b!535382 m!514453))

(declare-fun m!514455 () Bool)

(assert (=> b!535382 m!514455))

(declare-fun m!514457 () Bool)

(assert (=> b!535384 m!514457))

(assert (=> b!535380 m!514453))

(assert (=> b!535380 m!514453))

(declare-fun m!514459 () Bool)

(assert (=> b!535380 m!514459))

(declare-fun m!514461 () Bool)

(assert (=> b!535388 m!514461))

(declare-fun m!514463 () Bool)

(assert (=> b!535389 m!514463))

(assert (=> b!535389 m!514453))

(declare-fun m!514465 () Bool)

(assert (=> b!535387 m!514465))

(declare-fun m!514467 () Bool)

(assert (=> b!535386 m!514467))

(declare-fun m!514469 () Bool)

(assert (=> start!48714 m!514469))

(declare-fun m!514471 () Bool)

(assert (=> start!48714 m!514471))

(assert (=> b!535383 m!514453))

(assert (=> b!535383 m!514453))

(declare-fun m!514473 () Bool)

(assert (=> b!535383 m!514473))

(assert (=> b!535383 m!514473))

(assert (=> b!535383 m!514453))

(declare-fun m!514475 () Bool)

(assert (=> b!535383 m!514475))

(declare-fun m!514477 () Bool)

(assert (=> b!535385 m!514477))

(assert (=> b!535385 m!514453))

(declare-fun m!514479 () Bool)

(assert (=> b!535390 m!514479))

(check-sat (not b!535384) (not b!535388) (not b!535386) (not start!48714) (not b!535380) (not b!535383) (not b!535390) (not b!535382) (not b!535387))
(check-sat)
