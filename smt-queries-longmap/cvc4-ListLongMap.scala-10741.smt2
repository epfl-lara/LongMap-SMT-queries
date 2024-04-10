; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125588 () Bool)

(assert start!125588)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1469600 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99036 0))(
  ( (array!99037 (arr!47806 (Array (_ BitVec 32) (_ BitVec 64))) (size!48356 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99036)

(declare-fun e!825024 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469600 (= e!825024 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006) (bvsgt #b00000000000000000000000000000000 (size!48356 a!2862))))))

(declare-fun b!1469601 () Bool)

(declare-fun res!998069 () Bool)

(assert (=> b!1469601 (=> (not res!998069) (not e!825024))))

(declare-fun e!825025 () Bool)

(assert (=> b!1469601 (= res!998069 e!825025)))

(declare-fun c!135276 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469601 (= c!135276 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!998078 () Bool)

(declare-fun e!825028 () Bool)

(assert (=> start!125588 (=> (not res!998078) (not e!825028))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125588 (= res!998078 (validMask!0 mask!2687))))

(assert (=> start!125588 e!825028))

(assert (=> start!125588 true))

(declare-fun array_inv!36834 (array!99036) Bool)

(assert (=> start!125588 (array_inv!36834 a!2862)))

(declare-fun b!1469602 () Bool)

(declare-fun res!998076 () Bool)

(assert (=> b!1469602 (=> (not res!998076) (not e!825028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469602 (= res!998076 (validKeyInArray!0 (select (arr!47806 a!2862) i!1006)))))

(declare-fun lt!642612 () array!99036)

(declare-fun lt!642614 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12046 0))(
  ( (MissingZero!12046 (index!50576 (_ BitVec 32))) (Found!12046 (index!50577 (_ BitVec 32))) (Intermediate!12046 (undefined!12858 Bool) (index!50578 (_ BitVec 32)) (x!132151 (_ BitVec 32))) (Undefined!12046) (MissingVacant!12046 (index!50579 (_ BitVec 32))) )
))
(declare-fun lt!642613 () SeekEntryResult!12046)

(declare-fun b!1469603 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99036 (_ BitVec 32)) SeekEntryResult!12046)

(assert (=> b!1469603 (= e!825025 (= lt!642613 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642614 lt!642612 mask!2687)))))

(declare-fun b!1469604 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99036 (_ BitVec 32)) SeekEntryResult!12046)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99036 (_ BitVec 32)) SeekEntryResult!12046)

(assert (=> b!1469604 (= e!825025 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642614 lt!642612 mask!2687) (seekEntryOrOpen!0 lt!642614 lt!642612 mask!2687)))))

(declare-fun b!1469605 () Bool)

(declare-fun res!998080 () Bool)

