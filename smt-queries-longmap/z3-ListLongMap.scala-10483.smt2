; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123272 () Bool)

(assert start!123272)

(declare-fun b!1429563 () Bool)

(declare-fun res!964248 () Bool)

(declare-fun e!807180 () Bool)

(assert (=> b!1429563 (=> (not res!964248) (not e!807180))))

(declare-datatypes ((array!97386 0))(
  ( (array!97387 (arr!47005 (Array (_ BitVec 32) (_ BitVec 64))) (size!47557 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97386)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97386 (_ BitVec 32)) Bool)

(assert (=> b!1429563 (= res!964248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429564 () Bool)

(declare-fun res!964246 () Bool)

(declare-fun e!807181 () Bool)

(assert (=> b!1429564 (=> (not res!964246) (not e!807181))))

(declare-fun lt!629255 () array!97386)

(declare-fun lt!629257 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11311 0))(
  ( (MissingZero!11311 (index!47636 (_ BitVec 32))) (Found!11311 (index!47637 (_ BitVec 32))) (Intermediate!11311 (undefined!12123 Bool) (index!47638 (_ BitVec 32)) (x!129262 (_ BitVec 32))) (Undefined!11311) (MissingVacant!11311 (index!47639 (_ BitVec 32))) )
))
(declare-fun lt!629256 () SeekEntryResult!11311)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97386 (_ BitVec 32)) SeekEntryResult!11311)

(assert (=> b!1429564 (= res!964246 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629257 lt!629255 mask!2608) lt!629256))))

(declare-fun b!1429565 () Bool)

(declare-fun res!964252 () Bool)

(assert (=> b!1429565 (=> (not res!964252) (not e!807180))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1429565 (= res!964252 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47557 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47557 a!2831))))))

(declare-fun b!1429566 () Bool)

(declare-fun res!964249 () Bool)

(assert (=> b!1429566 (=> (not res!964249) (not e!807180))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429566 (= res!964249 (validKeyInArray!0 (select (arr!47005 a!2831) i!982)))))

(declare-fun b!1429567 () Bool)

(declare-fun e!807179 () Bool)

(assert (=> b!1429567 (= e!807180 e!807179)))

(declare-fun res!964243 () Bool)

(assert (=> b!1429567 (=> (not res!964243) (not e!807179))))

(declare-fun lt!629254 () SeekEntryResult!11311)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429567 (= res!964243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47005 a!2831) j!81) mask!2608) (select (arr!47005 a!2831) j!81) a!2831 mask!2608) lt!629254))))

(assert (=> b!1429567 (= lt!629254 (Intermediate!11311 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429568 () Bool)

(declare-fun res!964247 () Bool)

(assert (=> b!1429568 (=> (not res!964247) (not e!807181))))

(assert (=> b!1429568 (= res!964247 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47005 a!2831) j!81) a!2831 mask!2608) lt!629254))))

(declare-fun b!1429569 () Bool)

(declare-fun res!964245 () Bool)

(assert (=> b!1429569 (=> (not res!964245) (not e!807180))))

