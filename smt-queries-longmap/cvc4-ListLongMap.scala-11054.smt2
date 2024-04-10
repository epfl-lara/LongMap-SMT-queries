; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129160 () Bool)

(assert start!129160)

(declare-fun b!1515946 () Bool)

(declare-fun e!845967 () Bool)

(declare-fun e!845963 () Bool)

(assert (=> b!1515946 (= e!845967 e!845963)))

(declare-fun res!1035861 () Bool)

(assert (=> b!1515946 (=> (not res!1035861) (not e!845963))))

(declare-datatypes ((SeekEntryResult!12916 0))(
  ( (MissingZero!12916 (index!54059 (_ BitVec 32))) (Found!12916 (index!54060 (_ BitVec 32))) (Intermediate!12916 (undefined!13728 Bool) (index!54061 (_ BitVec 32)) (x!135754 (_ BitVec 32))) (Undefined!12916) (MissingVacant!12916 (index!54062 (_ BitVec 32))) )
))
(declare-fun lt!657255 () SeekEntryResult!12916)

(declare-fun lt!657250 () SeekEntryResult!12916)

(assert (=> b!1515946 (= res!1035861 (= lt!657255 lt!657250))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515946 (= lt!657250 (Intermediate!12916 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101016 0))(
  ( (array!101017 (arr!48745 (Array (_ BitVec 32) (_ BitVec 64))) (size!49295 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101016)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101016 (_ BitVec 32)) SeekEntryResult!12916)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515946 (= lt!657255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48745 a!2804) j!70) mask!2512) (select (arr!48745 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!845968 () Bool)

(declare-fun b!1515947 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101016 (_ BitVec 32)) SeekEntryResult!12916)

(assert (=> b!1515947 (= e!845968 (= (seekEntry!0 (select (arr!48745 a!2804) j!70) a!2804 mask!2512) (Found!12916 j!70)))))

(declare-fun b!1515948 () Bool)

(declare-fun e!845964 () Bool)

(declare-fun e!845965 () Bool)

(assert (=> b!1515948 (= e!845964 e!845965)))

(declare-fun res!1035852 () Bool)

(assert (=> b!1515948 (=> res!1035852 e!845965)))

(declare-fun lt!657258 () SeekEntryResult!12916)

(assert (=> b!1515948 (= res!1035852 (not (= lt!657258 (Found!12916 j!70))))))

(declare-fun lt!657251 () SeekEntryResult!12916)

(declare-fun lt!657254 () SeekEntryResult!12916)

(assert (=> b!1515948 (= lt!657251 lt!657254)))

(declare-fun lt!657257 () array!101016)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657253 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101016 (_ BitVec 32)) SeekEntryResult!12916)

