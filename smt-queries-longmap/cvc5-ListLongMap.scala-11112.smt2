; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129776 () Bool)

(assert start!129776)

(declare-fun b!1523281 () Bool)

(declare-fun res!1042198 () Bool)

(declare-fun e!849282 () Bool)

(assert (=> b!1523281 (=> (not res!1042198) (not e!849282))))

(declare-datatypes ((array!101372 0))(
  ( (array!101373 (arr!48917 (Array (_ BitVec 32) (_ BitVec 64))) (size!49467 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101372)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101372 (_ BitVec 32)) Bool)

(assert (=> b!1523281 (= res!1042198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523282 () Bool)

(declare-fun res!1042196 () Bool)

(assert (=> b!1523282 (=> (not res!1042196) (not e!849282))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523282 (= res!1042196 (validKeyInArray!0 (select (arr!48917 a!2804) j!70)))))

(declare-fun b!1523283 () Bool)

(declare-fun e!849283 () Bool)

(declare-datatypes ((SeekEntryResult!13082 0))(
  ( (MissingZero!13082 (index!54723 (_ BitVec 32))) (Found!13082 (index!54724 (_ BitVec 32))) (Intermediate!13082 (undefined!13894 Bool) (index!54725 (_ BitVec 32)) (x!136416 (_ BitVec 32))) (Undefined!13082) (MissingVacant!13082 (index!54726 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101372 (_ BitVec 32)) SeekEntryResult!13082)

(assert (=> b!1523283 (= e!849283 (= (seekEntry!0 (select (arr!48917 a!2804) j!70) a!2804 mask!2512) (Found!13082 j!70)))))

(declare-fun b!1523284 () Bool)

(declare-fun res!1042188 () Bool)

(assert (=> b!1523284 (=> (not res!1042188) (not e!849282))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523284 (= res!1042188 (and (= (size!49467 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49467 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49467 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523285 () Bool)

(declare-fun res!1042194 () Bool)

(assert (=> b!1523285 (=> (not res!1042194) (not e!849282))))

(assert (=> b!1523285 (= res!1042194 (validKeyInArray!0 (select (arr!48917 a!2804) i!961)))))

(declare-fun b!1523286 () Bool)

(declare-fun e!849281 () Bool)

(assert (=> b!1523286 (= e!849281 (not true))))

(assert (=> b!1523286 e!849283))

(declare-fun res!1042193 () Bool)

(assert (=> b!1523286 (=> (not res!1042193) (not e!849283))))

(assert (=> b!1523286 (= res!1042193 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50948 0))(
  ( (Unit!50949) )
))
(declare-fun lt!659910 () Unit!50948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50948)

(assert (=> b!1523286 (= lt!659910 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523287 () Bool)

(assert (=> b!1523287 (= e!849282 e!849281)))

(declare-fun res!1042192 () Bool)

(assert (=> b!1523287 (=> (not res!1042192) (not e!849281))))

(declare-fun lt!659909 () SeekEntryResult!13082)

(declare-fun lt!659911 () SeekEntryResult!13082)

(assert (=> b!1523287 (= res!1042192 (= lt!659909 lt!659911))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523287 (= lt!659911 (Intermediate!13082 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101372 (_ BitVec 32)) SeekEntryResult!13082)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523287 (= lt!659909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48917 a!2804) j!70) mask!2512) (select (arr!48917 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523288 () Bool)

(declare-fun res!1042195 () Bool)

(assert (=> b!1523288 (=> (not res!1042195) (not e!849282))))

(declare-datatypes ((List!35400 0))(
  ( (Nil!35397) (Cons!35396 (h!36820 (_ BitVec 64)) (t!50094 List!35400)) )
))
(declare-fun arrayNoDuplicates!0 (array!101372 (_ BitVec 32) List!35400) Bool)

(assert (=> b!1523288 (= res!1042195 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35397))))

(declare-fun b!1523290 () Bool)

(declare-fun res!1042197 () Bool)

(assert (=> b!1523290 (=> (not res!1042197) (not e!849281))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523290 (= res!1042197 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48917 a!2804) j!70) a!2804 mask!2512) lt!659911))))

(declare-fun b!1523291 () Bool)

(declare-fun res!1042190 () Bool)

(assert (=> b!1523291 (=> (not res!1042190) (not e!849282))))

(assert (=> b!1523291 (= res!1042190 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49467 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49467 a!2804))))))

(declare-fun b!1523289 () Bool)

(declare-fun res!1042189 () Bool)

(assert (=> b!1523289 (=> (not res!1042189) (not e!849281))))

(assert (=> b!1523289 (= res!1042189 (= lt!659909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48917 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48917 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101373 (store (arr!48917 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49467 a!2804)) mask!2512)))))

(declare-fun res!1042191 () Bool)

(assert (=> start!129776 (=> (not res!1042191) (not e!849282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129776 (= res!1042191 (validMask!0 mask!2512))))

(assert (=> start!129776 e!849282))

(assert (=> start!129776 true))

(declare-fun array_inv!37945 (array!101372) Bool)

(assert (=> start!129776 (array_inv!37945 a!2804)))

(assert (= (and start!129776 res!1042191) b!1523284))

(assert (= (and b!1523284 res!1042188) b!1523285))

(assert (= (and b!1523285 res!1042194) b!1523282))

(assert (= (and b!1523282 res!1042196) b!1523281))

(assert (= (and b!1523281 res!1042198) b!1523288))

(assert (= (and b!1523288 res!1042195) b!1523291))

(assert (= (and b!1523291 res!1042190) b!1523287))

(assert (= (and b!1523287 res!1042192) b!1523290))

(assert (= (and b!1523290 res!1042197) b!1523289))

(assert (= (and b!1523289 res!1042189) b!1523286))

(assert (= (and b!1523286 res!1042193) b!1523283))

(declare-fun m!1406385 () Bool)

(assert (=> b!1523281 m!1406385))

(declare-fun m!1406387 () Bool)

(assert (=> b!1523286 m!1406387))

(declare-fun m!1406389 () Bool)

(assert (=> b!1523286 m!1406389))

(declare-fun m!1406391 () Bool)

(assert (=> b!1523287 m!1406391))

(assert (=> b!1523287 m!1406391))

(declare-fun m!1406393 () Bool)

(assert (=> b!1523287 m!1406393))

(assert (=> b!1523287 m!1406393))

(assert (=> b!1523287 m!1406391))

(declare-fun m!1406395 () Bool)

(assert (=> b!1523287 m!1406395))

(declare-fun m!1406397 () Bool)

(assert (=> b!1523285 m!1406397))

(assert (=> b!1523285 m!1406397))

(declare-fun m!1406399 () Bool)

(assert (=> b!1523285 m!1406399))

(assert (=> b!1523283 m!1406391))

(assert (=> b!1523283 m!1406391))

(declare-fun m!1406401 () Bool)

(assert (=> b!1523283 m!1406401))

(assert (=> b!1523282 m!1406391))

(assert (=> b!1523282 m!1406391))

(declare-fun m!1406403 () Bool)

(assert (=> b!1523282 m!1406403))

(declare-fun m!1406405 () Bool)

(assert (=> b!1523288 m!1406405))

(declare-fun m!1406407 () Bool)

(assert (=> b!1523289 m!1406407))

(declare-fun m!1406409 () Bool)

(assert (=> b!1523289 m!1406409))

(assert (=> b!1523289 m!1406409))

(declare-fun m!1406411 () Bool)

(assert (=> b!1523289 m!1406411))

(assert (=> b!1523289 m!1406411))

(assert (=> b!1523289 m!1406409))

(declare-fun m!1406413 () Bool)

(assert (=> b!1523289 m!1406413))

(declare-fun m!1406415 () Bool)

(assert (=> start!129776 m!1406415))

(declare-fun m!1406417 () Bool)

(assert (=> start!129776 m!1406417))

(assert (=> b!1523290 m!1406391))

(assert (=> b!1523290 m!1406391))

(declare-fun m!1406419 () Bool)

(assert (=> b!1523290 m!1406419))

(push 1)

