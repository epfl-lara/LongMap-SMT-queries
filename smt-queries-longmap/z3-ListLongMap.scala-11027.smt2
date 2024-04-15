; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128942 () Bool)

(assert start!128942)

(declare-fun b!1512208 () Bool)

(declare-fun res!1032328 () Bool)

(declare-fun e!844041 () Bool)

(assert (=> b!1512208 (=> (not res!1032328) (not e!844041))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100798 0))(
  ( (array!100799 (arr!48637 (Array (_ BitVec 32) (_ BitVec 64))) (size!49189 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100798)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12831 0))(
  ( (MissingZero!12831 (index!53719 (_ BitVec 32))) (Found!12831 (index!53720 (_ BitVec 32))) (Intermediate!12831 (undefined!13643 Bool) (index!53721 (_ BitVec 32)) (x!135447 (_ BitVec 32))) (Undefined!12831) (MissingVacant!12831 (index!53722 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100798 (_ BitVec 32)) SeekEntryResult!12831)

(assert (=> b!1512208 (= res!1032328 (= (seekEntry!0 (select (arr!48637 a!2804) j!70) a!2804 mask!2512) (Found!12831 j!70)))))

(declare-fun b!1512209 () Bool)

(declare-fun e!844039 () Bool)

(assert (=> b!1512209 (= e!844039 (not true))))

(assert (=> b!1512209 e!844041))

(declare-fun res!1032317 () Bool)

(assert (=> b!1512209 (=> (not res!1032317) (not e!844041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100798 (_ BitVec 32)) Bool)

(assert (=> b!1512209 (= res!1032317 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50369 0))(
  ( (Unit!50370) )
))
(declare-fun lt!655406 () Unit!50369)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50369)

(assert (=> b!1512209 (= lt!655406 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512210 () Bool)

(declare-fun res!1032326 () Bool)

(declare-fun e!844037 () Bool)

(assert (=> b!1512210 (=> (not res!1032326) (not e!844037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512210 (= res!1032326 (validKeyInArray!0 (select (arr!48637 a!2804) j!70)))))

(declare-fun b!1512211 () Bool)

(declare-fun res!1032320 () Bool)

(assert (=> b!1512211 (=> (not res!1032320) (not e!844039))))

(declare-fun lt!655405 () SeekEntryResult!12831)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100798 (_ BitVec 32)) SeekEntryResult!12831)

(assert (=> b!1512211 (= res!1032320 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48637 a!2804) j!70) a!2804 mask!2512) lt!655405))))

(declare-fun b!1512212 () Bool)

(declare-fun res!1032325 () Bool)

(assert (=> b!1512212 (=> (not res!1032325) (not e!844037))))

(assert (=> b!1512212 (= res!1032325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512213 () Bool)

(declare-fun e!844038 () Bool)

(assert (=> b!1512213 (= e!844041 e!844038)))

(declare-fun res!1032322 () Bool)

(assert (=> b!1512213 (=> res!1032322 e!844038)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512213 (= res!1032322 (or (not (= (select (arr!48637 a!2804) j!70) (select (store (arr!48637 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48637 a!2804) index!487) (select (arr!48637 a!2804) j!70)) (not (= (select (arr!48637 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1032323 () Bool)

(assert (=> start!128942 (=> (not res!1032323) (not e!844037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128942 (= res!1032323 (validMask!0 mask!2512))))

(assert (=> start!128942 e!844037))

(assert (=> start!128942 true))

(declare-fun array_inv!37870 (array!100798) Bool)

(assert (=> start!128942 (array_inv!37870 a!2804)))

(declare-fun b!1512214 () Bool)

(declare-fun res!1032321 () Bool)

(assert (=> b!1512214 (=> (not res!1032321) (not e!844037))))

(assert (=> b!1512214 (= res!1032321 (and (= (size!49189 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49189 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49189 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512215 () Bool)

(declare-fun res!1032319 () Bool)

(assert (=> b!1512215 (=> (not res!1032319) (not e!844037))))

(assert (=> b!1512215 (= res!1032319 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49189 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49189 a!2804))))))

(declare-fun b!1512216 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100798 (_ BitVec 32)) SeekEntryResult!12831)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100798 (_ BitVec 32)) SeekEntryResult!12831)

(assert (=> b!1512216 (= e!844038 (= (seekEntryOrOpen!0 (select (arr!48637 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48637 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512217 () Bool)

(declare-fun res!1032329 () Bool)

(assert (=> b!1512217 (=> (not res!1032329) (not e!844037))))

(assert (=> b!1512217 (= res!1032329 (validKeyInArray!0 (select (arr!48637 a!2804) i!961)))))

(declare-fun b!1512218 () Bool)

(assert (=> b!1512218 (= e!844037 e!844039)))

(declare-fun res!1032324 () Bool)

(assert (=> b!1512218 (=> (not res!1032324) (not e!844039))))

(declare-fun lt!655407 () SeekEntryResult!12831)

(assert (=> b!1512218 (= res!1032324 (= lt!655407 lt!655405))))

(assert (=> b!1512218 (= lt!655405 (Intermediate!12831 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512218 (= lt!655407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48637 a!2804) j!70) mask!2512) (select (arr!48637 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512219 () Bool)

(declare-fun res!1032327 () Bool)

(assert (=> b!1512219 (=> (not res!1032327) (not e!844037))))

(declare-datatypes ((List!35198 0))(
  ( (Nil!35195) (Cons!35194 (h!36607 (_ BitVec 64)) (t!49884 List!35198)) )
))
(declare-fun arrayNoDuplicates!0 (array!100798 (_ BitVec 32) List!35198) Bool)

(assert (=> b!1512219 (= res!1032327 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35195))))

(declare-fun b!1512220 () Bool)

(declare-fun res!1032318 () Bool)

(assert (=> b!1512220 (=> (not res!1032318) (not e!844039))))

(assert (=> b!1512220 (= res!1032318 (= lt!655407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48637 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48637 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100799 (store (arr!48637 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49189 a!2804)) mask!2512)))))

(assert (= (and start!128942 res!1032323) b!1512214))

(assert (= (and b!1512214 res!1032321) b!1512217))

(assert (= (and b!1512217 res!1032329) b!1512210))

(assert (= (and b!1512210 res!1032326) b!1512212))

(assert (= (and b!1512212 res!1032325) b!1512219))

(assert (= (and b!1512219 res!1032327) b!1512215))

(assert (= (and b!1512215 res!1032319) b!1512218))

(assert (= (and b!1512218 res!1032324) b!1512211))

(assert (= (and b!1512211 res!1032320) b!1512220))

(assert (= (and b!1512220 res!1032318) b!1512209))

(assert (= (and b!1512209 res!1032317) b!1512208))

(assert (= (and b!1512208 res!1032328) b!1512213))

(assert (= (and b!1512213 (not res!1032322)) b!1512216))

(declare-fun m!1394417 () Bool)

(assert (=> b!1512213 m!1394417))

(declare-fun m!1394419 () Bool)

(assert (=> b!1512213 m!1394419))

(declare-fun m!1394421 () Bool)

(assert (=> b!1512213 m!1394421))

(declare-fun m!1394423 () Bool)

(assert (=> b!1512213 m!1394423))

(assert (=> b!1512216 m!1394417))

(assert (=> b!1512216 m!1394417))

(declare-fun m!1394425 () Bool)

(assert (=> b!1512216 m!1394425))

(assert (=> b!1512216 m!1394417))

(declare-fun m!1394427 () Bool)

(assert (=> b!1512216 m!1394427))

(assert (=> b!1512210 m!1394417))

(assert (=> b!1512210 m!1394417))

(declare-fun m!1394429 () Bool)

(assert (=> b!1512210 m!1394429))

(declare-fun m!1394431 () Bool)

(assert (=> b!1512217 m!1394431))

(assert (=> b!1512217 m!1394431))

(declare-fun m!1394433 () Bool)

(assert (=> b!1512217 m!1394433))

(assert (=> b!1512211 m!1394417))

(assert (=> b!1512211 m!1394417))

(declare-fun m!1394435 () Bool)

(assert (=> b!1512211 m!1394435))

(assert (=> b!1512218 m!1394417))

(assert (=> b!1512218 m!1394417))

(declare-fun m!1394437 () Bool)

(assert (=> b!1512218 m!1394437))

(assert (=> b!1512218 m!1394437))

(assert (=> b!1512218 m!1394417))

(declare-fun m!1394439 () Bool)

(assert (=> b!1512218 m!1394439))

(declare-fun m!1394441 () Bool)

(assert (=> b!1512209 m!1394441))

(declare-fun m!1394443 () Bool)

(assert (=> b!1512209 m!1394443))

(assert (=> b!1512208 m!1394417))

(assert (=> b!1512208 m!1394417))

(declare-fun m!1394445 () Bool)

(assert (=> b!1512208 m!1394445))

(declare-fun m!1394447 () Bool)

(assert (=> b!1512212 m!1394447))

(declare-fun m!1394449 () Bool)

(assert (=> b!1512219 m!1394449))

(declare-fun m!1394451 () Bool)

(assert (=> start!128942 m!1394451))

(declare-fun m!1394453 () Bool)

(assert (=> start!128942 m!1394453))

(assert (=> b!1512220 m!1394419))

(assert (=> b!1512220 m!1394421))

(assert (=> b!1512220 m!1394421))

(declare-fun m!1394455 () Bool)

(assert (=> b!1512220 m!1394455))

(assert (=> b!1512220 m!1394455))

(assert (=> b!1512220 m!1394421))

(declare-fun m!1394457 () Bool)

(assert (=> b!1512220 m!1394457))

(check-sat (not start!128942) (not b!1512219) (not b!1512210) (not b!1512217) (not b!1512212) (not b!1512216) (not b!1512218) (not b!1512209) (not b!1512211) (not b!1512208) (not b!1512220))
(check-sat)
