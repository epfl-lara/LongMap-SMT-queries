; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48568 () Bool)

(assert start!48568)

(declare-fun b!533291 () Bool)

(declare-fun res!328557 () Bool)

(declare-fun e!310344 () Bool)

(assert (=> b!533291 (=> (not res!328557) (not e!310344))))

(declare-datatypes ((array!33779 0))(
  ( (array!33780 (arr!16228 (Array (_ BitVec 32) (_ BitVec 64))) (size!16592 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33779)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33779 (_ BitVec 32)) Bool)

(assert (=> b!533291 (= res!328557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533292 () Bool)

(assert (=> b!533292 (= e!310344 false)))

(declare-datatypes ((SeekEntryResult!4642 0))(
  ( (MissingZero!4642 (index!20792 (_ BitVec 32))) (Found!4642 (index!20793 (_ BitVec 32))) (Intermediate!4642 (undefined!5454 Bool) (index!20794 (_ BitVec 32)) (x!49910 (_ BitVec 32))) (Undefined!4642) (MissingVacant!4642 (index!20795 (_ BitVec 32))) )
))
(declare-fun lt!245443 () SeekEntryResult!4642)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33779 (_ BitVec 32)) SeekEntryResult!4642)

(assert (=> b!533292 (= lt!245443 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16228 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533293 () Bool)

(declare-fun res!328553 () Bool)

(declare-fun e!310342 () Bool)

(assert (=> b!533293 (=> (not res!328553) (not e!310342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533293 (= res!328553 (validKeyInArray!0 (select (arr!16228 a!3154) j!147)))))

(declare-fun b!533294 () Bool)

(declare-fun res!328551 () Bool)

(assert (=> b!533294 (=> (not res!328551) (not e!310344))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533294 (= res!328551 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16592 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16592 a!3154)) (= (select (arr!16228 a!3154) resIndex!32) (select (arr!16228 a!3154) j!147))))))

(declare-fun res!328554 () Bool)

(assert (=> start!48568 (=> (not res!328554) (not e!310342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48568 (= res!328554 (validMask!0 mask!3216))))

(assert (=> start!48568 e!310342))

(assert (=> start!48568 true))

(declare-fun array_inv!12087 (array!33779) Bool)

(assert (=> start!48568 (array_inv!12087 a!3154)))

(declare-fun b!533295 () Bool)

(declare-fun res!328555 () Bool)

(assert (=> b!533295 (=> (not res!328555) (not e!310344))))

(declare-datatypes ((List!10254 0))(
  ( (Nil!10251) (Cons!10250 (h!11193 (_ BitVec 64)) (t!16474 List!10254)) )
))
(declare-fun arrayNoDuplicates!0 (array!33779 (_ BitVec 32) List!10254) Bool)

(assert (=> b!533295 (= res!328555 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10251))))

(declare-fun b!533296 () Bool)

(declare-fun res!328550 () Bool)

(assert (=> b!533296 (=> (not res!328550) (not e!310342))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533296 (= res!328550 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533297 () Bool)

(declare-fun res!328558 () Bool)

(assert (=> b!533297 (=> (not res!328558) (not e!310342))))

(assert (=> b!533297 (= res!328558 (validKeyInArray!0 k0!1998))))

(declare-fun b!533298 () Bool)

(assert (=> b!533298 (= e!310342 e!310344)))

(declare-fun res!328556 () Bool)

(assert (=> b!533298 (=> (not res!328556) (not e!310344))))

(declare-fun lt!245442 () SeekEntryResult!4642)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533298 (= res!328556 (or (= lt!245442 (MissingZero!4642 i!1153)) (= lt!245442 (MissingVacant!4642 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33779 (_ BitVec 32)) SeekEntryResult!4642)

(assert (=> b!533298 (= lt!245442 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533299 () Bool)

(declare-fun res!328552 () Bool)

(assert (=> b!533299 (=> (not res!328552) (not e!310342))))

(assert (=> b!533299 (= res!328552 (and (= (size!16592 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16592 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16592 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48568 res!328554) b!533299))

(assert (= (and b!533299 res!328552) b!533293))

(assert (= (and b!533293 res!328553) b!533297))

(assert (= (and b!533297 res!328558) b!533296))

(assert (= (and b!533296 res!328550) b!533298))

(assert (= (and b!533298 res!328556) b!533291))

(assert (= (and b!533291 res!328557) b!533295))

(assert (= (and b!533295 res!328555) b!533294))

(assert (= (and b!533294 res!328551) b!533292))

(declare-fun m!513433 () Bool)

(assert (=> b!533296 m!513433))

(declare-fun m!513435 () Bool)

(assert (=> b!533298 m!513435))

(declare-fun m!513437 () Bool)

(assert (=> b!533295 m!513437))

(declare-fun m!513439 () Bool)

(assert (=> b!533297 m!513439))

(declare-fun m!513441 () Bool)

(assert (=> start!48568 m!513441))

(declare-fun m!513443 () Bool)

(assert (=> start!48568 m!513443))

(declare-fun m!513445 () Bool)

(assert (=> b!533293 m!513445))

(assert (=> b!533293 m!513445))

(declare-fun m!513447 () Bool)

(assert (=> b!533293 m!513447))

(declare-fun m!513449 () Bool)

(assert (=> b!533294 m!513449))

(assert (=> b!533294 m!513445))

(assert (=> b!533292 m!513445))

(assert (=> b!533292 m!513445))

(declare-fun m!513451 () Bool)

(assert (=> b!533292 m!513451))

(declare-fun m!513453 () Bool)

(assert (=> b!533291 m!513453))

(check-sat (not b!533296) (not b!533298) (not b!533291) (not b!533297) (not start!48568) (not b!533295) (not b!533292) (not b!533293))
(check-sat)
