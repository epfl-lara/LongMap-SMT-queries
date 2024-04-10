; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124126 () Bool)

(assert start!124126)

(declare-fun b!1436940 () Bool)

(declare-fun res!969825 () Bool)

(declare-fun e!810796 () Bool)

(assert (=> b!1436940 (=> (not res!969825) (not e!810796))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97730 0))(
  ( (array!97731 (arr!47159 (Array (_ BitVec 32) (_ BitVec 64))) (size!47709 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97730)

(assert (=> b!1436940 (= res!969825 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47709 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47709 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47709 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47159 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436941 () Bool)

(declare-fun res!969824 () Bool)

(assert (=> b!1436941 (=> (not res!969824) (not e!810796))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436941 (= res!969824 (and (= (size!47709 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47709 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47709 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436942 () Bool)

(assert (=> b!1436942 (= e!810796 false)))

(declare-datatypes ((SeekEntryResult!11411 0))(
  ( (MissingZero!11411 (index!48036 (_ BitVec 32))) (Found!11411 (index!48037 (_ BitVec 32))) (Intermediate!11411 (undefined!12223 Bool) (index!48038 (_ BitVec 32)) (x!129772 (_ BitVec 32))) (Undefined!11411) (MissingVacant!11411 (index!48039 (_ BitVec 32))) )
))
(declare-fun lt!632223 () SeekEntryResult!11411)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97730 (_ BitVec 32)) SeekEntryResult!11411)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436942 (= lt!632223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47159 a!2862) j!93) mask!2687) (select (arr!47159 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1436943 () Bool)

(declare-fun res!969827 () Bool)

(assert (=> b!1436943 (=> (not res!969827) (not e!810796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97730 (_ BitVec 32)) Bool)

(assert (=> b!1436943 (= res!969827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436944 () Bool)

(declare-fun res!969826 () Bool)

(assert (=> b!1436944 (=> (not res!969826) (not e!810796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436944 (= res!969826 (validKeyInArray!0 (select (arr!47159 a!2862) i!1006)))))

(declare-fun b!1436945 () Bool)

(declare-fun res!969829 () Bool)

(assert (=> b!1436945 (=> (not res!969829) (not e!810796))))

(declare-datatypes ((List!33660 0))(
  ( (Nil!33657) (Cons!33656 (h!34994 (_ BitVec 64)) (t!48354 List!33660)) )
))
(declare-fun arrayNoDuplicates!0 (array!97730 (_ BitVec 32) List!33660) Bool)

(assert (=> b!1436945 (= res!969829 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33657))))

(declare-fun res!969823 () Bool)

(assert (=> start!124126 (=> (not res!969823) (not e!810796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124126 (= res!969823 (validMask!0 mask!2687))))

(assert (=> start!124126 e!810796))

(assert (=> start!124126 true))

(declare-fun array_inv!36187 (array!97730) Bool)

(assert (=> start!124126 (array_inv!36187 a!2862)))

(declare-fun b!1436946 () Bool)

(declare-fun res!969828 () Bool)

(assert (=> b!1436946 (=> (not res!969828) (not e!810796))))

(assert (=> b!1436946 (= res!969828 (validKeyInArray!0 (select (arr!47159 a!2862) j!93)))))

(assert (= (and start!124126 res!969823) b!1436941))

(assert (= (and b!1436941 res!969824) b!1436944))

(assert (= (and b!1436944 res!969826) b!1436946))

(assert (= (and b!1436946 res!969828) b!1436943))

(assert (= (and b!1436943 res!969827) b!1436945))

(assert (= (and b!1436945 res!969829) b!1436940))

(assert (= (and b!1436940 res!969825) b!1436942))

(declare-fun m!1326241 () Bool)

(assert (=> b!1436945 m!1326241))

(declare-fun m!1326243 () Bool)

(assert (=> start!124126 m!1326243))

(declare-fun m!1326245 () Bool)

(assert (=> start!124126 m!1326245))

(declare-fun m!1326247 () Bool)

(assert (=> b!1436940 m!1326247))

(declare-fun m!1326249 () Bool)

(assert (=> b!1436940 m!1326249))

(declare-fun m!1326251 () Bool)

(assert (=> b!1436943 m!1326251))

(declare-fun m!1326253 () Bool)

(assert (=> b!1436946 m!1326253))

(assert (=> b!1436946 m!1326253))

(declare-fun m!1326255 () Bool)

(assert (=> b!1436946 m!1326255))

(declare-fun m!1326257 () Bool)

(assert (=> b!1436944 m!1326257))

(assert (=> b!1436944 m!1326257))

(declare-fun m!1326259 () Bool)

(assert (=> b!1436944 m!1326259))

(assert (=> b!1436942 m!1326253))

(assert (=> b!1436942 m!1326253))

(declare-fun m!1326261 () Bool)

(assert (=> b!1436942 m!1326261))

(assert (=> b!1436942 m!1326261))

(assert (=> b!1436942 m!1326253))

(declare-fun m!1326263 () Bool)

(assert (=> b!1436942 m!1326263))

(push 1)

(assert (not b!1436942))

(assert (not b!1436944))

(assert (not b!1436945))

(assert (not b!1436946))

(assert (not start!124126))

(assert (not b!1436943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)
