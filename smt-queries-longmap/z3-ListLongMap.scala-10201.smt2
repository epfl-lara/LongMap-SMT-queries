; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120380 () Bool)

(assert start!120380)

(declare-fun b!1400146 () Bool)

(declare-fun e!792761 () Bool)

(declare-fun e!792764 () Bool)

(assert (=> b!1400146 (= e!792761 (not e!792764))))

(declare-fun res!938218 () Bool)

(assert (=> b!1400146 (=> res!938218 e!792764)))

(declare-datatypes ((SeekEntryResult!10457 0))(
  ( (MissingZero!10457 (index!44202 (_ BitVec 32))) (Found!10457 (index!44203 (_ BitVec 32))) (Intermediate!10457 (undefined!11269 Bool) (index!44204 (_ BitVec 32)) (x!126003 (_ BitVec 32))) (Undefined!10457) (MissingVacant!10457 (index!44205 (_ BitVec 32))) )
))
(declare-fun lt!615663 () SeekEntryResult!10457)

(get-info :version)

(assert (=> b!1400146 (= res!938218 (or (not ((_ is Intermediate!10457) lt!615663)) (undefined!11269 lt!615663)))))

(declare-fun e!792760 () Bool)

(assert (=> b!1400146 e!792760))

(declare-fun res!938214 () Bool)

(assert (=> b!1400146 (=> (not res!938214) (not e!792760))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95774 0))(
  ( (array!95775 (arr!46237 (Array (_ BitVec 32) (_ BitVec 64))) (size!46788 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95774)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95774 (_ BitVec 32)) Bool)

(assert (=> b!1400146 (= res!938214 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46945 0))(
  ( (Unit!46946) )
))
(declare-fun lt!615662 () Unit!46945)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46945)

