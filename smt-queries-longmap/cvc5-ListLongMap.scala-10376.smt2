; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122370 () Bool)

(assert start!122370)

(declare-fun b!1418565 () Bool)

(declare-fun res!953612 () Bool)

(declare-fun e!802942 () Bool)

(assert (=> b!1418565 (=> (not res!953612) (not e!802942))))

(declare-datatypes ((array!96876 0))(
  ( (array!96877 (arr!46764 (Array (_ BitVec 32) (_ BitVec 64))) (size!47315 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96876)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418565 (= res!953612 (validKeyInArray!0 (select (arr!46764 a!2901) i!1037)))))

(declare-fun b!1418566 () Bool)

(declare-fun res!953614 () Bool)

(assert (=> b!1418566 (=> (not res!953614) (not e!802942))))

(declare-datatypes ((List!33270 0))(
  ( (Nil!33267) (Cons!33266 (h!34567 (_ BitVec 64)) (t!47956 List!33270)) )
))
(declare-fun arrayNoDuplicates!0 (array!96876 (_ BitVec 32) List!33270) Bool)

(assert (=> b!1418566 (= res!953614 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33267))))

(declare-fun res!953613 () Bool)

(assert (=> start!122370 (=> (not res!953613) (not e!802942))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122370 (= res!953613 (validMask!0 mask!2840))))

(assert (=> start!122370 e!802942))

(assert (=> start!122370 true))

(declare-fun array_inv!36045 (array!96876) Bool)

(assert (=> start!122370 (array_inv!36045 a!2901)))

(declare-fun b!1418567 () Bool)

(declare-fun res!953611 () Bool)

(assert (=> b!1418567 (=> (not res!953611) (not e!802942))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1418567 (= res!953611 (validKeyInArray!0 (select (arr!46764 a!2901) j!112)))))

(declare-fun b!1418568 () Bool)

(declare-fun res!953617 () Bool)

(assert (=> b!1418568 (=> (not res!953617) (not e!802942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96876 (_ BitVec 32)) Bool)

(assert (=> b!1418568 (= res!953617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1418569 () Bool)

(declare-fun res!953616 () Bool)

(assert (=> b!1418569 (=> (not res!953616) (not e!802942))))

(assert (=> b!1418569 (= res!953616 (and (= (size!47315 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47315 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47315 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1418570 () Bool)

(assert (=> b!1418570 (= e!802942 (not true))))

(declare-fun e!802941 () Bool)

(assert (=> b!1418570 e!802941))

(declare-fun res!953615 () Bool)

(assert (=> b!1418570 (=> (not res!953615) (not e!802941))))

(assert (=> b!1418570 (= res!953615 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47957 0))(
  ( (Unit!47958) )
))
(declare-fun lt!625766 () Unit!47957)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47957)

(assert (=> b!1418570 (= lt!625766 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10978 0))(
  ( (MissingZero!10978 (index!46304 (_ BitVec 32))) (Found!10978 (index!46305 (_ BitVec 32))) (Intermediate!10978 (undefined!11790 Bool) (index!46306 (_ BitVec 32)) (x!128056 (_ BitVec 32))) (Undefined!10978) (MissingVacant!10978 (index!46307 (_ BitVec 32))) )
))
(declare-fun lt!625765 () SeekEntryResult!10978)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96876 (_ BitVec 32)) SeekEntryResult!10978)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418570 (= lt!625765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46764 a!2901) j!112) mask!2840) (select (arr!46764 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1418571 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96876 (_ BitVec 32)) SeekEntryResult!10978)

(assert (=> b!1418571 (= e!802941 (= (seekEntryOrOpen!0 (select (arr!46764 a!2901) j!112) a!2901 mask!2840) (Found!10978 j!112)))))

(assert (= (and start!122370 res!953613) b!1418569))

(assert (= (and b!1418569 res!953616) b!1418565))

(assert (= (and b!1418565 res!953612) b!1418567))

(assert (= (and b!1418567 res!953611) b!1418568))

(assert (= (and b!1418568 res!953617) b!1418566))

(assert (= (and b!1418566 res!953614) b!1418570))

(assert (= (and b!1418570 res!953615) b!1418571))

(declare-fun m!1309511 () Bool)

(assert (=> b!1418568 m!1309511))

(declare-fun m!1309513 () Bool)

(assert (=> b!1418571 m!1309513))

(assert (=> b!1418571 m!1309513))

(declare-fun m!1309515 () Bool)

(assert (=> b!1418571 m!1309515))

(declare-fun m!1309517 () Bool)

(assert (=> start!122370 m!1309517))

(declare-fun m!1309519 () Bool)

(assert (=> start!122370 m!1309519))

(declare-fun m!1309521 () Bool)

(assert (=> b!1418565 m!1309521))

(assert (=> b!1418565 m!1309521))

(declare-fun m!1309523 () Bool)

(assert (=> b!1418565 m!1309523))

(assert (=> b!1418567 m!1309513))

(assert (=> b!1418567 m!1309513))

(declare-fun m!1309525 () Bool)

(assert (=> b!1418567 m!1309525))

(declare-fun m!1309527 () Bool)

(assert (=> b!1418566 m!1309527))

(assert (=> b!1418570 m!1309513))

(declare-fun m!1309529 () Bool)

(assert (=> b!1418570 m!1309529))

(assert (=> b!1418570 m!1309513))

(declare-fun m!1309531 () Bool)

(assert (=> b!1418570 m!1309531))

(assert (=> b!1418570 m!1309529))

(assert (=> b!1418570 m!1309513))

(declare-fun m!1309533 () Bool)

(assert (=> b!1418570 m!1309533))

(declare-fun m!1309535 () Bool)

(assert (=> b!1418570 m!1309535))

(push 1)

(assert (not b!1418565))

(assert (not b!1418570))

(assert (not start!122370))

(assert (not b!1418571))

(assert (not b!1418566))

(assert (not b!1418568))

(assert (not b!1418567))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

