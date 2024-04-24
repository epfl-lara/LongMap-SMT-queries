; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125760 () Bool)

(assert start!125760)

(declare-fun b!1469729 () Bool)

(declare-fun res!997175 () Bool)

(declare-fun e!825507 () Bool)

(assert (=> b!1469729 (=> (not res!997175) (not e!825507))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99046 0))(
  ( (array!99047 (arr!47806 (Array (_ BitVec 32) (_ BitVec 64))) (size!48357 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99046)

(assert (=> b!1469729 (= res!997175 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48357 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48357 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48357 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47806 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469730 () Bool)

(declare-fun res!997178 () Bool)

(assert (=> b!1469730 (=> (not res!997178) (not e!825507))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469730 (= res!997178 (validKeyInArray!0 (select (arr!47806 a!2862) j!93)))))

(declare-fun b!1469731 () Bool)

(declare-fun res!997170 () Bool)

(assert (=> b!1469731 (=> (not res!997170) (not e!825507))))

(declare-datatypes ((List!34294 0))(
  ( (Nil!34291) (Cons!34290 (h!35654 (_ BitVec 64)) (t!48980 List!34294)) )
))
(declare-fun arrayNoDuplicates!0 (array!99046 (_ BitVec 32) List!34294) Bool)

(assert (=> b!1469731 (= res!997170 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34291))))

(declare-fun b!1469732 () Bool)

(declare-fun res!997173 () Bool)

(declare-fun e!825505 () Bool)

(assert (=> b!1469732 (=> (not res!997173) (not e!825505))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11943 0))(
  ( (MissingZero!11943 (index!50164 (_ BitVec 32))) (Found!11943 (index!50165 (_ BitVec 32))) (Intermediate!11943 (undefined!12755 Bool) (index!50166 (_ BitVec 32)) (x!131945 (_ BitVec 32))) (Undefined!11943) (MissingVacant!11943 (index!50167 (_ BitVec 32))) )
))
(declare-fun lt!642835 () SeekEntryResult!11943)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99046 (_ BitVec 32)) SeekEntryResult!11943)

(assert (=> b!1469732 (= res!997173 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47806 a!2862) j!93) a!2862 mask!2687) lt!642835))))

(declare-fun res!997176 () Bool)

(assert (=> start!125760 (=> (not res!997176) (not e!825507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125760 (= res!997176 (validMask!0 mask!2687))))

(assert (=> start!125760 e!825507))

(assert (=> start!125760 true))

(declare-fun array_inv!37087 (array!99046) Bool)

(assert (=> start!125760 (array_inv!37087 a!2862)))

(declare-fun b!1469733 () Bool)

(declare-fun res!997174 () Bool)

(assert (=> b!1469733 (=> (not res!997174) (not e!825507))))

(assert (=> b!1469733 (= res!997174 (and (= (size!48357 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48357 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48357 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469734 () Bool)

(declare-fun res!997172 () Bool)

(assert (=> b!1469734 (=> (not res!997172) (not e!825507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99046 (_ BitVec 32)) Bool)

(assert (=> b!1469734 (= res!997172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469735 () Bool)

(declare-fun res!997171 () Bool)

(assert (=> b!1469735 (=> (not res!997171) (not e!825507))))

(assert (=> b!1469735 (= res!997171 (validKeyInArray!0 (select (arr!47806 a!2862) i!1006)))))

(declare-fun b!1469736 () Bool)

(assert (=> b!1469736 (= e!825507 e!825505)))

(declare-fun res!997177 () Bool)

(assert (=> b!1469736 (=> (not res!997177) (not e!825505))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469736 (= res!997177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47806 a!2862) j!93) mask!2687) (select (arr!47806 a!2862) j!93) a!2862 mask!2687) lt!642835))))

(assert (=> b!1469736 (= lt!642835 (Intermediate!11943 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469737 () Bool)

(assert (=> b!1469737 (= e!825505 false)))

(declare-fun lt!642834 () SeekEntryResult!11943)

(assert (=> b!1469737 (= lt!642834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47806 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47806 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99047 (store (arr!47806 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48357 a!2862)) mask!2687))))

(assert (= (and start!125760 res!997176) b!1469733))

(assert (= (and b!1469733 res!997174) b!1469735))

(assert (= (and b!1469735 res!997171) b!1469730))

(assert (= (and b!1469730 res!997178) b!1469734))

(assert (= (and b!1469734 res!997172) b!1469731))

(assert (= (and b!1469731 res!997170) b!1469729))

(assert (= (and b!1469729 res!997175) b!1469736))

(assert (= (and b!1469736 res!997177) b!1469732))

(assert (= (and b!1469732 res!997173) b!1469737))

(declare-fun m!1356691 () Bool)

(assert (=> b!1469732 m!1356691))

(assert (=> b!1469732 m!1356691))

(declare-fun m!1356693 () Bool)

(assert (=> b!1469732 m!1356693))

(declare-fun m!1356695 () Bool)

(assert (=> b!1469735 m!1356695))

(assert (=> b!1469735 m!1356695))

(declare-fun m!1356697 () Bool)

(assert (=> b!1469735 m!1356697))

(declare-fun m!1356699 () Bool)

(assert (=> start!125760 m!1356699))

(declare-fun m!1356701 () Bool)

(assert (=> start!125760 m!1356701))

(declare-fun m!1356703 () Bool)

(assert (=> b!1469731 m!1356703))

(declare-fun m!1356705 () Bool)

(assert (=> b!1469737 m!1356705))

(declare-fun m!1356707 () Bool)

(assert (=> b!1469737 m!1356707))

(assert (=> b!1469737 m!1356707))

(declare-fun m!1356709 () Bool)

(assert (=> b!1469737 m!1356709))

(assert (=> b!1469737 m!1356709))

(assert (=> b!1469737 m!1356707))

(declare-fun m!1356711 () Bool)

(assert (=> b!1469737 m!1356711))

(assert (=> b!1469730 m!1356691))

(assert (=> b!1469730 m!1356691))

(declare-fun m!1356713 () Bool)

(assert (=> b!1469730 m!1356713))

(declare-fun m!1356715 () Bool)

(assert (=> b!1469734 m!1356715))

(assert (=> b!1469729 m!1356705))

(declare-fun m!1356717 () Bool)

(assert (=> b!1469729 m!1356717))

(assert (=> b!1469736 m!1356691))

(assert (=> b!1469736 m!1356691))

(declare-fun m!1356719 () Bool)

(assert (=> b!1469736 m!1356719))

(assert (=> b!1469736 m!1356719))

(assert (=> b!1469736 m!1356691))

(declare-fun m!1356721 () Bool)

(assert (=> b!1469736 m!1356721))

(check-sat (not b!1469735) (not b!1469731) (not start!125760) (not b!1469737) (not b!1469734) (not b!1469736) (not b!1469732) (not b!1469730))
(check-sat)
