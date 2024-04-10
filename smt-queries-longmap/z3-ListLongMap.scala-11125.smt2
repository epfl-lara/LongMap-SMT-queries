; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130048 () Bool)

(assert start!130048)

(declare-fun b!1525894 () Bool)

(declare-fun res!1043938 () Bool)

(declare-fun e!850559 () Bool)

(assert (=> b!1525894 (=> (not res!1043938) (not e!850559))))

(declare-datatypes ((SeekEntryResult!13122 0))(
  ( (MissingZero!13122 (index!54883 (_ BitVec 32))) (Found!13122 (index!54884 (_ BitVec 32))) (Intermediate!13122 (undefined!13934 Bool) (index!54885 (_ BitVec 32)) (x!136584 (_ BitVec 32))) (Undefined!13122) (MissingVacant!13122 (index!54886 (_ BitVec 32))) )
))
(declare-fun lt!660882 () SeekEntryResult!13122)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101461 0))(
  ( (array!101462 (arr!48957 (Array (_ BitVec 32) (_ BitVec 64))) (size!49507 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101461)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101461 (_ BitVec 32)) SeekEntryResult!13122)

(assert (=> b!1525894 (= res!1043938 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48957 a!2804) j!70) a!2804 mask!2512) lt!660882))))

(declare-fun b!1525895 () Bool)

(declare-fun res!1043939 () Bool)

(declare-fun e!850564 () Bool)

(assert (=> b!1525895 (=> (not res!1043939) (not e!850564))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101461 (_ BitVec 32)) SeekEntryResult!13122)

(assert (=> b!1525895 (= res!1043939 (= (seekEntry!0 (select (arr!48957 a!2804) j!70) a!2804 mask!2512) (Found!13122 j!70)))))

(declare-fun b!1525896 () Bool)

(declare-fun e!850560 () Bool)

(assert (=> b!1525896 (= e!850564 e!850560)))

(declare-fun res!1043941 () Bool)

(assert (=> b!1525896 (=> res!1043941 e!850560)))

(declare-fun lt!660883 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525896 (= res!1043941 (or (not (= (select (arr!48957 a!2804) j!70) lt!660883)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48957 a!2804) index!487) (select (arr!48957 a!2804) j!70)) (not (= (select (arr!48957 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1043935 () Bool)

(declare-fun e!850558 () Bool)

(assert (=> start!130048 (=> (not res!1043935) (not e!850558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130048 (= res!1043935 (validMask!0 mask!2512))))

(assert (=> start!130048 e!850558))

(assert (=> start!130048 true))

(declare-fun array_inv!37985 (array!101461) Bool)

(assert (=> start!130048 (array_inv!37985 a!2804)))

(declare-fun b!1525897 () Bool)

(declare-fun e!850561 () Bool)

(assert (=> b!1525897 (= e!850561 (not true))))

(assert (=> b!1525897 e!850564))

(declare-fun res!1043936 () Bool)

(assert (=> b!1525897 (=> (not res!1043936) (not e!850564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101461 (_ BitVec 32)) Bool)

(assert (=> b!1525897 (= res!1043936 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51028 0))(
  ( (Unit!51029) )
))
(declare-fun lt!660881 () Unit!51028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51028)

(assert (=> b!1525897 (= lt!660881 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun e!850563 () Bool)

(declare-fun b!1525898 () Bool)

(declare-fun lt!660879 () array!101461)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101461 (_ BitVec 32)) SeekEntryResult!13122)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101461 (_ BitVec 32)) SeekEntryResult!13122)

(assert (=> b!1525898 (= e!850563 (= (seekEntryOrOpen!0 lt!660883 lt!660879 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660883 lt!660879 mask!2512)))))

(declare-fun b!1525899 () Bool)

(declare-fun res!1043937 () Bool)

(assert (=> b!1525899 (=> (not res!1043937) (not e!850558))))

(assert (=> b!1525899 (= res!1043937 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49507 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49507 a!2804))))))

(declare-fun b!1525900 () Bool)

(declare-fun res!1043928 () Bool)

(assert (=> b!1525900 (=> (not res!1043928) (not e!850558))))

(declare-datatypes ((List!35440 0))(
  ( (Nil!35437) (Cons!35436 (h!36869 (_ BitVec 64)) (t!50134 List!35440)) )
))
(declare-fun arrayNoDuplicates!0 (array!101461 (_ BitVec 32) List!35440) Bool)

(assert (=> b!1525900 (= res!1043928 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35437))))

(declare-fun b!1525901 () Bool)

(declare-fun res!1043933 () Bool)

(assert (=> b!1525901 (=> (not res!1043933) (not e!850558))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525901 (= res!1043933 (validKeyInArray!0 (select (arr!48957 a!2804) i!961)))))

(declare-fun b!1525902 () Bool)

(assert (=> b!1525902 (= e!850559 e!850561)))

(declare-fun res!1043940 () Bool)

(assert (=> b!1525902 (=> (not res!1043940) (not e!850561))))

(declare-fun lt!660880 () SeekEntryResult!13122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525902 (= res!1043940 (= lt!660880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660883 mask!2512) lt!660883 lt!660879 mask!2512)))))

