; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128644 () Bool)

(assert start!128644)

(declare-fun res!1027985 () Bool)

(declare-fun e!842454 () Bool)

(assert (=> start!128644 (=> (not res!1027985) (not e!842454))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128644 (= res!1027985 (validMask!0 mask!2512))))

(assert (=> start!128644 e!842454))

(assert (=> start!128644 true))

(declare-datatypes ((array!100578 0))(
  ( (array!100579 (arr!48529 (Array (_ BitVec 32) (_ BitVec 64))) (size!49079 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100578)

(declare-fun array_inv!37557 (array!100578) Bool)

(assert (=> start!128644 (array_inv!37557 a!2804)))

(declare-fun b!1507870 () Bool)

(assert (=> b!1507870 (= e!842454 false)))

(declare-datatypes ((SeekEntryResult!12700 0))(
  ( (MissingZero!12700 (index!53195 (_ BitVec 32))) (Found!12700 (index!53196 (_ BitVec 32))) (Intermediate!12700 (undefined!13512 Bool) (index!53197 (_ BitVec 32)) (x!134950 (_ BitVec 32))) (Undefined!12700) (MissingVacant!12700 (index!53198 (_ BitVec 32))) )
))
(declare-fun lt!654496 () SeekEntryResult!12700)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100578 (_ BitVec 32)) SeekEntryResult!12700)

(assert (=> b!1507870 (= lt!654496 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48529 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507871 () Bool)

(declare-fun res!1027988 () Bool)

(assert (=> b!1507871 (=> (not res!1027988) (not e!842454))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507871 (= res!1027988 (and (= (size!49079 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49079 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49079 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507872 () Bool)

(declare-fun res!1027984 () Bool)

(assert (=> b!1507872 (=> (not res!1027984) (not e!842454))))

(declare-datatypes ((List!35012 0))(
  ( (Nil!35009) (Cons!35008 (h!36414 (_ BitVec 64)) (t!49706 List!35012)) )
))
(declare-fun arrayNoDuplicates!0 (array!100578 (_ BitVec 32) List!35012) Bool)

(assert (=> b!1507872 (= res!1027984 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35009))))

(declare-fun b!1507873 () Bool)

(declare-fun res!1027986 () Bool)

(assert (=> b!1507873 (=> (not res!1027986) (not e!842454))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507873 (= res!1027986 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48529 a!2804) j!70) mask!2512) (select (arr!48529 a!2804) j!70) a!2804 mask!2512) (Intermediate!12700 false resIndex!21 resX!21)))))

(declare-fun b!1507874 () Bool)

(declare-fun res!1027987 () Bool)

(assert (=> b!1507874 (=> (not res!1027987) (not e!842454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507874 (= res!1027987 (validKeyInArray!0 (select (arr!48529 a!2804) i!961)))))

(declare-fun b!1507875 () Bool)

(declare-fun res!1027983 () Bool)

(assert (=> b!1507875 (=> (not res!1027983) (not e!842454))))

(assert (=> b!1507875 (= res!1027983 (validKeyInArray!0 (select (arr!48529 a!2804) j!70)))))

(declare-fun b!1507876 () Bool)

(declare-fun res!1027989 () Bool)

(assert (=> b!1507876 (=> (not res!1027989) (not e!842454))))

(assert (=> b!1507876 (= res!1027989 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49079 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49079 a!2804))))))

(declare-fun b!1507877 () Bool)

(declare-fun res!1027990 () Bool)

(assert (=> b!1507877 (=> (not res!1027990) (not e!842454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100578 (_ BitVec 32)) Bool)

(assert (=> b!1507877 (= res!1027990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128644 res!1027985) b!1507871))

(assert (= (and b!1507871 res!1027988) b!1507874))

(assert (= (and b!1507874 res!1027987) b!1507875))

(assert (= (and b!1507875 res!1027983) b!1507877))

(assert (= (and b!1507877 res!1027990) b!1507872))

(assert (= (and b!1507872 res!1027984) b!1507876))

(assert (= (and b!1507876 res!1027989) b!1507873))

(assert (= (and b!1507873 res!1027986) b!1507870))

(declare-fun m!1390497 () Bool)

(assert (=> start!128644 m!1390497))

(declare-fun m!1390499 () Bool)

(assert (=> start!128644 m!1390499))

(declare-fun m!1390501 () Bool)

(assert (=> b!1507872 m!1390501))

(declare-fun m!1390503 () Bool)

(assert (=> b!1507873 m!1390503))

(assert (=> b!1507873 m!1390503))

(declare-fun m!1390505 () Bool)

(assert (=> b!1507873 m!1390505))

(assert (=> b!1507873 m!1390505))

(assert (=> b!1507873 m!1390503))

(declare-fun m!1390507 () Bool)

(assert (=> b!1507873 m!1390507))

(assert (=> b!1507870 m!1390503))

(assert (=> b!1507870 m!1390503))

(declare-fun m!1390509 () Bool)

(assert (=> b!1507870 m!1390509))

(assert (=> b!1507875 m!1390503))

(assert (=> b!1507875 m!1390503))

(declare-fun m!1390511 () Bool)

(assert (=> b!1507875 m!1390511))

(declare-fun m!1390513 () Bool)

(assert (=> b!1507877 m!1390513))

(declare-fun m!1390515 () Bool)

(assert (=> b!1507874 m!1390515))

(assert (=> b!1507874 m!1390515))

(declare-fun m!1390517 () Bool)

(assert (=> b!1507874 m!1390517))

(push 1)

(assert (not b!1507870))

(assert (not b!1507874))

(assert (not b!1507875))

(assert (not b!1507873))

(assert (not b!1507877))

(assert (not b!1507872))

(assert (not start!128644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

