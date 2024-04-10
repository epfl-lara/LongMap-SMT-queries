; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130530 () Bool)

(assert start!130530)

(declare-fun b!1531789 () Bool)

(declare-fun e!853507 () Bool)

(assert (=> b!1531789 (= e!853507 true)))

(declare-datatypes ((array!101709 0))(
  ( (array!101710 (arr!49075 (Array (_ BitVec 32) (_ BitVec 64))) (size!49625 (_ BitVec 32))) )
))
(declare-fun lt!663381 () array!101709)

(declare-fun lt!663382 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun a!2804 () array!101709)

(declare-datatypes ((SeekEntryResult!13240 0))(
  ( (MissingZero!13240 (index!55355 (_ BitVec 32))) (Found!13240 (index!55356 (_ BitVec 32))) (Intermediate!13240 (undefined!14052 Bool) (index!55357 (_ BitVec 32)) (x!137050 (_ BitVec 32))) (Undefined!13240) (MissingVacant!13240 (index!55358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101709 (_ BitVec 32)) SeekEntryResult!13240)

(assert (=> b!1531789 (= (seekEntryOrOpen!0 (select (arr!49075 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663382 lt!663381 mask!2512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!663385 () (_ BitVec 32))

(declare-datatypes ((Unit!51264 0))(
  ( (Unit!51265) )
))
(declare-fun lt!663380 () Unit!51264)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51264)

(assert (=> b!1531789 (= lt!663380 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663385 resX!21 resIndex!21 mask!2512))))

(declare-fun res!1048939 () Bool)

(declare-fun e!853508 () Bool)

(assert (=> start!130530 (=> (not res!1048939) (not e!853508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130530 (= res!1048939 (validMask!0 mask!2512))))

(assert (=> start!130530 e!853508))

(assert (=> start!130530 true))

(declare-fun array_inv!38103 (array!101709) Bool)

(assert (=> start!130530 (array_inv!38103 a!2804)))

(declare-fun b!1531790 () Bool)

(declare-fun res!1048938 () Bool)

(declare-fun e!853509 () Bool)

(assert (=> b!1531790 (=> (not res!1048938) (not e!853509))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!663383 () SeekEntryResult!13240)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101709 (_ BitVec 32)) SeekEntryResult!13240)

(assert (=> b!1531790 (= res!1048938 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49075 a!2804) j!70) a!2804 mask!2512) lt!663383))))

(declare-fun b!1531791 () Bool)

(declare-fun e!853506 () Bool)

(declare-fun e!853510 () Bool)

(assert (=> b!1531791 (= e!853506 (not e!853510))))

(declare-fun res!1048929 () Bool)

(assert (=> b!1531791 (=> res!1048929 e!853510)))

(assert (=> b!1531791 (= res!1048929 (or (not (= (select (arr!49075 a!2804) j!70) lt!663382)) (= x!534 resX!21)))))

(declare-fun e!853504 () Bool)

(assert (=> b!1531791 e!853504))

(declare-fun res!1048930 () Bool)

(assert (=> b!1531791 (=> (not res!1048930) (not e!853504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101709 (_ BitVec 32)) Bool)

(assert (=> b!1531791 (= res!1048930 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663384 () Unit!51264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51264)

(assert (=> b!1531791 (= lt!663384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531792 () Bool)

(declare-fun res!1048940 () Bool)

(assert (=> b!1531792 (=> (not res!1048940) (not e!853508))))

(assert (=> b!1531792 (= res!1048940 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49625 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49625 a!2804))))))

(declare-fun b!1531793 () Bool)

(assert (=> b!1531793 (= e!853508 e!853509)))

(declare-fun res!1048932 () Bool)

(assert (=> b!1531793 (=> (not res!1048932) (not e!853509))))

(declare-fun lt!663379 () SeekEntryResult!13240)

(assert (=> b!1531793 (= res!1048932 (= lt!663379 lt!663383))))

(assert (=> b!1531793 (= lt!663383 (Intermediate!13240 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531793 (= lt!663379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49075 a!2804) j!70) mask!2512) (select (arr!49075 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531794 () Bool)

(declare-fun res!1048935 () Bool)

(assert (=> b!1531794 (=> res!1048935 e!853507)))

(assert (=> b!1531794 (= res!1048935 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663385 (select (arr!49075 a!2804) j!70) a!2804 mask!2512) lt!663383)))))

(declare-fun b!1531795 () Bool)

(declare-fun res!1048941 () Bool)

(assert (=> b!1531795 (=> (not res!1048941) (not e!853508))))

(declare-datatypes ((List!35558 0))(
  ( (Nil!35555) (Cons!35554 (h!36999 (_ BitVec 64)) (t!50252 List!35558)) )
))
(declare-fun arrayNoDuplicates!0 (array!101709 (_ BitVec 32) List!35558) Bool)

(assert (=> b!1531795 (= res!1048941 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35555))))

(declare-fun b!1531796 () Bool)

(declare-fun res!1048934 () Bool)

(assert (=> b!1531796 (=> (not res!1048934) (not e!853508))))

(assert (=> b!1531796 (= res!1048934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531797 () Bool)

(declare-fun res!1048937 () Bool)

(assert (=> b!1531797 (=> (not res!1048937) (not e!853508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531797 (= res!1048937 (validKeyInArray!0 (select (arr!49075 a!2804) i!961)))))

(declare-fun b!1531798 () Bool)

(declare-fun res!1048942 () Bool)

(assert (=> b!1531798 (=> (not res!1048942) (not e!853508))))

(assert (=> b!1531798 (= res!1048942 (and (= (size!49625 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49625 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49625 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531799 () Bool)

(declare-fun res!1048931 () Bool)

(assert (=> b!1531799 (=> (not res!1048931) (not e!853508))))

(assert (=> b!1531799 (= res!1048931 (validKeyInArray!0 (select (arr!49075 a!2804) j!70)))))

(declare-fun b!1531800 () Bool)

(assert (=> b!1531800 (= e!853509 e!853506)))

(declare-fun res!1048933 () Bool)

(assert (=> b!1531800 (=> (not res!1048933) (not e!853506))))

(assert (=> b!1531800 (= res!1048933 (= lt!663379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663382 mask!2512) lt!663382 lt!663381 mask!2512)))))

(assert (=> b!1531800 (= lt!663382 (select (store (arr!49075 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531800 (= lt!663381 (array!101710 (store (arr!49075 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49625 a!2804)))))

(declare-fun b!1531801 () Bool)

(assert (=> b!1531801 (= e!853510 e!853507)))

(declare-fun res!1048936 () Bool)

(assert (=> b!1531801 (=> res!1048936 e!853507)))

(assert (=> b!1531801 (= res!1048936 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663385 #b00000000000000000000000000000000) (bvsge lt!663385 (size!49625 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531801 (= lt!663385 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531802 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101709 (_ BitVec 32)) SeekEntryResult!13240)

(assert (=> b!1531802 (= e!853504 (= (seekEntry!0 (select (arr!49075 a!2804) j!70) a!2804 mask!2512) (Found!13240 j!70)))))

(assert (= (and start!130530 res!1048939) b!1531798))

(assert (= (and b!1531798 res!1048942) b!1531797))

(assert (= (and b!1531797 res!1048937) b!1531799))

(assert (= (and b!1531799 res!1048931) b!1531796))

(assert (= (and b!1531796 res!1048934) b!1531795))

(assert (= (and b!1531795 res!1048941) b!1531792))

(assert (= (and b!1531792 res!1048940) b!1531793))

(assert (= (and b!1531793 res!1048932) b!1531790))

(assert (= (and b!1531790 res!1048938) b!1531800))

(assert (= (and b!1531800 res!1048933) b!1531791))

(assert (= (and b!1531791 res!1048930) b!1531802))

(assert (= (and b!1531791 (not res!1048929)) b!1531801))

(assert (= (and b!1531801 (not res!1048936)) b!1531794))

(assert (= (and b!1531794 (not res!1048935)) b!1531789))

(declare-fun m!1414451 () Bool)

(assert (=> b!1531789 m!1414451))

(assert (=> b!1531789 m!1414451))

(declare-fun m!1414453 () Bool)

(assert (=> b!1531789 m!1414453))

(declare-fun m!1414455 () Bool)

(assert (=> b!1531789 m!1414455))

(declare-fun m!1414457 () Bool)

(assert (=> b!1531789 m!1414457))

(assert (=> b!1531802 m!1414451))

(assert (=> b!1531802 m!1414451))

(declare-fun m!1414459 () Bool)

(assert (=> b!1531802 m!1414459))

(assert (=> b!1531791 m!1414451))

(declare-fun m!1414461 () Bool)

(assert (=> b!1531791 m!1414461))

(declare-fun m!1414463 () Bool)

(assert (=> b!1531791 m!1414463))

(declare-fun m!1414465 () Bool)

(assert (=> b!1531801 m!1414465))

(declare-fun m!1414467 () Bool)

(assert (=> b!1531796 m!1414467))

(assert (=> b!1531799 m!1414451))

(assert (=> b!1531799 m!1414451))

(declare-fun m!1414469 () Bool)

(assert (=> b!1531799 m!1414469))

(declare-fun m!1414471 () Bool)

(assert (=> b!1531797 m!1414471))

(assert (=> b!1531797 m!1414471))

(declare-fun m!1414473 () Bool)

(assert (=> b!1531797 m!1414473))

(declare-fun m!1414475 () Bool)

(assert (=> b!1531800 m!1414475))

(assert (=> b!1531800 m!1414475))

(declare-fun m!1414477 () Bool)

(assert (=> b!1531800 m!1414477))

(declare-fun m!1414479 () Bool)

(assert (=> b!1531800 m!1414479))

(declare-fun m!1414481 () Bool)

(assert (=> b!1531800 m!1414481))

(assert (=> b!1531790 m!1414451))

(assert (=> b!1531790 m!1414451))

(declare-fun m!1414483 () Bool)

(assert (=> b!1531790 m!1414483))

(assert (=> b!1531793 m!1414451))

(assert (=> b!1531793 m!1414451))

(declare-fun m!1414485 () Bool)

(assert (=> b!1531793 m!1414485))

(assert (=> b!1531793 m!1414485))

(assert (=> b!1531793 m!1414451))

(declare-fun m!1414487 () Bool)

(assert (=> b!1531793 m!1414487))

(declare-fun m!1414489 () Bool)

(assert (=> start!130530 m!1414489))

(declare-fun m!1414491 () Bool)

(assert (=> start!130530 m!1414491))

(declare-fun m!1414493 () Bool)

(assert (=> b!1531795 m!1414493))

(assert (=> b!1531794 m!1414451))

(assert (=> b!1531794 m!1414451))

(declare-fun m!1414495 () Bool)

(assert (=> b!1531794 m!1414495))

(push 1)

