; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119128 () Bool)

(assert start!119128)

(declare-fun b!1389757 () Bool)

(declare-fun res!929923 () Bool)

(declare-fun e!787147 () Bool)

(assert (=> b!1389757 (=> (not res!929923) (not e!787147))))

(declare-datatypes ((array!95065 0))(
  ( (array!95066 (arr!45898 (Array (_ BitVec 32) (_ BitVec 64))) (size!46448 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95065)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95065 (_ BitVec 32)) Bool)

(assert (=> b!1389757 (= res!929923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!929922 () Bool)

(assert (=> start!119128 (=> (not res!929922) (not e!787147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119128 (= res!929922 (validMask!0 mask!2840))))

(assert (=> start!119128 e!787147))

(assert (=> start!119128 true))

(declare-fun array_inv!34926 (array!95065) Bool)

(assert (=> start!119128 (array_inv!34926 a!2901)))

(declare-fun b!1389758 () Bool)

(declare-fun res!929919 () Bool)

(assert (=> b!1389758 (=> (not res!929919) (not e!787147))))

(declare-datatypes ((List!32417 0))(
  ( (Nil!32414) (Cons!32413 (h!33631 (_ BitVec 64)) (t!47111 List!32417)) )
))
(declare-fun arrayNoDuplicates!0 (array!95065 (_ BitVec 32) List!32417) Bool)

(assert (=> b!1389758 (= res!929919 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32414))))

(declare-fun b!1389759 () Bool)

(declare-fun res!929920 () Bool)

(assert (=> b!1389759 (=> (not res!929920) (not e!787147))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389759 (= res!929920 (validKeyInArray!0 (select (arr!45898 a!2901) i!1037)))))

(declare-fun b!1389760 () Bool)

(declare-fun res!929918 () Bool)

(assert (=> b!1389760 (=> (not res!929918) (not e!787147))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389760 (= res!929918 (validKeyInArray!0 (select (arr!45898 a!2901) j!112)))))

(declare-fun b!1389761 () Bool)

(assert (=> b!1389761 (= e!787147 false)))

(declare-datatypes ((SeekEntryResult!10215 0))(
  ( (MissingZero!10215 (index!43231 (_ BitVec 32))) (Found!10215 (index!43232 (_ BitVec 32))) (Intermediate!10215 (undefined!11027 Bool) (index!43233 (_ BitVec 32)) (x!124917 (_ BitVec 32))) (Undefined!10215) (MissingVacant!10215 (index!43234 (_ BitVec 32))) )
))
(declare-fun lt!610620 () SeekEntryResult!10215)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95065 (_ BitVec 32)) SeekEntryResult!10215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389761 (= lt!610620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45898 a!2901) j!112) mask!2840) (select (arr!45898 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389762 () Bool)

(declare-fun res!929921 () Bool)

(assert (=> b!1389762 (=> (not res!929921) (not e!787147))))

(assert (=> b!1389762 (= res!929921 (and (= (size!46448 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46448 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46448 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119128 res!929922) b!1389762))

(assert (= (and b!1389762 res!929921) b!1389759))

(assert (= (and b!1389759 res!929920) b!1389760))

(assert (= (and b!1389760 res!929918) b!1389757))

(assert (= (and b!1389757 res!929923) b!1389758))

(assert (= (and b!1389758 res!929919) b!1389761))

(declare-fun m!1275427 () Bool)

(assert (=> b!1389758 m!1275427))

(declare-fun m!1275429 () Bool)

(assert (=> b!1389757 m!1275429))

(declare-fun m!1275431 () Bool)

(assert (=> b!1389761 m!1275431))

(assert (=> b!1389761 m!1275431))

(declare-fun m!1275433 () Bool)

(assert (=> b!1389761 m!1275433))

(assert (=> b!1389761 m!1275433))

(assert (=> b!1389761 m!1275431))

(declare-fun m!1275435 () Bool)

(assert (=> b!1389761 m!1275435))

(assert (=> b!1389760 m!1275431))

(assert (=> b!1389760 m!1275431))

(declare-fun m!1275437 () Bool)

(assert (=> b!1389760 m!1275437))

(declare-fun m!1275439 () Bool)

(assert (=> start!119128 m!1275439))

(declare-fun m!1275441 () Bool)

(assert (=> start!119128 m!1275441))

(declare-fun m!1275443 () Bool)

(assert (=> b!1389759 m!1275443))

(assert (=> b!1389759 m!1275443))

(declare-fun m!1275445 () Bool)

(assert (=> b!1389759 m!1275445))

(push 1)

(assert (not b!1389760))

(assert (not b!1389759))

(assert (not b!1389757))

(assert (not b!1389758))

(assert (not b!1389761))

(assert (not start!119128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

