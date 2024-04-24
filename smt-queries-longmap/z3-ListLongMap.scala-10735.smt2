; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125826 () Bool)

(assert start!125826)

(declare-fun b!1470620 () Bool)

(declare-fun res!998061 () Bool)

(declare-fun e!825804 () Bool)

(assert (=> b!1470620 (=> (not res!998061) (not e!825804))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99112 0))(
  ( (array!99113 (arr!47839 (Array (_ BitVec 32) (_ BitVec 64))) (size!48390 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99112)

(assert (=> b!1470620 (= res!998061 (and (= (size!48390 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48390 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48390 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470621 () Bool)

(declare-fun res!998063 () Bool)

(assert (=> b!1470621 (=> (not res!998063) (not e!825804))))

(declare-datatypes ((List!34327 0))(
  ( (Nil!34324) (Cons!34323 (h!35687 (_ BitVec 64)) (t!49013 List!34327)) )
))
(declare-fun arrayNoDuplicates!0 (array!99112 (_ BitVec 32) List!34327) Bool)

(assert (=> b!1470621 (= res!998063 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34324))))

(declare-fun b!1470622 () Bool)

(declare-fun e!825802 () Bool)

(assert (=> b!1470622 (= e!825804 e!825802)))

(declare-fun res!998069 () Bool)

(assert (=> b!1470622 (=> (not res!998069) (not e!825802))))

(declare-datatypes ((SeekEntryResult!11976 0))(
  ( (MissingZero!11976 (index!50296 (_ BitVec 32))) (Found!11976 (index!50297 (_ BitVec 32))) (Intermediate!11976 (undefined!12788 Bool) (index!50298 (_ BitVec 32)) (x!132066 (_ BitVec 32))) (Undefined!11976) (MissingVacant!11976 (index!50299 (_ BitVec 32))) )
))
(declare-fun lt!643032 () SeekEntryResult!11976)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99112 (_ BitVec 32)) SeekEntryResult!11976)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470622 (= res!998069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47839 a!2862) j!93) mask!2687) (select (arr!47839 a!2862) j!93) a!2862 mask!2687) lt!643032))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470622 (= lt!643032 (Intermediate!11976 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470623 () Bool)

(declare-fun res!998068 () Bool)

(assert (=> b!1470623 (=> (not res!998068) (not e!825802))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1470623 (= res!998068 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47839 a!2862) j!93) a!2862 mask!2687) lt!643032))))

(declare-fun res!998062 () Bool)

(assert (=> start!125826 (=> (not res!998062) (not e!825804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125826 (= res!998062 (validMask!0 mask!2687))))

(assert (=> start!125826 e!825804))

(assert (=> start!125826 true))

(declare-fun array_inv!37120 (array!99112) Bool)

(assert (=> start!125826 (array_inv!37120 a!2862)))

(declare-fun b!1470624 () Bool)

(declare-fun res!998064 () Bool)

(assert (=> b!1470624 (=> (not res!998064) (not e!825804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470624 (= res!998064 (validKeyInArray!0 (select (arr!47839 a!2862) j!93)))))

(declare-fun b!1470625 () Bool)

(declare-fun res!998067 () Bool)

(assert (=> b!1470625 (=> (not res!998067) (not e!825804))))

(assert (=> b!1470625 (= res!998067 (validKeyInArray!0 (select (arr!47839 a!2862) i!1006)))))

(declare-fun b!1470626 () Bool)

(assert (=> b!1470626 (= e!825802 false)))

(declare-fun lt!643033 () SeekEntryResult!11976)

(assert (=> b!1470626 (= lt!643033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99113 (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48390 a!2862)) mask!2687))))

(declare-fun b!1470627 () Bool)

(declare-fun res!998066 () Bool)

(assert (=> b!1470627 (=> (not res!998066) (not e!825804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99112 (_ BitVec 32)) Bool)

(assert (=> b!1470627 (= res!998066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470628 () Bool)

(declare-fun res!998065 () Bool)

(assert (=> b!1470628 (=> (not res!998065) (not e!825804))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470628 (= res!998065 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48390 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48390 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48390 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47839 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!125826 res!998062) b!1470620))

(assert (= (and b!1470620 res!998061) b!1470625))

(assert (= (and b!1470625 res!998067) b!1470624))

(assert (= (and b!1470624 res!998064) b!1470627))

(assert (= (and b!1470627 res!998066) b!1470621))

(assert (= (and b!1470621 res!998063) b!1470628))

(assert (= (and b!1470628 res!998065) b!1470622))

(assert (= (and b!1470622 res!998069) b!1470623))

(assert (= (and b!1470623 res!998068) b!1470626))

(declare-fun m!1357747 () Bool)

(assert (=> b!1470627 m!1357747))

(declare-fun m!1357749 () Bool)

(assert (=> b!1470623 m!1357749))

(assert (=> b!1470623 m!1357749))

(declare-fun m!1357751 () Bool)

(assert (=> b!1470623 m!1357751))

(declare-fun m!1357753 () Bool)

(assert (=> b!1470626 m!1357753))

(declare-fun m!1357755 () Bool)

(assert (=> b!1470626 m!1357755))

(assert (=> b!1470626 m!1357755))

(declare-fun m!1357757 () Bool)

(assert (=> b!1470626 m!1357757))

(assert (=> b!1470626 m!1357757))

(assert (=> b!1470626 m!1357755))

(declare-fun m!1357759 () Bool)

(assert (=> b!1470626 m!1357759))

(assert (=> b!1470628 m!1357753))

(declare-fun m!1357761 () Bool)

(assert (=> b!1470628 m!1357761))

(declare-fun m!1357763 () Bool)

(assert (=> b!1470621 m!1357763))

(assert (=> b!1470622 m!1357749))

(assert (=> b!1470622 m!1357749))

(declare-fun m!1357765 () Bool)

(assert (=> b!1470622 m!1357765))

(assert (=> b!1470622 m!1357765))

(assert (=> b!1470622 m!1357749))

(declare-fun m!1357767 () Bool)

(assert (=> b!1470622 m!1357767))

(declare-fun m!1357769 () Bool)

(assert (=> start!125826 m!1357769))

(declare-fun m!1357771 () Bool)

(assert (=> start!125826 m!1357771))

(assert (=> b!1470624 m!1357749))

(assert (=> b!1470624 m!1357749))

(declare-fun m!1357773 () Bool)

(assert (=> b!1470624 m!1357773))

(declare-fun m!1357775 () Bool)

(assert (=> b!1470625 m!1357775))

(assert (=> b!1470625 m!1357775))

(declare-fun m!1357777 () Bool)

(assert (=> b!1470625 m!1357777))

(check-sat (not b!1470626) (not b!1470623) (not b!1470624) (not b!1470627) (not start!125826) (not b!1470621) (not b!1470622) (not b!1470625))
(check-sat)
