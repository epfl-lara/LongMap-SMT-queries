; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119110 () Bool)

(assert start!119110)

(declare-fun b!1389550 () Bool)

(declare-fun res!929763 () Bool)

(declare-fun e!787067 () Bool)

(assert (=> b!1389550 (=> (not res!929763) (not e!787067))))

(declare-datatypes ((array!95000 0))(
  ( (array!95001 (arr!45866 (Array (_ BitVec 32) (_ BitVec 64))) (size!46418 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95000)

(declare-datatypes ((List!32463 0))(
  ( (Nil!32460) (Cons!32459 (h!33677 (_ BitVec 64)) (t!47149 List!32463)) )
))
(declare-fun arrayNoDuplicates!0 (array!95000 (_ BitVec 32) List!32463) Bool)

(assert (=> b!1389550 (= res!929763 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32460))))

(declare-fun b!1389551 () Bool)

(declare-fun res!929765 () Bool)

(assert (=> b!1389551 (=> (not res!929765) (not e!787067))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389551 (= res!929765 (and (= (size!46418 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46418 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46418 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!929767 () Bool)

(assert (=> start!119110 (=> (not res!929767) (not e!787067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119110 (= res!929767 (validMask!0 mask!2840))))

(assert (=> start!119110 e!787067))

(assert (=> start!119110 true))

(declare-fun array_inv!35099 (array!95000) Bool)

(assert (=> start!119110 (array_inv!35099 a!2901)))

(declare-fun b!1389552 () Bool)

(declare-fun res!929766 () Bool)

(assert (=> b!1389552 (=> (not res!929766) (not e!787067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389552 (= res!929766 (validKeyInArray!0 (select (arr!45866 a!2901) i!1037)))))

(declare-fun b!1389553 () Bool)

(declare-fun res!929764 () Bool)

(assert (=> b!1389553 (=> (not res!929764) (not e!787067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95000 (_ BitVec 32)) Bool)

(assert (=> b!1389553 (= res!929764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389554 () Bool)

(declare-fun res!929762 () Bool)

(assert (=> b!1389554 (=> (not res!929762) (not e!787067))))

(assert (=> b!1389554 (= res!929762 (validKeyInArray!0 (select (arr!45866 a!2901) j!112)))))

(declare-fun b!1389555 () Bool)

(assert (=> b!1389555 (= e!787067 false)))

(declare-datatypes ((SeekEntryResult!10209 0))(
  ( (MissingZero!10209 (index!43207 (_ BitVec 32))) (Found!10209 (index!43208 (_ BitVec 32))) (Intermediate!10209 (undefined!11021 Bool) (index!43209 (_ BitVec 32)) (x!124892 (_ BitVec 32))) (Undefined!10209) (MissingVacant!10209 (index!43210 (_ BitVec 32))) )
))
(declare-fun lt!610409 () SeekEntryResult!10209)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95000 (_ BitVec 32)) SeekEntryResult!10209)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389555 (= lt!610409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45866 a!2901) j!112) mask!2840) (select (arr!45866 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119110 res!929767) b!1389551))

(assert (= (and b!1389551 res!929765) b!1389552))

(assert (= (and b!1389552 res!929766) b!1389554))

(assert (= (and b!1389554 res!929762) b!1389553))

(assert (= (and b!1389553 res!929764) b!1389550))

(assert (= (and b!1389550 res!929763) b!1389555))

(declare-fun m!1274751 () Bool)

(assert (=> b!1389552 m!1274751))

(assert (=> b!1389552 m!1274751))

(declare-fun m!1274753 () Bool)

(assert (=> b!1389552 m!1274753))

(declare-fun m!1274755 () Bool)

(assert (=> b!1389550 m!1274755))

(declare-fun m!1274757 () Bool)

(assert (=> b!1389555 m!1274757))

(assert (=> b!1389555 m!1274757))

(declare-fun m!1274759 () Bool)

(assert (=> b!1389555 m!1274759))

(assert (=> b!1389555 m!1274759))

(assert (=> b!1389555 m!1274757))

(declare-fun m!1274761 () Bool)

(assert (=> b!1389555 m!1274761))

(declare-fun m!1274763 () Bool)

(assert (=> b!1389553 m!1274763))

(assert (=> b!1389554 m!1274757))

(assert (=> b!1389554 m!1274757))

(declare-fun m!1274765 () Bool)

(assert (=> b!1389554 m!1274765))

(declare-fun m!1274767 () Bool)

(assert (=> start!119110 m!1274767))

(declare-fun m!1274769 () Bool)

(assert (=> start!119110 m!1274769))

(push 1)

(assert (not b!1389554))

(assert (not b!1389553))

(assert (not b!1389552))

(assert (not b!1389555))

(assert (not b!1389550))

(assert (not start!119110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

