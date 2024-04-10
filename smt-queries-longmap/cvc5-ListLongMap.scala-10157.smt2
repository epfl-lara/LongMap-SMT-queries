; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119706 () Bool)

(assert start!119706)

(declare-fun b!1394440 () Bool)

(declare-fun res!933854 () Bool)

(declare-fun e!789504 () Bool)

(assert (=> b!1394440 (=> (not res!933854) (not e!789504))))

(declare-datatypes ((array!95388 0))(
  ( (array!95389 (arr!46052 (Array (_ BitVec 32) (_ BitVec 64))) (size!46602 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95388)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394440 (= res!933854 (validKeyInArray!0 (select (arr!46052 a!2901) i!1037)))))

(declare-fun b!1394441 () Bool)

(declare-fun res!933851 () Bool)

(declare-fun e!789506 () Bool)

(assert (=> b!1394441 (=> res!933851 e!789506)))

(declare-fun lt!612477 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10369 0))(
  ( (MissingZero!10369 (index!43847 (_ BitVec 32))) (Found!10369 (index!43848 (_ BitVec 32))) (Intermediate!10369 (undefined!11181 Bool) (index!43849 (_ BitVec 32)) (x!125517 (_ BitVec 32))) (Undefined!10369) (MissingVacant!10369 (index!43850 (_ BitVec 32))) )
))
(declare-fun lt!612476 () SeekEntryResult!10369)