(assert (=> b!1400146 (= lt!615662 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95774 (_ BitVec 32)) SeekEntryResult!10457)

(assert (=> b!1400146 (= lt!615663 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615665 (select (arr!46237 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400146 (= lt!615665 (toIndex!0 (select (arr!46237 a!2901) j!112) mask!2840))))

(declare-fun res!938217 () Bool)

(assert (=> start!120380 (=> (not res!938217) (not e!792761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120380 (= res!938217 (validMask!0 mask!2840))))

(assert (=> start!120380 e!792761))

(assert (=> start!120380 true))

(declare-fun array_inv!35518 (array!95774) Bool)

(assert (=> start!120380 (array_inv!35518 a!2901)))

(declare-fun b!1400147 () Bool)

(declare-fun res!938216 () Bool)

(assert (=> b!1400147 (=> (not res!938216) (not e!792761))))

(declare-datatypes ((List!32743 0))(
  ( (Nil!32740) (Cons!32739 (h!33992 (_ BitVec 64)) (t!47429 List!32743)) )
))
(declare-fun arrayNoDuplicates!0 (array!95774 (_ BitVec 32) List!32743) Bool)

(assert (=> b!1400147 (= res!938216 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32740))))

(declare-fun b!1400148 () Bool)

(declare-fun res!938213 () Bool)

(assert (=> b!1400148 (=> (not res!938213) (not e!792761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400148 (= res!938213 (validKeyInArray!0 (select (arr!46237 a!2901) j!112)))))

(declare-fun b!1400149 () Bool)

(declare-fun res!938211 () Bool)

(assert (=> b!1400149 (=> (not res!938211) (not e!792761))))

(assert (=> b!1400149 (= res!938211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400150 () Bool)

(declare-fun e!792762 () Bool)

(assert (=> b!1400150 (= e!792764 e!792762)))

(declare-fun res!938212 () Bool)

(assert (=> b!1400150 (=> res!938212 e!792762)))

(declare-fun lt!615661 () SeekEntryResult!10457)

(assert (=> b!1400150 (= res!938212 (or (= lt!615663 lt!615661) (not ((_ is Intermediate!10457) lt!615661))))))

(declare-fun lt!615660 () (_ BitVec 64))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400150 (= lt!615661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615660 mask!2840) lt!615660 (array!95775 (store (arr!46237 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46788 a!2901)) mask!2840))))

(assert (=> b!1400150 (= lt!615660 (select (store (arr!46237 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1400151 () Bool)

(declare-fun res!938210 () Bool)

(assert (=> b!1400151 (=> (not res!938210) (not e!792761))))

(assert (=> b!1400151 (= res!938210 (validKeyInArray!0 (select (arr!46237 a!2901) i!1037)))))

(declare-fun b!1400152 () Bool)

(declare-fun res!938215 () Bool)

(assert (=> b!1400152 (=> (not res!938215) (not e!792761))))

(assert (=> b!1400152 (= res!938215 (and (= (size!46788 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46788 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46788 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400153 () Bool)

(assert (=> b!1400153 (= e!792762 true)))

(assert (=> b!1400153 (and (not (undefined!11269 lt!615661)) (= (index!44204 lt!615661) i!1037) (bvslt (x!126003 lt!615661) (x!126003 lt!615663)) (= (select (store (arr!46237 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44204 lt!615661)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615664 () Unit!46945)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46945)

(assert (=> b!1400153 (= lt!615664 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615665 (x!126003 lt!615663) (index!44204 lt!615663) (x!126003 lt!615661) (index!44204 lt!615661) (undefined!11269 lt!615661) mask!2840))))

(declare-fun b!1400154 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95774 (_ BitVec 32)) SeekEntryResult!10457)

(assert (=> b!1400154 (= e!792760 (= (seekEntryOrOpen!0 (select (arr!46237 a!2901) j!112) a!2901 mask!2840) (Found!10457 j!112)))))

(assert (= (and start!120380 res!938217) b!1400152))

(assert (= (and b!1400152 res!938215) b!1400151))

(assert (= (and b!1400151 res!938210) b!1400148))

(assert (= (and b!1400148 res!938213) b!1400149))

(assert (= (and b!1400149 res!938211) b!1400147))

(assert (= (and b!1400147 res!938216) b!1400146))

(assert (= (and b!1400146 res!938214) b!1400154))

(assert (= (and b!1400146 (not res!938218)) b!1400150))

(assert (= (and b!1400150 (not res!938212)) b!1400153))

(declare-fun m!1287541 () Bool)

(assert (=> b!1400153 m!1287541))

(declare-fun m!1287543 () Bool)

(assert (=> b!1400153 m!1287543))

(declare-fun m!1287545 () Bool)

(assert (=> b!1400153 m!1287545))

(declare-fun m!1287547 () Bool)

(assert (=> b!1400150 m!1287547))

(assert (=> b!1400150 m!1287541))

(assert (=> b!1400150 m!1287547))

(declare-fun m!1287549 () Bool)

(assert (=> b!1400150 m!1287549))

(declare-fun m!1287551 () Bool)

(assert (=> b!1400150 m!1287551))

(declare-fun m!1287553 () Bool)

(assert (=> b!1400149 m!1287553))

(declare-fun m!1287555 () Bool)

(assert (=> b!1400148 m!1287555))

(assert (=> b!1400148 m!1287555))

(declare-fun m!1287557 () Bool)

(assert (=> b!1400148 m!1287557))

(assert (=> b!1400154 m!1287555))

(assert (=> b!1400154 m!1287555))

(declare-fun m!1287559 () Bool)

(assert (=> b!1400154 m!1287559))

(declare-fun m!1287561 () Bool)

(assert (=> start!120380 m!1287561))

(declare-fun m!1287563 () Bool)

(assert (=> start!120380 m!1287563))

(declare-fun m!1287565 () Bool)

(assert (=> b!1400151 m!1287565))

(assert (=> b!1400151 m!1287565))

(declare-fun m!1287567 () Bool)

(assert (=> b!1400151 m!1287567))

(assert (=> b!1400146 m!1287555))

(declare-fun m!1287569 () Bool)

(assert (=> b!1400146 m!1287569))

(assert (=> b!1400146 m!1287555))

(declare-fun m!1287571 () Bool)

(assert (=> b!1400146 m!1287571))

(assert (=> b!1400146 m!1287555))

(declare-fun m!1287573 () Bool)

(assert (=> b!1400146 m!1287573))

(declare-fun m!1287575 () Bool)

(assert (=> b!1400146 m!1287575))

(declare-fun m!1287577 () Bool)

(assert (=> b!1400147 m!1287577))

(check-sat (not b!1400149) (not b!1400147) (not b!1400151) (not b!1400150) (not b!1400146) (not b!1400154) (not start!120380) (not b!1400148) (not b!1400153))
(check-sat)
