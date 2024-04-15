; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129538 () Bool)

(assert start!129538)

(declare-fun b!1520952 () Bool)

(declare-fun res!1040386 () Bool)

(declare-fun e!848277 () Bool)

(assert (=> b!1520952 (=> (not res!1040386) (not e!848277))))

(declare-datatypes ((array!101213 0))(
  ( (array!101214 (arr!48840 (Array (_ BitVec 32) (_ BitVec 64))) (size!49392 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101213)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101213 (_ BitVec 32)) Bool)

(assert (=> b!1520952 (= res!1040386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520953 () Bool)

(declare-fun res!1040385 () Bool)

(assert (=> b!1520953 (=> (not res!1040385) (not e!848277))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520953 (= res!1040385 (and (= (size!49392 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49392 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49392 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520954 () Bool)

(declare-fun res!1040382 () Bool)

(assert (=> b!1520954 (=> (not res!1040382) (not e!848277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520954 (= res!1040382 (validKeyInArray!0 (select (arr!48840 a!2804) j!70)))))

(declare-fun b!1520955 () Bool)

(assert (=> b!1520955 (= e!848277 false)))

(declare-datatypes ((SeekEntryResult!13028 0))(
  ( (MissingZero!13028 (index!54507 (_ BitVec 32))) (Found!13028 (index!54508 (_ BitVec 32))) (Intermediate!13028 (undefined!13840 Bool) (index!54509 (_ BitVec 32)) (x!136202 (_ BitVec 32))) (Undefined!13028) (MissingVacant!13028 (index!54510 (_ BitVec 32))) )
))
(declare-fun lt!659037 () SeekEntryResult!13028)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101213 (_ BitVec 32)) SeekEntryResult!13028)

(assert (=> b!1520955 (= lt!659037 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520956 () Bool)

(declare-fun res!1040380 () Bool)

(assert (=> b!1520956 (=> (not res!1040380) (not e!848277))))

(assert (=> b!1520956 (= res!1040380 (validKeyInArray!0 (select (arr!48840 a!2804) i!961)))))

(declare-fun b!1520957 () Bool)

(declare-fun res!1040384 () Bool)

(assert (=> b!1520957 (=> (not res!1040384) (not e!848277))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520957 (= res!1040384 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512) (Intermediate!13028 false resIndex!21 resX!21)))))

(declare-fun res!1040387 () Bool)

(assert (=> start!129538 (=> (not res!1040387) (not e!848277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129538 (= res!1040387 (validMask!0 mask!2512))))

(assert (=> start!129538 e!848277))

(assert (=> start!129538 true))

(declare-fun array_inv!38073 (array!101213) Bool)

(assert (=> start!129538 (array_inv!38073 a!2804)))

(declare-fun b!1520958 () Bool)

(declare-fun res!1040381 () Bool)

(assert (=> b!1520958 (=> (not res!1040381) (not e!848277))))

(declare-datatypes ((List!35401 0))(
  ( (Nil!35398) (Cons!35397 (h!36819 (_ BitVec 64)) (t!50087 List!35401)) )
))
(declare-fun arrayNoDuplicates!0 (array!101213 (_ BitVec 32) List!35401) Bool)

(assert (=> b!1520958 (= res!1040381 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35398))))

(declare-fun b!1520959 () Bool)

(declare-fun res!1040383 () Bool)

(assert (=> b!1520959 (=> (not res!1040383) (not e!848277))))

(assert (=> b!1520959 (= res!1040383 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49392 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49392 a!2804))))))

(assert (= (and start!129538 res!1040387) b!1520953))

(assert (= (and b!1520953 res!1040385) b!1520956))

(assert (= (and b!1520956 res!1040380) b!1520954))

(assert (= (and b!1520954 res!1040382) b!1520952))

(assert (= (and b!1520952 res!1040386) b!1520958))

(assert (= (and b!1520958 res!1040381) b!1520959))

(assert (= (and b!1520959 res!1040383) b!1520957))

(assert (= (and b!1520957 res!1040384) b!1520955))

(declare-fun m!1403489 () Bool)

(assert (=> b!1520956 m!1403489))

(assert (=> b!1520956 m!1403489))

(declare-fun m!1403491 () Bool)

(assert (=> b!1520956 m!1403491))

(declare-fun m!1403493 () Bool)

(assert (=> b!1520955 m!1403493))

(assert (=> b!1520955 m!1403493))

(declare-fun m!1403495 () Bool)

(assert (=> b!1520955 m!1403495))

(declare-fun m!1403497 () Bool)

(assert (=> start!129538 m!1403497))

(declare-fun m!1403499 () Bool)

(assert (=> start!129538 m!1403499))

(declare-fun m!1403501 () Bool)

(assert (=> b!1520952 m!1403501))

(assert (=> b!1520957 m!1403493))

(assert (=> b!1520957 m!1403493))

(declare-fun m!1403503 () Bool)

(assert (=> b!1520957 m!1403503))

(assert (=> b!1520957 m!1403503))

(assert (=> b!1520957 m!1403493))

(declare-fun m!1403505 () Bool)

(assert (=> b!1520957 m!1403505))

(declare-fun m!1403507 () Bool)

(assert (=> b!1520958 m!1403507))

(assert (=> b!1520954 m!1403493))

(assert (=> b!1520954 m!1403493))

(declare-fun m!1403509 () Bool)

(assert (=> b!1520954 m!1403509))

(push 1)

(assert (not b!1520954))

(assert (not b!1520958))

(assert (not start!129538))

(assert (not b!1520955))

(assert (not b!1520952))

(assert (not b!1520957))

(assert (not b!1520956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

