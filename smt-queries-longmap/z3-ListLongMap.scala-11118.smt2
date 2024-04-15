; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129822 () Bool)

(assert start!129822)

(declare-fun b!1523925 () Bool)

(declare-fun res!1042763 () Bool)

(declare-fun e!849527 () Bool)

(assert (=> b!1523925 (=> (not res!1042763) (not e!849527))))

(declare-datatypes ((array!101359 0))(
  ( (array!101360 (arr!48910 (Array (_ BitVec 32) (_ BitVec 64))) (size!49462 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101359)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523925 (= res!1042763 (validKeyInArray!0 (select (arr!48910 a!2804) j!70)))))

(declare-fun b!1523926 () Bool)

(declare-fun res!1042766 () Bool)

(assert (=> b!1523926 (=> (not res!1042766) (not e!849527))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523926 (= res!1042766 (validKeyInArray!0 (select (arr!48910 a!2804) i!961)))))

(declare-fun b!1523927 () Bool)

(declare-fun res!1042767 () Bool)

(declare-fun e!849529 () Bool)

(assert (=> b!1523927 (=> (not res!1042767) (not e!849529))))

(declare-datatypes ((SeekEntryResult!13098 0))(
  ( (MissingZero!13098 (index!54787 (_ BitVec 32))) (Found!13098 (index!54788 (_ BitVec 32))) (Intermediate!13098 (undefined!13910 Bool) (index!54789 (_ BitVec 32)) (x!136481 (_ BitVec 32))) (Undefined!13098) (MissingVacant!13098 (index!54790 (_ BitVec 32))) )
))
(declare-fun lt!659974 () SeekEntryResult!13098)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101359 (_ BitVec 32)) SeekEntryResult!13098)

(assert (=> b!1523927 (= res!1042767 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48910 a!2804) j!70) a!2804 mask!2512) lt!659974))))

(declare-fun b!1523928 () Bool)

(declare-fun e!849528 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101359 (_ BitVec 32)) SeekEntryResult!13098)

(assert (=> b!1523928 (= e!849528 (= (seekEntry!0 (select (arr!48910 a!2804) j!70) a!2804 mask!2512) (Found!13098 j!70)))))

(declare-fun b!1523929 () Bool)

(declare-fun res!1042764 () Bool)

(assert (=> b!1523929 (=> (not res!1042764) (not e!849527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101359 (_ BitVec 32)) Bool)

(assert (=> b!1523929 (= res!1042764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523930 () Bool)

(declare-fun res!1042768 () Bool)

(assert (=> b!1523930 (=> (not res!1042768) (not e!849529))))

(declare-fun lt!659975 () SeekEntryResult!13098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523930 (= res!1042768 (= lt!659975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48910 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48910 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101360 (store (arr!48910 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49462 a!2804)) mask!2512)))))

(declare-fun b!1523931 () Bool)

(declare-fun res!1042765 () Bool)

(assert (=> b!1523931 (=> (not res!1042765) (not e!849527))))

(declare-datatypes ((List!35471 0))(
  ( (Nil!35468) (Cons!35467 (h!36895 (_ BitVec 64)) (t!50157 List!35471)) )
))
(declare-fun arrayNoDuplicates!0 (array!101359 (_ BitVec 32) List!35471) Bool)

(assert (=> b!1523931 (= res!1042765 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35468))))

(declare-fun res!1042770 () Bool)

(assert (=> start!129822 (=> (not res!1042770) (not e!849527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129822 (= res!1042770 (validMask!0 mask!2512))))

(assert (=> start!129822 e!849527))

(assert (=> start!129822 true))

(declare-fun array_inv!38143 (array!101359) Bool)

(assert (=> start!129822 (array_inv!38143 a!2804)))

(declare-fun b!1523932 () Bool)

(declare-fun res!1042762 () Bool)

(assert (=> b!1523932 (=> (not res!1042762) (not e!849527))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523932 (= res!1042762 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49462 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49462 a!2804))))))

(declare-fun b!1523933 () Bool)

(assert (=> b!1523933 (= e!849527 e!849529)))

(declare-fun res!1042769 () Bool)

(assert (=> b!1523933 (=> (not res!1042769) (not e!849529))))

