; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125884 () Bool)

(assert start!125884)

(declare-fun b!1474169 () Bool)

(declare-fun res!1001499 () Bool)

(declare-fun e!827124 () Bool)

(assert (=> b!1474169 (=> (not res!1001499) (not e!827124))))

(declare-datatypes ((array!99139 0))(
  ( (array!99140 (arr!47854 (Array (_ BitVec 32) (_ BitVec 64))) (size!48406 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99139)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12119 0))(
  ( (MissingZero!12119 (index!50868 (_ BitVec 32))) (Found!12119 (index!50869 (_ BitVec 32))) (Intermediate!12119 (undefined!12931 Bool) (index!50870 (_ BitVec 32)) (x!132446 (_ BitVec 32))) (Undefined!12119) (MissingVacant!12119 (index!50871 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99139 (_ BitVec 32)) SeekEntryResult!12119)

(assert (=> b!1474169 (= res!1001499 (= (seekEntryOrOpen!0 (select (arr!47854 a!2862) j!93) a!2862 mask!2687) (Found!12119 j!93)))))

(declare-fun b!1474170 () Bool)

(declare-fun res!1001504 () Bool)

(declare-fun e!827126 () Bool)

(assert (=> b!1474170 (=> (not res!1001504) (not e!827126))))

(declare-datatypes ((List!34433 0))(
  ( (Nil!34430) (Cons!34429 (h!35788 (_ BitVec 64)) (t!49119 List!34433)) )
))
(declare-fun arrayNoDuplicates!0 (array!99139 (_ BitVec 32) List!34433) Bool)

(assert (=> b!1474170 (= res!1001504 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34430))))

(declare-fun b!1474171 () Bool)

(declare-fun res!1001512 () Bool)

(assert (=> b!1474171 (=> (not res!1001512) (not e!827126))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474171 (= res!1001512 (and (= (size!48406 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48406 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48406 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474172 () Bool)

(declare-fun res!1001510 () Bool)

(declare-fun e!827128 () Bool)

(assert (=> b!1474172 (=> (not res!1001510) (not e!827128))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474172 (= res!1001510 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474173 () Bool)

(declare-fun e!827127 () Bool)

(assert (=> b!1474173 (= e!827126 e!827127)))

(declare-fun res!1001509 () Bool)

(assert (=> b!1474173 (=> (not res!1001509) (not e!827127))))

(assert (=> b!1474173 (= res!1001509 (= (select (store (arr!47854 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643995 () array!99139)

(assert (=> b!1474173 (= lt!643995 (array!99140 (store (arr!47854 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48406 a!2862)))))

(declare-fun b!1474174 () Bool)

(declare-fun res!1001505 () Bool)

(assert (=> b!1474174 (=> (not res!1001505) (not e!827126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99139 (_ BitVec 32)) Bool)

(assert (=> b!1474174 (= res!1001505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474175 () Bool)

(declare-fun e!827130 () Bool)

(assert (=> b!1474175 (= e!827130 e!827128)))

(declare-fun res!1001506 () Bool)

(assert (=> b!1474175 (=> (not res!1001506) (not e!827128))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!643998 () SeekEntryResult!12119)

(assert (=> b!1474175 (= res!1001506 (= lt!643998 (Intermediate!12119 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643994 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99139 (_ BitVec 32)) SeekEntryResult!12119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474175 (= lt!643998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643994 mask!2687) lt!643994 lt!643995 mask!2687))))

(assert (=> b!1474175 (= lt!643994 (select (store (arr!47854 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474176 () Bool)

(declare-fun res!1001498 () Bool)

(assert (=> b!1474176 (=> (not res!1001498) (not e!827130))))

(declare-fun lt!643996 () SeekEntryResult!12119)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1474176 (= res!1001498 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47854 a!2862) j!93) a!2862 mask!2687) lt!643996))))

(declare-fun b!1474177 () Bool)

(declare-fun res!1001511 () Bool)

(assert (=> b!1474177 (=> (not res!1001511) (not e!827126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474177 (= res!1001511 (validKeyInArray!0 (select (arr!47854 a!2862) i!1006)))))

(declare-fun b!1474178 () Bool)

(declare-fun e!827129 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99139 (_ BitVec 32)) SeekEntryResult!12119)

(assert (=> b!1474178 (= e!827129 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643994 lt!643995 mask!2687) (seekEntryOrOpen!0 lt!643994 lt!643995 mask!2687)))))

(declare-fun b!1474179 () Bool)

(declare-fun res!1001500 () Bool)

(assert (=> b!1474179 (=> (not res!1001500) (not e!827126))))

(assert (=> b!1474179 (= res!1001500 (validKeyInArray!0 (select (arr!47854 a!2862) j!93)))))

(declare-fun b!1474180 () Bool)

(declare-fun res!1001503 () Bool)

(assert (=> b!1474180 (=> (not res!1001503) (not e!827126))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1474180 (= res!1001503 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48406 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48406 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48406 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474181 () Bool)

(assert (=> b!1474181 (= e!827127 e!827130)))

(declare-fun res!1001507 () Bool)

(assert (=> b!1474181 (=> (not res!1001507) (not e!827130))))

(assert (=> b!1474181 (= res!1001507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47854 a!2862) j!93) mask!2687) (select (arr!47854 a!2862) j!93) a!2862 mask!2687) lt!643996))))

(assert (=> b!1474181 (= lt!643996 (Intermediate!12119 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1001508 () Bool)

(assert (=> start!125884 (=> (not res!1001508) (not e!827126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125884 (= res!1001508 (validMask!0 mask!2687))))

(assert (=> start!125884 e!827126))

(assert (=> start!125884 true))

(declare-fun array_inv!37087 (array!99139) Bool)

(assert (=> start!125884 (array_inv!37087 a!2862)))

(declare-fun b!1474182 () Bool)

(assert (=> b!1474182 (= e!827129 (= lt!643998 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643994 lt!643995 mask!2687)))))

(declare-fun b!1474183 () Bool)

(assert (=> b!1474183 (= e!827128 (not true))))

(assert (=> b!1474183 e!827124))

(declare-fun res!1001501 () Bool)

(assert (=> b!1474183 (=> (not res!1001501) (not e!827124))))

(assert (=> b!1474183 (= res!1001501 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49419 0))(
  ( (Unit!49420) )
))
(declare-fun lt!643997 () Unit!49419)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49419)

(assert (=> b!1474183 (= lt!643997 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474184 () Bool)

(assert (=> b!1474184 (= e!827124 (or (= (select (arr!47854 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47854 a!2862) intermediateBeforeIndex!19) (select (arr!47854 a!2862) j!93))))))

(declare-fun b!1474185 () Bool)

(declare-fun res!1001502 () Bool)

(assert (=> b!1474185 (=> (not res!1001502) (not e!827128))))

(assert (=> b!1474185 (= res!1001502 e!827129)))

(declare-fun c!135853 () Bool)

(assert (=> b!1474185 (= c!135853 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125884 res!1001508) b!1474171))

(assert (= (and b!1474171 res!1001512) b!1474177))

(assert (= (and b!1474177 res!1001511) b!1474179))

(assert (= (and b!1474179 res!1001500) b!1474174))

(assert (= (and b!1474174 res!1001505) b!1474170))

(assert (= (and b!1474170 res!1001504) b!1474180))

(assert (= (and b!1474180 res!1001503) b!1474173))

(assert (= (and b!1474173 res!1001509) b!1474181))

(assert (= (and b!1474181 res!1001507) b!1474176))

(assert (= (and b!1474176 res!1001498) b!1474175))

(assert (= (and b!1474175 res!1001506) b!1474185))

(assert (= (and b!1474185 c!135853) b!1474182))

(assert (= (and b!1474185 (not c!135853)) b!1474178))

(assert (= (and b!1474185 res!1001502) b!1474172))

(assert (= (and b!1474172 res!1001510) b!1474183))

(assert (= (and b!1474183 res!1001501) b!1474169))

(assert (= (and b!1474169 res!1001499) b!1474184))

(declare-fun m!1360143 () Bool)

(assert (=> b!1474178 m!1360143))

(declare-fun m!1360145 () Bool)

(assert (=> b!1474178 m!1360145))

(declare-fun m!1360147 () Bool)

(assert (=> b!1474177 m!1360147))

(assert (=> b!1474177 m!1360147))

(declare-fun m!1360149 () Bool)

(assert (=> b!1474177 m!1360149))

(declare-fun m!1360151 () Bool)

(assert (=> b!1474181 m!1360151))

(assert (=> b!1474181 m!1360151))

(declare-fun m!1360153 () Bool)

(assert (=> b!1474181 m!1360153))

(assert (=> b!1474181 m!1360153))

(assert (=> b!1474181 m!1360151))

(declare-fun m!1360155 () Bool)

(assert (=> b!1474181 m!1360155))

(assert (=> b!1474179 m!1360151))

(assert (=> b!1474179 m!1360151))

(declare-fun m!1360157 () Bool)

(assert (=> b!1474179 m!1360157))

(declare-fun m!1360159 () Bool)

(assert (=> b!1474173 m!1360159))

(declare-fun m!1360161 () Bool)

(assert (=> b!1474173 m!1360161))

(declare-fun m!1360163 () Bool)

(assert (=> b!1474170 m!1360163))

(declare-fun m!1360165 () Bool)

(assert (=> b!1474182 m!1360165))

(declare-fun m!1360167 () Bool)

(assert (=> b!1474184 m!1360167))

(assert (=> b!1474184 m!1360151))

(declare-fun m!1360169 () Bool)

(assert (=> b!1474175 m!1360169))

(assert (=> b!1474175 m!1360169))

(declare-fun m!1360171 () Bool)

(assert (=> b!1474175 m!1360171))

(assert (=> b!1474175 m!1360159))

(declare-fun m!1360173 () Bool)

(assert (=> b!1474175 m!1360173))

(assert (=> b!1474169 m!1360151))

(assert (=> b!1474169 m!1360151))

(declare-fun m!1360175 () Bool)

(assert (=> b!1474169 m!1360175))

(assert (=> b!1474176 m!1360151))

(assert (=> b!1474176 m!1360151))

(declare-fun m!1360177 () Bool)

(assert (=> b!1474176 m!1360177))

(declare-fun m!1360179 () Bool)

(assert (=> b!1474183 m!1360179))

(declare-fun m!1360181 () Bool)

(assert (=> b!1474183 m!1360181))

(declare-fun m!1360183 () Bool)

(assert (=> b!1474174 m!1360183))

(declare-fun m!1360185 () Bool)

(assert (=> start!125884 m!1360185))

(declare-fun m!1360187 () Bool)

(assert (=> start!125884 m!1360187))

(check-sat (not b!1474181) (not b!1474179) (not b!1474178) (not b!1474169) (not b!1474182) (not b!1474170) (not start!125884) (not b!1474177) (not b!1474176) (not b!1474175) (not b!1474183) (not b!1474174))
(check-sat)
