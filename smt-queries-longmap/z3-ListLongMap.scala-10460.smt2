; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122918 () Bool)

(assert start!122918)

(declare-fun b!1425739 () Bool)

(declare-fun res!961222 () Bool)

(declare-fun e!805440 () Bool)

(assert (=> b!1425739 (=> (not res!961222) (not e!805440))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97236 0))(
  ( (array!97237 (arr!46936 (Array (_ BitVec 32) (_ BitVec 64))) (size!47488 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97236)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425739 (= res!961222 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47488 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47488 a!2831))))))

(declare-fun b!1425740 () Bool)

(declare-fun res!961231 () Bool)

(assert (=> b!1425740 (=> (not res!961231) (not e!805440))))

(declare-datatypes ((List!33524 0))(
  ( (Nil!33521) (Cons!33520 (h!34822 (_ BitVec 64)) (t!48210 List!33524)) )
))
(declare-fun arrayNoDuplicates!0 (array!97236 (_ BitVec 32) List!33524) Bool)

(assert (=> b!1425740 (= res!961231 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33521))))

(declare-fun b!1425741 () Bool)

(declare-fun res!961228 () Bool)

(assert (=> b!1425741 (=> (not res!961228) (not e!805440))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425741 (= res!961228 (validKeyInArray!0 (select (arr!46936 a!2831) i!982)))))

(declare-fun b!1425742 () Bool)

(declare-fun res!961230 () Bool)

(assert (=> b!1425742 (=> (not res!961230) (not e!805440))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1425742 (= res!961230 (and (= (size!47488 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47488 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47488 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425743 () Bool)

(declare-fun res!961226 () Bool)

(assert (=> b!1425743 (=> (not res!961226) (not e!805440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97236 (_ BitVec 32)) Bool)

(assert (=> b!1425743 (= res!961226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425744 () Bool)

(declare-fun res!961225 () Bool)

(assert (=> b!1425744 (=> (not res!961225) (not e!805440))))

(assert (=> b!1425744 (= res!961225 (validKeyInArray!0 (select (arr!46936 a!2831) j!81)))))

(declare-fun b!1425745 () Bool)

(declare-fun e!805442 () Bool)

(assert (=> b!1425745 (= e!805440 e!805442)))

(declare-fun res!961229 () Bool)

(assert (=> b!1425745 (=> (not res!961229) (not e!805442))))

(declare-datatypes ((SeekEntryResult!11242 0))(
  ( (MissingZero!11242 (index!47360 (_ BitVec 32))) (Found!11242 (index!47361 (_ BitVec 32))) (Intermediate!11242 (undefined!12054 Bool) (index!47362 (_ BitVec 32)) (x!128985 (_ BitVec 32))) (Undefined!11242) (MissingVacant!11242 (index!47363 (_ BitVec 32))) )
))
(declare-fun lt!627725 () SeekEntryResult!11242)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97236 (_ BitVec 32)) SeekEntryResult!11242)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425745 (= res!961229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46936 a!2831) j!81) mask!2608) (select (arr!46936 a!2831) j!81) a!2831 mask!2608) lt!627725))))

(assert (=> b!1425745 (= lt!627725 (Intermediate!11242 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425746 () Bool)

(declare-fun e!805439 () Bool)

(assert (=> b!1425746 (= e!805439 false)))

(declare-fun lt!627728 () (_ BitVec 64))

(declare-fun lt!627726 () array!97236)

(declare-fun lt!627727 () SeekEntryResult!11242)

(assert (=> b!1425746 (= lt!627727 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627728 lt!627726 mask!2608))))

(declare-fun b!1425747 () Bool)

(assert (=> b!1425747 (= e!805442 e!805439)))

(declare-fun res!961224 () Bool)

(assert (=> b!1425747 (=> (not res!961224) (not e!805439))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425747 (= res!961224 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627728 mask!2608) lt!627728 lt!627726 mask!2608) (Intermediate!11242 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1425747 (= lt!627728 (select (store (arr!46936 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425747 (= lt!627726 (array!97237 (store (arr!46936 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47488 a!2831)))))

(declare-fun b!1425738 () Bool)

(declare-fun res!961223 () Bool)

(assert (=> b!1425738 (=> (not res!961223) (not e!805439))))

(assert (=> b!1425738 (= res!961223 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46936 a!2831) j!81) a!2831 mask!2608) lt!627725))))

(declare-fun res!961227 () Bool)

(assert (=> start!122918 (=> (not res!961227) (not e!805440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122918 (= res!961227 (validMask!0 mask!2608))))

(assert (=> start!122918 e!805440))

(assert (=> start!122918 true))

(declare-fun array_inv!36169 (array!97236) Bool)

(assert (=> start!122918 (array_inv!36169 a!2831)))

(assert (= (and start!122918 res!961227) b!1425742))

(assert (= (and b!1425742 res!961230) b!1425741))

(assert (= (and b!1425741 res!961228) b!1425744))

(assert (= (and b!1425744 res!961225) b!1425743))

(assert (= (and b!1425743 res!961226) b!1425740))

(assert (= (and b!1425740 res!961231) b!1425739))

(assert (= (and b!1425739 res!961222) b!1425745))

(assert (= (and b!1425745 res!961229) b!1425747))

(assert (= (and b!1425747 res!961224) b!1425738))

(assert (= (and b!1425738 res!961223) b!1425746))

(declare-fun m!1315875 () Bool)

(assert (=> start!122918 m!1315875))

(declare-fun m!1315877 () Bool)

(assert (=> start!122918 m!1315877))

(declare-fun m!1315879 () Bool)

(assert (=> b!1425745 m!1315879))

(assert (=> b!1425745 m!1315879))

(declare-fun m!1315881 () Bool)

(assert (=> b!1425745 m!1315881))

(assert (=> b!1425745 m!1315881))

(assert (=> b!1425745 m!1315879))

(declare-fun m!1315883 () Bool)

(assert (=> b!1425745 m!1315883))

(declare-fun m!1315885 () Bool)

(assert (=> b!1425747 m!1315885))

(assert (=> b!1425747 m!1315885))

(declare-fun m!1315887 () Bool)

(assert (=> b!1425747 m!1315887))

(declare-fun m!1315889 () Bool)

(assert (=> b!1425747 m!1315889))

(declare-fun m!1315891 () Bool)

(assert (=> b!1425747 m!1315891))

(declare-fun m!1315893 () Bool)

(assert (=> b!1425746 m!1315893))

(assert (=> b!1425744 m!1315879))

(assert (=> b!1425744 m!1315879))

(declare-fun m!1315895 () Bool)

(assert (=> b!1425744 m!1315895))

(assert (=> b!1425738 m!1315879))

(assert (=> b!1425738 m!1315879))

(declare-fun m!1315897 () Bool)

(assert (=> b!1425738 m!1315897))

(declare-fun m!1315899 () Bool)

(assert (=> b!1425741 m!1315899))

(assert (=> b!1425741 m!1315899))

(declare-fun m!1315901 () Bool)

(assert (=> b!1425741 m!1315901))

(declare-fun m!1315903 () Bool)

(assert (=> b!1425740 m!1315903))

(declare-fun m!1315905 () Bool)

(assert (=> b!1425743 m!1315905))

(check-sat (not b!1425738) (not b!1425744) (not start!122918) (not b!1425741) (not b!1425747) (not b!1425740) (not b!1425743) (not b!1425746) (not b!1425745))
(check-sat)
