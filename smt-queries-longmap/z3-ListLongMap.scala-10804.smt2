; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126690 () Bool)

(assert start!126690)

(declare-fun b!1484040 () Bool)

(declare-fun e!832307 () Bool)

(assert (=> b!1484040 (= e!832307 (not true))))

(declare-fun e!832311 () Bool)

(assert (=> b!1484040 e!832311))

(declare-fun res!1008165 () Bool)

(assert (=> b!1484040 (=> (not res!1008165) (not e!832311))))

(declare-datatypes ((array!99547 0))(
  ( (array!99548 (arr!48046 (Array (_ BitVec 32) (_ BitVec 64))) (size!48597 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99547)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99547 (_ BitVec 32)) Bool)

(assert (=> b!1484040 (= res!1008165 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49739 0))(
  ( (Unit!49740) )
))
(declare-fun lt!647679 () Unit!49739)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49739)

(assert (=> b!1484040 (= lt!647679 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484041 () Bool)

(declare-fun res!1008170 () Bool)

(declare-fun e!832305 () Bool)

(assert (=> b!1484041 (=> (not res!1008170) (not e!832305))))

(assert (=> b!1484041 (= res!1008170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12183 0))(
  ( (MissingZero!12183 (index!51124 (_ BitVec 32))) (Found!12183 (index!51125 (_ BitVec 32))) (Intermediate!12183 (undefined!12995 Bool) (index!51126 (_ BitVec 32)) (x!132891 (_ BitVec 32))) (Undefined!12183) (MissingVacant!12183 (index!51127 (_ BitVec 32))) )
))
(declare-fun lt!647677 () SeekEntryResult!12183)

(declare-fun lt!647676 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!647680 () array!99547)

(declare-fun b!1484042 () Bool)

(declare-fun e!832310 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99547 (_ BitVec 32)) SeekEntryResult!12183)

(assert (=> b!1484042 (= e!832310 (= lt!647677 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647676 lt!647680 mask!2687)))))

(declare-fun res!1008162 () Bool)

(assert (=> start!126690 (=> (not res!1008162) (not e!832305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126690 (= res!1008162 (validMask!0 mask!2687))))

(assert (=> start!126690 e!832305))

(assert (=> start!126690 true))

(declare-fun array_inv!37327 (array!99547) Bool)

(assert (=> start!126690 (array_inv!37327 a!2862)))

(declare-fun b!1484043 () Bool)

(declare-fun res!1008164 () Bool)

(assert (=> b!1484043 (=> (not res!1008164) (not e!832307))))

(assert (=> b!1484043 (= res!1008164 e!832310)))

(declare-fun c!137470 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484043 (= c!137470 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484044 () Bool)

(declare-fun res!1008174 () Bool)

(assert (=> b!1484044 (=> (not res!1008174) (not e!832305))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484044 (= res!1008174 (and (= (size!48597 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48597 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48597 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484045 () Bool)

(declare-fun res!1008176 () Bool)

(assert (=> b!1484045 (=> (not res!1008176) (not e!832305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484045 (= res!1008176 (validKeyInArray!0 (select (arr!48046 a!2862) j!93)))))

(declare-fun b!1484046 () Bool)

(declare-fun res!1008168 () Bool)

(assert (=> b!1484046 (=> (not res!1008168) (not e!832311))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99547 (_ BitVec 32)) SeekEntryResult!12183)

(assert (=> b!1484046 (= res!1008168 (= (seekEntryOrOpen!0 (select (arr!48046 a!2862) j!93) a!2862 mask!2687) (Found!12183 j!93)))))

(declare-fun b!1484047 () Bool)

(declare-fun res!1008166 () Bool)

(assert (=> b!1484047 (=> (not res!1008166) (not e!832305))))

(declare-datatypes ((List!34534 0))(
  ( (Nil!34531) (Cons!34530 (h!35915 (_ BitVec 64)) (t!49220 List!34534)) )
))
(declare-fun arrayNoDuplicates!0 (array!99547 (_ BitVec 32) List!34534) Bool)

(assert (=> b!1484047 (= res!1008166 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34531))))

(declare-fun b!1484048 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484048 (= e!832311 (and (or (= (select (arr!48046 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48046 a!2862) intermediateBeforeIndex!19) (select (arr!48046 a!2862) j!93))) (or (and (= (select (arr!48046 a!2862) index!646) (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48046 a!2862) index!646) (select (arr!48046 a!2862) j!93))) (= (select (arr!48046 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1484049 () Bool)

(declare-fun res!1008175 () Bool)

(assert (=> b!1484049 (=> (not res!1008175) (not e!832307))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484049 (= res!1008175 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484050 () Bool)

(declare-fun res!1008163 () Bool)

(declare-fun e!832309 () Bool)

(assert (=> b!1484050 (=> (not res!1008163) (not e!832309))))

(declare-fun lt!647678 () SeekEntryResult!12183)

(assert (=> b!1484050 (= res!1008163 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48046 a!2862) j!93) a!2862 mask!2687) lt!647678))))

(declare-fun b!1484051 () Bool)

(declare-fun res!1008169 () Bool)

(assert (=> b!1484051 (=> (not res!1008169) (not e!832305))))

(assert (=> b!1484051 (= res!1008169 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48597 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48597 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48597 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484052 () Bool)

(declare-fun e!832308 () Bool)

(assert (=> b!1484052 (= e!832305 e!832308)))

(declare-fun res!1008173 () Bool)

(assert (=> b!1484052 (=> (not res!1008173) (not e!832308))))

(assert (=> b!1484052 (= res!1008173 (= (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484052 (= lt!647680 (array!99548 (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48597 a!2862)))))

(declare-fun b!1484053 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99547 (_ BitVec 32)) SeekEntryResult!12183)

(assert (=> b!1484053 (= e!832310 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647676 lt!647680 mask!2687) (seekEntryOrOpen!0 lt!647676 lt!647680 mask!2687)))))

(declare-fun b!1484054 () Bool)

(assert (=> b!1484054 (= e!832309 e!832307)))

(declare-fun res!1008167 () Bool)

(assert (=> b!1484054 (=> (not res!1008167) (not e!832307))))

(assert (=> b!1484054 (= res!1008167 (= lt!647677 (Intermediate!12183 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484054 (= lt!647677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647676 mask!2687) lt!647676 lt!647680 mask!2687))))

(assert (=> b!1484054 (= lt!647676 (select (store (arr!48046 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484055 () Bool)

(assert (=> b!1484055 (= e!832308 e!832309)))

(declare-fun res!1008171 () Bool)

(assert (=> b!1484055 (=> (not res!1008171) (not e!832309))))

(assert (=> b!1484055 (= res!1008171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48046 a!2862) j!93) mask!2687) (select (arr!48046 a!2862) j!93) a!2862 mask!2687) lt!647678))))

(assert (=> b!1484055 (= lt!647678 (Intermediate!12183 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484056 () Bool)

(declare-fun res!1008172 () Bool)

(assert (=> b!1484056 (=> (not res!1008172) (not e!832305))))

(assert (=> b!1484056 (= res!1008172 (validKeyInArray!0 (select (arr!48046 a!2862) i!1006)))))

(assert (= (and start!126690 res!1008162) b!1484044))

(assert (= (and b!1484044 res!1008174) b!1484056))

(assert (= (and b!1484056 res!1008172) b!1484045))

(assert (= (and b!1484045 res!1008176) b!1484041))

(assert (= (and b!1484041 res!1008170) b!1484047))

(assert (= (and b!1484047 res!1008166) b!1484051))

(assert (= (and b!1484051 res!1008169) b!1484052))

(assert (= (and b!1484052 res!1008173) b!1484055))

(assert (= (and b!1484055 res!1008171) b!1484050))

(assert (= (and b!1484050 res!1008163) b!1484054))

(assert (= (and b!1484054 res!1008167) b!1484043))

(assert (= (and b!1484043 c!137470) b!1484042))

(assert (= (and b!1484043 (not c!137470)) b!1484053))

(assert (= (and b!1484043 res!1008164) b!1484049))

(assert (= (and b!1484049 res!1008175) b!1484040))

(assert (= (and b!1484040 res!1008165) b!1484046))

(assert (= (and b!1484046 res!1008168) b!1484048))

(declare-fun m!1369741 () Bool)

(assert (=> b!1484055 m!1369741))

(assert (=> b!1484055 m!1369741))

(declare-fun m!1369743 () Bool)

(assert (=> b!1484055 m!1369743))

(assert (=> b!1484055 m!1369743))

(assert (=> b!1484055 m!1369741))

(declare-fun m!1369745 () Bool)

(assert (=> b!1484055 m!1369745))

(declare-fun m!1369747 () Bool)

(assert (=> b!1484052 m!1369747))

(declare-fun m!1369749 () Bool)

(assert (=> b!1484052 m!1369749))

(assert (=> b!1484045 m!1369741))

(assert (=> b!1484045 m!1369741))

(declare-fun m!1369751 () Bool)

(assert (=> b!1484045 m!1369751))

(assert (=> b!1484050 m!1369741))

(assert (=> b!1484050 m!1369741))

(declare-fun m!1369753 () Bool)

(assert (=> b!1484050 m!1369753))

(declare-fun m!1369755 () Bool)

(assert (=> b!1484053 m!1369755))

(declare-fun m!1369757 () Bool)

(assert (=> b!1484053 m!1369757))

(declare-fun m!1369759 () Bool)

(assert (=> b!1484040 m!1369759))

(declare-fun m!1369761 () Bool)

(assert (=> b!1484040 m!1369761))

(assert (=> b!1484046 m!1369741))

(assert (=> b!1484046 m!1369741))

(declare-fun m!1369763 () Bool)

(assert (=> b!1484046 m!1369763))

(declare-fun m!1369765 () Bool)

(assert (=> start!126690 m!1369765))

(declare-fun m!1369767 () Bool)

(assert (=> start!126690 m!1369767))

(declare-fun m!1369769 () Bool)

(assert (=> b!1484041 m!1369769))

(declare-fun m!1369771 () Bool)

(assert (=> b!1484056 m!1369771))

(assert (=> b!1484056 m!1369771))

(declare-fun m!1369773 () Bool)

(assert (=> b!1484056 m!1369773))

(declare-fun m!1369775 () Bool)

(assert (=> b!1484054 m!1369775))

(assert (=> b!1484054 m!1369775))

(declare-fun m!1369777 () Bool)

(assert (=> b!1484054 m!1369777))

(assert (=> b!1484054 m!1369747))

(declare-fun m!1369779 () Bool)

(assert (=> b!1484054 m!1369779))

(assert (=> b!1484048 m!1369747))

(declare-fun m!1369781 () Bool)

(assert (=> b!1484048 m!1369781))

(declare-fun m!1369783 () Bool)

(assert (=> b!1484048 m!1369783))

(declare-fun m!1369785 () Bool)

(assert (=> b!1484048 m!1369785))

(assert (=> b!1484048 m!1369741))

(declare-fun m!1369787 () Bool)

(assert (=> b!1484042 m!1369787))

(declare-fun m!1369789 () Bool)

(assert (=> b!1484047 m!1369789))

(check-sat (not b!1484045) (not b!1484056) (not b!1484054) (not start!126690) (not b!1484046) (not b!1484047) (not b!1484055) (not b!1484053) (not b!1484040) (not b!1484042) (not b!1484050) (not b!1484041))
(check-sat)
