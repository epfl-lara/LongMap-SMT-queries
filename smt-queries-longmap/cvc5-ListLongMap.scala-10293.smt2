; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121080 () Bool)

(assert start!121080)

(declare-fun b!1407754 () Bool)

(declare-fun res!945476 () Bool)

(declare-fun e!796778 () Bool)

(assert (=> b!1407754 (=> res!945476 e!796778)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96234 0))(
  ( (array!96235 (arr!46460 (Array (_ BitVec 32) (_ BitVec 64))) (size!47010 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96234)

(declare-datatypes ((SeekEntryResult!10771 0))(
  ( (MissingZero!10771 (index!45461 (_ BitVec 32))) (Found!10771 (index!45462 (_ BitVec 32))) (Intermediate!10771 (undefined!11583 Bool) (index!45463 (_ BitVec 32)) (x!127076 (_ BitVec 32))) (Undefined!10771) (MissingVacant!10771 (index!45464 (_ BitVec 32))) )
))
(declare-fun lt!619932 () SeekEntryResult!10771)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96234 (_ BitVec 32)) SeekEntryResult!10771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407754 (= res!945476 (not (= lt!619932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46460 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46460 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96235 (store (arr!46460 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47010 a!2901)) mask!2840))))))

(declare-fun b!1407755 () Bool)

(declare-fun res!945477 () Bool)

(declare-fun e!796780 () Bool)

(assert (=> b!1407755 (=> (not res!945477) (not e!796780))))

