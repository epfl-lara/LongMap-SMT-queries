; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130032 () Bool)

(assert start!130032)

(declare-fun b!1526295 () Bool)

(declare-fun res!1044516 () Bool)

(declare-fun e!850722 () Bool)

(assert (=> b!1526295 (=> (not res!1044516) (not e!850722))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101443 0))(
  ( (array!101444 (arr!48949 (Array (_ BitVec 32) (_ BitVec 64))) (size!49501 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101443)

(declare-datatypes ((SeekEntryResult!13137 0))(
  ( (MissingZero!13137 (index!54943 (_ BitVec 32))) (Found!13137 (index!54944 (_ BitVec 32))) (Intermediate!13137 (undefined!13949 Bool) (index!54945 (_ BitVec 32)) (x!136642 (_ BitVec 32))) (Undefined!13137) (MissingVacant!13137 (index!54946 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101443 (_ BitVec 32)) SeekEntryResult!13137)

(assert (=> b!1526295 (= res!1044516 (= (seekEntry!0 (select (arr!48949 a!2804) j!70) a!2804 mask!2512) (Found!13137 j!70)))))

(declare-fun b!1526296 () Bool)

(declare-fun res!1044523 () Bool)

(declare-fun e!850719 () Bool)

(assert (=> b!1526296 (=> (not res!1044523) (not e!850719))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1526296 (= res!1044523 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49501 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49501 a!2804))))))

(declare-fun b!1526297 () Bool)

(declare-fun res!1044515 () Bool)

(assert (=> b!1526297 (=> (not res!1044515) (not e!850719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526297 (= res!1044515 (validKeyInArray!0 (select (arr!48949 a!2804) j!70)))))

(declare-fun res!1044520 () Bool)

(assert (=> start!130032 (=> (not res!1044520) (not e!850719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130032 (= res!1044520 (validMask!0 mask!2512))))

(assert (=> start!130032 e!850719))

(assert (=> start!130032 true))

(declare-fun array_inv!38182 (array!101443) Bool)

(assert (=> start!130032 (array_inv!38182 a!2804)))

(declare-fun b!1526298 () Bool)

(declare-fun res!1044522 () Bool)

(declare-fun e!850717 () Bool)

(assert (=> b!1526298 (=> (not res!1044522) (not e!850717))))

(declare-fun lt!660849 () SeekEntryResult!13137)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101443 (_ BitVec 32)) SeekEntryResult!13137)

(assert (=> b!1526298 (= res!1044522 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48949 a!2804) j!70) a!2804 mask!2512) lt!660849))))

(declare-fun b!1526299 () Bool)

(declare-fun e!850718 () Bool)

(assert (=> b!1526299 (= e!850718 (not true))))

(assert (=> b!1526299 e!850722))

(declare-fun res!1044514 () Bool)

(assert (=> b!1526299 (=> (not res!1044514) (not e!850722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101443 (_ BitVec 32)) Bool)

(assert (=> b!1526299 (= res!1044514 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50897 0))(
  ( (Unit!50898) )
))
(declare-fun lt!660851 () Unit!50897)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50897)

(assert (=> b!1526299 (= lt!660851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526300 () Bool)

(declare-fun res!1044526 () Bool)

(assert (=> b!1526300 (=> (not res!1044526) (not e!850719))))

(declare-datatypes ((List!35510 0))(
  ( (Nil!35507) (Cons!35506 (h!36940 (_ BitVec 64)) (t!50196 List!35510)) )
))
(declare-fun arrayNoDuplicates!0 (array!101443 (_ BitVec 32) List!35510) Bool)

(assert (=> b!1526300 (= res!1044526 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35507))))

(declare-fun b!1526301 () Bool)

(declare-fun res!1044521 () Bool)

(assert (=> b!1526301 (=> (not res!1044521) (not e!850719))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526301 (= res!1044521 (validKeyInArray!0 (select (arr!48949 a!2804) i!961)))))

(declare-fun lt!660852 () array!101443)

(declare-fun e!850721 () Bool)

(declare-fun b!1526302 () Bool)

(declare-fun lt!660848 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101443 (_ BitVec 32)) SeekEntryResult!13137)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101443 (_ BitVec 32)) SeekEntryResult!13137)

(assert (=> b!1526302 (= e!850721 (= (seekEntryOrOpen!0 lt!660848 lt!660852 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660848 lt!660852 mask!2512)))))

(declare-fun b!1526303 () Bool)

(assert (=> b!1526303 (= e!850719 e!850717)))

(declare-fun res!1044524 () Bool)

(assert (=> b!1526303 (=> (not res!1044524) (not e!850717))))

(declare-fun lt!660850 () SeekEntryResult!13137)

(assert (=> b!1526303 (= res!1044524 (= lt!660850 lt!660849))))

