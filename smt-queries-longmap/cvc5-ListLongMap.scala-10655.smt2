; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125068 () Bool)

(assert start!125068)

(declare-fun b!1455888 () Bool)

(declare-fun res!986484 () Bool)

(declare-fun e!819189 () Bool)

(assert (=> b!1455888 (=> (not res!986484) (not e!819189))))

(declare-fun e!819191 () Bool)

(assert (=> b!1455888 (= res!986484 e!819191)))

(declare-fun c!134220 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1455888 (= c!134220 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455889 () Bool)

(declare-fun res!986487 () Bool)

(declare-fun e!819184 () Bool)

(assert (=> b!1455889 (=> (not res!986487) (not e!819184))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98516 0))(
  ( (array!98517 (arr!47546 (Array (_ BitVec 32) (_ BitVec 64))) (size!48096 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98516)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1455889 (= res!986487 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48096 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48096 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48096 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!819182 () Bool)

(declare-fun b!1455890 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455890 (= e!819182 (and (or (= (select (arr!47546 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47546 a!2862) intermediateBeforeIndex!19) (select (arr!47546 a!2862) j!93))) (let ((bdg!53197 (select (store (arr!47546 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47546 a!2862) index!646) bdg!53197) (= (select (arr!47546 a!2862) index!646) (select (arr!47546 a!2862) j!93))) (= (select (arr!47546 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53197 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455891 () Bool)

(declare-fun lt!638116 () array!98516)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!638115 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11798 0))(
  ( (MissingZero!11798 (index!49584 (_ BitVec 32))) (Found!11798 (index!49585 (_ BitVec 32))) (Intermediate!11798 (undefined!12610 Bool) (index!49586 (_ BitVec 32)) (x!131215 (_ BitVec 32))) (Undefined!11798) (MissingVacant!11798 (index!49587 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98516 (_ BitVec 32)) SeekEntryResult!11798)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98516 (_ BitVec 32)) SeekEntryResult!11798)

(assert (=> b!1455891 (= e!819191 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638115 lt!638116 mask!2687) (seekEntryOrOpen!0 lt!638115 lt!638116 mask!2687)))))

(declare-fun lt!638120 () SeekEntryResult!11798)

(declare-fun b!1455892 () Bool)

(declare-fun e!819190 () Bool)

(declare-fun lt!638114 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98516 (_ BitVec 32)) SeekEntryResult!11798)

(assert (=> b!1455892 (= e!819190 (not (= lt!638120 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638114 lt!638115 lt!638116 mask!2687))))))

(declare-fun b!1455893 () Bool)

(assert (=> b!1455893 (= e!819191 (= lt!638120 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638115 lt!638116 mask!2687)))))

(declare-fun b!1455894 () Bool)

(declare-fun res!986488 () Bool)

(assert (=> b!1455894 (=> (not res!986488) (not e!819184))))

(assert (=> b!1455894 (= res!986488 (and (= (size!48096 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48096 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48096 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455895 () Bool)

(declare-fun res!986472 () Bool)

(assert (=> b!1455895 (=> (not res!986472) (not e!819184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455895 (= res!986472 (validKeyInArray!0 (select (arr!47546 a!2862) j!93)))))

(declare-fun b!1455896 () Bool)

(declare-fun res!986479 () Bool)

(assert (=> b!1455896 (=> (not res!986479) (not e!819184))))

(declare-datatypes ((List!34047 0))(
  ( (Nil!34044) (Cons!34043 (h!35393 (_ BitVec 64)) (t!48741 List!34047)) )
))
(declare-fun arrayNoDuplicates!0 (array!98516 (_ BitVec 32) List!34047) Bool)

(assert (=> b!1455896 (= res!986479 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34044))))

(declare-fun b!1455897 () Bool)

(declare-fun e!819188 () Bool)

(assert (=> b!1455897 (= e!819184 e!819188)))

(declare-fun res!986481 () Bool)

(assert (=> b!1455897 (=> (not res!986481) (not e!819188))))

(assert (=> b!1455897 (= res!986481 (= (select (store (arr!47546 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455897 (= lt!638116 (array!98517 (store (arr!47546 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48096 a!2862)))))

(declare-fun b!1455898 () Bool)

(declare-fun res!986476 () Bool)

(assert (=> b!1455898 (=> (not res!986476) (not e!819184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98516 (_ BitVec 32)) Bool)

(assert (=> b!1455898 (= res!986476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455899 () Bool)

(declare-fun res!986482 () Bool)

(declare-fun e!819186 () Bool)

(assert (=> b!1455899 (=> (not res!986482) (not e!819186))))

(declare-fun lt!638119 () SeekEntryResult!11798)

(assert (=> b!1455899 (= res!986482 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47546 a!2862) j!93) a!2862 mask!2687) lt!638119))))

(declare-fun b!1455901 () Bool)

(declare-fun res!986483 () Bool)

(assert (=> b!1455901 (=> (not res!986483) (not e!819182))))

(assert (=> b!1455901 (= res!986483 (= (seekEntryOrOpen!0 (select (arr!47546 a!2862) j!93) a!2862 mask!2687) (Found!11798 j!93)))))

(declare-fun b!1455902 () Bool)

(declare-fun e!819187 () Bool)

(assert (=> b!1455902 (= e!819189 (not e!819187))))

(declare-fun res!986478 () Bool)

(assert (=> b!1455902 (=> res!986478 e!819187)))

(assert (=> b!1455902 (= res!986478 (or (and (= (select (arr!47546 a!2862) index!646) (select (store (arr!47546 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47546 a!2862) index!646) (select (arr!47546 a!2862) j!93))) (= (select (arr!47546 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455902 e!819182))

(declare-fun res!986475 () Bool)

(assert (=> b!1455902 (=> (not res!986475) (not e!819182))))

(assert (=> b!1455902 (= res!986475 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49092 0))(
  ( (Unit!49093) )
))
(declare-fun lt!638118 () Unit!49092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49092)

(assert (=> b!1455902 (= lt!638118 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455903 () Bool)

(declare-fun res!986473 () Bool)

(declare-fun e!819185 () Bool)

(assert (=> b!1455903 (=> res!986473 e!819185)))

(assert (=> b!1455903 (= res!986473 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638114 (select (arr!47546 a!2862) j!93) a!2862 mask!2687) lt!638119)))))

(declare-fun b!1455904 () Bool)

(assert (=> b!1455904 (= e!819185 true)))

(declare-fun lt!638121 () Bool)

(assert (=> b!1455904 (= lt!638121 e!819190)))

(declare-fun c!134219 () Bool)

(assert (=> b!1455904 (= c!134219 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455905 () Bool)

(declare-fun lt!638117 () SeekEntryResult!11798)

(assert (=> b!1455905 (= e!819190 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638114 intermediateAfterIndex!19 lt!638115 lt!638116 mask!2687) lt!638117)))))

(declare-fun b!1455906 () Bool)

(assert (=> b!1455906 (= e!819186 e!819189)))

(declare-fun res!986477 () Bool)

(assert (=> b!1455906 (=> (not res!986477) (not e!819189))))

(assert (=> b!1455906 (= res!986477 (= lt!638120 (Intermediate!11798 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455906 (= lt!638120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638115 mask!2687) lt!638115 lt!638116 mask!2687))))

(assert (=> b!1455906 (= lt!638115 (select (store (arr!47546 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455907 () Bool)

(assert (=> b!1455907 (= e!819187 e!819185)))

(declare-fun res!986480 () Bool)

(assert (=> b!1455907 (=> res!986480 e!819185)))

(assert (=> b!1455907 (= res!986480 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638114 #b00000000000000000000000000000000) (bvsge lt!638114 (size!48096 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455907 (= lt!638114 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1455907 (= lt!638117 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638115 lt!638116 mask!2687))))

(assert (=> b!1455907 (= lt!638117 (seekEntryOrOpen!0 lt!638115 lt!638116 mask!2687))))

(declare-fun b!1455908 () Bool)

(assert (=> b!1455908 (= e!819188 e!819186)))

(declare-fun res!986474 () Bool)

(assert (=> b!1455908 (=> (not res!986474) (not e!819186))))

(assert (=> b!1455908 (= res!986474 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47546 a!2862) j!93) mask!2687) (select (arr!47546 a!2862) j!93) a!2862 mask!2687) lt!638119))))

(assert (=> b!1455908 (= lt!638119 (Intermediate!11798 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455909 () Bool)

(declare-fun res!986471 () Bool)

(assert (=> b!1455909 (=> (not res!986471) (not e!819189))))

(assert (=> b!1455909 (= res!986471 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!986485 () Bool)

(assert (=> start!125068 (=> (not res!986485) (not e!819184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125068 (= res!986485 (validMask!0 mask!2687))))

(assert (=> start!125068 e!819184))

(assert (=> start!125068 true))

(declare-fun array_inv!36574 (array!98516) Bool)

(assert (=> start!125068 (array_inv!36574 a!2862)))

(declare-fun b!1455900 () Bool)

(declare-fun res!986486 () Bool)

(assert (=> b!1455900 (=> (not res!986486) (not e!819184))))

(assert (=> b!1455900 (= res!986486 (validKeyInArray!0 (select (arr!47546 a!2862) i!1006)))))

(assert (= (and start!125068 res!986485) b!1455894))

(assert (= (and b!1455894 res!986488) b!1455900))

(assert (= (and b!1455900 res!986486) b!1455895))

(assert (= (and b!1455895 res!986472) b!1455898))

(assert (= (and b!1455898 res!986476) b!1455896))

(assert (= (and b!1455896 res!986479) b!1455889))

(assert (= (and b!1455889 res!986487) b!1455897))

(assert (= (and b!1455897 res!986481) b!1455908))

(assert (= (and b!1455908 res!986474) b!1455899))

(assert (= (and b!1455899 res!986482) b!1455906))

(assert (= (and b!1455906 res!986477) b!1455888))

(assert (= (and b!1455888 c!134220) b!1455893))

(assert (= (and b!1455888 (not c!134220)) b!1455891))

(assert (= (and b!1455888 res!986484) b!1455909))

(assert (= (and b!1455909 res!986471) b!1455902))

(assert (= (and b!1455902 res!986475) b!1455901))

(assert (= (and b!1455901 res!986483) b!1455890))

(assert (= (and b!1455902 (not res!986478)) b!1455907))

(assert (= (and b!1455907 (not res!986480)) b!1455903))

(assert (= (and b!1455903 (not res!986473)) b!1455904))

(assert (= (and b!1455904 c!134219) b!1455892))

(assert (= (and b!1455904 (not c!134219)) b!1455905))

(declare-fun m!1344055 () Bool)

(assert (=> b!1455897 m!1344055))

(declare-fun m!1344057 () Bool)

(assert (=> b!1455897 m!1344057))

(declare-fun m!1344059 () Bool)

(assert (=> b!1455896 m!1344059))

(declare-fun m!1344061 () Bool)

(assert (=> b!1455893 m!1344061))

(declare-fun m!1344063 () Bool)

(assert (=> b!1455892 m!1344063))

(declare-fun m!1344065 () Bool)

(assert (=> b!1455891 m!1344065))

(declare-fun m!1344067 () Bool)

(assert (=> b!1455891 m!1344067))

(declare-fun m!1344069 () Bool)

(assert (=> start!125068 m!1344069))

(declare-fun m!1344071 () Bool)

(assert (=> start!125068 m!1344071))

(declare-fun m!1344073 () Bool)

(assert (=> b!1455908 m!1344073))

(assert (=> b!1455908 m!1344073))

(declare-fun m!1344075 () Bool)

(assert (=> b!1455908 m!1344075))

(assert (=> b!1455908 m!1344075))

(assert (=> b!1455908 m!1344073))

(declare-fun m!1344077 () Bool)

(assert (=> b!1455908 m!1344077))

(assert (=> b!1455901 m!1344073))

(assert (=> b!1455901 m!1344073))

(declare-fun m!1344079 () Bool)

(assert (=> b!1455901 m!1344079))

(declare-fun m!1344081 () Bool)

(assert (=> b!1455906 m!1344081))

(assert (=> b!1455906 m!1344081))

(declare-fun m!1344083 () Bool)

(assert (=> b!1455906 m!1344083))

(assert (=> b!1455906 m!1344055))

(declare-fun m!1344085 () Bool)

(assert (=> b!1455906 m!1344085))

(declare-fun m!1344087 () Bool)

(assert (=> b!1455902 m!1344087))

(assert (=> b!1455902 m!1344055))

(declare-fun m!1344089 () Bool)

(assert (=> b!1455902 m!1344089))

(declare-fun m!1344091 () Bool)

(assert (=> b!1455902 m!1344091))

(declare-fun m!1344093 () Bool)

(assert (=> b!1455902 m!1344093))

(assert (=> b!1455902 m!1344073))

(declare-fun m!1344095 () Bool)

(assert (=> b!1455900 m!1344095))

(assert (=> b!1455900 m!1344095))

(declare-fun m!1344097 () Bool)

(assert (=> b!1455900 m!1344097))

(assert (=> b!1455895 m!1344073))

(assert (=> b!1455895 m!1344073))

(declare-fun m!1344099 () Bool)

(assert (=> b!1455895 m!1344099))

(declare-fun m!1344101 () Bool)

(assert (=> b!1455898 m!1344101))

(assert (=> b!1455899 m!1344073))

(assert (=> b!1455899 m!1344073))

(declare-fun m!1344103 () Bool)

(assert (=> b!1455899 m!1344103))

(assert (=> b!1455903 m!1344073))

(assert (=> b!1455903 m!1344073))

(declare-fun m!1344105 () Bool)

(assert (=> b!1455903 m!1344105))

(assert (=> b!1455890 m!1344055))

(declare-fun m!1344107 () Bool)

(assert (=> b!1455890 m!1344107))

(assert (=> b!1455890 m!1344089))

(assert (=> b!1455890 m!1344091))

(assert (=> b!1455890 m!1344073))

(declare-fun m!1344109 () Bool)

(assert (=> b!1455907 m!1344109))

(assert (=> b!1455907 m!1344065))

(assert (=> b!1455907 m!1344067))

(declare-fun m!1344111 () Bool)

(assert (=> b!1455905 m!1344111))

(push 1)

