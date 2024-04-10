; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120508 () Bool)

(assert start!120508)

(declare-fun b!1403222 () Bool)

(declare-fun res!941736 () Bool)

(declare-fun e!794534 () Bool)

(assert (=> b!1403222 (=> (not res!941736) (not e!794534))))

(declare-datatypes ((array!95917 0))(
  ( (array!95918 (arr!46309 (Array (_ BitVec 32) (_ BitVec 64))) (size!46859 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95917)

(declare-datatypes ((List!32828 0))(
  ( (Nil!32825) (Cons!32824 (h!34072 (_ BitVec 64)) (t!47522 List!32828)) )
))
(declare-fun arrayNoDuplicates!0 (array!95917 (_ BitVec 32) List!32828) Bool)

(assert (=> b!1403222 (= res!941736 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32825))))

(declare-fun b!1403223 () Bool)

(declare-fun e!794535 () Bool)

(assert (=> b!1403223 (= e!794535 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10626 0))(
  ( (MissingZero!10626 (index!44881 (_ BitVec 32))) (Found!10626 (index!44882 (_ BitVec 32))) (Intermediate!10626 (undefined!11438 Bool) (index!44883 (_ BitVec 32)) (x!126493 (_ BitVec 32))) (Undefined!10626) (MissingVacant!10626 (index!44884 (_ BitVec 32))) )
))
(declare-fun lt!618321 () SeekEntryResult!10626)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95917 (_ BitVec 32)) SeekEntryResult!10626)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403223 (= lt!618321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46309 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46309 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95918 (store (arr!46309 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46859 a!2901)) mask!2840))))

(declare-fun res!941737 () Bool)

(assert (=> start!120508 (=> (not res!941737) (not e!794534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120508 (= res!941737 (validMask!0 mask!2840))))

(assert (=> start!120508 e!794534))

(assert (=> start!120508 true))

(declare-fun array_inv!35337 (array!95917) Bool)

(assert (=> start!120508 (array_inv!35337 a!2901)))

(declare-fun b!1403224 () Bool)

(declare-fun res!941734 () Bool)

(assert (=> b!1403224 (=> (not res!941734) (not e!794534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95917 (_ BitVec 32)) Bool)

(assert (=> b!1403224 (= res!941734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403225 () Bool)

(declare-fun res!941739 () Bool)

(assert (=> b!1403225 (=> (not res!941739) (not e!794534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403225 (= res!941739 (validKeyInArray!0 (select (arr!46309 a!2901) j!112)))))

(declare-fun b!1403226 () Bool)

(declare-fun res!941740 () Bool)

(assert (=> b!1403226 (=> (not res!941740) (not e!794534))))

(assert (=> b!1403226 (= res!941740 (and (= (size!46859 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46859 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46859 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403227 () Bool)

(declare-fun e!794537 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95917 (_ BitVec 32)) SeekEntryResult!10626)

(assert (=> b!1403227 (= e!794537 (= (seekEntryOrOpen!0 (select (arr!46309 a!2901) j!112) a!2901 mask!2840) (Found!10626 j!112)))))

(declare-fun b!1403228 () Bool)

(declare-fun res!941733 () Bool)

(assert (=> b!1403228 (=> (not res!941733) (not e!794534))))

(assert (=> b!1403228 (= res!941733 (validKeyInArray!0 (select (arr!46309 a!2901) i!1037)))))

(declare-fun b!1403229 () Bool)

(assert (=> b!1403229 (= e!794534 (not e!794535))))

(declare-fun res!941738 () Bool)

(assert (=> b!1403229 (=> res!941738 e!794535)))

(declare-fun lt!618320 () SeekEntryResult!10626)

(assert (=> b!1403229 (= res!941738 (or (not (is-Intermediate!10626 lt!618320)) (undefined!11438 lt!618320)))))

(assert (=> b!1403229 e!794537))

(declare-fun res!941735 () Bool)

(assert (=> b!1403229 (=> (not res!941735) (not e!794537))))

(assert (=> b!1403229 (= res!941735 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47256 0))(
  ( (Unit!47257) )
))
(declare-fun lt!618319 () Unit!47256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47256)

(assert (=> b!1403229 (= lt!618319 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403229 (= lt!618320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46309 a!2901) j!112) mask!2840) (select (arr!46309 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120508 res!941737) b!1403226))

(assert (= (and b!1403226 res!941740) b!1403228))

(assert (= (and b!1403228 res!941733) b!1403225))

(assert (= (and b!1403225 res!941739) b!1403224))

(assert (= (and b!1403224 res!941734) b!1403222))

(assert (= (and b!1403222 res!941736) b!1403229))

(assert (= (and b!1403229 res!941735) b!1403227))

(assert (= (and b!1403229 (not res!941738)) b!1403223))

(declare-fun m!1291769 () Bool)

(assert (=> b!1403224 m!1291769))

(declare-fun m!1291771 () Bool)

(assert (=> b!1403223 m!1291771))

(declare-fun m!1291773 () Bool)

(assert (=> b!1403223 m!1291773))

(assert (=> b!1403223 m!1291773))

(declare-fun m!1291775 () Bool)

(assert (=> b!1403223 m!1291775))

(assert (=> b!1403223 m!1291775))

(assert (=> b!1403223 m!1291773))

(declare-fun m!1291777 () Bool)

(assert (=> b!1403223 m!1291777))

(declare-fun m!1291779 () Bool)

(assert (=> b!1403228 m!1291779))

(assert (=> b!1403228 m!1291779))

(declare-fun m!1291781 () Bool)

(assert (=> b!1403228 m!1291781))

(declare-fun m!1291783 () Bool)

(assert (=> b!1403222 m!1291783))

(declare-fun m!1291785 () Bool)

(assert (=> b!1403225 m!1291785))

(assert (=> b!1403225 m!1291785))

(declare-fun m!1291787 () Bool)

(assert (=> b!1403225 m!1291787))

(assert (=> b!1403227 m!1291785))

(assert (=> b!1403227 m!1291785))

(declare-fun m!1291789 () Bool)

(assert (=> b!1403227 m!1291789))

(declare-fun m!1291791 () Bool)

(assert (=> start!120508 m!1291791))

(declare-fun m!1291793 () Bool)

(assert (=> start!120508 m!1291793))

(assert (=> b!1403229 m!1291785))

(declare-fun m!1291795 () Bool)

(assert (=> b!1403229 m!1291795))

(assert (=> b!1403229 m!1291785))

(declare-fun m!1291797 () Bool)

(assert (=> b!1403229 m!1291797))

(assert (=> b!1403229 m!1291795))

(assert (=> b!1403229 m!1291785))

(declare-fun m!1291799 () Bool)

(assert (=> b!1403229 m!1291799))

(declare-fun m!1291801 () Bool)

(assert (=> b!1403229 m!1291801))

(push 1)

(assert (not b!1403223))

(assert (not start!120508))

(assert (not b!1403228))

(assert (not b!1403224))

(assert (not b!1403222))

(assert (not b!1403229))

(assert (not b!1403225))

(assert (not b!1403227))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

