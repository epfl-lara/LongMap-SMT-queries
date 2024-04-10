; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129250 () Bool)

(assert start!129250)

(declare-fun b!1517630 () Bool)

(declare-fun res!1037535 () Bool)

(declare-fun e!846701 () Bool)

(assert (=> b!1517630 (=> (not res!1037535) (not e!846701))))

(declare-datatypes ((array!101106 0))(
  ( (array!101107 (arr!48790 (Array (_ BitVec 32) (_ BitVec 64))) (size!49340 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101106)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517630 (= res!1037535 (validKeyInArray!0 (select (arr!48790 a!2804) j!70)))))

(declare-fun b!1517631 () Bool)

(declare-fun e!846702 () Bool)

(assert (=> b!1517631 (= e!846702 true)))

(declare-fun lt!657860 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12961 0))(
  ( (MissingZero!12961 (index!54239 (_ BitVec 32))) (Found!12961 (index!54240 (_ BitVec 32))) (Intermediate!12961 (undefined!13773 Bool) (index!54241 (_ BitVec 32)) (x!135919 (_ BitVec 32))) (Undefined!12961) (MissingVacant!12961 (index!54242 (_ BitVec 32))) )
))
(declare-fun lt!657858 () SeekEntryResult!12961)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101106 (_ BitVec 32)) SeekEntryResult!12961)

