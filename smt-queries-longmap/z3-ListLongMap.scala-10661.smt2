; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125106 () Bool)

(assert start!125106)

(declare-fun b!1457142 () Bool)

(declare-fun res!987499 () Bool)

(declare-fun e!819760 () Bool)

(assert (=> b!1457142 (=> (not res!987499) (not e!819760))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98554 0))(
  ( (array!98555 (arr!47565 (Array (_ BitVec 32) (_ BitVec 64))) (size!48115 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98554)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11817 0))(
  ( (MissingZero!11817 (index!49660 (_ BitVec 32))) (Found!11817 (index!49661 (_ BitVec 32))) (Intermediate!11817 (undefined!12629 Bool) (index!49662 (_ BitVec 32)) (x!131282 (_ BitVec 32))) (Undefined!11817) (MissingVacant!11817 (index!49663 (_ BitVec 32))) )
))
(declare-fun lt!638573 () SeekEntryResult!11817)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98554 (_ BitVec 32)) SeekEntryResult!11817)

(assert (=> b!1457142 (= res!987499 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47565 a!2862) j!93) a!2862 mask!2687) lt!638573))))

(declare-fun b!1457143 () Bool)

(declare-fun e!819761 () Bool)

(assert (=> b!1457143 (= e!819761 true)))

(declare-fun lt!638572 () Bool)

(declare-fun e!819753 () Bool)

(assert (=> b!1457143 (= lt!638572 e!819753)))