(assert (=> b!1407755 (= res!945477 (and (= (size!47010 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47010 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47010 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407756 () Bool)

(assert (=> b!1407756 (= e!796780 (not e!796778))))

(declare-fun res!945481 () Bool)

(assert (=> b!1407756 (=> res!945481 e!796778)))

(assert (=> b!1407756 (= res!945481 (or (not (is-Intermediate!10771 lt!619932)) (undefined!11583 lt!619932)))))

(declare-fun e!796779 () Bool)

(assert (=> b!1407756 e!796779))

(declare-fun res!945482 () Bool)

(assert (=> b!1407756 (=> (not res!945482) (not e!796779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96234 (_ BitVec 32)) Bool)

(assert (=> b!1407756 (= res!945482 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47516 0))(
  ( (Unit!47517) )
))
(declare-fun lt!619930 () Unit!47516)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47516)

(assert (=> b!1407756 (= lt!619930 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619931 () (_ BitVec 32))

(assert (=> b!1407756 (= lt!619932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619931 (select (arr!46460 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1407756 (= lt!619931 (toIndex!0 (select (arr!46460 a!2901) j!112) mask!2840))))

(declare-fun res!945478 () Bool)

(assert (=> start!121080 (=> (not res!945478) (not e!796780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121080 (= res!945478 (validMask!0 mask!2840))))

(assert (=> start!121080 e!796780))

(assert (=> start!121080 true))

(declare-fun array_inv!35488 (array!96234) Bool)

(assert (=> start!121080 (array_inv!35488 a!2901)))

(declare-fun b!1407757 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96234 (_ BitVec 32)) SeekEntryResult!10771)

(assert (=> b!1407757 (= e!796779 (= (seekEntryOrOpen!0 (select (arr!46460 a!2901) j!112) a!2901 mask!2840) (Found!10771 j!112)))))

(declare-fun b!1407758 () Bool)

(declare-fun res!945483 () Bool)

(assert (=> b!1407758 (=> (not res!945483) (not e!796780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407758 (= res!945483 (validKeyInArray!0 (select (arr!46460 a!2901) i!1037)))))

(declare-fun b!1407759 () Bool)

(declare-fun res!945480 () Bool)

(assert (=> b!1407759 (=> (not res!945480) (not e!796780))))

(assert (=> b!1407759 (= res!945480 (validKeyInArray!0 (select (arr!46460 a!2901) j!112)))))

(declare-fun b!1407760 () Bool)

(declare-fun res!945484 () Bool)

(assert (=> b!1407760 (=> (not res!945484) (not e!796780))))

(assert (=> b!1407760 (= res!945484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407761 () Bool)

(assert (=> b!1407761 (= e!796778 (or (bvslt (x!127076 lt!619932) #b00000000000000000000000000000000) (bvsgt (x!127076 lt!619932) #b01111111111111111111111111111110) (bvslt lt!619931 #b00000000000000000000000000000000) (bvsge lt!619931 (size!47010 a!2901)) (bvslt (index!45463 lt!619932) #b00000000000000000000000000000000) (bvsge (index!45463 lt!619932) (size!47010 a!2901)) (= lt!619932 (Intermediate!10771 false (index!45463 lt!619932) (x!127076 lt!619932)))))))

(declare-fun b!1407762 () Bool)

(declare-fun res!945479 () Bool)

(assert (=> b!1407762 (=> (not res!945479) (not e!796780))))

(declare-datatypes ((List!32979 0))(
  ( (Nil!32976) (Cons!32975 (h!34238 (_ BitVec 64)) (t!47673 List!32979)) )
))
(declare-fun arrayNoDuplicates!0 (array!96234 (_ BitVec 32) List!32979) Bool)

(assert (=> b!1407762 (= res!945479 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32976))))

(assert (= (and start!121080 res!945478) b!1407755))

(assert (= (and b!1407755 res!945477) b!1407758))

(assert (= (and b!1407758 res!945483) b!1407759))

(assert (= (and b!1407759 res!945480) b!1407760))

(assert (= (and b!1407760 res!945484) b!1407762))

(assert (= (and b!1407762 res!945479) b!1407756))

(assert (= (and b!1407756 res!945482) b!1407757))

(assert (= (and b!1407756 (not res!945481)) b!1407754))

(assert (= (and b!1407754 (not res!945476)) b!1407761))

(declare-fun m!1296783 () Bool)

(assert (=> b!1407760 m!1296783))

(declare-fun m!1296785 () Bool)

(assert (=> b!1407756 m!1296785))

(declare-fun m!1296787 () Bool)

(assert (=> b!1407756 m!1296787))

(assert (=> b!1407756 m!1296785))

(assert (=> b!1407756 m!1296785))

(declare-fun m!1296789 () Bool)

(assert (=> b!1407756 m!1296789))

(declare-fun m!1296791 () Bool)

(assert (=> b!1407756 m!1296791))

(declare-fun m!1296793 () Bool)

(assert (=> b!1407756 m!1296793))

(declare-fun m!1296795 () Bool)

(assert (=> b!1407754 m!1296795))

(declare-fun m!1296797 () Bool)

(assert (=> b!1407754 m!1296797))

(assert (=> b!1407754 m!1296797))

(declare-fun m!1296799 () Bool)

(assert (=> b!1407754 m!1296799))

(assert (=> b!1407754 m!1296799))

(assert (=> b!1407754 m!1296797))

(declare-fun m!1296801 () Bool)

(assert (=> b!1407754 m!1296801))

(assert (=> b!1407757 m!1296785))

(assert (=> b!1407757 m!1296785))

(declare-fun m!1296803 () Bool)

(assert (=> b!1407757 m!1296803))

(declare-fun m!1296805 () Bool)

(assert (=> b!1407762 m!1296805))

(assert (=> b!1407759 m!1296785))

(assert (=> b!1407759 m!1296785))

(declare-fun m!1296807 () Bool)

(assert (=> b!1407759 m!1296807))

(declare-fun m!1296809 () Bool)

(assert (=> b!1407758 m!1296809))

(assert (=> b!1407758 m!1296809))

(declare-fun m!1296811 () Bool)

(assert (=> b!1407758 m!1296811))

(declare-fun m!1296813 () Bool)

(assert (=> start!121080 m!1296813))

(declare-fun m!1296815 () Bool)

(assert (=> start!121080 m!1296815))

(push 1)

