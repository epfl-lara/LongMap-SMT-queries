; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86146 () Bool)

(assert start!86146)

(declare-fun b!997671 () Bool)

(declare-fun res!667630 () Bool)

(declare-fun e!562690 () Bool)

(assert (=> b!997671 (=> (not res!667630) (not e!562690))))

(declare-datatypes ((array!63100 0))(
  ( (array!63101 (arr!30380 (Array (_ BitVec 32) (_ BitVec 64))) (size!30882 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63100)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9312 0))(
  ( (MissingZero!9312 (index!39619 (_ BitVec 32))) (Found!9312 (index!39620 (_ BitVec 32))) (Intermediate!9312 (undefined!10124 Bool) (index!39621 (_ BitVec 32)) (x!87050 (_ BitVec 32))) (Undefined!9312) (MissingVacant!9312 (index!39622 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63100 (_ BitVec 32)) SeekEntryResult!9312)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997671 (= res!667630 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30380 a!3219) j!170) mask!3464) (select (arr!30380 a!3219) j!170) a!3219 mask!3464) (Intermediate!9312 false resIndex!38 resX!38)))))

(declare-fun b!997672 () Bool)

(assert (=> b!997672 (= e!562690 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!441500 () SeekEntryResult!9312)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!997672 (= lt!441500 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30380 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997673 () Bool)

(declare-fun res!667633 () Bool)

(assert (=> b!997673 (=> (not res!667633) (not e!562690))))

(assert (=> b!997673 (= res!667633 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30882 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30882 a!3219))))))

(declare-fun b!997674 () Bool)

(declare-fun res!667628 () Bool)

(assert (=> b!997674 (=> (not res!667628) (not e!562690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63100 (_ BitVec 32)) Bool)

(assert (=> b!997674 (= res!667628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997675 () Bool)

(declare-fun res!667635 () Bool)

(declare-fun e!562688 () Bool)

(assert (=> b!997675 (=> (not res!667635) (not e!562688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997675 (= res!667635 (validKeyInArray!0 (select (arr!30380 a!3219) j!170)))))

(declare-fun b!997676 () Bool)

(declare-fun res!667634 () Bool)

(assert (=> b!997676 (=> (not res!667634) (not e!562690))))

(declare-datatypes ((List!21056 0))(
  ( (Nil!21053) (Cons!21052 (h!22220 (_ BitVec 64)) (t!30057 List!21056)) )
))
(declare-fun arrayNoDuplicates!0 (array!63100 (_ BitVec 32) List!21056) Bool)

(assert (=> b!997676 (= res!667634 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21053))))

(declare-fun b!997677 () Bool)

(assert (=> b!997677 (= e!562688 e!562690)))

(declare-fun res!667632 () Bool)

(assert (=> b!997677 (=> (not res!667632) (not e!562690))))

(declare-fun lt!441499 () SeekEntryResult!9312)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997677 (= res!667632 (or (= lt!441499 (MissingVacant!9312 i!1194)) (= lt!441499 (MissingZero!9312 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63100 (_ BitVec 32)) SeekEntryResult!9312)

(assert (=> b!997677 (= lt!441499 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997678 () Bool)

(declare-fun res!667627 () Bool)

(assert (=> b!997678 (=> (not res!667627) (not e!562688))))

(assert (=> b!997678 (= res!667627 (validKeyInArray!0 k0!2224))))

(declare-fun b!997679 () Bool)

(declare-fun res!667626 () Bool)

(assert (=> b!997679 (=> (not res!667626) (not e!562688))))

(assert (=> b!997679 (= res!667626 (and (= (size!30882 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30882 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30882 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!667629 () Bool)

(assert (=> start!86146 (=> (not res!667629) (not e!562688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86146 (= res!667629 (validMask!0 mask!3464))))

(assert (=> start!86146 e!562688))

(declare-fun array_inv!23504 (array!63100) Bool)

(assert (=> start!86146 (array_inv!23504 a!3219)))

(assert (=> start!86146 true))

(declare-fun b!997680 () Bool)

(declare-fun res!667631 () Bool)

(assert (=> b!997680 (=> (not res!667631) (not e!562688))))

(declare-fun arrayContainsKey!0 (array!63100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997680 (= res!667631 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86146 res!667629) b!997679))

(assert (= (and b!997679 res!667626) b!997675))

(assert (= (and b!997675 res!667635) b!997678))

(assert (= (and b!997678 res!667627) b!997680))

(assert (= (and b!997680 res!667631) b!997677))

(assert (= (and b!997677 res!667632) b!997674))

(assert (= (and b!997674 res!667628) b!997676))

(assert (= (and b!997676 res!667634) b!997673))

(assert (= (and b!997673 res!667633) b!997671))

(assert (= (and b!997671 res!667630) b!997672))

(declare-fun m!924437 () Bool)

(assert (=> b!997675 m!924437))

(assert (=> b!997675 m!924437))

(declare-fun m!924439 () Bool)

(assert (=> b!997675 m!924439))

(declare-fun m!924441 () Bool)

(assert (=> b!997676 m!924441))

(declare-fun m!924443 () Bool)

(assert (=> b!997674 m!924443))

(assert (=> b!997671 m!924437))

(assert (=> b!997671 m!924437))

(declare-fun m!924445 () Bool)

(assert (=> b!997671 m!924445))

(assert (=> b!997671 m!924445))

(assert (=> b!997671 m!924437))

(declare-fun m!924447 () Bool)

(assert (=> b!997671 m!924447))

(assert (=> b!997672 m!924437))

(assert (=> b!997672 m!924437))

(declare-fun m!924449 () Bool)

(assert (=> b!997672 m!924449))

(declare-fun m!924451 () Bool)

(assert (=> b!997680 m!924451))

(declare-fun m!924453 () Bool)

(assert (=> b!997677 m!924453))

(declare-fun m!924455 () Bool)

(assert (=> start!86146 m!924455))

(declare-fun m!924457 () Bool)

(assert (=> start!86146 m!924457))

(declare-fun m!924459 () Bool)

(assert (=> b!997678 m!924459))

(check-sat (not start!86146) (not b!997674) (not b!997676) (not b!997672) (not b!997680) (not b!997671) (not b!997678) (not b!997675) (not b!997677))
(check-sat)
