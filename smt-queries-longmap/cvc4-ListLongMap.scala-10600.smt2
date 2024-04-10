; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124742 () Bool)

(assert start!124742)

(declare-fun b!1446377 () Bool)

(declare-fun res!978144 () Bool)

(declare-fun e!814633 () Bool)

(assert (=> b!1446377 (=> (not res!978144) (not e!814633))))

(declare-fun e!814629 () Bool)

(assert (=> b!1446377 (= res!978144 e!814629)))

(declare-fun c!133629 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446377 (= c!133629 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446378 () Bool)

(declare-fun res!978147 () Bool)

(declare-fun e!814632 () Bool)

(assert (=> b!1446378 (=> (not res!978147) (not e!814632))))

(declare-datatypes ((array!98190 0))(
  ( (array!98191 (arr!47383 (Array (_ BitVec 32) (_ BitVec 64))) (size!47933 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98190)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98190 (_ BitVec 32)) Bool)

(assert (=> b!1446378 (= res!978147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!814631 () Bool)

(declare-fun b!1446379 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1446379 (= e!814631 (or (= (select (arr!47383 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47383 a!2862) intermediateBeforeIndex!19) (select (arr!47383 a!2862) j!93))))))

(declare-fun b!1446380 () Bool)

(declare-fun res!978150 () Bool)

(assert (=> b!1446380 (=> (not res!978150) (not e!814633))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446380 (= res!978150 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446381 () Bool)

(declare-fun res!978148 () Bool)

(assert (=> b!1446381 (=> (not res!978148) (not e!814632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446381 (= res!978148 (validKeyInArray!0 (select (arr!47383 a!2862) i!1006)))))

(declare-fun b!1446382 () Bool)

(declare-fun res!978151 () Bool)

(assert (=> b!1446382 (=> (not res!978151) (not e!814632))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1446382 (= res!978151 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47933 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47933 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47933 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!978141 () Bool)

(assert (=> start!124742 (=> (not res!978141) (not e!814632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124742 (= res!978141 (validMask!0 mask!2687))))

(assert (=> start!124742 e!814632))

(assert (=> start!124742 true))

(declare-fun array_inv!36411 (array!98190) Bool)

(assert (=> start!124742 (array_inv!36411 a!2862)))

(declare-datatypes ((SeekEntryResult!11635 0))(
  ( (MissingZero!11635 (index!48932 (_ BitVec 32))) (Found!11635 (index!48933 (_ BitVec 32))) (Intermediate!11635 (undefined!12447 Bool) (index!48934 (_ BitVec 32)) (x!130612 (_ BitVec 32))) (Undefined!11635) (MissingVacant!11635 (index!48935 (_ BitVec 32))) )
))
(declare-fun lt!634775 () SeekEntryResult!11635)

(declare-fun b!1446383 () Bool)

(declare-fun lt!634776 () array!98190)

(declare-fun lt!634773 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98190 (_ BitVec 32)) SeekEntryResult!11635)

(assert (=> b!1446383 (= e!814629 (= lt!634775 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634773 lt!634776 mask!2687)))))

(declare-fun b!1446384 () Bool)

(declare-fun e!814628 () Bool)

(assert (=> b!1446384 (= e!814628 e!814633)))

(declare-fun res!978154 () Bool)

(assert (=> b!1446384 (=> (not res!978154) (not e!814633))))

(assert (=> b!1446384 (= res!978154 (= lt!634775 (Intermediate!11635 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446384 (= lt!634775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634773 mask!2687) lt!634773 lt!634776 mask!2687))))

(assert (=> b!1446384 (= lt!634773 (select (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446385 () Bool)

(assert (=> b!1446385 (= e!814633 (not true))))

(assert (=> b!1446385 e!814631))

(declare-fun res!978152 () Bool)

(assert (=> b!1446385 (=> (not res!978152) (not e!814631))))

(assert (=> b!1446385 (= res!978152 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48766 0))(
  ( (Unit!48767) )
))
(declare-fun lt!634772 () Unit!48766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48766)

(assert (=> b!1446385 (= lt!634772 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446386 () Bool)

(declare-fun res!978149 () Bool)

(assert (=> b!1446386 (=> (not res!978149) (not e!814631))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98190 (_ BitVec 32)) SeekEntryResult!11635)

(assert (=> b!1446386 (= res!978149 (= (seekEntryOrOpen!0 (select (arr!47383 a!2862) j!93) a!2862 mask!2687) (Found!11635 j!93)))))

(declare-fun b!1446387 () Bool)

(declare-fun res!978145 () Bool)

(assert (=> b!1446387 (=> (not res!978145) (not e!814632))))

(assert (=> b!1446387 (= res!978145 (and (= (size!47933 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47933 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47933 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446388 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98190 (_ BitVec 32)) SeekEntryResult!11635)

(assert (=> b!1446388 (= e!814629 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634773 lt!634776 mask!2687) (seekEntryOrOpen!0 lt!634773 lt!634776 mask!2687)))))

(declare-fun b!1446389 () Bool)

(declare-fun res!978146 () Bool)

(assert (=> b!1446389 (=> (not res!978146) (not e!814632))))

(declare-datatypes ((List!33884 0))(
  ( (Nil!33881) (Cons!33880 (h!35230 (_ BitVec 64)) (t!48578 List!33884)) )
))
(declare-fun arrayNoDuplicates!0 (array!98190 (_ BitVec 32) List!33884) Bool)

(assert (=> b!1446389 (= res!978146 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33881))))

(declare-fun b!1446390 () Bool)

(declare-fun e!814634 () Bool)

(assert (=> b!1446390 (= e!814634 e!814628)))

(declare-fun res!978142 () Bool)

(assert (=> b!1446390 (=> (not res!978142) (not e!814628))))

(declare-fun lt!634774 () SeekEntryResult!11635)

(assert (=> b!1446390 (= res!978142 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47383 a!2862) j!93) mask!2687) (select (arr!47383 a!2862) j!93) a!2862 mask!2687) lt!634774))))

(assert (=> b!1446390 (= lt!634774 (Intermediate!11635 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446391 () Bool)

(assert (=> b!1446391 (= e!814632 e!814634)))

(declare-fun res!978140 () Bool)

(assert (=> b!1446391 (=> (not res!978140) (not e!814634))))

(assert (=> b!1446391 (= res!978140 (= (select (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446391 (= lt!634776 (array!98191 (store (arr!47383 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47933 a!2862)))))

(declare-fun b!1446392 () Bool)

(declare-fun res!978143 () Bool)

(assert (=> b!1446392 (=> (not res!978143) (not e!814628))))

(assert (=> b!1446392 (= res!978143 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47383 a!2862) j!93) a!2862 mask!2687) lt!634774))))

(declare-fun b!1446393 () Bool)

(declare-fun res!978153 () Bool)

(assert (=> b!1446393 (=> (not res!978153) (not e!814632))))

(assert (=> b!1446393 (= res!978153 (validKeyInArray!0 (select (arr!47383 a!2862) j!93)))))

(assert (= (and start!124742 res!978141) b!1446387))

(assert (= (and b!1446387 res!978145) b!1446381))

(assert (= (and b!1446381 res!978148) b!1446393))

(assert (= (and b!1446393 res!978153) b!1446378))

(assert (= (and b!1446378 res!978147) b!1446389))

(assert (= (and b!1446389 res!978146) b!1446382))

(assert (= (and b!1446382 res!978151) b!1446391))

(assert (= (and b!1446391 res!978140) b!1446390))

(assert (= (and b!1446390 res!978142) b!1446392))

(assert (= (and b!1446392 res!978143) b!1446384))

(assert (= (and b!1446384 res!978154) b!1446377))

(assert (= (and b!1446377 c!133629) b!1446383))

(assert (= (and b!1446377 (not c!133629)) b!1446388))

(assert (= (and b!1446377 res!978144) b!1446380))

(assert (= (and b!1446380 res!978150) b!1446385))

(assert (= (and b!1446385 res!978152) b!1446386))

(assert (= (and b!1446386 res!978149) b!1446379))

(declare-fun m!1335255 () Bool)

(assert (=> b!1446391 m!1335255))

(declare-fun m!1335257 () Bool)

(assert (=> b!1446391 m!1335257))

(declare-fun m!1335259 () Bool)

(assert (=> b!1446389 m!1335259))

(declare-fun m!1335261 () Bool)

(assert (=> b!1446390 m!1335261))

(assert (=> b!1446390 m!1335261))

(declare-fun m!1335263 () Bool)

(assert (=> b!1446390 m!1335263))

(assert (=> b!1446390 m!1335263))

(assert (=> b!1446390 m!1335261))

(declare-fun m!1335265 () Bool)

(assert (=> b!1446390 m!1335265))

(declare-fun m!1335267 () Bool)

(assert (=> b!1446385 m!1335267))

(declare-fun m!1335269 () Bool)

(assert (=> b!1446385 m!1335269))

(declare-fun m!1335271 () Bool)

(assert (=> b!1446384 m!1335271))

(assert (=> b!1446384 m!1335271))

(declare-fun m!1335273 () Bool)

(assert (=> b!1446384 m!1335273))

(assert (=> b!1446384 m!1335255))

(declare-fun m!1335275 () Bool)

(assert (=> b!1446384 m!1335275))

(declare-fun m!1335277 () Bool)

(assert (=> b!1446379 m!1335277))

(assert (=> b!1446379 m!1335261))

(declare-fun m!1335279 () Bool)

(assert (=> b!1446381 m!1335279))

(assert (=> b!1446381 m!1335279))

(declare-fun m!1335281 () Bool)

(assert (=> b!1446381 m!1335281))

(declare-fun m!1335283 () Bool)

(assert (=> b!1446378 m!1335283))

(declare-fun m!1335285 () Bool)

(assert (=> b!1446388 m!1335285))

(declare-fun m!1335287 () Bool)

(assert (=> b!1446388 m!1335287))

(assert (=> b!1446393 m!1335261))

(assert (=> b!1446393 m!1335261))

(declare-fun m!1335289 () Bool)

(assert (=> b!1446393 m!1335289))

(declare-fun m!1335291 () Bool)

(assert (=> b!1446383 m!1335291))

(assert (=> b!1446392 m!1335261))

(assert (=> b!1446392 m!1335261))

(declare-fun m!1335293 () Bool)

(assert (=> b!1446392 m!1335293))

(declare-fun m!1335295 () Bool)

(assert (=> start!124742 m!1335295))

(declare-fun m!1335297 () Bool)

(assert (=> start!124742 m!1335297))

(assert (=> b!1446386 m!1335261))

(assert (=> b!1446386 m!1335261))

(declare-fun m!1335299 () Bool)

(assert (=> b!1446386 m!1335299))

(push 1)