(assert (=> b!1525902 (= lt!660883 (select (store (arr!48957 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525902 (= lt!660879 (array!101462 (store (arr!48957 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49507 a!2804)))))

(declare-fun b!1525903 () Bool)

(declare-fun res!1043930 () Bool)

(assert (=> b!1525903 (=> (not res!1043930) (not e!850558))))

(assert (=> b!1525903 (= res!1043930 (validKeyInArray!0 (select (arr!48957 a!2804) j!70)))))

(declare-fun b!1525904 () Bool)

(assert (=> b!1525904 (= e!850558 e!850559)))

(declare-fun res!1043934 () Bool)

(assert (=> b!1525904 (=> (not res!1043934) (not e!850559))))

(assert (=> b!1525904 (= res!1043934 (= lt!660880 lt!660882))))

(assert (=> b!1525904 (= lt!660882 (Intermediate!13122 false resIndex!21 resX!21))))

(assert (=> b!1525904 (= lt!660880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48957 a!2804) j!70) mask!2512) (select (arr!48957 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525905 () Bool)

(assert (=> b!1525905 (= e!850560 e!850563)))

(declare-fun res!1043932 () Bool)

(assert (=> b!1525905 (=> (not res!1043932) (not e!850563))))

(assert (=> b!1525905 (= res!1043932 (= (seekEntryOrOpen!0 (select (arr!48957 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48957 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525906 () Bool)

(declare-fun res!1043931 () Bool)

(assert (=> b!1525906 (=> (not res!1043931) (not e!850558))))

(assert (=> b!1525906 (= res!1043931 (and (= (size!49507 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49507 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49507 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525907 () Bool)

(declare-fun res!1043929 () Bool)

(assert (=> b!1525907 (=> (not res!1043929) (not e!850558))))

(assert (=> b!1525907 (= res!1043929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130048 res!1043935) b!1525906))

(assert (= (and b!1525906 res!1043931) b!1525901))

(assert (= (and b!1525901 res!1043933) b!1525903))

(assert (= (and b!1525903 res!1043930) b!1525907))

(assert (= (and b!1525907 res!1043929) b!1525900))

(assert (= (and b!1525900 res!1043928) b!1525899))

(assert (= (and b!1525899 res!1043937) b!1525904))

(assert (= (and b!1525904 res!1043934) b!1525894))

(assert (= (and b!1525894 res!1043938) b!1525902))

(assert (= (and b!1525902 res!1043940) b!1525897))

(assert (= (and b!1525897 res!1043936) b!1525895))

(assert (= (and b!1525895 res!1043939) b!1525896))

(assert (= (and b!1525896 (not res!1043941)) b!1525905))

(assert (= (and b!1525905 res!1043932) b!1525898))

(declare-fun m!1408645 () Bool)

(assert (=> start!130048 m!1408645))

(declare-fun m!1408647 () Bool)

(assert (=> start!130048 m!1408647))

(declare-fun m!1408649 () Bool)

(assert (=> b!1525901 m!1408649))

(assert (=> b!1525901 m!1408649))

(declare-fun m!1408651 () Bool)

(assert (=> b!1525901 m!1408651))

(declare-fun m!1408653 () Bool)

(assert (=> b!1525895 m!1408653))

(assert (=> b!1525895 m!1408653))

(declare-fun m!1408655 () Bool)

(assert (=> b!1525895 m!1408655))

(assert (=> b!1525894 m!1408653))

(assert (=> b!1525894 m!1408653))

(declare-fun m!1408657 () Bool)

(assert (=> b!1525894 m!1408657))

(assert (=> b!1525905 m!1408653))

(assert (=> b!1525905 m!1408653))

(declare-fun m!1408659 () Bool)

(assert (=> b!1525905 m!1408659))

(assert (=> b!1525905 m!1408653))

(declare-fun m!1408661 () Bool)

(assert (=> b!1525905 m!1408661))

(declare-fun m!1408663 () Bool)

(assert (=> b!1525897 m!1408663))

(declare-fun m!1408665 () Bool)

(assert (=> b!1525897 m!1408665))

(assert (=> b!1525904 m!1408653))

(assert (=> b!1525904 m!1408653))

(declare-fun m!1408667 () Bool)

(assert (=> b!1525904 m!1408667))

(assert (=> b!1525904 m!1408667))

(assert (=> b!1525904 m!1408653))

(declare-fun m!1408669 () Bool)

(assert (=> b!1525904 m!1408669))

(assert (=> b!1525896 m!1408653))

(declare-fun m!1408671 () Bool)

(assert (=> b!1525896 m!1408671))

(declare-fun m!1408673 () Bool)

(assert (=> b!1525898 m!1408673))

(declare-fun m!1408675 () Bool)

(assert (=> b!1525898 m!1408675))

(assert (=> b!1525903 m!1408653))

(assert (=> b!1525903 m!1408653))

(declare-fun m!1408677 () Bool)

(assert (=> b!1525903 m!1408677))

(declare-fun m!1408679 () Bool)

(assert (=> b!1525900 m!1408679))

(declare-fun m!1408681 () Bool)

(assert (=> b!1525902 m!1408681))

(assert (=> b!1525902 m!1408681))

(declare-fun m!1408683 () Bool)

(assert (=> b!1525902 m!1408683))

(declare-fun m!1408685 () Bool)

(assert (=> b!1525902 m!1408685))

(declare-fun m!1408687 () Bool)

(assert (=> b!1525902 m!1408687))

(declare-fun m!1408689 () Bool)

(assert (=> b!1525907 m!1408689))

(check-sat (not b!1525897) (not b!1525898) (not b!1525907) (not b!1525904) (not b!1525895) (not b!1525902) (not b!1525900) (not start!130048) (not b!1525903) (not b!1525894) (not b!1525901) (not b!1525905))
(check-sat)
