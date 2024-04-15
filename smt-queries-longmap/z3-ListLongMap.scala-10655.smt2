; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125038 () Bool)

(assert start!125038)

(declare-fun b!1455693 () Bool)

(declare-fun lt!637887 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11798 0))(
  ( (MissingZero!11798 (index!49584 (_ BitVec 32))) (Found!11798 (index!49585 (_ BitVec 32))) (Intermediate!11798 (undefined!12610 Bool) (index!49586 (_ BitVec 32)) (x!131210 (_ BitVec 32))) (Undefined!11798) (MissingVacant!11798 (index!49587 (_ BitVec 32))) )
))
(declare-fun lt!637881 () SeekEntryResult!11798)

(declare-fun e!819069 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!637885 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98464 0))(
  ( (array!98465 (arr!47521 (Array (_ BitVec 32) (_ BitVec 64))) (size!48073 (_ BitVec 32))) )
))
(declare-fun lt!637882 () array!98464)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98464 (_ BitVec 32)) SeekEntryResult!11798)

(assert (=> b!1455693 (= e!819069 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637887 intermediateAfterIndex!19 lt!637885 lt!637882 mask!2687) lt!637881)))))

(declare-fun b!1455694 () Bool)

(declare-fun res!986407 () Bool)

(declare-fun e!819075 () Bool)

(assert (=> b!1455694 (=> (not res!986407) (not e!819075))))

(declare-fun e!819072 () Bool)

(assert (=> b!1455694 (= res!986407 e!819072)))

