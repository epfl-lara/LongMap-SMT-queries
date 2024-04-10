; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129870 () Bool)

(assert start!129870)

(declare-fun b!1524205 () Bool)

(declare-fun e!849712 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101409 0))(
  ( (array!101410 (arr!48934 (Array (_ BitVec 32) (_ BitVec 64))) (size!49484 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101409)

(declare-datatypes ((SeekEntryResult!13099 0))(
  ( (MissingZero!13099 (index!54791 (_ BitVec 32))) (Found!13099 (index!54792 (_ BitVec 32))) (Intermediate!13099 (undefined!13911 Bool) (index!54793 (_ BitVec 32)) (x!136479 (_ BitVec 32))) (Undefined!13099) (MissingVacant!13099 (index!54794 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101409 (_ BitVec 32)) SeekEntryResult!13099)

(assert (=> b!1524205 (= e!849712 (= (seekEntry!0 (select (arr!48934 a!2804) j!70) a!2804 mask!2512) (Found!13099 j!70)))))

(declare-fun b!1524206 () Bool)

(declare-fun res!1042863 () Bool)

(declare-fun e!849715 () Bool)

(assert (=> b!1524206 (=> (not res!1042863) (not e!849715))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1524206 (= res!1042863 (and (= (size!49484 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49484 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49484 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1042865 () Bool)

(assert (=> start!129870 (=> (not res!1042865) (not e!849715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129870 (= res!1042865 (validMask!0 mask!2512))))

(assert (=> start!129870 e!849715))

(assert (=> start!129870 true))

(declare-fun array_inv!37962 (array!101409) Bool)

(assert (=> start!129870 (array_inv!37962 a!2804)))

(declare-fun b!1524207 () Bool)

(declare-fun res!1042857 () Bool)

(assert (=> b!1524207 (=> (not res!1042857) (not e!849715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101409 (_ BitVec 32)) Bool)

(assert (=> b!1524207 (= res!1042857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524208 () Bool)

(declare-fun e!849713 () Bool)

(assert (=> b!1524208 (= e!849715 e!849713)))

(declare-fun res!1042858 () Bool)

(assert (=> b!1524208 (=> (not res!1042858) (not e!849713))))

(declare-fun lt!660252 () SeekEntryResult!13099)

(declare-fun lt!660251 () SeekEntryResult!13099)

(assert (=> b!1524208 (= res!1042858 (= lt!660252 lt!660251))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1524208 (= lt!660251 (Intermediate!13099 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101409 (_ BitVec 32)) SeekEntryResult!13099)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524208 (= lt!660252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48934 a!2804) j!70) mask!2512) (select (arr!48934 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524209 () Bool)

(declare-fun res!1042864 () Bool)

(assert (=> b!1524209 (=> (not res!1042864) (not e!849715))))

(declare-datatypes ((List!35417 0))(
  ( (Nil!35414) (Cons!35413 (h!36840 (_ BitVec 64)) (t!50111 List!35417)) )
))
(declare-fun arrayNoDuplicates!0 (array!101409 (_ BitVec 32) List!35417) Bool)

(assert (=> b!1524209 (= res!1042864 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35414))))

(declare-fun b!1524210 () Bool)

(assert (=> b!1524210 (= e!849713 (not true))))

(assert (=> b!1524210 e!849712))

(declare-fun res!1042861 () Bool)

(assert (=> b!1524210 (=> (not res!1042861) (not e!849712))))

(assert (=> b!1524210 (= res!1042861 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50982 0))(
  ( (Unit!50983) )
))
(declare-fun lt!660253 () Unit!50982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50982)

(assert (=> b!1524210 (= lt!660253 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524211 () Bool)

(declare-fun res!1042859 () Bool)

(assert (=> b!1524211 (=> (not res!1042859) (not e!849715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524211 (= res!1042859 (validKeyInArray!0 (select (arr!48934 a!2804) j!70)))))

(declare-fun b!1524212 () Bool)

(declare-fun res!1042860 () Bool)

(assert (=> b!1524212 (=> (not res!1042860) (not e!849715))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1524212 (= res!1042860 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49484 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49484 a!2804))))))

(declare-fun b!1524213 () Bool)

(declare-fun res!1042867 () Bool)

(assert (=> b!1524213 (=> (not res!1042867) (not e!849713))))

(assert (=> b!1524213 (= res!1042867 (= lt!660252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48934 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48934 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101410 (store (arr!48934 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49484 a!2804)) mask!2512)))))

(declare-fun b!1524214 () Bool)

(declare-fun res!1042862 () Bool)

(assert (=> b!1524214 (=> (not res!1042862) (not e!849713))))

(assert (=> b!1524214 (= res!1042862 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48934 a!2804) j!70) a!2804 mask!2512) lt!660251))))

(declare-fun b!1524215 () Bool)

(declare-fun res!1042866 () Bool)

(assert (=> b!1524215 (=> (not res!1042866) (not e!849715))))

(assert (=> b!1524215 (= res!1042866 (validKeyInArray!0 (select (arr!48934 a!2804) i!961)))))

(assert (= (and start!129870 res!1042865) b!1524206))

(assert (= (and b!1524206 res!1042863) b!1524215))

(assert (= (and b!1524215 res!1042866) b!1524211))

(assert (= (and b!1524211 res!1042859) b!1524207))

(assert (= (and b!1524207 res!1042857) b!1524209))

(assert (= (and b!1524209 res!1042864) b!1524212))

(assert (= (and b!1524212 res!1042860) b!1524208))

(assert (= (and b!1524208 res!1042858) b!1524214))

(assert (= (and b!1524214 res!1042862) b!1524213))

(assert (= (and b!1524213 res!1042867) b!1524210))

(assert (= (and b!1524210 res!1042861) b!1524205))

(declare-fun m!1407231 () Bool)

(assert (=> b!1524207 m!1407231))

(declare-fun m!1407233 () Bool)

(assert (=> b!1524208 m!1407233))

(assert (=> b!1524208 m!1407233))

(declare-fun m!1407235 () Bool)

(assert (=> b!1524208 m!1407235))

(assert (=> b!1524208 m!1407235))

(assert (=> b!1524208 m!1407233))

(declare-fun m!1407237 () Bool)

(assert (=> b!1524208 m!1407237))

(declare-fun m!1407239 () Bool)

(assert (=> b!1524209 m!1407239))

(assert (=> b!1524205 m!1407233))

(assert (=> b!1524205 m!1407233))

(declare-fun m!1407241 () Bool)

(assert (=> b!1524205 m!1407241))

(declare-fun m!1407243 () Bool)

(assert (=> b!1524213 m!1407243))

(declare-fun m!1407245 () Bool)

(assert (=> b!1524213 m!1407245))

(assert (=> b!1524213 m!1407245))

(declare-fun m!1407247 () Bool)

(assert (=> b!1524213 m!1407247))

(assert (=> b!1524213 m!1407247))

(assert (=> b!1524213 m!1407245))

(declare-fun m!1407249 () Bool)

(assert (=> b!1524213 m!1407249))

(assert (=> b!1524211 m!1407233))

(assert (=> b!1524211 m!1407233))

(declare-fun m!1407251 () Bool)

(assert (=> b!1524211 m!1407251))

(declare-fun m!1407253 () Bool)

(assert (=> b!1524215 m!1407253))

(assert (=> b!1524215 m!1407253))

(declare-fun m!1407255 () Bool)

(assert (=> b!1524215 m!1407255))

(assert (=> b!1524214 m!1407233))

(assert (=> b!1524214 m!1407233))

(declare-fun m!1407257 () Bool)

(assert (=> b!1524214 m!1407257))

(declare-fun m!1407259 () Bool)

(assert (=> b!1524210 m!1407259))

(declare-fun m!1407261 () Bool)

(assert (=> b!1524210 m!1407261))

(declare-fun m!1407263 () Bool)

(assert (=> start!129870 m!1407263))

(declare-fun m!1407265 () Bool)

(assert (=> start!129870 m!1407265))

(push 1)

(assert (not b!1524215))

(assert (not b!1524205))

