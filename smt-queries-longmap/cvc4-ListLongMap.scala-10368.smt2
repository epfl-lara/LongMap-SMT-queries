; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122026 () Bool)

(assert start!122026)

(declare-fun b!1416381 () Bool)

(declare-fun res!952427 () Bool)

(declare-fun e!801628 () Bool)

(assert (=> b!1416381 (=> (not res!952427) (not e!801628))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96712 0))(
  ( (array!96713 (arr!46687 (Array (_ BitVec 32) (_ BitVec 64))) (size!47237 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96712)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416381 (= res!952427 (and (= (size!47237 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47237 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47237 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416382 () Bool)

(declare-fun res!952425 () Bool)

(assert (=> b!1416382 (=> (not res!952425) (not e!801628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416382 (= res!952425 (validKeyInArray!0 (select (arr!46687 a!2901) i!1037)))))

(declare-fun b!1416383 () Bool)

(declare-fun e!801632 () Bool)

(assert (=> b!1416383 (= e!801632 true)))

(declare-datatypes ((SeekEntryResult!10998 0))(
  ( (MissingZero!10998 (index!46384 (_ BitVec 32))) (Found!10998 (index!46385 (_ BitVec 32))) (Intermediate!10998 (undefined!11810 Bool) (index!46386 (_ BitVec 32)) (x!127981 (_ BitVec 32))) (Undefined!10998) (MissingVacant!10998 (index!46387 (_ BitVec 32))) )
))
(declare-fun lt!624936 () SeekEntryResult!10998)

(declare-fun lt!624938 () SeekEntryResult!10998)

(assert (=> b!1416383 (= lt!624936 lt!624938)))

(declare-fun lt!624941 () SeekEntryResult!10998)

(declare-datatypes ((Unit!47970 0))(
  ( (Unit!47971) )
))
(declare-fun lt!624939 () Unit!47970)

(declare-fun lt!624937 () (_ BitVec 32))

(declare-fun lt!624942 () SeekEntryResult!10998)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47970)

(assert (=> b!1416383 (= lt!624939 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624937 (x!127981 lt!624941) (index!46386 lt!624941) (x!127981 lt!624942) (index!46386 lt!624942) mask!2840))))

(declare-fun b!1416384 () Bool)

(declare-fun res!952432 () Bool)

(assert (=> b!1416384 (=> res!952432 e!801632)))

(declare-fun lt!624933 () (_ BitVec 64))

(declare-fun lt!624940 () array!96712)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96712 (_ BitVec 32)) SeekEntryResult!10998)

(assert (=> b!1416384 (= res!952432 (not (= lt!624942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624937 lt!624933 lt!624940 mask!2840))))))

(declare-fun res!952431 () Bool)

(assert (=> start!122026 (=> (not res!952431) (not e!801628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122026 (= res!952431 (validMask!0 mask!2840))))

(assert (=> start!122026 e!801628))

(assert (=> start!122026 true))

(declare-fun array_inv!35715 (array!96712) Bool)

(assert (=> start!122026 (array_inv!35715 a!2901)))

(declare-fun b!1416385 () Bool)

(declare-fun res!952424 () Bool)

(assert (=> b!1416385 (=> (not res!952424) (not e!801628))))

(assert (=> b!1416385 (= res!952424 (validKeyInArray!0 (select (arr!46687 a!2901) j!112)))))

(declare-fun b!1416386 () Bool)

(declare-fun res!952423 () Bool)

(assert (=> b!1416386 (=> (not res!952423) (not e!801628))))

(declare-datatypes ((List!33206 0))(
  ( (Nil!33203) (Cons!33202 (h!34489 (_ BitVec 64)) (t!47900 List!33206)) )
))
(declare-fun arrayNoDuplicates!0 (array!96712 (_ BitVec 32) List!33206) Bool)

(assert (=> b!1416386 (= res!952423 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33203))))

(declare-fun b!1416387 () Bool)

(declare-fun e!801629 () Bool)

(assert (=> b!1416387 (= e!801629 e!801632)))

(declare-fun res!952426 () Bool)

(assert (=> b!1416387 (=> res!952426 e!801632)))

(assert (=> b!1416387 (= res!952426 (or (bvslt (x!127981 lt!624941) #b00000000000000000000000000000000) (bvsgt (x!127981 lt!624941) #b01111111111111111111111111111110) (bvslt (x!127981 lt!624942) #b00000000000000000000000000000000) (bvsgt (x!127981 lt!624942) #b01111111111111111111111111111110) (bvslt lt!624937 #b00000000000000000000000000000000) (bvsge lt!624937 (size!47237 a!2901)) (bvslt (index!46386 lt!624941) #b00000000000000000000000000000000) (bvsge (index!46386 lt!624941) (size!47237 a!2901)) (bvslt (index!46386 lt!624942) #b00000000000000000000000000000000) (bvsge (index!46386 lt!624942) (size!47237 a!2901)) (not (= lt!624941 (Intermediate!10998 false (index!46386 lt!624941) (x!127981 lt!624941)))) (not (= lt!624942 (Intermediate!10998 false (index!46386 lt!624942) (x!127981 lt!624942))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96712 (_ BitVec 32)) SeekEntryResult!10998)

(assert (=> b!1416387 (= lt!624938 (seekKeyOrZeroReturnVacant!0 (x!127981 lt!624942) (index!46386 lt!624942) (index!46386 lt!624942) (select (arr!46687 a!2901) j!112) lt!624940 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96712 (_ BitVec 32)) SeekEntryResult!10998)

(assert (=> b!1416387 (= lt!624938 (seekEntryOrOpen!0 lt!624933 lt!624940 mask!2840))))

(assert (=> b!1416387 (and (not (undefined!11810 lt!624942)) (= (index!46386 lt!624942) i!1037) (bvslt (x!127981 lt!624942) (x!127981 lt!624941)) (= (select (store (arr!46687 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46386 lt!624942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!624935 () Unit!47970)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47970)

(assert (=> b!1416387 (= lt!624935 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624937 (x!127981 lt!624941) (index!46386 lt!624941) (x!127981 lt!624942) (index!46386 lt!624942) (undefined!11810 lt!624942) mask!2840))))

(declare-fun b!1416388 () Bool)

(declare-fun res!952430 () Bool)

(assert (=> b!1416388 (=> (not res!952430) (not e!801628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96712 (_ BitVec 32)) Bool)

(assert (=> b!1416388 (= res!952430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416389 () Bool)

(declare-fun e!801630 () Bool)

(assert (=> b!1416389 (= e!801630 e!801629)))

(declare-fun res!952428 () Bool)

(assert (=> b!1416389 (=> res!952428 e!801629)))

(assert (=> b!1416389 (= res!952428 (or (= lt!624941 lt!624942) (not (is-Intermediate!10998 lt!624942))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416389 (= lt!624942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624933 mask!2840) lt!624933 lt!624940 mask!2840))))

(assert (=> b!1416389 (= lt!624933 (select (store (arr!46687 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416389 (= lt!624940 (array!96713 (store (arr!46687 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47237 a!2901)))))

(declare-fun b!1416390 () Bool)

(assert (=> b!1416390 (= e!801628 (not e!801630))))

(declare-fun res!952429 () Bool)

(assert (=> b!1416390 (=> res!952429 e!801630)))

(assert (=> b!1416390 (= res!952429 (or (not (is-Intermediate!10998 lt!624941)) (undefined!11810 lt!624941)))))

(assert (=> b!1416390 (= lt!624936 (Found!10998 j!112))))

(assert (=> b!1416390 (= lt!624936 (seekEntryOrOpen!0 (select (arr!46687 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416390 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624934 () Unit!47970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47970)

(assert (=> b!1416390 (= lt!624934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416390 (= lt!624941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624937 (select (arr!46687 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416390 (= lt!624937 (toIndex!0 (select (arr!46687 a!2901) j!112) mask!2840))))

(assert (= (and start!122026 res!952431) b!1416381))

(assert (= (and b!1416381 res!952427) b!1416382))

(assert (= (and b!1416382 res!952425) b!1416385))

(assert (= (and b!1416385 res!952424) b!1416388))

(assert (= (and b!1416388 res!952430) b!1416386))

(assert (= (and b!1416386 res!952423) b!1416390))

(assert (= (and b!1416390 (not res!952429)) b!1416389))

(assert (= (and b!1416389 (not res!952428)) b!1416387))

(assert (= (and b!1416387 (not res!952426)) b!1416384))

(assert (= (and b!1416384 (not res!952432)) b!1416383))

(declare-fun m!1307075 () Bool)

(assert (=> b!1416389 m!1307075))

(assert (=> b!1416389 m!1307075))

(declare-fun m!1307077 () Bool)

(assert (=> b!1416389 m!1307077))

(declare-fun m!1307079 () Bool)

(assert (=> b!1416389 m!1307079))

(declare-fun m!1307081 () Bool)

(assert (=> b!1416389 m!1307081))

(declare-fun m!1307083 () Bool)

(assert (=> b!1416387 m!1307083))

(declare-fun m!1307085 () Bool)

(assert (=> b!1416387 m!1307085))

(declare-fun m!1307087 () Bool)

(assert (=> b!1416387 m!1307087))

(assert (=> b!1416387 m!1307085))

(declare-fun m!1307089 () Bool)

(assert (=> b!1416387 m!1307089))

(assert (=> b!1416387 m!1307079))

(declare-fun m!1307091 () Bool)

(assert (=> b!1416387 m!1307091))

(declare-fun m!1307093 () Bool)

(assert (=> b!1416383 m!1307093))

(declare-fun m!1307095 () Bool)

(assert (=> b!1416384 m!1307095))

(declare-fun m!1307097 () Bool)

(assert (=> b!1416382 m!1307097))

(assert (=> b!1416382 m!1307097))

(declare-fun m!1307099 () Bool)

(assert (=> b!1416382 m!1307099))

(assert (=> b!1416390 m!1307085))

(declare-fun m!1307101 () Bool)

(assert (=> b!1416390 m!1307101))

(assert (=> b!1416390 m!1307085))

(assert (=> b!1416390 m!1307085))

(declare-fun m!1307103 () Bool)

(assert (=> b!1416390 m!1307103))

(declare-fun m!1307105 () Bool)

(assert (=> b!1416390 m!1307105))

(assert (=> b!1416390 m!1307085))

(declare-fun m!1307107 () Bool)

(assert (=> b!1416390 m!1307107))

(declare-fun m!1307109 () Bool)

(assert (=> b!1416390 m!1307109))

(declare-fun m!1307111 () Bool)

(assert (=> b!1416386 m!1307111))

(declare-fun m!1307113 () Bool)

(assert (=> b!1416388 m!1307113))

(declare-fun m!1307115 () Bool)

(assert (=> start!122026 m!1307115))

(declare-fun m!1307117 () Bool)

(assert (=> start!122026 m!1307117))

(assert (=> b!1416385 m!1307085))

(assert (=> b!1416385 m!1307085))

(declare-fun m!1307119 () Bool)

(assert (=> b!1416385 m!1307119))

(push 1)

