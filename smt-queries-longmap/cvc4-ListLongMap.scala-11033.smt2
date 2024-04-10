; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129034 () Bool)

(assert start!129034)

(declare-fun b!1513363 () Bool)

(declare-fun res!1033273 () Bool)

(declare-fun e!844634 () Bool)

(assert (=> b!1513363 (=> (not res!1033273) (not e!844634))))

(declare-datatypes ((array!100890 0))(
  ( (array!100891 (arr!48682 (Array (_ BitVec 32) (_ BitVec 64))) (size!49232 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100890)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513363 (= res!1033273 (validKeyInArray!0 (select (arr!48682 a!2804) i!961)))))

(declare-fun b!1513364 () Bool)

(declare-fun res!1033276 () Bool)

(assert (=> b!1513364 (=> (not res!1033276) (not e!844634))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100890 (_ BitVec 32)) Bool)

(assert (=> b!1513364 (= res!1033276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513365 () Bool)

(declare-fun e!844636 () Bool)

(assert (=> b!1513365 (= e!844634 e!844636)))

(declare-fun res!1033278 () Bool)

(assert (=> b!1513365 (=> (not res!1033278) (not e!844636))))

(declare-datatypes ((SeekEntryResult!12853 0))(
  ( (MissingZero!12853 (index!53807 (_ BitVec 32))) (Found!12853 (index!53808 (_ BitVec 32))) (Intermediate!12853 (undefined!13665 Bool) (index!53809 (_ BitVec 32)) (x!135523 (_ BitVec 32))) (Undefined!12853) (MissingVacant!12853 (index!53810 (_ BitVec 32))) )
))
(declare-fun lt!655954 () SeekEntryResult!12853)

(declare-fun lt!655951 () SeekEntryResult!12853)

(assert (=> b!1513365 (= res!1033278 (= lt!655954 lt!655951))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513365 (= lt!655951 (Intermediate!12853 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100890 (_ BitVec 32)) SeekEntryResult!12853)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513365 (= lt!655954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48682 a!2804) j!70) mask!2512) (select (arr!48682 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513366 () Bool)

(declare-fun res!1033270 () Bool)

(assert (=> b!1513366 (=> (not res!1033270) (not e!844634))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1513366 (= res!1033270 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49232 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49232 a!2804))))))

(declare-fun b!1513368 () Bool)

(declare-fun e!844635 () Bool)

(declare-fun e!844632 () Bool)

(assert (=> b!1513368 (= e!844635 e!844632)))

(declare-fun res!1033279 () Bool)

(assert (=> b!1513368 (=> (not res!1033279) (not e!844632))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100890 (_ BitVec 32)) SeekEntryResult!12853)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100890 (_ BitVec 32)) SeekEntryResult!12853)

