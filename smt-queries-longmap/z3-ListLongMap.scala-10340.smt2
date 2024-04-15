; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121586 () Bool)

(assert start!121586)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96477 0))(
  ( (array!96478 (arr!46576 (Array (_ BitVec 32) (_ BitVec 64))) (size!47128 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96477)

(declare-fun e!799279 () Bool)

(declare-fun b!1412385 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10913 0))(
  ( (MissingZero!10913 (index!46032 (_ BitVec 32))) (Found!10913 (index!46033 (_ BitVec 32))) (Intermediate!10913 (undefined!11725 Bool) (index!46034 (_ BitVec 32)) (x!127621 (_ BitVec 32))) (Undefined!10913) (MissingVacant!10913 (index!46035 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96477 (_ BitVec 32)) SeekEntryResult!10913)

(assert (=> b!1412385 (= e!799279 (= (seekEntryOrOpen!0 (select (arr!46576 a!2901) j!112) a!2901 mask!2840) (Found!10913 j!112)))))

(declare-fun res!949426 () Bool)

(declare-fun e!799283 () Bool)

(assert (=> start!121586 (=> (not res!949426) (not e!799283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121586 (= res!949426 (validMask!0 mask!2840))))

(assert (=> start!121586 e!799283))

(assert (=> start!121586 true))

(declare-fun array_inv!35809 (array!96477) Bool)

(assert (=> start!121586 (array_inv!35809 a!2901)))

(declare-fun b!1412386 () Bool)

(declare-fun res!949435 () Bool)

(assert (=> b!1412386 (=> (not res!949435) (not e!799283))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412386 (= res!949435 (and (= (size!47128 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47128 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47128 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412387 () Bool)

(declare-fun res!949427 () Bool)

(assert (=> b!1412387 (=> (not res!949427) (not e!799283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96477 (_ BitVec 32)) Bool)

(assert (=> b!1412387 (= res!949427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412388 () Bool)

(declare-fun res!949432 () Bool)

(assert (=> b!1412388 (=> (not res!949432) (not e!799283))))

(declare-datatypes ((List!33173 0))(
  ( (Nil!33170) (Cons!33169 (h!34444 (_ BitVec 64)) (t!47859 List!33173)) )
))
(declare-fun arrayNoDuplicates!0 (array!96477 (_ BitVec 32) List!33173) Bool)

(assert (=> b!1412388 (= res!949432 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33170))))

(declare-fun b!1412389 () Bool)

(declare-fun e!799282 () Bool)

(assert (=> b!1412389 (= e!799282 true)))

(declare-fun e!799280 () Bool)

(assert (=> b!1412389 e!799280))

(declare-fun res!949430 () Bool)

(assert (=> b!1412389 (=> (not res!949430) (not e!799280))))

(declare-fun lt!622168 () SeekEntryResult!10913)

(declare-fun lt!622167 () SeekEntryResult!10913)

(assert (=> b!1412389 (= res!949430 (and (not (undefined!11725 lt!622167)) (= (index!46034 lt!622167) i!1037) (bvslt (x!127621 lt!622167) (x!127621 lt!622168)) (= (select (store (arr!46576 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46034 lt!622167)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622164 () (_ BitVec 32))

(declare-datatypes ((Unit!47643 0))(
  ( (Unit!47644) )
))
(declare-fun lt!622165 () Unit!47643)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47643)

(assert (=> b!1412389 (= lt!622165 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622164 (x!127621 lt!622168) (index!46034 lt!622168) (x!127621 lt!622167) (index!46034 lt!622167) (undefined!11725 lt!622167) mask!2840))))

(declare-fun b!1412390 () Bool)

(declare-fun lt!622163 () (_ BitVec 64))

(declare-fun lt!622169 () array!96477)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96477 (_ BitVec 32)) SeekEntryResult!10913)

(assert (=> b!1412390 (= e!799280 (= (seekEntryOrOpen!0 lt!622163 lt!622169 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127621 lt!622167) (index!46034 lt!622167) (index!46034 lt!622167) (select (arr!46576 a!2901) j!112) lt!622169 mask!2840)))))

(declare-fun b!1412391 () Bool)

(declare-fun res!949428 () Bool)

(assert (=> b!1412391 (=> (not res!949428) (not e!799283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412391 (= res!949428 (validKeyInArray!0 (select (arr!46576 a!2901) i!1037)))))

(declare-fun b!1412392 () Bool)

(declare-fun res!949434 () Bool)

(assert (=> b!1412392 (=> (not res!949434) (not e!799283))))

(assert (=> b!1412392 (= res!949434 (validKeyInArray!0 (select (arr!46576 a!2901) j!112)))))

(declare-fun b!1412393 () Bool)

(declare-fun e!799281 () Bool)

(assert (=> b!1412393 (= e!799283 (not e!799281))))

(declare-fun res!949433 () Bool)

(assert (=> b!1412393 (=> res!949433 e!799281)))

(get-info :version)

(assert (=> b!1412393 (= res!949433 (or (not ((_ is Intermediate!10913) lt!622168)) (undefined!11725 lt!622168)))))

(assert (=> b!1412393 e!799279))

(declare-fun res!949429 () Bool)

(assert (=> b!1412393 (=> (not res!949429) (not e!799279))))

(assert (=> b!1412393 (= res!949429 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622166 () Unit!47643)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47643)

(assert (=> b!1412393 (= lt!622166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96477 (_ BitVec 32)) SeekEntryResult!10913)

(assert (=> b!1412393 (= lt!622168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622164 (select (arr!46576 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412393 (= lt!622164 (toIndex!0 (select (arr!46576 a!2901) j!112) mask!2840))))

(declare-fun b!1412394 () Bool)

(assert (=> b!1412394 (= e!799281 e!799282)))

(declare-fun res!949431 () Bool)

(assert (=> b!1412394 (=> res!949431 e!799282)))

(assert (=> b!1412394 (= res!949431 (or (= lt!622168 lt!622167) (not ((_ is Intermediate!10913) lt!622167))))))

(assert (=> b!1412394 (= lt!622167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622163 mask!2840) lt!622163 lt!622169 mask!2840))))

(assert (=> b!1412394 (= lt!622163 (select (store (arr!46576 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412394 (= lt!622169 (array!96478 (store (arr!46576 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47128 a!2901)))))

(assert (= (and start!121586 res!949426) b!1412386))

(assert (= (and b!1412386 res!949435) b!1412391))

(assert (= (and b!1412391 res!949428) b!1412392))

(assert (= (and b!1412392 res!949434) b!1412387))

(assert (= (and b!1412387 res!949427) b!1412388))

(assert (= (and b!1412388 res!949432) b!1412393))

(assert (= (and b!1412393 res!949429) b!1412385))

(assert (= (and b!1412393 (not res!949433)) b!1412394))

(assert (= (and b!1412394 (not res!949431)) b!1412389))

(assert (= (and b!1412389 res!949430) b!1412390))

(declare-fun m!1301965 () Bool)

(assert (=> b!1412392 m!1301965))

(assert (=> b!1412392 m!1301965))

(declare-fun m!1301967 () Bool)

(assert (=> b!1412392 m!1301967))

(declare-fun m!1301969 () Bool)

(assert (=> b!1412391 m!1301969))

(assert (=> b!1412391 m!1301969))

(declare-fun m!1301971 () Bool)

(assert (=> b!1412391 m!1301971))

(declare-fun m!1301973 () Bool)

(assert (=> b!1412394 m!1301973))

(assert (=> b!1412394 m!1301973))

(declare-fun m!1301975 () Bool)

(assert (=> b!1412394 m!1301975))

(declare-fun m!1301977 () Bool)

(assert (=> b!1412394 m!1301977))

(declare-fun m!1301979 () Bool)

(assert (=> b!1412394 m!1301979))

(declare-fun m!1301981 () Bool)

(assert (=> b!1412388 m!1301981))

(declare-fun m!1301983 () Bool)

(assert (=> b!1412390 m!1301983))

(assert (=> b!1412390 m!1301965))

(assert (=> b!1412390 m!1301965))

(declare-fun m!1301985 () Bool)

(assert (=> b!1412390 m!1301985))

(assert (=> b!1412389 m!1301977))

(declare-fun m!1301987 () Bool)

(assert (=> b!1412389 m!1301987))

(declare-fun m!1301989 () Bool)

(assert (=> b!1412389 m!1301989))

(assert (=> b!1412393 m!1301965))

(declare-fun m!1301991 () Bool)

(assert (=> b!1412393 m!1301991))

(assert (=> b!1412393 m!1301965))

(assert (=> b!1412393 m!1301965))

(declare-fun m!1301993 () Bool)

(assert (=> b!1412393 m!1301993))

(declare-fun m!1301995 () Bool)

(assert (=> b!1412393 m!1301995))

(declare-fun m!1301997 () Bool)

(assert (=> b!1412393 m!1301997))

(assert (=> b!1412385 m!1301965))

(assert (=> b!1412385 m!1301965))

(declare-fun m!1301999 () Bool)

(assert (=> b!1412385 m!1301999))

(declare-fun m!1302001 () Bool)

(assert (=> b!1412387 m!1302001))

(declare-fun m!1302003 () Bool)

(assert (=> start!121586 m!1302003))

(declare-fun m!1302005 () Bool)

(assert (=> start!121586 m!1302005))

(check-sat (not start!121586) (not b!1412393) (not b!1412387) (not b!1412394) (not b!1412388) (not b!1412385) (not b!1412392) (not b!1412389) (not b!1412390) (not b!1412391))
(check-sat)