(declare-fun c!134334 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457143 (= c!134334 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457144 () Bool)

(declare-fun res!987505 () Bool)

(declare-fun e!819756 () Bool)

(assert (=> b!1457144 (=> (not res!987505) (not e!819756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98554 (_ BitVec 32)) Bool)

(assert (=> b!1457144 (= res!987505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457145 () Bool)

(declare-fun res!987497 () Bool)

(assert (=> b!1457145 (=> (not res!987497) (not e!819756))))

(declare-datatypes ((List!34066 0))(
  ( (Nil!34063) (Cons!34062 (h!35412 (_ BitVec 64)) (t!48760 List!34066)) )
))
(declare-fun arrayNoDuplicates!0 (array!98554 (_ BitVec 32) List!34066) Bool)

(assert (=> b!1457145 (= res!987497 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34063))))

(declare-fun b!1457146 () Bool)

(declare-fun res!987504 () Bool)

(assert (=> b!1457146 (=> (not res!987504) (not e!819756))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457146 (= res!987504 (validKeyInArray!0 (select (arr!47565 a!2862) i!1006)))))

(declare-fun b!1457147 () Bool)

(declare-fun res!987498 () Bool)

(assert (=> b!1457147 (=> (not res!987498) (not e!819756))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457147 (= res!987498 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48115 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48115 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48115 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457148 () Bool)

(declare-fun e!819755 () Bool)

(assert (=> b!1457148 (= e!819755 e!819761)))

(declare-fun res!987507 () Bool)

(assert (=> b!1457148 (=> res!987507 e!819761)))

(declare-fun lt!638574 () (_ BitVec 32))

(assert (=> b!1457148 (= res!987507 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638574 #b00000000000000000000000000000000) (bvsge lt!638574 (size!48115 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457148 (= lt!638574 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638576 () array!98554)

(declare-fun lt!638575 () (_ BitVec 64))

(declare-fun lt!638570 () SeekEntryResult!11817)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98554 (_ BitVec 32)) SeekEntryResult!11817)

(assert (=> b!1457148 (= lt!638570 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638575 lt!638576 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98554 (_ BitVec 32)) SeekEntryResult!11817)

(assert (=> b!1457148 (= lt!638570 (seekEntryOrOpen!0 lt!638575 lt!638576 mask!2687))))

(declare-fun b!1457149 () Bool)

(declare-fun res!987512 () Bool)

(declare-fun e!819757 () Bool)

(assert (=> b!1457149 (=> (not res!987512) (not e!819757))))

(declare-fun e!819754 () Bool)

(assert (=> b!1457149 (= res!987512 e!819754)))

(declare-fun c!134333 () Bool)

(assert (=> b!1457149 (= c!134333 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457151 () Bool)

(declare-fun e!819759 () Bool)

(assert (=> b!1457151 (= e!819759 (and (or (= (select (arr!47565 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47565 a!2862) intermediateBeforeIndex!19) (select (arr!47565 a!2862) j!93))) (let ((bdg!53308 (select (store (arr!47565 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47565 a!2862) index!646) bdg!53308) (= (select (arr!47565 a!2862) index!646) (select (arr!47565 a!2862) j!93))) (= (select (arr!47565 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53308 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457152 () Bool)

(declare-fun lt!638571 () SeekEntryResult!11817)

(assert (=> b!1457152 (= e!819754 (= lt!638571 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638575 lt!638576 mask!2687)))))

(declare-fun b!1457153 () Bool)

(declare-fun res!987500 () Bool)

(assert (=> b!1457153 (=> (not res!987500) (not e!819756))))

(assert (=> b!1457153 (= res!987500 (and (= (size!48115 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48115 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48115 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457154 () Bool)

(declare-fun res!987509 () Bool)

(assert (=> b!1457154 (=> (not res!987509) (not e!819759))))

(assert (=> b!1457154 (= res!987509 (= (seekEntryOrOpen!0 (select (arr!47565 a!2862) j!93) a!2862 mask!2687) (Found!11817 j!93)))))

(declare-fun b!1457155 () Bool)

(assert (=> b!1457155 (= e!819753 (not (= lt!638571 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638574 lt!638575 lt!638576 mask!2687))))))

(declare-fun b!1457156 () Bool)

(declare-fun res!987511 () Bool)

(assert (=> b!1457156 (=> (not res!987511) (not e!819756))))

(assert (=> b!1457156 (= res!987511 (validKeyInArray!0 (select (arr!47565 a!2862) j!93)))))

(declare-fun b!1457157 () Bool)

(declare-fun e!819752 () Bool)

(assert (=> b!1457157 (= e!819752 e!819760)))

(declare-fun res!987510 () Bool)

(assert (=> b!1457157 (=> (not res!987510) (not e!819760))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457157 (= res!987510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47565 a!2862) j!93) mask!2687) (select (arr!47565 a!2862) j!93) a!2862 mask!2687) lt!638573))))

(assert (=> b!1457157 (= lt!638573 (Intermediate!11817 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457158 () Bool)

(assert (=> b!1457158 (= e!819754 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638575 lt!638576 mask!2687) (seekEntryOrOpen!0 lt!638575 lt!638576 mask!2687)))))

(declare-fun b!1457150 () Bool)

(declare-fun res!987503 () Bool)

(assert (=> b!1457150 (=> (not res!987503) (not e!819757))))

(assert (=> b!1457150 (= res!987503 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!987501 () Bool)

(assert (=> start!125106 (=> (not res!987501) (not e!819756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125106 (= res!987501 (validMask!0 mask!2687))))

(assert (=> start!125106 e!819756))

(assert (=> start!125106 true))

(declare-fun array_inv!36593 (array!98554) Bool)

(assert (=> start!125106 (array_inv!36593 a!2862)))

(declare-fun b!1457159 () Bool)

(assert (=> b!1457159 (= e!819756 e!819752)))

(declare-fun res!987508 () Bool)

(assert (=> b!1457159 (=> (not res!987508) (not e!819752))))

(assert (=> b!1457159 (= res!987508 (= (select (store (arr!47565 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457159 (= lt!638576 (array!98555 (store (arr!47565 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48115 a!2862)))))

(declare-fun b!1457160 () Bool)

(declare-fun res!987514 () Bool)

(assert (=> b!1457160 (=> res!987514 e!819761)))

(assert (=> b!1457160 (= res!987514 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638574 (select (arr!47565 a!2862) j!93) a!2862 mask!2687) lt!638573)))))

(declare-fun b!1457161 () Bool)

(assert (=> b!1457161 (= e!819757 (not e!819755))))

(declare-fun res!987513 () Bool)

(assert (=> b!1457161 (=> res!987513 e!819755)))

(assert (=> b!1457161 (= res!987513 (or (and (= (select (arr!47565 a!2862) index!646) (select (store (arr!47565 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47565 a!2862) index!646) (select (arr!47565 a!2862) j!93))) (= (select (arr!47565 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457161 e!819759))

(declare-fun res!987506 () Bool)

(assert (=> b!1457161 (=> (not res!987506) (not e!819759))))

(assert (=> b!1457161 (= res!987506 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49130 0))(
  ( (Unit!49131) )
))
(declare-fun lt!638577 () Unit!49130)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49130)

(assert (=> b!1457161 (= lt!638577 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457162 () Bool)

(assert (=> b!1457162 (= e!819760 e!819757)))

(declare-fun res!987502 () Bool)

(assert (=> b!1457162 (=> (not res!987502) (not e!819757))))

(assert (=> b!1457162 (= res!987502 (= lt!638571 (Intermediate!11817 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457162 (= lt!638571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638575 mask!2687) lt!638575 lt!638576 mask!2687))))

(assert (=> b!1457162 (= lt!638575 (select (store (arr!47565 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457163 () Bool)

(assert (=> b!1457163 (= e!819753 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638574 intermediateAfterIndex!19 lt!638575 lt!638576 mask!2687) lt!638570)))))

(assert (= (and start!125106 res!987501) b!1457153))

(assert (= (and b!1457153 res!987500) b!1457146))

(assert (= (and b!1457146 res!987504) b!1457156))

(assert (= (and b!1457156 res!987511) b!1457144))

(assert (= (and b!1457144 res!987505) b!1457145))

(assert (= (and b!1457145 res!987497) b!1457147))

(assert (= (and b!1457147 res!987498) b!1457159))

(assert (= (and b!1457159 res!987508) b!1457157))

(assert (= (and b!1457157 res!987510) b!1457142))

(assert (= (and b!1457142 res!987499) b!1457162))

(assert (= (and b!1457162 res!987502) b!1457149))

(assert (= (and b!1457149 c!134333) b!1457152))

(assert (= (and b!1457149 (not c!134333)) b!1457158))

(assert (= (and b!1457149 res!987512) b!1457150))

(assert (= (and b!1457150 res!987503) b!1457161))

(assert (= (and b!1457161 res!987506) b!1457154))

(assert (= (and b!1457154 res!987509) b!1457151))

(assert (= (and b!1457161 (not res!987513)) b!1457148))

(assert (= (and b!1457148 (not res!987507)) b!1457160))

(assert (= (and b!1457160 (not res!987514)) b!1457143))

(assert (= (and b!1457143 c!134334) b!1457155))

(assert (= (and b!1457143 (not c!134334)) b!1457163))

(declare-fun m!1345157 () Bool)

(assert (=> b!1457152 m!1345157))

(declare-fun m!1345159 () Bool)

(assert (=> b!1457159 m!1345159))

(declare-fun m!1345161 () Bool)

(assert (=> b!1457159 m!1345161))

(declare-fun m!1345163 () Bool)

(assert (=> start!125106 m!1345163))

(declare-fun m!1345165 () Bool)

(assert (=> start!125106 m!1345165))

(declare-fun m!1345167 () Bool)

(assert (=> b!1457142 m!1345167))

(assert (=> b!1457142 m!1345167))

(declare-fun m!1345169 () Bool)

(assert (=> b!1457142 m!1345169))

(assert (=> b!1457160 m!1345167))

(assert (=> b!1457160 m!1345167))

(declare-fun m!1345171 () Bool)

(assert (=> b!1457160 m!1345171))

(assert (=> b!1457157 m!1345167))

(assert (=> b!1457157 m!1345167))

(declare-fun m!1345173 () Bool)

(assert (=> b!1457157 m!1345173))

(assert (=> b!1457157 m!1345173))

(assert (=> b!1457157 m!1345167))

(declare-fun m!1345175 () Bool)

(assert (=> b!1457157 m!1345175))

(assert (=> b!1457151 m!1345159))

(declare-fun m!1345177 () Bool)

(assert (=> b!1457151 m!1345177))

(declare-fun m!1345179 () Bool)

(assert (=> b!1457151 m!1345179))

(declare-fun m!1345181 () Bool)

(assert (=> b!1457151 m!1345181))

(assert (=> b!1457151 m!1345167))

(declare-fun m!1345183 () Bool)

(assert (=> b!1457163 m!1345183))

(assert (=> b!1457154 m!1345167))

(assert (=> b!1457154 m!1345167))

(declare-fun m!1345185 () Bool)

(assert (=> b!1457154 m!1345185))

(declare-fun m!1345187 () Bool)

(assert (=> b!1457161 m!1345187))

(assert (=> b!1457161 m!1345159))

(assert (=> b!1457161 m!1345179))

(assert (=> b!1457161 m!1345181))

(declare-fun m!1345189 () Bool)

(assert (=> b!1457161 m!1345189))

(assert (=> b!1457161 m!1345167))

(declare-fun m!1345191 () Bool)

(assert (=> b!1457146 m!1345191))

(assert (=> b!1457146 m!1345191))

(declare-fun m!1345193 () Bool)

(assert (=> b!1457146 m!1345193))

(declare-fun m!1345195 () Bool)

(assert (=> b!1457144 m!1345195))

(declare-fun m!1345197 () Bool)

(assert (=> b!1457162 m!1345197))

(assert (=> b!1457162 m!1345197))

(declare-fun m!1345199 () Bool)

(assert (=> b!1457162 m!1345199))

(assert (=> b!1457162 m!1345159))

(declare-fun m!1345201 () Bool)

(assert (=> b!1457162 m!1345201))

(declare-fun m!1345203 () Bool)

(assert (=> b!1457155 m!1345203))

(declare-fun m!1345205 () Bool)

(assert (=> b!1457145 m!1345205))

(assert (=> b!1457156 m!1345167))

(assert (=> b!1457156 m!1345167))

(declare-fun m!1345207 () Bool)

(assert (=> b!1457156 m!1345207))

(declare-fun m!1345209 () Bool)

(assert (=> b!1457158 m!1345209))

(declare-fun m!1345211 () Bool)

(assert (=> b!1457158 m!1345211))

(declare-fun m!1345213 () Bool)

(assert (=> b!1457148 m!1345213))

(assert (=> b!1457148 m!1345209))

(assert (=> b!1457148 m!1345211))

(check-sat (not b!1457144) (not b!1457163) (not b!1457155) (not b!1457152) (not b!1457154) (not b!1457142) (not b!1457146) (not b!1457162) (not b!1457160) (not start!125106) (not b!1457158) (not b!1457156) (not b!1457161) (not b!1457157) (not b!1457145) (not b!1457148))
(check-sat)
