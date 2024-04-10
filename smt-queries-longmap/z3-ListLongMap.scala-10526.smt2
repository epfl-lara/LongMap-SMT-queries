; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124128 () Bool)

(assert start!124128)

(declare-fun b!1436961 () Bool)

(declare-fun res!969846 () Bool)

(declare-fun e!810803 () Bool)

(assert (=> b!1436961 (=> (not res!969846) (not e!810803))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97732 0))(
  ( (array!97733 (arr!47160 (Array (_ BitVec 32) (_ BitVec 64))) (size!47710 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97732)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1436961 (= res!969846 (and (= (size!47710 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47710 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47710 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!969849 () Bool)

(assert (=> start!124128 (=> (not res!969849) (not e!810803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124128 (= res!969849 (validMask!0 mask!2687))))

(assert (=> start!124128 e!810803))

(assert (=> start!124128 true))

(declare-fun array_inv!36188 (array!97732) Bool)

(assert (=> start!124128 (array_inv!36188 a!2862)))

(declare-fun b!1436962 () Bool)

(declare-fun res!969844 () Bool)

(assert (=> b!1436962 (=> (not res!969844) (not e!810803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97732 (_ BitVec 32)) Bool)

(assert (=> b!1436962 (= res!969844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436963 () Bool)

(declare-fun res!969850 () Bool)

(assert (=> b!1436963 (=> (not res!969850) (not e!810803))))

(declare-datatypes ((List!33661 0))(
  ( (Nil!33658) (Cons!33657 (h!34995 (_ BitVec 64)) (t!48355 List!33661)) )
))
(declare-fun arrayNoDuplicates!0 (array!97732 (_ BitVec 32) List!33661) Bool)

(assert (=> b!1436963 (= res!969850 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33658))))

(declare-fun b!1436964 () Bool)

(declare-fun res!969845 () Bool)

(assert (=> b!1436964 (=> (not res!969845) (not e!810803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436964 (= res!969845 (validKeyInArray!0 (select (arr!47160 a!2862) j!93)))))

(declare-fun b!1436965 () Bool)

(declare-fun res!969847 () Bool)

(assert (=> b!1436965 (=> (not res!969847) (not e!810803))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436965 (= res!969847 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47710 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47710 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47710 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47160 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436966 () Bool)

(assert (=> b!1436966 (= e!810803 false)))

(declare-datatypes ((SeekEntryResult!11412 0))(
  ( (MissingZero!11412 (index!48040 (_ BitVec 32))) (Found!11412 (index!48041 (_ BitVec 32))) (Intermediate!11412 (undefined!12224 Bool) (index!48042 (_ BitVec 32)) (x!129773 (_ BitVec 32))) (Undefined!11412) (MissingVacant!11412 (index!48043 (_ BitVec 32))) )
))
(declare-fun lt!632226 () SeekEntryResult!11412)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97732 (_ BitVec 32)) SeekEntryResult!11412)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436966 (= lt!632226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47160 a!2862) j!93) mask!2687) (select (arr!47160 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1436967 () Bool)

(declare-fun res!969848 () Bool)

(assert (=> b!1436967 (=> (not res!969848) (not e!810803))))

(assert (=> b!1436967 (= res!969848 (validKeyInArray!0 (select (arr!47160 a!2862) i!1006)))))

(assert (= (and start!124128 res!969849) b!1436961))

(assert (= (and b!1436961 res!969846) b!1436967))

(assert (= (and b!1436967 res!969848) b!1436964))

(assert (= (and b!1436964 res!969845) b!1436962))

(assert (= (and b!1436962 res!969844) b!1436963))

(assert (= (and b!1436963 res!969850) b!1436965))

(assert (= (and b!1436965 res!969847) b!1436966))

(declare-fun m!1326265 () Bool)

(assert (=> b!1436962 m!1326265))

(declare-fun m!1326267 () Bool)

(assert (=> start!124128 m!1326267))

(declare-fun m!1326269 () Bool)

(assert (=> start!124128 m!1326269))

(declare-fun m!1326271 () Bool)

(assert (=> b!1436965 m!1326271))

(declare-fun m!1326273 () Bool)

(assert (=> b!1436965 m!1326273))

(declare-fun m!1326275 () Bool)

(assert (=> b!1436963 m!1326275))

(declare-fun m!1326277 () Bool)

(assert (=> b!1436967 m!1326277))

(assert (=> b!1436967 m!1326277))

(declare-fun m!1326279 () Bool)

(assert (=> b!1436967 m!1326279))

(declare-fun m!1326281 () Bool)

(assert (=> b!1436966 m!1326281))

(assert (=> b!1436966 m!1326281))

(declare-fun m!1326283 () Bool)

(assert (=> b!1436966 m!1326283))

(assert (=> b!1436966 m!1326283))

(assert (=> b!1436966 m!1326281))

(declare-fun m!1326285 () Bool)

(assert (=> b!1436966 m!1326285))

(assert (=> b!1436964 m!1326281))

(assert (=> b!1436964 m!1326281))

(declare-fun m!1326287 () Bool)

(assert (=> b!1436964 m!1326287))

(check-sat (not b!1436963) (not b!1436967) (not b!1436964) (not b!1436962) (not b!1436966) (not start!124128))
