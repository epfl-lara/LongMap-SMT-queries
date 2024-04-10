; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122206 () Bool)

(assert start!122206)

(declare-fun b!1417677 () Bool)

(declare-fun res!953410 () Bool)

(declare-fun e!802312 () Bool)

(assert (=> b!1417677 (=> (not res!953410) (not e!802312))))

(declare-datatypes ((array!96790 0))(
  ( (array!96791 (arr!46723 (Array (_ BitVec 32) (_ BitVec 64))) (size!47273 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96790)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96790 (_ BitVec 32)) Bool)

(assert (=> b!1417677 (= res!953410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417678 () Bool)

(declare-fun res!953407 () Bool)

(assert (=> b!1417678 (=> (not res!953407) (not e!802312))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417678 (= res!953407 (and (= (size!47273 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47273 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47273 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417679 () Bool)

(declare-fun res!953412 () Bool)

(assert (=> b!1417679 (=> (not res!953412) (not e!802312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417679 (= res!953412 (validKeyInArray!0 (select (arr!46723 a!2901) j!112)))))

(declare-fun b!1417680 () Bool)

(declare-fun res!953413 () Bool)

(assert (=> b!1417680 (=> (not res!953413) (not e!802312))))

(assert (=> b!1417680 (= res!953413 (validKeyInArray!0 (select (arr!46723 a!2901) i!1037)))))

(declare-fun b!1417682 () Bool)

(assert (=> b!1417682 (= e!802312 (not true))))

(declare-fun e!802311 () Bool)

(assert (=> b!1417682 e!802311))

(declare-fun res!953409 () Bool)

(assert (=> b!1417682 (=> (not res!953409) (not e!802311))))

(assert (=> b!1417682 (= res!953409 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48042 0))(
  ( (Unit!48043) )
))
(declare-fun lt!625439 () Unit!48042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48042)

(assert (=> b!1417682 (= lt!625439 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11034 0))(
  ( (MissingZero!11034 (index!46528 (_ BitVec 32))) (Found!11034 (index!46529 (_ BitVec 32))) (Intermediate!11034 (undefined!11846 Bool) (index!46530 (_ BitVec 32)) (x!128125 (_ BitVec 32))) (Undefined!11034) (MissingVacant!11034 (index!46531 (_ BitVec 32))) )
))
(declare-fun lt!625440 () SeekEntryResult!11034)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96790 (_ BitVec 32)) SeekEntryResult!11034)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417682 (= lt!625440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46723 a!2901) j!112) mask!2840) (select (arr!46723 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417683 () Bool)

(declare-fun res!953411 () Bool)

(assert (=> b!1417683 (=> (not res!953411) (not e!802312))))

(declare-datatypes ((List!33242 0))(
  ( (Nil!33239) (Cons!33238 (h!34531 (_ BitVec 64)) (t!47936 List!33242)) )
))
(declare-fun arrayNoDuplicates!0 (array!96790 (_ BitVec 32) List!33242) Bool)

(assert (=> b!1417683 (= res!953411 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33239))))

(declare-fun res!953408 () Bool)

(assert (=> start!122206 (=> (not res!953408) (not e!802312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122206 (= res!953408 (validMask!0 mask!2840))))

(assert (=> start!122206 e!802312))

(assert (=> start!122206 true))

(declare-fun array_inv!35751 (array!96790) Bool)

(assert (=> start!122206 (array_inv!35751 a!2901)))

(declare-fun b!1417681 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96790 (_ BitVec 32)) SeekEntryResult!11034)

(assert (=> b!1417681 (= e!802311 (= (seekEntryOrOpen!0 (select (arr!46723 a!2901) j!112) a!2901 mask!2840) (Found!11034 j!112)))))

(assert (= (and start!122206 res!953408) b!1417678))

(assert (= (and b!1417678 res!953407) b!1417680))

(assert (= (and b!1417680 res!953413) b!1417679))

(assert (= (and b!1417679 res!953412) b!1417677))

(assert (= (and b!1417677 res!953410) b!1417683))

(assert (= (and b!1417683 res!953411) b!1417682))

(assert (= (and b!1417682 res!953409) b!1417681))

(declare-fun m!1308451 () Bool)

(assert (=> b!1417683 m!1308451))

(declare-fun m!1308453 () Bool)

(assert (=> b!1417681 m!1308453))

(assert (=> b!1417681 m!1308453))

(declare-fun m!1308455 () Bool)

(assert (=> b!1417681 m!1308455))

(declare-fun m!1308457 () Bool)

(assert (=> b!1417677 m!1308457))

(assert (=> b!1417679 m!1308453))

(assert (=> b!1417679 m!1308453))

(declare-fun m!1308459 () Bool)

(assert (=> b!1417679 m!1308459))

(declare-fun m!1308461 () Bool)

(assert (=> b!1417680 m!1308461))

(assert (=> b!1417680 m!1308461))

(declare-fun m!1308463 () Bool)

(assert (=> b!1417680 m!1308463))

(assert (=> b!1417682 m!1308453))

(declare-fun m!1308465 () Bool)

(assert (=> b!1417682 m!1308465))

(assert (=> b!1417682 m!1308453))

(declare-fun m!1308467 () Bool)

(assert (=> b!1417682 m!1308467))

(assert (=> b!1417682 m!1308465))

(assert (=> b!1417682 m!1308453))

(declare-fun m!1308469 () Bool)

(assert (=> b!1417682 m!1308469))

(declare-fun m!1308471 () Bool)

(assert (=> b!1417682 m!1308471))

(declare-fun m!1308473 () Bool)

(assert (=> start!122206 m!1308473))

(declare-fun m!1308475 () Bool)

(assert (=> start!122206 m!1308475))

(push 1)

(assert (not b!1417683))

(assert (not b!1417681))

(assert (not b!1417679))

(assert (not b!1417680))

(assert (not b!1417682))

(assert (not start!122206))

(assert (not b!1417677))

(check-sat)

(pop 1)

(push 1)

