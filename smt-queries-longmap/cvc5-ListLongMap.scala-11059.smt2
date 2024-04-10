; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129186 () Bool)

(assert start!129186)

(declare-fun b!1516382 () Bool)

(declare-fun res!1036285 () Bool)

(declare-fun e!846129 () Bool)

(assert (=> b!1516382 (=> (not res!1036285) (not e!846129))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((array!101042 0))(
  ( (array!101043 (arr!48758 (Array (_ BitVec 32) (_ BitVec 64))) (size!49308 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101042)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1516382 (= res!1036285 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49308 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49308 a!2804))))))

(declare-fun b!1516383 () Bool)

(declare-fun e!846130 () Bool)

(declare-fun e!846125 () Bool)

(assert (=> b!1516383 (= e!846130 e!846125)))

(declare-fun res!1036287 () Bool)

(assert (=> b!1516383 (=> res!1036287 e!846125)))

(declare-fun lt!657380 () (_ BitVec 32))

(assert (=> b!1516383 (= res!1036287 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657380 #b00000000000000000000000000000000) (bvsge lt!657380 (size!49308 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516383 (= lt!657380 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516384 () Bool)

(declare-fun res!1036288 () Bool)

(declare-fun e!846126 () Bool)

(assert (=> b!1516384 (=> (not res!1036288) (not e!846126))))

(declare-datatypes ((SeekEntryResult!12929 0))(
  ( (MissingZero!12929 (index!54111 (_ BitVec 32))) (Found!12929 (index!54112 (_ BitVec 32))) (Intermediate!12929 (undefined!13741 Bool) (index!54113 (_ BitVec 32)) (x!135807 (_ BitVec 32))) (Undefined!12929) (MissingVacant!12929 (index!54114 (_ BitVec 32))) )
))
(declare-fun lt!657382 () SeekEntryResult!12929)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101042 (_ BitVec 32)) SeekEntryResult!12929)

(assert (=> b!1516384 (= res!1036288 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48758 a!2804) j!70) a!2804 mask!2512) lt!657382))))

(declare-fun b!1516385 () Bool)

(declare-fun res!1036297 () Bool)

(assert (=> b!1516385 (=> (not res!1036297) (not e!846129))))

(declare-datatypes ((List!35241 0))(
  ( (Nil!35238) (Cons!35237 (h!36649 (_ BitVec 64)) (t!49935 List!35241)) )
))
(declare-fun arrayNoDuplicates!0 (array!101042 (_ BitVec 32) List!35241) Bool)

(assert (=> b!1516385 (= res!1036297 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35238))))

(declare-fun b!1516386 () Bool)

(assert (=> b!1516386 (= e!846125 true)))

(declare-fun lt!657381 () SeekEntryResult!12929)

