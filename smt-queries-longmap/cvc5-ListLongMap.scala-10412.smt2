; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122826 () Bool)

(assert start!122826)

(declare-fun b!1421665 () Bool)

(declare-fun res!956418 () Bool)

(declare-fun e!804145 () Bool)

(assert (=> b!1421665 (=> (not res!956418) (not e!804145))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97113 0))(
  ( (array!97114 (arr!46872 (Array (_ BitVec 32) (_ BitVec 64))) (size!47423 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97113)

(declare-datatypes ((SeekEntryResult!11059 0))(
  ( (MissingZero!11059 (index!46628 (_ BitVec 32))) (Found!11059 (index!46629 (_ BitVec 32))) (Intermediate!11059 (undefined!11871 Bool) (index!46630 (_ BitVec 32)) (x!128440 (_ BitVec 32))) (Undefined!11059) (MissingVacant!11059 (index!46631 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97113 (_ BitVec 32)) SeekEntryResult!11059)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421665 (= res!956418 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46872 a!2831) j!81) mask!2608) (select (arr!46872 a!2831) j!81) a!2831 mask!2608) (Intermediate!11059 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1421666 () Bool)

(declare-fun res!956415 () Bool)

(assert (=> b!1421666 (=> (not res!956415) (not e!804145))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421666 (= res!956415 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47423 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47423 a!2831))))))

(declare-fun b!1421667 () Bool)

(declare-fun res!956420 () Bool)

(assert (=> b!1421667 (=> (not res!956420) (not e!804145))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1421667 (= res!956420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46872 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46872 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97114 (store (arr!46872 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47423 a!2831)) mask!2608) (Intermediate!11059 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun res!956421 () Bool)

(assert (=> start!122826 (=> (not res!956421) (not e!804145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122826 (= res!956421 (validMask!0 mask!2608))))

(assert (=> start!122826 e!804145))

(assert (=> start!122826 true))

(declare-fun array_inv!36153 (array!97113) Bool)

(assert (=> start!122826 (array_inv!36153 a!2831)))

(declare-fun b!1421668 () Bool)

(assert (=> b!1421668 (= e!804145 false)))

(declare-fun lt!626324 () SeekEntryResult!11059)

(assert (=> b!1421668 (= lt!626324 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46872 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1421669 () Bool)

(declare-fun res!956417 () Bool)

(assert (=> b!1421669 (=> (not res!956417) (not e!804145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97113 (_ BitVec 32)) Bool)

(assert (=> b!1421669 (= res!956417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421670 () Bool)

(declare-fun res!956414 () Bool)

(assert (=> b!1421670 (=> (not res!956414) (not e!804145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421670 (= res!956414 (validKeyInArray!0 (select (arr!46872 a!2831) j!81)))))

(declare-fun b!1421671 () Bool)

(declare-fun res!956416 () Bool)

(assert (=> b!1421671 (=> (not res!956416) (not e!804145))))

(declare-datatypes ((List!33369 0))(
  ( (Nil!33366) (Cons!33365 (h!34675 (_ BitVec 64)) (t!48055 List!33369)) )
))
(declare-fun arrayNoDuplicates!0 (array!97113 (_ BitVec 32) List!33369) Bool)

(assert (=> b!1421671 (= res!956416 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33366))))

(declare-fun b!1421672 () Bool)

(declare-fun res!956419 () Bool)

(assert (=> b!1421672 (=> (not res!956419) (not e!804145))))

(assert (=> b!1421672 (= res!956419 (validKeyInArray!0 (select (arr!46872 a!2831) i!982)))))

(declare-fun b!1421673 () Bool)

(declare-fun res!956422 () Bool)

(assert (=> b!1421673 (=> (not res!956422) (not e!804145))))

(assert (=> b!1421673 (= res!956422 (and (= (size!47423 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47423 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47423 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122826 res!956421) b!1421673))

(assert (= (and b!1421673 res!956422) b!1421672))

(assert (= (and b!1421672 res!956419) b!1421670))

(assert (= (and b!1421670 res!956414) b!1421669))

(assert (= (and b!1421669 res!956417) b!1421671))

(assert (= (and b!1421671 res!956416) b!1421666))

(assert (= (and b!1421666 res!956415) b!1421665))

(assert (= (and b!1421665 res!956418) b!1421667))

(assert (= (and b!1421667 res!956420) b!1421668))

(declare-fun m!1312413 () Bool)

(assert (=> b!1421665 m!1312413))

(assert (=> b!1421665 m!1312413))

(declare-fun m!1312415 () Bool)

(assert (=> b!1421665 m!1312415))

(assert (=> b!1421665 m!1312415))

(assert (=> b!1421665 m!1312413))

(declare-fun m!1312417 () Bool)

(assert (=> b!1421665 m!1312417))

(declare-fun m!1312419 () Bool)

(assert (=> b!1421669 m!1312419))

(declare-fun m!1312421 () Bool)

(assert (=> b!1421672 m!1312421))

(assert (=> b!1421672 m!1312421))

(declare-fun m!1312423 () Bool)

(assert (=> b!1421672 m!1312423))

(assert (=> b!1421668 m!1312413))

(assert (=> b!1421668 m!1312413))

(declare-fun m!1312425 () Bool)

(assert (=> b!1421668 m!1312425))

(assert (=> b!1421670 m!1312413))

(assert (=> b!1421670 m!1312413))

(declare-fun m!1312427 () Bool)

(assert (=> b!1421670 m!1312427))

(declare-fun m!1312429 () Bool)

(assert (=> b!1421671 m!1312429))

(declare-fun m!1312431 () Bool)

(assert (=> b!1421667 m!1312431))

(declare-fun m!1312433 () Bool)

(assert (=> b!1421667 m!1312433))

(assert (=> b!1421667 m!1312433))

(declare-fun m!1312435 () Bool)

(assert (=> b!1421667 m!1312435))

(assert (=> b!1421667 m!1312435))

(assert (=> b!1421667 m!1312433))

(declare-fun m!1312437 () Bool)

(assert (=> b!1421667 m!1312437))

(declare-fun m!1312439 () Bool)

(assert (=> start!122826 m!1312439))

(declare-fun m!1312441 () Bool)

(assert (=> start!122826 m!1312441))

(push 1)

(assert (not b!1421665))

(assert (not b!1421669))

(assert (not b!1421672))

(assert (not start!122826))

(assert (not b!1421667))

(assert (not b!1421670))

(assert (not b!1421671))

(assert (not b!1421668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