(assert (=> b!1469605 (=> (not res!998080) (not e!825028))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1469605 (= res!998080 (and (= (size!48356 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48356 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48356 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469606 () Bool)

(declare-fun res!998073 () Bool)

(assert (=> b!1469606 (=> (not res!998073) (not e!825028))))

(assert (=> b!1469606 (= res!998073 (validKeyInArray!0 (select (arr!47806 a!2862) j!93)))))

(declare-fun b!1469607 () Bool)

(declare-fun res!998071 () Bool)

(assert (=> b!1469607 (=> (not res!998071) (not e!825028))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1469607 (= res!998071 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48356 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48356 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48356 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469608 () Bool)

(declare-fun e!825029 () Bool)

(assert (=> b!1469608 (= e!825028 e!825029)))

(declare-fun res!998075 () Bool)

(assert (=> b!1469608 (=> (not res!998075) (not e!825029))))

(assert (=> b!1469608 (= res!998075 (= (select (store (arr!47806 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469608 (= lt!642612 (array!99037 (store (arr!47806 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48356 a!2862)))))

(declare-fun b!1469609 () Bool)

(declare-fun res!998079 () Bool)

(declare-fun e!825026 () Bool)

(assert (=> b!1469609 (=> (not res!998079) (not e!825026))))

(declare-fun lt!642615 () SeekEntryResult!12046)

(assert (=> b!1469609 (= res!998079 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47806 a!2862) j!93) a!2862 mask!2687) lt!642615))))

(declare-fun b!1469610 () Bool)

(assert (=> b!1469610 (= e!825029 e!825026)))

(declare-fun res!998074 () Bool)

(assert (=> b!1469610 (=> (not res!998074) (not e!825026))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469610 (= res!998074 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47806 a!2862) j!93) mask!2687) (select (arr!47806 a!2862) j!93) a!2862 mask!2687) lt!642615))))

(assert (=> b!1469610 (= lt!642615 (Intermediate!12046 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469611 () Bool)

(assert (=> b!1469611 (= e!825026 e!825024)))

(declare-fun res!998072 () Bool)

(assert (=> b!1469611 (=> (not res!998072) (not e!825024))))

(assert (=> b!1469611 (= res!998072 (= lt!642613 (Intermediate!12046 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469611 (= lt!642613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642614 mask!2687) lt!642614 lt!642612 mask!2687))))

(assert (=> b!1469611 (= lt!642614 (select (store (arr!47806 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469612 () Bool)

(declare-fun res!998077 () Bool)

(assert (=> b!1469612 (=> (not res!998077) (not e!825028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99036 (_ BitVec 32)) Bool)

(assert (=> b!1469612 (= res!998077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469613 () Bool)

(declare-fun res!998070 () Bool)

(assert (=> b!1469613 (=> (not res!998070) (not e!825028))))

(declare-datatypes ((List!34307 0))(
  ( (Nil!34304) (Cons!34303 (h!35653 (_ BitVec 64)) (t!49001 List!34307)) )
))
(declare-fun arrayNoDuplicates!0 (array!99036 (_ BitVec 32) List!34307) Bool)

(assert (=> b!1469613 (= res!998070 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34304))))

(assert (= (and start!125588 res!998078) b!1469605))

(assert (= (and b!1469605 res!998080) b!1469602))

(assert (= (and b!1469602 res!998076) b!1469606))

(assert (= (and b!1469606 res!998073) b!1469612))

(assert (= (and b!1469612 res!998077) b!1469613))

(assert (= (and b!1469613 res!998070) b!1469607))

(assert (= (and b!1469607 res!998071) b!1469608))

(assert (= (and b!1469608 res!998075) b!1469610))

(assert (= (and b!1469610 res!998074) b!1469609))

(assert (= (and b!1469609 res!998079) b!1469611))

(assert (= (and b!1469611 res!998072) b!1469601))

(assert (= (and b!1469601 c!135276) b!1469603))

(assert (= (and b!1469601 (not c!135276)) b!1469604))

(assert (= (and b!1469601 res!998069) b!1469600))

(declare-fun m!1356767 () Bool)

(assert (=> b!1469611 m!1356767))

(assert (=> b!1469611 m!1356767))

(declare-fun m!1356769 () Bool)

(assert (=> b!1469611 m!1356769))

(declare-fun m!1356771 () Bool)

(assert (=> b!1469611 m!1356771))

(declare-fun m!1356773 () Bool)

(assert (=> b!1469611 m!1356773))

(declare-fun m!1356775 () Bool)

(assert (=> b!1469604 m!1356775))

(declare-fun m!1356777 () Bool)

(assert (=> b!1469604 m!1356777))

(declare-fun m!1356779 () Bool)

(assert (=> b!1469609 m!1356779))

(assert (=> b!1469609 m!1356779))

(declare-fun m!1356781 () Bool)

(assert (=> b!1469609 m!1356781))

(declare-fun m!1356783 () Bool)

(assert (=> b!1469603 m!1356783))

(declare-fun m!1356785 () Bool)

(assert (=> b!1469602 m!1356785))

(assert (=> b!1469602 m!1356785))

(declare-fun m!1356787 () Bool)

(assert (=> b!1469602 m!1356787))

(declare-fun m!1356789 () Bool)

(assert (=> start!125588 m!1356789))

(declare-fun m!1356791 () Bool)

(assert (=> start!125588 m!1356791))

(assert (=> b!1469608 m!1356771))

(declare-fun m!1356793 () Bool)

(assert (=> b!1469608 m!1356793))

(declare-fun m!1356795 () Bool)

(assert (=> b!1469612 m!1356795))

(assert (=> b!1469606 m!1356779))

(assert (=> b!1469606 m!1356779))

(declare-fun m!1356797 () Bool)

(assert (=> b!1469606 m!1356797))

(declare-fun m!1356799 () Bool)

(assert (=> b!1469613 m!1356799))

(assert (=> b!1469610 m!1356779))

(assert (=> b!1469610 m!1356779))

(declare-fun m!1356801 () Bool)

(assert (=> b!1469610 m!1356801))

(assert (=> b!1469610 m!1356801))

(assert (=> b!1469610 m!1356779))

(declare-fun m!1356803 () Bool)

(assert (=> b!1469610 m!1356803))

(push 1)

(assert (not b!1469612))

(assert (not b!1469603))

(assert (not start!125588))

(assert (not b!1469613))

