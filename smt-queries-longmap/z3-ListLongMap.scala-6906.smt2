; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87028 () Bool)

(assert start!87028)

(declare-fun b!1007664 () Bool)

(declare-fun e!567292 () Bool)

(declare-fun e!567294 () Bool)

(assert (=> b!1007664 (= e!567292 e!567294)))

(declare-fun res!675998 () Bool)

(assert (=> b!1007664 (=> (not res!675998) (not e!567294))))

(declare-datatypes ((SeekEntryResult!9457 0))(
  ( (MissingZero!9457 (index!40199 (_ BitVec 32))) (Found!9457 (index!40200 (_ BitVec 32))) (Intermediate!9457 (undefined!10269 Bool) (index!40201 (_ BitVec 32)) (x!87757 (_ BitVec 32))) (Undefined!9457) (MissingVacant!9457 (index!40202 (_ BitVec 32))) )
))
(declare-fun lt!445261 () SeekEntryResult!9457)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007664 (= res!675998 (or (= lt!445261 (MissingVacant!9457 i!1194)) (= lt!445261 (MissingZero!9457 i!1194))))))

(declare-datatypes ((array!63546 0))(
  ( (array!63547 (arr!30589 (Array (_ BitVec 32) (_ BitVec 64))) (size!31092 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63546)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63546 (_ BitVec 32)) SeekEntryResult!9457)

(assert (=> b!1007664 (= lt!445261 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007665 () Bool)

(declare-fun res!675992 () Bool)

(assert (=> b!1007665 (=> (not res!675992) (not e!567292))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1007665 (= res!675992 (and (= (size!31092 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31092 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31092 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007666 () Bool)

(declare-fun e!567291 () Bool)

(assert (=> b!1007666 (= e!567291 false)))

(declare-fun lt!445260 () SeekEntryResult!9457)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63546 (_ BitVec 32)) SeekEntryResult!9457)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007666 (= lt!445260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30589 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30589 a!3219) i!1194 k0!2224) j!170) (array!63547 (store (arr!30589 a!3219) i!1194 k0!2224) (size!31092 a!3219)) mask!3464))))

(declare-fun b!1007667 () Bool)

(declare-fun res!675994 () Bool)

(assert (=> b!1007667 (=> (not res!675994) (not e!567294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63546 (_ BitVec 32)) Bool)

(assert (=> b!1007667 (= res!675994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007668 () Bool)

(assert (=> b!1007668 (= e!567294 e!567291)))

(declare-fun res!676001 () Bool)

(assert (=> b!1007668 (=> (not res!676001) (not e!567291))))

(declare-fun lt!445262 () SeekEntryResult!9457)

(assert (=> b!1007668 (= res!676001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30589 a!3219) j!170) mask!3464) (select (arr!30589 a!3219) j!170) a!3219 mask!3464) lt!445262))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007668 (= lt!445262 (Intermediate!9457 false resIndex!38 resX!38))))

(declare-fun b!1007669 () Bool)

(declare-fun res!675997 () Bool)

(assert (=> b!1007669 (=> (not res!675997) (not e!567292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007669 (= res!675997 (validKeyInArray!0 (select (arr!30589 a!3219) j!170)))))

(declare-fun res!675999 () Bool)

(assert (=> start!87028 (=> (not res!675999) (not e!567292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87028 (= res!675999 (validMask!0 mask!3464))))

(assert (=> start!87028 e!567292))

(declare-fun array_inv!23725 (array!63546) Bool)

(assert (=> start!87028 (array_inv!23725 a!3219)))

(assert (=> start!87028 true))

(declare-fun b!1007670 () Bool)

(declare-fun res!675991 () Bool)

(assert (=> b!1007670 (=> (not res!675991) (not e!567291))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1007670 (= res!675991 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30589 a!3219) j!170) a!3219 mask!3464) lt!445262))))

(declare-fun b!1007671 () Bool)

(declare-fun res!675995 () Bool)

