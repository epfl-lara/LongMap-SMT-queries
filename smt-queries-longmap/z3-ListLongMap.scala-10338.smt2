; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121574 () Bool)

(assert start!121574)

(declare-fun b!1412205 () Bool)

(declare-fun e!799174 () Bool)

(declare-fun e!799175 () Bool)

(assert (=> b!1412205 (= e!799174 e!799175)))

(declare-fun res!949252 () Bool)

(assert (=> b!1412205 (=> res!949252 e!799175)))

(declare-datatypes ((SeekEntryResult!10907 0))(
  ( (MissingZero!10907 (index!46008 (_ BitVec 32))) (Found!10907 (index!46009 (_ BitVec 32))) (Intermediate!10907 (undefined!11719 Bool) (index!46010 (_ BitVec 32)) (x!127599 (_ BitVec 32))) (Undefined!10907) (MissingVacant!10907 (index!46011 (_ BitVec 32))) )
))
(declare-fun lt!622043 () SeekEntryResult!10907)

(declare-fun lt!622038 () SeekEntryResult!10907)

(get-info :version)

(assert (=> b!1412205 (= res!949252 (or (= lt!622043 lt!622038) (not ((_ is Intermediate!10907) lt!622038))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96465 0))(
  ( (array!96466 (arr!46570 (Array (_ BitVec 32) (_ BitVec 64))) (size!47122 (_ BitVec 32))) )
))
(declare-fun lt!622040 () array!96465)

(declare-fun lt!622042 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96465 (_ BitVec 32)) SeekEntryResult!10907)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412205 (= lt!622038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622042 mask!2840) lt!622042 lt!622040 mask!2840))))

