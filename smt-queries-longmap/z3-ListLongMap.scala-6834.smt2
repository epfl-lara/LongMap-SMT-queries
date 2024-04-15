; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86034 () Bool)

(assert start!86034)

(declare-fun b!996431 () Bool)

(declare-fun res!666677 () Bool)

(declare-fun e!562137 () Bool)

(assert (=> b!996431 (=> (not res!666677) (not e!562137))))

(declare-datatypes ((array!62986 0))(
  ( (array!62987 (arr!30324 (Array (_ BitVec 32) (_ BitVec 64))) (size!30828 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62986)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996431 (= res!666677 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30828 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30828 a!3219))))))

(declare-fun b!996432 () Bool)

(assert (=> b!996432 (= e!562137 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9281 0))(
  ( (MissingZero!9281 (index!39495 (_ BitVec 32))) (Found!9281 (index!39496 (_ BitVec 32))) (Intermediate!9281 (undefined!10093 Bool) (index!39497 (_ BitVec 32)) (x!86944 (_ BitVec 32))) (Undefined!9281) (MissingVacant!9281 (index!39498 (_ BitVec 32))) )
))
(declare-fun lt!441040 () SeekEntryResult!9281)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62986 (_ BitVec 32)) SeekEntryResult!9281)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996432 (= lt!441040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30324 a!3219) j!170) mask!3464) (select (arr!30324 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!996433 () Bool)

(declare-fun res!666672 () Bool)

(declare-fun e!562138 () Bool)

(assert (=> b!996433 (=> (not res!666672) (not e!562138))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996433 (= res!666672 (and (= (size!30828 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30828 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30828 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996434 () Bool)

(declare-fun res!666676 () Bool)

(assert (=> b!996434 (=> (not res!666676) (not e!562137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62986 (_ BitVec 32)) Bool)

(assert (=> b!996434 (= res!666676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996435 () Bool)

(declare-fun res!666671 () Bool)

(assert (=> b!996435 (=> (not res!666671) (not e!562138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996435 (= res!666671 (validKeyInArray!0 (select (arr!30324 a!3219) j!170)))))

(declare-fun b!996436 () Bool)

(assert (=> b!996436 (= e!562138 e!562137)))

(declare-fun res!666675 () Bool)

(assert (=> b!996436 (=> (not res!666675) (not e!562137))))

(declare-fun lt!441039 () SeekEntryResult!9281)

(assert (=> b!996436 (= res!666675 (or (= lt!441039 (MissingVacant!9281 i!1194)) (= lt!441039 (MissingZero!9281 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62986 (_ BitVec 32)) SeekEntryResult!9281)

(assert (=> b!996436 (= lt!441039 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996437 () Bool)

(declare-fun res!666670 () Bool)

(assert (=> b!996437 (=> (not res!666670) (not e!562138))))

(declare-fun arrayContainsKey!0 (array!62986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996437 (= res!666670 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996439 () Bool)

(declare-fun res!666673 () Bool)

(assert (=> b!996439 (=> (not res!666673) (not e!562138))))

(assert (=> b!996439 (= res!666673 (validKeyInArray!0 k0!2224))))

(declare-fun b!996438 () Bool)

(declare-fun res!666669 () Bool)

(assert (=> b!996438 (=> (not res!666669) (not e!562137))))

(declare-datatypes ((List!21066 0))(
  ( (Nil!21063) (Cons!21062 (h!22227 (_ BitVec 64)) (t!30058 List!21066)) )
))
(declare-fun arrayNoDuplicates!0 (array!62986 (_ BitVec 32) List!21066) Bool)

(assert (=> b!996438 (= res!666669 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21063))))

(declare-fun res!666674 () Bool)

(assert (=> start!86034 (=> (not res!666674) (not e!562138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86034 (= res!666674 (validMask!0 mask!3464))))

(assert (=> start!86034 e!562138))

(declare-fun array_inv!23467 (array!62986) Bool)

(assert (=> start!86034 (array_inv!23467 a!3219)))

(assert (=> start!86034 true))

(assert (= (and start!86034 res!666674) b!996433))

(assert (= (and b!996433 res!666672) b!996435))

(assert (= (and b!996435 res!666671) b!996439))

(assert (= (and b!996439 res!666673) b!996437))

(assert (= (and b!996437 res!666670) b!996436))

(assert (= (and b!996436 res!666675) b!996434))

(assert (= (and b!996434 res!666676) b!996438))

(assert (= (and b!996438 res!666669) b!996431))

(assert (= (and b!996431 res!666677) b!996432))

(declare-fun m!922987 () Bool)

(assert (=> start!86034 m!922987))

(declare-fun m!922989 () Bool)

(assert (=> start!86034 m!922989))

(declare-fun m!922991 () Bool)

(assert (=> b!996434 m!922991))

(declare-fun m!922993 () Bool)

(assert (=> b!996438 m!922993))

(declare-fun m!922995 () Bool)

(assert (=> b!996435 m!922995))

(assert (=> b!996435 m!922995))

(declare-fun m!922997 () Bool)

(assert (=> b!996435 m!922997))

(declare-fun m!922999 () Bool)

(assert (=> b!996437 m!922999))

(assert (=> b!996432 m!922995))

(assert (=> b!996432 m!922995))

(declare-fun m!923001 () Bool)

(assert (=> b!996432 m!923001))

(assert (=> b!996432 m!923001))

(assert (=> b!996432 m!922995))

(declare-fun m!923003 () Bool)

(assert (=> b!996432 m!923003))

(declare-fun m!923005 () Bool)

(assert (=> b!996436 m!923005))

(declare-fun m!923007 () Bool)

(assert (=> b!996439 m!923007))

(check-sat (not b!996437) (not b!996434) (not b!996436) (not start!86034) (not b!996435) (not b!996438) (not b!996439) (not b!996432))
(check-sat)