(declare-fun c!134163 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1455694 (= c!134163 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455695 () Bool)

(declare-fun res!986401 () Bool)

(assert (=> b!1455695 (=> (not res!986401) (not e!819075))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455695 (= res!986401 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455696 () Bool)

(declare-fun res!986398 () Bool)

(declare-fun e!819066 () Bool)

(assert (=> b!1455696 (=> (not res!986398) (not e!819066))))

(declare-fun a!2862 () array!98464)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98464 (_ BitVec 32)) Bool)

(assert (=> b!1455696 (= res!986398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455697 () Bool)

(declare-fun res!986404 () Bool)

(assert (=> b!1455697 (=> (not res!986404) (not e!819066))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455697 (= res!986404 (validKeyInArray!0 (select (arr!47521 a!2862) j!93)))))

(declare-fun b!1455698 () Bool)

(declare-fun e!819067 () Bool)

(declare-fun e!819068 () Bool)

(assert (=> b!1455698 (= e!819067 e!819068)))

(declare-fun res!986406 () Bool)

(assert (=> b!1455698 (=> (not res!986406) (not e!819068))))

(declare-fun lt!637886 () SeekEntryResult!11798)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98464 (_ BitVec 32)) SeekEntryResult!11798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455698 (= res!986406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47521 a!2862) j!93) mask!2687) (select (arr!47521 a!2862) j!93) a!2862 mask!2687) lt!637886))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1455698 (= lt!637886 (Intermediate!11798 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455699 () Bool)

(assert (=> b!1455699 (= e!819066 e!819067)))

(declare-fun res!986399 () Bool)

(assert (=> b!1455699 (=> (not res!986399) (not e!819067))))

(assert (=> b!1455699 (= res!986399 (= (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455699 (= lt!637882 (array!98465 (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48073 a!2862)))))

(declare-fun res!986397 () Bool)

(assert (=> start!125038 (=> (not res!986397) (not e!819066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125038 (= res!986397 (validMask!0 mask!2687))))

(assert (=> start!125038 e!819066))

(assert (=> start!125038 true))

(declare-fun array_inv!36754 (array!98464) Bool)

(assert (=> start!125038 (array_inv!36754 a!2862)))

(declare-fun b!1455700 () Bool)

(declare-fun res!986409 () Bool)

(assert (=> b!1455700 (=> (not res!986409) (not e!819066))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1455700 (= res!986409 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48073 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48073 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48073 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455701 () Bool)

(assert (=> b!1455701 (= e!819068 e!819075)))

(declare-fun res!986394 () Bool)

(assert (=> b!1455701 (=> (not res!986394) (not e!819075))))

(declare-fun lt!637884 () SeekEntryResult!11798)

(assert (=> b!1455701 (= res!986394 (= lt!637884 (Intermediate!11798 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1455701 (= lt!637884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637885 mask!2687) lt!637885 lt!637882 mask!2687))))

(assert (=> b!1455701 (= lt!637885 (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455702 () Bool)

(declare-fun e!819070 () Bool)

(declare-fun e!819074 () Bool)

(assert (=> b!1455702 (= e!819070 e!819074)))

(declare-fun res!986402 () Bool)

(assert (=> b!1455702 (=> res!986402 e!819074)))

(assert (=> b!1455702 (= res!986402 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637887 #b00000000000000000000000000000000) (bvsge lt!637887 (size!48073 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455702 (= lt!637887 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1455702 (= lt!637881 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637885 lt!637882 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98464 (_ BitVec 32)) SeekEntryResult!11798)

(assert (=> b!1455702 (= lt!637881 (seekEntryOrOpen!0 lt!637885 lt!637882 mask!2687))))

(declare-fun b!1455703 () Bool)

(assert (=> b!1455703 (= e!819069 (not (= lt!637884 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637887 lt!637885 lt!637882 mask!2687))))))

(declare-fun b!1455704 () Bool)

(declare-fun res!986396 () Bool)

(assert (=> b!1455704 (=> (not res!986396) (not e!819068))))

(assert (=> b!1455704 (= res!986396 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47521 a!2862) j!93) a!2862 mask!2687) lt!637886))))

(declare-fun b!1455705 () Bool)

(assert (=> b!1455705 (= e!819072 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637885 lt!637882 mask!2687) (seekEntryOrOpen!0 lt!637885 lt!637882 mask!2687)))))

(declare-fun b!1455706 () Bool)

(declare-fun res!986395 () Bool)

(assert (=> b!1455706 (=> (not res!986395) (not e!819066))))

(assert (=> b!1455706 (= res!986395 (and (= (size!48073 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48073 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48073 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455707 () Bool)

(assert (=> b!1455707 (= e!819072 (= lt!637884 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637885 lt!637882 mask!2687)))))

(declare-fun b!1455708 () Bool)

(assert (=> b!1455708 (= e!819075 (not e!819070))))

(declare-fun res!986403 () Bool)

(assert (=> b!1455708 (=> res!986403 e!819070)))

(assert (=> b!1455708 (= res!986403 (or (and (= (select (arr!47521 a!2862) index!646) (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47521 a!2862) index!646) (select (arr!47521 a!2862) j!93))) (= (select (arr!47521 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819071 () Bool)

(assert (=> b!1455708 e!819071))

(declare-fun res!986393 () Bool)

(assert (=> b!1455708 (=> (not res!986393) (not e!819071))))

(assert (=> b!1455708 (= res!986393 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48933 0))(
  ( (Unit!48934) )
))
(declare-fun lt!637883 () Unit!48933)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48933)

(assert (=> b!1455708 (= lt!637883 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455709 () Bool)

(assert (=> b!1455709 (= e!819071 (and (or (= (select (arr!47521 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47521 a!2862) intermediateBeforeIndex!19) (select (arr!47521 a!2862) j!93))) (let ((bdg!53197 (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47521 a!2862) index!646) bdg!53197) (= (select (arr!47521 a!2862) index!646) (select (arr!47521 a!2862) j!93))) (= (select (arr!47521 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53197 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455710 () Bool)

(declare-fun res!986410 () Bool)

(assert (=> b!1455710 (=> (not res!986410) (not e!819071))))

(assert (=> b!1455710 (= res!986410 (= (seekEntryOrOpen!0 (select (arr!47521 a!2862) j!93) a!2862 mask!2687) (Found!11798 j!93)))))

(declare-fun b!1455711 () Bool)

(declare-fun res!986408 () Bool)

(assert (=> b!1455711 (=> (not res!986408) (not e!819066))))

(declare-datatypes ((List!34100 0))(
  ( (Nil!34097) (Cons!34096 (h!35446 (_ BitVec 64)) (t!48786 List!34100)) )
))
(declare-fun arrayNoDuplicates!0 (array!98464 (_ BitVec 32) List!34100) Bool)

(assert (=> b!1455711 (= res!986408 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34097))))

(declare-fun b!1455712 () Bool)

(declare-fun res!986400 () Bool)

(assert (=> b!1455712 (=> (not res!986400) (not e!819066))))

(assert (=> b!1455712 (= res!986400 (validKeyInArray!0 (select (arr!47521 a!2862) i!1006)))))

(declare-fun b!1455713 () Bool)

(assert (=> b!1455713 (= e!819074 true)))

(declare-fun lt!637880 () Bool)

(assert (=> b!1455713 (= lt!637880 e!819069)))

(declare-fun c!134164 () Bool)

(assert (=> b!1455713 (= c!134164 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455714 () Bool)

(declare-fun res!986405 () Bool)

(assert (=> b!1455714 (=> res!986405 e!819074)))

(assert (=> b!1455714 (= res!986405 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637887 (select (arr!47521 a!2862) j!93) a!2862 mask!2687) lt!637886)))))

(assert (= (and start!125038 res!986397) b!1455706))

(assert (= (and b!1455706 res!986395) b!1455712))

(assert (= (and b!1455712 res!986400) b!1455697))

(assert (= (and b!1455697 res!986404) b!1455696))

(assert (= (and b!1455696 res!986398) b!1455711))

(assert (= (and b!1455711 res!986408) b!1455700))

(assert (= (and b!1455700 res!986409) b!1455699))

(assert (= (and b!1455699 res!986399) b!1455698))

(assert (= (and b!1455698 res!986406) b!1455704))

(assert (= (and b!1455704 res!986396) b!1455701))

(assert (= (and b!1455701 res!986394) b!1455694))

(assert (= (and b!1455694 c!134163) b!1455707))

(assert (= (and b!1455694 (not c!134163)) b!1455705))

(assert (= (and b!1455694 res!986407) b!1455695))

(assert (= (and b!1455695 res!986401) b!1455708))

(assert (= (and b!1455708 res!986393) b!1455710))

(assert (= (and b!1455710 res!986410) b!1455709))

(assert (= (and b!1455708 (not res!986403)) b!1455702))

(assert (= (and b!1455702 (not res!986402)) b!1455714))

(assert (= (and b!1455714 (not res!986405)) b!1455713))

(assert (= (and b!1455713 c!134164) b!1455703))

(assert (= (and b!1455713 (not c!134164)) b!1455693))

(declare-fun m!1343379 () Bool)

(assert (=> b!1455710 m!1343379))

(assert (=> b!1455710 m!1343379))

(declare-fun m!1343381 () Bool)

(assert (=> b!1455710 m!1343381))

(declare-fun m!1343383 () Bool)

(assert (=> b!1455699 m!1343383))

(declare-fun m!1343385 () Bool)

(assert (=> b!1455699 m!1343385))

(declare-fun m!1343387 () Bool)

(assert (=> b!1455702 m!1343387))

(declare-fun m!1343389 () Bool)

(assert (=> b!1455702 m!1343389))

(declare-fun m!1343391 () Bool)

(assert (=> b!1455702 m!1343391))

(declare-fun m!1343393 () Bool)

(assert (=> b!1455712 m!1343393))

(assert (=> b!1455712 m!1343393))

(declare-fun m!1343395 () Bool)

(assert (=> b!1455712 m!1343395))

(declare-fun m!1343397 () Bool)

(assert (=> b!1455696 m!1343397))

(assert (=> b!1455709 m!1343383))

(declare-fun m!1343399 () Bool)

(assert (=> b!1455709 m!1343399))

(declare-fun m!1343401 () Bool)

(assert (=> b!1455709 m!1343401))

(declare-fun m!1343403 () Bool)

(assert (=> b!1455709 m!1343403))

(assert (=> b!1455709 m!1343379))

(assert (=> b!1455698 m!1343379))

(assert (=> b!1455698 m!1343379))

(declare-fun m!1343405 () Bool)

(assert (=> b!1455698 m!1343405))

(assert (=> b!1455698 m!1343405))

(assert (=> b!1455698 m!1343379))

(declare-fun m!1343407 () Bool)

(assert (=> b!1455698 m!1343407))

(assert (=> b!1455704 m!1343379))

(assert (=> b!1455704 m!1343379))

(declare-fun m!1343409 () Bool)

(assert (=> b!1455704 m!1343409))

(declare-fun m!1343411 () Bool)

(assert (=> b!1455703 m!1343411))

(declare-fun m!1343413 () Bool)

(assert (=> b!1455711 m!1343413))

(assert (=> b!1455705 m!1343389))

(assert (=> b!1455705 m!1343391))

(declare-fun m!1343415 () Bool)

(assert (=> b!1455701 m!1343415))

(assert (=> b!1455701 m!1343415))

(declare-fun m!1343417 () Bool)

(assert (=> b!1455701 m!1343417))

(assert (=> b!1455701 m!1343383))

(declare-fun m!1343419 () Bool)

(assert (=> b!1455701 m!1343419))

(declare-fun m!1343421 () Bool)

(assert (=> start!125038 m!1343421))

(declare-fun m!1343423 () Bool)

(assert (=> start!125038 m!1343423))

(declare-fun m!1343425 () Bool)

(assert (=> b!1455707 m!1343425))

(declare-fun m!1343427 () Bool)

(assert (=> b!1455693 m!1343427))

(assert (=> b!1455714 m!1343379))

(assert (=> b!1455714 m!1343379))

(declare-fun m!1343429 () Bool)

(assert (=> b!1455714 m!1343429))

(declare-fun m!1343431 () Bool)

(assert (=> b!1455708 m!1343431))

(assert (=> b!1455708 m!1343383))

(assert (=> b!1455708 m!1343401))

(assert (=> b!1455708 m!1343403))

(declare-fun m!1343433 () Bool)

(assert (=> b!1455708 m!1343433))

(assert (=> b!1455708 m!1343379))

(assert (=> b!1455697 m!1343379))

(assert (=> b!1455697 m!1343379))

(declare-fun m!1343435 () Bool)

(assert (=> b!1455697 m!1343435))

(check-sat (not b!1455693) (not b!1455703) (not b!1455704) (not b!1455707) (not b!1455708) (not b!1455701) (not b!1455698) (not b!1455702) (not start!125038) (not b!1455712) (not b!1455696) (not b!1455714) (not b!1455705) (not b!1455711) (not b!1455710) (not b!1455697))
(check-sat)
