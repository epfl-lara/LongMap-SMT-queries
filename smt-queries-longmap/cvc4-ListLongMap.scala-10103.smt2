; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119116 () Bool)

(assert start!119116)

(declare-fun b!1389649 () Bool)

(declare-fun res!929810 () Bool)

(declare-fun e!787111 () Bool)

(assert (=> b!1389649 (=> (not res!929810) (not e!787111))))

(declare-datatypes ((array!95053 0))(
  ( (array!95054 (arr!45892 (Array (_ BitVec 32) (_ BitVec 64))) (size!46442 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95053)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389649 (= res!929810 (validKeyInArray!0 (select (arr!45892 a!2901) j!112)))))

(declare-fun b!1389650 () Bool)

(declare-fun res!929814 () Bool)

(assert (=> b!1389650 (=> (not res!929814) (not e!787111))))

(declare-datatypes ((List!32411 0))(
  ( (Nil!32408) (Cons!32407 (h!33625 (_ BitVec 64)) (t!47105 List!32411)) )
))
(declare-fun arrayNoDuplicates!0 (array!95053 (_ BitVec 32) List!32411) Bool)

(assert (=> b!1389650 (= res!929814 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32408))))

(declare-fun b!1389651 () Bool)

(declare-fun res!929811 () Bool)

(assert (=> b!1389651 (=> (not res!929811) (not e!787111))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95053 (_ BitVec 32)) Bool)

(assert (=> b!1389651 (= res!929811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!929815 () Bool)

(assert (=> start!119116 (=> (not res!929815) (not e!787111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119116 (= res!929815 (validMask!0 mask!2840))))

(assert (=> start!119116 e!787111))

(assert (=> start!119116 true))

(declare-fun array_inv!34920 (array!95053) Bool)

(assert (=> start!119116 (array_inv!34920 a!2901)))

(declare-fun b!1389652 () Bool)

(declare-fun res!929812 () Bool)

(assert (=> b!1389652 (=> (not res!929812) (not e!787111))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389652 (= res!929812 (and (= (size!46442 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46442 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46442 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389653 () Bool)

(declare-fun res!929813 () Bool)

(assert (=> b!1389653 (=> (not res!929813) (not e!787111))))

(assert (=> b!1389653 (= res!929813 (validKeyInArray!0 (select (arr!45892 a!2901) i!1037)))))

(declare-fun b!1389654 () Bool)

(assert (=> b!1389654 (= e!787111 false)))

(declare-datatypes ((SeekEntryResult!10209 0))(
  ( (MissingZero!10209 (index!43207 (_ BitVec 32))) (Found!10209 (index!43208 (_ BitVec 32))) (Intermediate!10209 (undefined!11021 Bool) (index!43209 (_ BitVec 32)) (x!124895 (_ BitVec 32))) (Undefined!10209) (MissingVacant!10209 (index!43210 (_ BitVec 32))) )
))
(declare-fun lt!610602 () SeekEntryResult!10209)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95053 (_ BitVec 32)) SeekEntryResult!10209)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389654 (= lt!610602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45892 a!2901) j!112) mask!2840) (select (arr!45892 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119116 res!929815) b!1389652))

(assert (= (and b!1389652 res!929812) b!1389653))

(assert (= (and b!1389653 res!929813) b!1389649))

(assert (= (and b!1389649 res!929810) b!1389651))

(assert (= (and b!1389651 res!929811) b!1389650))

(assert (= (and b!1389650 res!929814) b!1389654))

(declare-fun m!1275307 () Bool)

(assert (=> b!1389653 m!1275307))

(assert (=> b!1389653 m!1275307))

(declare-fun m!1275309 () Bool)

(assert (=> b!1389653 m!1275309))

(declare-fun m!1275311 () Bool)

(assert (=> b!1389649 m!1275311))

(assert (=> b!1389649 m!1275311))

(declare-fun m!1275313 () Bool)

(assert (=> b!1389649 m!1275313))

(declare-fun m!1275315 () Bool)

(assert (=> b!1389650 m!1275315))

(declare-fun m!1275317 () Bool)

(assert (=> b!1389651 m!1275317))

(declare-fun m!1275319 () Bool)

(assert (=> start!119116 m!1275319))

(declare-fun m!1275321 () Bool)

(assert (=> start!119116 m!1275321))

(assert (=> b!1389654 m!1275311))

(assert (=> b!1389654 m!1275311))

(declare-fun m!1275323 () Bool)

(assert (=> b!1389654 m!1275323))

(assert (=> b!1389654 m!1275323))

(assert (=> b!1389654 m!1275311))

(declare-fun m!1275325 () Bool)

(assert (=> b!1389654 m!1275325))

(push 1)

(assert (not b!1389651))

(assert (not start!119116))

(assert (not b!1389650))

(assert (not b!1389653))

(assert (not b!1389649))

(assert (not b!1389654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

