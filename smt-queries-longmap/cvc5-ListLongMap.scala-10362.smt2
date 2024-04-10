; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121986 () Bool)

(assert start!121986)

(declare-fun b!1415765 () Bool)

(declare-fun res!951814 () Bool)

(declare-fun e!801296 () Bool)

(assert (=> b!1415765 (=> (not res!951814) (not e!801296))))

(declare-datatypes ((array!96672 0))(
  ( (array!96673 (arr!46667 (Array (_ BitVec 32) (_ BitVec 64))) (size!47217 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96672)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96672 (_ BitVec 32)) Bool)

(assert (=> b!1415765 (= res!951814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415766 () Bool)

(declare-fun res!951810 () Bool)

(assert (=> b!1415766 (=> (not res!951810) (not e!801296))))

(declare-datatypes ((List!33186 0))(
  ( (Nil!33183) (Cons!33182 (h!34469 (_ BitVec 64)) (t!47880 List!33186)) )
))
(declare-fun arrayNoDuplicates!0 (array!96672 (_ BitVec 32) List!33186) Bool)

(assert (=> b!1415766 (= res!951810 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33183))))

(declare-datatypes ((SeekEntryResult!10978 0))(
  ( (MissingZero!10978 (index!46304 (_ BitVec 32))) (Found!10978 (index!46305 (_ BitVec 32))) (Intermediate!10978 (undefined!11790 Bool) (index!46306 (_ BitVec 32)) (x!127913 (_ BitVec 32))) (Undefined!10978) (MissingVacant!10978 (index!46307 (_ BitVec 32))) )
))
(declare-fun lt!624370 () SeekEntryResult!10978)

(declare-fun b!1415767 () Bool)

(declare-fun lt!624366 () (_ BitVec 64))

(declare-fun e!801297 () Bool)

(declare-fun lt!624365 () array!96672)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96672 (_ BitVec 32)) SeekEntryResult!10978)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96672 (_ BitVec 32)) SeekEntryResult!10978)

(assert (=> b!1415767 (= e!801297 (= (seekEntryOrOpen!0 lt!624366 lt!624365 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127913 lt!624370) (index!46306 lt!624370) (index!46306 lt!624370) (select (arr!46667 a!2901) j!112) lt!624365 mask!2840)))))

(declare-fun b!1415768 () Bool)

(declare-fun e!801299 () Bool)

(assert (=> b!1415768 (= e!801299 true)))

(declare-fun lt!624368 () (_ BitVec 32))

(declare-fun lt!624372 () SeekEntryResult!10978)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96672 (_ BitVec 32)) SeekEntryResult!10978)

(assert (=> b!1415768 (= lt!624372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624368 lt!624366 lt!624365 mask!2840))))

(declare-fun e!801301 () Bool)

(declare-fun b!1415769 () Bool)

(assert (=> b!1415769 (= e!801301 (= (seekEntryOrOpen!0 (select (arr!46667 a!2901) j!112) a!2901 mask!2840) (Found!10978 j!112)))))

(declare-fun b!1415770 () Bool)

(declare-fun res!951807 () Bool)