(assert (=> b!1007671 (=> (not res!675995) (not e!567294))))

(assert (=> b!1007671 (= res!675995 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31092 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31092 a!3219))))))

(declare-fun b!1007672 () Bool)

(declare-fun res!675993 () Bool)

(assert (=> b!1007672 (=> (not res!675993) (not e!567294))))

(declare-datatypes ((List!21236 0))(
  ( (Nil!21233) (Cons!21232 (h!22424 (_ BitVec 64)) (t!30229 List!21236)) )
))
(declare-fun arrayNoDuplicates!0 (array!63546 (_ BitVec 32) List!21236) Bool)

(assert (=> b!1007672 (= res!675993 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21233))))

(declare-fun b!1007673 () Bool)

(declare-fun res!675996 () Bool)

(assert (=> b!1007673 (=> (not res!675996) (not e!567292))))

(assert (=> b!1007673 (= res!675996 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007674 () Bool)

(declare-fun res!676000 () Bool)

(assert (=> b!1007674 (=> (not res!676000) (not e!567292))))

(declare-fun arrayContainsKey!0 (array!63546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007674 (= res!676000 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!87028 res!675999) b!1007665))

(assert (= (and b!1007665 res!675992) b!1007669))

(assert (= (and b!1007669 res!675997) b!1007673))

(assert (= (and b!1007673 res!675996) b!1007674))

(assert (= (and b!1007674 res!676000) b!1007664))

(assert (= (and b!1007664 res!675998) b!1007667))

(assert (= (and b!1007667 res!675994) b!1007672))

(assert (= (and b!1007672 res!675993) b!1007671))

(assert (= (and b!1007671 res!675995) b!1007668))

(assert (= (and b!1007668 res!676001) b!1007670))

(assert (= (and b!1007670 res!675991) b!1007666))

(declare-fun m!933041 () Bool)

(assert (=> b!1007672 m!933041))

(declare-fun m!933043 () Bool)

(assert (=> b!1007668 m!933043))

(assert (=> b!1007668 m!933043))

(declare-fun m!933045 () Bool)

(assert (=> b!1007668 m!933045))

(assert (=> b!1007668 m!933045))

(assert (=> b!1007668 m!933043))

(declare-fun m!933047 () Bool)

(assert (=> b!1007668 m!933047))

(declare-fun m!933049 () Bool)

(assert (=> start!87028 m!933049))

(declare-fun m!933051 () Bool)

(assert (=> start!87028 m!933051))

(declare-fun m!933053 () Bool)

(assert (=> b!1007667 m!933053))

(declare-fun m!933055 () Bool)

(assert (=> b!1007664 m!933055))

(assert (=> b!1007669 m!933043))

(assert (=> b!1007669 m!933043))

(declare-fun m!933057 () Bool)

(assert (=> b!1007669 m!933057))

(assert (=> b!1007670 m!933043))

(assert (=> b!1007670 m!933043))

(declare-fun m!933059 () Bool)

(assert (=> b!1007670 m!933059))

(declare-fun m!933061 () Bool)

(assert (=> b!1007674 m!933061))

(declare-fun m!933063 () Bool)

(assert (=> b!1007666 m!933063))

(declare-fun m!933065 () Bool)

(assert (=> b!1007666 m!933065))

(assert (=> b!1007666 m!933065))

(declare-fun m!933067 () Bool)

(assert (=> b!1007666 m!933067))

(assert (=> b!1007666 m!933067))

(assert (=> b!1007666 m!933065))

(declare-fun m!933069 () Bool)

(assert (=> b!1007666 m!933069))

(declare-fun m!933071 () Bool)

(assert (=> b!1007673 m!933071))

(check-sat (not b!1007672) (not start!87028) (not b!1007669) (not b!1007673) (not b!1007668) (not b!1007674) (not b!1007670) (not b!1007667) (not b!1007664) (not b!1007666))
(check-sat)
