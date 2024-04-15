; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119702 () Bool)

(assert start!119702)

(declare-fun b!1394359 () Bool)

(declare-fun res!933824 () Bool)

(declare-fun e!789467 () Bool)

(assert (=> b!1394359 (=> (not res!933824) (not e!789467))))

(declare-datatypes ((array!95337 0))(
  ( (array!95338 (arr!46027 (Array (_ BitVec 32) (_ BitVec 64))) (size!46579 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95337)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394359 (= res!933824 (validKeyInArray!0 (select (arr!46027 a!2901) j!112)))))

(declare-fun b!1394360 () Bool)

(declare-fun res!933818 () Bool)

(assert (=> b!1394360 (=> (not res!933818) (not e!789467))))

(declare-datatypes ((List!32624 0))(
  ( (Nil!32621) (Cons!32620 (h!33853 (_ BitVec 64)) (t!47310 List!32624)) )
))
(declare-fun arrayNoDuplicates!0 (array!95337 (_ BitVec 32) List!32624) Bool)

(assert (=> b!1394360 (= res!933818 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32621))))

(declare-fun b!1394361 () Bool)

(declare-fun e!789464 () Bool)

(declare-fun e!789466 () Bool)

(assert (=> b!1394361 (= e!789464 e!789466)))

(declare-fun res!933820 () Bool)

(assert (=> b!1394361 (=> res!933820 e!789466)))

(declare-fun lt!612284 () array!95337)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!612283 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10370 0))(
  ( (MissingZero!10370 (index!43851 (_ BitVec 32))) (Found!10370 (index!43852 (_ BitVec 32))) (Intermediate!10370 (undefined!11182 Bool) (index!43853 (_ BitVec 32)) (x!125515 (_ BitVec 32))) (Undefined!10370) (MissingVacant!10370 (index!43854 (_ BitVec 32))) )
))
(declare-fun lt!612281 () SeekEntryResult!10370)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95337 (_ BitVec 32)) SeekEntryResult!10370)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394361 (= res!933820 (not (= lt!612281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612283 mask!2840) lt!612283 lt!612284 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394361 (= lt!612283 (select (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394361 (= lt!612284 (array!95338 (store (arr!46027 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46579 a!2901)))))

(declare-fun b!1394362 () Bool)

(declare-fun res!933826 () Bool)

(assert (=> b!1394362 (=> res!933826 e!789466)))

(declare-fun lt!612287 () (_ BitVec 32))

(assert (=> b!1394362 (= res!933826 (or (bvslt (x!125515 lt!612281) #b00000000000000000000000000000000) (bvsgt (x!125515 lt!612281) #b01111111111111111111111111111110) (bvslt lt!612287 #b00000000000000000000000000000000) (bvsge lt!612287 (size!46579 a!2901)) (bvslt (index!43853 lt!612281) #b00000000000000000000000000000000) (bvsge (index!43853 lt!612281) (size!46579 a!2901)) (not (= lt!612281 (Intermediate!10370 false (index!43853 lt!612281) (x!125515 lt!612281))))))))

(declare-fun b!1394363 () Bool)

(assert (=> b!1394363 (= e!789466 true)))

(declare-fun lt!612286 () SeekEntryResult!10370)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95337 (_ BitVec 32)) SeekEntryResult!10370)

(assert (=> b!1394363 (= lt!612286 (seekEntryOrOpen!0 lt!612283 lt!612284 mask!2840))))

(declare-datatypes ((Unit!46587 0))(
  ( (Unit!46588) )
))
(declare-fun lt!612285 () Unit!46587)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46587)

(assert (=> b!1394363 (= lt!612285 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612287 (x!125515 lt!612281) (index!43853 lt!612281) mask!2840))))

(declare-fun b!1394364 () Bool)

(declare-fun res!933823 () Bool)

(assert (=> b!1394364 (=> (not res!933823) (not e!789467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95337 (_ BitVec 32)) Bool)

(assert (=> b!1394364 (= res!933823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!933825 () Bool)

(assert (=> start!119702 (=> (not res!933825) (not e!789467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119702 (= res!933825 (validMask!0 mask!2840))))

(assert (=> start!119702 e!789467))

(assert (=> start!119702 true))

(declare-fun array_inv!35260 (array!95337) Bool)

(assert (=> start!119702 (array_inv!35260 a!2901)))

(declare-fun b!1394365 () Bool)

(declare-fun res!933819 () Bool)

(assert (=> b!1394365 (=> (not res!933819) (not e!789467))))

(assert (=> b!1394365 (= res!933819 (and (= (size!46579 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46579 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46579 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394366 () Bool)

(declare-fun res!933822 () Bool)

(assert (=> b!1394366 (=> (not res!933822) (not e!789467))))

(assert (=> b!1394366 (= res!933822 (validKeyInArray!0 (select (arr!46027 a!2901) i!1037)))))

(declare-fun b!1394367 () Bool)

(assert (=> b!1394367 (= e!789467 (not e!789464))))

(declare-fun res!933821 () Bool)

(assert (=> b!1394367 (=> res!933821 e!789464)))

(get-info :version)

(assert (=> b!1394367 (= res!933821 (or (not ((_ is Intermediate!10370) lt!612281)) (undefined!11182 lt!612281)))))

(assert (=> b!1394367 (= lt!612286 (Found!10370 j!112))))

(assert (=> b!1394367 (= lt!612286 (seekEntryOrOpen!0 (select (arr!46027 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394367 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612282 () Unit!46587)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46587)

(assert (=> b!1394367 (= lt!612282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394367 (= lt!612281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612287 (select (arr!46027 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394367 (= lt!612287 (toIndex!0 (select (arr!46027 a!2901) j!112) mask!2840))))

(assert (= (and start!119702 res!933825) b!1394365))

(assert (= (and b!1394365 res!933819) b!1394366))

(assert (= (and b!1394366 res!933822) b!1394359))

(assert (= (and b!1394359 res!933824) b!1394364))

(assert (= (and b!1394364 res!933823) b!1394360))

(assert (= (and b!1394360 res!933818) b!1394367))

(assert (= (and b!1394367 (not res!933821)) b!1394361))

(assert (= (and b!1394361 (not res!933820)) b!1394362))

(assert (= (and b!1394362 (not res!933826)) b!1394363))

(declare-fun m!1280227 () Bool)

(assert (=> b!1394359 m!1280227))

(assert (=> b!1394359 m!1280227))

(declare-fun m!1280229 () Bool)

(assert (=> b!1394359 m!1280229))

(declare-fun m!1280231 () Bool)

(assert (=> b!1394364 m!1280231))

(assert (=> b!1394367 m!1280227))

(declare-fun m!1280233 () Bool)

(assert (=> b!1394367 m!1280233))

(assert (=> b!1394367 m!1280227))

(declare-fun m!1280235 () Bool)

(assert (=> b!1394367 m!1280235))

(assert (=> b!1394367 m!1280227))

(declare-fun m!1280237 () Bool)

(assert (=> b!1394367 m!1280237))

(assert (=> b!1394367 m!1280227))

(declare-fun m!1280239 () Bool)

(assert (=> b!1394367 m!1280239))

(declare-fun m!1280241 () Bool)

(assert (=> b!1394367 m!1280241))

(declare-fun m!1280243 () Bool)

(assert (=> b!1394360 m!1280243))

(declare-fun m!1280245 () Bool)

(assert (=> start!119702 m!1280245))

(declare-fun m!1280247 () Bool)

(assert (=> start!119702 m!1280247))

(declare-fun m!1280249 () Bool)

(assert (=> b!1394363 m!1280249))

(declare-fun m!1280251 () Bool)

(assert (=> b!1394363 m!1280251))

(declare-fun m!1280253 () Bool)

(assert (=> b!1394361 m!1280253))

(assert (=> b!1394361 m!1280253))

(declare-fun m!1280255 () Bool)

(assert (=> b!1394361 m!1280255))

(declare-fun m!1280257 () Bool)

(assert (=> b!1394361 m!1280257))

(declare-fun m!1280259 () Bool)

(assert (=> b!1394361 m!1280259))

(declare-fun m!1280261 () Bool)

(assert (=> b!1394366 m!1280261))

(assert (=> b!1394366 m!1280261))

(declare-fun m!1280263 () Bool)

(assert (=> b!1394366 m!1280263))

(check-sat (not b!1394366) (not b!1394367) (not b!1394364) (not b!1394359) (not start!119702) (not b!1394361) (not b!1394360) (not b!1394363))
(check-sat)
