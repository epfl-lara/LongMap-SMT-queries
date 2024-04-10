; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129144 () Bool)

(assert start!129144)

(declare-fun b!1515627 () Bool)

(declare-fun res!1035534 () Bool)

(declare-fun e!845788 () Bool)

(assert (=> b!1515627 (=> (not res!1035534) (not e!845788))))

(declare-datatypes ((array!101000 0))(
  ( (array!101001 (arr!48737 (Array (_ BitVec 32) (_ BitVec 64))) (size!49287 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101000)

(declare-datatypes ((List!35220 0))(
  ( (Nil!35217) (Cons!35216 (h!36628 (_ BitVec 64)) (t!49914 List!35220)) )
))
(declare-fun arrayNoDuplicates!0 (array!101000 (_ BitVec 32) List!35220) Bool)

(assert (=> b!1515627 (= res!1035534 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35217))))

(declare-fun b!1515628 () Bool)

(declare-fun res!1035530 () Bool)

(assert (=> b!1515628 (=> (not res!1035530) (not e!845788))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101000 (_ BitVec 32)) Bool)

(assert (=> b!1515628 (= res!1035530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515629 () Bool)

(declare-fun e!845787 () Bool)

(assert (=> b!1515629 (= e!845787 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!12908 0))(
  ( (MissingZero!12908 (index!54027 (_ BitVec 32))) (Found!12908 (index!54028 (_ BitVec 32))) (Intermediate!12908 (undefined!13720 Bool) (index!54029 (_ BitVec 32)) (x!135730 (_ BitVec 32))) (Undefined!12908) (MissingVacant!12908 (index!54030 (_ BitVec 32))) )
))
(declare-fun lt!657012 () SeekEntryResult!12908)

(declare-fun lt!657016 () SeekEntryResult!12908)

(assert (=> b!1515629 (= lt!657012 lt!657016)))

(declare-datatypes ((Unit!50684 0))(
  ( (Unit!50685) )
))
(declare-fun lt!657010 () Unit!50684)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50684)

(assert (=> b!1515629 (= lt!657010 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515630 () Bool)

(declare-fun res!1035535 () Bool)

(assert (=> b!1515630 (=> (not res!1035535) (not e!845788))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515630 (= res!1035535 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49287 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49287 a!2804))))))

(declare-fun b!1515631 () Bool)

(declare-fun res!1035538 () Bool)

(declare-fun e!845791 () Bool)

(assert (=> b!1515631 (=> (not res!1035538) (not e!845791))))

(declare-fun lt!657019 () SeekEntryResult!12908)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101000 (_ BitVec 32)) SeekEntryResult!12908)

(assert (=> b!1515631 (= res!1035538 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48737 a!2804) j!70) a!2804 mask!2512) lt!657019))))

(declare-fun b!1515626 () Bool)

(declare-fun res!1035540 () Bool)

(assert (=> b!1515626 (=> (not res!1035540) (not e!845788))))

