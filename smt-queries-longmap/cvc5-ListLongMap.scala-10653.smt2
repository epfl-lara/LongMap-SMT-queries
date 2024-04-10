; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125056 () Bool)

(assert start!125056)

(declare-fun b!1455492 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11792 0))(
  ( (MissingZero!11792 (index!49560 (_ BitVec 32))) (Found!11792 (index!49561 (_ BitVec 32))) (Intermediate!11792 (undefined!12604 Bool) (index!49562 (_ BitVec 32)) (x!131193 (_ BitVec 32))) (Undefined!11792) (MissingVacant!11792 (index!49563 (_ BitVec 32))) )
))
(declare-fun lt!637974 () SeekEntryResult!11792)

(declare-fun lt!637972 () (_ BitVec 64))

(declare-datatypes ((array!98504 0))(
  ( (array!98505 (arr!47540 (Array (_ BitVec 32) (_ BitVec 64))) (size!48090 (_ BitVec 32))) )
))
(declare-fun lt!637973 () array!98504)

(declare-fun e!819011 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637976 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98504 (_ BitVec 32)) SeekEntryResult!11792)

(assert (=> b!1455492 (= e!819011 (not (= lt!637974 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637976 lt!637972 lt!637973 mask!2687))))))

(declare-fun b!1455493 () Bool)

(declare-fun e!819010 () Bool)

(declare-fun e!819004 () Bool)

(assert (=> b!1455493 (= e!819010 e!819004)))

(declare-fun res!986162 () Bool)

(assert (=> b!1455493 (=> res!986162 e!819004)))

(declare-fun a!2862 () array!98504)

(assert (=> b!1455493 (= res!986162 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637976 #b00000000000000000000000000000000) (bvsge lt!637976 (size!48090 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455493 (= lt!637976 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637970 () SeekEntryResult!11792)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98504 (_ BitVec 32)) SeekEntryResult!11792)

(assert (=> b!1455493 (= lt!637970 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637972 lt!637973 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98504 (_ BitVec 32)) SeekEntryResult!11792)

(assert (=> b!1455493 (= lt!637970 (seekEntryOrOpen!0 lt!637972 lt!637973 mask!2687))))

(declare-fun b!1455494 () Bool)

(assert (=> b!1455494 (= e!819011 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637976 intermediateAfterIndex!19 lt!637972 lt!637973 mask!2687) lt!637970)))))

(declare-fun b!1455495 () Bool)

(declare-fun res!986149 () Bool)

(declare-fun e!819005 () Bool)

(assert (=> b!1455495 (=> (not res!986149) (not e!819005))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455495 (= res!986149 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455496 () Bool)

(declare-fun res!986156 () Bool)

(declare-fun e!819002 () Bool)

(assert (=> b!1455496 (=> (not res!986156) (not e!819002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455496 (= res!986156 (validKeyInArray!0 (select (arr!47540 a!2862) i!1006)))))

(declare-fun b!1455497 () Bool)

(declare-fun res!986161 () Bool)

(assert (=> b!1455497 (=> res!986161 e!819004)))

(declare-fun lt!637975 () SeekEntryResult!11792)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1455497 (= res!986161 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637976 (select (arr!47540 a!2862) j!93) a!2862 mask!2687) lt!637975)))))

(declare-fun b!1455498 () Bool)

(declare-fun res!986157 () Bool)

(declare-fun e!819006 () Bool)

(assert (=> b!1455498 (=> (not res!986157) (not e!819006))))

(assert (=> b!1455498 (= res!986157 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47540 a!2862) j!93) a!2862 mask!2687) lt!637975))))

(declare-fun b!1455499 () Bool)

(declare-fun res!986158 () Bool)

(assert (=> b!1455499 (=> (not res!986158) (not e!819002))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1455499 (= res!986158 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48090 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48090 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48090 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!819008 () Bool)

(declare-fun b!1455500 () Bool)

(assert (=> b!1455500 (= e!819008 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637972 lt!637973 mask!2687) (seekEntryOrOpen!0 lt!637972 lt!637973 mask!2687)))))

(declare-fun b!1455501 () Bool)

(declare-fun res!986163 () Bool)

(assert (=> b!1455501 (=> (not res!986163) (not e!819002))))

(declare-datatypes ((List!34041 0))(
  ( (Nil!34038) (Cons!34037 (h!35387 (_ BitVec 64)) (t!48735 List!34041)) )
))
(declare-fun arrayNoDuplicates!0 (array!98504 (_ BitVec 32) List!34041) Bool)

(assert (=> b!1455501 (= res!986163 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34038))))

(declare-fun b!1455502 () Bool)

(declare-fun res!986148 () Bool)

(assert (=> b!1455502 (=> (not res!986148) (not e!819002))))

