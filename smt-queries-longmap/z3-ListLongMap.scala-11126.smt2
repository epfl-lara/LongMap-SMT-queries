; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130002 () Bool)

(assert start!130002)

(declare-fun b!1525665 () Bool)

(declare-fun e!850403 () Bool)

(declare-fun e!850407 () Bool)

(assert (=> b!1525665 (= e!850403 e!850407)))

(declare-fun res!1043889 () Bool)

(assert (=> b!1525665 (=> (not res!1043889) (not e!850407))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101413 0))(
  ( (array!101414 (arr!48934 (Array (_ BitVec 32) (_ BitVec 64))) (size!49486 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101413)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13122 0))(
  ( (MissingZero!13122 (index!54883 (_ BitVec 32))) (Found!13122 (index!54884 (_ BitVec 32))) (Intermediate!13122 (undefined!13934 Bool) (index!54885 (_ BitVec 32)) (x!136587 (_ BitVec 32))) (Undefined!13122) (MissingVacant!13122 (index!54886 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101413 (_ BitVec 32)) SeekEntryResult!13122)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101413 (_ BitVec 32)) SeekEntryResult!13122)

(assert (=> b!1525665 (= res!1043889 (= (seekEntryOrOpen!0 (select (arr!48934 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48934 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525666 () Bool)

(declare-fun res!1043884 () Bool)

(declare-fun e!850406 () Bool)

(assert (=> b!1525666 (=> (not res!1043884) (not e!850406))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525666 (= res!1043884 (and (= (size!49486 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49486 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49486 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525667 () Bool)

(declare-fun e!850408 () Bool)

(declare-fun e!850404 () Bool)

(assert (=> b!1525667 (= e!850408 e!850404)))

(declare-fun res!1043890 () Bool)

(assert (=> b!1525667 (=> (not res!1043890) (not e!850404))))

(declare-fun lt!660623 () SeekEntryResult!13122)

(declare-fun lt!660624 () (_ BitVec 64))

(declare-fun lt!660626 () array!101413)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101413 (_ BitVec 32)) SeekEntryResult!13122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525667 (= res!1043890 (= lt!660623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660624 mask!2512) lt!660624 lt!660626 mask!2512)))))

(assert (=> b!1525667 (= lt!660624 (select (store (arr!48934 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525667 (= lt!660626 (array!101414 (store (arr!48934 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49486 a!2804)))))

(declare-fun b!1525668 () Bool)

(declare-fun res!1043895 () Bool)

(assert (=> b!1525668 (=> (not res!1043895) (not e!850406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525668 (= res!1043895 (validKeyInArray!0 (select (arr!48934 a!2804) j!70)))))

(declare-fun b!1525669 () Bool)

(declare-fun res!1043891 () Bool)

(assert (=> b!1525669 (=> (not res!1043891) (not e!850406))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525669 (= res!1043891 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49486 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49486 a!2804))))))

(declare-fun b!1525670 () Bool)

(declare-fun res!1043894 () Bool)

(assert (=> b!1525670 (=> (not res!1043894) (not e!850406))))

(assert (=> b!1525670 (= res!1043894 (validKeyInArray!0 (select (arr!48934 a!2804) i!961)))))

(declare-fun b!1525671 () Bool)

(assert (=> b!1525671 (= e!850406 e!850408)))

(declare-fun res!1043892 () Bool)

(assert (=> b!1525671 (=> (not res!1043892) (not e!850408))))

(declare-fun lt!660625 () SeekEntryResult!13122)

(assert (=> b!1525671 (= res!1043892 (= lt!660623 lt!660625))))

(assert (=> b!1525671 (= lt!660625 (Intermediate!13122 false resIndex!21 resX!21))))

(assert (=> b!1525671 (= lt!660623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48934 a!2804) j!70) mask!2512) (select (arr!48934 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525672 () Bool)

(declare-fun res!1043886 () Bool)

(assert (=> b!1525672 (=> (not res!1043886) (not e!850406))))

(declare-datatypes ((List!35495 0))(
  ( (Nil!35492) (Cons!35491 (h!36925 (_ BitVec 64)) (t!50181 List!35495)) )
))
(declare-fun arrayNoDuplicates!0 (array!101413 (_ BitVec 32) List!35495) Bool)

(assert (=> b!1525672 (= res!1043886 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35492))))

(declare-fun b!1525673 () Bool)

(declare-fun e!850402 () Bool)

(assert (=> b!1525673 (= e!850402 e!850403)))

(declare-fun res!1043893 () Bool)

(assert (=> b!1525673 (=> res!1043893 e!850403)))

(assert (=> b!1525673 (= res!1043893 (or (not (= (select (arr!48934 a!2804) j!70) lt!660624)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48934 a!2804) index!487) (select (arr!48934 a!2804) j!70)) (not (= (select (arr!48934 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525674 () Bool)

(declare-fun res!1043896 () Bool)

(assert (=> b!1525674 (=> (not res!1043896) (not e!850406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101413 (_ BitVec 32)) Bool)

(assert (=> b!1525674 (= res!1043896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1043883 () Bool)

(assert (=> start!130002 (=> (not res!1043883) (not e!850406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130002 (= res!1043883 (validMask!0 mask!2512))))

(assert (=> start!130002 e!850406))

(assert (=> start!130002 true))

(declare-fun array_inv!38167 (array!101413) Bool)

(assert (=> start!130002 (array_inv!38167 a!2804)))

(declare-fun b!1525675 () Bool)

(declare-fun res!1043888 () Bool)

(assert (=> b!1525675 (=> (not res!1043888) (not e!850402))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101413 (_ BitVec 32)) SeekEntryResult!13122)

(assert (=> b!1525675 (= res!1043888 (= (seekEntry!0 (select (arr!48934 a!2804) j!70) a!2804 mask!2512) (Found!13122 j!70)))))

(declare-fun b!1525676 () Bool)

(assert (=> b!1525676 (= e!850407 (= (seekEntryOrOpen!0 lt!660624 lt!660626 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660624 lt!660626 mask!2512)))))

(declare-fun b!1525677 () Bool)

(declare-fun res!1043887 () Bool)

(assert (=> b!1525677 (=> (not res!1043887) (not e!850408))))

(assert (=> b!1525677 (= res!1043887 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48934 a!2804) j!70) a!2804 mask!2512) lt!660625))))

(declare-fun b!1525678 () Bool)

(assert (=> b!1525678 (= e!850404 (not true))))

(assert (=> b!1525678 e!850402))

(declare-fun res!1043885 () Bool)

(assert (=> b!1525678 (=> (not res!1043885) (not e!850402))))

(assert (=> b!1525678 (= res!1043885 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50867 0))(
  ( (Unit!50868) )
))
(declare-fun lt!660627 () Unit!50867)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50867)

(assert (=> b!1525678 (= lt!660627 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130002 res!1043883) b!1525666))

(assert (= (and b!1525666 res!1043884) b!1525670))

(assert (= (and b!1525670 res!1043894) b!1525668))

(assert (= (and b!1525668 res!1043895) b!1525674))

(assert (= (and b!1525674 res!1043896) b!1525672))

(assert (= (and b!1525672 res!1043886) b!1525669))

(assert (= (and b!1525669 res!1043891) b!1525671))

(assert (= (and b!1525671 res!1043892) b!1525677))

(assert (= (and b!1525677 res!1043887) b!1525667))

(assert (= (and b!1525667 res!1043890) b!1525678))

(assert (= (and b!1525678 res!1043885) b!1525675))

(assert (= (and b!1525675 res!1043888) b!1525673))

(assert (= (and b!1525673 (not res!1043893)) b!1525665))

(assert (= (and b!1525665 res!1043889) b!1525676))

(declare-fun m!1407845 () Bool)

(assert (=> b!1525665 m!1407845))

(assert (=> b!1525665 m!1407845))

(declare-fun m!1407847 () Bool)

(assert (=> b!1525665 m!1407847))

(assert (=> b!1525665 m!1407845))

(declare-fun m!1407849 () Bool)

(assert (=> b!1525665 m!1407849))

(assert (=> b!1525668 m!1407845))

(assert (=> b!1525668 m!1407845))

(declare-fun m!1407851 () Bool)

(assert (=> b!1525668 m!1407851))

(declare-fun m!1407853 () Bool)

(assert (=> b!1525667 m!1407853))

(assert (=> b!1525667 m!1407853))

(declare-fun m!1407855 () Bool)

(assert (=> b!1525667 m!1407855))

(declare-fun m!1407857 () Bool)

(assert (=> b!1525667 m!1407857))

(declare-fun m!1407859 () Bool)

(assert (=> b!1525667 m!1407859))

(declare-fun m!1407861 () Bool)

(assert (=> b!1525674 m!1407861))

(assert (=> b!1525675 m!1407845))

(assert (=> b!1525675 m!1407845))

(declare-fun m!1407863 () Bool)

(assert (=> b!1525675 m!1407863))

(declare-fun m!1407865 () Bool)

(assert (=> b!1525678 m!1407865))

(declare-fun m!1407867 () Bool)

(assert (=> b!1525678 m!1407867))

(assert (=> b!1525677 m!1407845))

(assert (=> b!1525677 m!1407845))

(declare-fun m!1407869 () Bool)

(assert (=> b!1525677 m!1407869))

(declare-fun m!1407871 () Bool)

(assert (=> b!1525676 m!1407871))

(declare-fun m!1407873 () Bool)

(assert (=> b!1525676 m!1407873))

(declare-fun m!1407875 () Bool)

(assert (=> start!130002 m!1407875))

(declare-fun m!1407877 () Bool)

(assert (=> start!130002 m!1407877))

(declare-fun m!1407879 () Bool)

(assert (=> b!1525670 m!1407879))

(assert (=> b!1525670 m!1407879))

(declare-fun m!1407881 () Bool)

(assert (=> b!1525670 m!1407881))

(assert (=> b!1525673 m!1407845))

(declare-fun m!1407883 () Bool)

(assert (=> b!1525673 m!1407883))

(assert (=> b!1525671 m!1407845))

(assert (=> b!1525671 m!1407845))

(declare-fun m!1407885 () Bool)

(assert (=> b!1525671 m!1407885))

(assert (=> b!1525671 m!1407885))

(assert (=> b!1525671 m!1407845))

(declare-fun m!1407887 () Bool)

(assert (=> b!1525671 m!1407887))

(declare-fun m!1407889 () Bool)

(assert (=> b!1525672 m!1407889))

(check-sat (not b!1525676) (not b!1525678) (not b!1525670) (not b!1525667) (not b!1525672) (not b!1525665) (not b!1525677) (not start!130002) (not b!1525671) (not b!1525668) (not b!1525675) (not b!1525674))
(check-sat)