(declare-fun a!2901 () array!96465)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1412205 (= lt!622042 (select (store (arr!46570 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412205 (= lt!622040 (array!96466 (store (arr!46570 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47122 a!2901)))))

(declare-fun e!799172 () Bool)

(declare-fun b!1412206 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96465 (_ BitVec 32)) SeekEntryResult!10907)

(assert (=> b!1412206 (= e!799172 (= (seekEntryOrOpen!0 (select (arr!46570 a!2901) j!112) a!2901 mask!2840) (Found!10907 j!112)))))

(declare-fun b!1412207 () Bool)

(declare-fun res!949251 () Bool)

(declare-fun e!799170 () Bool)

(assert (=> b!1412207 (=> (not res!949251) (not e!799170))))

(assert (=> b!1412207 (= res!949251 (and (= (size!47122 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47122 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47122 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!799171 () Bool)

(declare-fun b!1412208 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96465 (_ BitVec 32)) SeekEntryResult!10907)

(assert (=> b!1412208 (= e!799171 (= (seekEntryOrOpen!0 lt!622042 lt!622040 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127599 lt!622038) (index!46010 lt!622038) (index!46010 lt!622038) (select (arr!46570 a!2901) j!112) lt!622040 mask!2840)))))

(declare-fun b!1412209 () Bool)

(assert (=> b!1412209 (= e!799175 true)))

(assert (=> b!1412209 e!799171))

(declare-fun res!949248 () Bool)

(assert (=> b!1412209 (=> (not res!949248) (not e!799171))))

(assert (=> b!1412209 (= res!949248 (and (not (undefined!11719 lt!622038)) (= (index!46010 lt!622038) i!1037) (bvslt (x!127599 lt!622038) (x!127599 lt!622043)) (= (select (store (arr!46570 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46010 lt!622038)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47631 0))(
  ( (Unit!47632) )
))
(declare-fun lt!622039 () Unit!47631)

(declare-fun lt!622037 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47631)

(assert (=> b!1412209 (= lt!622039 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622037 (x!127599 lt!622043) (index!46010 lt!622043) (x!127599 lt!622038) (index!46010 lt!622038) (undefined!11719 lt!622038) mask!2840))))

(declare-fun b!1412210 () Bool)

(declare-fun res!949249 () Bool)

(assert (=> b!1412210 (=> (not res!949249) (not e!799170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412210 (= res!949249 (validKeyInArray!0 (select (arr!46570 a!2901) i!1037)))))

(declare-fun res!949255 () Bool)

(assert (=> start!121574 (=> (not res!949255) (not e!799170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121574 (= res!949255 (validMask!0 mask!2840))))

(assert (=> start!121574 e!799170))

(assert (=> start!121574 true))

(declare-fun array_inv!35803 (array!96465) Bool)

(assert (=> start!121574 (array_inv!35803 a!2901)))

(declare-fun b!1412211 () Bool)

(declare-fun res!949253 () Bool)

(assert (=> b!1412211 (=> (not res!949253) (not e!799170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96465 (_ BitVec 32)) Bool)

(assert (=> b!1412211 (= res!949253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412212 () Bool)

(assert (=> b!1412212 (= e!799170 (not e!799174))))

(declare-fun res!949254 () Bool)

(assert (=> b!1412212 (=> res!949254 e!799174)))

(assert (=> b!1412212 (= res!949254 (or (not ((_ is Intermediate!10907) lt!622043)) (undefined!11719 lt!622043)))))

(assert (=> b!1412212 e!799172))

(declare-fun res!949250 () Bool)

(assert (=> b!1412212 (=> (not res!949250) (not e!799172))))

(assert (=> b!1412212 (= res!949250 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622041 () Unit!47631)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47631)

(assert (=> b!1412212 (= lt!622041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412212 (= lt!622043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622037 (select (arr!46570 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412212 (= lt!622037 (toIndex!0 (select (arr!46570 a!2901) j!112) mask!2840))))

(declare-fun b!1412213 () Bool)

(declare-fun res!949246 () Bool)

(assert (=> b!1412213 (=> (not res!949246) (not e!799170))))

(declare-datatypes ((List!33167 0))(
  ( (Nil!33164) (Cons!33163 (h!34438 (_ BitVec 64)) (t!47853 List!33167)) )
))
(declare-fun arrayNoDuplicates!0 (array!96465 (_ BitVec 32) List!33167) Bool)

(assert (=> b!1412213 (= res!949246 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33164))))

(declare-fun b!1412214 () Bool)

(declare-fun res!949247 () Bool)

(assert (=> b!1412214 (=> (not res!949247) (not e!799170))))

(assert (=> b!1412214 (= res!949247 (validKeyInArray!0 (select (arr!46570 a!2901) j!112)))))

(assert (= (and start!121574 res!949255) b!1412207))

(assert (= (and b!1412207 res!949251) b!1412210))

(assert (= (and b!1412210 res!949249) b!1412214))

(assert (= (and b!1412214 res!949247) b!1412211))

(assert (= (and b!1412211 res!949253) b!1412213))

(assert (= (and b!1412213 res!949246) b!1412212))

(assert (= (and b!1412212 res!949250) b!1412206))

(assert (= (and b!1412212 (not res!949254)) b!1412205))

(assert (= (and b!1412205 (not res!949252)) b!1412209))

(assert (= (and b!1412209 res!949248) b!1412208))

(declare-fun m!1301713 () Bool)

(assert (=> b!1412214 m!1301713))

(assert (=> b!1412214 m!1301713))

(declare-fun m!1301715 () Bool)

(assert (=> b!1412214 m!1301715))

(assert (=> b!1412206 m!1301713))

(assert (=> b!1412206 m!1301713))

(declare-fun m!1301717 () Bool)

(assert (=> b!1412206 m!1301717))

(declare-fun m!1301719 () Bool)

(assert (=> b!1412208 m!1301719))

(assert (=> b!1412208 m!1301713))

(assert (=> b!1412208 m!1301713))

(declare-fun m!1301721 () Bool)

(assert (=> b!1412208 m!1301721))

(declare-fun m!1301723 () Bool)

(assert (=> b!1412211 m!1301723))

(declare-fun m!1301725 () Bool)

(assert (=> start!121574 m!1301725))

(declare-fun m!1301727 () Bool)

(assert (=> start!121574 m!1301727))

(declare-fun m!1301729 () Bool)

(assert (=> b!1412213 m!1301729))

(declare-fun m!1301731 () Bool)

(assert (=> b!1412205 m!1301731))

(assert (=> b!1412205 m!1301731))

(declare-fun m!1301733 () Bool)

(assert (=> b!1412205 m!1301733))

(declare-fun m!1301735 () Bool)

(assert (=> b!1412205 m!1301735))

(declare-fun m!1301737 () Bool)

(assert (=> b!1412205 m!1301737))

(declare-fun m!1301739 () Bool)

(assert (=> b!1412210 m!1301739))

(assert (=> b!1412210 m!1301739))

(declare-fun m!1301741 () Bool)

(assert (=> b!1412210 m!1301741))

(assert (=> b!1412209 m!1301735))

(declare-fun m!1301743 () Bool)

(assert (=> b!1412209 m!1301743))

(declare-fun m!1301745 () Bool)

(assert (=> b!1412209 m!1301745))

(assert (=> b!1412212 m!1301713))

(declare-fun m!1301747 () Bool)

(assert (=> b!1412212 m!1301747))

(assert (=> b!1412212 m!1301713))

(assert (=> b!1412212 m!1301713))

(declare-fun m!1301749 () Bool)

(assert (=> b!1412212 m!1301749))

(declare-fun m!1301751 () Bool)

(assert (=> b!1412212 m!1301751))

(declare-fun m!1301753 () Bool)

(assert (=> b!1412212 m!1301753))

(check-sat (not b!1412213) (not b!1412206) (not start!121574) (not b!1412211) (not b!1412212) (not b!1412208) (not b!1412210) (not b!1412205) (not b!1412209) (not b!1412214))
(check-sat)
