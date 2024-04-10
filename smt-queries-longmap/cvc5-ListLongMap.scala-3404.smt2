; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47148 () Bool)

(assert start!47148)

(declare-fun b!519253 () Bool)

(declare-datatypes ((Unit!16088 0))(
  ( (Unit!16089) )
))
(declare-fun e!302985 () Unit!16088)

(declare-fun Unit!16090 () Unit!16088)

(assert (=> b!519253 (= e!302985 Unit!16090)))

(declare-fun b!519254 () Bool)

(declare-fun Unit!16091 () Unit!16088)

(assert (=> b!519254 (= e!302985 Unit!16091)))

(declare-fun lt!237753 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33163 0))(
  ( (array!33164 (arr!15942 (Array (_ BitVec 32) (_ BitVec 64))) (size!16306 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33163)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4409 0))(
  ( (MissingZero!4409 (index!19830 (_ BitVec 32))) (Found!4409 (index!19831 (_ BitVec 32))) (Intermediate!4409 (undefined!5221 Bool) (index!19832 (_ BitVec 32)) (x!48808 (_ BitVec 32))) (Undefined!4409) (MissingVacant!4409 (index!19833 (_ BitVec 32))) )
))
(declare-fun lt!237759 () SeekEntryResult!4409)

(declare-fun lt!237757 () Unit!16088)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33163 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16088)

(assert (=> b!519254 (= lt!237757 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237753 #b00000000000000000000000000000000 (index!19832 lt!237759) (x!48808 lt!237759) mask!3524))))

(declare-fun lt!237752 () (_ BitVec 64))

(declare-fun lt!237758 () array!33163)

(declare-fun res!317835 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33163 (_ BitVec 32)) SeekEntryResult!4409)

(assert (=> b!519254 (= res!317835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237753 lt!237752 lt!237758 mask!3524) (Intermediate!4409 false (index!19832 lt!237759) (x!48808 lt!237759))))))

(declare-fun e!302987 () Bool)

(assert (=> b!519254 (=> (not res!317835) (not e!302987))))

(assert (=> b!519254 e!302987))

(declare-fun b!519255 () Bool)

(declare-fun res!317836 () Bool)

(declare-fun e!302983 () Bool)

