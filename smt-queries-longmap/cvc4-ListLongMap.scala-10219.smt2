; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120370 () Bool)

(assert start!120370)

(declare-fun b!1401113 () Bool)

(declare-fun res!939628 () Bool)

(declare-fun e!793331 () Bool)

(assert (=> b!1401113 (=> (not res!939628) (not e!793331))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95779 0))(
  ( (array!95780 (arr!46240 (Array (_ BitVec 32) (_ BitVec 64))) (size!46790 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95779)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401113 (= res!939628 (and (= (size!46790 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46790 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46790 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401114 () Bool)

(declare-fun e!793326 () Bool)

(declare-fun e!793329 () Bool)

(assert (=> b!1401114 (= e!793326 e!793329)))

(declare-fun res!939631 () Bool)

(assert (=> b!1401114 (=> res!939631 e!793329)))

(declare-datatypes ((SeekEntryResult!10557 0))(
  ( (MissingZero!10557 (index!44605 (_ BitVec 32))) (Found!10557 (index!44606 (_ BitVec 32))) (Intermediate!10557 (undefined!11369 Bool) (index!44607 (_ BitVec 32)) (x!126240 (_ BitVec 32))) (Undefined!10557) (MissingVacant!10557 (index!44608 (_ BitVec 32))) )
))
(declare-fun lt!616694 () SeekEntryResult!10557)

(declare-fun lt!616698 () SeekEntryResult!10557)

(assert (=> b!1401114 (= res!939631 (or (= lt!616694 lt!616698) (not (is-Intermediate!10557 lt!616698))))))

(declare-fun lt!616699 () array!95779)

(declare-fun lt!616701 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95779 (_ BitVec 32)) SeekEntryResult!10557)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401114 (= lt!616698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616701 mask!2840) lt!616701 lt!616699 mask!2840))))

(assert (=> b!1401114 (= lt!616701 (select (store (arr!46240 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401114 (= lt!616699 (array!95780 (store (arr!46240 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46790 a!2901)))))

(declare-fun b!1401115 () Bool)

(declare-fun e!793325 () Bool)

(assert (=> b!1401115 (= e!793325 true)))

(declare-fun lt!616695 () SeekEntryResult!10557)

(declare-fun lt!616697 () (_ BitVec 32))

(assert (=> b!1401115 (= lt!616695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616697 lt!616701 lt!616699 mask!2840))))

(declare-fun b!1401116 () Bool)

(assert (=> b!1401116 (= e!793329 e!793325)))

(declare-fun res!939632 () Bool)

(assert (=> b!1401116 (=> res!939632 e!793325)))

(assert (=> b!1401116 (= res!939632 (or (bvslt (x!126240 lt!616694) #b00000000000000000000000000000000) (bvsgt (x!126240 lt!616694) #b01111111111111111111111111111110) (bvslt (x!126240 lt!616698) #b00000000000000000000000000000000) (bvsgt (x!126240 lt!616698) #b01111111111111111111111111111110) (bvslt lt!616697 #b00000000000000000000000000000000) (bvsge lt!616697 (size!46790 a!2901)) (bvslt (index!44607 lt!616694) #b00000000000000000000000000000000) (bvsge (index!44607 lt!616694) (size!46790 a!2901)) (bvslt (index!44607 lt!616698) #b00000000000000000000000000000000) (bvsge (index!44607 lt!616698) (size!46790 a!2901)) (not (= lt!616694 (Intermediate!10557 false (index!44607 lt!616694) (x!126240 lt!616694)))) (not (= lt!616698 (Intermediate!10557 false (index!44607 lt!616698) (x!126240 lt!616698))))))))

(declare-fun e!793330 () Bool)

(assert (=> b!1401116 e!793330))

(declare-fun res!939627 () Bool)

(assert (=> b!1401116 (=> (not res!939627) (not e!793330))))

(assert (=> b!1401116 (= res!939627 (and (not (undefined!11369 lt!616698)) (= (index!44607 lt!616698) i!1037) (bvslt (x!126240 lt!616698) (x!126240 lt!616694)) (= (select (store (arr!46240 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44607 lt!616698)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47118 0))(
  ( (Unit!47119) )
))
(declare-fun lt!616696 () Unit!47118)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47118)

(assert (=> b!1401116 (= lt!616696 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616697 (x!126240 lt!616694) (index!44607 lt!616694) (x!126240 lt!616698) (index!44607 lt!616698) (undefined!11369 lt!616698) mask!2840))))

(declare-fun b!1401117 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95779 (_ BitVec 32)) SeekEntryResult!10557)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95779 (_ BitVec 32)) SeekEntryResult!10557)

(assert (=> b!1401117 (= e!793330 (= (seekEntryOrOpen!0 lt!616701 lt!616699 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126240 lt!616698) (index!44607 lt!616698) (index!44607 lt!616698) (select (arr!46240 a!2901) j!112) lt!616699 mask!2840)))))

(declare-fun b!1401118 () Bool)

(assert (=> b!1401118 (= e!793331 (not e!793326))))

(declare-fun res!939633 () Bool)

(assert (=> b!1401118 (=> res!939633 e!793326)))

(assert (=> b!1401118 (= res!939633 (or (not (is-Intermediate!10557 lt!616694)) (undefined!11369 lt!616694)))))

(declare-fun e!793327 () Bool)

(assert (=> b!1401118 e!793327))

(declare-fun res!939634 () Bool)

(assert (=> b!1401118 (=> (not res!939634) (not e!793327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95779 (_ BitVec 32)) Bool)

(assert (=> b!1401118 (= res!939634 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616700 () Unit!47118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47118)

(assert (=> b!1401118 (= lt!616700 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401118 (= lt!616694 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616697 (select (arr!46240 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401118 (= lt!616697 (toIndex!0 (select (arr!46240 a!2901) j!112) mask!2840))))

(declare-fun res!939629 () Bool)

(assert (=> start!120370 (=> (not res!939629) (not e!793331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120370 (= res!939629 (validMask!0 mask!2840))))

(assert (=> start!120370 e!793331))

(assert (=> start!120370 true))

(declare-fun array_inv!35268 (array!95779) Bool)

(assert (=> start!120370 (array_inv!35268 a!2901)))

(declare-fun b!1401119 () Bool)

(declare-fun res!939624 () Bool)

(assert (=> b!1401119 (=> (not res!939624) (not e!793331))))

(declare-datatypes ((List!32759 0))(
  ( (Nil!32756) (Cons!32755 (h!34003 (_ BitVec 64)) (t!47453 List!32759)) )
))
(declare-fun arrayNoDuplicates!0 (array!95779 (_ BitVec 32) List!32759) Bool)

(assert (=> b!1401119 (= res!939624 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32756))))

(declare-fun b!1401120 () Bool)

(declare-fun res!939625 () Bool)

(assert (=> b!1401120 (=> (not res!939625) (not e!793331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401120 (= res!939625 (validKeyInArray!0 (select (arr!46240 a!2901) j!112)))))

(declare-fun b!1401121 () Bool)

(assert (=> b!1401121 (= e!793327 (= (seekEntryOrOpen!0 (select (arr!46240 a!2901) j!112) a!2901 mask!2840) (Found!10557 j!112)))))

(declare-fun b!1401122 () Bool)

(declare-fun res!939630 () Bool)

(assert (=> b!1401122 (=> (not res!939630) (not e!793331))))

(assert (=> b!1401122 (= res!939630 (validKeyInArray!0 (select (arr!46240 a!2901) i!1037)))))

(declare-fun b!1401123 () Bool)

(declare-fun res!939626 () Bool)

(assert (=> b!1401123 (=> (not res!939626) (not e!793331))))

(assert (=> b!1401123 (= res!939626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120370 res!939629) b!1401113))

(assert (= (and b!1401113 res!939628) b!1401122))

(assert (= (and b!1401122 res!939630) b!1401120))

(assert (= (and b!1401120 res!939625) b!1401123))

(assert (= (and b!1401123 res!939626) b!1401119))

(assert (= (and b!1401119 res!939624) b!1401118))

(assert (= (and b!1401118 res!939634) b!1401121))

(assert (= (and b!1401118 (not res!939633)) b!1401114))

(assert (= (and b!1401114 (not res!939631)) b!1401116))

(assert (= (and b!1401116 res!939627) b!1401117))

(assert (= (and b!1401116 (not res!939632)) b!1401115))

(declare-fun m!1288789 () Bool)

(assert (=> b!1401117 m!1288789))

(declare-fun m!1288791 () Bool)

(assert (=> b!1401117 m!1288791))

(assert (=> b!1401117 m!1288791))

(declare-fun m!1288793 () Bool)

(assert (=> b!1401117 m!1288793))

(declare-fun m!1288795 () Bool)

(assert (=> b!1401122 m!1288795))

(assert (=> b!1401122 m!1288795))

(declare-fun m!1288797 () Bool)

(assert (=> b!1401122 m!1288797))

(declare-fun m!1288799 () Bool)

(assert (=> b!1401116 m!1288799))

(declare-fun m!1288801 () Bool)

(assert (=> b!1401116 m!1288801))

(declare-fun m!1288803 () Bool)

(assert (=> b!1401116 m!1288803))

(declare-fun m!1288805 () Bool)

(assert (=> start!120370 m!1288805))

(declare-fun m!1288807 () Bool)

(assert (=> start!120370 m!1288807))

(assert (=> b!1401118 m!1288791))

(declare-fun m!1288809 () Bool)

(assert (=> b!1401118 m!1288809))

(assert (=> b!1401118 m!1288791))

(declare-fun m!1288811 () Bool)

(assert (=> b!1401118 m!1288811))

(assert (=> b!1401118 m!1288791))

(declare-fun m!1288813 () Bool)

(assert (=> b!1401118 m!1288813))

(declare-fun m!1288815 () Bool)

(assert (=> b!1401118 m!1288815))

(declare-fun m!1288817 () Bool)

(assert (=> b!1401119 m!1288817))

(assert (=> b!1401121 m!1288791))

(assert (=> b!1401121 m!1288791))

(declare-fun m!1288819 () Bool)

(assert (=> b!1401121 m!1288819))

(declare-fun m!1288821 () Bool)

(assert (=> b!1401123 m!1288821))

(declare-fun m!1288823 () Bool)

(assert (=> b!1401115 m!1288823))

(assert (=> b!1401120 m!1288791))

(assert (=> b!1401120 m!1288791))

(declare-fun m!1288825 () Bool)

(assert (=> b!1401120 m!1288825))

(declare-fun m!1288827 () Bool)

(assert (=> b!1401114 m!1288827))

(assert (=> b!1401114 m!1288827))

(declare-fun m!1288829 () Bool)

(assert (=> b!1401114 m!1288829))

(assert (=> b!1401114 m!1288799))

(declare-fun m!1288831 () Bool)

(assert (=> b!1401114 m!1288831))

(push 1)

