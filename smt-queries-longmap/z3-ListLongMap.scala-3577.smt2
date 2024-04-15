; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49182 () Bool)

(assert start!49182)

(declare-fun b!541435 () Bool)

(declare-fun res!336311 () Bool)

(declare-fun e!313467 () Bool)

(assert (=> b!541435 (=> (not res!336311) (not e!313467))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34251 0))(
  ( (array!34252 (arr!16460 (Array (_ BitVec 32) (_ BitVec 64))) (size!16825 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34251)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541435 (= res!336311 (and (= (size!16825 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16825 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16825 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541436 () Bool)

(declare-fun res!336312 () Bool)

(assert (=> b!541436 (=> (not res!336312) (not e!313467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541436 (= res!336312 (validKeyInArray!0 (select (arr!16460 a!3154) j!147)))))

(declare-fun b!541437 () Bool)

(declare-fun res!336307 () Bool)

(declare-fun e!313466 () Bool)

(assert (=> b!541437 (=> (not res!336307) (not e!313466))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4915 0))(
  ( (MissingZero!4915 (index!21884 (_ BitVec 32))) (Found!4915 (index!21885 (_ BitVec 32))) (Intermediate!4915 (undefined!5727 Bool) (index!21886 (_ BitVec 32)) (x!50807 (_ BitVec 32))) (Undefined!4915) (MissingVacant!4915 (index!21887 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34251 (_ BitVec 32)) SeekEntryResult!4915)

(assert (=> b!541437 (= res!336307 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16460 a!3154) j!147) a!3154 mask!3216) (Intermediate!4915 false resIndex!32 resX!32)))))

(declare-fun b!541438 () Bool)

(declare-fun res!336313 () Bool)

(assert (=> b!541438 (=> (not res!336313) (not e!313466))))

(declare-datatypes ((List!10618 0))(
  ( (Nil!10615) (Cons!10614 (h!11566 (_ BitVec 64)) (t!16837 List!10618)) )
))
(declare-fun arrayNoDuplicates!0 (array!34251 (_ BitVec 32) List!10618) Bool)

(assert (=> b!541438 (= res!336313 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10615))))

(declare-fun b!541439 () Bool)

(declare-fun res!336305 () Bool)

(assert (=> b!541439 (=> (not res!336305) (not e!313466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34251 (_ BitVec 32)) Bool)

(assert (=> b!541439 (= res!336305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541440 () Bool)

(assert (=> b!541440 (= e!313467 e!313466)))

(declare-fun res!336306 () Bool)

(assert (=> b!541440 (=> (not res!336306) (not e!313466))))

(declare-fun lt!247483 () SeekEntryResult!4915)

(assert (=> b!541440 (= res!336306 (or (= lt!247483 (MissingZero!4915 i!1153)) (= lt!247483 (MissingVacant!4915 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34251 (_ BitVec 32)) SeekEntryResult!4915)

(assert (=> b!541440 (= lt!247483 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541441 () Bool)

(assert (=> b!541441 (= e!313466 false)))

(declare-fun lt!247482 () SeekEntryResult!4915)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541441 (= lt!247482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16460 a!3154) j!147) mask!3216) (select (arr!16460 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541442 () Bool)

(declare-fun res!336314 () Bool)

(assert (=> b!541442 (=> (not res!336314) (not e!313467))))

(declare-fun arrayContainsKey!0 (array!34251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541442 (= res!336314 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541443 () Bool)

(declare-fun res!336309 () Bool)

(assert (=> b!541443 (=> (not res!336309) (not e!313467))))

(assert (=> b!541443 (= res!336309 (validKeyInArray!0 k0!1998))))

(declare-fun res!336310 () Bool)

(assert (=> start!49182 (=> (not res!336310) (not e!313467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49182 (= res!336310 (validMask!0 mask!3216))))

(assert (=> start!49182 e!313467))

(assert (=> start!49182 true))

(declare-fun array_inv!12343 (array!34251) Bool)

(assert (=> start!49182 (array_inv!12343 a!3154)))

(declare-fun b!541444 () Bool)

(declare-fun res!336308 () Bool)

(assert (=> b!541444 (=> (not res!336308) (not e!313466))))

(assert (=> b!541444 (= res!336308 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16825 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16825 a!3154)) (= (select (arr!16460 a!3154) resIndex!32) (select (arr!16460 a!3154) j!147))))))

(assert (= (and start!49182 res!336310) b!541435))

(assert (= (and b!541435 res!336311) b!541436))

(assert (= (and b!541436 res!336312) b!541443))

(assert (= (and b!541443 res!336309) b!541442))

(assert (= (and b!541442 res!336314) b!541440))

(assert (= (and b!541440 res!336306) b!541439))

(assert (= (and b!541439 res!336305) b!541438))

(assert (= (and b!541438 res!336313) b!541444))

(assert (= (and b!541444 res!336308) b!541437))

(assert (= (and b!541437 res!336307) b!541441))

(declare-fun m!519403 () Bool)

(assert (=> b!541442 m!519403))

(declare-fun m!519405 () Bool)

(assert (=> b!541438 m!519405))

(declare-fun m!519407 () Bool)

(assert (=> b!541441 m!519407))

(assert (=> b!541441 m!519407))

(declare-fun m!519409 () Bool)

(assert (=> b!541441 m!519409))

(assert (=> b!541441 m!519409))

(assert (=> b!541441 m!519407))

(declare-fun m!519411 () Bool)

(assert (=> b!541441 m!519411))

(declare-fun m!519413 () Bool)

(assert (=> b!541444 m!519413))

(assert (=> b!541444 m!519407))

(declare-fun m!519415 () Bool)

(assert (=> b!541443 m!519415))

(declare-fun m!519417 () Bool)

(assert (=> b!541440 m!519417))

(assert (=> b!541437 m!519407))

(assert (=> b!541437 m!519407))

(declare-fun m!519419 () Bool)

(assert (=> b!541437 m!519419))

(assert (=> b!541436 m!519407))

(assert (=> b!541436 m!519407))

(declare-fun m!519421 () Bool)

(assert (=> b!541436 m!519421))

(declare-fun m!519423 () Bool)

(assert (=> b!541439 m!519423))

(declare-fun m!519425 () Bool)

(assert (=> start!49182 m!519425))

(declare-fun m!519427 () Bool)

(assert (=> start!49182 m!519427))

(check-sat (not b!541443) (not b!541442) (not start!49182) (not b!541439) (not b!541437) (not b!541440) (not b!541441) (not b!541438) (not b!541436))
(check-sat)