(assert (=> b!1394441 (= res!933851 (or (bvslt (x!125517 lt!612476) #b00000000000000000000000000000000) (bvsgt (x!125517 lt!612476) #b01111111111111111111111111111110) (bvslt lt!612477 #b00000000000000000000000000000000) (bvsge lt!612477 (size!46602 a!2901)) (bvslt (index!43849 lt!612476) #b00000000000000000000000000000000) (bvsge (index!43849 lt!612476) (size!46602 a!2901)) (not (= lt!612476 (Intermediate!10369 false (index!43849 lt!612476) (x!125517 lt!612476))))))))

(declare-fun res!933852 () Bool)

(assert (=> start!119706 (=> (not res!933852) (not e!789504))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119706 (= res!933852 (validMask!0 mask!2840))))

(assert (=> start!119706 e!789504))

(assert (=> start!119706 true))

(declare-fun array_inv!35080 (array!95388) Bool)

(assert (=> start!119706 (array_inv!35080 a!2901)))

(declare-fun b!1394442 () Bool)

(declare-fun res!933853 () Bool)

(assert (=> b!1394442 (=> (not res!933853) (not e!789504))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394442 (= res!933853 (and (= (size!46602 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46602 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46602 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394443 () Bool)

(declare-fun res!933850 () Bool)

(assert (=> b!1394443 (=> (not res!933850) (not e!789504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95388 (_ BitVec 32)) Bool)

(assert (=> b!1394443 (= res!933850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394444 () Bool)

(declare-fun e!789503 () Bool)

(assert (=> b!1394444 (= e!789504 (not e!789503))))

(declare-fun res!933848 () Bool)

(assert (=> b!1394444 (=> res!933848 e!789503)))

(assert (=> b!1394444 (= res!933848 (or (not (is-Intermediate!10369 lt!612476)) (undefined!11181 lt!612476)))))

(declare-fun lt!612471 () SeekEntryResult!10369)

(assert (=> b!1394444 (= lt!612471 (Found!10369 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95388 (_ BitVec 32)) SeekEntryResult!10369)

(assert (=> b!1394444 (= lt!612471 (seekEntryOrOpen!0 (select (arr!46052 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394444 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46742 0))(
  ( (Unit!46743) )
))
(declare-fun lt!612473 () Unit!46742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46742)

(assert (=> b!1394444 (= lt!612473 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95388 (_ BitVec 32)) SeekEntryResult!10369)

(assert (=> b!1394444 (= lt!612476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612477 (select (arr!46052 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394444 (= lt!612477 (toIndex!0 (select (arr!46052 a!2901) j!112) mask!2840))))

(declare-fun b!1394445 () Bool)

(declare-fun res!933856 () Bool)

(assert (=> b!1394445 (=> (not res!933856) (not e!789504))))

(assert (=> b!1394445 (= res!933856 (validKeyInArray!0 (select (arr!46052 a!2901) j!112)))))

(declare-fun b!1394446 () Bool)

(declare-fun res!933849 () Bool)

(assert (=> b!1394446 (=> (not res!933849) (not e!789504))))

(declare-datatypes ((List!32571 0))(
  ( (Nil!32568) (Cons!32567 (h!33800 (_ BitVec 64)) (t!47265 List!32571)) )
))
(declare-fun arrayNoDuplicates!0 (array!95388 (_ BitVec 32) List!32571) Bool)

(assert (=> b!1394446 (= res!933849 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32568))))

(declare-fun b!1394447 () Bool)

(assert (=> b!1394447 (= e!789503 e!789506)))

(declare-fun res!933855 () Bool)

(assert (=> b!1394447 (=> res!933855 e!789506)))

(declare-fun lt!612472 () (_ BitVec 64))

(declare-fun lt!612475 () array!95388)

(assert (=> b!1394447 (= res!933855 (not (= lt!612476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612472 mask!2840) lt!612472 lt!612475 mask!2840))))))

(assert (=> b!1394447 (= lt!612472 (select (store (arr!46052 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394447 (= lt!612475 (array!95389 (store (arr!46052 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46602 a!2901)))))

(declare-fun b!1394448 () Bool)

(assert (=> b!1394448 (= e!789506 true)))

(assert (=> b!1394448 (= lt!612471 (seekEntryOrOpen!0 lt!612472 lt!612475 mask!2840))))

(declare-fun lt!612474 () Unit!46742)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46742)

(assert (=> b!1394448 (= lt!612474 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612477 (x!125517 lt!612476) (index!43849 lt!612476) mask!2840))))

(assert (= (and start!119706 res!933852) b!1394442))

(assert (= (and b!1394442 res!933853) b!1394440))

(assert (= (and b!1394440 res!933854) b!1394445))

(assert (= (and b!1394445 res!933856) b!1394443))

(assert (= (and b!1394443 res!933850) b!1394446))

(assert (= (and b!1394446 res!933849) b!1394444))

(assert (= (and b!1394444 (not res!933848)) b!1394447))

(assert (= (and b!1394447 (not res!933855)) b!1394441))

(assert (= (and b!1394441 (not res!933851)) b!1394448))

(declare-fun m!1280763 () Bool)

(assert (=> b!1394443 m!1280763))

(declare-fun m!1280765 () Bool)

(assert (=> b!1394448 m!1280765))

(declare-fun m!1280767 () Bool)

(assert (=> b!1394448 m!1280767))

(declare-fun m!1280769 () Bool)

(assert (=> b!1394444 m!1280769))

(declare-fun m!1280771 () Bool)

(assert (=> b!1394444 m!1280771))

(assert (=> b!1394444 m!1280769))

(declare-fun m!1280773 () Bool)

(assert (=> b!1394444 m!1280773))

(assert (=> b!1394444 m!1280769))

(declare-fun m!1280775 () Bool)

(assert (=> b!1394444 m!1280775))

(assert (=> b!1394444 m!1280769))

(declare-fun m!1280777 () Bool)

(assert (=> b!1394444 m!1280777))

(declare-fun m!1280779 () Bool)

(assert (=> b!1394444 m!1280779))

(assert (=> b!1394445 m!1280769))

(assert (=> b!1394445 m!1280769))

(declare-fun m!1280781 () Bool)

(assert (=> b!1394445 m!1280781))

(declare-fun m!1280783 () Bool)

(assert (=> b!1394446 m!1280783))

(declare-fun m!1280785 () Bool)

(assert (=> b!1394440 m!1280785))

(assert (=> b!1394440 m!1280785))

(declare-fun m!1280787 () Bool)

(assert (=> b!1394440 m!1280787))

(declare-fun m!1280789 () Bool)

(assert (=> b!1394447 m!1280789))

(assert (=> b!1394447 m!1280789))

(declare-fun m!1280791 () Bool)

(assert (=> b!1394447 m!1280791))

(declare-fun m!1280793 () Bool)

(assert (=> b!1394447 m!1280793))

(declare-fun m!1280795 () Bool)

(assert (=> b!1394447 m!1280795))

(declare-fun m!1280797 () Bool)

(assert (=> start!119706 m!1280797))

(declare-fun m!1280799 () Bool)

(assert (=> start!119706 m!1280799))

(push 1)

