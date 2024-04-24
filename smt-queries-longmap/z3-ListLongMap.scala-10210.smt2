; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120500 () Bool)

(assert start!120500)

(declare-fun b!1401296 () Bool)

(declare-fun res!939129 () Bool)

(declare-fun e!793457 () Bool)

(assert (=> b!1401296 (=> (not res!939129) (not e!793457))))

(declare-datatypes ((array!95831 0))(
  ( (array!95832 (arr!46264 (Array (_ BitVec 32) (_ BitVec 64))) (size!46815 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95831)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401296 (= res!939129 (validKeyInArray!0 (select (arr!46264 a!2901) i!1037)))))

(declare-fun res!939133 () Bool)

(assert (=> start!120500 (=> (not res!939133) (not e!793457))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120500 (= res!939133 (validMask!0 mask!2840))))

(assert (=> start!120500 e!793457))

(assert (=> start!120500 true))

(declare-fun array_inv!35545 (array!95831) Bool)

(assert (=> start!120500 (array_inv!35545 a!2901)))

(declare-fun b!1401297 () Bool)

(declare-fun e!793456 () Bool)

(declare-fun e!793460 () Bool)

(assert (=> b!1401297 (= e!793456 e!793460)))

(declare-fun res!939132 () Bool)

(assert (=> b!1401297 (=> res!939132 e!793460)))

(declare-fun lt!616403 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10484 0))(
  ( (MissingZero!10484 (index!44313 (_ BitVec 32))) (Found!10484 (index!44314 (_ BitVec 32))) (Intermediate!10484 (undefined!11296 Bool) (index!44315 (_ BitVec 32)) (x!126114 (_ BitVec 32))) (Undefined!10484) (MissingVacant!10484 (index!44316 (_ BitVec 32))) )
))
(declare-fun lt!616399 () SeekEntryResult!10484)

(declare-fun lt!616397 () SeekEntryResult!10484)