(assert (=> b!1515626 (= res!1035540 (and (= (size!49287 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49287 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49287 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1035533 () Bool)

(assert (=> start!129144 (=> (not res!1035533) (not e!845788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129144 (= res!1035533 (validMask!0 mask!2512))))

(assert (=> start!129144 e!845788))

(assert (=> start!129144 true))

(declare-fun array_inv!37765 (array!101000) Bool)

(assert (=> start!129144 (array_inv!37765 a!2804)))

(declare-fun b!1515632 () Bool)

(declare-fun res!1035532 () Bool)

(assert (=> b!1515632 (=> (not res!1035532) (not e!845788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515632 (= res!1035532 (validKeyInArray!0 (select (arr!48737 a!2804) j!70)))))

(declare-fun b!1515633 () Bool)

(declare-fun e!845790 () Bool)

(declare-fun e!845786 () Bool)

(assert (=> b!1515633 (= e!845790 (not e!845786))))

(declare-fun res!1035541 () Bool)

(assert (=> b!1515633 (=> res!1035541 e!845786)))

(declare-fun lt!657018 () (_ BitVec 64))

(assert (=> b!1515633 (= res!1035541 (or (not (= (select (arr!48737 a!2804) j!70) lt!657018)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48737 a!2804) index!487) (select (arr!48737 a!2804) j!70)) (not (= (select (arr!48737 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845785 () Bool)

(assert (=> b!1515633 e!845785))

(declare-fun res!1035531 () Bool)

(assert (=> b!1515633 (=> (not res!1035531) (not e!845785))))

(assert (=> b!1515633 (= res!1035531 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657017 () Unit!50684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50684)

(assert (=> b!1515633 (= lt!657017 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515634 () Bool)

(assert (=> b!1515634 (= e!845788 e!845791)))

(declare-fun res!1035536 () Bool)

(assert (=> b!1515634 (=> (not res!1035536) (not e!845791))))

(declare-fun lt!657011 () SeekEntryResult!12908)

(assert (=> b!1515634 (= res!1035536 (= lt!657011 lt!657019))))

(assert (=> b!1515634 (= lt!657019 (Intermediate!12908 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515634 (= lt!657011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48737 a!2804) j!70) mask!2512) (select (arr!48737 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515635 () Bool)

(assert (=> b!1515635 (= e!845791 e!845790)))

(declare-fun res!1035537 () Bool)

(assert (=> b!1515635 (=> (not res!1035537) (not e!845790))))

(declare-fun lt!657013 () array!101000)

(assert (=> b!1515635 (= res!1035537 (= lt!657011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657018 mask!2512) lt!657018 lt!657013 mask!2512)))))

(assert (=> b!1515635 (= lt!657018 (select (store (arr!48737 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515635 (= lt!657013 (array!101001 (store (arr!48737 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49287 a!2804)))))

(declare-fun b!1515636 () Bool)

(assert (=> b!1515636 (= e!845786 e!845787)))

(declare-fun res!1035539 () Bool)

(assert (=> b!1515636 (=> res!1035539 e!845787)))

(assert (=> b!1515636 (= res!1035539 (not (= lt!657016 (Found!12908 j!70))))))

(declare-fun lt!657014 () SeekEntryResult!12908)

(assert (=> b!1515636 (= lt!657014 lt!657012)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101000 (_ BitVec 32)) SeekEntryResult!12908)

(assert (=> b!1515636 (= lt!657012 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657018 lt!657013 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101000 (_ BitVec 32)) SeekEntryResult!12908)

(assert (=> b!1515636 (= lt!657014 (seekEntryOrOpen!0 lt!657018 lt!657013 mask!2512))))

(declare-fun lt!657015 () SeekEntryResult!12908)

(assert (=> b!1515636 (= lt!657015 lt!657016)))

(assert (=> b!1515636 (= lt!657016 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48737 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515636 (= lt!657015 (seekEntryOrOpen!0 (select (arr!48737 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515637 () Bool)

(declare-fun res!1035529 () Bool)

(assert (=> b!1515637 (=> (not res!1035529) (not e!845788))))

(assert (=> b!1515637 (= res!1035529 (validKeyInArray!0 (select (arr!48737 a!2804) i!961)))))

(declare-fun b!1515638 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101000 (_ BitVec 32)) SeekEntryResult!12908)

(assert (=> b!1515638 (= e!845785 (= (seekEntry!0 (select (arr!48737 a!2804) j!70) a!2804 mask!2512) (Found!12908 j!70)))))

(assert (= (and start!129144 res!1035533) b!1515626))

(assert (= (and b!1515626 res!1035540) b!1515637))

(assert (= (and b!1515637 res!1035529) b!1515632))

(assert (= (and b!1515632 res!1035532) b!1515628))

(assert (= (and b!1515628 res!1035530) b!1515627))

(assert (= (and b!1515627 res!1035534) b!1515630))

(assert (= (and b!1515630 res!1035535) b!1515634))

(assert (= (and b!1515634 res!1035536) b!1515631))

(assert (= (and b!1515631 res!1035538) b!1515635))

(assert (= (and b!1515635 res!1035537) b!1515633))

(assert (= (and b!1515633 res!1035531) b!1515638))

(assert (= (and b!1515633 (not res!1035541)) b!1515636))

(assert (= (and b!1515636 (not res!1035539)) b!1515629))

(declare-fun m!1398775 () Bool)

(assert (=> b!1515633 m!1398775))

(declare-fun m!1398777 () Bool)

(assert (=> b!1515633 m!1398777))

(declare-fun m!1398779 () Bool)

(assert (=> b!1515633 m!1398779))

(declare-fun m!1398781 () Bool)

(assert (=> b!1515633 m!1398781))

(declare-fun m!1398783 () Bool)

(assert (=> b!1515637 m!1398783))

(assert (=> b!1515637 m!1398783))

(declare-fun m!1398785 () Bool)

(assert (=> b!1515637 m!1398785))

(declare-fun m!1398787 () Bool)

(assert (=> b!1515627 m!1398787))

(assert (=> b!1515634 m!1398775))

(assert (=> b!1515634 m!1398775))

(declare-fun m!1398789 () Bool)

(assert (=> b!1515634 m!1398789))

(assert (=> b!1515634 m!1398789))

(assert (=> b!1515634 m!1398775))

(declare-fun m!1398791 () Bool)

(assert (=> b!1515634 m!1398791))

(declare-fun m!1398793 () Bool)

(assert (=> b!1515629 m!1398793))

(assert (=> b!1515636 m!1398775))

(declare-fun m!1398795 () Bool)

(assert (=> b!1515636 m!1398795))

(assert (=> b!1515636 m!1398775))

(declare-fun m!1398797 () Bool)

(assert (=> b!1515636 m!1398797))

(declare-fun m!1398799 () Bool)

(assert (=> b!1515636 m!1398799))

(assert (=> b!1515636 m!1398775))

(declare-fun m!1398801 () Bool)

(assert (=> b!1515636 m!1398801))

(assert (=> b!1515632 m!1398775))

(assert (=> b!1515632 m!1398775))

(declare-fun m!1398803 () Bool)

(assert (=> b!1515632 m!1398803))

(assert (=> b!1515631 m!1398775))

(assert (=> b!1515631 m!1398775))

(declare-fun m!1398805 () Bool)

(assert (=> b!1515631 m!1398805))

(declare-fun m!1398807 () Bool)

(assert (=> b!1515628 m!1398807))

(declare-fun m!1398809 () Bool)

(assert (=> start!129144 m!1398809))

(declare-fun m!1398811 () Bool)

(assert (=> start!129144 m!1398811))

(declare-fun m!1398813 () Bool)

(assert (=> b!1515635 m!1398813))

(assert (=> b!1515635 m!1398813))

(declare-fun m!1398815 () Bool)

(assert (=> b!1515635 m!1398815))

(declare-fun m!1398817 () Bool)

(assert (=> b!1515635 m!1398817))

(declare-fun m!1398819 () Bool)

(assert (=> b!1515635 m!1398819))

(assert (=> b!1515638 m!1398775))

(assert (=> b!1515638 m!1398775))

(declare-fun m!1398821 () Bool)

(assert (=> b!1515638 m!1398821))

(push 1)

