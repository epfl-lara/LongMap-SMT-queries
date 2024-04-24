; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122382 () Bool)

(assert start!122382)

(declare-fun b!1418691 () Bool)

(declare-fun res!953741 () Bool)

(declare-fun e!802997 () Bool)

(assert (=> b!1418691 (=> (not res!953741) (not e!802997))))

(declare-datatypes ((array!96888 0))(
  ( (array!96889 (arr!46770 (Array (_ BitVec 32) (_ BitVec 64))) (size!47321 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96888)

(declare-datatypes ((List!33276 0))(
  ( (Nil!33273) (Cons!33272 (h!34573 (_ BitVec 64)) (t!47962 List!33276)) )
))
(declare-fun arrayNoDuplicates!0 (array!96888 (_ BitVec 32) List!33276) Bool)

(assert (=> b!1418691 (= res!953741 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33273))))

(declare-fun b!1418692 () Bool)

(declare-fun res!953737 () Bool)

(assert (=> b!1418692 (=> (not res!953737) (not e!802997))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1418692 (= res!953737 (and (= (size!47321 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47321 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47321 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1418693 () Bool)

(declare-fun res!953739 () Bool)

(assert (=> b!1418693 (=> (not res!953739) (not e!802997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418693 (= res!953739 (validKeyInArray!0 (select (arr!46770 a!2901) j!112)))))

(declare-fun res!953740 () Bool)

(assert (=> start!122382 (=> (not res!953740) (not e!802997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122382 (= res!953740 (validMask!0 mask!2840))))

(assert (=> start!122382 e!802997))

(assert (=> start!122382 true))

(declare-fun array_inv!36051 (array!96888) Bool)

(assert (=> start!122382 (array_inv!36051 a!2901)))

(declare-fun b!1418694 () Bool)

(declare-fun res!953742 () Bool)

(assert (=> b!1418694 (=> (not res!953742) (not e!802997))))

(assert (=> b!1418694 (= res!953742 (validKeyInArray!0 (select (arr!46770 a!2901) i!1037)))))

(declare-fun b!1418695 () Bool)

(declare-fun res!953738 () Bool)

(assert (=> b!1418695 (=> (not res!953738) (not e!802997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96888 (_ BitVec 32)) Bool)

(assert (=> b!1418695 (= res!953738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1418696 () Bool)

(assert (=> b!1418696 (= e!802997 (not true))))

(declare-fun e!802996 () Bool)

(assert (=> b!1418696 e!802996))

(declare-fun res!953743 () Bool)

(assert (=> b!1418696 (=> (not res!953743) (not e!802996))))

(assert (=> b!1418696 (= res!953743 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47969 0))(
  ( (Unit!47970) )
))
(declare-fun lt!625801 () Unit!47969)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47969)

(assert (=> b!1418696 (= lt!625801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10984 0))(
  ( (MissingZero!10984 (index!46328 (_ BitVec 32))) (Found!10984 (index!46329 (_ BitVec 32))) (Intermediate!10984 (undefined!11796 Bool) (index!46330 (_ BitVec 32)) (x!128078 (_ BitVec 32))) (Undefined!10984) (MissingVacant!10984 (index!46331 (_ BitVec 32))) )
))
(declare-fun lt!625802 () SeekEntryResult!10984)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96888 (_ BitVec 32)) SeekEntryResult!10984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418696 (= lt!625802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46770 a!2901) j!112) mask!2840) (select (arr!46770 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1418697 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96888 (_ BitVec 32)) SeekEntryResult!10984)

(assert (=> b!1418697 (= e!802996 (= (seekEntryOrOpen!0 (select (arr!46770 a!2901) j!112) a!2901 mask!2840) (Found!10984 j!112)))))

(assert (= (and start!122382 res!953740) b!1418692))

(assert (= (and b!1418692 res!953737) b!1418694))

(assert (= (and b!1418694 res!953742) b!1418693))

(assert (= (and b!1418693 res!953739) b!1418695))

(assert (= (and b!1418695 res!953738) b!1418691))

(assert (= (and b!1418691 res!953741) b!1418696))

(assert (= (and b!1418696 res!953743) b!1418697))

(declare-fun m!1309667 () Bool)

(assert (=> b!1418695 m!1309667))

(declare-fun m!1309669 () Bool)

(assert (=> b!1418691 m!1309669))

(declare-fun m!1309671 () Bool)

(assert (=> start!122382 m!1309671))

(declare-fun m!1309673 () Bool)

(assert (=> start!122382 m!1309673))

(declare-fun m!1309675 () Bool)

(assert (=> b!1418694 m!1309675))

(assert (=> b!1418694 m!1309675))

(declare-fun m!1309677 () Bool)

(assert (=> b!1418694 m!1309677))

(declare-fun m!1309679 () Bool)

(assert (=> b!1418697 m!1309679))

(assert (=> b!1418697 m!1309679))

(declare-fun m!1309681 () Bool)

(assert (=> b!1418697 m!1309681))

(assert (=> b!1418696 m!1309679))

(declare-fun m!1309683 () Bool)

(assert (=> b!1418696 m!1309683))

(assert (=> b!1418696 m!1309679))

(declare-fun m!1309685 () Bool)

(assert (=> b!1418696 m!1309685))

(assert (=> b!1418696 m!1309683))

(assert (=> b!1418696 m!1309679))

(declare-fun m!1309687 () Bool)

(assert (=> b!1418696 m!1309687))

(declare-fun m!1309689 () Bool)

(assert (=> b!1418696 m!1309689))

(assert (=> b!1418693 m!1309679))

(assert (=> b!1418693 m!1309679))

(declare-fun m!1309691 () Bool)

(assert (=> b!1418693 m!1309691))

(push 1)

(assert (not b!1418693))

(assert (not b!1418691))

(assert (not b!1418695))

(assert (not start!122382))

(assert (not b!1418694))

(assert (not b!1418697))

(assert (not b!1418696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

