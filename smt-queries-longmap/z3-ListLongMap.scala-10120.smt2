; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119270 () Bool)

(assert start!119270)

(declare-fun b!1390872 () Bool)

(declare-fun res!930887 () Bool)

(declare-fun e!787652 () Bool)

(assert (=> b!1390872 (=> (not res!930887) (not e!787652))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95156 0))(
  ( (array!95157 (arr!45942 (Array (_ BitVec 32) (_ BitVec 64))) (size!46492 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95156)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390872 (= res!930887 (and (= (size!46492 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46492 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46492 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390873 () Bool)

(assert (=> b!1390873 (= e!787652 (not true))))

(declare-fun e!787650 () Bool)

(assert (=> b!1390873 e!787650))

(declare-fun res!930886 () Bool)

(assert (=> b!1390873 (=> (not res!930886) (not e!787650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95156 (_ BitVec 32)) Bool)

(assert (=> b!1390873 (= res!930886 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46522 0))(
  ( (Unit!46523) )
))
(declare-fun lt!610992 () Unit!46522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46522)

(assert (=> b!1390873 (= lt!610992 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10259 0))(
  ( (MissingZero!10259 (index!43407 (_ BitVec 32))) (Found!10259 (index!43408 (_ BitVec 32))) (Intermediate!10259 (undefined!11071 Bool) (index!43409 (_ BitVec 32)) (x!125087 (_ BitVec 32))) (Undefined!10259) (MissingVacant!10259 (index!43410 (_ BitVec 32))) )
))
(declare-fun lt!610991 () SeekEntryResult!10259)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95156 (_ BitVec 32)) SeekEntryResult!10259)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390873 (= lt!610991 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45942 a!2901) j!112) mask!2840) (select (arr!45942 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390875 () Bool)

(declare-fun res!930891 () Bool)

(assert (=> b!1390875 (=> (not res!930891) (not e!787652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390875 (= res!930891 (validKeyInArray!0 (select (arr!45942 a!2901) i!1037)))))

(declare-fun b!1390876 () Bool)

(declare-fun res!930888 () Bool)

(assert (=> b!1390876 (=> (not res!930888) (not e!787652))))

(assert (=> b!1390876 (= res!930888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390877 () Bool)

(declare-fun res!930892 () Bool)

(assert (=> b!1390877 (=> (not res!930892) (not e!787652))))

(declare-datatypes ((List!32461 0))(
  ( (Nil!32458) (Cons!32457 (h!33678 (_ BitVec 64)) (t!47155 List!32461)) )
))
(declare-fun arrayNoDuplicates!0 (array!95156 (_ BitVec 32) List!32461) Bool)

(assert (=> b!1390877 (= res!930892 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32458))))

(declare-fun b!1390878 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95156 (_ BitVec 32)) SeekEntryResult!10259)

(assert (=> b!1390878 (= e!787650 (= (seekEntryOrOpen!0 (select (arr!45942 a!2901) j!112) a!2901 mask!2840) (Found!10259 j!112)))))

(declare-fun res!930889 () Bool)

(assert (=> start!119270 (=> (not res!930889) (not e!787652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119270 (= res!930889 (validMask!0 mask!2840))))

(assert (=> start!119270 e!787652))

(assert (=> start!119270 true))

(declare-fun array_inv!34970 (array!95156) Bool)

(assert (=> start!119270 (array_inv!34970 a!2901)))

(declare-fun b!1390874 () Bool)

(declare-fun res!930890 () Bool)

(assert (=> b!1390874 (=> (not res!930890) (not e!787652))))

(assert (=> b!1390874 (= res!930890 (validKeyInArray!0 (select (arr!45942 a!2901) j!112)))))

(assert (= (and start!119270 res!930889) b!1390872))

(assert (= (and b!1390872 res!930887) b!1390875))

(assert (= (and b!1390875 res!930891) b!1390874))

(assert (= (and b!1390874 res!930890) b!1390876))

(assert (= (and b!1390876 res!930888) b!1390877))

(assert (= (and b!1390877 res!930892) b!1390873))

(assert (= (and b!1390873 res!930886) b!1390878))

(declare-fun m!1276667 () Bool)

(assert (=> b!1390878 m!1276667))

(assert (=> b!1390878 m!1276667))

(declare-fun m!1276669 () Bool)

(assert (=> b!1390878 m!1276669))

(declare-fun m!1276671 () Bool)

(assert (=> start!119270 m!1276671))

(declare-fun m!1276673 () Bool)

(assert (=> start!119270 m!1276673))

(assert (=> b!1390873 m!1276667))

(declare-fun m!1276675 () Bool)

(assert (=> b!1390873 m!1276675))

(assert (=> b!1390873 m!1276667))

(declare-fun m!1276677 () Bool)

(assert (=> b!1390873 m!1276677))

(assert (=> b!1390873 m!1276675))

(assert (=> b!1390873 m!1276667))

(declare-fun m!1276679 () Bool)

(assert (=> b!1390873 m!1276679))

(declare-fun m!1276681 () Bool)

(assert (=> b!1390873 m!1276681))

(declare-fun m!1276683 () Bool)

(assert (=> b!1390877 m!1276683))

(declare-fun m!1276685 () Bool)

(assert (=> b!1390876 m!1276685))

(assert (=> b!1390874 m!1276667))

(assert (=> b!1390874 m!1276667))

(declare-fun m!1276687 () Bool)

(assert (=> b!1390874 m!1276687))

(declare-fun m!1276689 () Bool)

(assert (=> b!1390875 m!1276689))

(assert (=> b!1390875 m!1276689))

(declare-fun m!1276691 () Bool)

(assert (=> b!1390875 m!1276691))

(check-sat (not b!1390876) (not start!119270) (not b!1390875) (not b!1390873) (not b!1390878) (not b!1390874) (not b!1390877))
