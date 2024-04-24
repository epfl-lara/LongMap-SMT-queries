; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121688 () Bool)

(assert start!121688)

(declare-fun b!1412935 () Bool)

(declare-fun res!949483 () Bool)

(declare-fun e!799661 () Bool)

(assert (=> b!1412935 (=> (not res!949483) (not e!799661))))

(declare-datatypes ((array!96611 0))(
  ( (array!96612 (arr!46642 (Array (_ BitVec 32) (_ BitVec 64))) (size!47193 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96611)

(declare-datatypes ((List!33148 0))(
  ( (Nil!33145) (Cons!33144 (h!34424 (_ BitVec 64)) (t!47834 List!33148)) )
))
(declare-fun arrayNoDuplicates!0 (array!96611 (_ BitVec 32) List!33148) Bool)

(assert (=> b!1412935 (= res!949483 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33145))))

(declare-fun b!1412936 () Bool)

(declare-fun res!949484 () Bool)

(assert (=> b!1412936 (=> (not res!949484) (not e!799661))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96611 (_ BitVec 32)) Bool)

(assert (=> b!1412936 (= res!949484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412937 () Bool)

(declare-fun res!949480 () Bool)

(assert (=> b!1412937 (=> (not res!949480) (not e!799661))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412937 (= res!949480 (validKeyInArray!0 (select (arr!46642 a!2901) j!112)))))

(declare-fun e!799660 () Bool)

(declare-fun b!1412938 () Bool)

(declare-datatypes ((SeekEntryResult!10856 0))(
  ( (MissingZero!10856 (index!45801 (_ BitVec 32))) (Found!10856 (index!45802 (_ BitVec 32))) (Intermediate!10856 (undefined!11668 Bool) (index!45803 (_ BitVec 32)) (x!127542 (_ BitVec 32))) (Undefined!10856) (MissingVacant!10856 (index!45804 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96611 (_ BitVec 32)) SeekEntryResult!10856)

(assert (=> b!1412938 (= e!799660 (= (seekEntryOrOpen!0 (select (arr!46642 a!2901) j!112) a!2901 mask!2840) (Found!10856 j!112)))))

(declare-fun b!1412940 () Bool)

(declare-fun res!949478 () Bool)

(assert (=> b!1412940 (=> (not res!949478) (not e!799661))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412940 (= res!949478 (validKeyInArray!0 (select (arr!46642 a!2901) i!1037)))))

(declare-fun b!1412941 () Bool)

(declare-fun e!799664 () Bool)

(assert (=> b!1412941 (= e!799664 true)))

(declare-fun lt!622355 () SeekEntryResult!10856)

(declare-fun lt!622354 () SeekEntryResult!10856)

(assert (=> b!1412941 (and (not (undefined!11668 lt!622355)) (= (index!45803 lt!622355) i!1037) (bvslt (x!127542 lt!622355) (x!127542 lt!622354)) (= (select (store (arr!46642 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45803 lt!622355)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47713 0))(
  ( (Unit!47714) )
))
(declare-fun lt!622352 () Unit!47713)

(declare-fun lt!622353 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47713)

(assert (=> b!1412941 (= lt!622352 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622353 (x!127542 lt!622354) (index!45803 lt!622354) (x!127542 lt!622355) (index!45803 lt!622355) (undefined!11668 lt!622355) mask!2840))))

(declare-fun b!1412942 () Bool)

(declare-fun res!949485 () Bool)

(assert (=> b!1412942 (=> (not res!949485) (not e!799661))))

(assert (=> b!1412942 (= res!949485 (and (= (size!47193 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47193 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47193 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412943 () Bool)

(declare-fun e!799662 () Bool)

(assert (=> b!1412943 (= e!799661 (not e!799662))))

(declare-fun res!949486 () Bool)

(assert (=> b!1412943 (=> res!949486 e!799662)))

(get-info :version)

(assert (=> b!1412943 (= res!949486 (or (not ((_ is Intermediate!10856) lt!622354)) (undefined!11668 lt!622354)))))

(assert (=> b!1412943 e!799660))

(declare-fun res!949482 () Bool)

(assert (=> b!1412943 (=> (not res!949482) (not e!799660))))

(assert (=> b!1412943 (= res!949482 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622351 () Unit!47713)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47713)

(assert (=> b!1412943 (= lt!622351 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96611 (_ BitVec 32)) SeekEntryResult!10856)

(assert (=> b!1412943 (= lt!622354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622353 (select (arr!46642 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412943 (= lt!622353 (toIndex!0 (select (arr!46642 a!2901) j!112) mask!2840))))

(declare-fun res!949481 () Bool)

(assert (=> start!121688 (=> (not res!949481) (not e!799661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121688 (= res!949481 (validMask!0 mask!2840))))

(assert (=> start!121688 e!799661))

(assert (=> start!121688 true))

(declare-fun array_inv!35923 (array!96611) Bool)

(assert (=> start!121688 (array_inv!35923 a!2901)))

(declare-fun b!1412939 () Bool)

(assert (=> b!1412939 (= e!799662 e!799664)))

(declare-fun res!949479 () Bool)

(assert (=> b!1412939 (=> res!949479 e!799664)))

(assert (=> b!1412939 (= res!949479 (or (= lt!622354 lt!622355) (not ((_ is Intermediate!10856) lt!622355))))))

(declare-fun lt!622350 () (_ BitVec 64))

(assert (=> b!1412939 (= lt!622355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622350 mask!2840) lt!622350 (array!96612 (store (arr!46642 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47193 a!2901)) mask!2840))))

(assert (=> b!1412939 (= lt!622350 (select (store (arr!46642 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!121688 res!949481) b!1412942))

(assert (= (and b!1412942 res!949485) b!1412940))

(assert (= (and b!1412940 res!949478) b!1412937))

(assert (= (and b!1412937 res!949480) b!1412936))

(assert (= (and b!1412936 res!949484) b!1412935))

(assert (= (and b!1412935 res!949483) b!1412943))

(assert (= (and b!1412943 res!949482) b!1412938))

(assert (= (and b!1412943 (not res!949486)) b!1412939))

(assert (= (and b!1412939 (not res!949479)) b!1412941))

(declare-fun m!1303159 () Bool)

(assert (=> b!1412939 m!1303159))

(declare-fun m!1303161 () Bool)

(assert (=> b!1412939 m!1303161))

(assert (=> b!1412939 m!1303159))

(declare-fun m!1303163 () Bool)

(assert (=> b!1412939 m!1303163))

(declare-fun m!1303165 () Bool)

(assert (=> b!1412939 m!1303165))

(declare-fun m!1303167 () Bool)

(assert (=> start!121688 m!1303167))

(declare-fun m!1303169 () Bool)

(assert (=> start!121688 m!1303169))

(declare-fun m!1303171 () Bool)

(assert (=> b!1412937 m!1303171))

(assert (=> b!1412937 m!1303171))

(declare-fun m!1303173 () Bool)

(assert (=> b!1412937 m!1303173))

(declare-fun m!1303175 () Bool)

(assert (=> b!1412940 m!1303175))

(assert (=> b!1412940 m!1303175))

(declare-fun m!1303177 () Bool)

(assert (=> b!1412940 m!1303177))

(declare-fun m!1303179 () Bool)

(assert (=> b!1412936 m!1303179))

(declare-fun m!1303181 () Bool)

(assert (=> b!1412935 m!1303181))

(assert (=> b!1412941 m!1303161))

(declare-fun m!1303183 () Bool)

(assert (=> b!1412941 m!1303183))

(declare-fun m!1303185 () Bool)

(assert (=> b!1412941 m!1303185))

(assert (=> b!1412938 m!1303171))

(assert (=> b!1412938 m!1303171))

(declare-fun m!1303187 () Bool)

(assert (=> b!1412938 m!1303187))

(assert (=> b!1412943 m!1303171))

(declare-fun m!1303189 () Bool)

(assert (=> b!1412943 m!1303189))

(assert (=> b!1412943 m!1303171))

(declare-fun m!1303191 () Bool)

(assert (=> b!1412943 m!1303191))

(assert (=> b!1412943 m!1303171))

(declare-fun m!1303193 () Bool)

(assert (=> b!1412943 m!1303193))

(declare-fun m!1303195 () Bool)

(assert (=> b!1412943 m!1303195))

(check-sat (not b!1412938) (not b!1412939) (not start!121688) (not b!1412941) (not b!1412937) (not b!1412936) (not b!1412940) (not b!1412935) (not b!1412943))
(check-sat)
