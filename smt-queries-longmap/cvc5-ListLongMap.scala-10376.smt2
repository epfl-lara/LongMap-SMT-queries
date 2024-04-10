; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122178 () Bool)

(assert start!122178)

(declare-fun b!1417383 () Bool)

(declare-fun res!953117 () Bool)

(declare-fun e!802185 () Bool)

(assert (=> b!1417383 (=> (not res!953117) (not e!802185))))

(declare-datatypes ((array!96762 0))(
  ( (array!96763 (arr!46709 (Array (_ BitVec 32) (_ BitVec 64))) (size!47259 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96762)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417383 (= res!953117 (validKeyInArray!0 (select (arr!46709 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!802187 () Bool)

(declare-fun b!1417384 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11020 0))(
  ( (MissingZero!11020 (index!46472 (_ BitVec 32))) (Found!11020 (index!46473 (_ BitVec 32))) (Intermediate!11020 (undefined!11832 Bool) (index!46474 (_ BitVec 32)) (x!128079 (_ BitVec 32))) (Undefined!11020) (MissingVacant!11020 (index!46475 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96762 (_ BitVec 32)) SeekEntryResult!11020)

(assert (=> b!1417384 (= e!802187 (= (seekEntryOrOpen!0 (select (arr!46709 a!2901) j!112) a!2901 mask!2840) (Found!11020 j!112)))))

(declare-fun b!1417385 () Bool)

(declare-fun res!953115 () Bool)

(assert (=> b!1417385 (=> (not res!953115) (not e!802185))))

(assert (=> b!1417385 (= res!953115 (validKeyInArray!0 (select (arr!46709 a!2901) j!112)))))

(declare-fun b!1417386 () Bool)

(declare-fun res!953119 () Bool)

(assert (=> b!1417386 (=> (not res!953119) (not e!802185))))

(declare-datatypes ((List!33228 0))(
  ( (Nil!33225) (Cons!33224 (h!34517 (_ BitVec 64)) (t!47922 List!33228)) )
))
(declare-fun arrayNoDuplicates!0 (array!96762 (_ BitVec 32) List!33228) Bool)

(assert (=> b!1417386 (= res!953119 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33225))))

(declare-fun b!1417387 () Bool)

(declare-fun res!953113 () Bool)

(assert (=> b!1417387 (=> (not res!953113) (not e!802185))))

(assert (=> b!1417387 (= res!953113 (and (= (size!47259 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47259 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47259 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!953116 () Bool)

(assert (=> start!122178 (=> (not res!953116) (not e!802185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122178 (= res!953116 (validMask!0 mask!2840))))

(assert (=> start!122178 e!802185))

(assert (=> start!122178 true))

(declare-fun array_inv!35737 (array!96762) Bool)

(assert (=> start!122178 (array_inv!35737 a!2901)))

(declare-fun b!1417388 () Bool)

(assert (=> b!1417388 (= e!802185 (not true))))

(assert (=> b!1417388 e!802187))

(declare-fun res!953114 () Bool)

(assert (=> b!1417388 (=> (not res!953114) (not e!802187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96762 (_ BitVec 32)) Bool)

(assert (=> b!1417388 (= res!953114 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48014 0))(
  ( (Unit!48015) )
))
(declare-fun lt!625356 () Unit!48014)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48014)

(assert (=> b!1417388 (= lt!625356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!625355 () SeekEntryResult!11020)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96762 (_ BitVec 32)) SeekEntryResult!11020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417388 (= lt!625355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46709 a!2901) j!112) mask!2840) (select (arr!46709 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417389 () Bool)

(declare-fun res!953118 () Bool)

(assert (=> b!1417389 (=> (not res!953118) (not e!802185))))

(assert (=> b!1417389 (= res!953118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!122178 res!953116) b!1417387))

(assert (= (and b!1417387 res!953113) b!1417383))

(assert (= (and b!1417383 res!953117) b!1417385))

(assert (= (and b!1417385 res!953115) b!1417389))

(assert (= (and b!1417389 res!953118) b!1417386))

(assert (= (and b!1417386 res!953119) b!1417388))

(assert (= (and b!1417388 res!953114) b!1417384))

(declare-fun m!1308087 () Bool)

(assert (=> b!1417383 m!1308087))

(assert (=> b!1417383 m!1308087))

(declare-fun m!1308089 () Bool)

(assert (=> b!1417383 m!1308089))

(declare-fun m!1308091 () Bool)

(assert (=> b!1417386 m!1308091))

(declare-fun m!1308093 () Bool)

(assert (=> b!1417389 m!1308093))

(declare-fun m!1308095 () Bool)

(assert (=> b!1417384 m!1308095))

(assert (=> b!1417384 m!1308095))

(declare-fun m!1308097 () Bool)

(assert (=> b!1417384 m!1308097))

(assert (=> b!1417385 m!1308095))

(assert (=> b!1417385 m!1308095))

(declare-fun m!1308099 () Bool)

(assert (=> b!1417385 m!1308099))

(declare-fun m!1308101 () Bool)

(assert (=> start!122178 m!1308101))

(declare-fun m!1308103 () Bool)

(assert (=> start!122178 m!1308103))

(assert (=> b!1417388 m!1308095))

(declare-fun m!1308105 () Bool)

(assert (=> b!1417388 m!1308105))

(assert (=> b!1417388 m!1308095))

(declare-fun m!1308107 () Bool)

(assert (=> b!1417388 m!1308107))

(assert (=> b!1417388 m!1308105))

(assert (=> b!1417388 m!1308095))

(declare-fun m!1308109 () Bool)

(assert (=> b!1417388 m!1308109))

(declare-fun m!1308111 () Bool)

(assert (=> b!1417388 m!1308111))

(push 1)

(assert (not b!1417389))

(assert (not b!1417388))

(assert (not start!122178))

(assert (not b!1417383))

(assert (not b!1417385))

(assert (not b!1417384))

(assert (not b!1417386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