(assert (=> b!1523933 (= res!1042769 (= lt!659975 lt!659974))))

(assert (=> b!1523933 (= lt!659974 (Intermediate!13098 false resIndex!21 resX!21))))

(assert (=> b!1523933 (= lt!659975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48910 a!2804) j!70) mask!2512) (select (arr!48910 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523934 () Bool)

(assert (=> b!1523934 (= e!849529 (not true))))

(assert (=> b!1523934 e!849528))

(declare-fun res!1042761 () Bool)

(assert (=> b!1523934 (=> (not res!1042761) (not e!849528))))

(assert (=> b!1523934 (= res!1042761 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50819 0))(
  ( (Unit!50820) )
))
(declare-fun lt!659976 () Unit!50819)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50819)

(assert (=> b!1523934 (= lt!659976 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523935 () Bool)

(declare-fun res!1042771 () Bool)

(assert (=> b!1523935 (=> (not res!1042771) (not e!849527))))

(assert (=> b!1523935 (= res!1042771 (and (= (size!49462 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49462 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49462 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129822 res!1042770) b!1523935))

(assert (= (and b!1523935 res!1042771) b!1523926))

(assert (= (and b!1523926 res!1042766) b!1523925))

(assert (= (and b!1523925 res!1042763) b!1523929))

(assert (= (and b!1523929 res!1042764) b!1523931))

(assert (= (and b!1523931 res!1042765) b!1523932))

(assert (= (and b!1523932 res!1042762) b!1523933))

(assert (= (and b!1523933 res!1042769) b!1523927))

(assert (= (and b!1523927 res!1042767) b!1523930))

(assert (= (and b!1523930 res!1042768) b!1523934))

(assert (= (and b!1523934 res!1042761) b!1523928))

(declare-fun m!1406375 () Bool)

(assert (=> start!129822 m!1406375))

(declare-fun m!1406377 () Bool)

(assert (=> start!129822 m!1406377))

(declare-fun m!1406379 () Bool)

(assert (=> b!1523930 m!1406379))

(declare-fun m!1406381 () Bool)

(assert (=> b!1523930 m!1406381))

(assert (=> b!1523930 m!1406381))

(declare-fun m!1406383 () Bool)

(assert (=> b!1523930 m!1406383))

(assert (=> b!1523930 m!1406383))

(assert (=> b!1523930 m!1406381))

(declare-fun m!1406385 () Bool)

(assert (=> b!1523930 m!1406385))

(declare-fun m!1406387 () Bool)

(assert (=> b!1523928 m!1406387))

(assert (=> b!1523928 m!1406387))

(declare-fun m!1406389 () Bool)

(assert (=> b!1523928 m!1406389))

(declare-fun m!1406391 () Bool)

(assert (=> b!1523931 m!1406391))

(declare-fun m!1406393 () Bool)

(assert (=> b!1523934 m!1406393))

(declare-fun m!1406395 () Bool)

(assert (=> b!1523934 m!1406395))

(declare-fun m!1406397 () Bool)

(assert (=> b!1523926 m!1406397))

(assert (=> b!1523926 m!1406397))

(declare-fun m!1406399 () Bool)

(assert (=> b!1523926 m!1406399))

(declare-fun m!1406401 () Bool)

(assert (=> b!1523929 m!1406401))

(assert (=> b!1523927 m!1406387))

(assert (=> b!1523927 m!1406387))

(declare-fun m!1406403 () Bool)

(assert (=> b!1523927 m!1406403))

(assert (=> b!1523925 m!1406387))

(assert (=> b!1523925 m!1406387))

(declare-fun m!1406405 () Bool)

(assert (=> b!1523925 m!1406405))

(assert (=> b!1523933 m!1406387))

(assert (=> b!1523933 m!1406387))

(declare-fun m!1406407 () Bool)

(assert (=> b!1523933 m!1406407))

(assert (=> b!1523933 m!1406407))

(assert (=> b!1523933 m!1406387))

(declare-fun m!1406409 () Bool)

(assert (=> b!1523933 m!1406409))

(check-sat (not b!1523928) (not b!1523927) (not start!129822) (not b!1523929) (not b!1523925) (not b!1523933) (not b!1523930) (not b!1523934) (not b!1523926) (not b!1523931))
(check-sat)
