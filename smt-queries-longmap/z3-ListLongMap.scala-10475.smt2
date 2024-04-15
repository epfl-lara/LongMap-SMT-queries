; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123224 () Bool)

(assert start!123224)

(declare-fun b!1428627 () Bool)

(declare-fun res!963316 () Bool)

(declare-fun e!806821 () Bool)

(assert (=> b!1428627 (=> (not res!963316) (not e!806821))))

(declare-datatypes ((array!97338 0))(
  ( (array!97339 (arr!46981 (Array (_ BitVec 32) (_ BitVec 64))) (size!47533 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97338)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97338 (_ BitVec 32)) Bool)

(assert (=> b!1428627 (= res!963316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428628 () Bool)

(declare-fun e!806820 () Bool)

(assert (=> b!1428628 (= e!806821 e!806820)))

(declare-fun res!963319 () Bool)

(assert (=> b!1428628 (=> (not res!963319) (not e!806820))))

(declare-datatypes ((SeekEntryResult!11287 0))(
  ( (MissingZero!11287 (index!47540 (_ BitVec 32))) (Found!11287 (index!47541 (_ BitVec 32))) (Intermediate!11287 (undefined!12099 Bool) (index!47542 (_ BitVec 32)) (x!129174 (_ BitVec 32))) (Undefined!11287) (MissingVacant!11287 (index!47543 (_ BitVec 32))) )
))
(declare-fun lt!628894 () SeekEntryResult!11287)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97338 (_ BitVec 32)) SeekEntryResult!11287)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428628 (= res!963319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46981 a!2831) j!81) mask!2608) (select (arr!46981 a!2831) j!81) a!2831 mask!2608) lt!628894))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428628 (= lt!628894 (Intermediate!11287 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428629 () Bool)

(declare-fun res!963314 () Bool)

(assert (=> b!1428629 (=> (not res!963314) (not e!806821))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428629 (= res!963314 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47533 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47533 a!2831))))))

(declare-fun b!1428630 () Bool)

(declare-fun e!806822 () Bool)

(assert (=> b!1428630 (= e!806822 (not true))))

(declare-fun e!806818 () Bool)

(assert (=> b!1428630 e!806818))

(declare-fun res!963312 () Bool)

(assert (=> b!1428630 (=> (not res!963312) (not e!806818))))

(assert (=> b!1428630 (= res!963312 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48159 0))(
  ( (Unit!48160) )
))
(declare-fun lt!628896 () Unit!48159)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48159)

(assert (=> b!1428630 (= lt!628896 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428631 () Bool)

(declare-fun res!963318 () Bool)

(assert (=> b!1428631 (=> (not res!963318) (not e!806821))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428631 (= res!963318 (validKeyInArray!0 (select (arr!46981 a!2831) i!982)))))

(declare-fun b!1428632 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97338 (_ BitVec 32)) SeekEntryResult!11287)

(assert (=> b!1428632 (= e!806818 (= (seekEntryOrOpen!0 (select (arr!46981 a!2831) j!81) a!2831 mask!2608) (Found!11287 j!81)))))

(declare-fun b!1428633 () Bool)

(declare-fun res!963315 () Bool)

(assert (=> b!1428633 (=> (not res!963315) (not e!806821))))

(declare-datatypes ((List!33569 0))(
  ( (Nil!33566) (Cons!33565 (h!34879 (_ BitVec 64)) (t!48255 List!33569)) )
))
(declare-fun arrayNoDuplicates!0 (array!97338 (_ BitVec 32) List!33569) Bool)

(assert (=> b!1428633 (= res!963315 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33566))))

(declare-fun b!1428634 () Bool)

(declare-fun res!963310 () Bool)

(assert (=> b!1428634 (=> (not res!963310) (not e!806822))))

(assert (=> b!1428634 (= res!963310 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46981 a!2831) j!81) a!2831 mask!2608) lt!628894))))

(declare-fun res!963309 () Bool)

(assert (=> start!123224 (=> (not res!963309) (not e!806821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123224 (= res!963309 (validMask!0 mask!2608))))

(assert (=> start!123224 e!806821))

(assert (=> start!123224 true))

(declare-fun array_inv!36214 (array!97338) Bool)

(assert (=> start!123224 (array_inv!36214 a!2831)))

(declare-fun b!1428635 () Bool)

(declare-fun res!963307 () Bool)

(assert (=> b!1428635 (=> (not res!963307) (not e!806821))))

(assert (=> b!1428635 (= res!963307 (validKeyInArray!0 (select (arr!46981 a!2831) j!81)))))

(declare-fun b!1428636 () Bool)

(declare-fun res!963308 () Bool)

(assert (=> b!1428636 (=> (not res!963308) (not e!806822))))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1428636 (= res!963308 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428637 () Bool)

(assert (=> b!1428637 (= e!806820 e!806822)))

(declare-fun res!963311 () Bool)

(assert (=> b!1428637 (=> (not res!963311) (not e!806822))))

(declare-fun lt!628895 () (_ BitVec 64))

(declare-fun lt!628897 () array!97338)

(declare-fun lt!628898 () SeekEntryResult!11287)

(assert (=> b!1428637 (= res!963311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628895 mask!2608) lt!628895 lt!628897 mask!2608) lt!628898))))

