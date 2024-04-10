; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119736 () Bool)

(assert start!119736)

(declare-fun b!1394854 () Bool)

(declare-fun res!934267 () Bool)

(declare-fun e!789694 () Bool)

(assert (=> b!1394854 (=> (not res!934267) (not e!789694))))

(declare-datatypes ((array!95418 0))(
  ( (array!95419 (arr!46067 (Array (_ BitVec 32) (_ BitVec 64))) (size!46617 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95418)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394854 (= res!934267 (validKeyInArray!0 (select (arr!46067 a!2901) j!112)))))

(declare-fun b!1394855 () Bool)

(declare-fun e!789693 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1394855 (= e!789693 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1394856 () Bool)

(declare-fun res!934268 () Bool)

(assert (=> b!1394856 (=> (not res!934268) (not e!789694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95418 (_ BitVec 32)) Bool)

(assert (=> b!1394856 (= res!934268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394857 () Bool)

(declare-fun res!934266 () Bool)

(assert (=> b!1394857 (=> (not res!934266) (not e!789694))))

(declare-datatypes ((List!32586 0))(
  ( (Nil!32583) (Cons!32582 (h!33815 (_ BitVec 64)) (t!47280 List!32586)) )
))
(declare-fun arrayNoDuplicates!0 (array!95418 (_ BitVec 32) List!32586) Bool)

(assert (=> b!1394857 (= res!934266 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32583))))

(declare-fun b!1394858 () Bool)

(declare-fun res!934264 () Bool)

(assert (=> b!1394858 (=> (not res!934264) (not e!789694))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394858 (= res!934264 (validKeyInArray!0 (select (arr!46067 a!2901) i!1037)))))

(declare-fun e!789692 () Bool)

(declare-fun b!1394860 () Bool)

(declare-datatypes ((SeekEntryResult!10384 0))(
  ( (MissingZero!10384 (index!43907 (_ BitVec 32))) (Found!10384 (index!43908 (_ BitVec 32))) (Intermediate!10384 (undefined!11196 Bool) (index!43909 (_ BitVec 32)) (x!125572 (_ BitVec 32))) (Undefined!10384) (MissingVacant!10384 (index!43910 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95418 (_ BitVec 32)) SeekEntryResult!10384)

(assert (=> b!1394860 (= e!789692 (= (seekEntryOrOpen!0 (select (arr!46067 a!2901) j!112) a!2901 mask!2840) (Found!10384 j!112)))))

(declare-fun b!1394861 () Bool)

(declare-fun res!934263 () Bool)

(assert (=> b!1394861 (=> res!934263 e!789693)))

(declare-fun lt!612777 () SeekEntryResult!10384)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95418 (_ BitVec 32)) SeekEntryResult!10384)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394861 (= res!934263 (= lt!612777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46067 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46067 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95419 (store (arr!46067 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46617 a!2901)) mask!2840)))))

(declare-fun b!1394862 () Bool)

(assert (=> b!1394862 (= e!789694 (not e!789693))))

(declare-fun res!934262 () Bool)

(assert (=> b!1394862 (=> res!934262 e!789693)))

(assert (=> b!1394862 (= res!934262 (or (not (is-Intermediate!10384 lt!612777)) (undefined!11196 lt!612777)))))

(assert (=> b!1394862 e!789692))

(declare-fun res!934270 () Bool)

(assert (=> b!1394862 (=> (not res!934270) (not e!789692))))

(assert (=> b!1394862 (= res!934270 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46772 0))(
  ( (Unit!46773) )
))
(declare-fun lt!612776 () Unit!46772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46772)

(assert (=> b!1394862 (= lt!612776 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394862 (= lt!612777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46067 a!2901) j!112) mask!2840) (select (arr!46067 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394859 () Bool)

(declare-fun res!934269 () Bool)

(assert (=> b!1394859 (=> (not res!934269) (not e!789694))))

(assert (=> b!1394859 (= res!934269 (and (= (size!46617 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46617 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46617 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!934265 () Bool)

(assert (=> start!119736 (=> (not res!934265) (not e!789694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119736 (= res!934265 (validMask!0 mask!2840))))

(assert (=> start!119736 e!789694))

(assert (=> start!119736 true))

(declare-fun array_inv!35095 (array!95418) Bool)

(assert (=> start!119736 (array_inv!35095 a!2901)))

(assert (= (and start!119736 res!934265) b!1394859))

(assert (= (and b!1394859 res!934269) b!1394858))

(assert (= (and b!1394858 res!934264) b!1394854))

(assert (= (and b!1394854 res!934267) b!1394856))

(assert (= (and b!1394856 res!934268) b!1394857))

(assert (= (and b!1394857 res!934266) b!1394862))

(assert (= (and b!1394862 res!934270) b!1394860))

(assert (= (and b!1394862 (not res!934262)) b!1394861))

(assert (= (and b!1394861 (not res!934263)) b!1394855))

(declare-fun m!1281339 () Bool)

(assert (=> b!1394861 m!1281339))

(declare-fun m!1281341 () Bool)

(assert (=> b!1394861 m!1281341))

(assert (=> b!1394861 m!1281341))

(declare-fun m!1281343 () Bool)

(assert (=> b!1394861 m!1281343))

(assert (=> b!1394861 m!1281343))

(assert (=> b!1394861 m!1281341))

(declare-fun m!1281345 () Bool)

(assert (=> b!1394861 m!1281345))

(declare-fun m!1281347 () Bool)

(assert (=> b!1394860 m!1281347))

(assert (=> b!1394860 m!1281347))

(declare-fun m!1281349 () Bool)

(assert (=> b!1394860 m!1281349))

(declare-fun m!1281351 () Bool)

(assert (=> b!1394857 m!1281351))

(declare-fun m!1281353 () Bool)

(assert (=> b!1394858 m!1281353))

(assert (=> b!1394858 m!1281353))

(declare-fun m!1281355 () Bool)

(assert (=> b!1394858 m!1281355))

(assert (=> b!1394854 m!1281347))

(assert (=> b!1394854 m!1281347))

(declare-fun m!1281357 () Bool)

(assert (=> b!1394854 m!1281357))

(declare-fun m!1281359 () Bool)

(assert (=> start!119736 m!1281359))

(declare-fun m!1281361 () Bool)

(assert (=> start!119736 m!1281361))

(assert (=> b!1394862 m!1281347))

(declare-fun m!1281363 () Bool)

(assert (=> b!1394862 m!1281363))

(assert (=> b!1394862 m!1281347))

(declare-fun m!1281365 () Bool)

(assert (=> b!1394862 m!1281365))

(assert (=> b!1394862 m!1281363))

(assert (=> b!1394862 m!1281347))

(declare-fun m!1281367 () Bool)

(assert (=> b!1394862 m!1281367))

(declare-fun m!1281369 () Bool)

(assert (=> b!1394862 m!1281369))

(declare-fun m!1281371 () Bool)

(assert (=> b!1394856 m!1281371))

(push 1)

