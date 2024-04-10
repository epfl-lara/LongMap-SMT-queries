; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121642 () Bool)

(assert start!121642)

(declare-fun b!1413246 () Bool)

(declare-fun e!799788 () Bool)

(declare-fun e!799790 () Bool)

(assert (=> b!1413246 (= e!799788 (not e!799790))))

(declare-fun res!950242 () Bool)

(assert (=> b!1413246 (=> res!950242 e!799790)))

(declare-datatypes ((SeekEntryResult!10938 0))(
  ( (MissingZero!10938 (index!46132 (_ BitVec 32))) (Found!10938 (index!46133 (_ BitVec 32))) (Intermediate!10938 (undefined!11750 Bool) (index!46134 (_ BitVec 32)) (x!127713 (_ BitVec 32))) (Undefined!10938) (MissingVacant!10938 (index!46135 (_ BitVec 32))) )
))
(declare-fun lt!622904 () SeekEntryResult!10938)

(assert (=> b!1413246 (= res!950242 (or (not (is-Intermediate!10938 lt!622904)) (undefined!11750 lt!622904)))))

(declare-fun e!799786 () Bool)

(assert (=> b!1413246 e!799786))

(declare-fun res!950244 () Bool)

(assert (=> b!1413246 (=> (not res!950244) (not e!799786))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96580 0))(
  ( (array!96581 (arr!46627 (Array (_ BitVec 32) (_ BitVec 64))) (size!47177 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96580)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96580 (_ BitVec 32)) Bool)

(assert (=> b!1413246 (= res!950244 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47850 0))(
  ( (Unit!47851) )
))
(declare-fun lt!622905 () Unit!47850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47850)

(assert (=> b!1413246 (= lt!622905 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622903 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96580 (_ BitVec 32)) SeekEntryResult!10938)

(assert (=> b!1413246 (= lt!622904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622903 (select (arr!46627 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413246 (= lt!622903 (toIndex!0 (select (arr!46627 a!2901) j!112) mask!2840))))

(declare-fun b!1413247 () Bool)

(declare-fun e!799785 () Bool)

(assert (=> b!1413247 (= e!799790 e!799785)))

(declare-fun res!950243 () Bool)

(assert (=> b!1413247 (=> res!950243 e!799785)))

(declare-fun lt!622900 () SeekEntryResult!10938)

(assert (=> b!1413247 (= res!950243 (or (= lt!622904 lt!622900) (not (is-Intermediate!10938 lt!622900))))))

(declare-fun lt!622899 () array!96580)

(declare-fun lt!622902 () (_ BitVec 64))

(assert (=> b!1413247 (= lt!622900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622902 mask!2840) lt!622902 lt!622899 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413247 (= lt!622902 (select (store (arr!46627 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413247 (= lt!622899 (array!96581 (store (arr!46627 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47177 a!2901)))))

(declare-fun b!1413248 () Bool)

(assert (=> b!1413248 (= e!799785 true)))

(declare-fun e!799787 () Bool)

(assert (=> b!1413248 e!799787))

(declare-fun res!950238 () Bool)

(assert (=> b!1413248 (=> (not res!950238) (not e!799787))))

(assert (=> b!1413248 (= res!950238 (and (not (undefined!11750 lt!622900)) (= (index!46134 lt!622900) i!1037) (bvslt (x!127713 lt!622900) (x!127713 lt!622904)) (= (select (store (arr!46627 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46134 lt!622900)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622901 () Unit!47850)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47850)

(assert (=> b!1413248 (= lt!622901 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622903 (x!127713 lt!622904) (index!46134 lt!622904) (x!127713 lt!622900) (index!46134 lt!622900) (undefined!11750 lt!622900) mask!2840))))

(declare-fun b!1413249 () Bool)

(declare-fun res!950237 () Bool)

(assert (=> b!1413249 (=> (not res!950237) (not e!799788))))

(assert (=> b!1413249 (= res!950237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413250 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96580 (_ BitVec 32)) SeekEntryResult!10938)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96580 (_ BitVec 32)) SeekEntryResult!10938)

(assert (=> b!1413250 (= e!799787 (= (seekEntryOrOpen!0 lt!622902 lt!622899 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127713 lt!622900) (index!46134 lt!622900) (index!46134 lt!622900) (select (arr!46627 a!2901) j!112) lt!622899 mask!2840)))))

(declare-fun b!1413251 () Bool)

(declare-fun res!950239 () Bool)

(assert (=> b!1413251 (=> (not res!950239) (not e!799788))))

(assert (=> b!1413251 (= res!950239 (and (= (size!47177 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47177 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47177 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413253 () Bool)

(declare-fun res!950241 () Bool)

(assert (=> b!1413253 (=> (not res!950241) (not e!799788))))

(declare-datatypes ((List!33146 0))(
  ( (Nil!33143) (Cons!33142 (h!34417 (_ BitVec 64)) (t!47840 List!33146)) )
))
(declare-fun arrayNoDuplicates!0 (array!96580 (_ BitVec 32) List!33146) Bool)

(assert (=> b!1413253 (= res!950241 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33143))))

(declare-fun b!1413254 () Bool)

(declare-fun res!950245 () Bool)

(assert (=> b!1413254 (=> (not res!950245) (not e!799788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413254 (= res!950245 (validKeyInArray!0 (select (arr!46627 a!2901) i!1037)))))

(declare-fun b!1413255 () Bool)

(declare-fun res!950236 () Bool)

(assert (=> b!1413255 (=> (not res!950236) (not e!799788))))

(assert (=> b!1413255 (= res!950236 (validKeyInArray!0 (select (arr!46627 a!2901) j!112)))))

(declare-fun b!1413252 () Bool)

(assert (=> b!1413252 (= e!799786 (= (seekEntryOrOpen!0 (select (arr!46627 a!2901) j!112) a!2901 mask!2840) (Found!10938 j!112)))))

(declare-fun res!950240 () Bool)

(assert (=> start!121642 (=> (not res!950240) (not e!799788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121642 (= res!950240 (validMask!0 mask!2840))))

(assert (=> start!121642 e!799788))

(assert (=> start!121642 true))

(declare-fun array_inv!35655 (array!96580) Bool)

(assert (=> start!121642 (array_inv!35655 a!2901)))

(assert (= (and start!121642 res!950240) b!1413251))

(assert (= (and b!1413251 res!950239) b!1413254))

(assert (= (and b!1413254 res!950245) b!1413255))

(assert (= (and b!1413255 res!950236) b!1413249))

(assert (= (and b!1413249 res!950237) b!1413253))

(assert (= (and b!1413253 res!950241) b!1413246))

(assert (= (and b!1413246 res!950244) b!1413252))

(assert (= (and b!1413246 (not res!950242)) b!1413247))

(assert (= (and b!1413247 (not res!950243)) b!1413248))

(assert (= (and b!1413248 res!950238) b!1413250))

(declare-fun m!1303593 () Bool)

(assert (=> b!1413250 m!1303593))

(declare-fun m!1303595 () Bool)

(assert (=> b!1413250 m!1303595))

(assert (=> b!1413250 m!1303595))

(declare-fun m!1303597 () Bool)

(assert (=> b!1413250 m!1303597))

(assert (=> b!1413252 m!1303595))

(assert (=> b!1413252 m!1303595))

(declare-fun m!1303599 () Bool)

(assert (=> b!1413252 m!1303599))

(declare-fun m!1303601 () Bool)

(assert (=> b!1413248 m!1303601))

(declare-fun m!1303603 () Bool)

(assert (=> b!1413248 m!1303603))

(declare-fun m!1303605 () Bool)

(assert (=> b!1413248 m!1303605))

(declare-fun m!1303607 () Bool)

(assert (=> b!1413254 m!1303607))

(assert (=> b!1413254 m!1303607))

(declare-fun m!1303609 () Bool)

(assert (=> b!1413254 m!1303609))

(assert (=> b!1413246 m!1303595))

(declare-fun m!1303611 () Bool)

(assert (=> b!1413246 m!1303611))

(assert (=> b!1413246 m!1303595))

(declare-fun m!1303613 () Bool)

(assert (=> b!1413246 m!1303613))

(assert (=> b!1413246 m!1303595))

(declare-fun m!1303615 () Bool)

(assert (=> b!1413246 m!1303615))

(declare-fun m!1303617 () Bool)

(assert (=> b!1413246 m!1303617))

(declare-fun m!1303619 () Bool)

(assert (=> start!121642 m!1303619))

(declare-fun m!1303621 () Bool)

(assert (=> start!121642 m!1303621))

(assert (=> b!1413255 m!1303595))

(assert (=> b!1413255 m!1303595))

(declare-fun m!1303623 () Bool)

(assert (=> b!1413255 m!1303623))

(declare-fun m!1303625 () Bool)

(assert (=> b!1413253 m!1303625))

(declare-fun m!1303627 () Bool)

(assert (=> b!1413249 m!1303627))

(declare-fun m!1303629 () Bool)

(assert (=> b!1413247 m!1303629))

(assert (=> b!1413247 m!1303629))

(declare-fun m!1303631 () Bool)

(assert (=> b!1413247 m!1303631))

(assert (=> b!1413247 m!1303601))

(declare-fun m!1303633 () Bool)

(assert (=> b!1413247 m!1303633))

(push 1)