(assert (=> b!1516386 (= lt!657381 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657380 (select (arr!48758 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1036291 () Bool)

(assert (=> start!129186 (=> (not res!1036291) (not e!846129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129186 (= res!1036291 (validMask!0 mask!2512))))

(assert (=> start!129186 e!846129))

(assert (=> start!129186 true))

(declare-fun array_inv!37786 (array!101042) Bool)

(assert (=> start!129186 (array_inv!37786 a!2804)))

(declare-fun b!1516387 () Bool)

(declare-fun res!1036294 () Bool)

(assert (=> b!1516387 (=> (not res!1036294) (not e!846129))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516387 (= res!1036294 (validKeyInArray!0 (select (arr!48758 a!2804) i!961)))))

(declare-fun b!1516388 () Bool)

(assert (=> b!1516388 (= e!846126 (not e!846130))))

(declare-fun res!1036293 () Bool)

(assert (=> b!1516388 (=> res!1036293 e!846130)))

(assert (=> b!1516388 (= res!1036293 (or (not (= (select (arr!48758 a!2804) j!70) (select (store (arr!48758 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846127 () Bool)

(assert (=> b!1516388 e!846127))

(declare-fun res!1036296 () Bool)

(assert (=> b!1516388 (=> (not res!1036296) (not e!846127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101042 (_ BitVec 32)) Bool)

(assert (=> b!1516388 (= res!1036296 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50726 0))(
  ( (Unit!50727) )
))
(declare-fun lt!657379 () Unit!50726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50726)

(assert (=> b!1516388 (= lt!657379 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516389 () Bool)

(declare-fun res!1036286 () Bool)

(assert (=> b!1516389 (=> (not res!1036286) (not e!846129))))

(assert (=> b!1516389 (= res!1036286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516390 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101042 (_ BitVec 32)) SeekEntryResult!12929)

(assert (=> b!1516390 (= e!846127 (= (seekEntry!0 (select (arr!48758 a!2804) j!70) a!2804 mask!2512) (Found!12929 j!70)))))

(declare-fun b!1516391 () Bool)

(assert (=> b!1516391 (= e!846129 e!846126)))

(declare-fun res!1036290 () Bool)

(assert (=> b!1516391 (=> (not res!1036290) (not e!846126))))

(declare-fun lt!657378 () SeekEntryResult!12929)

(assert (=> b!1516391 (= res!1036290 (= lt!657378 lt!657382))))

(assert (=> b!1516391 (= lt!657382 (Intermediate!12929 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516391 (= lt!657378 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48758 a!2804) j!70) mask!2512) (select (arr!48758 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516392 () Bool)

(declare-fun res!1036289 () Bool)

(assert (=> b!1516392 (=> (not res!1036289) (not e!846129))))

(assert (=> b!1516392 (= res!1036289 (and (= (size!49308 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49308 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49308 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516393 () Bool)

(declare-fun res!1036292 () Bool)

(assert (=> b!1516393 (=> (not res!1036292) (not e!846129))))

(assert (=> b!1516393 (= res!1036292 (validKeyInArray!0 (select (arr!48758 a!2804) j!70)))))

(declare-fun b!1516394 () Bool)

(declare-fun res!1036295 () Bool)

(assert (=> b!1516394 (=> (not res!1036295) (not e!846126))))

(assert (=> b!1516394 (= res!1036295 (= lt!657378 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48758 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48758 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101043 (store (arr!48758 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49308 a!2804)) mask!2512)))))

(assert (= (and start!129186 res!1036291) b!1516392))

(assert (= (and b!1516392 res!1036289) b!1516387))

(assert (= (and b!1516387 res!1036294) b!1516393))

(assert (= (and b!1516393 res!1036292) b!1516389))

(assert (= (and b!1516389 res!1036286) b!1516385))

(assert (= (and b!1516385 res!1036297) b!1516382))

(assert (= (and b!1516382 res!1036285) b!1516391))

(assert (= (and b!1516391 res!1036290) b!1516384))

(assert (= (and b!1516384 res!1036288) b!1516394))

(assert (= (and b!1516394 res!1036295) b!1516388))

(assert (= (and b!1516388 res!1036296) b!1516390))

(assert (= (and b!1516388 (not res!1036293)) b!1516383))

(assert (= (and b!1516383 (not res!1036287)) b!1516386))

(declare-fun m!1399645 () Bool)

(assert (=> b!1516385 m!1399645))

(declare-fun m!1399647 () Bool)

(assert (=> b!1516388 m!1399647))

(declare-fun m!1399649 () Bool)

(assert (=> b!1516388 m!1399649))

(declare-fun m!1399651 () Bool)

(assert (=> b!1516388 m!1399651))

(declare-fun m!1399653 () Bool)

(assert (=> b!1516388 m!1399653))

(declare-fun m!1399655 () Bool)

(assert (=> b!1516388 m!1399655))

(assert (=> b!1516386 m!1399647))

(assert (=> b!1516386 m!1399647))

(declare-fun m!1399657 () Bool)

(assert (=> b!1516386 m!1399657))

(assert (=> b!1516394 m!1399651))

(assert (=> b!1516394 m!1399653))

(assert (=> b!1516394 m!1399653))

(declare-fun m!1399659 () Bool)

(assert (=> b!1516394 m!1399659))

(assert (=> b!1516394 m!1399659))

(assert (=> b!1516394 m!1399653))

(declare-fun m!1399661 () Bool)

(assert (=> b!1516394 m!1399661))

(declare-fun m!1399663 () Bool)

(assert (=> start!129186 m!1399663))

(declare-fun m!1399665 () Bool)

(assert (=> start!129186 m!1399665))

(declare-fun m!1399667 () Bool)

(assert (=> b!1516383 m!1399667))

(declare-fun m!1399669 () Bool)

(assert (=> b!1516387 m!1399669))

(assert (=> b!1516387 m!1399669))

(declare-fun m!1399671 () Bool)

(assert (=> b!1516387 m!1399671))

(assert (=> b!1516393 m!1399647))

(assert (=> b!1516393 m!1399647))

(declare-fun m!1399673 () Bool)

(assert (=> b!1516393 m!1399673))

(assert (=> b!1516390 m!1399647))

(assert (=> b!1516390 m!1399647))

(declare-fun m!1399675 () Bool)

(assert (=> b!1516390 m!1399675))

(declare-fun m!1399677 () Bool)

(assert (=> b!1516389 m!1399677))

(assert (=> b!1516384 m!1399647))

(assert (=> b!1516384 m!1399647))

(declare-fun m!1399679 () Bool)

(assert (=> b!1516384 m!1399679))

(assert (=> b!1516391 m!1399647))

(assert (=> b!1516391 m!1399647))

(declare-fun m!1399681 () Bool)

(assert (=> b!1516391 m!1399681))

(assert (=> b!1516391 m!1399681))

(assert (=> b!1516391 m!1399647))

(declare-fun m!1399683 () Bool)

(assert (=> b!1516391 m!1399683))

(push 1)