(assert (=> b!519255 (=> (not res!317836) (not e!302983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519255 (= res!317836 (validKeyInArray!0 k!2280))))

(declare-fun b!519256 () Bool)

(declare-fun res!317830 () Bool)

(declare-fun e!302986 () Bool)

(assert (=> b!519256 (=> (not res!317830) (not e!302986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33163 (_ BitVec 32)) Bool)

(assert (=> b!519256 (= res!317830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519257 () Bool)

(assert (=> b!519257 (= e!302983 e!302986)))

(declare-fun res!317829 () Bool)

(assert (=> b!519257 (=> (not res!317829) (not e!302986))))

(declare-fun lt!237756 () SeekEntryResult!4409)

(assert (=> b!519257 (= res!317829 (or (= lt!237756 (MissingZero!4409 i!1204)) (= lt!237756 (MissingVacant!4409 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33163 (_ BitVec 32)) SeekEntryResult!4409)

(assert (=> b!519257 (= lt!237756 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!302982 () Bool)

(declare-fun b!519258 () Bool)

(assert (=> b!519258 (= e!302982 (= (seekEntryOrOpen!0 (select (arr!15942 a!3235) j!176) a!3235 mask!3524) (Found!4409 j!176)))))

(declare-fun b!519259 () Bool)

(declare-fun res!317828 () Bool)

(assert (=> b!519259 (=> (not res!317828) (not e!302983))))

(assert (=> b!519259 (= res!317828 (and (= (size!16306 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16306 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16306 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519260 () Bool)

(declare-fun res!317833 () Bool)

(declare-fun e!302988 () Bool)

(assert (=> b!519260 (=> res!317833 e!302988)))

(assert (=> b!519260 (= res!317833 (or (undefined!5221 lt!237759) (not (is-Intermediate!4409 lt!237759))))))

(declare-fun b!519261 () Bool)

(assert (=> b!519261 (= e!302986 (not e!302988))))

(declare-fun res!317837 () Bool)

(assert (=> b!519261 (=> res!317837 e!302988)))

(declare-fun lt!237760 () (_ BitVec 32))

(assert (=> b!519261 (= res!317837 (= lt!237759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237760 lt!237752 lt!237758 mask!3524)))))

(assert (=> b!519261 (= lt!237759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237753 (select (arr!15942 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519261 (= lt!237760 (toIndex!0 lt!237752 mask!3524))))

(assert (=> b!519261 (= lt!237752 (select (store (arr!15942 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!519261 (= lt!237753 (toIndex!0 (select (arr!15942 a!3235) j!176) mask!3524))))

(assert (=> b!519261 (= lt!237758 (array!33164 (store (arr!15942 a!3235) i!1204 k!2280) (size!16306 a!3235)))))

(assert (=> b!519261 e!302982))

(declare-fun res!317826 () Bool)

(assert (=> b!519261 (=> (not res!317826) (not e!302982))))

(assert (=> b!519261 (= res!317826 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237755 () Unit!16088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16088)

(assert (=> b!519261 (= lt!237755 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!317834 () Bool)

(assert (=> start!47148 (=> (not res!317834) (not e!302983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47148 (= res!317834 (validMask!0 mask!3524))))

(assert (=> start!47148 e!302983))

(assert (=> start!47148 true))

(declare-fun array_inv!11738 (array!33163) Bool)

(assert (=> start!47148 (array_inv!11738 a!3235)))

(declare-fun b!519262 () Bool)

(declare-fun res!317827 () Bool)

(assert (=> b!519262 (=> (not res!317827) (not e!302983))))

(assert (=> b!519262 (= res!317827 (validKeyInArray!0 (select (arr!15942 a!3235) j!176)))))

(declare-fun b!519263 () Bool)

(assert (=> b!519263 (= e!302988 (or (= (select (arr!15942 a!3235) (index!19832 lt!237759)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15942 a!3235) (index!19832 lt!237759)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237754 () Unit!16088)

(assert (=> b!519263 (= lt!237754 e!302985)))

(declare-fun c!61010 () Bool)

(assert (=> b!519263 (= c!61010 (= (select (arr!15942 a!3235) (index!19832 lt!237759)) (select (arr!15942 a!3235) j!176)))))

(assert (=> b!519263 (and (bvslt (x!48808 lt!237759) #b01111111111111111111111111111110) (or (= (select (arr!15942 a!3235) (index!19832 lt!237759)) (select (arr!15942 a!3235) j!176)) (= (select (arr!15942 a!3235) (index!19832 lt!237759)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15942 a!3235) (index!19832 lt!237759)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519264 () Bool)

(declare-fun res!317831 () Bool)

(assert (=> b!519264 (=> (not res!317831) (not e!302986))))

(declare-datatypes ((List!10100 0))(
  ( (Nil!10097) (Cons!10096 (h!11009 (_ BitVec 64)) (t!16328 List!10100)) )
))
(declare-fun arrayNoDuplicates!0 (array!33163 (_ BitVec 32) List!10100) Bool)

(assert (=> b!519264 (= res!317831 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10097))))

(declare-fun b!519265 () Bool)

(declare-fun res!317832 () Bool)

(assert (=> b!519265 (=> (not res!317832) (not e!302983))))

(declare-fun arrayContainsKey!0 (array!33163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519265 (= res!317832 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519266 () Bool)

(assert (=> b!519266 (= e!302987 false)))

(assert (= (and start!47148 res!317834) b!519259))

(assert (= (and b!519259 res!317828) b!519262))

(assert (= (and b!519262 res!317827) b!519255))

(assert (= (and b!519255 res!317836) b!519265))

(assert (= (and b!519265 res!317832) b!519257))

(assert (= (and b!519257 res!317829) b!519256))

(assert (= (and b!519256 res!317830) b!519264))

(assert (= (and b!519264 res!317831) b!519261))

(assert (= (and b!519261 res!317826) b!519258))

(assert (= (and b!519261 (not res!317837)) b!519260))

(assert (= (and b!519260 (not res!317833)) b!519263))

(assert (= (and b!519263 c!61010) b!519254))

(assert (= (and b!519263 (not c!61010)) b!519253))

(assert (= (and b!519254 res!317835) b!519266))

(declare-fun m!500445 () Bool)

(assert (=> start!47148 m!500445))

(declare-fun m!500447 () Bool)

(assert (=> start!47148 m!500447))

(declare-fun m!500449 () Bool)

(assert (=> b!519262 m!500449))

(assert (=> b!519262 m!500449))

(declare-fun m!500451 () Bool)

(assert (=> b!519262 m!500451))

(declare-fun m!500453 () Bool)

(assert (=> b!519265 m!500453))

(declare-fun m!500455 () Bool)

(assert (=> b!519261 m!500455))

(declare-fun m!500457 () Bool)

(assert (=> b!519261 m!500457))

(declare-fun m!500459 () Bool)

(assert (=> b!519261 m!500459))

(assert (=> b!519261 m!500449))

(declare-fun m!500461 () Bool)

(assert (=> b!519261 m!500461))

(assert (=> b!519261 m!500449))

(declare-fun m!500463 () Bool)

(assert (=> b!519261 m!500463))

(declare-fun m!500465 () Bool)

(assert (=> b!519261 m!500465))

(declare-fun m!500467 () Bool)

(assert (=> b!519261 m!500467))

(declare-fun m!500469 () Bool)

(assert (=> b!519261 m!500469))

(assert (=> b!519261 m!500449))

(declare-fun m!500471 () Bool)

(assert (=> b!519264 m!500471))

(declare-fun m!500473 () Bool)

(assert (=> b!519256 m!500473))

(declare-fun m!500475 () Bool)

(assert (=> b!519254 m!500475))

(declare-fun m!500477 () Bool)

(assert (=> b!519254 m!500477))

(declare-fun m!500479 () Bool)

(assert (=> b!519263 m!500479))

(assert (=> b!519263 m!500449))

(declare-fun m!500481 () Bool)

(assert (=> b!519255 m!500481))

(assert (=> b!519258 m!500449))

(assert (=> b!519258 m!500449))

(declare-fun m!500483 () Bool)

(assert (=> b!519258 m!500483))

(declare-fun m!500485 () Bool)

(assert (=> b!519257 m!500485))

(push 1)

