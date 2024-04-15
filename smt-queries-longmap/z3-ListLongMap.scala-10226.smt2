; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120404 () Bool)

(assert start!120404)

(declare-fun b!1401659 () Bool)

(declare-fun res!940223 () Bool)

(declare-fun e!793691 () Bool)

(assert (=> b!1401659 (=> (not res!940223) (not e!793691))))

(declare-datatypes ((array!95766 0))(
  ( (array!95767 (arr!46234 (Array (_ BitVec 32) (_ BitVec 64))) (size!46786 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95766)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401659 (= res!940223 (validKeyInArray!0 (select (arr!46234 a!2901) i!1037)))))

(declare-fun b!1401660 () Bool)

(declare-fun e!793685 () Bool)

(declare-fun e!793687 () Bool)

(assert (=> b!1401660 (= e!793685 e!793687)))

(declare-fun res!940221 () Bool)

(assert (=> b!1401660 (=> res!940221 e!793687)))

(declare-datatypes ((SeekEntryResult!10577 0))(
  ( (MissingZero!10577 (index!44685 (_ BitVec 32))) (Found!10577 (index!44686 (_ BitVec 32))) (Intermediate!10577 (undefined!11389 Bool) (index!44687 (_ BitVec 32)) (x!126313 (_ BitVec 32))) (Undefined!10577) (MissingVacant!10577 (index!44688 (_ BitVec 32))) )
))
(declare-fun lt!616963 () SeekEntryResult!10577)

(declare-fun lt!616960 () SeekEntryResult!10577)

(get-info :version)

(assert (=> b!1401660 (= res!940221 (or (= lt!616963 lt!616960) (not ((_ is Intermediate!10577) lt!616960))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616967 () array!95766)

(declare-fun lt!616966 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95766 (_ BitVec 32)) SeekEntryResult!10577)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401660 (= lt!616960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616966 mask!2840) lt!616966 lt!616967 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401660 (= lt!616966 (select (store (arr!46234 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401660 (= lt!616967 (array!95767 (store (arr!46234 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46786 a!2901)))))

(declare-fun b!1401661 () Bool)

(declare-fun res!940227 () Bool)

(assert (=> b!1401661 (=> (not res!940227) (not e!793691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95766 (_ BitVec 32)) Bool)

(assert (=> b!1401661 (= res!940227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401662 () Bool)

(declare-fun e!793688 () Bool)

(assert (=> b!1401662 (= e!793688 true)))

(declare-fun lt!616961 () (_ BitVec 32))

(declare-fun lt!616964 () SeekEntryResult!10577)

(assert (=> b!1401662 (= lt!616964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616961 lt!616966 lt!616967 mask!2840))))

(declare-fun b!1401663 () Bool)

(declare-fun res!940226 () Bool)

(assert (=> b!1401663 (=> (not res!940226) (not e!793691))))

(declare-datatypes ((List!32831 0))(
  ( (Nil!32828) (Cons!32827 (h!34075 (_ BitVec 64)) (t!47517 List!32831)) )
))
(declare-fun arrayNoDuplicates!0 (array!95766 (_ BitVec 32) List!32831) Bool)

(assert (=> b!1401663 (= res!940226 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32828))))

(declare-fun b!1401664 () Bool)

(declare-fun res!940228 () Bool)

(assert (=> b!1401664 (=> (not res!940228) (not e!793691))))

(assert (=> b!1401664 (= res!940228 (validKeyInArray!0 (select (arr!46234 a!2901) j!112)))))

(declare-fun res!940231 () Bool)

(assert (=> start!120404 (=> (not res!940231) (not e!793691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120404 (= res!940231 (validMask!0 mask!2840))))

(assert (=> start!120404 e!793691))

(assert (=> start!120404 true))

(declare-fun array_inv!35467 (array!95766) Bool)

(assert (=> start!120404 (array_inv!35467 a!2901)))

(declare-fun b!1401665 () Bool)

(assert (=> b!1401665 (= e!793691 (not e!793685))))

(declare-fun res!940225 () Bool)

(assert (=> b!1401665 (=> res!940225 e!793685)))

(assert (=> b!1401665 (= res!940225 (or (not ((_ is Intermediate!10577) lt!616963)) (undefined!11389 lt!616963)))))

(declare-fun e!793689 () Bool)

(assert (=> b!1401665 e!793689))

(declare-fun res!940230 () Bool)

(assert (=> b!1401665 (=> (not res!940230) (not e!793689))))

(assert (=> b!1401665 (= res!940230 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47001 0))(
  ( (Unit!47002) )
))
(declare-fun lt!616962 () Unit!47001)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47001)

(assert (=> b!1401665 (= lt!616962 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401665 (= lt!616963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616961 (select (arr!46234 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401665 (= lt!616961 (toIndex!0 (select (arr!46234 a!2901) j!112) mask!2840))))

(declare-fun b!1401666 () Bool)

(declare-fun res!940229 () Bool)

(assert (=> b!1401666 (=> (not res!940229) (not e!793691))))

(assert (=> b!1401666 (= res!940229 (and (= (size!46786 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46786 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46786 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401667 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95766 (_ BitVec 32)) SeekEntryResult!10577)

(assert (=> b!1401667 (= e!793689 (= (seekEntryOrOpen!0 (select (arr!46234 a!2901) j!112) a!2901 mask!2840) (Found!10577 j!112)))))

(declare-fun b!1401668 () Bool)

(assert (=> b!1401668 (= e!793687 e!793688)))

(declare-fun res!940224 () Bool)

(assert (=> b!1401668 (=> res!940224 e!793688)))

(assert (=> b!1401668 (= res!940224 (or (bvslt (x!126313 lt!616963) #b00000000000000000000000000000000) (bvsgt (x!126313 lt!616963) #b01111111111111111111111111111110) (bvslt (x!126313 lt!616960) #b00000000000000000000000000000000) (bvsgt (x!126313 lt!616960) #b01111111111111111111111111111110) (bvslt lt!616961 #b00000000000000000000000000000000) (bvsge lt!616961 (size!46786 a!2901)) (bvslt (index!44687 lt!616963) #b00000000000000000000000000000000) (bvsge (index!44687 lt!616963) (size!46786 a!2901)) (bvslt (index!44687 lt!616960) #b00000000000000000000000000000000) (bvsge (index!44687 lt!616960) (size!46786 a!2901)) (not (= lt!616963 (Intermediate!10577 false (index!44687 lt!616963) (x!126313 lt!616963)))) (not (= lt!616960 (Intermediate!10577 false (index!44687 lt!616960) (x!126313 lt!616960))))))))

(declare-fun e!793686 () Bool)

(assert (=> b!1401668 e!793686))

(declare-fun res!940222 () Bool)

(assert (=> b!1401668 (=> (not res!940222) (not e!793686))))

(assert (=> b!1401668 (= res!940222 (and (not (undefined!11389 lt!616960)) (= (index!44687 lt!616960) i!1037) (bvslt (x!126313 lt!616960) (x!126313 lt!616963)) (= (select (store (arr!46234 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44687 lt!616960)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616965 () Unit!47001)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47001)

(assert (=> b!1401668 (= lt!616965 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616961 (x!126313 lt!616963) (index!44687 lt!616963) (x!126313 lt!616960) (index!44687 lt!616960) (undefined!11389 lt!616960) mask!2840))))

(declare-fun b!1401669 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95766 (_ BitVec 32)) SeekEntryResult!10577)

(assert (=> b!1401669 (= e!793686 (= (seekEntryOrOpen!0 lt!616966 lt!616967 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126313 lt!616960) (index!44687 lt!616960) (index!44687 lt!616960) (select (arr!46234 a!2901) j!112) lt!616967 mask!2840)))))

(assert (= (and start!120404 res!940231) b!1401666))

(assert (= (and b!1401666 res!940229) b!1401659))

(assert (= (and b!1401659 res!940223) b!1401664))

(assert (= (and b!1401664 res!940228) b!1401661))

(assert (= (and b!1401661 res!940227) b!1401663))

(assert (= (and b!1401663 res!940226) b!1401665))

(assert (= (and b!1401665 res!940230) b!1401667))

(assert (= (and b!1401665 (not res!940225)) b!1401660))

(assert (= (and b!1401660 (not res!940221)) b!1401668))

(assert (= (and b!1401668 res!940222) b!1401669))

(assert (= (and b!1401668 (not res!940224)) b!1401662))

(declare-fun m!1289089 () Bool)

(assert (=> b!1401668 m!1289089))

(declare-fun m!1289091 () Bool)

(assert (=> b!1401668 m!1289091))

(declare-fun m!1289093 () Bool)

(assert (=> b!1401668 m!1289093))

(declare-fun m!1289095 () Bool)

(assert (=> b!1401669 m!1289095))

(declare-fun m!1289097 () Bool)

(assert (=> b!1401669 m!1289097))

(assert (=> b!1401669 m!1289097))

(declare-fun m!1289099 () Bool)

(assert (=> b!1401669 m!1289099))

(assert (=> b!1401667 m!1289097))

(assert (=> b!1401667 m!1289097))

(declare-fun m!1289101 () Bool)

(assert (=> b!1401667 m!1289101))

(declare-fun m!1289103 () Bool)

(assert (=> b!1401660 m!1289103))

(assert (=> b!1401660 m!1289103))

(declare-fun m!1289105 () Bool)

(assert (=> b!1401660 m!1289105))

(assert (=> b!1401660 m!1289089))

(declare-fun m!1289107 () Bool)

(assert (=> b!1401660 m!1289107))

(assert (=> b!1401665 m!1289097))

(declare-fun m!1289109 () Bool)

(assert (=> b!1401665 m!1289109))

(assert (=> b!1401665 m!1289097))

(declare-fun m!1289111 () Bool)

(assert (=> b!1401665 m!1289111))

(assert (=> b!1401665 m!1289097))

(declare-fun m!1289113 () Bool)

(assert (=> b!1401665 m!1289113))

(declare-fun m!1289115 () Bool)

(assert (=> b!1401665 m!1289115))

(declare-fun m!1289117 () Bool)

(assert (=> b!1401662 m!1289117))

(declare-fun m!1289119 () Bool)

(assert (=> start!120404 m!1289119))

(declare-fun m!1289121 () Bool)

(assert (=> start!120404 m!1289121))

(assert (=> b!1401664 m!1289097))

(assert (=> b!1401664 m!1289097))

(declare-fun m!1289123 () Bool)

(assert (=> b!1401664 m!1289123))

(declare-fun m!1289125 () Bool)

(assert (=> b!1401659 m!1289125))

(assert (=> b!1401659 m!1289125))

(declare-fun m!1289127 () Bool)

(assert (=> b!1401659 m!1289127))

(declare-fun m!1289129 () Bool)

(assert (=> b!1401663 m!1289129))

(declare-fun m!1289131 () Bool)

(assert (=> b!1401661 m!1289131))

(check-sat (not b!1401665) (not b!1401667) (not b!1401661) (not start!120404) (not b!1401660) (not b!1401668) (not b!1401659) (not b!1401662) (not b!1401664) (not b!1401669) (not b!1401663))
(check-sat)