(assert (=> b!1428637 (= lt!628898 (Intermediate!11287 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428637 (= lt!628895 (select (store (arr!46981 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428637 (= lt!628897 (array!97339 (store (arr!46981 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47533 a!2831)))))

(declare-fun b!1428638 () Bool)

(declare-fun res!963313 () Bool)

(assert (=> b!1428638 (=> (not res!963313) (not e!806821))))

(assert (=> b!1428638 (= res!963313 (and (= (size!47533 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47533 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47533 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428639 () Bool)

(declare-fun res!963317 () Bool)

(assert (=> b!1428639 (=> (not res!963317) (not e!806822))))

(assert (=> b!1428639 (= res!963317 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628895 lt!628897 mask!2608) lt!628898))))

(assert (= (and start!123224 res!963309) b!1428638))

(assert (= (and b!1428638 res!963313) b!1428631))

(assert (= (and b!1428631 res!963318) b!1428635))

(assert (= (and b!1428635 res!963307) b!1428627))

(assert (= (and b!1428627 res!963316) b!1428633))

(assert (= (and b!1428633 res!963315) b!1428629))

(assert (= (and b!1428629 res!963314) b!1428628))

(assert (= (and b!1428628 res!963319) b!1428637))

(assert (= (and b!1428637 res!963311) b!1428634))

(assert (= (and b!1428634 res!963310) b!1428639))

(assert (= (and b!1428639 res!963317) b!1428636))

(assert (= (and b!1428636 res!963308) b!1428630))

(assert (= (and b!1428630 res!963312) b!1428632))

(declare-fun m!1318275 () Bool)

(assert (=> b!1428639 m!1318275))

(declare-fun m!1318277 () Bool)

(assert (=> b!1428630 m!1318277))

(declare-fun m!1318279 () Bool)

(assert (=> b!1428630 m!1318279))

(declare-fun m!1318281 () Bool)

(assert (=> b!1428628 m!1318281))

(assert (=> b!1428628 m!1318281))

(declare-fun m!1318283 () Bool)

(assert (=> b!1428628 m!1318283))

(assert (=> b!1428628 m!1318283))

(assert (=> b!1428628 m!1318281))

(declare-fun m!1318285 () Bool)

(assert (=> b!1428628 m!1318285))

(assert (=> b!1428635 m!1318281))

(assert (=> b!1428635 m!1318281))

(declare-fun m!1318287 () Bool)

(assert (=> b!1428635 m!1318287))

(declare-fun m!1318289 () Bool)

(assert (=> b!1428637 m!1318289))

(assert (=> b!1428637 m!1318289))

(declare-fun m!1318291 () Bool)

(assert (=> b!1428637 m!1318291))

(declare-fun m!1318293 () Bool)

(assert (=> b!1428637 m!1318293))

(declare-fun m!1318295 () Bool)

(assert (=> b!1428637 m!1318295))

(declare-fun m!1318297 () Bool)

(assert (=> start!123224 m!1318297))

(declare-fun m!1318299 () Bool)

(assert (=> start!123224 m!1318299))

(assert (=> b!1428634 m!1318281))

(assert (=> b!1428634 m!1318281))

(declare-fun m!1318301 () Bool)

(assert (=> b!1428634 m!1318301))

(declare-fun m!1318303 () Bool)

(assert (=> b!1428633 m!1318303))

(assert (=> b!1428632 m!1318281))

(assert (=> b!1428632 m!1318281))

(declare-fun m!1318305 () Bool)

(assert (=> b!1428632 m!1318305))

(declare-fun m!1318307 () Bool)

(assert (=> b!1428627 m!1318307))

(declare-fun m!1318309 () Bool)

(assert (=> b!1428631 m!1318309))

(assert (=> b!1428631 m!1318309))

(declare-fun m!1318311 () Bool)

(assert (=> b!1428631 m!1318311))

(check-sat (not b!1428627) (not b!1428637) (not b!1428631) (not b!1428634) (not b!1428633) (not b!1428635) (not start!123224) (not b!1428632) (not b!1428639) (not b!1428628) (not b!1428630))
(check-sat)
