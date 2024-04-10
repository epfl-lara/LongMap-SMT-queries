; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121644 () Bool)

(assert start!121644)

(declare-fun b!1413276 () Bool)

(declare-fun e!799807 () Bool)

(declare-fun e!799805 () Bool)

(assert (=> b!1413276 (= e!799807 (not e!799805))))

(declare-fun res!950269 () Bool)

(assert (=> b!1413276 (=> res!950269 e!799805)))

(declare-datatypes ((SeekEntryResult!10939 0))(
  ( (MissingZero!10939 (index!46136 (_ BitVec 32))) (Found!10939 (index!46137 (_ BitVec 32))) (Intermediate!10939 (undefined!11751 Bool) (index!46138 (_ BitVec 32)) (x!127722 (_ BitVec 32))) (Undefined!10939) (MissingVacant!10939 (index!46139 (_ BitVec 32))) )
))
(declare-fun lt!622923 () SeekEntryResult!10939)

(assert (=> b!1413276 (= res!950269 (or (not (is-Intermediate!10939 lt!622923)) (undefined!11751 lt!622923)))))

(declare-fun e!799808 () Bool)

(assert (=> b!1413276 e!799808))

(declare-fun res!950274 () Bool)

(assert (=> b!1413276 (=> (not res!950274) (not e!799808))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96582 0))(
  ( (array!96583 (arr!46628 (Array (_ BitVec 32) (_ BitVec 64))) (size!47178 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96582)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96582 (_ BitVec 32)) Bool)

(assert (=> b!1413276 (= res!950274 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47852 0))(
  ( (Unit!47853) )
))
(declare-fun lt!622922 () Unit!47852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47852)

(assert (=> b!1413276 (= lt!622922 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622925 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96582 (_ BitVec 32)) SeekEntryResult!10939)

(assert (=> b!1413276 (= lt!622923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622925 (select (arr!46628 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413276 (= lt!622925 (toIndex!0 (select (arr!46628 a!2901) j!112) mask!2840))))

(declare-fun b!1413277 () Bool)

(declare-fun res!950268 () Bool)

(assert (=> b!1413277 (=> (not res!950268) (not e!799807))))

(declare-datatypes ((List!33147 0))(
  ( (Nil!33144) (Cons!33143 (h!34418 (_ BitVec 64)) (t!47841 List!33147)) )
))
(declare-fun arrayNoDuplicates!0 (array!96582 (_ BitVec 32) List!33147) Bool)

(assert (=> b!1413277 (= res!950268 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33144))))

(declare-fun b!1413278 () Bool)

(declare-fun res!950267 () Bool)

(assert (=> b!1413278 (=> (not res!950267) (not e!799807))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413278 (= res!950267 (and (= (size!47178 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47178 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47178 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413279 () Bool)

(declare-fun e!799806 () Bool)

(assert (=> b!1413279 (= e!799806 true)))

(declare-fun e!799803 () Bool)

(assert (=> b!1413279 e!799803))

(declare-fun res!950273 () Bool)

(assert (=> b!1413279 (=> (not res!950273) (not e!799803))))

(declare-fun lt!622924 () SeekEntryResult!10939)

(assert (=> b!1413279 (= res!950273 (and (not (undefined!11751 lt!622924)) (= (index!46138 lt!622924) i!1037) (bvslt (x!127722 lt!622924) (x!127722 lt!622923)) (= (select (store (arr!46628 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46138 lt!622924)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622921 () Unit!47852)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47852)

(assert (=> b!1413279 (= lt!622921 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622925 (x!127722 lt!622923) (index!46138 lt!622923) (x!127722 lt!622924) (index!46138 lt!622924) (undefined!11751 lt!622924) mask!2840))))

(declare-fun b!1413280 () Bool)

(declare-fun res!950270 () Bool)

(assert (=> b!1413280 (=> (not res!950270) (not e!799807))))

(assert (=> b!1413280 (= res!950270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413281 () Bool)

(assert (=> b!1413281 (= e!799805 e!799806)))

(declare-fun res!950275 () Bool)

(assert (=> b!1413281 (=> res!950275 e!799806)))

(assert (=> b!1413281 (= res!950275 (or (= lt!622923 lt!622924) (not (is-Intermediate!10939 lt!622924))))))

(declare-fun lt!622926 () array!96582)

(declare-fun lt!622920 () (_ BitVec 64))

(assert (=> b!1413281 (= lt!622924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622920 mask!2840) lt!622920 lt!622926 mask!2840))))

(assert (=> b!1413281 (= lt!622920 (select (store (arr!46628 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413281 (= lt!622926 (array!96583 (store (arr!46628 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47178 a!2901)))))

(declare-fun res!950266 () Bool)

(assert (=> start!121644 (=> (not res!950266) (not e!799807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121644 (= res!950266 (validMask!0 mask!2840))))

(assert (=> start!121644 e!799807))

(assert (=> start!121644 true))

(declare-fun array_inv!35656 (array!96582) Bool)

(assert (=> start!121644 (array_inv!35656 a!2901)))

(declare-fun b!1413282 () Bool)

(declare-fun res!950271 () Bool)

(assert (=> b!1413282 (=> (not res!950271) (not e!799807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413282 (= res!950271 (validKeyInArray!0 (select (arr!46628 a!2901) i!1037)))))

(declare-fun b!1413283 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96582 (_ BitVec 32)) SeekEntryResult!10939)

(assert (=> b!1413283 (= e!799808 (= (seekEntryOrOpen!0 (select (arr!46628 a!2901) j!112) a!2901 mask!2840) (Found!10939 j!112)))))

(declare-fun b!1413284 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96582 (_ BitVec 32)) SeekEntryResult!10939)

(assert (=> b!1413284 (= e!799803 (= (seekEntryOrOpen!0 lt!622920 lt!622926 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127722 lt!622924) (index!46138 lt!622924) (index!46138 lt!622924) (select (arr!46628 a!2901) j!112) lt!622926 mask!2840)))))

(declare-fun b!1413285 () Bool)

(declare-fun res!950272 () Bool)

(assert (=> b!1413285 (=> (not res!950272) (not e!799807))))

(assert (=> b!1413285 (= res!950272 (validKeyInArray!0 (select (arr!46628 a!2901) j!112)))))

(assert (= (and start!121644 res!950266) b!1413278))

(assert (= (and b!1413278 res!950267) b!1413282))

(assert (= (and b!1413282 res!950271) b!1413285))

(assert (= (and b!1413285 res!950272) b!1413280))

(assert (= (and b!1413280 res!950270) b!1413277))

(assert (= (and b!1413277 res!950268) b!1413276))

(assert (= (and b!1413276 res!950274) b!1413283))

(assert (= (and b!1413276 (not res!950269)) b!1413281))

(assert (= (and b!1413281 (not res!950275)) b!1413279))

(assert (= (and b!1413279 res!950273) b!1413284))

(declare-fun m!1303635 () Bool)

(assert (=> b!1413282 m!1303635))

(assert (=> b!1413282 m!1303635))

(declare-fun m!1303637 () Bool)

(assert (=> b!1413282 m!1303637))

(declare-fun m!1303639 () Bool)

(assert (=> start!121644 m!1303639))

(declare-fun m!1303641 () Bool)

(assert (=> start!121644 m!1303641))

(declare-fun m!1303643 () Bool)

(assert (=> b!1413284 m!1303643))

(declare-fun m!1303645 () Bool)

(assert (=> b!1413284 m!1303645))

(assert (=> b!1413284 m!1303645))

(declare-fun m!1303647 () Bool)

(assert (=> b!1413284 m!1303647))

(declare-fun m!1303649 () Bool)

(assert (=> b!1413281 m!1303649))

(assert (=> b!1413281 m!1303649))

(declare-fun m!1303651 () Bool)

(assert (=> b!1413281 m!1303651))

(declare-fun m!1303653 () Bool)

(assert (=> b!1413281 m!1303653))

(declare-fun m!1303655 () Bool)

(assert (=> b!1413281 m!1303655))

(assert (=> b!1413283 m!1303645))

(assert (=> b!1413283 m!1303645))

(declare-fun m!1303657 () Bool)

(assert (=> b!1413283 m!1303657))

(assert (=> b!1413285 m!1303645))

(assert (=> b!1413285 m!1303645))

(declare-fun m!1303659 () Bool)

(assert (=> b!1413285 m!1303659))

(declare-fun m!1303661 () Bool)

(assert (=> b!1413277 m!1303661))

(assert (=> b!1413276 m!1303645))

(declare-fun m!1303663 () Bool)

(assert (=> b!1413276 m!1303663))

(assert (=> b!1413276 m!1303645))

(assert (=> b!1413276 m!1303645))

(declare-fun m!1303665 () Bool)

(assert (=> b!1413276 m!1303665))

(declare-fun m!1303667 () Bool)

(assert (=> b!1413276 m!1303667))

(declare-fun m!1303669 () Bool)

(assert (=> b!1413276 m!1303669))

(declare-fun m!1303671 () Bool)

(assert (=> b!1413280 m!1303671))

(assert (=> b!1413279 m!1303653))

(declare-fun m!1303673 () Bool)

(assert (=> b!1413279 m!1303673))

(declare-fun m!1303675 () Bool)

(assert (=> b!1413279 m!1303675))

(push 1)

(assert (not b!1413277))

