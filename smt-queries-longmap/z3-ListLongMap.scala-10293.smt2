; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121082 () Bool)

(assert start!121082)

(declare-fun b!1407781 () Bool)

(declare-fun res!945507 () Bool)

(declare-fun e!796793 () Bool)

(assert (=> b!1407781 (=> res!945507 e!796793)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96236 0))(
  ( (array!96237 (arr!46461 (Array (_ BitVec 32) (_ BitVec 64))) (size!47011 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96236)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10772 0))(
  ( (MissingZero!10772 (index!45465 (_ BitVec 32))) (Found!10772 (index!45466 (_ BitVec 32))) (Intermediate!10772 (undefined!11584 Bool) (index!45467 (_ BitVec 32)) (x!127077 (_ BitVec 32))) (Undefined!10772) (MissingVacant!10772 (index!45468 (_ BitVec 32))) )
))
(declare-fun lt!619941 () SeekEntryResult!10772)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96236 (_ BitVec 32)) SeekEntryResult!10772)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407781 (= res!945507 (not (= lt!619941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46461 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46461 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96237 (store (arr!46461 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47011 a!2901)) mask!2840))))))

(declare-fun res!945510 () Bool)

(declare-fun e!796791 () Bool)

(assert (=> start!121082 (=> (not res!945510) (not e!796791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121082 (= res!945510 (validMask!0 mask!2840))))

(assert (=> start!121082 e!796791))

(assert (=> start!121082 true))

(declare-fun array_inv!35489 (array!96236) Bool)

(assert (=> start!121082 (array_inv!35489 a!2901)))

(declare-fun b!1407782 () Bool)

(declare-fun res!945511 () Bool)

(assert (=> b!1407782 (=> (not res!945511) (not e!796791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96236 (_ BitVec 32)) Bool)

(assert (=> b!1407782 (= res!945511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407783 () Bool)

(declare-fun res!945506 () Bool)

(assert (=> b!1407783 (=> (not res!945506) (not e!796791))))

(declare-datatypes ((List!32980 0))(
  ( (Nil!32977) (Cons!32976 (h!34239 (_ BitVec 64)) (t!47674 List!32980)) )
))
(declare-fun arrayNoDuplicates!0 (array!96236 (_ BitVec 32) List!32980) Bool)

(assert (=> b!1407783 (= res!945506 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32977))))

(declare-fun b!1407784 () Bool)

(assert (=> b!1407784 (= e!796791 (not e!796793))))

(declare-fun res!945508 () Bool)

(assert (=> b!1407784 (=> res!945508 e!796793)))

(get-info :version)

(assert (=> b!1407784 (= res!945508 (or (not ((_ is Intermediate!10772) lt!619941)) (undefined!11584 lt!619941)))))

(declare-fun e!796790 () Bool)

(assert (=> b!1407784 e!796790))

(declare-fun res!945509 () Bool)

(assert (=> b!1407784 (=> (not res!945509) (not e!796790))))

(assert (=> b!1407784 (= res!945509 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47518 0))(
  ( (Unit!47519) )
))
(declare-fun lt!619939 () Unit!47518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47518)

(assert (=> b!1407784 (= lt!619939 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619940 () (_ BitVec 32))

(assert (=> b!1407784 (= lt!619941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619940 (select (arr!46461 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1407784 (= lt!619940 (toIndex!0 (select (arr!46461 a!2901) j!112) mask!2840))))

(declare-fun b!1407785 () Bool)

(assert (=> b!1407785 (= e!796793 (or (bvslt (x!127077 lt!619941) #b00000000000000000000000000000000) (bvsgt (x!127077 lt!619941) #b01111111111111111111111111111110) (bvslt lt!619940 #b00000000000000000000000000000000) (bvsge lt!619940 (size!47011 a!2901)) (bvslt (index!45467 lt!619941) #b00000000000000000000000000000000) (bvsge (index!45467 lt!619941) (size!47011 a!2901)) (= lt!619941 (Intermediate!10772 false (index!45467 lt!619941) (x!127077 lt!619941)))))))

(declare-fun b!1407786 () Bool)

(declare-fun res!945504 () Bool)

(assert (=> b!1407786 (=> (not res!945504) (not e!796791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407786 (= res!945504 (validKeyInArray!0 (select (arr!46461 a!2901) i!1037)))))

(declare-fun b!1407787 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96236 (_ BitVec 32)) SeekEntryResult!10772)

(assert (=> b!1407787 (= e!796790 (= (seekEntryOrOpen!0 (select (arr!46461 a!2901) j!112) a!2901 mask!2840) (Found!10772 j!112)))))

(declare-fun b!1407788 () Bool)

(declare-fun res!945505 () Bool)

(assert (=> b!1407788 (=> (not res!945505) (not e!796791))))

(assert (=> b!1407788 (= res!945505 (validKeyInArray!0 (select (arr!46461 a!2901) j!112)))))

(declare-fun b!1407789 () Bool)

(declare-fun res!945503 () Bool)

(assert (=> b!1407789 (=> (not res!945503) (not e!796791))))

(assert (=> b!1407789 (= res!945503 (and (= (size!47011 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47011 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47011 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121082 res!945510) b!1407789))

(assert (= (and b!1407789 res!945503) b!1407786))

(assert (= (and b!1407786 res!945504) b!1407788))

(assert (= (and b!1407788 res!945505) b!1407782))

(assert (= (and b!1407782 res!945511) b!1407783))

(assert (= (and b!1407783 res!945506) b!1407784))

(assert (= (and b!1407784 res!945509) b!1407787))

(assert (= (and b!1407784 (not res!945508)) b!1407781))

(assert (= (and b!1407781 (not res!945507)) b!1407785))

(declare-fun m!1296817 () Bool)

(assert (=> b!1407786 m!1296817))

(assert (=> b!1407786 m!1296817))

(declare-fun m!1296819 () Bool)

(assert (=> b!1407786 m!1296819))

(declare-fun m!1296821 () Bool)

(assert (=> b!1407782 m!1296821))

(declare-fun m!1296823 () Bool)

(assert (=> b!1407787 m!1296823))

(assert (=> b!1407787 m!1296823))

(declare-fun m!1296825 () Bool)

(assert (=> b!1407787 m!1296825))

(declare-fun m!1296827 () Bool)

(assert (=> start!121082 m!1296827))

(declare-fun m!1296829 () Bool)

(assert (=> start!121082 m!1296829))

(declare-fun m!1296831 () Bool)

(assert (=> b!1407781 m!1296831))

(declare-fun m!1296833 () Bool)

(assert (=> b!1407781 m!1296833))

(assert (=> b!1407781 m!1296833))

(declare-fun m!1296835 () Bool)

(assert (=> b!1407781 m!1296835))

(assert (=> b!1407781 m!1296835))

(assert (=> b!1407781 m!1296833))

(declare-fun m!1296837 () Bool)

(assert (=> b!1407781 m!1296837))

(assert (=> b!1407788 m!1296823))

(assert (=> b!1407788 m!1296823))

(declare-fun m!1296839 () Bool)

(assert (=> b!1407788 m!1296839))

(assert (=> b!1407784 m!1296823))

(declare-fun m!1296841 () Bool)

(assert (=> b!1407784 m!1296841))

(assert (=> b!1407784 m!1296823))

(declare-fun m!1296843 () Bool)

(assert (=> b!1407784 m!1296843))

(assert (=> b!1407784 m!1296823))

(declare-fun m!1296845 () Bool)

(assert (=> b!1407784 m!1296845))

(declare-fun m!1296847 () Bool)

(assert (=> b!1407784 m!1296847))

(declare-fun m!1296849 () Bool)

(assert (=> b!1407783 m!1296849))

(check-sat (not start!121082) (not b!1407784) (not b!1407781) (not b!1407788) (not b!1407786) (not b!1407787) (not b!1407782) (not b!1407783))
(check-sat)
