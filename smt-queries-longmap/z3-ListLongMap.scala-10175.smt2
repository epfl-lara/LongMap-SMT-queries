; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120164 () Bool)

(assert start!120164)

(declare-fun b!1397776 () Bool)

(declare-fun res!936008 () Bool)

(declare-fun e!791422 () Bool)

(assert (=> b!1397776 (=> (not res!936008) (not e!791422))))

(declare-datatypes ((array!95615 0))(
  ( (array!95616 (arr!46159 (Array (_ BitVec 32) (_ BitVec 64))) (size!46710 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95615)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397776 (= res!936008 (validKeyInArray!0 (select (arr!46159 a!2901) j!112)))))

(declare-fun b!1397777 () Bool)

(declare-fun res!936007 () Bool)

(assert (=> b!1397777 (=> (not res!936007) (not e!791422))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397777 (= res!936007 (validKeyInArray!0 (select (arr!46159 a!2901) i!1037)))))

(declare-fun b!1397778 () Bool)

(declare-fun res!936011 () Bool)

(assert (=> b!1397778 (=> (not res!936011) (not e!791422))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95615 (_ BitVec 32)) Bool)

(assert (=> b!1397778 (= res!936011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397779 () Bool)

(declare-fun e!791423 () Bool)

(assert (=> b!1397779 (= e!791422 (not e!791423))))

(declare-fun res!936012 () Bool)

(assert (=> b!1397779 (=> res!936012 e!791423)))

(declare-datatypes ((SeekEntryResult!10379 0))(
  ( (MissingZero!10379 (index!43887 (_ BitVec 32))) (Found!10379 (index!43888 (_ BitVec 32))) (Intermediate!10379 (undefined!11191 Bool) (index!43889 (_ BitVec 32)) (x!125708 (_ BitVec 32))) (Undefined!10379) (MissingVacant!10379 (index!43890 (_ BitVec 32))) )
))
(declare-fun lt!613982 () SeekEntryResult!10379)

(get-info :version)

(assert (=> b!1397779 (= res!936012 (or (not ((_ is Intermediate!10379) lt!613982)) (undefined!11191 lt!613982)))))

(declare-fun e!791425 () Bool)

(assert (=> b!1397779 e!791425))

(declare-fun res!936013 () Bool)

(assert (=> b!1397779 (=> (not res!936013) (not e!791425))))

(assert (=> b!1397779 (= res!936013 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46789 0))(
  ( (Unit!46790) )
))
(declare-fun lt!613977 () Unit!46789)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46789)

(assert (=> b!1397779 (= lt!613977 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613978 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95615 (_ BitVec 32)) SeekEntryResult!10379)

(assert (=> b!1397779 (= lt!613982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613978 (select (arr!46159 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397779 (= lt!613978 (toIndex!0 (select (arr!46159 a!2901) j!112) mask!2840))))

(declare-fun b!1397780 () Bool)

(declare-fun e!791424 () Bool)

(assert (=> b!1397780 (= e!791424 true)))

(declare-fun lt!613979 () array!95615)

(declare-fun lt!613980 () SeekEntryResult!10379)

(declare-fun lt!613981 () (_ BitVec 64))

(assert (=> b!1397780 (= lt!613980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613978 lt!613981 lt!613979 mask!2840))))

(declare-fun b!1397781 () Bool)

(declare-fun res!936006 () Bool)

(assert (=> b!1397781 (=> (not res!936006) (not e!791422))))

(assert (=> b!1397781 (= res!936006 (and (= (size!46710 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46710 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46710 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!936010 () Bool)

(assert (=> start!120164 (=> (not res!936010) (not e!791422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120164 (= res!936010 (validMask!0 mask!2840))))

(assert (=> start!120164 e!791422))

(assert (=> start!120164 true))

(declare-fun array_inv!35440 (array!95615) Bool)

(assert (=> start!120164 (array_inv!35440 a!2901)))

(declare-fun b!1397782 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95615 (_ BitVec 32)) SeekEntryResult!10379)

(assert (=> b!1397782 (= e!791425 (= (seekEntryOrOpen!0 (select (arr!46159 a!2901) j!112) a!2901 mask!2840) (Found!10379 j!112)))))

(declare-fun b!1397783 () Bool)

(declare-fun res!936009 () Bool)

(assert (=> b!1397783 (=> (not res!936009) (not e!791422))))

(declare-datatypes ((List!32665 0))(
  ( (Nil!32662) (Cons!32661 (h!33911 (_ BitVec 64)) (t!47351 List!32665)) )
))
(declare-fun arrayNoDuplicates!0 (array!95615 (_ BitVec 32) List!32665) Bool)

(assert (=> b!1397783 (= res!936009 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32662))))

(declare-fun b!1397784 () Bool)

(assert (=> b!1397784 (= e!791423 e!791424)))

(declare-fun res!936005 () Bool)

(assert (=> b!1397784 (=> res!936005 e!791424)))

(declare-fun lt!613976 () SeekEntryResult!10379)

(assert (=> b!1397784 (= res!936005 (or (= lt!613982 lt!613976) (not ((_ is Intermediate!10379) lt!613976)) (bvslt (x!125708 lt!613982) #b00000000000000000000000000000000) (bvsgt (x!125708 lt!613982) #b01111111111111111111111111111110) (bvslt lt!613978 #b00000000000000000000000000000000) (bvsge lt!613978 (size!46710 a!2901)) (bvslt (index!43889 lt!613982) #b00000000000000000000000000000000) (bvsge (index!43889 lt!613982) (size!46710 a!2901)) (not (= lt!613982 (Intermediate!10379 false (index!43889 lt!613982) (x!125708 lt!613982)))) (not (= lt!613976 (Intermediate!10379 (undefined!11191 lt!613976) (index!43889 lt!613976) (x!125708 lt!613976))))))))

(assert (=> b!1397784 (= lt!613976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613981 mask!2840) lt!613981 lt!613979 mask!2840))))

(assert (=> b!1397784 (= lt!613981 (select (store (arr!46159 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397784 (= lt!613979 (array!95616 (store (arr!46159 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46710 a!2901)))))

(assert (= (and start!120164 res!936010) b!1397781))

(assert (= (and b!1397781 res!936006) b!1397777))

(assert (= (and b!1397777 res!936007) b!1397776))

(assert (= (and b!1397776 res!936008) b!1397778))

(assert (= (and b!1397778 res!936011) b!1397783))

(assert (= (and b!1397783 res!936009) b!1397779))

(assert (= (and b!1397779 res!936013) b!1397782))

(assert (= (and b!1397779 (not res!936012)) b!1397784))

(assert (= (and b!1397784 (not res!936005)) b!1397780))

(declare-fun m!1284511 () Bool)

(assert (=> b!1397780 m!1284511))

(declare-fun m!1284513 () Bool)

(assert (=> b!1397778 m!1284513))

(declare-fun m!1284515 () Bool)

(assert (=> b!1397779 m!1284515))

(declare-fun m!1284517 () Bool)

(assert (=> b!1397779 m!1284517))

(assert (=> b!1397779 m!1284515))

(declare-fun m!1284519 () Bool)

(assert (=> b!1397779 m!1284519))

(assert (=> b!1397779 m!1284515))

(declare-fun m!1284521 () Bool)

(assert (=> b!1397779 m!1284521))

(declare-fun m!1284523 () Bool)

(assert (=> b!1397779 m!1284523))

(declare-fun m!1284525 () Bool)

(assert (=> b!1397784 m!1284525))

(assert (=> b!1397784 m!1284525))

(declare-fun m!1284527 () Bool)

(assert (=> b!1397784 m!1284527))

(declare-fun m!1284529 () Bool)

(assert (=> b!1397784 m!1284529))

(declare-fun m!1284531 () Bool)

(assert (=> b!1397784 m!1284531))

(declare-fun m!1284533 () Bool)

(assert (=> b!1397777 m!1284533))

(assert (=> b!1397777 m!1284533))

(declare-fun m!1284535 () Bool)

(assert (=> b!1397777 m!1284535))

(assert (=> b!1397776 m!1284515))

(assert (=> b!1397776 m!1284515))

(declare-fun m!1284537 () Bool)

(assert (=> b!1397776 m!1284537))

(declare-fun m!1284539 () Bool)

(assert (=> start!120164 m!1284539))

(declare-fun m!1284541 () Bool)

(assert (=> start!120164 m!1284541))

(declare-fun m!1284543 () Bool)

(assert (=> b!1397783 m!1284543))

(assert (=> b!1397782 m!1284515))

(assert (=> b!1397782 m!1284515))

(declare-fun m!1284545 () Bool)

(assert (=> b!1397782 m!1284545))

(check-sat (not b!1397776) (not b!1397780) (not b!1397782) (not b!1397783) (not b!1397777) (not b!1397778) (not start!120164) (not b!1397779) (not b!1397784))
(check-sat)
