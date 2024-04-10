; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122934 () Bool)

(assert start!122934)

(declare-fun res!961446 () Bool)

(declare-fun e!805551 () Bool)

(assert (=> start!122934 (=> (not res!961446) (not e!805551))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122934 (= res!961446 (validMask!0 mask!2608))))

(assert (=> start!122934 e!805551))

(assert (=> start!122934 true))

(declare-datatypes ((array!97299 0))(
  ( (array!97300 (arr!46967 (Array (_ BitVec 32) (_ BitVec 64))) (size!47517 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97299)

(declare-fun array_inv!35995 (array!97299) Bool)

(assert (=> start!122934 (array_inv!35995 a!2831)))

(declare-fun b!1426010 () Bool)

(declare-fun res!961443 () Bool)

(declare-fun e!805550 () Bool)

(assert (=> b!1426010 (=> (not res!961443) (not e!805550))))

(declare-datatypes ((SeekEntryResult!11246 0))(
  ( (MissingZero!11246 (index!47376 (_ BitVec 32))) (Found!11246 (index!47377 (_ BitVec 32))) (Intermediate!11246 (undefined!12058 Bool) (index!47378 (_ BitVec 32)) (x!129008 (_ BitVec 32))) (Undefined!11246) (MissingVacant!11246 (index!47379 (_ BitVec 32))) )
))
(declare-fun lt!627988 () SeekEntryResult!11246)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627987 () (_ BitVec 64))

(declare-fun lt!627990 () array!97299)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97299 (_ BitVec 32)) SeekEntryResult!11246)

(assert (=> b!1426010 (= res!961443 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627987 lt!627990 mask!2608) lt!627988))))

(declare-fun b!1426011 () Bool)

(declare-fun e!805553 () Bool)

(assert (=> b!1426011 (= e!805553 e!805550)))

(declare-fun res!961452 () Bool)

