; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125832 () Bool)

(assert start!125832)

(declare-fun b!1470701 () Bool)

(declare-fun e!825829 () Bool)

(declare-fun e!825830 () Bool)

(assert (=> b!1470701 (= e!825829 e!825830)))

(declare-fun res!998148 () Bool)

(assert (=> b!1470701 (=> (not res!998148) (not e!825830))))

(declare-datatypes ((SeekEntryResult!11979 0))(
  ( (MissingZero!11979 (index!50308 (_ BitVec 32))) (Found!11979 (index!50309 (_ BitVec 32))) (Intermediate!11979 (undefined!12791 Bool) (index!50310 (_ BitVec 32)) (x!132077 (_ BitVec 32))) (Undefined!11979) (MissingVacant!11979 (index!50311 (_ BitVec 32))) )
))
(declare-fun lt!643051 () SeekEntryResult!11979)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99118 0))(
  ( (array!99119 (arr!47842 (Array (_ BitVec 32) (_ BitVec 64))) (size!48393 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99118)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99118 (_ BitVec 32)) SeekEntryResult!11979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470701 (= res!998148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47842 a!2862) j!93) mask!2687) (select (arr!47842 a!2862) j!93) a!2862 mask!2687) lt!643051))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470701 (= lt!643051 (Intermediate!11979 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470702 () Bool)

(declare-fun res!998150 () Bool)

(assert (=> b!1470702 (=> (not res!998150) (not e!825829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99118 (_ BitVec 32)) Bool)

(assert (=> b!1470702 (= res!998150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470703 () Bool)

(declare-fun res!998144 () Bool)

(assert (=> b!1470703 (=> (not res!998144) (not e!825829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470703 (= res!998144 (validKeyInArray!0 (select (arr!47842 a!2862) j!93)))))

(declare-fun b!1470704 () Bool)

(declare-fun res!998147 () Bool)

(assert (=> b!1470704 (=> (not res!998147) (not e!825829))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470704 (= res!998147 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48393 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48393 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48393 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470705 () Bool)

(assert (=> b!1470705 (= e!825830 false)))

(declare-fun lt!643050 () SeekEntryResult!11979)

(assert (=> b!1470705 (= lt!643050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99119 (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48393 a!2862)) mask!2687))))

(declare-fun b!1470706 () Bool)

(declare-fun res!998146 () Bool)

(assert (=> b!1470706 (=> (not res!998146) (not e!825829))))

(assert (=> b!1470706 (= res!998146 (and (= (size!48393 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48393 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48393 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!998143 () Bool)

(assert (=> start!125832 (=> (not res!998143) (not e!825829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125832 (= res!998143 (validMask!0 mask!2687))))

(assert (=> start!125832 e!825829))

(assert (=> start!125832 true))

(declare-fun array_inv!37123 (array!99118) Bool)

(assert (=> start!125832 (array_inv!37123 a!2862)))

(declare-fun b!1470707 () Bool)

(declare-fun res!998142 () Bool)

(assert (=> b!1470707 (=> (not res!998142) (not e!825829))))

(assert (=> b!1470707 (= res!998142 (validKeyInArray!0 (select (arr!47842 a!2862) i!1006)))))

(declare-fun b!1470708 () Bool)

(declare-fun res!998149 () Bool)

(assert (=> b!1470708 (=> (not res!998149) (not e!825829))))

(declare-datatypes ((List!34330 0))(
  ( (Nil!34327) (Cons!34326 (h!35690 (_ BitVec 64)) (t!49016 List!34330)) )
))
(declare-fun arrayNoDuplicates!0 (array!99118 (_ BitVec 32) List!34330) Bool)

(assert (=> b!1470708 (= res!998149 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34327))))

(declare-fun b!1470709 () Bool)

(declare-fun res!998145 () Bool)

(assert (=> b!1470709 (=> (not res!998145) (not e!825830))))

(assert (=> b!1470709 (= res!998145 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47842 a!2862) j!93) a!2862 mask!2687) lt!643051))))

(assert (= (and start!125832 res!998143) b!1470706))

(assert (= (and b!1470706 res!998146) b!1470707))

(assert (= (and b!1470707 res!998142) b!1470703))

(assert (= (and b!1470703 res!998144) b!1470702))

(assert (= (and b!1470702 res!998150) b!1470708))

(assert (= (and b!1470708 res!998149) b!1470704))

(assert (= (and b!1470704 res!998147) b!1470701))

(assert (= (and b!1470701 res!998148) b!1470709))

(assert (= (and b!1470709 res!998145) b!1470705))

(declare-fun m!1357843 () Bool)

(assert (=> b!1470705 m!1357843))

(declare-fun m!1357845 () Bool)

(assert (=> b!1470705 m!1357845))

(assert (=> b!1470705 m!1357845))

(declare-fun m!1357847 () Bool)

(assert (=> b!1470705 m!1357847))

(assert (=> b!1470705 m!1357847))

(assert (=> b!1470705 m!1357845))

(declare-fun m!1357849 () Bool)

(assert (=> b!1470705 m!1357849))

(assert (=> b!1470704 m!1357843))

(declare-fun m!1357851 () Bool)

(assert (=> b!1470704 m!1357851))

(declare-fun m!1357853 () Bool)

(assert (=> b!1470707 m!1357853))

(assert (=> b!1470707 m!1357853))

(declare-fun m!1357855 () Bool)

(assert (=> b!1470707 m!1357855))

(declare-fun m!1357857 () Bool)

(assert (=> b!1470702 m!1357857))

(declare-fun m!1357859 () Bool)

(assert (=> b!1470701 m!1357859))

(assert (=> b!1470701 m!1357859))

(declare-fun m!1357861 () Bool)

(assert (=> b!1470701 m!1357861))

(assert (=> b!1470701 m!1357861))

(assert (=> b!1470701 m!1357859))

(declare-fun m!1357863 () Bool)

(assert (=> b!1470701 m!1357863))

(declare-fun m!1357865 () Bool)

(assert (=> b!1470708 m!1357865))

(assert (=> b!1470703 m!1357859))

(assert (=> b!1470703 m!1357859))

(declare-fun m!1357867 () Bool)

(assert (=> b!1470703 m!1357867))

(assert (=> b!1470709 m!1357859))

(assert (=> b!1470709 m!1357859))

(declare-fun m!1357869 () Bool)

(assert (=> b!1470709 m!1357869))

(declare-fun m!1357871 () Bool)

(assert (=> start!125832 m!1357871))

(declare-fun m!1357873 () Bool)

(assert (=> start!125832 m!1357873))

(check-sat (not b!1470703) (not start!125832) (not b!1470707) (not b!1470702) (not b!1470709) (not b!1470708) (not b!1470705) (not b!1470701))
(check-sat)
