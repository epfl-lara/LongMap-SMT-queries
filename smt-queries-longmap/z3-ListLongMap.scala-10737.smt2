; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125838 () Bool)

(assert start!125838)

(declare-fun b!1470782 () Bool)

(declare-fun e!825857 () Bool)

(declare-fun e!825858 () Bool)

(assert (=> b!1470782 (= e!825857 e!825858)))

(declare-fun res!998223 () Bool)

(assert (=> b!1470782 (=> (not res!998223) (not e!825858))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11982 0))(
  ( (MissingZero!11982 (index!50320 (_ BitVec 32))) (Found!11982 (index!50321 (_ BitVec 32))) (Intermediate!11982 (undefined!12794 Bool) (index!50322 (_ BitVec 32)) (x!132088 (_ BitVec 32))) (Undefined!11982) (MissingVacant!11982 (index!50323 (_ BitVec 32))) )
))
(declare-fun lt!643068 () SeekEntryResult!11982)

(declare-datatypes ((array!99124 0))(
  ( (array!99125 (arr!47845 (Array (_ BitVec 32) (_ BitVec 64))) (size!48396 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99124)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99124 (_ BitVec 32)) SeekEntryResult!11982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470782 (= res!998223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47845 a!2862) j!93) mask!2687) (select (arr!47845 a!2862) j!93) a!2862 mask!2687) lt!643068))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470782 (= lt!643068 (Intermediate!11982 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470783 () Bool)

(declare-fun res!998228 () Bool)

(assert (=> b!1470783 (=> (not res!998228) (not e!825857))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470783 (= res!998228 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48396 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48396 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48396 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470784 () Bool)

(declare-fun res!998226 () Bool)

(assert (=> b!1470784 (=> (not res!998226) (not e!825857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99124 (_ BitVec 32)) Bool)

(assert (=> b!1470784 (= res!998226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470785 () Bool)

(declare-fun res!998225 () Bool)

(assert (=> b!1470785 (=> (not res!998225) (not e!825857))))

(assert (=> b!1470785 (= res!998225 (and (= (size!48396 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48396 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48396 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470786 () Bool)

(declare-fun res!998224 () Bool)

(assert (=> b!1470786 (=> (not res!998224) (not e!825857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470786 (= res!998224 (validKeyInArray!0 (select (arr!47845 a!2862) j!93)))))

(declare-fun b!1470787 () Bool)

(declare-fun res!998230 () Bool)

(assert (=> b!1470787 (=> (not res!998230) (not e!825857))))

(declare-datatypes ((List!34333 0))(
  ( (Nil!34330) (Cons!34329 (h!35693 (_ BitVec 64)) (t!49019 List!34333)) )
))
(declare-fun arrayNoDuplicates!0 (array!99124 (_ BitVec 32) List!34333) Bool)

(assert (=> b!1470787 (= res!998230 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34330))))

(declare-fun b!1470788 () Bool)

(assert (=> b!1470788 (= e!825858 false)))

(declare-fun lt!643069 () SeekEntryResult!11982)

(assert (=> b!1470788 (= lt!643069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99125 (store (arr!47845 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48396 a!2862)) mask!2687))))

(declare-fun res!998227 () Bool)

(assert (=> start!125838 (=> (not res!998227) (not e!825857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125838 (= res!998227 (validMask!0 mask!2687))))

(assert (=> start!125838 e!825857))

(assert (=> start!125838 true))

(declare-fun array_inv!37126 (array!99124) Bool)

(assert (=> start!125838 (array_inv!37126 a!2862)))

(declare-fun b!1470789 () Bool)

(declare-fun res!998229 () Bool)

(assert (=> b!1470789 (=> (not res!998229) (not e!825858))))

(assert (=> b!1470789 (= res!998229 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47845 a!2862) j!93) a!2862 mask!2687) lt!643068))))

(declare-fun b!1470790 () Bool)

(declare-fun res!998231 () Bool)

(assert (=> b!1470790 (=> (not res!998231) (not e!825857))))

(assert (=> b!1470790 (= res!998231 (validKeyInArray!0 (select (arr!47845 a!2862) i!1006)))))

(assert (= (and start!125838 res!998227) b!1470785))

(assert (= (and b!1470785 res!998225) b!1470790))

(assert (= (and b!1470790 res!998231) b!1470786))

(assert (= (and b!1470786 res!998224) b!1470784))

(assert (= (and b!1470784 res!998226) b!1470787))

(assert (= (and b!1470787 res!998230) b!1470783))

(assert (= (and b!1470783 res!998228) b!1470782))

(assert (= (and b!1470782 res!998223) b!1470789))

(assert (= (and b!1470789 res!998229) b!1470788))

(declare-fun m!1357939 () Bool)

(assert (=> b!1470789 m!1357939))

(assert (=> b!1470789 m!1357939))

(declare-fun m!1357941 () Bool)

(assert (=> b!1470789 m!1357941))

(declare-fun m!1357943 () Bool)

(assert (=> b!1470784 m!1357943))

(declare-fun m!1357945 () Bool)

(assert (=> start!125838 m!1357945))

(declare-fun m!1357947 () Bool)

(assert (=> start!125838 m!1357947))

(assert (=> b!1470782 m!1357939))

(assert (=> b!1470782 m!1357939))

(declare-fun m!1357949 () Bool)

(assert (=> b!1470782 m!1357949))

(assert (=> b!1470782 m!1357949))

(assert (=> b!1470782 m!1357939))

(declare-fun m!1357951 () Bool)

(assert (=> b!1470782 m!1357951))

(assert (=> b!1470786 m!1357939))

(assert (=> b!1470786 m!1357939))

(declare-fun m!1357953 () Bool)

(assert (=> b!1470786 m!1357953))

(declare-fun m!1357955 () Bool)

(assert (=> b!1470783 m!1357955))

(declare-fun m!1357957 () Bool)

(assert (=> b!1470783 m!1357957))

(declare-fun m!1357959 () Bool)

(assert (=> b!1470790 m!1357959))

(assert (=> b!1470790 m!1357959))

(declare-fun m!1357961 () Bool)

(assert (=> b!1470790 m!1357961))

(assert (=> b!1470788 m!1357955))

(declare-fun m!1357963 () Bool)

(assert (=> b!1470788 m!1357963))

(assert (=> b!1470788 m!1357963))

(declare-fun m!1357965 () Bool)

(assert (=> b!1470788 m!1357965))

(assert (=> b!1470788 m!1357965))

(assert (=> b!1470788 m!1357963))

(declare-fun m!1357967 () Bool)

(assert (=> b!1470788 m!1357967))

(declare-fun m!1357969 () Bool)

(assert (=> b!1470787 m!1357969))

(check-sat (not b!1470782) (not b!1470788) (not b!1470789) (not start!125838) (not b!1470787) (not b!1470784) (not b!1470790) (not b!1470786))
(check-sat)
