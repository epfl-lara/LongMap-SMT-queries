; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124136 () Bool)

(assert start!124136)

(declare-fun res!969936 () Bool)

(declare-fun e!810826 () Bool)

(assert (=> start!124136 (=> (not res!969936) (not e!810826))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124136 (= res!969936 (validMask!0 mask!2687))))

(assert (=> start!124136 e!810826))

(assert (=> start!124136 true))

(declare-datatypes ((array!97740 0))(
  ( (array!97741 (arr!47164 (Array (_ BitVec 32) (_ BitVec 64))) (size!47714 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97740)

(declare-fun array_inv!36192 (array!97740) Bool)

(assert (=> start!124136 (array_inv!36192 a!2862)))

(declare-fun b!1437053 () Bool)

(declare-fun res!969939 () Bool)

(assert (=> b!1437053 (=> (not res!969939) (not e!810826))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437053 (= res!969939 (validKeyInArray!0 (select (arr!47164 a!2862) i!1006)))))

(declare-fun b!1437054 () Bool)

(declare-fun res!969941 () Bool)

(assert (=> b!1437054 (=> (not res!969941) (not e!810826))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1437054 (= res!969941 (and (= (size!47714 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47714 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47714 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437055 () Bool)

(declare-fun res!969940 () Bool)

(assert (=> b!1437055 (=> (not res!969940) (not e!810826))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11416 0))(
  ( (MissingZero!11416 (index!48056 (_ BitVec 32))) (Found!11416 (index!48057 (_ BitVec 32))) (Intermediate!11416 (undefined!12228 Bool) (index!48058 (_ BitVec 32)) (x!129785 (_ BitVec 32))) (Undefined!11416) (MissingVacant!11416 (index!48059 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97740 (_ BitVec 32)) SeekEntryResult!11416)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437055 (= res!969940 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47164 a!2862) j!93) mask!2687) (select (arr!47164 a!2862) j!93) a!2862 mask!2687) (Intermediate!11416 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1437056 () Bool)

(declare-fun res!969938 () Bool)

(assert (=> b!1437056 (=> (not res!969938) (not e!810826))))

(declare-datatypes ((List!33665 0))(
  ( (Nil!33662) (Cons!33661 (h!34999 (_ BitVec 64)) (t!48359 List!33665)) )
))
(declare-fun arrayNoDuplicates!0 (array!97740 (_ BitVec 32) List!33665) Bool)

(assert (=> b!1437056 (= res!969938 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33662))))

(declare-fun b!1437057 () Bool)

(declare-fun res!969943 () Bool)

(assert (=> b!1437057 (=> (not res!969943) (not e!810826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97740 (_ BitVec 32)) Bool)

(assert (=> b!1437057 (= res!969943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437058 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437058 (= e!810826 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1437059 () Bool)

(declare-fun res!969937 () Bool)

(assert (=> b!1437059 (=> (not res!969937) (not e!810826))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437059 (= res!969937 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47714 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47714 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47714 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47164 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437060 () Bool)

(declare-fun res!969942 () Bool)

(assert (=> b!1437060 (=> (not res!969942) (not e!810826))))

(assert (=> b!1437060 (= res!969942 (validKeyInArray!0 (select (arr!47164 a!2862) j!93)))))

(assert (= (and start!124136 res!969936) b!1437054))

(assert (= (and b!1437054 res!969941) b!1437053))

(assert (= (and b!1437053 res!969939) b!1437060))

(assert (= (and b!1437060 res!969942) b!1437057))

(assert (= (and b!1437057 res!969943) b!1437056))

(assert (= (and b!1437056 res!969938) b!1437059))

(assert (= (and b!1437059 res!969937) b!1437055))

(assert (= (and b!1437055 res!969940) b!1437058))

(declare-fun m!1326361 () Bool)

(assert (=> b!1437057 m!1326361))

(declare-fun m!1326363 () Bool)

(assert (=> b!1437053 m!1326363))

(assert (=> b!1437053 m!1326363))

(declare-fun m!1326365 () Bool)

(assert (=> b!1437053 m!1326365))

(declare-fun m!1326367 () Bool)

(assert (=> b!1437059 m!1326367))

(declare-fun m!1326369 () Bool)

(assert (=> b!1437059 m!1326369))

(declare-fun m!1326371 () Bool)

(assert (=> b!1437060 m!1326371))

(assert (=> b!1437060 m!1326371))

(declare-fun m!1326373 () Bool)

(assert (=> b!1437060 m!1326373))

(declare-fun m!1326375 () Bool)

(assert (=> b!1437056 m!1326375))

(assert (=> b!1437055 m!1326371))

(assert (=> b!1437055 m!1326371))

(declare-fun m!1326377 () Bool)

(assert (=> b!1437055 m!1326377))

(assert (=> b!1437055 m!1326377))

(assert (=> b!1437055 m!1326371))

(declare-fun m!1326379 () Bool)

(assert (=> b!1437055 m!1326379))

(declare-fun m!1326381 () Bool)

(assert (=> start!124136 m!1326381))

(declare-fun m!1326383 () Bool)

(assert (=> start!124136 m!1326383))

(push 1)

(assert (not b!1437057))

(assert (not b!1437053))

(assert (not b!1437056))

(assert (not b!1437055))

(assert (not b!1437060))

(assert (not start!124136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

