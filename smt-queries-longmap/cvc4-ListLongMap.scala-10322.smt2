; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121420 () Bool)

(assert start!121420)

(declare-fun res!947937 () Bool)

(declare-fun e!798325 () Bool)

(assert (=> start!121420 (=> (not res!947937) (not e!798325))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121420 (= res!947937 (validMask!0 mask!2840))))

(assert (=> start!121420 e!798325))

(assert (=> start!121420 true))

(declare-datatypes ((array!96421 0))(
  ( (array!96422 (arr!46549 (Array (_ BitVec 32) (_ BitVec 64))) (size!47099 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96421)

(declare-fun array_inv!35577 (array!96421) Bool)

(assert (=> start!121420 (array_inv!35577 a!2901)))

(declare-fun b!1410707 () Bool)

(declare-fun res!947940 () Bool)

(assert (=> b!1410707 (=> (not res!947940) (not e!798325))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410707 (= res!947940 (and (= (size!47099 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47099 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47099 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410708 () Bool)

(declare-fun e!798324 () Bool)

(declare-datatypes ((SeekEntryResult!10860 0))(
  ( (MissingZero!10860 (index!45817 (_ BitVec 32))) (Found!10860 (index!45818 (_ BitVec 32))) (Intermediate!10860 (undefined!11672 Bool) (index!45819 (_ BitVec 32)) (x!127415 (_ BitVec 32))) (Undefined!10860) (MissingVacant!10860 (index!45820 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96421 (_ BitVec 32)) SeekEntryResult!10860)

(assert (=> b!1410708 (= e!798324 (= (seekEntryOrOpen!0 (select (arr!46549 a!2901) j!112) a!2901 mask!2840) (Found!10860 j!112)))))

(declare-fun e!798326 () Bool)

(declare-fun b!1410709 () Bool)

(declare-fun lt!621299 () (_ BitVec 32))

(declare-fun lt!621297 () SeekEntryResult!10860)

(declare-fun lt!621300 () SeekEntryResult!10860)

(assert (=> b!1410709 (= e!798326 (or (= lt!621300 lt!621297) (not (is-Intermediate!10860 lt!621297)) (bvslt (x!127415 lt!621300) #b00000000000000000000000000000000) (bvsgt (x!127415 lt!621300) #b01111111111111111111111111111110) (bvslt lt!621299 #b00000000000000000000000000000000) (bvsge lt!621299 (size!47099 a!2901)) (bvslt (index!45819 lt!621300) #b00000000000000000000000000000000) (bvsge (index!45819 lt!621300) (size!47099 a!2901)) (= lt!621300 (Intermediate!10860 false (index!45819 lt!621300) (x!127415 lt!621300)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96421 (_ BitVec 32)) SeekEntryResult!10860)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410709 (= lt!621297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46549 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46549 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96422 (store (arr!46549 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47099 a!2901)) mask!2840))))

(declare-fun b!1410710 () Bool)

(declare-fun res!947935 () Bool)

(assert (=> b!1410710 (=> (not res!947935) (not e!798325))))

(declare-datatypes ((List!33068 0))(
  ( (Nil!33065) (Cons!33064 (h!34336 (_ BitVec 64)) (t!47762 List!33068)) )
))
(declare-fun arrayNoDuplicates!0 (array!96421 (_ BitVec 32) List!33068) Bool)

(assert (=> b!1410710 (= res!947935 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33065))))

(declare-fun b!1410711 () Bool)

(assert (=> b!1410711 (= e!798325 (not e!798326))))

(declare-fun res!947934 () Bool)

(assert (=> b!1410711 (=> res!947934 e!798326)))

(assert (=> b!1410711 (= res!947934 (or (not (is-Intermediate!10860 lt!621300)) (undefined!11672 lt!621300)))))

(assert (=> b!1410711 e!798324))

(declare-fun res!947936 () Bool)

(assert (=> b!1410711 (=> (not res!947936) (not e!798324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96421 (_ BitVec 32)) Bool)

(assert (=> b!1410711 (= res!947936 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47694 0))(
  ( (Unit!47695) )
))
(declare-fun lt!621298 () Unit!47694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47694)

(assert (=> b!1410711 (= lt!621298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410711 (= lt!621300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621299 (select (arr!46549 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410711 (= lt!621299 (toIndex!0 (select (arr!46549 a!2901) j!112) mask!2840))))

(declare-fun b!1410712 () Bool)

(declare-fun res!947938 () Bool)

(assert (=> b!1410712 (=> (not res!947938) (not e!798325))))

(assert (=> b!1410712 (= res!947938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410713 () Bool)

(declare-fun res!947939 () Bool)

(assert (=> b!1410713 (=> (not res!947939) (not e!798325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410713 (= res!947939 (validKeyInArray!0 (select (arr!46549 a!2901) j!112)))))

(declare-fun b!1410714 () Bool)

(declare-fun res!947941 () Bool)

(assert (=> b!1410714 (=> (not res!947941) (not e!798325))))

(assert (=> b!1410714 (= res!947941 (validKeyInArray!0 (select (arr!46549 a!2901) i!1037)))))

(assert (= (and start!121420 res!947937) b!1410707))

(assert (= (and b!1410707 res!947940) b!1410714))

(assert (= (and b!1410714 res!947941) b!1410713))

(assert (= (and b!1410713 res!947939) b!1410712))

(assert (= (and b!1410712 res!947938) b!1410710))

(assert (= (and b!1410710 res!947935) b!1410711))

(assert (= (and b!1410711 res!947936) b!1410708))

(assert (= (and b!1410711 (not res!947934)) b!1410709))

(declare-fun m!1300331 () Bool)

(assert (=> b!1410709 m!1300331))

(declare-fun m!1300333 () Bool)

(assert (=> b!1410709 m!1300333))

(assert (=> b!1410709 m!1300333))

(declare-fun m!1300335 () Bool)

(assert (=> b!1410709 m!1300335))

(assert (=> b!1410709 m!1300335))

(assert (=> b!1410709 m!1300333))

(declare-fun m!1300337 () Bool)

(assert (=> b!1410709 m!1300337))

(declare-fun m!1300339 () Bool)

(assert (=> start!121420 m!1300339))

(declare-fun m!1300341 () Bool)

(assert (=> start!121420 m!1300341))

(declare-fun m!1300343 () Bool)

(assert (=> b!1410713 m!1300343))

(assert (=> b!1410713 m!1300343))

(declare-fun m!1300345 () Bool)

(assert (=> b!1410713 m!1300345))

(assert (=> b!1410708 m!1300343))

(assert (=> b!1410708 m!1300343))

(declare-fun m!1300347 () Bool)

(assert (=> b!1410708 m!1300347))

(declare-fun m!1300349 () Bool)

(assert (=> b!1410714 m!1300349))

(assert (=> b!1410714 m!1300349))

(declare-fun m!1300351 () Bool)

(assert (=> b!1410714 m!1300351))

(declare-fun m!1300353 () Bool)

(assert (=> b!1410710 m!1300353))

(assert (=> b!1410711 m!1300343))

(declare-fun m!1300355 () Bool)

(assert (=> b!1410711 m!1300355))

(assert (=> b!1410711 m!1300343))

(declare-fun m!1300357 () Bool)

(assert (=> b!1410711 m!1300357))

(declare-fun m!1300359 () Bool)

(assert (=> b!1410711 m!1300359))

(assert (=> b!1410711 m!1300343))

(declare-fun m!1300361 () Bool)

(assert (=> b!1410711 m!1300361))

(declare-fun m!1300363 () Bool)

(assert (=> b!1410712 m!1300363))

(push 1)

(assert (not b!1410713))

