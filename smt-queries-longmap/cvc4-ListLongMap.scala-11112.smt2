; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129780 () Bool)

(assert start!129780)

(declare-fun b!1523347 () Bool)

(declare-fun res!1042263 () Bool)

(declare-fun e!849305 () Bool)

(assert (=> b!1523347 (=> (not res!1042263) (not e!849305))))

(declare-datatypes ((array!101376 0))(
  ( (array!101377 (arr!48919 (Array (_ BitVec 32) (_ BitVec 64))) (size!49469 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101376)

(declare-datatypes ((List!35402 0))(
  ( (Nil!35399) (Cons!35398 (h!36822 (_ BitVec 64)) (t!50096 List!35402)) )
))
(declare-fun arrayNoDuplicates!0 (array!101376 (_ BitVec 32) List!35402) Bool)

(assert (=> b!1523347 (= res!1042263 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35399))))

(declare-fun b!1523348 () Bool)

(declare-fun res!1042257 () Bool)

(assert (=> b!1523348 (=> (not res!1042257) (not e!849305))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523348 (= res!1042257 (validKeyInArray!0 (select (arr!48919 a!2804) i!961)))))

(declare-fun e!849307 () Bool)

(declare-fun b!1523349 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13084 0))(
  ( (MissingZero!13084 (index!54731 (_ BitVec 32))) (Found!13084 (index!54732 (_ BitVec 32))) (Intermediate!13084 (undefined!13896 Bool) (index!54733 (_ BitVec 32)) (x!136418 (_ BitVec 32))) (Undefined!13084) (MissingVacant!13084 (index!54734 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101376 (_ BitVec 32)) SeekEntryResult!13084)

(assert (=> b!1523349 (= e!849307 (= (seekEntry!0 (select (arr!48919 a!2804) j!70) a!2804 mask!2512) (Found!13084 j!70)))))

(declare-fun b!1523350 () Bool)

(declare-fun res!1042262 () Bool)

(declare-fun e!849304 () Bool)

(assert (=> b!1523350 (=> (not res!1042262) (not e!849304))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!659929 () SeekEntryResult!13084)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101376 (_ BitVec 32)) SeekEntryResult!13084)

(assert (=> b!1523350 (= res!1042262 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48919 a!2804) j!70) a!2804 mask!2512) lt!659929))))

(declare-fun b!1523351 () Bool)

(assert (=> b!1523351 (= e!849305 e!849304)))

(declare-fun res!1042260 () Bool)

(assert (=> b!1523351 (=> (not res!1042260) (not e!849304))))

(declare-fun lt!659927 () SeekEntryResult!13084)

