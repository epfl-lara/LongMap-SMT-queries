; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119882 () Bool)

(assert start!119882)

(declare-fun b!1395855 () Bool)

(declare-fun e!790247 () Bool)

(assert (=> b!1395855 (= e!790247 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95462 0))(
  ( (array!95463 (arr!46086 (Array (_ BitVec 32) (_ BitVec 64))) (size!46636 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95462)

(declare-datatypes ((SeekEntryResult!10403 0))(
  ( (MissingZero!10403 (index!43983 (_ BitVec 32))) (Found!10403 (index!43984 (_ BitVec 32))) (Intermediate!10403 (undefined!11215 Bool) (index!43985 (_ BitVec 32)) (x!125651 (_ BitVec 32))) (Undefined!10403) (MissingVacant!10403 (index!43986 (_ BitVec 32))) )
))
(declare-fun lt!613163 () SeekEntryResult!10403)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95462 (_ BitVec 32)) SeekEntryResult!10403)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395855 (= lt!613163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46086 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46086 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95463 (store (arr!46086 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46636 a!2901)) mask!2840))))

(declare-fun b!1395856 () Bool)

(declare-fun res!934939 () Bool)

(declare-fun e!790248 () Bool)

(assert (=> b!1395856 (=> (not res!934939) (not e!790248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395856 (= res!934939 (validKeyInArray!0 (select (arr!46086 a!2901) i!1037)))))

(declare-fun b!1395857 () Bool)

(declare-fun res!934932 () Bool)

(assert (=> b!1395857 (=> (not res!934932) (not e!790248))))

(assert (=> b!1395857 (= res!934932 (and (= (size!46636 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46636 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46636 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!790250 () Bool)

(declare-fun b!1395858 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95462 (_ BitVec 32)) SeekEntryResult!10403)

(assert (=> b!1395858 (= e!790250 (= (seekEntryOrOpen!0 (select (arr!46086 a!2901) j!112) a!2901 mask!2840) (Found!10403 j!112)))))

(declare-fun b!1395859 () Bool)

(declare-fun res!934938 () Bool)

(assert (=> b!1395859 (=> (not res!934938) (not e!790248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95462 (_ BitVec 32)) Bool)

(assert (=> b!1395859 (= res!934938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395860 () Bool)

(declare-fun res!934936 () Bool)

(assert (=> b!1395860 (=> (not res!934936) (not e!790248))))

(assert (=> b!1395860 (= res!934936 (validKeyInArray!0 (select (arr!46086 a!2901) j!112)))))

(declare-fun b!1395861 () Bool)

(declare-fun res!934937 () Bool)

(assert (=> b!1395861 (=> (not res!934937) (not e!790248))))

(declare-datatypes ((List!32605 0))(
  ( (Nil!32602) (Cons!32601 (h!33840 (_ BitVec 64)) (t!47299 List!32605)) )
))
(declare-fun arrayNoDuplicates!0 (array!95462 (_ BitVec 32) List!32605) Bool)

(assert (=> b!1395861 (= res!934937 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32602))))

(declare-fun b!1395854 () Bool)

(assert (=> b!1395854 (= e!790248 (not e!790247))))

(declare-fun res!934933 () Bool)

(assert (=> b!1395854 (=> res!934933 e!790247)))

(declare-fun lt!613162 () SeekEntryResult!10403)

(get-info :version)

(assert (=> b!1395854 (= res!934933 (or (not ((_ is Intermediate!10403) lt!613162)) (undefined!11215 lt!613162)))))

(assert (=> b!1395854 e!790250))

(declare-fun res!934934 () Bool)

(assert (=> b!1395854 (=> (not res!934934) (not e!790250))))

(assert (=> b!1395854 (= res!934934 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46810 0))(
  ( (Unit!46811) )
))
(declare-fun lt!613164 () Unit!46810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46810)

(assert (=> b!1395854 (= lt!613164 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395854 (= lt!613162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46086 a!2901) j!112) mask!2840) (select (arr!46086 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!934935 () Bool)

(assert (=> start!119882 (=> (not res!934935) (not e!790248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119882 (= res!934935 (validMask!0 mask!2840))))

(assert (=> start!119882 e!790248))

(assert (=> start!119882 true))

(declare-fun array_inv!35114 (array!95462) Bool)

(assert (=> start!119882 (array_inv!35114 a!2901)))

(assert (= (and start!119882 res!934935) b!1395857))

(assert (= (and b!1395857 res!934932) b!1395856))

(assert (= (and b!1395856 res!934939) b!1395860))

(assert (= (and b!1395860 res!934936) b!1395859))

(assert (= (and b!1395859 res!934938) b!1395861))

(assert (= (and b!1395861 res!934937) b!1395854))

(assert (= (and b!1395854 res!934934) b!1395858))

(assert (= (and b!1395854 (not res!934933)) b!1395855))

(declare-fun m!1282285 () Bool)

(assert (=> b!1395860 m!1282285))

(assert (=> b!1395860 m!1282285))

(declare-fun m!1282287 () Bool)

(assert (=> b!1395860 m!1282287))

(declare-fun m!1282289 () Bool)

(assert (=> b!1395855 m!1282289))

(declare-fun m!1282291 () Bool)

(assert (=> b!1395855 m!1282291))

(assert (=> b!1395855 m!1282291))

(declare-fun m!1282293 () Bool)

(assert (=> b!1395855 m!1282293))

(assert (=> b!1395855 m!1282293))

(assert (=> b!1395855 m!1282291))

(declare-fun m!1282295 () Bool)

(assert (=> b!1395855 m!1282295))

(assert (=> b!1395854 m!1282285))

(declare-fun m!1282297 () Bool)

(assert (=> b!1395854 m!1282297))

(assert (=> b!1395854 m!1282285))

(declare-fun m!1282299 () Bool)

(assert (=> b!1395854 m!1282299))

(assert (=> b!1395854 m!1282297))

(assert (=> b!1395854 m!1282285))

(declare-fun m!1282301 () Bool)

(assert (=> b!1395854 m!1282301))

(declare-fun m!1282303 () Bool)

(assert (=> b!1395854 m!1282303))

(declare-fun m!1282305 () Bool)

(assert (=> b!1395856 m!1282305))

(assert (=> b!1395856 m!1282305))

(declare-fun m!1282307 () Bool)

(assert (=> b!1395856 m!1282307))

(declare-fun m!1282309 () Bool)

(assert (=> start!119882 m!1282309))

(declare-fun m!1282311 () Bool)

(assert (=> start!119882 m!1282311))

(declare-fun m!1282313 () Bool)

(assert (=> b!1395859 m!1282313))

(assert (=> b!1395858 m!1282285))

(assert (=> b!1395858 m!1282285))

(declare-fun m!1282315 () Bool)

(assert (=> b!1395858 m!1282315))

(declare-fun m!1282317 () Bool)

(assert (=> b!1395861 m!1282317))

(check-sat (not b!1395860) (not b!1395859) (not b!1395856) (not b!1395855) (not b!1395858) (not start!119882) (not b!1395861) (not b!1395854))
