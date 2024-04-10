; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120120 () Bool)

(assert start!120120)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1398589 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!791775 () Bool)

(declare-datatypes ((array!95649 0))(
  ( (array!95650 (arr!46178 (Array (_ BitVec 32) (_ BitVec 64))) (size!46728 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95649)

(declare-datatypes ((SeekEntryResult!10495 0))(
  ( (MissingZero!10495 (index!44351 (_ BitVec 32))) (Found!10495 (index!44352 (_ BitVec 32))) (Intermediate!10495 (undefined!11307 Bool) (index!44353 (_ BitVec 32)) (x!125997 (_ BitVec 32))) (Undefined!10495) (MissingVacant!10495 (index!44354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95649 (_ BitVec 32)) SeekEntryResult!10495)

(assert (=> b!1398589 (= e!791775 (= (seekEntryOrOpen!0 (select (arr!46178 a!2901) j!112) a!2901 mask!2840) (Found!10495 j!112)))))

(declare-fun b!1398590 () Bool)

(declare-fun e!791776 () Bool)

(declare-fun e!791773 () Bool)

(assert (=> b!1398590 (= e!791776 (not e!791773))))

(declare-fun res!937506 () Bool)

(assert (=> b!1398590 (=> res!937506 e!791773)))

(declare-fun lt!615025 () SeekEntryResult!10495)

(assert (=> b!1398590 (= res!937506 (or (not (is-Intermediate!10495 lt!615025)) (undefined!11307 lt!615025)))))

(assert (=> b!1398590 e!791775))

(declare-fun res!937503 () Bool)

(assert (=> b!1398590 (=> (not res!937503) (not e!791775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95649 (_ BitVec 32)) Bool)

(assert (=> b!1398590 (= res!937503 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46994 0))(
  ( (Unit!46995) )
))
(declare-fun lt!615028 () Unit!46994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46994)

(assert (=> b!1398590 (= lt!615028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615029 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95649 (_ BitVec 32)) SeekEntryResult!10495)

(assert (=> b!1398590 (= lt!615025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615029 (select (arr!46178 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398590 (= lt!615029 (toIndex!0 (select (arr!46178 a!2901) j!112) mask!2840))))

(declare-fun b!1398591 () Bool)

(declare-fun res!937509 () Bool)

(assert (=> b!1398591 (=> (not res!937509) (not e!791776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398591 (= res!937509 (validKeyInArray!0 (select (arr!46178 a!2901) j!112)))))

(declare-fun res!937502 () Bool)

(assert (=> start!120120 (=> (not res!937502) (not e!791776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120120 (= res!937502 (validMask!0 mask!2840))))

(assert (=> start!120120 e!791776))

(assert (=> start!120120 true))

(declare-fun array_inv!35206 (array!95649) Bool)

(assert (=> start!120120 (array_inv!35206 a!2901)))

(declare-fun b!1398592 () Bool)

(declare-fun e!791774 () Bool)

(declare-fun lt!615026 () SeekEntryResult!10495)

(assert (=> b!1398592 (= e!791774 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge (index!44353 lt!615026) #b00000000000000000000000000000000) (bvslt (index!44353 lt!615026) (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398592 (and (not (undefined!11307 lt!615026)) (= (index!44353 lt!615026) i!1037) (bvslt (x!125997 lt!615026) (x!125997 lt!615025)) (= (select (store (arr!46178 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44353 lt!615026)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615030 () Unit!46994)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46994)

(assert (=> b!1398592 (= lt!615030 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615029 (x!125997 lt!615025) (index!44353 lt!615025) (x!125997 lt!615026) (index!44353 lt!615026) (undefined!11307 lt!615026) mask!2840))))

(declare-fun b!1398593 () Bool)

(declare-fun res!937510 () Bool)

(assert (=> b!1398593 (=> (not res!937510) (not e!791776))))

(assert (=> b!1398593 (= res!937510 (validKeyInArray!0 (select (arr!46178 a!2901) i!1037)))))

(declare-fun b!1398594 () Bool)

(declare-fun res!937508 () Bool)

(assert (=> b!1398594 (=> (not res!937508) (not e!791776))))

(assert (=> b!1398594 (= res!937508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398595 () Bool)

(assert (=> b!1398595 (= e!791773 e!791774)))

(declare-fun res!937504 () Bool)

(assert (=> b!1398595 (=> res!937504 e!791774)))

(assert (=> b!1398595 (= res!937504 (or (= lt!615025 lt!615026) (not (is-Intermediate!10495 lt!615026))))))

(declare-fun lt!615027 () (_ BitVec 64))

(assert (=> b!1398595 (= lt!615026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615027 mask!2840) lt!615027 (array!95650 (store (arr!46178 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46728 a!2901)) mask!2840))))

(assert (=> b!1398595 (= lt!615027 (select (store (arr!46178 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398596 () Bool)

(declare-fun res!937505 () Bool)

(assert (=> b!1398596 (=> (not res!937505) (not e!791776))))

(declare-datatypes ((List!32697 0))(
  ( (Nil!32694) (Cons!32693 (h!33935 (_ BitVec 64)) (t!47391 List!32697)) )
))
(declare-fun arrayNoDuplicates!0 (array!95649 (_ BitVec 32) List!32697) Bool)

(assert (=> b!1398596 (= res!937505 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32694))))

(declare-fun b!1398597 () Bool)

(declare-fun res!937507 () Bool)

(assert (=> b!1398597 (=> (not res!937507) (not e!791776))))

(assert (=> b!1398597 (= res!937507 (and (= (size!46728 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46728 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46728 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120120 res!937502) b!1398597))

(assert (= (and b!1398597 res!937507) b!1398593))

(assert (= (and b!1398593 res!937510) b!1398591))

(assert (= (and b!1398591 res!937509) b!1398594))

(assert (= (and b!1398594 res!937508) b!1398596))

(assert (= (and b!1398596 res!937505) b!1398590))

(assert (= (and b!1398590 res!937503) b!1398589))

(assert (= (and b!1398590 (not res!937506)) b!1398595))

(assert (= (and b!1398595 (not res!937504)) b!1398592))

(declare-fun m!1285779 () Bool)

(assert (=> b!1398593 m!1285779))

(assert (=> b!1398593 m!1285779))

(declare-fun m!1285781 () Bool)

(assert (=> b!1398593 m!1285781))

(declare-fun m!1285783 () Bool)

(assert (=> b!1398595 m!1285783))

(declare-fun m!1285785 () Bool)

(assert (=> b!1398595 m!1285785))

(assert (=> b!1398595 m!1285783))

(declare-fun m!1285787 () Bool)

(assert (=> b!1398595 m!1285787))

(declare-fun m!1285789 () Bool)

(assert (=> b!1398595 m!1285789))

(declare-fun m!1285791 () Bool)

(assert (=> b!1398589 m!1285791))

(assert (=> b!1398589 m!1285791))

(declare-fun m!1285793 () Bool)

(assert (=> b!1398589 m!1285793))

(declare-fun m!1285795 () Bool)

(assert (=> b!1398594 m!1285795))

(assert (=> b!1398590 m!1285791))

(declare-fun m!1285797 () Bool)

(assert (=> b!1398590 m!1285797))

(assert (=> b!1398590 m!1285791))

(declare-fun m!1285799 () Bool)

(assert (=> b!1398590 m!1285799))

(declare-fun m!1285801 () Bool)

(assert (=> b!1398590 m!1285801))

(assert (=> b!1398590 m!1285791))

(declare-fun m!1285803 () Bool)

(assert (=> b!1398590 m!1285803))

(declare-fun m!1285805 () Bool)

(assert (=> start!120120 m!1285805))

(declare-fun m!1285807 () Bool)

(assert (=> start!120120 m!1285807))

(declare-fun m!1285809 () Bool)

(assert (=> b!1398596 m!1285809))

(assert (=> b!1398591 m!1285791))

(assert (=> b!1398591 m!1285791))

(declare-fun m!1285811 () Bool)

(assert (=> b!1398591 m!1285811))

(assert (=> b!1398592 m!1285785))

(declare-fun m!1285813 () Bool)

(assert (=> b!1398592 m!1285813))

(declare-fun m!1285815 () Bool)

(assert (=> b!1398592 m!1285815))

(push 1)

(assert (not b!1398594))

(assert (not b!1398589))

(assert (not b!1398596))

(assert (not b!1398590))

(assert (not b!1398591))

(assert (not start!120120))

(assert (not b!1398593))

(assert (not b!1398595))

(assert (not b!1398592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