(assert (=> b!1401297 (= res!939132 (or (bvslt (x!126114 lt!616399) #b00000000000000000000000000000000) (bvsgt (x!126114 lt!616399) #b01111111111111111111111111111110) (bvslt (x!126114 lt!616397) #b00000000000000000000000000000000) (bvsgt (x!126114 lt!616397) #b01111111111111111111111111111110) (bvslt lt!616403 #b00000000000000000000000000000000) (bvsge lt!616403 (size!46815 a!2901)) (bvslt (index!44315 lt!616399) #b00000000000000000000000000000000) (bvsge (index!44315 lt!616399) (size!46815 a!2901)) (bvslt (index!44315 lt!616397) #b00000000000000000000000000000000) (bvsge (index!44315 lt!616397) (size!46815 a!2901)) (not (= lt!616399 (Intermediate!10484 false (index!44315 lt!616399) (x!126114 lt!616399)))) (not (= lt!616397 (Intermediate!10484 false (index!44315 lt!616397) (x!126114 lt!616397))))))))

(declare-fun e!793459 () Bool)

(assert (=> b!1401297 e!793459))

(declare-fun res!939126 () Bool)

(assert (=> b!1401297 (=> (not res!939126) (not e!793459))))

(assert (=> b!1401297 (= res!939126 (and (not (undefined!11296 lt!616397)) (= (index!44315 lt!616397) i!1037) (bvslt (x!126114 lt!616397) (x!126114 lt!616399)) (= (select (store (arr!46264 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44315 lt!616397)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!46999 0))(
  ( (Unit!47000) )
))
(declare-fun lt!616396 () Unit!46999)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46999)

(assert (=> b!1401297 (= lt!616396 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616403 (x!126114 lt!616399) (index!44315 lt!616399) (x!126114 lt!616397) (index!44315 lt!616397) (undefined!11296 lt!616397) mask!2840))))

(declare-fun b!1401298 () Bool)

(declare-fun res!939125 () Bool)

(assert (=> b!1401298 (=> (not res!939125) (not e!793457))))

(assert (=> b!1401298 (= res!939125 (validKeyInArray!0 (select (arr!46264 a!2901) j!112)))))

(declare-fun b!1401299 () Bool)

(assert (=> b!1401299 (= e!793460 true)))

(declare-fun lt!616402 () (_ BitVec 64))

(declare-fun lt!616398 () array!95831)

(declare-fun lt!616400 () SeekEntryResult!10484)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95831 (_ BitVec 32)) SeekEntryResult!10484)

(assert (=> b!1401299 (= lt!616400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616403 lt!616402 lt!616398 mask!2840))))

(declare-fun b!1401300 () Bool)

(declare-fun res!939128 () Bool)

(assert (=> b!1401300 (=> (not res!939128) (not e!793457))))

(assert (=> b!1401300 (= res!939128 (and (= (size!46815 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46815 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46815 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401301 () Bool)

(declare-fun e!793455 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95831 (_ BitVec 32)) SeekEntryResult!10484)

(assert (=> b!1401301 (= e!793455 (= (seekEntryOrOpen!0 (select (arr!46264 a!2901) j!112) a!2901 mask!2840) (Found!10484 j!112)))))

(declare-fun b!1401302 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95831 (_ BitVec 32)) SeekEntryResult!10484)

(assert (=> b!1401302 (= e!793459 (= (seekEntryOrOpen!0 lt!616402 lt!616398 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126114 lt!616397) (index!44315 lt!616397) (index!44315 lt!616397) (select (arr!46264 a!2901) j!112) lt!616398 mask!2840)))))

(declare-fun b!1401303 () Bool)

(declare-fun res!939127 () Bool)

(assert (=> b!1401303 (=> (not res!939127) (not e!793457))))

(declare-datatypes ((List!32770 0))(
  ( (Nil!32767) (Cons!32766 (h!34022 (_ BitVec 64)) (t!47456 List!32770)) )
))
(declare-fun arrayNoDuplicates!0 (array!95831 (_ BitVec 32) List!32770) Bool)

(assert (=> b!1401303 (= res!939127 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32767))))

(declare-fun b!1401304 () Bool)

(declare-fun res!939130 () Bool)

(assert (=> b!1401304 (=> (not res!939130) (not e!793457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95831 (_ BitVec 32)) Bool)

(assert (=> b!1401304 (= res!939130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401305 () Bool)

(declare-fun e!793454 () Bool)

(assert (=> b!1401305 (= e!793454 e!793456)))

(declare-fun res!939124 () Bool)

(assert (=> b!1401305 (=> res!939124 e!793456)))

(get-info :version)

(assert (=> b!1401305 (= res!939124 (or (= lt!616399 lt!616397) (not ((_ is Intermediate!10484) lt!616397))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401305 (= lt!616397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616402 mask!2840) lt!616402 lt!616398 mask!2840))))

(assert (=> b!1401305 (= lt!616402 (select (store (arr!46264 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401305 (= lt!616398 (array!95832 (store (arr!46264 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46815 a!2901)))))

(declare-fun b!1401306 () Bool)

(assert (=> b!1401306 (= e!793457 (not e!793454))))

(declare-fun res!939123 () Bool)

(assert (=> b!1401306 (=> res!939123 e!793454)))

(assert (=> b!1401306 (= res!939123 (or (not ((_ is Intermediate!10484) lt!616399)) (undefined!11296 lt!616399)))))

(assert (=> b!1401306 e!793455))

(declare-fun res!939131 () Bool)

(assert (=> b!1401306 (=> (not res!939131) (not e!793455))))

(assert (=> b!1401306 (= res!939131 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616401 () Unit!46999)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46999)

(assert (=> b!1401306 (= lt!616401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401306 (= lt!616399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616403 (select (arr!46264 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401306 (= lt!616403 (toIndex!0 (select (arr!46264 a!2901) j!112) mask!2840))))

(assert (= (and start!120500 res!939133) b!1401300))

(assert (= (and b!1401300 res!939128) b!1401296))

(assert (= (and b!1401296 res!939129) b!1401298))

(assert (= (and b!1401298 res!939125) b!1401304))

(assert (= (and b!1401304 res!939130) b!1401303))

(assert (= (and b!1401303 res!939127) b!1401306))

(assert (= (and b!1401306 res!939131) b!1401301))

(assert (= (and b!1401306 (not res!939123)) b!1401305))

(assert (= (and b!1401305 (not res!939124)) b!1401297))

(assert (= (and b!1401297 res!939126) b!1401302))

(assert (= (and b!1401297 (not res!939132)) b!1401299))

(declare-fun m!1288885 () Bool)

(assert (=> b!1401296 m!1288885))

(assert (=> b!1401296 m!1288885))

(declare-fun m!1288887 () Bool)

(assert (=> b!1401296 m!1288887))

(declare-fun m!1288889 () Bool)

(assert (=> b!1401298 m!1288889))

(assert (=> b!1401298 m!1288889))

(declare-fun m!1288891 () Bool)

(assert (=> b!1401298 m!1288891))

(declare-fun m!1288893 () Bool)

(assert (=> b!1401305 m!1288893))

(assert (=> b!1401305 m!1288893))

(declare-fun m!1288895 () Bool)

(assert (=> b!1401305 m!1288895))

(declare-fun m!1288897 () Bool)

(assert (=> b!1401305 m!1288897))

(declare-fun m!1288899 () Bool)

(assert (=> b!1401305 m!1288899))

(declare-fun m!1288901 () Bool)

(assert (=> b!1401299 m!1288901))

(assert (=> b!1401297 m!1288897))

(declare-fun m!1288903 () Bool)

(assert (=> b!1401297 m!1288903))

(declare-fun m!1288905 () Bool)

(assert (=> b!1401297 m!1288905))

(declare-fun m!1288907 () Bool)

(assert (=> b!1401302 m!1288907))

(assert (=> b!1401302 m!1288889))

(assert (=> b!1401302 m!1288889))

(declare-fun m!1288909 () Bool)

(assert (=> b!1401302 m!1288909))

(declare-fun m!1288911 () Bool)

(assert (=> start!120500 m!1288911))

(declare-fun m!1288913 () Bool)

(assert (=> start!120500 m!1288913))

(assert (=> b!1401306 m!1288889))

(declare-fun m!1288915 () Bool)

(assert (=> b!1401306 m!1288915))

(assert (=> b!1401306 m!1288889))

(declare-fun m!1288917 () Bool)

(assert (=> b!1401306 m!1288917))

(assert (=> b!1401306 m!1288889))

(declare-fun m!1288919 () Bool)

(assert (=> b!1401306 m!1288919))

(declare-fun m!1288921 () Bool)

(assert (=> b!1401306 m!1288921))

(declare-fun m!1288923 () Bool)

(assert (=> b!1401303 m!1288923))

(declare-fun m!1288925 () Bool)

(assert (=> b!1401304 m!1288925))

(assert (=> b!1401301 m!1288889))

(assert (=> b!1401301 m!1288889))

(declare-fun m!1288927 () Bool)

(assert (=> b!1401301 m!1288927))

(check-sat (not b!1401305) (not b!1401302) (not b!1401297) (not b!1401306) (not b!1401299) (not start!120500) (not b!1401301) (not b!1401304) (not b!1401303) (not b!1401298) (not b!1401296))
(check-sat)