(assert (=> b!1455502 (= res!986148 (and (= (size!48090 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48090 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48090 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455503 () Bool)

(assert (=> b!1455503 (= e!819004 true)))

(declare-fun lt!637971 () Bool)

(assert (=> b!1455503 (= lt!637971 e!819011)))

(declare-fun c!134184 () Bool)

(assert (=> b!1455503 (= c!134184 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455504 () Bool)

(assert (=> b!1455504 (= e!819008 (= lt!637974 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637972 lt!637973 mask!2687)))))

(declare-fun b!1455506 () Bool)

(declare-fun res!986154 () Bool)

(assert (=> b!1455506 (=> (not res!986154) (not e!819005))))

(assert (=> b!1455506 (= res!986154 e!819008)))

(declare-fun c!134183 () Bool)

(assert (=> b!1455506 (= c!134183 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455507 () Bool)

(declare-fun e!819009 () Bool)

(assert (=> b!1455507 (= e!819002 e!819009)))

(declare-fun res!986153 () Bool)

(assert (=> b!1455507 (=> (not res!986153) (not e!819009))))

(assert (=> b!1455507 (= res!986153 (= (select (store (arr!47540 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455507 (= lt!637973 (array!98505 (store (arr!47540 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48090 a!2862)))))

(declare-fun b!1455508 () Bool)

(assert (=> b!1455508 (= e!819005 (not e!819010))))

(declare-fun res!986147 () Bool)

(assert (=> b!1455508 (=> res!986147 e!819010)))

(assert (=> b!1455508 (= res!986147 (or (and (= (select (arr!47540 a!2862) index!646) (select (store (arr!47540 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47540 a!2862) index!646) (select (arr!47540 a!2862) j!93))) (= (select (arr!47540 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819007 () Bool)

(assert (=> b!1455508 e!819007))

(declare-fun res!986150 () Bool)

(assert (=> b!1455508 (=> (not res!986150) (not e!819007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98504 (_ BitVec 32)) Bool)

(assert (=> b!1455508 (= res!986150 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49080 0))(
  ( (Unit!49081) )
))
(declare-fun lt!637977 () Unit!49080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49080)

(assert (=> b!1455508 (= lt!637977 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455509 () Bool)

(assert (=> b!1455509 (= e!819007 (and (or (= (select (arr!47540 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47540 a!2862) intermediateBeforeIndex!19) (select (arr!47540 a!2862) j!93))) (let ((bdg!53161 (select (store (arr!47540 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47540 a!2862) index!646) bdg!53161) (= (select (arr!47540 a!2862) index!646) (select (arr!47540 a!2862) j!93))) (= (select (arr!47540 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53161 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455510 () Bool)

(declare-fun res!986164 () Bool)

(assert (=> b!1455510 (=> (not res!986164) (not e!819002))))

(assert (=> b!1455510 (= res!986164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455511 () Bool)

(assert (=> b!1455511 (= e!819006 e!819005)))

(declare-fun res!986160 () Bool)

(assert (=> b!1455511 (=> (not res!986160) (not e!819005))))

(assert (=> b!1455511 (= res!986160 (= lt!637974 (Intermediate!11792 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455511 (= lt!637974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637972 mask!2687) lt!637972 lt!637973 mask!2687))))

(assert (=> b!1455511 (= lt!637972 (select (store (arr!47540 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455512 () Bool)

(declare-fun res!986159 () Bool)

(assert (=> b!1455512 (=> (not res!986159) (not e!819007))))

(assert (=> b!1455512 (= res!986159 (= (seekEntryOrOpen!0 (select (arr!47540 a!2862) j!93) a!2862 mask!2687) (Found!11792 j!93)))))

(declare-fun b!1455513 () Bool)

(declare-fun res!986155 () Bool)

(assert (=> b!1455513 (=> (not res!986155) (not e!819002))))

(assert (=> b!1455513 (= res!986155 (validKeyInArray!0 (select (arr!47540 a!2862) j!93)))))

(declare-fun res!986152 () Bool)

(assert (=> start!125056 (=> (not res!986152) (not e!819002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125056 (= res!986152 (validMask!0 mask!2687))))

(assert (=> start!125056 e!819002))

(assert (=> start!125056 true))

(declare-fun array_inv!36568 (array!98504) Bool)

(assert (=> start!125056 (array_inv!36568 a!2862)))

(declare-fun b!1455505 () Bool)

(assert (=> b!1455505 (= e!819009 e!819006)))

(declare-fun res!986151 () Bool)

(assert (=> b!1455505 (=> (not res!986151) (not e!819006))))

(assert (=> b!1455505 (= res!986151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47540 a!2862) j!93) mask!2687) (select (arr!47540 a!2862) j!93) a!2862 mask!2687) lt!637975))))

(assert (=> b!1455505 (= lt!637975 (Intermediate!11792 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125056 res!986152) b!1455502))

(assert (= (and b!1455502 res!986148) b!1455496))

(assert (= (and b!1455496 res!986156) b!1455513))

(assert (= (and b!1455513 res!986155) b!1455510))

(assert (= (and b!1455510 res!986164) b!1455501))

(assert (= (and b!1455501 res!986163) b!1455499))

(assert (= (and b!1455499 res!986158) b!1455507))

(assert (= (and b!1455507 res!986153) b!1455505))

(assert (= (and b!1455505 res!986151) b!1455498))

(assert (= (and b!1455498 res!986157) b!1455511))

(assert (= (and b!1455511 res!986160) b!1455506))

(assert (= (and b!1455506 c!134183) b!1455504))

(assert (= (and b!1455506 (not c!134183)) b!1455500))

(assert (= (and b!1455506 res!986154) b!1455495))

(assert (= (and b!1455495 res!986149) b!1455508))

(assert (= (and b!1455508 res!986150) b!1455512))

(assert (= (and b!1455512 res!986159) b!1455509))

(assert (= (and b!1455508 (not res!986147)) b!1455493))

(assert (= (and b!1455493 (not res!986162)) b!1455497))

(assert (= (and b!1455497 (not res!986161)) b!1455503))

(assert (= (and b!1455503 c!134184) b!1455492))

(assert (= (and b!1455503 (not c!134184)) b!1455494))

(declare-fun m!1343707 () Bool)

(assert (=> b!1455511 m!1343707))

(assert (=> b!1455511 m!1343707))

(declare-fun m!1343709 () Bool)

(assert (=> b!1455511 m!1343709))

(declare-fun m!1343711 () Bool)

(assert (=> b!1455511 m!1343711))

(declare-fun m!1343713 () Bool)

(assert (=> b!1455511 m!1343713))

(declare-fun m!1343715 () Bool)

(assert (=> b!1455504 m!1343715))

(declare-fun m!1343717 () Bool)

(assert (=> b!1455498 m!1343717))

(assert (=> b!1455498 m!1343717))

(declare-fun m!1343719 () Bool)

(assert (=> b!1455498 m!1343719))

(assert (=> b!1455513 m!1343717))

(assert (=> b!1455513 m!1343717))

(declare-fun m!1343721 () Bool)

(assert (=> b!1455513 m!1343721))

(declare-fun m!1343723 () Bool)

(assert (=> b!1455494 m!1343723))

(declare-fun m!1343725 () Bool)

(assert (=> b!1455500 m!1343725))

(declare-fun m!1343727 () Bool)

(assert (=> b!1455500 m!1343727))

(assert (=> b!1455505 m!1343717))

(assert (=> b!1455505 m!1343717))

(declare-fun m!1343729 () Bool)

(assert (=> b!1455505 m!1343729))

(assert (=> b!1455505 m!1343729))

(assert (=> b!1455505 m!1343717))

(declare-fun m!1343731 () Bool)

(assert (=> b!1455505 m!1343731))

(declare-fun m!1343733 () Bool)

(assert (=> b!1455492 m!1343733))

(declare-fun m!1343735 () Bool)

(assert (=> start!125056 m!1343735))

(declare-fun m!1343737 () Bool)

(assert (=> start!125056 m!1343737))

(declare-fun m!1343739 () Bool)

(assert (=> b!1455501 m!1343739))

(assert (=> b!1455509 m!1343711))

(declare-fun m!1343741 () Bool)

(assert (=> b!1455509 m!1343741))

(declare-fun m!1343743 () Bool)

(assert (=> b!1455509 m!1343743))

(declare-fun m!1343745 () Bool)

(assert (=> b!1455509 m!1343745))

(assert (=> b!1455509 m!1343717))

(declare-fun m!1343747 () Bool)

(assert (=> b!1455510 m!1343747))

(declare-fun m!1343749 () Bool)

(assert (=> b!1455493 m!1343749))

(assert (=> b!1455493 m!1343725))

(assert (=> b!1455493 m!1343727))

(declare-fun m!1343751 () Bool)

(assert (=> b!1455508 m!1343751))

(assert (=> b!1455508 m!1343711))

(assert (=> b!1455508 m!1343743))

(assert (=> b!1455508 m!1343745))

(declare-fun m!1343753 () Bool)

(assert (=> b!1455508 m!1343753))

(assert (=> b!1455508 m!1343717))

(assert (=> b!1455497 m!1343717))

(assert (=> b!1455497 m!1343717))

(declare-fun m!1343755 () Bool)

(assert (=> b!1455497 m!1343755))

(declare-fun m!1343757 () Bool)

(assert (=> b!1455496 m!1343757))

(assert (=> b!1455496 m!1343757))

(declare-fun m!1343759 () Bool)

(assert (=> b!1455496 m!1343759))

(assert (=> b!1455507 m!1343711))

(declare-fun m!1343761 () Bool)

(assert (=> b!1455507 m!1343761))

(assert (=> b!1455512 m!1343717))

(assert (=> b!1455512 m!1343717))

(declare-fun m!1343763 () Bool)

(assert (=> b!1455512 m!1343763))

(push 1)