(assert (=> b!1515948 (= lt!657254 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657253 lt!657257 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101016 (_ BitVec 32)) SeekEntryResult!12916)

(assert (=> b!1515948 (= lt!657251 (seekEntryOrOpen!0 lt!657253 lt!657257 mask!2512))))

(declare-fun lt!657259 () SeekEntryResult!12916)

(assert (=> b!1515948 (= lt!657259 lt!657258)))

(assert (=> b!1515948 (= lt!657258 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48745 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515948 (= lt!657259 (seekEntryOrOpen!0 (select (arr!48745 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515949 () Bool)

(declare-fun res!1035853 () Bool)

(assert (=> b!1515949 (=> (not res!1035853) (not e!845963))))

(assert (=> b!1515949 (= res!1035853 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48745 a!2804) j!70) a!2804 mask!2512) lt!657250))))

(declare-fun res!1035849 () Bool)

(assert (=> start!129160 (=> (not res!1035849) (not e!845967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129160 (= res!1035849 (validMask!0 mask!2512))))

(assert (=> start!129160 e!845967))

(assert (=> start!129160 true))

(declare-fun array_inv!37773 (array!101016) Bool)

(assert (=> start!129160 (array_inv!37773 a!2804)))

(declare-fun b!1515950 () Bool)

(declare-fun res!1035855 () Bool)

(assert (=> b!1515950 (=> (not res!1035855) (not e!845967))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515950 (= res!1035855 (and (= (size!49295 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49295 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49295 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515951 () Bool)

(declare-fun e!845962 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515951 (= e!845962 (validKeyInArray!0 lt!657253))))

(declare-fun b!1515952 () Bool)

(declare-fun res!1035859 () Bool)

(assert (=> b!1515952 (=> (not res!1035859) (not e!845967))))

(assert (=> b!1515952 (= res!1035859 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49295 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49295 a!2804))))))

(declare-fun b!1515953 () Bool)

(declare-fun e!845961 () Bool)

(assert (=> b!1515953 (= e!845963 e!845961)))

(declare-fun res!1035850 () Bool)

(assert (=> b!1515953 (=> (not res!1035850) (not e!845961))))

(assert (=> b!1515953 (= res!1035850 (= lt!657255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657253 mask!2512) lt!657253 lt!657257 mask!2512)))))

(assert (=> b!1515953 (= lt!657253 (select (store (arr!48745 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515953 (= lt!657257 (array!101017 (store (arr!48745 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49295 a!2804)))))

(declare-fun b!1515954 () Bool)

(declare-fun res!1035851 () Bool)

(assert (=> b!1515954 (=> (not res!1035851) (not e!845967))))

(assert (=> b!1515954 (= res!1035851 (validKeyInArray!0 (select (arr!48745 a!2804) i!961)))))

(declare-fun b!1515955 () Bool)

(declare-fun res!1035854 () Bool)

(assert (=> b!1515955 (=> (not res!1035854) (not e!845967))))

(assert (=> b!1515955 (= res!1035854 (validKeyInArray!0 (select (arr!48745 a!2804) j!70)))))

(declare-fun b!1515956 () Bool)

(declare-fun res!1035857 () Bool)

(assert (=> b!1515956 (=> (not res!1035857) (not e!845967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101016 (_ BitVec 32)) Bool)

(assert (=> b!1515956 (= res!1035857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515957 () Bool)

(assert (=> b!1515957 (= e!845961 (not e!845964))))

(declare-fun res!1035862 () Bool)

(assert (=> b!1515957 (=> res!1035862 e!845964)))

(assert (=> b!1515957 (= res!1035862 (or (not (= (select (arr!48745 a!2804) j!70) lt!657253)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48745 a!2804) index!487) (select (arr!48745 a!2804) j!70)) (not (= (select (arr!48745 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515957 e!845968))

(declare-fun res!1035860 () Bool)

(assert (=> b!1515957 (=> (not res!1035860) (not e!845968))))

(assert (=> b!1515957 (= res!1035860 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50700 0))(
  ( (Unit!50701) )
))
(declare-fun lt!657256 () Unit!50700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50700)

(assert (=> b!1515957 (= lt!657256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515958 () Bool)

(assert (=> b!1515958 (= e!845965 e!845962)))

(declare-fun res!1035856 () Bool)

(assert (=> b!1515958 (=> res!1035856 e!845962)))

(assert (=> b!1515958 (= res!1035856 (bvslt mask!2512 #b00000000000000000000000000000000))))

(assert (=> b!1515958 (= lt!657254 lt!657258)))

(declare-fun lt!657252 () Unit!50700)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50700)

(assert (=> b!1515958 (= lt!657252 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515959 () Bool)

(declare-fun res!1035858 () Bool)

(assert (=> b!1515959 (=> (not res!1035858) (not e!845967))))

(declare-datatypes ((List!35228 0))(
  ( (Nil!35225) (Cons!35224 (h!36636 (_ BitVec 64)) (t!49922 List!35228)) )
))
(declare-fun arrayNoDuplicates!0 (array!101016 (_ BitVec 32) List!35228) Bool)

(assert (=> b!1515959 (= res!1035858 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35225))))

(assert (= (and start!129160 res!1035849) b!1515950))

(assert (= (and b!1515950 res!1035855) b!1515954))

(assert (= (and b!1515954 res!1035851) b!1515955))

(assert (= (and b!1515955 res!1035854) b!1515956))

(assert (= (and b!1515956 res!1035857) b!1515959))

(assert (= (and b!1515959 res!1035858) b!1515952))

(assert (= (and b!1515952 res!1035859) b!1515946))

(assert (= (and b!1515946 res!1035861) b!1515949))

(assert (= (and b!1515949 res!1035853) b!1515953))

(assert (= (and b!1515953 res!1035850) b!1515957))

(assert (= (and b!1515957 res!1035860) b!1515947))

(assert (= (and b!1515957 (not res!1035862)) b!1515948))

(assert (= (and b!1515948 (not res!1035852)) b!1515958))

(assert (= (and b!1515958 (not res!1035856)) b!1515951))

(declare-fun m!1399163 () Bool)

(assert (=> b!1515953 m!1399163))

(assert (=> b!1515953 m!1399163))

(declare-fun m!1399165 () Bool)

(assert (=> b!1515953 m!1399165))

(declare-fun m!1399167 () Bool)

(assert (=> b!1515953 m!1399167))

(declare-fun m!1399169 () Bool)

(assert (=> b!1515953 m!1399169))

(declare-fun m!1399171 () Bool)

(assert (=> start!129160 m!1399171))

(declare-fun m!1399173 () Bool)

(assert (=> start!129160 m!1399173))

(declare-fun m!1399175 () Bool)

(assert (=> b!1515958 m!1399175))

(declare-fun m!1399177 () Bool)

(assert (=> b!1515956 m!1399177))

(declare-fun m!1399179 () Bool)

(assert (=> b!1515947 m!1399179))

(assert (=> b!1515947 m!1399179))

(declare-fun m!1399181 () Bool)

(assert (=> b!1515947 m!1399181))

(assert (=> b!1515949 m!1399179))

(assert (=> b!1515949 m!1399179))

(declare-fun m!1399183 () Bool)

(assert (=> b!1515949 m!1399183))

(assert (=> b!1515957 m!1399179))

(declare-fun m!1399185 () Bool)

(assert (=> b!1515957 m!1399185))

(declare-fun m!1399187 () Bool)

(assert (=> b!1515957 m!1399187))

(declare-fun m!1399189 () Bool)

(assert (=> b!1515957 m!1399189))

(assert (=> b!1515948 m!1399179))

(declare-fun m!1399191 () Bool)

(assert (=> b!1515948 m!1399191))

(assert (=> b!1515948 m!1399179))

(declare-fun m!1399193 () Bool)

(assert (=> b!1515948 m!1399193))

(declare-fun m!1399195 () Bool)

(assert (=> b!1515948 m!1399195))

(assert (=> b!1515948 m!1399179))

(declare-fun m!1399197 () Bool)

(assert (=> b!1515948 m!1399197))

(declare-fun m!1399199 () Bool)

(assert (=> b!1515954 m!1399199))

(assert (=> b!1515954 m!1399199))

(declare-fun m!1399201 () Bool)

(assert (=> b!1515954 m!1399201))

(declare-fun m!1399203 () Bool)

(assert (=> b!1515959 m!1399203))

(assert (=> b!1515946 m!1399179))

(assert (=> b!1515946 m!1399179))

(declare-fun m!1399205 () Bool)

(assert (=> b!1515946 m!1399205))

(assert (=> b!1515946 m!1399205))

(assert (=> b!1515946 m!1399179))

(declare-fun m!1399207 () Bool)

(assert (=> b!1515946 m!1399207))

(declare-fun m!1399209 () Bool)

(assert (=> b!1515951 m!1399209))

(assert (=> b!1515955 m!1399179))

(assert (=> b!1515955 m!1399179))

(declare-fun m!1399211 () Bool)

(assert (=> b!1515955 m!1399211))

(push 1)

