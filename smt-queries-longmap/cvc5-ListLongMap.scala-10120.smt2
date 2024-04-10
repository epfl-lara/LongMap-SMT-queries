; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119268 () Bool)

(assert start!119268)

(declare-fun b!1390851 () Bool)

(declare-fun res!930871 () Bool)

(declare-fun e!787642 () Bool)

(assert (=> b!1390851 (=> (not res!930871) (not e!787642))))

(declare-datatypes ((array!95154 0))(
  ( (array!95155 (arr!45941 (Array (_ BitVec 32) (_ BitVec 64))) (size!46491 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95154)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390851 (= res!930871 (validKeyInArray!0 (select (arr!45941 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1390852 () Bool)

(declare-fun e!787641 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10258 0))(
  ( (MissingZero!10258 (index!43403 (_ BitVec 32))) (Found!10258 (index!43404 (_ BitVec 32))) (Intermediate!10258 (undefined!11070 Bool) (index!43405 (_ BitVec 32)) (x!125086 (_ BitVec 32))) (Undefined!10258) (MissingVacant!10258 (index!43406 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95154 (_ BitVec 32)) SeekEntryResult!10258)

(assert (=> b!1390852 (= e!787641 (= (seekEntryOrOpen!0 (select (arr!45941 a!2901) j!112) a!2901 mask!2840) (Found!10258 j!112)))))

(declare-fun res!930870 () Bool)

(assert (=> start!119268 (=> (not res!930870) (not e!787642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119268 (= res!930870 (validMask!0 mask!2840))))

(assert (=> start!119268 e!787642))

(assert (=> start!119268 true))

(declare-fun array_inv!34969 (array!95154) Bool)

(assert (=> start!119268 (array_inv!34969 a!2901)))

(declare-fun b!1390853 () Bool)

(declare-fun res!930866 () Bool)

(assert (=> b!1390853 (=> (not res!930866) (not e!787642))))

(assert (=> b!1390853 (= res!930866 (and (= (size!46491 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46491 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46491 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390854 () Bool)

(declare-fun res!930868 () Bool)

(assert (=> b!1390854 (=> (not res!930868) (not e!787642))))

(assert (=> b!1390854 (= res!930868 (validKeyInArray!0 (select (arr!45941 a!2901) j!112)))))

(declare-fun b!1390855 () Bool)

(declare-fun res!930865 () Bool)

(assert (=> b!1390855 (=> (not res!930865) (not e!787642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95154 (_ BitVec 32)) Bool)

(assert (=> b!1390855 (= res!930865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390856 () Bool)

(assert (=> b!1390856 (= e!787642 (not true))))

(assert (=> b!1390856 e!787641))

(declare-fun res!930869 () Bool)

(assert (=> b!1390856 (=> (not res!930869) (not e!787641))))

(assert (=> b!1390856 (= res!930869 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46520 0))(
  ( (Unit!46521) )
))
(declare-fun lt!610985 () Unit!46520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46520)

(assert (=> b!1390856 (= lt!610985 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610986 () SeekEntryResult!10258)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95154 (_ BitVec 32)) SeekEntryResult!10258)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390856 (= lt!610986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45941 a!2901) j!112) mask!2840) (select (arr!45941 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390857 () Bool)

(declare-fun res!930867 () Bool)

(assert (=> b!1390857 (=> (not res!930867) (not e!787642))))

(declare-datatypes ((List!32460 0))(
  ( (Nil!32457) (Cons!32456 (h!33677 (_ BitVec 64)) (t!47154 List!32460)) )
))
(declare-fun arrayNoDuplicates!0 (array!95154 (_ BitVec 32) List!32460) Bool)

(assert (=> b!1390857 (= res!930867 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32457))))

(assert (= (and start!119268 res!930870) b!1390853))

(assert (= (and b!1390853 res!930866) b!1390851))

(assert (= (and b!1390851 res!930871) b!1390854))

(assert (= (and b!1390854 res!930868) b!1390855))

(assert (= (and b!1390855 res!930865) b!1390857))

(assert (= (and b!1390857 res!930867) b!1390856))

(assert (= (and b!1390856 res!930869) b!1390852))

(declare-fun m!1276641 () Bool)

(assert (=> b!1390855 m!1276641))

(declare-fun m!1276643 () Bool)

(assert (=> b!1390856 m!1276643))

(declare-fun m!1276645 () Bool)

(assert (=> b!1390856 m!1276645))

(assert (=> b!1390856 m!1276643))

(declare-fun m!1276647 () Bool)

(assert (=> b!1390856 m!1276647))

(assert (=> b!1390856 m!1276645))

(assert (=> b!1390856 m!1276643))

(declare-fun m!1276649 () Bool)

(assert (=> b!1390856 m!1276649))

(declare-fun m!1276651 () Bool)

(assert (=> b!1390856 m!1276651))

(assert (=> b!1390852 m!1276643))

(assert (=> b!1390852 m!1276643))

(declare-fun m!1276653 () Bool)

(assert (=> b!1390852 m!1276653))

(declare-fun m!1276655 () Bool)

(assert (=> start!119268 m!1276655))

(declare-fun m!1276657 () Bool)

(assert (=> start!119268 m!1276657))

(declare-fun m!1276659 () Bool)

(assert (=> b!1390857 m!1276659))

(assert (=> b!1390854 m!1276643))

(assert (=> b!1390854 m!1276643))

(declare-fun m!1276661 () Bool)

(assert (=> b!1390854 m!1276661))

(declare-fun m!1276663 () Bool)

(assert (=> b!1390851 m!1276663))

(assert (=> b!1390851 m!1276663))

(declare-fun m!1276665 () Bool)

(assert (=> b!1390851 m!1276665))

(push 1)

(assert (not b!1390855))

(assert (not b!1390857))

(assert (not b!1390856))

(assert (not b!1390852))

(assert (not b!1390854))

(assert (not b!1390851))

(assert (not start!119268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

