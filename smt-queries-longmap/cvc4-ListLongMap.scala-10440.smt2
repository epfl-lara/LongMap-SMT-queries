; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122806 () Bool)

(assert start!122806)

(declare-fun b!1423983 () Bool)

(declare-fun res!959428 () Bool)

(declare-fun e!804816 () Bool)

(assert (=> b!1423983 (=> (not res!959428) (not e!804816))))

(declare-datatypes ((array!97171 0))(
  ( (array!97172 (arr!46903 (Array (_ BitVec 32) (_ BitVec 64))) (size!47453 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97171)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423983 (= res!959428 (validKeyInArray!0 (select (arr!46903 a!2831) i!982)))))

(declare-fun b!1423984 () Bool)

(declare-fun res!959418 () Bool)

(assert (=> b!1423984 (=> (not res!959418) (not e!804816))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1423984 (= res!959418 (validKeyInArray!0 (select (arr!46903 a!2831) j!81)))))

(declare-fun b!1423985 () Bool)

(declare-fun res!959420 () Bool)

(assert (=> b!1423985 (=> (not res!959420) (not e!804816))))

(declare-datatypes ((List!33413 0))(
  ( (Nil!33410) (Cons!33409 (h!34711 (_ BitVec 64)) (t!48107 List!33413)) )
))
(declare-fun arrayNoDuplicates!0 (array!97171 (_ BitVec 32) List!33413) Bool)

(assert (=> b!1423985 (= res!959420 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33410))))

(declare-fun b!1423986 () Bool)

(declare-fun res!959421 () Bool)

(declare-fun e!804819 () Bool)

(assert (=> b!1423986 (=> (not res!959421) (not e!804819))))

(declare-datatypes ((SeekEntryResult!11188 0))(
  ( (MissingZero!11188 (index!47144 (_ BitVec 32))) (Found!11188 (index!47145 (_ BitVec 32))) (Intermediate!11188 (undefined!12000 Bool) (index!47146 (_ BitVec 32)) (x!128774 (_ BitVec 32))) (Undefined!11188) (MissingVacant!11188 (index!47147 (_ BitVec 32))) )
))
(declare-fun lt!627355 () SeekEntryResult!11188)

(declare-fun lt!627354 () array!97171)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!627353 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97171 (_ BitVec 32)) SeekEntryResult!11188)

(assert (=> b!1423986 (= res!959421 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627353 lt!627354 mask!2608) lt!627355))))

(declare-fun res!959422 () Bool)

(assert (=> start!122806 (=> (not res!959422) (not e!804816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122806 (= res!959422 (validMask!0 mask!2608))))

(assert (=> start!122806 e!804816))

(assert (=> start!122806 true))

(declare-fun array_inv!35931 (array!97171) Bool)

(assert (=> start!122806 (array_inv!35931 a!2831)))

(declare-fun b!1423987 () Bool)

(declare-fun res!959429 () Bool)

(assert (=> b!1423987 (=> (not res!959429) (not e!804816))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423987 (= res!959429 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47453 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47453 a!2831))))))

(declare-fun b!1423988 () Bool)

(declare-fun res!959423 () Bool)

