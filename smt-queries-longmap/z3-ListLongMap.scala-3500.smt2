; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48562 () Bool)

(assert start!48562)

(declare-fun res!328462 () Bool)

(declare-fun e!310317 () Bool)

(assert (=> start!48562 (=> (not res!328462) (not e!310317))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48562 (= res!328462 (validMask!0 mask!3216))))

(assert (=> start!48562 e!310317))

(assert (=> start!48562 true))

(declare-datatypes ((array!33773 0))(
  ( (array!33774 (arr!16225 (Array (_ BitVec 32) (_ BitVec 64))) (size!16589 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33773)

(declare-fun array_inv!12084 (array!33773) Bool)

(assert (=> start!48562 (array_inv!12084 a!3154)))

(declare-fun b!533203 () Bool)

(declare-fun res!328466 () Bool)

(declare-fun e!310315 () Bool)

(assert (=> b!533203 (=> (not res!328466) (not e!310315))))

(declare-datatypes ((List!10251 0))(
  ( (Nil!10248) (Cons!10247 (h!11190 (_ BitVec 64)) (t!16471 List!10251)) )
))
(declare-fun arrayNoDuplicates!0 (array!33773 (_ BitVec 32) List!10251) Bool)

(assert (=> b!533203 (= res!328466 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10248))))

(declare-fun b!533204 () Bool)

(declare-fun res!328468 () Bool)

(assert (=> b!533204 (=> (not res!328468) (not e!310317))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533204 (= res!328468 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533205 () Bool)

(declare-fun res!328470 () Bool)

(assert (=> b!533205 (=> (not res!328470) (not e!310317))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533205 (= res!328470 (and (= (size!16589 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16589 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16589 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533206 () Bool)

(declare-fun res!328471 () Bool)

(assert (=> b!533206 (=> (not res!328471) (not e!310315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33773 (_ BitVec 32)) Bool)

(assert (=> b!533206 (= res!328471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533207 () Bool)

(declare-fun res!328463 () Bool)

(assert (=> b!533207 (=> (not res!328463) (not e!310315))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533207 (= res!328463 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16589 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16589 a!3154)) (= (select (arr!16225 a!3154) resIndex!32) (select (arr!16225 a!3154) j!147))))))

(declare-fun b!533208 () Bool)

(declare-fun res!328464 () Bool)

(assert (=> b!533208 (=> (not res!328464) (not e!310317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533208 (= res!328464 (validKeyInArray!0 k0!1998))))

(declare-fun b!533209 () Bool)

(declare-fun res!328465 () Bool)

(assert (=> b!533209 (=> (not res!328465) (not e!310315))))

(declare-datatypes ((SeekEntryResult!4639 0))(
  ( (MissingZero!4639 (index!20780 (_ BitVec 32))) (Found!4639 (index!20781 (_ BitVec 32))) (Intermediate!4639 (undefined!5451 Bool) (index!20782 (_ BitVec 32)) (x!49899 (_ BitVec 32))) (Undefined!4639) (MissingVacant!4639 (index!20783 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33773 (_ BitVec 32)) SeekEntryResult!4639)

(assert (=> b!533209 (= res!328465 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16225 a!3154) j!147) a!3154 mask!3216) (Intermediate!4639 false resIndex!32 resX!32)))))

(declare-fun b!533210 () Bool)

(assert (=> b!533210 (= e!310317 e!310315)))

(declare-fun res!328467 () Bool)

(assert (=> b!533210 (=> (not res!328467) (not e!310315))))

(declare-fun lt!245431 () SeekEntryResult!4639)

(assert (=> b!533210 (= res!328467 (or (= lt!245431 (MissingZero!4639 i!1153)) (= lt!245431 (MissingVacant!4639 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33773 (_ BitVec 32)) SeekEntryResult!4639)

(assert (=> b!533210 (= lt!245431 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533211 () Bool)

(declare-fun res!328469 () Bool)

(assert (=> b!533211 (=> (not res!328469) (not e!310317))))

(assert (=> b!533211 (= res!328469 (validKeyInArray!0 (select (arr!16225 a!3154) j!147)))))

(declare-fun b!533212 () Bool)

(assert (=> b!533212 (= e!310315 (bvslt mask!3216 #b00000000000000000000000000000000))))

(assert (= (and start!48562 res!328462) b!533205))

(assert (= (and b!533205 res!328470) b!533211))

(assert (= (and b!533211 res!328469) b!533208))

(assert (= (and b!533208 res!328464) b!533204))

(assert (= (and b!533204 res!328468) b!533210))

(assert (= (and b!533210 res!328467) b!533206))

(assert (= (and b!533206 res!328471) b!533203))

(assert (= (and b!533203 res!328466) b!533207))

(assert (= (and b!533207 res!328463) b!533209))

(assert (= (and b!533209 res!328465) b!533212))

(declare-fun m!513367 () Bool)

(assert (=> b!533208 m!513367))

(declare-fun m!513369 () Bool)

(assert (=> b!533209 m!513369))

(assert (=> b!533209 m!513369))

(declare-fun m!513371 () Bool)

(assert (=> b!533209 m!513371))

(declare-fun m!513373 () Bool)

(assert (=> b!533210 m!513373))

(declare-fun m!513375 () Bool)

(assert (=> b!533206 m!513375))

(declare-fun m!513377 () Bool)

(assert (=> b!533203 m!513377))

(declare-fun m!513379 () Bool)

(assert (=> start!48562 m!513379))

(declare-fun m!513381 () Bool)

(assert (=> start!48562 m!513381))

(assert (=> b!533211 m!513369))

(assert (=> b!533211 m!513369))

(declare-fun m!513383 () Bool)

(assert (=> b!533211 m!513383))

(declare-fun m!513385 () Bool)

(assert (=> b!533204 m!513385))

(declare-fun m!513387 () Bool)

(assert (=> b!533207 m!513387))

(assert (=> b!533207 m!513369))

(check-sat (not b!533204) (not b!533211) (not b!533206) (not start!48562) (not b!533203) (not b!533209) (not b!533208) (not b!533210))
(check-sat)
