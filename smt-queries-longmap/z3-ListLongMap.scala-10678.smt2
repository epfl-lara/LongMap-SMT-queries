; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125208 () Bool)

(assert start!125208)

(declare-fun b!1460448 () Bool)

(declare-fun res!990220 () Bool)

(declare-fun e!821178 () Bool)

(assert (=> b!1460448 (=> (not res!990220) (not e!821178))))

(declare-datatypes ((array!98656 0))(
  ( (array!98657 (arr!47616 (Array (_ BitVec 32) (_ BitVec 64))) (size!48166 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98656)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98656 (_ BitVec 32)) Bool)

(assert (=> b!1460448 (= res!990220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460449 () Bool)

(declare-fun e!821183 () Bool)

(declare-fun e!821177 () Bool)

(assert (=> b!1460449 (= e!821183 e!821177)))

(declare-fun res!990231 () Bool)

(assert (=> b!1460449 (=> (not res!990231) (not e!821177))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11868 0))(
  ( (MissingZero!11868 (index!49864 (_ BitVec 32))) (Found!11868 (index!49865 (_ BitVec 32))) (Intermediate!11868 (undefined!12680 Bool) (index!49866 (_ BitVec 32)) (x!131469 (_ BitVec 32))) (Undefined!11868) (MissingVacant!11868 (index!49867 (_ BitVec 32))) )
))
(declare-fun lt!639826 () SeekEntryResult!11868)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460449 (= res!990231 (= lt!639826 (Intermediate!11868 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639827 () array!98656)

(declare-fun lt!639824 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98656 (_ BitVec 32)) SeekEntryResult!11868)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460449 (= lt!639826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639824 mask!2687) lt!639824 lt!639827 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460449 (= lt!639824 (select (store (arr!47616 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!821179 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1460450 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98656 (_ BitVec 32)) SeekEntryResult!11868)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98656 (_ BitVec 32)) SeekEntryResult!11868)

(assert (=> b!1460450 (= e!821179 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639824 lt!639827 mask!2687) (seekEntryOrOpen!0 lt!639824 lt!639827 mask!2687)))))

(declare-fun b!1460451 () Bool)

(declare-fun res!990232 () Bool)

(assert (=> b!1460451 (=> (not res!990232) (not e!821178))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460451 (= res!990232 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48166 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48166 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48166 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460452 () Bool)

(declare-fun res!990218 () Bool)

(assert (=> b!1460452 (=> (not res!990218) (not e!821178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460452 (= res!990218 (validKeyInArray!0 (select (arr!47616 a!2862) j!93)))))

(declare-fun b!1460453 () Bool)

(declare-fun e!821181 () Bool)

(assert (=> b!1460453 (= e!821178 e!821181)))

(declare-fun res!990229 () Bool)

(assert (=> b!1460453 (=> (not res!990229) (not e!821181))))

(assert (=> b!1460453 (= res!990229 (= (select (store (arr!47616 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460453 (= lt!639827 (array!98657 (store (arr!47616 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48166 a!2862)))))

(declare-fun b!1460454 () Bool)

(assert (=> b!1460454 (= e!821179 (= lt!639826 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639824 lt!639827 mask!2687)))))

(declare-fun b!1460455 () Bool)

(declare-fun res!990230 () Bool)

(assert (=> b!1460455 (=> (not res!990230) (not e!821178))))

(assert (=> b!1460455 (= res!990230 (and (= (size!48166 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48166 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48166 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460456 () Bool)

(declare-fun res!990224 () Bool)

(declare-fun e!821180 () Bool)

(assert (=> b!1460456 (=> (not res!990224) (not e!821180))))

(assert (=> b!1460456 (= res!990224 (= (seekEntryOrOpen!0 (select (arr!47616 a!2862) j!93) a!2862 mask!2687) (Found!11868 j!93)))))

(declare-fun b!1460457 () Bool)

(declare-fun res!990227 () Bool)

(assert (=> b!1460457 (=> (not res!990227) (not e!821178))))

(assert (=> b!1460457 (= res!990227 (validKeyInArray!0 (select (arr!47616 a!2862) i!1006)))))

(declare-fun b!1460447 () Bool)

(assert (=> b!1460447 (= e!821177 (not (or (and (= (select (arr!47616 a!2862) index!646) (select (store (arr!47616 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47616 a!2862) index!646) (select (arr!47616 a!2862) j!93))) (= (select (arr!47616 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1460447 e!821180))

(declare-fun res!990228 () Bool)

(assert (=> b!1460447 (=> (not res!990228) (not e!821180))))

(assert (=> b!1460447 (= res!990228 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49232 0))(
  ( (Unit!49233) )
))
(declare-fun lt!639828 () Unit!49232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49232)

(assert (=> b!1460447 (= lt!639828 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!990223 () Bool)

(assert (=> start!125208 (=> (not res!990223) (not e!821178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125208 (= res!990223 (validMask!0 mask!2687))))

(assert (=> start!125208 e!821178))

(assert (=> start!125208 true))

(declare-fun array_inv!36644 (array!98656) Bool)

(assert (=> start!125208 (array_inv!36644 a!2862)))

(declare-fun b!1460458 () Bool)

(assert (=> b!1460458 (= e!821181 e!821183)))

(declare-fun res!990226 () Bool)

(assert (=> b!1460458 (=> (not res!990226) (not e!821183))))

(declare-fun lt!639825 () SeekEntryResult!11868)

(assert (=> b!1460458 (= res!990226 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47616 a!2862) j!93) mask!2687) (select (arr!47616 a!2862) j!93) a!2862 mask!2687) lt!639825))))

(assert (=> b!1460458 (= lt!639825 (Intermediate!11868 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460459 () Bool)

(declare-fun res!990219 () Bool)

(assert (=> b!1460459 (=> (not res!990219) (not e!821178))))

(declare-datatypes ((List!34117 0))(
  ( (Nil!34114) (Cons!34113 (h!35463 (_ BitVec 64)) (t!48811 List!34117)) )
))
(declare-fun arrayNoDuplicates!0 (array!98656 (_ BitVec 32) List!34117) Bool)

(assert (=> b!1460459 (= res!990219 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34114))))

(declare-fun b!1460460 () Bool)

(declare-fun res!990221 () Bool)

(assert (=> b!1460460 (=> (not res!990221) (not e!821177))))

(assert (=> b!1460460 (= res!990221 e!821179)))

(declare-fun c!134625 () Bool)

(assert (=> b!1460460 (= c!134625 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460461 () Bool)

(declare-fun res!990225 () Bool)

(assert (=> b!1460461 (=> (not res!990225) (not e!821177))))

(assert (=> b!1460461 (= res!990225 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460462 () Bool)

(declare-fun res!990222 () Bool)

(assert (=> b!1460462 (=> (not res!990222) (not e!821183))))

(assert (=> b!1460462 (= res!990222 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47616 a!2862) j!93) a!2862 mask!2687) lt!639825))))

(declare-fun b!1460463 () Bool)

(assert (=> b!1460463 (= e!821180 (or (= (select (arr!47616 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47616 a!2862) intermediateBeforeIndex!19) (select (arr!47616 a!2862) j!93))))))

(assert (= (and start!125208 res!990223) b!1460455))

(assert (= (and b!1460455 res!990230) b!1460457))

(assert (= (and b!1460457 res!990227) b!1460452))

(assert (= (and b!1460452 res!990218) b!1460448))

(assert (= (and b!1460448 res!990220) b!1460459))

(assert (= (and b!1460459 res!990219) b!1460451))

(assert (= (and b!1460451 res!990232) b!1460453))

(assert (= (and b!1460453 res!990229) b!1460458))

(assert (= (and b!1460458 res!990226) b!1460462))

(assert (= (and b!1460462 res!990222) b!1460449))

(assert (= (and b!1460449 res!990231) b!1460460))

(assert (= (and b!1460460 c!134625) b!1460454))

(assert (= (and b!1460460 (not c!134625)) b!1460450))

(assert (= (and b!1460460 res!990221) b!1460461))

(assert (= (and b!1460461 res!990225) b!1460447))

(assert (= (and b!1460447 res!990228) b!1460456))

(assert (= (and b!1460456 res!990224) b!1460463))

(declare-fun m!1348125 () Bool)

(assert (=> b!1460457 m!1348125))

(assert (=> b!1460457 m!1348125))

(declare-fun m!1348127 () Bool)

(assert (=> b!1460457 m!1348127))

(declare-fun m!1348129 () Bool)

(assert (=> b!1460458 m!1348129))

(assert (=> b!1460458 m!1348129))

(declare-fun m!1348131 () Bool)

(assert (=> b!1460458 m!1348131))

(assert (=> b!1460458 m!1348131))

(assert (=> b!1460458 m!1348129))

(declare-fun m!1348133 () Bool)

(assert (=> b!1460458 m!1348133))

(declare-fun m!1348135 () Bool)

(assert (=> b!1460450 m!1348135))

(declare-fun m!1348137 () Bool)

(assert (=> b!1460450 m!1348137))

(declare-fun m!1348139 () Bool)

(assert (=> b!1460454 m!1348139))

(declare-fun m!1348141 () Bool)

(assert (=> b!1460453 m!1348141))

(declare-fun m!1348143 () Bool)

(assert (=> b!1460453 m!1348143))

(assert (=> b!1460456 m!1348129))

(assert (=> b!1460456 m!1348129))

(declare-fun m!1348145 () Bool)

(assert (=> b!1460456 m!1348145))

(declare-fun m!1348147 () Bool)

(assert (=> b!1460459 m!1348147))

(assert (=> b!1460462 m!1348129))

(assert (=> b!1460462 m!1348129))

(declare-fun m!1348149 () Bool)

(assert (=> b!1460462 m!1348149))

(declare-fun m!1348151 () Bool)

(assert (=> b!1460448 m!1348151))

(assert (=> b!1460452 m!1348129))

(assert (=> b!1460452 m!1348129))

(declare-fun m!1348153 () Bool)

(assert (=> b!1460452 m!1348153))

(declare-fun m!1348155 () Bool)

(assert (=> b!1460449 m!1348155))

(assert (=> b!1460449 m!1348155))

(declare-fun m!1348157 () Bool)

(assert (=> b!1460449 m!1348157))

(assert (=> b!1460449 m!1348141))

(declare-fun m!1348159 () Bool)

(assert (=> b!1460449 m!1348159))

(declare-fun m!1348161 () Bool)

(assert (=> b!1460447 m!1348161))

(assert (=> b!1460447 m!1348141))

(declare-fun m!1348163 () Bool)

(assert (=> b!1460447 m!1348163))

(declare-fun m!1348165 () Bool)

(assert (=> b!1460447 m!1348165))

(declare-fun m!1348167 () Bool)

(assert (=> b!1460447 m!1348167))

(assert (=> b!1460447 m!1348129))

(declare-fun m!1348169 () Bool)

(assert (=> start!125208 m!1348169))

(declare-fun m!1348171 () Bool)

(assert (=> start!125208 m!1348171))

(declare-fun m!1348173 () Bool)

(assert (=> b!1460463 m!1348173))

(assert (=> b!1460463 m!1348129))

(check-sat (not b!1460447) (not start!125208) (not b!1460448) (not b!1460454) (not b!1460449) (not b!1460458) (not b!1460462) (not b!1460459) (not b!1460452) (not b!1460457) (not b!1460456) (not b!1460450))
(check-sat)