(assert (=> b!1513368 (= res!1033279 (= (seekEntryOrOpen!0 (select (arr!48682 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48682 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513369 () Bool)

(declare-fun res!1033274 () Bool)

(assert (=> b!1513369 (=> (not res!1033274) (not e!844634))))

(assert (=> b!1513369 (= res!1033274 (validKeyInArray!0 (select (arr!48682 a!2804) j!70)))))

(declare-fun b!1513370 () Bool)

(declare-fun res!1033275 () Bool)

(assert (=> b!1513370 (=> (not res!1033275) (not e!844634))))

(declare-datatypes ((List!35165 0))(
  ( (Nil!35162) (Cons!35161 (h!36573 (_ BitVec 64)) (t!49859 List!35165)) )
))
(declare-fun arrayNoDuplicates!0 (array!100890 (_ BitVec 32) List!35165) Bool)

(assert (=> b!1513370 (= res!1033275 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35162))))

(declare-fun b!1513371 () Bool)

(declare-fun e!844631 () Bool)

(assert (=> b!1513371 (= e!844631 e!844635)))

(declare-fun res!1033268 () Bool)

(assert (=> b!1513371 (=> res!1033268 e!844635)))

(declare-fun lt!655950 () (_ BitVec 64))

(assert (=> b!1513371 (= res!1033268 (or (not (= (select (arr!48682 a!2804) j!70) lt!655950)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48682 a!2804) index!487) (select (arr!48682 a!2804) j!70)) (not (= (select (arr!48682 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513372 () Bool)

(declare-fun res!1033269 () Bool)

(assert (=> b!1513372 (=> (not res!1033269) (not e!844634))))

(assert (=> b!1513372 (= res!1033269 (and (= (size!49232 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49232 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49232 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1033272 () Bool)

(assert (=> start!129034 (=> (not res!1033272) (not e!844634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129034 (= res!1033272 (validMask!0 mask!2512))))

(assert (=> start!129034 e!844634))

(assert (=> start!129034 true))

(declare-fun array_inv!37710 (array!100890) Bool)

(assert (=> start!129034 (array_inv!37710 a!2804)))

(declare-fun b!1513367 () Bool)

(declare-fun e!844630 () Bool)

(assert (=> b!1513367 (= e!844636 e!844630)))

(declare-fun res!1033277 () Bool)

(assert (=> b!1513367 (=> (not res!1033277) (not e!844630))))

(declare-fun lt!655953 () array!100890)

(assert (=> b!1513367 (= res!1033277 (= lt!655954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655950 mask!2512) lt!655950 lt!655953 mask!2512)))))

(assert (=> b!1513367 (= lt!655950 (select (store (arr!48682 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513367 (= lt!655953 (array!100891 (store (arr!48682 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49232 a!2804)))))

(declare-fun b!1513373 () Bool)

(declare-fun res!1033266 () Bool)

(assert (=> b!1513373 (=> (not res!1033266) (not e!844636))))

(assert (=> b!1513373 (= res!1033266 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48682 a!2804) j!70) a!2804 mask!2512) lt!655951))))

(declare-fun b!1513374 () Bool)

(assert (=> b!1513374 (= e!844630 (not true))))

(assert (=> b!1513374 e!844631))

(declare-fun res!1033271 () Bool)

(assert (=> b!1513374 (=> (not res!1033271) (not e!844631))))

(assert (=> b!1513374 (= res!1033271 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50574 0))(
  ( (Unit!50575) )
))
(declare-fun lt!655952 () Unit!50574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50574)

(assert (=> b!1513374 (= lt!655952 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513375 () Bool)

(declare-fun res!1033267 () Bool)

(assert (=> b!1513375 (=> (not res!1033267) (not e!844631))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100890 (_ BitVec 32)) SeekEntryResult!12853)

(assert (=> b!1513375 (= res!1033267 (= (seekEntry!0 (select (arr!48682 a!2804) j!70) a!2804 mask!2512) (Found!12853 j!70)))))

(declare-fun b!1513376 () Bool)

(assert (=> b!1513376 (= e!844632 (= (seekEntryOrOpen!0 lt!655950 lt!655953 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655950 lt!655953 mask!2512)))))

(assert (= (and start!129034 res!1033272) b!1513372))

(assert (= (and b!1513372 res!1033269) b!1513363))

(assert (= (and b!1513363 res!1033273) b!1513369))

(assert (= (and b!1513369 res!1033274) b!1513364))

(assert (= (and b!1513364 res!1033276) b!1513370))

(assert (= (and b!1513370 res!1033275) b!1513366))

(assert (= (and b!1513366 res!1033270) b!1513365))

(assert (= (and b!1513365 res!1033278) b!1513373))

(assert (= (and b!1513373 res!1033266) b!1513367))

(assert (= (and b!1513367 res!1033277) b!1513374))

(assert (= (and b!1513374 res!1033271) b!1513375))

(assert (= (and b!1513375 res!1033267) b!1513371))

(assert (= (and b!1513371 (not res!1033268)) b!1513368))

(assert (= (and b!1513368 res!1033279) b!1513376))

(declare-fun m!1396215 () Bool)

(assert (=> b!1513374 m!1396215))

(declare-fun m!1396217 () Bool)

(assert (=> b!1513374 m!1396217))

(declare-fun m!1396219 () Bool)

(assert (=> b!1513370 m!1396219))

(declare-fun m!1396221 () Bool)

(assert (=> b!1513375 m!1396221))

(assert (=> b!1513375 m!1396221))

(declare-fun m!1396223 () Bool)

(assert (=> b!1513375 m!1396223))

(assert (=> b!1513369 m!1396221))

(assert (=> b!1513369 m!1396221))

(declare-fun m!1396225 () Bool)

(assert (=> b!1513369 m!1396225))

(assert (=> b!1513373 m!1396221))

(assert (=> b!1513373 m!1396221))

(declare-fun m!1396227 () Bool)

(assert (=> b!1513373 m!1396227))

(assert (=> b!1513365 m!1396221))

(assert (=> b!1513365 m!1396221))

(declare-fun m!1396229 () Bool)

(assert (=> b!1513365 m!1396229))

(assert (=> b!1513365 m!1396229))

(assert (=> b!1513365 m!1396221))

(declare-fun m!1396231 () Bool)

(assert (=> b!1513365 m!1396231))

(declare-fun m!1396233 () Bool)

(assert (=> b!1513364 m!1396233))

(declare-fun m!1396235 () Bool)

(assert (=> b!1513363 m!1396235))

(assert (=> b!1513363 m!1396235))

(declare-fun m!1396237 () Bool)

(assert (=> b!1513363 m!1396237))

(declare-fun m!1396239 () Bool)

(assert (=> b!1513376 m!1396239))

(declare-fun m!1396241 () Bool)

(assert (=> b!1513376 m!1396241))

(declare-fun m!1396243 () Bool)

(assert (=> b!1513367 m!1396243))

(assert (=> b!1513367 m!1396243))

(declare-fun m!1396245 () Bool)

(assert (=> b!1513367 m!1396245))

(declare-fun m!1396247 () Bool)

(assert (=> b!1513367 m!1396247))

(declare-fun m!1396249 () Bool)

(assert (=> b!1513367 m!1396249))

(assert (=> b!1513368 m!1396221))

(assert (=> b!1513368 m!1396221))

(declare-fun m!1396251 () Bool)

(assert (=> b!1513368 m!1396251))

(assert (=> b!1513368 m!1396221))

(declare-fun m!1396253 () Bool)

(assert (=> b!1513368 m!1396253))

(assert (=> b!1513371 m!1396221))

(declare-fun m!1396255 () Bool)

(assert (=> b!1513371 m!1396255))

(declare-fun m!1396257 () Bool)

(assert (=> start!129034 m!1396257))

(declare-fun m!1396259 () Bool)

(assert (=> start!129034 m!1396259))

(push 1)

