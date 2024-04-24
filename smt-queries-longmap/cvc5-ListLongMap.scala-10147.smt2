; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119838 () Bool)

(assert start!119838)

(declare-fun b!1394879 () Bool)

(declare-fun res!933603 () Bool)

(declare-fun e!789908 () Bool)

(assert (=> b!1394879 (=> (not res!933603) (not e!789908))))

(declare-datatypes ((array!95442 0))(
  ( (array!95443 (arr!46077 (Array (_ BitVec 32) (_ BitVec 64))) (size!46628 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95442)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95442 (_ BitVec 32)) Bool)

(assert (=> b!1394879 (= res!933603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!933606 () Bool)

(assert (=> start!119838 (=> (not res!933606) (not e!789908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119838 (= res!933606 (validMask!0 mask!2840))))

(assert (=> start!119838 e!789908))

(assert (=> start!119838 true))

(declare-fun array_inv!35358 (array!95442) Bool)

(assert (=> start!119838 (array_inv!35358 a!2901)))

(declare-fun b!1394880 () Bool)

(declare-fun res!933608 () Bool)

(assert (=> b!1394880 (=> (not res!933608) (not e!789908))))

(declare-datatypes ((List!32583 0))(
  ( (Nil!32580) (Cons!32579 (h!33820 (_ BitVec 64)) (t!47269 List!32583)) )
))
(declare-fun arrayNoDuplicates!0 (array!95442 (_ BitVec 32) List!32583) Bool)

(assert (=> b!1394880 (= res!933608 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32580))))

(declare-fun b!1394881 () Bool)

(declare-fun e!789906 () Bool)

(assert (=> b!1394881 (= e!789908 (not e!789906))))

(declare-fun res!933610 () Bool)

(assert (=> b!1394881 (=> res!933610 e!789906)))

(declare-datatypes ((SeekEntryResult!10297 0))(
  ( (MissingZero!10297 (index!43559 (_ BitVec 32))) (Found!10297 (index!43560 (_ BitVec 32))) (Intermediate!10297 (undefined!11109 Bool) (index!43561 (_ BitVec 32)) (x!125384 (_ BitVec 32))) (Undefined!10297) (MissingVacant!10297 (index!43562 (_ BitVec 32))) )
))
(declare-fun lt!612501 () SeekEntryResult!10297)

(assert (=> b!1394881 (= res!933610 (or (not (is-Intermediate!10297 lt!612501)) (undefined!11109 lt!612501)))))

(declare-fun e!789905 () Bool)

(assert (=> b!1394881 e!789905))

(declare-fun res!933605 () Bool)

(assert (=> b!1394881 (=> (not res!933605) (not e!789905))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394881 (= res!933605 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46625 0))(
  ( (Unit!46626) )
))
(declare-fun lt!612502 () Unit!46625)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46625)

(assert (=> b!1394881 (= lt!612502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95442 (_ BitVec 32)) SeekEntryResult!10297)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394881 (= lt!612501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46077 a!2901) j!112) mask!2840) (select (arr!46077 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394882 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95442 (_ BitVec 32)) SeekEntryResult!10297)

(assert (=> b!1394882 (= e!789905 (= (seekEntryOrOpen!0 (select (arr!46077 a!2901) j!112) a!2901 mask!2840) (Found!10297 j!112)))))

(declare-fun b!1394883 () Bool)

(declare-fun res!933604 () Bool)

(assert (=> b!1394883 (=> (not res!933604) (not e!789908))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394883 (= res!933604 (and (= (size!46628 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46628 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46628 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394884 () Bool)

(declare-fun res!933609 () Bool)

(assert (=> b!1394884 (=> (not res!933609) (not e!789908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394884 (= res!933609 (validKeyInArray!0 (select (arr!46077 a!2901) i!1037)))))

(declare-fun b!1394885 () Bool)

(declare-fun res!933607 () Bool)

(assert (=> b!1394885 (=> (not res!933607) (not e!789908))))

(assert (=> b!1394885 (= res!933607 (validKeyInArray!0 (select (arr!46077 a!2901) j!112)))))

(declare-fun b!1394886 () Bool)

(assert (=> b!1394886 (= e!789906 true)))

(declare-fun lt!612503 () SeekEntryResult!10297)

(assert (=> b!1394886 (= lt!612503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46077 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46077 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95443 (store (arr!46077 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46628 a!2901)) mask!2840))))

(assert (= (and start!119838 res!933606) b!1394883))

(assert (= (and b!1394883 res!933604) b!1394884))

(assert (= (and b!1394884 res!933609) b!1394885))

(assert (= (and b!1394885 res!933607) b!1394879))

(assert (= (and b!1394879 res!933603) b!1394880))

(assert (= (and b!1394880 res!933608) b!1394881))

(assert (= (and b!1394881 res!933605) b!1394882))

(assert (= (and b!1394881 (not res!933610)) b!1394886))

(declare-fun m!1281147 () Bool)

(assert (=> b!1394884 m!1281147))

(assert (=> b!1394884 m!1281147))

(declare-fun m!1281149 () Bool)

(assert (=> b!1394884 m!1281149))

(declare-fun m!1281151 () Bool)

(assert (=> b!1394880 m!1281151))

(declare-fun m!1281153 () Bool)

(assert (=> b!1394882 m!1281153))

(assert (=> b!1394882 m!1281153))

(declare-fun m!1281155 () Bool)

(assert (=> b!1394882 m!1281155))

(declare-fun m!1281157 () Bool)

(assert (=> b!1394879 m!1281157))

(declare-fun m!1281159 () Bool)

(assert (=> b!1394886 m!1281159))

(declare-fun m!1281161 () Bool)

(assert (=> b!1394886 m!1281161))

(assert (=> b!1394886 m!1281161))

(declare-fun m!1281163 () Bool)

(assert (=> b!1394886 m!1281163))

(assert (=> b!1394886 m!1281163))

(assert (=> b!1394886 m!1281161))

(declare-fun m!1281165 () Bool)

(assert (=> b!1394886 m!1281165))

(assert (=> b!1394881 m!1281153))

(declare-fun m!1281167 () Bool)

(assert (=> b!1394881 m!1281167))

(assert (=> b!1394881 m!1281153))

(declare-fun m!1281169 () Bool)

(assert (=> b!1394881 m!1281169))

(assert (=> b!1394881 m!1281167))

(assert (=> b!1394881 m!1281153))

(declare-fun m!1281171 () Bool)

(assert (=> b!1394881 m!1281171))

(declare-fun m!1281173 () Bool)

(assert (=> b!1394881 m!1281173))

(declare-fun m!1281175 () Bool)

(assert (=> start!119838 m!1281175))

(declare-fun m!1281177 () Bool)

(assert (=> start!119838 m!1281177))

(assert (=> b!1394885 m!1281153))

(assert (=> b!1394885 m!1281153))

(declare-fun m!1281179 () Bool)

(assert (=> b!1394885 m!1281179))

(push 1)

(assert (not b!1394880))

(assert (not b!1394879))

(assert (not b!1394886))

(assert (not start!119838))

(assert (not b!1394882))

(assert (not b!1394881))

(assert (not b!1394884))

(assert (not b!1394885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