(assert (=> b!1526303 (= lt!660849 (Intermediate!13137 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526303 (= lt!660850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48949 a!2804) j!70) mask!2512) (select (arr!48949 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526304 () Bool)

(declare-fun e!850720 () Bool)

(assert (=> b!1526304 (= e!850722 e!850720)))

(declare-fun res!1044519 () Bool)

(assert (=> b!1526304 (=> res!1044519 e!850720)))

(assert (=> b!1526304 (= res!1044519 (or (not (= (select (arr!48949 a!2804) j!70) lt!660848)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48949 a!2804) index!487) (select (arr!48949 a!2804) j!70)) (not (= (select (arr!48949 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526305 () Bool)

(assert (=> b!1526305 (= e!850717 e!850718)))

(declare-fun res!1044517 () Bool)

(assert (=> b!1526305 (=> (not res!1044517) (not e!850718))))

(assert (=> b!1526305 (= res!1044517 (= lt!660850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660848 mask!2512) lt!660848 lt!660852 mask!2512)))))

(assert (=> b!1526305 (= lt!660848 (select (store (arr!48949 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526305 (= lt!660852 (array!101444 (store (arr!48949 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49501 a!2804)))))

(declare-fun b!1526306 () Bool)

(declare-fun res!1044525 () Bool)

(assert (=> b!1526306 (=> (not res!1044525) (not e!850719))))

(assert (=> b!1526306 (= res!1044525 (and (= (size!49501 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49501 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49501 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526307 () Bool)

(assert (=> b!1526307 (= e!850720 e!850721)))

(declare-fun res!1044518 () Bool)

(assert (=> b!1526307 (=> (not res!1044518) (not e!850721))))

(assert (=> b!1526307 (= res!1044518 (= (seekEntryOrOpen!0 (select (arr!48949 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48949 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526308 () Bool)

(declare-fun res!1044513 () Bool)

(assert (=> b!1526308 (=> (not res!1044513) (not e!850719))))

(assert (=> b!1526308 (= res!1044513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130032 res!1044520) b!1526306))

(assert (= (and b!1526306 res!1044525) b!1526301))

(assert (= (and b!1526301 res!1044521) b!1526297))

(assert (= (and b!1526297 res!1044515) b!1526308))

(assert (= (and b!1526308 res!1044513) b!1526300))

(assert (= (and b!1526300 res!1044526) b!1526296))

(assert (= (and b!1526296 res!1044523) b!1526303))

(assert (= (and b!1526303 res!1044524) b!1526298))

(assert (= (and b!1526298 res!1044522) b!1526305))

(assert (= (and b!1526305 res!1044517) b!1526299))

(assert (= (and b!1526299 res!1044514) b!1526295))

(assert (= (and b!1526295 res!1044516) b!1526304))

(assert (= (and b!1526304 (not res!1044519)) b!1526307))

(assert (= (and b!1526307 res!1044518) b!1526302))

(declare-fun m!1408535 () Bool)

(assert (=> b!1526300 m!1408535))

(declare-fun m!1408537 () Bool)

(assert (=> b!1526307 m!1408537))

(assert (=> b!1526307 m!1408537))

(declare-fun m!1408539 () Bool)

(assert (=> b!1526307 m!1408539))

(assert (=> b!1526307 m!1408537))

(declare-fun m!1408541 () Bool)

(assert (=> b!1526307 m!1408541))

(declare-fun m!1408543 () Bool)

(assert (=> b!1526299 m!1408543))

(declare-fun m!1408545 () Bool)

(assert (=> b!1526299 m!1408545))

(assert (=> b!1526295 m!1408537))

(assert (=> b!1526295 m!1408537))

(declare-fun m!1408547 () Bool)

(assert (=> b!1526295 m!1408547))

(assert (=> b!1526298 m!1408537))

(assert (=> b!1526298 m!1408537))

(declare-fun m!1408549 () Bool)

(assert (=> b!1526298 m!1408549))

(declare-fun m!1408551 () Bool)

(assert (=> b!1526308 m!1408551))

(declare-fun m!1408553 () Bool)

(assert (=> start!130032 m!1408553))

(declare-fun m!1408555 () Bool)

(assert (=> start!130032 m!1408555))

(declare-fun m!1408557 () Bool)

(assert (=> b!1526302 m!1408557))

(declare-fun m!1408559 () Bool)

(assert (=> b!1526302 m!1408559))

(assert (=> b!1526297 m!1408537))

(assert (=> b!1526297 m!1408537))

(declare-fun m!1408561 () Bool)

(assert (=> b!1526297 m!1408561))

(declare-fun m!1408563 () Bool)

(assert (=> b!1526301 m!1408563))

(assert (=> b!1526301 m!1408563))

(declare-fun m!1408565 () Bool)

(assert (=> b!1526301 m!1408565))

(assert (=> b!1526303 m!1408537))

(assert (=> b!1526303 m!1408537))

(declare-fun m!1408567 () Bool)

(assert (=> b!1526303 m!1408567))

(assert (=> b!1526303 m!1408567))

(assert (=> b!1526303 m!1408537))

(declare-fun m!1408569 () Bool)

(assert (=> b!1526303 m!1408569))

(declare-fun m!1408571 () Bool)

(assert (=> b!1526305 m!1408571))

(assert (=> b!1526305 m!1408571))

(declare-fun m!1408573 () Bool)

(assert (=> b!1526305 m!1408573))

(declare-fun m!1408575 () Bool)

(assert (=> b!1526305 m!1408575))

(declare-fun m!1408577 () Bool)

(assert (=> b!1526305 m!1408577))

(assert (=> b!1526304 m!1408537))

(declare-fun m!1408579 () Bool)

(assert (=> b!1526304 m!1408579))

(check-sat (not b!1526295) (not b!1526308) (not b!1526302) (not b!1526307) (not b!1526305) (not b!1526299) (not b!1526298) (not b!1526301) (not b!1526303) (not b!1526300) (not b!1526297) (not start!130032))
(check-sat)
