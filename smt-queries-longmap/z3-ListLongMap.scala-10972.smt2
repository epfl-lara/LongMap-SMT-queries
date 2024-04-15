; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128444 () Bool)

(assert start!128444)

(declare-fun b!1506366 () Bool)

(declare-fun res!1026900 () Bool)

(declare-fun e!841767 () Bool)

(assert (=> b!1506366 (=> (not res!1026900) (not e!841767))))

(declare-datatypes ((array!100456 0))(
  ( (array!100457 (arr!48472 (Array (_ BitVec 32) (_ BitVec 64))) (size!49024 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100456)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506366 (= res!1026900 (validKeyInArray!0 (select (arr!48472 a!2804) j!70)))))

(declare-fun b!1506367 () Bool)

(declare-fun res!1026897 () Bool)

(assert (=> b!1506367 (=> (not res!1026897) (not e!841767))))

(declare-datatypes ((List!35033 0))(
  ( (Nil!35030) (Cons!35029 (h!36430 (_ BitVec 64)) (t!49719 List!35033)) )
))
(declare-fun arrayNoDuplicates!0 (array!100456 (_ BitVec 32) List!35033) Bool)

(assert (=> b!1506367 (= res!1026897 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35030))))

(declare-fun b!1506368 () Bool)

(declare-fun res!1026898 () Bool)

(assert (=> b!1506368 (=> (not res!1026898) (not e!841767))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12666 0))(
  ( (MissingZero!12666 (index!53059 (_ BitVec 32))) (Found!12666 (index!53060 (_ BitVec 32))) (Intermediate!12666 (undefined!13478 Bool) (index!53061 (_ BitVec 32)) (x!134818 (_ BitVec 32))) (Undefined!12666) (MissingVacant!12666 (index!53062 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100456 (_ BitVec 32)) SeekEntryResult!12666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506368 (= res!1026898 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48472 a!2804) j!70) mask!2512) (select (arr!48472 a!2804) j!70) a!2804 mask!2512) (Intermediate!12666 false resIndex!21 resX!21)))))

(declare-fun b!1506369 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1506369 (= e!841767 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512))))))

(declare-fun res!1026896 () Bool)

(assert (=> start!128444 (=> (not res!1026896) (not e!841767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128444 (= res!1026896 (validMask!0 mask!2512))))

(assert (=> start!128444 e!841767))

(assert (=> start!128444 true))

(declare-fun array_inv!37705 (array!100456) Bool)

(assert (=> start!128444 (array_inv!37705 a!2804)))

(declare-fun b!1506370 () Bool)

(declare-fun res!1026901 () Bool)

(assert (=> b!1506370 (=> (not res!1026901) (not e!841767))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506370 (= res!1026901 (and (= (size!49024 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49024 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49024 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506371 () Bool)

(declare-fun res!1026902 () Bool)

(assert (=> b!1506371 (=> (not res!1026902) (not e!841767))))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506371 (= res!1026902 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49024 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49024 a!2804))))))

(declare-fun b!1506372 () Bool)

(declare-fun res!1026899 () Bool)

(assert (=> b!1506372 (=> (not res!1026899) (not e!841767))))

(assert (=> b!1506372 (= res!1026899 (validKeyInArray!0 (select (arr!48472 a!2804) i!961)))))

(declare-fun b!1506373 () Bool)

(declare-fun res!1026895 () Bool)

(assert (=> b!1506373 (=> (not res!1026895) (not e!841767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100456 (_ BitVec 32)) Bool)

(assert (=> b!1506373 (= res!1026895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128444 res!1026896) b!1506370))

(assert (= (and b!1506370 res!1026901) b!1506372))

(assert (= (and b!1506372 res!1026899) b!1506366))

(assert (= (and b!1506366 res!1026900) b!1506373))

(assert (= (and b!1506373 res!1026895) b!1506367))

(assert (= (and b!1506367 res!1026897) b!1506371))

(assert (= (and b!1506371 res!1026902) b!1506368))

(assert (= (and b!1506368 res!1026898) b!1506369))

(declare-fun m!1388711 () Bool)

(assert (=> b!1506368 m!1388711))

(assert (=> b!1506368 m!1388711))

(declare-fun m!1388713 () Bool)

(assert (=> b!1506368 m!1388713))

(assert (=> b!1506368 m!1388713))

(assert (=> b!1506368 m!1388711))

(declare-fun m!1388715 () Bool)

(assert (=> b!1506368 m!1388715))

(declare-fun m!1388717 () Bool)

(assert (=> start!128444 m!1388717))

(declare-fun m!1388719 () Bool)

(assert (=> start!128444 m!1388719))

(assert (=> b!1506366 m!1388711))

(assert (=> b!1506366 m!1388711))

(declare-fun m!1388721 () Bool)

(assert (=> b!1506366 m!1388721))

(declare-fun m!1388723 () Bool)

(assert (=> b!1506367 m!1388723))

(declare-fun m!1388725 () Bool)

(assert (=> b!1506372 m!1388725))

(assert (=> b!1506372 m!1388725))

(declare-fun m!1388727 () Bool)

(assert (=> b!1506372 m!1388727))

(declare-fun m!1388729 () Bool)

(assert (=> b!1506373 m!1388729))

(check-sat (not b!1506367) (not b!1506373) (not b!1506366) (not start!128444) (not b!1506372) (not b!1506368))
(check-sat)
