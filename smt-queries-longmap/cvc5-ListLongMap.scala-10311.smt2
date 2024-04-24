; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121380 () Bool)

(assert start!121380)

(declare-fun b!1410290 () Bool)

(declare-fun e!798191 () Bool)

(assert (=> b!1410290 (= e!798191 true)))

(declare-datatypes ((array!96456 0))(
  ( (array!96457 (arr!46569 (Array (_ BitVec 32) (_ BitVec 64))) (size!47120 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96456)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10783 0))(
  ( (MissingZero!10783 (index!45509 (_ BitVec 32))) (Found!10783 (index!45510 (_ BitVec 32))) (Intermediate!10783 (undefined!11595 Bool) (index!45511 (_ BitVec 32)) (x!127251 (_ BitVec 32))) (Undefined!10783) (MissingVacant!10783 (index!45512 (_ BitVec 32))) )
))
(declare-fun lt!621012 () SeekEntryResult!10783)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96456 (_ BitVec 32)) SeekEntryResult!10783)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410290 (= lt!621012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46569 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46569 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96457 (store (arr!46569 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47120 a!2901)) mask!2840))))

(declare-fun b!1410291 () Bool)

(declare-fun res!947330 () Bool)

(declare-fun e!798188 () Bool)

(assert (=> b!1410291 (=> (not res!947330) (not e!798188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410291 (= res!947330 (validKeyInArray!0 (select (arr!46569 a!2901) j!112)))))

(declare-fun res!947334 () Bool)

(assert (=> start!121380 (=> (not res!947334) (not e!798188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121380 (= res!947334 (validMask!0 mask!2840))))

(assert (=> start!121380 e!798188))

(assert (=> start!121380 true))

(declare-fun array_inv!35850 (array!96456) Bool)

(assert (=> start!121380 (array_inv!35850 a!2901)))

(declare-fun b!1410292 () Bool)

(declare-fun res!947329 () Bool)

(assert (=> b!1410292 (=> (not res!947329) (not e!798188))))

(assert (=> b!1410292 (= res!947329 (validKeyInArray!0 (select (arr!46569 a!2901) i!1037)))))

(declare-fun b!1410293 () Bool)

(assert (=> b!1410293 (= e!798188 (not e!798191))))

(declare-fun res!947333 () Bool)

(assert (=> b!1410293 (=> res!947333 e!798191)))

(declare-fun lt!621013 () SeekEntryResult!10783)

(assert (=> b!1410293 (= res!947333 (or (not (is-Intermediate!10783 lt!621013)) (undefined!11595 lt!621013)))))

(declare-fun e!798189 () Bool)

(assert (=> b!1410293 e!798189))

(declare-fun res!947332 () Bool)

(assert (=> b!1410293 (=> (not res!947332) (not e!798189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96456 (_ BitVec 32)) Bool)

(assert (=> b!1410293 (= res!947332 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47567 0))(
  ( (Unit!47568) )
))
(declare-fun lt!621014 () Unit!47567)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47567)

(assert (=> b!1410293 (= lt!621014 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410293 (= lt!621013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46569 a!2901) j!112) mask!2840) (select (arr!46569 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410294 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96456 (_ BitVec 32)) SeekEntryResult!10783)

(assert (=> b!1410294 (= e!798189 (= (seekEntryOrOpen!0 (select (arr!46569 a!2901) j!112) a!2901 mask!2840) (Found!10783 j!112)))))

(declare-fun b!1410295 () Bool)

(declare-fun res!947328 () Bool)

(assert (=> b!1410295 (=> (not res!947328) (not e!798188))))

(declare-datatypes ((List!33075 0))(
  ( (Nil!33072) (Cons!33071 (h!34342 (_ BitVec 64)) (t!47761 List!33075)) )
))
(declare-fun arrayNoDuplicates!0 (array!96456 (_ BitVec 32) List!33075) Bool)

(assert (=> b!1410295 (= res!947328 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33072))))

(declare-fun b!1410296 () Bool)

(declare-fun res!947331 () Bool)

(assert (=> b!1410296 (=> (not res!947331) (not e!798188))))

(assert (=> b!1410296 (= res!947331 (and (= (size!47120 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47120 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47120 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410297 () Bool)

(declare-fun res!947335 () Bool)

(assert (=> b!1410297 (=> (not res!947335) (not e!798188))))

(assert (=> b!1410297 (= res!947335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121380 res!947334) b!1410296))

(assert (= (and b!1410296 res!947331) b!1410292))

(assert (= (and b!1410292 res!947329) b!1410291))

(assert (= (and b!1410291 res!947330) b!1410297))

(assert (= (and b!1410297 res!947335) b!1410295))

(assert (= (and b!1410295 res!947328) b!1410293))

(assert (= (and b!1410293 res!947332) b!1410294))

(assert (= (and b!1410293 (not res!947333)) b!1410290))

(declare-fun m!1300119 () Bool)

(assert (=> b!1410292 m!1300119))

(assert (=> b!1410292 m!1300119))

(declare-fun m!1300121 () Bool)

(assert (=> b!1410292 m!1300121))

(declare-fun m!1300123 () Bool)

(assert (=> b!1410290 m!1300123))

(declare-fun m!1300125 () Bool)

(assert (=> b!1410290 m!1300125))

(assert (=> b!1410290 m!1300125))

(declare-fun m!1300127 () Bool)

(assert (=> b!1410290 m!1300127))

(assert (=> b!1410290 m!1300127))

(assert (=> b!1410290 m!1300125))

(declare-fun m!1300129 () Bool)

(assert (=> b!1410290 m!1300129))

(declare-fun m!1300131 () Bool)

(assert (=> start!121380 m!1300131))

(declare-fun m!1300133 () Bool)

(assert (=> start!121380 m!1300133))

(declare-fun m!1300135 () Bool)

(assert (=> b!1410297 m!1300135))

(declare-fun m!1300137 () Bool)

(assert (=> b!1410295 m!1300137))

(declare-fun m!1300139 () Bool)

(assert (=> b!1410291 m!1300139))

(assert (=> b!1410291 m!1300139))

(declare-fun m!1300141 () Bool)

(assert (=> b!1410291 m!1300141))

(assert (=> b!1410294 m!1300139))

(assert (=> b!1410294 m!1300139))

(declare-fun m!1300143 () Bool)

(assert (=> b!1410294 m!1300143))

(assert (=> b!1410293 m!1300139))

(declare-fun m!1300145 () Bool)

(assert (=> b!1410293 m!1300145))

(assert (=> b!1410293 m!1300139))

(declare-fun m!1300147 () Bool)

(assert (=> b!1410293 m!1300147))

(assert (=> b!1410293 m!1300145))

(assert (=> b!1410293 m!1300139))

(declare-fun m!1300149 () Bool)

(assert (=> b!1410293 m!1300149))

(declare-fun m!1300151 () Bool)

(assert (=> b!1410293 m!1300151))

(push 1)

(assert (not b!1410295))

(assert (not b!1410297))

(assert (not b!1410294))

(assert (not b!1410293))

(assert (not b!1410291))

(assert (not b!1410290))

(assert (not start!121380))

(assert (not b!1410292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

