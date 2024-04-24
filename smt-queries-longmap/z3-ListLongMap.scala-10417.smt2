; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122852 () Bool)

(assert start!122852)

(declare-fun b!1422063 () Bool)

(declare-fun e!804290 () Bool)

(assert (=> b!1422063 (= e!804290 false)))

(declare-datatypes ((SeekEntryResult!11072 0))(
  ( (MissingZero!11072 (index!46680 (_ BitVec 32))) (Found!11072 (index!46681 (_ BitVec 32))) (Intermediate!11072 (undefined!11884 Bool) (index!46682 (_ BitVec 32)) (x!128493 (_ BitVec 32))) (Undefined!11072) (MissingVacant!11072 (index!46683 (_ BitVec 32))) )
))
(declare-fun lt!626452 () SeekEntryResult!11072)

(declare-datatypes ((array!97139 0))(
  ( (array!97140 (arr!46885 (Array (_ BitVec 32) (_ BitVec 64))) (size!47436 (_ BitVec 32))) )
))
(declare-fun lt!626453 () array!97139)

(declare-fun lt!626451 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97139 (_ BitVec 32)) SeekEntryResult!11072)

(assert (=> b!1422063 (= lt!626452 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626451 lt!626453 mask!2608))))

(declare-fun res!956818 () Bool)

(declare-fun e!804293 () Bool)

(assert (=> start!122852 (=> (not res!956818) (not e!804293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122852 (= res!956818 (validMask!0 mask!2608))))

(assert (=> start!122852 e!804293))

(assert (=> start!122852 true))

(declare-fun a!2831 () array!97139)

(declare-fun array_inv!36166 (array!97139) Bool)

(assert (=> start!122852 (array_inv!36166 a!2831)))

(declare-fun b!1422064 () Bool)

(declare-fun e!804291 () Bool)

(assert (=> b!1422064 (= e!804293 e!804291)))

(declare-fun res!956817 () Bool)

(assert (=> b!1422064 (=> (not res!956817) (not e!804291))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun lt!626450 () SeekEntryResult!11072)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422064 (= res!956817 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46885 a!2831) j!81) mask!2608) (select (arr!46885 a!2831) j!81) a!2831 mask!2608) lt!626450))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422064 (= lt!626450 (Intermediate!11072 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422065 () Bool)

(assert (=> b!1422065 (= e!804291 e!804290)))

(declare-fun res!956813 () Bool)

(assert (=> b!1422065 (=> (not res!956813) (not e!804290))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422065 (= res!956813 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626451 mask!2608) lt!626451 lt!626453 mask!2608) (Intermediate!11072 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422065 (= lt!626451 (select (store (arr!46885 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422065 (= lt!626453 (array!97140 (store (arr!46885 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47436 a!2831)))))

(declare-fun b!1422066 () Bool)

(declare-fun res!956820 () Bool)

(assert (=> b!1422066 (=> (not res!956820) (not e!804293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422066 (= res!956820 (validKeyInArray!0 (select (arr!46885 a!2831) j!81)))))

(declare-fun b!1422067 () Bool)

(declare-fun res!956819 () Bool)

(assert (=> b!1422067 (=> (not res!956819) (not e!804293))))

(assert (=> b!1422067 (= res!956819 (and (= (size!47436 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47436 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47436 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422068 () Bool)

(declare-fun res!956821 () Bool)

(assert (=> b!1422068 (=> (not res!956821) (not e!804293))))

(assert (=> b!1422068 (= res!956821 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47436 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47436 a!2831))))))

(declare-fun b!1422069 () Bool)

(declare-fun res!956815 () Bool)

(assert (=> b!1422069 (=> (not res!956815) (not e!804290))))

(assert (=> b!1422069 (= res!956815 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46885 a!2831) j!81) a!2831 mask!2608) lt!626450))))

(declare-fun b!1422070 () Bool)

(declare-fun res!956812 () Bool)

(assert (=> b!1422070 (=> (not res!956812) (not e!804293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97139 (_ BitVec 32)) Bool)

(assert (=> b!1422070 (= res!956812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422071 () Bool)

(declare-fun res!956816 () Bool)

(assert (=> b!1422071 (=> (not res!956816) (not e!804293))))

(declare-datatypes ((List!33382 0))(
  ( (Nil!33379) (Cons!33378 (h!34688 (_ BitVec 64)) (t!48068 List!33382)) )
))
(declare-fun arrayNoDuplicates!0 (array!97139 (_ BitVec 32) List!33382) Bool)

(assert (=> b!1422071 (= res!956816 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33379))))

(declare-fun b!1422072 () Bool)

(declare-fun res!956814 () Bool)

(assert (=> b!1422072 (=> (not res!956814) (not e!804293))))

(assert (=> b!1422072 (= res!956814 (validKeyInArray!0 (select (arr!46885 a!2831) i!982)))))

(assert (= (and start!122852 res!956818) b!1422067))

(assert (= (and b!1422067 res!956819) b!1422072))

(assert (= (and b!1422072 res!956814) b!1422066))

(assert (= (and b!1422066 res!956820) b!1422070))

(assert (= (and b!1422070 res!956812) b!1422071))

(assert (= (and b!1422071 res!956816) b!1422068))

(assert (= (and b!1422068 res!956821) b!1422064))

(assert (= (and b!1422064 res!956817) b!1422065))

(assert (= (and b!1422065 res!956813) b!1422069))

(assert (= (and b!1422069 res!956815) b!1422063))

(declare-fun m!1312827 () Bool)

(assert (=> b!1422064 m!1312827))

(assert (=> b!1422064 m!1312827))

(declare-fun m!1312829 () Bool)

(assert (=> b!1422064 m!1312829))

(assert (=> b!1422064 m!1312829))

(assert (=> b!1422064 m!1312827))

(declare-fun m!1312831 () Bool)

(assert (=> b!1422064 m!1312831))

(assert (=> b!1422069 m!1312827))

(assert (=> b!1422069 m!1312827))

(declare-fun m!1312833 () Bool)

(assert (=> b!1422069 m!1312833))

(declare-fun m!1312835 () Bool)

(assert (=> b!1422071 m!1312835))

(declare-fun m!1312837 () Bool)

(assert (=> b!1422070 m!1312837))

(assert (=> b!1422066 m!1312827))

(assert (=> b!1422066 m!1312827))

(declare-fun m!1312839 () Bool)

(assert (=> b!1422066 m!1312839))

(declare-fun m!1312841 () Bool)

(assert (=> b!1422065 m!1312841))

(assert (=> b!1422065 m!1312841))

(declare-fun m!1312843 () Bool)

(assert (=> b!1422065 m!1312843))

(declare-fun m!1312845 () Bool)

(assert (=> b!1422065 m!1312845))

(declare-fun m!1312847 () Bool)

(assert (=> b!1422065 m!1312847))

(declare-fun m!1312849 () Bool)

(assert (=> b!1422072 m!1312849))

(assert (=> b!1422072 m!1312849))

(declare-fun m!1312851 () Bool)

(assert (=> b!1422072 m!1312851))

(declare-fun m!1312853 () Bool)

(assert (=> b!1422063 m!1312853))

(declare-fun m!1312855 () Bool)

(assert (=> start!122852 m!1312855))

(declare-fun m!1312857 () Bool)

(assert (=> start!122852 m!1312857))

(check-sat (not start!122852) (not b!1422064) (not b!1422070) (not b!1422072) (not b!1422065) (not b!1422071) (not b!1422066) (not b!1422069) (not b!1422063))
(check-sat)