(assert (=> b!1426011 (=> (not res!961452) (not e!805550))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426011 (= res!961452 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627987 mask!2608) lt!627987 lt!627990 mask!2608) lt!627988))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426011 (= lt!627988 (Intermediate!11246 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426011 (= lt!627987 (select (store (arr!46967 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426011 (= lt!627990 (array!97300 (store (arr!46967 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47517 a!2831)))))

(declare-fun b!1426012 () Bool)

(assert (=> b!1426012 (= e!805551 e!805553)))

(declare-fun res!961445 () Bool)

(assert (=> b!1426012 (=> (not res!961445) (not e!805553))))

(declare-fun lt!627989 () SeekEntryResult!11246)

(assert (=> b!1426012 (= res!961445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46967 a!2831) j!81) mask!2608) (select (arr!46967 a!2831) j!81) a!2831 mask!2608) lt!627989))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426012 (= lt!627989 (Intermediate!11246 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426013 () Bool)

(declare-fun res!961447 () Bool)

(assert (=> b!1426013 (=> (not res!961447) (not e!805551))))

(declare-datatypes ((List!33477 0))(
  ( (Nil!33474) (Cons!33473 (h!34775 (_ BitVec 64)) (t!48171 List!33477)) )
))
(declare-fun arrayNoDuplicates!0 (array!97299 (_ BitVec 32) List!33477) Bool)

(assert (=> b!1426013 (= res!961447 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33474))))

(declare-fun b!1426014 () Bool)

(assert (=> b!1426014 (= e!805550 (and (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))) (bvsle #b00000000000000000000000000000000 (size!47517 a!2831)) (bvsgt j!81 (size!47517 a!2831))))))

(declare-fun b!1426015 () Bool)

(declare-fun res!961451 () Bool)

(assert (=> b!1426015 (=> (not res!961451) (not e!805551))))

(assert (=> b!1426015 (= res!961451 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47517 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47517 a!2831))))))

(declare-fun b!1426016 () Bool)

(declare-fun res!961444 () Bool)

(assert (=> b!1426016 (=> (not res!961444) (not e!805551))))

(assert (=> b!1426016 (= res!961444 (and (= (size!47517 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47517 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47517 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426017 () Bool)

(declare-fun res!961450 () Bool)

(assert (=> b!1426017 (=> (not res!961450) (not e!805551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426017 (= res!961450 (validKeyInArray!0 (select (arr!46967 a!2831) i!982)))))

(declare-fun b!1426018 () Bool)

(declare-fun res!961448 () Bool)

(assert (=> b!1426018 (=> (not res!961448) (not e!805551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97299 (_ BitVec 32)) Bool)

(assert (=> b!1426018 (= res!961448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426019 () Bool)

(declare-fun res!961453 () Bool)

(assert (=> b!1426019 (=> (not res!961453) (not e!805550))))

(assert (=> b!1426019 (= res!961453 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46967 a!2831) j!81) a!2831 mask!2608) lt!627989))))

(declare-fun b!1426020 () Bool)

(declare-fun res!961449 () Bool)

(assert (=> b!1426020 (=> (not res!961449) (not e!805551))))

(assert (=> b!1426020 (= res!961449 (validKeyInArray!0 (select (arr!46967 a!2831) j!81)))))

(assert (= (and start!122934 res!961446) b!1426016))

(assert (= (and b!1426016 res!961444) b!1426017))

(assert (= (and b!1426017 res!961450) b!1426020))

(assert (= (and b!1426020 res!961449) b!1426018))

(assert (= (and b!1426018 res!961448) b!1426013))

(assert (= (and b!1426013 res!961447) b!1426015))

(assert (= (and b!1426015 res!961451) b!1426012))

(assert (= (and b!1426012 res!961445) b!1426011))

(assert (= (and b!1426011 res!961452) b!1426019))

(assert (= (and b!1426019 res!961453) b!1426010))

(assert (= (and b!1426010 res!961443) b!1426014))

(declare-fun m!1316619 () Bool)

(assert (=> b!1426010 m!1316619))

(declare-fun m!1316621 () Bool)

(assert (=> start!122934 m!1316621))

(declare-fun m!1316623 () Bool)

(assert (=> start!122934 m!1316623))

(declare-fun m!1316625 () Bool)

(assert (=> b!1426011 m!1316625))

(assert (=> b!1426011 m!1316625))

(declare-fun m!1316627 () Bool)

(assert (=> b!1426011 m!1316627))

(declare-fun m!1316629 () Bool)

(assert (=> b!1426011 m!1316629))

(declare-fun m!1316631 () Bool)

(assert (=> b!1426011 m!1316631))

(declare-fun m!1316633 () Bool)

(assert (=> b!1426017 m!1316633))

(assert (=> b!1426017 m!1316633))

(declare-fun m!1316635 () Bool)

(assert (=> b!1426017 m!1316635))

(declare-fun m!1316637 () Bool)

(assert (=> b!1426019 m!1316637))

(assert (=> b!1426019 m!1316637))

(declare-fun m!1316639 () Bool)

(assert (=> b!1426019 m!1316639))

(declare-fun m!1316641 () Bool)

(assert (=> b!1426013 m!1316641))

(declare-fun m!1316643 () Bool)

(assert (=> b!1426018 m!1316643))

(assert (=> b!1426020 m!1316637))

(assert (=> b!1426020 m!1316637))

(declare-fun m!1316645 () Bool)

(assert (=> b!1426020 m!1316645))

(assert (=> b!1426012 m!1316637))

(assert (=> b!1426012 m!1316637))

(declare-fun m!1316647 () Bool)

(assert (=> b!1426012 m!1316647))

(assert (=> b!1426012 m!1316647))

(assert (=> b!1426012 m!1316637))

(declare-fun m!1316649 () Bool)

(assert (=> b!1426012 m!1316649))

(push 1)

(assert (not start!122934))

(assert (not b!1426018))

(assert (not b!1426019))

(assert (not b!1426017))

(assert (not b!1426010))

(assert (not b!1426013))

(assert (not b!1426012))

(assert (not b!1426011))

(assert (not b!1426020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

