; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122188 () Bool)

(assert start!122188)

(declare-fun b!1417449 () Bool)

(declare-fun res!953235 () Bool)

(declare-fun e!802211 () Bool)

(assert (=> b!1417449 (=> (not res!953235) (not e!802211))))

(declare-datatypes ((array!96725 0))(
  ( (array!96726 (arr!46691 (Array (_ BitVec 32) (_ BitVec 64))) (size!47243 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96725)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96725 (_ BitVec 32)) Bool)

(assert (=> b!1417449 (= res!953235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417450 () Bool)

(declare-fun res!953230 () Bool)

(assert (=> b!1417450 (=> (not res!953230) (not e!802211))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417450 (= res!953230 (validKeyInArray!0 (select (arr!46691 a!2901) i!1037)))))

(declare-fun b!1417451 () Bool)

(declare-fun res!953232 () Bool)

(assert (=> b!1417451 (=> (not res!953232) (not e!802211))))

(declare-datatypes ((List!33288 0))(
  ( (Nil!33285) (Cons!33284 (h!34577 (_ BitVec 64)) (t!47974 List!33288)) )
))
(declare-fun arrayNoDuplicates!0 (array!96725 (_ BitVec 32) List!33288) Bool)

(assert (=> b!1417451 (= res!953232 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33285))))

(declare-fun b!1417452 () Bool)

(declare-fun res!953236 () Bool)

(assert (=> b!1417452 (=> (not res!953236) (not e!802211))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417452 (= res!953236 (validKeyInArray!0 (select (arr!46691 a!2901) j!112)))))

(declare-fun res!953231 () Bool)

(assert (=> start!122188 (=> (not res!953231) (not e!802211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122188 (= res!953231 (validMask!0 mask!2840))))

(assert (=> start!122188 e!802211))

(assert (=> start!122188 true))

(declare-fun array_inv!35924 (array!96725) Bool)

(assert (=> start!122188 (array_inv!35924 a!2901)))

(declare-fun b!1417453 () Bool)

(declare-fun res!953234 () Bool)

(assert (=> b!1417453 (=> (not res!953234) (not e!802211))))

(assert (=> b!1417453 (= res!953234 (and (= (size!47243 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47243 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47243 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!802209 () Bool)

(declare-fun b!1417454 () Bool)

(declare-datatypes ((SeekEntryResult!11028 0))(
  ( (MissingZero!11028 (index!46504 (_ BitVec 32))) (Found!11028 (index!46505 (_ BitVec 32))) (Intermediate!11028 (undefined!11840 Bool) (index!46506 (_ BitVec 32)) (x!128100 (_ BitVec 32))) (Undefined!11028) (MissingVacant!11028 (index!46507 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96725 (_ BitVec 32)) SeekEntryResult!11028)

(assert (=> b!1417454 (= e!802209 (= (seekEntryOrOpen!0 (select (arr!46691 a!2901) j!112) a!2901 mask!2840) (Found!11028 j!112)))))

(declare-fun b!1417455 () Bool)

(assert (=> b!1417455 (= e!802211 (not true))))

(assert (=> b!1417455 e!802209))

(declare-fun res!953233 () Bool)

(assert (=> b!1417455 (=> (not res!953233) (not e!802209))))

(assert (=> b!1417455 (= res!953233 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47873 0))(
  ( (Unit!47874) )
))
(declare-fun lt!625208 () Unit!47873)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47873)

(assert (=> b!1417455 (= lt!625208 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!625207 () SeekEntryResult!11028)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96725 (_ BitVec 32)) SeekEntryResult!11028)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417455 (= lt!625207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46691 a!2901) j!112) mask!2840) (select (arr!46691 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!122188 res!953231) b!1417453))

(assert (= (and b!1417453 res!953234) b!1417450))

(assert (= (and b!1417450 res!953230) b!1417452))

(assert (= (and b!1417452 res!953236) b!1417449))

(assert (= (and b!1417449 res!953235) b!1417451))

(assert (= (and b!1417451 res!953232) b!1417455))

(assert (= (and b!1417455 res!953233) b!1417454))

(declare-fun m!1307733 () Bool)

(assert (=> b!1417450 m!1307733))

(assert (=> b!1417450 m!1307733))

(declare-fun m!1307735 () Bool)

(assert (=> b!1417450 m!1307735))

(declare-fun m!1307737 () Bool)

(assert (=> b!1417454 m!1307737))

(assert (=> b!1417454 m!1307737))

(declare-fun m!1307739 () Bool)

(assert (=> b!1417454 m!1307739))

(declare-fun m!1307741 () Bool)

(assert (=> b!1417449 m!1307741))

(declare-fun m!1307743 () Bool)

(assert (=> start!122188 m!1307743))

(declare-fun m!1307745 () Bool)

(assert (=> start!122188 m!1307745))

(assert (=> b!1417452 m!1307737))

(assert (=> b!1417452 m!1307737))

(declare-fun m!1307747 () Bool)

(assert (=> b!1417452 m!1307747))

(declare-fun m!1307749 () Bool)

(assert (=> b!1417451 m!1307749))

(assert (=> b!1417455 m!1307737))

(declare-fun m!1307751 () Bool)

(assert (=> b!1417455 m!1307751))

(assert (=> b!1417455 m!1307737))

(declare-fun m!1307753 () Bool)

(assert (=> b!1417455 m!1307753))

(assert (=> b!1417455 m!1307751))

(assert (=> b!1417455 m!1307737))

(declare-fun m!1307755 () Bool)

(assert (=> b!1417455 m!1307755))

(declare-fun m!1307757 () Bool)

(assert (=> b!1417455 m!1307757))

(push 1)

(assert (not b!1417449))

(assert (not b!1417455))

(assert (not b!1417451))

(assert (not b!1417454))

(assert (not b!1417450))

(assert (not start!122188))

(assert (not b!1417452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