(assert (=> b!1429569 (= res!964245 (and (= (size!47557 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47557 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47557 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!964250 () Bool)

(assert (=> start!123272 (=> (not res!964250) (not e!807180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123272 (= res!964250 (validMask!0 mask!2608))))

(assert (=> start!123272 e!807180))

(assert (=> start!123272 true))

(declare-fun array_inv!36238 (array!97386) Bool)

(assert (=> start!123272 (array_inv!36238 a!2831)))

(declare-fun b!1429570 () Bool)

(declare-fun res!964244 () Bool)

(assert (=> b!1429570 (=> (not res!964244) (not e!807180))))

(declare-datatypes ((List!33593 0))(
  ( (Nil!33590) (Cons!33589 (h!34903 (_ BitVec 64)) (t!48279 List!33593)) )
))
(declare-fun arrayNoDuplicates!0 (array!97386 (_ BitVec 32) List!33593) Bool)

(assert (=> b!1429570 (= res!964244 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33590))))

(declare-fun e!807178 () Bool)

(declare-fun b!1429571 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97386 (_ BitVec 32)) SeekEntryResult!11311)

(assert (=> b!1429571 (= e!807178 (= (seekEntryOrOpen!0 (select (arr!47005 a!2831) j!81) a!2831 mask!2608) (Found!11311 j!81)))))

(declare-fun b!1429572 () Bool)

(declare-fun res!964253 () Bool)

(assert (=> b!1429572 (=> (not res!964253) (not e!807181))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429572 (= res!964253 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429573 () Bool)

(assert (=> b!1429573 (= e!807181 (not true))))

(assert (=> b!1429573 e!807178))

(declare-fun res!964251 () Bool)

(assert (=> b!1429573 (=> (not res!964251) (not e!807178))))

(assert (=> b!1429573 (= res!964251 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48207 0))(
  ( (Unit!48208) )
))
(declare-fun lt!629258 () Unit!48207)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48207)

(assert (=> b!1429573 (= lt!629258 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429574 () Bool)

(assert (=> b!1429574 (= e!807179 e!807181)))

(declare-fun res!964254 () Bool)

(assert (=> b!1429574 (=> (not res!964254) (not e!807181))))

(assert (=> b!1429574 (= res!964254 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629257 mask!2608) lt!629257 lt!629255 mask!2608) lt!629256))))

(assert (=> b!1429574 (= lt!629256 (Intermediate!11311 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429574 (= lt!629257 (select (store (arr!47005 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429574 (= lt!629255 (array!97387 (store (arr!47005 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47557 a!2831)))))

(declare-fun b!1429575 () Bool)

(declare-fun res!964255 () Bool)

(assert (=> b!1429575 (=> (not res!964255) (not e!807180))))

(assert (=> b!1429575 (= res!964255 (validKeyInArray!0 (select (arr!47005 a!2831) j!81)))))

(assert (= (and start!123272 res!964250) b!1429569))

(assert (= (and b!1429569 res!964245) b!1429566))

(assert (= (and b!1429566 res!964249) b!1429575))

(assert (= (and b!1429575 res!964255) b!1429563))

(assert (= (and b!1429563 res!964248) b!1429570))

(assert (= (and b!1429570 res!964244) b!1429565))

(assert (= (and b!1429565 res!964252) b!1429567))

(assert (= (and b!1429567 res!964243) b!1429574))

(assert (= (and b!1429574 res!964254) b!1429568))

(assert (= (and b!1429568 res!964247) b!1429564))

(assert (= (and b!1429564 res!964246) b!1429572))

(assert (= (and b!1429572 res!964253) b!1429573))

(assert (= (and b!1429573 res!964251) b!1429571))

(declare-fun m!1319187 () Bool)

(assert (=> b!1429574 m!1319187))

(assert (=> b!1429574 m!1319187))

(declare-fun m!1319189 () Bool)

(assert (=> b!1429574 m!1319189))

(declare-fun m!1319191 () Bool)

(assert (=> b!1429574 m!1319191))

(declare-fun m!1319193 () Bool)

(assert (=> b!1429574 m!1319193))

(declare-fun m!1319195 () Bool)

(assert (=> start!123272 m!1319195))

(declare-fun m!1319197 () Bool)

(assert (=> start!123272 m!1319197))

(declare-fun m!1319199 () Bool)

(assert (=> b!1429568 m!1319199))

(assert (=> b!1429568 m!1319199))

(declare-fun m!1319201 () Bool)

(assert (=> b!1429568 m!1319201))

(declare-fun m!1319203 () Bool)

(assert (=> b!1429566 m!1319203))

(assert (=> b!1429566 m!1319203))

(declare-fun m!1319205 () Bool)

(assert (=> b!1429566 m!1319205))

(declare-fun m!1319207 () Bool)

(assert (=> b!1429573 m!1319207))

(declare-fun m!1319209 () Bool)

(assert (=> b!1429573 m!1319209))

(assert (=> b!1429575 m!1319199))

(assert (=> b!1429575 m!1319199))

(declare-fun m!1319211 () Bool)

(assert (=> b!1429575 m!1319211))

(assert (=> b!1429571 m!1319199))

(assert (=> b!1429571 m!1319199))

(declare-fun m!1319213 () Bool)

(assert (=> b!1429571 m!1319213))

(assert (=> b!1429567 m!1319199))

(assert (=> b!1429567 m!1319199))

(declare-fun m!1319215 () Bool)

(assert (=> b!1429567 m!1319215))

(assert (=> b!1429567 m!1319215))

(assert (=> b!1429567 m!1319199))

(declare-fun m!1319217 () Bool)

(assert (=> b!1429567 m!1319217))

(declare-fun m!1319219 () Bool)

(assert (=> b!1429570 m!1319219))

(declare-fun m!1319221 () Bool)

(assert (=> b!1429564 m!1319221))

(declare-fun m!1319223 () Bool)

(assert (=> b!1429563 m!1319223))

(check-sat (not b!1429563) (not b!1429571) (not b!1429567) (not b!1429564) (not b!1429566) (not start!123272) (not b!1429574) (not b!1429570) (not b!1429573) (not b!1429575) (not b!1429568))
(check-sat)