(assert (=> b!1517631 (= lt!657858 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657860 (select (arr!48790 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517632 () Bool)

(declare-fun e!846703 () Bool)

(declare-fun e!846704 () Bool)

(assert (=> b!1517632 (= e!846703 (not e!846704))))

(declare-fun res!1037537 () Bool)

(assert (=> b!1517632 (=> res!1037537 e!846704)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517632 (= res!1037537 (or (not (= (select (arr!48790 a!2804) j!70) (select (store (arr!48790 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846706 () Bool)

(assert (=> b!1517632 e!846706))

(declare-fun res!1037538 () Bool)

(assert (=> b!1517632 (=> (not res!1037538) (not e!846706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101106 (_ BitVec 32)) Bool)

(assert (=> b!1517632 (= res!1037538 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50790 0))(
  ( (Unit!50791) )
))
(declare-fun lt!657859 () Unit!50790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50790)

(assert (=> b!1517632 (= lt!657859 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517633 () Bool)

(declare-fun res!1037545 () Bool)

(assert (=> b!1517633 (=> (not res!1037545) (not e!846701))))

(assert (=> b!1517633 (= res!1037545 (and (= (size!49340 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49340 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49340 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517634 () Bool)

(declare-fun res!1037536 () Bool)

(assert (=> b!1517634 (=> (not res!1037536) (not e!846701))))

(assert (=> b!1517634 (= res!1037536 (validKeyInArray!0 (select (arr!48790 a!2804) i!961)))))

(declare-fun b!1517635 () Bool)

(assert (=> b!1517635 (= e!846704 e!846702)))

(declare-fun res!1037542 () Bool)

(assert (=> b!1517635 (=> res!1037542 e!846702)))

(assert (=> b!1517635 (= res!1037542 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657860 #b00000000000000000000000000000000) (bvsge lt!657860 (size!49340 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517635 (= lt!657860 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517636 () Bool)

(declare-fun res!1037533 () Bool)

(assert (=> b!1517636 (=> (not res!1037533) (not e!846703))))

(declare-fun lt!657861 () SeekEntryResult!12961)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517636 (= res!1037533 (= lt!657861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48790 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48790 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101107 (store (arr!48790 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49340 a!2804)) mask!2512)))))

(declare-fun res!1037540 () Bool)

(assert (=> start!129250 (=> (not res!1037540) (not e!846701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129250 (= res!1037540 (validMask!0 mask!2512))))

(assert (=> start!129250 e!846701))

(assert (=> start!129250 true))

(declare-fun array_inv!37818 (array!101106) Bool)

(assert (=> start!129250 (array_inv!37818 a!2804)))

(declare-fun b!1517637 () Bool)

(declare-fun res!1037534 () Bool)

(assert (=> b!1517637 (=> (not res!1037534) (not e!846703))))

(declare-fun lt!657862 () SeekEntryResult!12961)

(assert (=> b!1517637 (= res!1037534 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48790 a!2804) j!70) a!2804 mask!2512) lt!657862))))

(declare-fun b!1517638 () Bool)

(assert (=> b!1517638 (= e!846701 e!846703)))

(declare-fun res!1037539 () Bool)

(assert (=> b!1517638 (=> (not res!1037539) (not e!846703))))

(assert (=> b!1517638 (= res!1037539 (= lt!657861 lt!657862))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517638 (= lt!657862 (Intermediate!12961 false resIndex!21 resX!21))))

(assert (=> b!1517638 (= lt!657861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48790 a!2804) j!70) mask!2512) (select (arr!48790 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517639 () Bool)

(declare-fun res!1037541 () Bool)

(assert (=> b!1517639 (=> (not res!1037541) (not e!846701))))

(assert (=> b!1517639 (= res!1037541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517640 () Bool)

(declare-fun res!1037543 () Bool)

(assert (=> b!1517640 (=> (not res!1037543) (not e!846701))))

(declare-datatypes ((List!35273 0))(
  ( (Nil!35270) (Cons!35269 (h!36681 (_ BitVec 64)) (t!49967 List!35273)) )
))
(declare-fun arrayNoDuplicates!0 (array!101106 (_ BitVec 32) List!35273) Bool)

(assert (=> b!1517640 (= res!1037543 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35270))))

(declare-fun b!1517641 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101106 (_ BitVec 32)) SeekEntryResult!12961)

(assert (=> b!1517641 (= e!846706 (= (seekEntry!0 (select (arr!48790 a!2804) j!70) a!2804 mask!2512) (Found!12961 j!70)))))

(declare-fun b!1517642 () Bool)

(declare-fun res!1037544 () Bool)

(assert (=> b!1517642 (=> (not res!1037544) (not e!846701))))

(assert (=> b!1517642 (= res!1037544 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49340 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49340 a!2804))))))

(assert (= (and start!129250 res!1037540) b!1517633))

(assert (= (and b!1517633 res!1037545) b!1517634))

(assert (= (and b!1517634 res!1037536) b!1517630))

(assert (= (and b!1517630 res!1037535) b!1517639))

(assert (= (and b!1517639 res!1037541) b!1517640))

(assert (= (and b!1517640 res!1037543) b!1517642))

(assert (= (and b!1517642 res!1037544) b!1517638))

(assert (= (and b!1517638 res!1037539) b!1517637))

(assert (= (and b!1517637 res!1037534) b!1517636))

(assert (= (and b!1517636 res!1037533) b!1517632))

(assert (= (and b!1517632 res!1037538) b!1517641))

(assert (= (and b!1517632 (not res!1037537)) b!1517635))

(assert (= (and b!1517635 (not res!1037542)) b!1517631))

(declare-fun m!1400925 () Bool)

(assert (=> b!1517639 m!1400925))

(declare-fun m!1400927 () Bool)

(assert (=> b!1517636 m!1400927))

(declare-fun m!1400929 () Bool)

(assert (=> b!1517636 m!1400929))

(assert (=> b!1517636 m!1400929))

(declare-fun m!1400931 () Bool)

(assert (=> b!1517636 m!1400931))

(assert (=> b!1517636 m!1400931))

(assert (=> b!1517636 m!1400929))

(declare-fun m!1400933 () Bool)

(assert (=> b!1517636 m!1400933))

(declare-fun m!1400935 () Bool)

(assert (=> start!129250 m!1400935))

(declare-fun m!1400937 () Bool)

(assert (=> start!129250 m!1400937))

(declare-fun m!1400939 () Bool)

(assert (=> b!1517637 m!1400939))

(assert (=> b!1517637 m!1400939))

(declare-fun m!1400941 () Bool)

(assert (=> b!1517637 m!1400941))

(declare-fun m!1400943 () Bool)

(assert (=> b!1517635 m!1400943))

(assert (=> b!1517641 m!1400939))

(assert (=> b!1517641 m!1400939))

(declare-fun m!1400945 () Bool)

(assert (=> b!1517641 m!1400945))

(assert (=> b!1517632 m!1400939))

(declare-fun m!1400947 () Bool)

(assert (=> b!1517632 m!1400947))

(assert (=> b!1517632 m!1400927))

(assert (=> b!1517632 m!1400929))

(declare-fun m!1400949 () Bool)

(assert (=> b!1517632 m!1400949))

(declare-fun m!1400951 () Bool)

(assert (=> b!1517634 m!1400951))

(assert (=> b!1517634 m!1400951))

(declare-fun m!1400953 () Bool)

(assert (=> b!1517634 m!1400953))

(assert (=> b!1517630 m!1400939))

(assert (=> b!1517630 m!1400939))

(declare-fun m!1400955 () Bool)

(assert (=> b!1517630 m!1400955))

(assert (=> b!1517631 m!1400939))

(assert (=> b!1517631 m!1400939))

(declare-fun m!1400957 () Bool)

(assert (=> b!1517631 m!1400957))

(declare-fun m!1400959 () Bool)

(assert (=> b!1517640 m!1400959))

(assert (=> b!1517638 m!1400939))

(assert (=> b!1517638 m!1400939))

(declare-fun m!1400961 () Bool)

(assert (=> b!1517638 m!1400961))

(assert (=> b!1517638 m!1400961))

(assert (=> b!1517638 m!1400939))

(declare-fun m!1400963 () Bool)

(assert (=> b!1517638 m!1400963))

(push 1)

(assert (not b!1517640))

(assert (not b!1517630))

(assert (not start!129250))