(assert (=> b!1423988 (=> (not res!959423) (not e!804819))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423988 (= res!959423 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423989 () Bool)

(declare-fun e!804817 () Bool)

(assert (=> b!1423989 (= e!804819 (not e!804817))))

(declare-fun res!959416 () Bool)

(assert (=> b!1423989 (=> res!959416 e!804817)))

(assert (=> b!1423989 (= res!959416 (or (= (select (arr!46903 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46903 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46903 a!2831) index!585) (select (arr!46903 a!2831) j!81)) (= (select (store (arr!46903 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804818 () Bool)

(assert (=> b!1423989 e!804818))

(declare-fun res!959431 () Bool)

(assert (=> b!1423989 (=> (not res!959431) (not e!804818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97171 (_ BitVec 32)) Bool)

(assert (=> b!1423989 (= res!959431 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48212 0))(
  ( (Unit!48213) )
))
(declare-fun lt!627357 () Unit!48212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48212)

(assert (=> b!1423989 (= lt!627357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423990 () Bool)

(declare-fun res!959419 () Bool)

(assert (=> b!1423990 (=> (not res!959419) (not e!804816))))

(assert (=> b!1423990 (= res!959419 (and (= (size!47453 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47453 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47453 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423991 () Bool)

(declare-fun res!959430 () Bool)

(assert (=> b!1423991 (=> (not res!959430) (not e!804816))))

(assert (=> b!1423991 (= res!959430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423992 () Bool)

(declare-fun res!959426 () Bool)

(declare-fun e!804815 () Bool)

(assert (=> b!1423992 (=> res!959426 e!804815)))

(declare-fun lt!627352 () SeekEntryResult!11188)

(declare-fun lt!627356 () (_ BitVec 32))

(assert (=> b!1423992 (= res!959426 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627356 (select (arr!46903 a!2831) j!81) a!2831 mask!2608) lt!627352)))))

(declare-fun b!1423993 () Bool)

(assert (=> b!1423993 (= e!804815 true)))

(declare-fun lt!627351 () SeekEntryResult!11188)

(assert (=> b!1423993 (= lt!627351 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627356 lt!627353 lt!627354 mask!2608))))

(declare-fun b!1423994 () Bool)

(assert (=> b!1423994 (= e!804817 e!804815)))

(declare-fun res!959417 () Bool)

(assert (=> b!1423994 (=> res!959417 e!804815)))

(assert (=> b!1423994 (= res!959417 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627356 #b00000000000000000000000000000000) (bvsge lt!627356 (size!47453 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423994 (= lt!627356 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423995 () Bool)

(declare-fun e!804821 () Bool)

(assert (=> b!1423995 (= e!804821 e!804819)))

(declare-fun res!959425 () Bool)

(assert (=> b!1423995 (=> (not res!959425) (not e!804819))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423995 (= res!959425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627353 mask!2608) lt!627353 lt!627354 mask!2608) lt!627355))))

(assert (=> b!1423995 (= lt!627355 (Intermediate!11188 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423995 (= lt!627353 (select (store (arr!46903 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423995 (= lt!627354 (array!97172 (store (arr!46903 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47453 a!2831)))))

(declare-fun b!1423996 () Bool)

(declare-fun res!959427 () Bool)

(assert (=> b!1423996 (=> (not res!959427) (not e!804819))))

(assert (=> b!1423996 (= res!959427 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46903 a!2831) j!81) a!2831 mask!2608) lt!627352))))

(declare-fun b!1423997 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97171 (_ BitVec 32)) SeekEntryResult!11188)

(assert (=> b!1423997 (= e!804818 (= (seekEntryOrOpen!0 (select (arr!46903 a!2831) j!81) a!2831 mask!2608) (Found!11188 j!81)))))

(declare-fun b!1423998 () Bool)

(assert (=> b!1423998 (= e!804816 e!804821)))

(declare-fun res!959424 () Bool)

(assert (=> b!1423998 (=> (not res!959424) (not e!804821))))

(assert (=> b!1423998 (= res!959424 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46903 a!2831) j!81) mask!2608) (select (arr!46903 a!2831) j!81) a!2831 mask!2608) lt!627352))))

(assert (=> b!1423998 (= lt!627352 (Intermediate!11188 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122806 res!959422) b!1423990))

(assert (= (and b!1423990 res!959419) b!1423983))

(assert (= (and b!1423983 res!959428) b!1423984))

(assert (= (and b!1423984 res!959418) b!1423991))

(assert (= (and b!1423991 res!959430) b!1423985))

(assert (= (and b!1423985 res!959420) b!1423987))

(assert (= (and b!1423987 res!959429) b!1423998))

(assert (= (and b!1423998 res!959424) b!1423995))

(assert (= (and b!1423995 res!959425) b!1423996))

(assert (= (and b!1423996 res!959427) b!1423986))

(assert (= (and b!1423986 res!959421) b!1423988))

(assert (= (and b!1423988 res!959423) b!1423989))

(assert (= (and b!1423989 res!959431) b!1423997))

(assert (= (and b!1423989 (not res!959416)) b!1423994))

(assert (= (and b!1423994 (not res!959417)) b!1423992))

(assert (= (and b!1423992 (not res!959426)) b!1423993))

(declare-fun m!1314531 () Bool)

(assert (=> b!1423989 m!1314531))

(declare-fun m!1314533 () Bool)

(assert (=> b!1423989 m!1314533))

(declare-fun m!1314535 () Bool)

(assert (=> b!1423989 m!1314535))

(declare-fun m!1314537 () Bool)

(assert (=> b!1423989 m!1314537))

(declare-fun m!1314539 () Bool)

(assert (=> b!1423989 m!1314539))

(declare-fun m!1314541 () Bool)

(assert (=> b!1423989 m!1314541))

(declare-fun m!1314543 () Bool)

(assert (=> b!1423991 m!1314543))

(assert (=> b!1423992 m!1314539))

(assert (=> b!1423992 m!1314539))

(declare-fun m!1314545 () Bool)

(assert (=> b!1423992 m!1314545))

(assert (=> b!1423984 m!1314539))

(assert (=> b!1423984 m!1314539))

(declare-fun m!1314547 () Bool)

(assert (=> b!1423984 m!1314547))

(assert (=> b!1423997 m!1314539))

(assert (=> b!1423997 m!1314539))

(declare-fun m!1314549 () Bool)

(assert (=> b!1423997 m!1314549))

(declare-fun m!1314551 () Bool)

(assert (=> b!1423986 m!1314551))

(assert (=> b!1423996 m!1314539))

(assert (=> b!1423996 m!1314539))

(declare-fun m!1314553 () Bool)

(assert (=> b!1423996 m!1314553))

(declare-fun m!1314555 () Bool)

(assert (=> b!1423995 m!1314555))

(assert (=> b!1423995 m!1314555))

(declare-fun m!1314557 () Bool)

(assert (=> b!1423995 m!1314557))

(assert (=> b!1423995 m!1314531))

(declare-fun m!1314559 () Bool)

(assert (=> b!1423995 m!1314559))

(declare-fun m!1314561 () Bool)

(assert (=> b!1423994 m!1314561))

(assert (=> b!1423998 m!1314539))

(assert (=> b!1423998 m!1314539))

(declare-fun m!1314563 () Bool)

(assert (=> b!1423998 m!1314563))

(assert (=> b!1423998 m!1314563))

(assert (=> b!1423998 m!1314539))

(declare-fun m!1314565 () Bool)

(assert (=> b!1423998 m!1314565))

(declare-fun m!1314567 () Bool)

(assert (=> b!1423983 m!1314567))

(assert (=> b!1423983 m!1314567))

(declare-fun m!1314569 () Bool)

(assert (=> b!1423983 m!1314569))

(declare-fun m!1314571 () Bool)

(assert (=> b!1423993 m!1314571))

(declare-fun m!1314573 () Bool)

(assert (=> b!1423985 m!1314573))

(declare-fun m!1314575 () Bool)

(assert (=> start!122806 m!1314575))

(declare-fun m!1314577 () Bool)

(assert (=> start!122806 m!1314577))

(push 1)

