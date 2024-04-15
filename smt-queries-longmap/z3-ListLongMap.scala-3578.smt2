; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49188 () Bool)

(assert start!49188)

(declare-fun b!541525 () Bool)

(declare-fun res!336396 () Bool)

(declare-fun e!313494 () Bool)

(assert (=> b!541525 (=> (not res!336396) (not e!313494))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541525 (= res!336396 (validKeyInArray!0 k0!1998))))

(declare-fun b!541526 () Bool)

(declare-fun res!336402 () Bool)

(declare-fun e!313493 () Bool)

(assert (=> b!541526 (=> (not res!336402) (not e!313493))))

(declare-datatypes ((array!34257 0))(
  ( (array!34258 (arr!16463 (Array (_ BitVec 32) (_ BitVec 64))) (size!16828 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34257)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34257 (_ BitVec 32)) Bool)

(assert (=> b!541526 (= res!336402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541527 () Bool)

(declare-fun res!336401 () Bool)

(assert (=> b!541527 (=> (not res!336401) (not e!313493))))

(declare-datatypes ((List!10621 0))(
  ( (Nil!10618) (Cons!10617 (h!11569 (_ BitVec 64)) (t!16840 List!10621)) )
))
(declare-fun arrayNoDuplicates!0 (array!34257 (_ BitVec 32) List!10621) Bool)

(assert (=> b!541527 (= res!336401 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10618))))

(declare-fun b!541528 () Bool)

(assert (=> b!541528 (= e!313493 false)))

(declare-datatypes ((SeekEntryResult!4918 0))(
  ( (MissingZero!4918 (index!21896 (_ BitVec 32))) (Found!4918 (index!21897 (_ BitVec 32))) (Intermediate!4918 (undefined!5730 Bool) (index!21898 (_ BitVec 32)) (x!50818 (_ BitVec 32))) (Undefined!4918) (MissingVacant!4918 (index!21899 (_ BitVec 32))) )
))
(declare-fun lt!247500 () SeekEntryResult!4918)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34257 (_ BitVec 32)) SeekEntryResult!4918)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541528 (= lt!247500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16463 a!3154) j!147) mask!3216) (select (arr!16463 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541529 () Bool)

(declare-fun res!336403 () Bool)

(assert (=> b!541529 (=> (not res!336403) (not e!313494))))

(declare-fun arrayContainsKey!0 (array!34257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541529 (= res!336403 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!336395 () Bool)

(assert (=> start!49188 (=> (not res!336395) (not e!313494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49188 (= res!336395 (validMask!0 mask!3216))))

(assert (=> start!49188 e!313494))

(assert (=> start!49188 true))

(declare-fun array_inv!12346 (array!34257) Bool)

(assert (=> start!49188 (array_inv!12346 a!3154)))

(declare-fun b!541530 () Bool)

(declare-fun res!336399 () Bool)

(assert (=> b!541530 (=> (not res!336399) (not e!313493))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541530 (= res!336399 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16828 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16828 a!3154)) (= (select (arr!16463 a!3154) resIndex!32) (select (arr!16463 a!3154) j!147))))))

(declare-fun b!541531 () Bool)

(declare-fun res!336397 () Bool)

(assert (=> b!541531 (=> (not res!336397) (not e!313494))))

(assert (=> b!541531 (= res!336397 (validKeyInArray!0 (select (arr!16463 a!3154) j!147)))))

(declare-fun b!541532 () Bool)

(declare-fun res!336398 () Bool)

(assert (=> b!541532 (=> (not res!336398) (not e!313493))))

(assert (=> b!541532 (= res!336398 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16463 a!3154) j!147) a!3154 mask!3216) (Intermediate!4918 false resIndex!32 resX!32)))))

(declare-fun b!541533 () Bool)

(declare-fun res!336404 () Bool)

(assert (=> b!541533 (=> (not res!336404) (not e!313494))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541533 (= res!336404 (and (= (size!16828 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16828 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16828 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541534 () Bool)

(assert (=> b!541534 (= e!313494 e!313493)))

(declare-fun res!336400 () Bool)

(assert (=> b!541534 (=> (not res!336400) (not e!313493))))

(declare-fun lt!247501 () SeekEntryResult!4918)

(assert (=> b!541534 (= res!336400 (or (= lt!247501 (MissingZero!4918 i!1153)) (= lt!247501 (MissingVacant!4918 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34257 (_ BitVec 32)) SeekEntryResult!4918)

(assert (=> b!541534 (= lt!247501 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!49188 res!336395) b!541533))

(assert (= (and b!541533 res!336404) b!541531))

(assert (= (and b!541531 res!336397) b!541525))

(assert (= (and b!541525 res!336396) b!541529))

(assert (= (and b!541529 res!336403) b!541534))

(assert (= (and b!541534 res!336400) b!541526))

(assert (= (and b!541526 res!336402) b!541527))

(assert (= (and b!541527 res!336401) b!541530))

(assert (= (and b!541530 res!336399) b!541532))

(assert (= (and b!541532 res!336398) b!541528))

(declare-fun m!519481 () Bool)

(assert (=> b!541527 m!519481))

(declare-fun m!519483 () Bool)

(assert (=> b!541534 m!519483))

(declare-fun m!519485 () Bool)

(assert (=> b!541528 m!519485))

(assert (=> b!541528 m!519485))

(declare-fun m!519487 () Bool)

(assert (=> b!541528 m!519487))

(assert (=> b!541528 m!519487))

(assert (=> b!541528 m!519485))

(declare-fun m!519489 () Bool)

(assert (=> b!541528 m!519489))

(declare-fun m!519491 () Bool)

(assert (=> b!541526 m!519491))

(assert (=> b!541531 m!519485))

(assert (=> b!541531 m!519485))

(declare-fun m!519493 () Bool)

(assert (=> b!541531 m!519493))

(declare-fun m!519495 () Bool)

(assert (=> b!541529 m!519495))

(assert (=> b!541532 m!519485))

(assert (=> b!541532 m!519485))

(declare-fun m!519497 () Bool)

(assert (=> b!541532 m!519497))

(declare-fun m!519499 () Bool)

(assert (=> start!49188 m!519499))

(declare-fun m!519501 () Bool)

(assert (=> start!49188 m!519501))

(declare-fun m!519503 () Bool)

(assert (=> b!541530 m!519503))

(assert (=> b!541530 m!519485))

(declare-fun m!519505 () Bool)

(assert (=> b!541525 m!519505))

(check-sat (not start!49188) (not b!541534) (not b!541529) (not b!541527) (not b!541528) (not b!541526) (not b!541531) (not b!541532) (not b!541525))
(check-sat)
