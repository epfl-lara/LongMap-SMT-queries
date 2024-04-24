; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124488 () Bool)

(assert start!124488)

(declare-fun b!1439396 () Bool)

(declare-fun res!971250 () Bool)

(declare-fun e!812116 () Bool)

(assert (=> b!1439396 (=> (not res!971250) (not e!812116))))

(declare-datatypes ((array!97909 0))(
  ( (array!97910 (arr!47242 (Array (_ BitVec 32) (_ BitVec 64))) (size!47793 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97909)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439396 (= res!971250 (validKeyInArray!0 (select (arr!47242 a!2862) j!93)))))

(declare-fun b!1439397 () Bool)

(declare-fun res!971247 () Bool)

(assert (=> b!1439397 (=> (not res!971247) (not e!812116))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439397 (= res!971247 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47793 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47793 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47793 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47242 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439398 () Bool)

(declare-fun res!971246 () Bool)

(assert (=> b!1439398 (=> (not res!971246) (not e!812116))))

(assert (=> b!1439398 (= res!971246 (validKeyInArray!0 (select (arr!47242 a!2862) i!1006)))))

(declare-fun b!1439399 () Bool)

(declare-fun res!971252 () Bool)

(assert (=> b!1439399 (=> (not res!971252) (not e!812116))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1439399 (= res!971252 (and (= (size!47793 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47793 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47793 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439400 () Bool)

(declare-fun res!971249 () Bool)

(assert (=> b!1439400 (=> (not res!971249) (not e!812116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97909 (_ BitVec 32)) Bool)

(assert (=> b!1439400 (= res!971249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439401 () Bool)

(declare-fun res!971251 () Bool)

(assert (=> b!1439401 (=> (not res!971251) (not e!812116))))

(declare-datatypes ((List!33730 0))(
  ( (Nil!33727) (Cons!33726 (h!35081 (_ BitVec 64)) (t!48416 List!33730)) )
))
(declare-fun arrayNoDuplicates!0 (array!97909 (_ BitVec 32) List!33730) Bool)

(assert (=> b!1439401 (= res!971251 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33727))))

(declare-fun res!971244 () Bool)

(assert (=> start!124488 (=> (not res!971244) (not e!812116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124488 (= res!971244 (validMask!0 mask!2687))))

(assert (=> start!124488 e!812116))

(assert (=> start!124488 true))

(declare-fun array_inv!36523 (array!97909) Bool)

(assert (=> start!124488 (array_inv!36523 a!2862)))

(declare-fun b!1439402 () Bool)

(declare-fun e!812117 () Bool)

(assert (=> b!1439402 (= e!812116 e!812117)))

(declare-fun res!971245 () Bool)

(assert (=> b!1439402 (=> (not res!971245) (not e!812117))))

(declare-datatypes ((SeekEntryResult!11391 0))(
  ( (MissingZero!11391 (index!47956 (_ BitVec 32))) (Found!11391 (index!47957 (_ BitVec 32))) (Intermediate!11391 (undefined!12203 Bool) (index!47958 (_ BitVec 32)) (x!129868 (_ BitVec 32))) (Undefined!11391) (MissingVacant!11391 (index!47959 (_ BitVec 32))) )
))
(declare-fun lt!632964 () SeekEntryResult!11391)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97909 (_ BitVec 32)) SeekEntryResult!11391)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439402 (= res!971245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47242 a!2862) j!93) mask!2687) (select (arr!47242 a!2862) j!93) a!2862 mask!2687) lt!632964))))

(assert (=> b!1439402 (= lt!632964 (Intermediate!11391 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439403 () Bool)

(declare-fun res!971248 () Bool)

(assert (=> b!1439403 (=> (not res!971248) (not e!812117))))

(assert (=> b!1439403 (= res!971248 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47242 a!2862) j!93) a!2862 mask!2687) lt!632964))))

(declare-fun b!1439404 () Bool)

(assert (=> b!1439404 (= e!812117 false)))

(declare-fun lt!632965 () (_ BitVec 32))

(assert (=> b!1439404 (= lt!632965 (toIndex!0 (select (store (arr!47242 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(assert (= (and start!124488 res!971244) b!1439399))

(assert (= (and b!1439399 res!971252) b!1439398))

(assert (= (and b!1439398 res!971246) b!1439396))

(assert (= (and b!1439396 res!971250) b!1439400))

(assert (= (and b!1439400 res!971249) b!1439401))

(assert (= (and b!1439401 res!971251) b!1439397))

(assert (= (and b!1439397 res!971247) b!1439402))

(assert (= (and b!1439402 res!971245) b!1439403))

(assert (= (and b!1439403 res!971248) b!1439404))

(declare-fun m!1328677 () Bool)

(assert (=> b!1439398 m!1328677))

(assert (=> b!1439398 m!1328677))

(declare-fun m!1328679 () Bool)

(assert (=> b!1439398 m!1328679))

(declare-fun m!1328681 () Bool)

(assert (=> start!124488 m!1328681))

(declare-fun m!1328683 () Bool)

(assert (=> start!124488 m!1328683))

(declare-fun m!1328685 () Bool)

(assert (=> b!1439403 m!1328685))

(assert (=> b!1439403 m!1328685))

(declare-fun m!1328687 () Bool)

(assert (=> b!1439403 m!1328687))

(declare-fun m!1328689 () Bool)

(assert (=> b!1439401 m!1328689))

(declare-fun m!1328691 () Bool)

(assert (=> b!1439400 m!1328691))

(assert (=> b!1439396 m!1328685))

(assert (=> b!1439396 m!1328685))

(declare-fun m!1328693 () Bool)

(assert (=> b!1439396 m!1328693))

(assert (=> b!1439402 m!1328685))

(assert (=> b!1439402 m!1328685))

(declare-fun m!1328695 () Bool)

(assert (=> b!1439402 m!1328695))

(assert (=> b!1439402 m!1328695))

(assert (=> b!1439402 m!1328685))

(declare-fun m!1328697 () Bool)

(assert (=> b!1439402 m!1328697))

(declare-fun m!1328699 () Bool)

(assert (=> b!1439397 m!1328699))

(declare-fun m!1328701 () Bool)

(assert (=> b!1439397 m!1328701))

(assert (=> b!1439404 m!1328699))

(declare-fun m!1328703 () Bool)

(assert (=> b!1439404 m!1328703))

(assert (=> b!1439404 m!1328703))

(declare-fun m!1328705 () Bool)

(assert (=> b!1439404 m!1328705))

(check-sat (not b!1439401) (not b!1439404) (not b!1439402) (not start!124488) (not b!1439398) (not b!1439403) (not b!1439396) (not b!1439400))
(check-sat)