(assert (=> b!1415770 (=> (not res!951807) (not e!801296))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415770 (= res!951807 (and (= (size!47217 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47217 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47217 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415771 () Bool)

(declare-fun e!801298 () Bool)

(assert (=> b!1415771 (= e!801298 e!801299)))

(declare-fun res!951813 () Bool)

(assert (=> b!1415771 (=> res!951813 e!801299)))

(declare-fun lt!624369 () SeekEntryResult!10978)

(assert (=> b!1415771 (= res!951813 (or (bvslt (x!127913 lt!624369) #b00000000000000000000000000000000) (bvsgt (x!127913 lt!624369) #b01111111111111111111111111111110) (bvslt (x!127913 lt!624370) #b00000000000000000000000000000000) (bvsgt (x!127913 lt!624370) #b01111111111111111111111111111110) (bvslt lt!624368 #b00000000000000000000000000000000) (bvsge lt!624368 (size!47217 a!2901)) (bvslt (index!46306 lt!624369) #b00000000000000000000000000000000) (bvsge (index!46306 lt!624369) (size!47217 a!2901)) (bvslt (index!46306 lt!624370) #b00000000000000000000000000000000) (bvsge (index!46306 lt!624370) (size!47217 a!2901)) (not (= lt!624369 (Intermediate!10978 false (index!46306 lt!624369) (x!127913 lt!624369)))) (not (= lt!624370 (Intermediate!10978 false (index!46306 lt!624370) (x!127913 lt!624370))))))))

(assert (=> b!1415771 e!801297))

(declare-fun res!951815 () Bool)

(assert (=> b!1415771 (=> (not res!951815) (not e!801297))))

(assert (=> b!1415771 (= res!951815 (and (not (undefined!11790 lt!624370)) (= (index!46306 lt!624370) i!1037) (bvslt (x!127913 lt!624370) (x!127913 lt!624369)) (= (select (store (arr!46667 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46306 lt!624370)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47930 0))(
  ( (Unit!47931) )
))
(declare-fun lt!624367 () Unit!47930)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47930)

(assert (=> b!1415771 (= lt!624367 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624368 (x!127913 lt!624369) (index!46306 lt!624369) (x!127913 lt!624370) (index!46306 lt!624370) (undefined!11790 lt!624370) mask!2840))))

(declare-fun b!1415772 () Bool)

(declare-fun e!801300 () Bool)

(assert (=> b!1415772 (= e!801296 (not e!801300))))

(declare-fun res!951808 () Bool)

(assert (=> b!1415772 (=> res!951808 e!801300)))

(assert (=> b!1415772 (= res!951808 (or (not (is-Intermediate!10978 lt!624369)) (undefined!11790 lt!624369)))))

(assert (=> b!1415772 e!801301))

(declare-fun res!951817 () Bool)

(assert (=> b!1415772 (=> (not res!951817) (not e!801301))))

(assert (=> b!1415772 (= res!951817 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624371 () Unit!47930)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47930)

(assert (=> b!1415772 (= lt!624371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415772 (= lt!624369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624368 (select (arr!46667 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415772 (= lt!624368 (toIndex!0 (select (arr!46667 a!2901) j!112) mask!2840))))

(declare-fun b!1415773 () Bool)

(assert (=> b!1415773 (= e!801300 e!801298)))

(declare-fun res!951812 () Bool)

(assert (=> b!1415773 (=> res!951812 e!801298)))

(assert (=> b!1415773 (= res!951812 (or (= lt!624369 lt!624370) (not (is-Intermediate!10978 lt!624370))))))

(assert (=> b!1415773 (= lt!624370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624366 mask!2840) lt!624366 lt!624365 mask!2840))))

(assert (=> b!1415773 (= lt!624366 (select (store (arr!46667 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415773 (= lt!624365 (array!96673 (store (arr!46667 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901)))))

(declare-fun b!1415774 () Bool)

(declare-fun res!951809 () Bool)

(assert (=> b!1415774 (=> (not res!951809) (not e!801296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415774 (= res!951809 (validKeyInArray!0 (select (arr!46667 a!2901) j!112)))))

(declare-fun res!951816 () Bool)

(assert (=> start!121986 (=> (not res!951816) (not e!801296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121986 (= res!951816 (validMask!0 mask!2840))))

(assert (=> start!121986 e!801296))

(assert (=> start!121986 true))

(declare-fun array_inv!35695 (array!96672) Bool)

(assert (=> start!121986 (array_inv!35695 a!2901)))

(declare-fun b!1415775 () Bool)

(declare-fun res!951811 () Bool)

(assert (=> b!1415775 (=> (not res!951811) (not e!801296))))

(assert (=> b!1415775 (= res!951811 (validKeyInArray!0 (select (arr!46667 a!2901) i!1037)))))

(assert (= (and start!121986 res!951816) b!1415770))

(assert (= (and b!1415770 res!951807) b!1415775))

(assert (= (and b!1415775 res!951811) b!1415774))

(assert (= (and b!1415774 res!951809) b!1415765))

(assert (= (and b!1415765 res!951814) b!1415766))

(assert (= (and b!1415766 res!951810) b!1415772))

(assert (= (and b!1415772 res!951817) b!1415769))

(assert (= (and b!1415772 (not res!951808)) b!1415773))

(assert (= (and b!1415773 (not res!951812)) b!1415771))

(assert (= (and b!1415771 res!951815) b!1415767))

(assert (= (and b!1415771 (not res!951813)) b!1415768))

(declare-fun m!1306167 () Bool)

(assert (=> b!1415769 m!1306167))

(assert (=> b!1415769 m!1306167))

(declare-fun m!1306169 () Bool)

(assert (=> b!1415769 m!1306169))

(declare-fun m!1306171 () Bool)

(assert (=> b!1415773 m!1306171))

(assert (=> b!1415773 m!1306171))

(declare-fun m!1306173 () Bool)

(assert (=> b!1415773 m!1306173))

(declare-fun m!1306175 () Bool)

(assert (=> b!1415773 m!1306175))

(declare-fun m!1306177 () Bool)

(assert (=> b!1415773 m!1306177))

(declare-fun m!1306179 () Bool)

(assert (=> b!1415766 m!1306179))

(declare-fun m!1306181 () Bool)

(assert (=> b!1415768 m!1306181))

(declare-fun m!1306183 () Bool)

(assert (=> b!1415775 m!1306183))

(assert (=> b!1415775 m!1306183))

(declare-fun m!1306185 () Bool)

(assert (=> b!1415775 m!1306185))

(declare-fun m!1306187 () Bool)

(assert (=> start!121986 m!1306187))

(declare-fun m!1306189 () Bool)

(assert (=> start!121986 m!1306189))

(assert (=> b!1415771 m!1306175))

(declare-fun m!1306191 () Bool)

(assert (=> b!1415771 m!1306191))

(declare-fun m!1306193 () Bool)

(assert (=> b!1415771 m!1306193))

(declare-fun m!1306195 () Bool)

(assert (=> b!1415765 m!1306195))

(assert (=> b!1415774 m!1306167))

(assert (=> b!1415774 m!1306167))

(declare-fun m!1306197 () Bool)

(assert (=> b!1415774 m!1306197))

(declare-fun m!1306199 () Bool)

(assert (=> b!1415767 m!1306199))

(assert (=> b!1415767 m!1306167))

(assert (=> b!1415767 m!1306167))

(declare-fun m!1306201 () Bool)

(assert (=> b!1415767 m!1306201))

(assert (=> b!1415772 m!1306167))

(declare-fun m!1306203 () Bool)

(assert (=> b!1415772 m!1306203))

(assert (=> b!1415772 m!1306167))

(declare-fun m!1306205 () Bool)

(assert (=> b!1415772 m!1306205))

(declare-fun m!1306207 () Bool)

(assert (=> b!1415772 m!1306207))

(assert (=> b!1415772 m!1306167))

(declare-fun m!1306209 () Bool)

(assert (=> b!1415772 m!1306209))

(push 1)

(assert (not b!1415772))

(assert (not b!1415773))

(assert (not b!1415767))

(assert (not b!1415771))

(assert (not b!1415775))

(assert (not b!1415768))

(assert (not start!121986))

(assert (not b!1415774))

(assert (not b!1415766))

(assert (not b!1415765))

(assert (not b!1415769))

(check-sat)