(assert (=> b!1523351 (= res!1042260 (= lt!659927 lt!659929))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523351 (= lt!659929 (Intermediate!13084 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523351 (= lt!659927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48919 a!2804) j!70) mask!2512) (select (arr!48919 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523352 () Bool)

(declare-fun res!1042258 () Bool)

(assert (=> b!1523352 (=> (not res!1042258) (not e!849305))))

(assert (=> b!1523352 (= res!1042258 (validKeyInArray!0 (select (arr!48919 a!2804) j!70)))))

(declare-fun b!1523353 () Bool)

(declare-fun res!1042264 () Bool)

(assert (=> b!1523353 (=> (not res!1042264) (not e!849304))))

(assert (=> b!1523353 (= res!1042264 (= lt!659927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48919 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48919 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101377 (store (arr!48919 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49469 a!2804)) mask!2512)))))

(declare-fun b!1523354 () Bool)

(declare-fun res!1042254 () Bool)

(assert (=> b!1523354 (=> (not res!1042254) (not e!849305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101376 (_ BitVec 32)) Bool)

(assert (=> b!1523354 (= res!1042254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1042259 () Bool)

(assert (=> start!129780 (=> (not res!1042259) (not e!849305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129780 (= res!1042259 (validMask!0 mask!2512))))

(assert (=> start!129780 e!849305))

(assert (=> start!129780 true))

(declare-fun array_inv!37947 (array!101376) Bool)

(assert (=> start!129780 (array_inv!37947 a!2804)))

(declare-fun b!1523355 () Bool)

(declare-fun res!1042255 () Bool)

(assert (=> b!1523355 (=> (not res!1042255) (not e!849305))))

(assert (=> b!1523355 (= res!1042255 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49469 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49469 a!2804))))))

(declare-fun b!1523356 () Bool)

(declare-fun res!1042261 () Bool)

(assert (=> b!1523356 (=> (not res!1042261) (not e!849305))))

(assert (=> b!1523356 (= res!1042261 (and (= (size!49469 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49469 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49469 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523357 () Bool)

(assert (=> b!1523357 (= e!849304 (not true))))

(assert (=> b!1523357 e!849307))

(declare-fun res!1042256 () Bool)

(assert (=> b!1523357 (=> (not res!1042256) (not e!849307))))

(assert (=> b!1523357 (= res!1042256 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50952 0))(
  ( (Unit!50953) )
))
(declare-fun lt!659928 () Unit!50952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50952)

(assert (=> b!1523357 (= lt!659928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129780 res!1042259) b!1523356))

(assert (= (and b!1523356 res!1042261) b!1523348))

(assert (= (and b!1523348 res!1042257) b!1523352))

(assert (= (and b!1523352 res!1042258) b!1523354))

(assert (= (and b!1523354 res!1042254) b!1523347))

(assert (= (and b!1523347 res!1042263) b!1523355))

(assert (= (and b!1523355 res!1042255) b!1523351))

(assert (= (and b!1523351 res!1042260) b!1523350))

(assert (= (and b!1523350 res!1042262) b!1523353))

(assert (= (and b!1523353 res!1042264) b!1523357))

(assert (= (and b!1523357 res!1042256) b!1523349))

(declare-fun m!1406457 () Bool)

(assert (=> b!1523353 m!1406457))

(declare-fun m!1406459 () Bool)

(assert (=> b!1523353 m!1406459))

(assert (=> b!1523353 m!1406459))

(declare-fun m!1406461 () Bool)

(assert (=> b!1523353 m!1406461))

(assert (=> b!1523353 m!1406461))

(assert (=> b!1523353 m!1406459))

(declare-fun m!1406463 () Bool)

(assert (=> b!1523353 m!1406463))

(declare-fun m!1406465 () Bool)

(assert (=> start!129780 m!1406465))

(declare-fun m!1406467 () Bool)

(assert (=> start!129780 m!1406467))

(declare-fun m!1406469 () Bool)

(assert (=> b!1523350 m!1406469))

(assert (=> b!1523350 m!1406469))

(declare-fun m!1406471 () Bool)

(assert (=> b!1523350 m!1406471))

(declare-fun m!1406473 () Bool)

(assert (=> b!1523354 m!1406473))

(assert (=> b!1523349 m!1406469))

(assert (=> b!1523349 m!1406469))

(declare-fun m!1406475 () Bool)

(assert (=> b!1523349 m!1406475))

(declare-fun m!1406477 () Bool)

(assert (=> b!1523348 m!1406477))

(assert (=> b!1523348 m!1406477))

(declare-fun m!1406479 () Bool)

(assert (=> b!1523348 m!1406479))

(declare-fun m!1406481 () Bool)

(assert (=> b!1523357 m!1406481))

(declare-fun m!1406483 () Bool)

(assert (=> b!1523357 m!1406483))

(assert (=> b!1523352 m!1406469))

(assert (=> b!1523352 m!1406469))

(declare-fun m!1406485 () Bool)

(assert (=> b!1523352 m!1406485))

(declare-fun m!1406487 () Bool)

(assert (=> b!1523347 m!1406487))

(assert (=> b!1523351 m!1406469))

(assert (=> b!1523351 m!1406469))

(declare-fun m!1406489 () Bool)

(assert (=> b!1523351 m!1406489))

(assert (=> b!1523351 m!1406489))

(assert (=> b!1523351 m!1406469))

(declare-fun m!1406491 () Bool)

(assert (=> b!1523351 m!1406491))

(push 1)

