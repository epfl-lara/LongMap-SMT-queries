; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120320 () Bool)

(assert start!120320)

(declare-fun b!1400273 () Bool)

(declare-fun res!938844 () Bool)

(declare-fun e!792805 () Bool)

(assert (=> b!1400273 (=> (not res!938844) (not e!792805))))

(declare-datatypes ((array!95682 0))(
  ( (array!95683 (arr!46192 (Array (_ BitVec 32) (_ BitVec 64))) (size!46744 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95682)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400273 (= res!938844 (validKeyInArray!0 (select (arr!46192 a!2901) i!1037)))))

(declare-fun b!1400274 () Bool)

(declare-fun res!938845 () Bool)

(assert (=> b!1400274 (=> (not res!938845) (not e!792805))))

(declare-datatypes ((List!32789 0))(
  ( (Nil!32786) (Cons!32785 (h!34033 (_ BitVec 64)) (t!47475 List!32789)) )
))
(declare-fun arrayNoDuplicates!0 (array!95682 (_ BitVec 32) List!32789) Bool)

(assert (=> b!1400274 (= res!938845 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32786))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!792806 () Bool)

(declare-fun b!1400275 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10535 0))(
  ( (MissingZero!10535 (index!44517 (_ BitVec 32))) (Found!10535 (index!44518 (_ BitVec 32))) (Intermediate!10535 (undefined!11347 Bool) (index!44519 (_ BitVec 32)) (x!126159 (_ BitVec 32))) (Undefined!10535) (MissingVacant!10535 (index!44520 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95682 (_ BitVec 32)) SeekEntryResult!10535)

(assert (=> b!1400275 (= e!792806 (= (seekEntryOrOpen!0 (select (arr!46192 a!2901) j!112) a!2901 mask!2840) (Found!10535 j!112)))))

(declare-fun b!1400276 () Bool)

(declare-fun e!792809 () Bool)

(assert (=> b!1400276 (= e!792805 (not e!792809))))

(declare-fun res!938836 () Bool)

(assert (=> b!1400276 (=> res!938836 e!792809)))

(declare-fun lt!615955 () SeekEntryResult!10535)

(get-info :version)

(assert (=> b!1400276 (= res!938836 (or (not ((_ is Intermediate!10535) lt!615955)) (undefined!11347 lt!615955)))))

(assert (=> b!1400276 e!792806))

(declare-fun res!938841 () Bool)

(assert (=> b!1400276 (=> (not res!938841) (not e!792806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95682 (_ BitVec 32)) Bool)

(assert (=> b!1400276 (= res!938841 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46917 0))(
  ( (Unit!46918) )
))
(declare-fun lt!615957 () Unit!46917)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46917)

(assert (=> b!1400276 (= lt!615957 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615956 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95682 (_ BitVec 32)) SeekEntryResult!10535)

(assert (=> b!1400276 (= lt!615955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615956 (select (arr!46192 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400276 (= lt!615956 (toIndex!0 (select (arr!46192 a!2901) j!112) mask!2840))))

(declare-fun b!1400277 () Bool)

(declare-fun e!792808 () Bool)

(assert (=> b!1400277 (= e!792809 e!792808)))

(declare-fun res!938843 () Bool)

(assert (=> b!1400277 (=> res!938843 e!792808)))

(declare-fun lt!615953 () SeekEntryResult!10535)

(assert (=> b!1400277 (= res!938843 (or (= lt!615955 lt!615953) (not ((_ is Intermediate!10535) lt!615953))))))

(declare-fun lt!615958 () array!95682)

(declare-fun lt!615954 () (_ BitVec 64))

(assert (=> b!1400277 (= lt!615953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615954 mask!2840) lt!615954 lt!615958 mask!2840))))

(assert (=> b!1400277 (= lt!615954 (select (store (arr!46192 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400277 (= lt!615958 (array!95683 (store (arr!46192 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46744 a!2901)))))

(declare-fun b!1400278 () Bool)

(declare-fun res!938838 () Bool)

(assert (=> b!1400278 (=> (not res!938838) (not e!792805))))

(assert (=> b!1400278 (= res!938838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!938842 () Bool)

(assert (=> start!120320 (=> (not res!938842) (not e!792805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120320 (= res!938842 (validMask!0 mask!2840))))

(assert (=> start!120320 e!792805))

(assert (=> start!120320 true))

(declare-fun array_inv!35425 (array!95682) Bool)

(assert (=> start!120320 (array_inv!35425 a!2901)))

(declare-fun b!1400279 () Bool)

(declare-fun res!938839 () Bool)

(assert (=> b!1400279 (=> (not res!938839) (not e!792805))))

(assert (=> b!1400279 (= res!938839 (validKeyInArray!0 (select (arr!46192 a!2901) j!112)))))

(declare-fun e!792807 () Bool)

(declare-fun b!1400280 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95682 (_ BitVec 32)) SeekEntryResult!10535)

(assert (=> b!1400280 (= e!792807 (= (seekEntryOrOpen!0 lt!615954 lt!615958 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126159 lt!615953) (index!44519 lt!615953) (index!44519 lt!615953) (select (arr!46192 a!2901) j!112) lt!615958 mask!2840)))))

(declare-fun b!1400281 () Bool)

(declare-fun e!792803 () Bool)

(assert (=> b!1400281 (= e!792808 e!792803)))

(declare-fun res!938840 () Bool)

(assert (=> b!1400281 (=> res!938840 e!792803)))

(assert (=> b!1400281 (= res!938840 (or (bvslt (x!126159 lt!615955) #b00000000000000000000000000000000) (bvsgt (x!126159 lt!615955) #b01111111111111111111111111111110) (bvslt (x!126159 lt!615953) #b00000000000000000000000000000000) (bvsgt (x!126159 lt!615953) #b01111111111111111111111111111110) (bvslt lt!615956 #b00000000000000000000000000000000) (bvsge lt!615956 (size!46744 a!2901)) (bvslt (index!44519 lt!615955) #b00000000000000000000000000000000) (bvsge (index!44519 lt!615955) (size!46744 a!2901)) (bvslt (index!44519 lt!615953) #b00000000000000000000000000000000) (bvsge (index!44519 lt!615953) (size!46744 a!2901)) (not (= lt!615955 (Intermediate!10535 false (index!44519 lt!615955) (x!126159 lt!615955)))) (not (= lt!615953 (Intermediate!10535 false (index!44519 lt!615953) (x!126159 lt!615953))))))))

(assert (=> b!1400281 e!792807))

(declare-fun res!938837 () Bool)

(assert (=> b!1400281 (=> (not res!938837) (not e!792807))))

(assert (=> b!1400281 (= res!938837 (and (not (undefined!11347 lt!615953)) (= (index!44519 lt!615953) i!1037) (bvslt (x!126159 lt!615953) (x!126159 lt!615955)) (= (select (store (arr!46192 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44519 lt!615953)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615952 () Unit!46917)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46917)

(assert (=> b!1400281 (= lt!615952 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615956 (x!126159 lt!615955) (index!44519 lt!615955) (x!126159 lt!615953) (index!44519 lt!615953) (undefined!11347 lt!615953) mask!2840))))

(declare-fun b!1400282 () Bool)

(declare-fun res!938835 () Bool)

(assert (=> b!1400282 (=> (not res!938835) (not e!792805))))

(assert (=> b!1400282 (= res!938835 (and (= (size!46744 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46744 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46744 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400283 () Bool)

(assert (=> b!1400283 (= e!792803 true)))

(declare-fun lt!615959 () SeekEntryResult!10535)

(assert (=> b!1400283 (= lt!615959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615956 lt!615954 lt!615958 mask!2840))))

(assert (= (and start!120320 res!938842) b!1400282))

(assert (= (and b!1400282 res!938835) b!1400273))

(assert (= (and b!1400273 res!938844) b!1400279))

(assert (= (and b!1400279 res!938839) b!1400278))

(assert (= (and b!1400278 res!938838) b!1400274))

(assert (= (and b!1400274 res!938845) b!1400276))

(assert (= (and b!1400276 res!938841) b!1400275))

(assert (= (and b!1400276 (not res!938836)) b!1400277))

(assert (= (and b!1400277 (not res!938843)) b!1400281))

(assert (= (and b!1400281 res!938837) b!1400280))

(assert (= (and b!1400281 (not res!938840)) b!1400283))

(declare-fun m!1287241 () Bool)

(assert (=> b!1400281 m!1287241))

(declare-fun m!1287243 () Bool)

(assert (=> b!1400281 m!1287243))

(declare-fun m!1287245 () Bool)

(assert (=> b!1400281 m!1287245))

(declare-fun m!1287247 () Bool)

(assert (=> start!120320 m!1287247))

(declare-fun m!1287249 () Bool)

(assert (=> start!120320 m!1287249))

(declare-fun m!1287251 () Bool)

(assert (=> b!1400279 m!1287251))

(assert (=> b!1400279 m!1287251))

(declare-fun m!1287253 () Bool)

(assert (=> b!1400279 m!1287253))

(declare-fun m!1287255 () Bool)

(assert (=> b!1400283 m!1287255))

(assert (=> b!1400276 m!1287251))

(declare-fun m!1287257 () Bool)

(assert (=> b!1400276 m!1287257))

(assert (=> b!1400276 m!1287251))

(assert (=> b!1400276 m!1287251))

(declare-fun m!1287259 () Bool)

(assert (=> b!1400276 m!1287259))

(declare-fun m!1287261 () Bool)

(assert (=> b!1400276 m!1287261))

(declare-fun m!1287263 () Bool)

(assert (=> b!1400276 m!1287263))

(declare-fun m!1287265 () Bool)

(assert (=> b!1400273 m!1287265))

(assert (=> b!1400273 m!1287265))

(declare-fun m!1287267 () Bool)

(assert (=> b!1400273 m!1287267))

(declare-fun m!1287269 () Bool)

(assert (=> b!1400277 m!1287269))

(assert (=> b!1400277 m!1287269))

(declare-fun m!1287271 () Bool)

(assert (=> b!1400277 m!1287271))

(assert (=> b!1400277 m!1287241))

(declare-fun m!1287273 () Bool)

(assert (=> b!1400277 m!1287273))

(assert (=> b!1400275 m!1287251))

(assert (=> b!1400275 m!1287251))

(declare-fun m!1287275 () Bool)

(assert (=> b!1400275 m!1287275))

(declare-fun m!1287277 () Bool)

(assert (=> b!1400280 m!1287277))

(assert (=> b!1400280 m!1287251))

(assert (=> b!1400280 m!1287251))

(declare-fun m!1287279 () Bool)

(assert (=> b!1400280 m!1287279))

(declare-fun m!1287281 () Bool)

(assert (=> b!1400274 m!1287281))

(declare-fun m!1287283 () Bool)

(assert (=> b!1400278 m!1287283))

(check-sat (not b!1400273) (not start!120320) (not b!1400281) (not b!1400279) (not b!1400283) (not b!1400280) (not b!1400278) (not b!1400275) (not b!1400274) (not b!1400277) (not b!1400276))
(check-sat)
