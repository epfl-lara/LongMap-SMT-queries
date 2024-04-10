; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122562 () Bool)

(assert start!122562)

(declare-fun b!1419524 () Bool)

(declare-fun res!954959 () Bool)

(declare-fun e!803153 () Bool)

(assert (=> b!1419524 (=> (not res!954959) (not e!803153))))

(declare-datatypes ((array!96927 0))(
  ( (array!96928 (arr!46781 (Array (_ BitVec 32) (_ BitVec 64))) (size!47331 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96927)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419524 (= res!954959 (validKeyInArray!0 (select (arr!46781 a!2831) j!81)))))

(declare-fun res!954963 () Bool)

(assert (=> start!122562 (=> (not res!954963) (not e!803153))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122562 (= res!954963 (validMask!0 mask!2608))))

(assert (=> start!122562 e!803153))

(assert (=> start!122562 true))

(declare-fun array_inv!35809 (array!96927) Bool)

(assert (=> start!122562 (array_inv!35809 a!2831)))

(declare-fun b!1419525 () Bool)

(declare-fun res!954964 () Bool)

(assert (=> b!1419525 (=> (not res!954964) (not e!803153))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11066 0))(
  ( (MissingZero!11066 (index!46656 (_ BitVec 32))) (Found!11066 (index!46657 (_ BitVec 32))) (Intermediate!11066 (undefined!11878 Bool) (index!46658 (_ BitVec 32)) (x!128332 (_ BitVec 32))) (Undefined!11066) (MissingVacant!11066 (index!46659 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96927 (_ BitVec 32)) SeekEntryResult!11066)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419525 (= res!954964 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46781 a!2831) j!81) mask!2608) (select (arr!46781 a!2831) j!81) a!2831 mask!2608) (Intermediate!11066 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419526 () Bool)

(declare-fun res!954958 () Bool)

(assert (=> b!1419526 (=> (not res!954958) (not e!803153))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419526 (= res!954958 (and (= (size!47331 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47331 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47331 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419527 () Bool)

(declare-fun res!954957 () Bool)

(assert (=> b!1419527 (=> (not res!954957) (not e!803153))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419527 (= res!954957 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47331 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47331 a!2831))))))

(declare-fun b!1419528 () Bool)

(declare-fun res!954960 () Bool)

(assert (=> b!1419528 (=> (not res!954960) (not e!803153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96927 (_ BitVec 32)) Bool)

(assert (=> b!1419528 (= res!954960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419529 () Bool)

(declare-fun res!954962 () Bool)

(assert (=> b!1419529 (=> (not res!954962) (not e!803153))))

(assert (=> b!1419529 (= res!954962 (validKeyInArray!0 (select (arr!46781 a!2831) i!982)))))

(declare-fun b!1419530 () Bool)

(declare-fun res!954961 () Bool)

(assert (=> b!1419530 (=> (not res!954961) (not e!803153))))

(declare-datatypes ((List!33291 0))(
  ( (Nil!33288) (Cons!33287 (h!34589 (_ BitVec 64)) (t!47985 List!33291)) )
))
(declare-fun arrayNoDuplicates!0 (array!96927 (_ BitVec 32) List!33291) Bool)

(assert (=> b!1419530 (= res!954961 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33288))))

(declare-fun b!1419531 () Bool)

(assert (=> b!1419531 (= e!803153 false)))

(declare-fun lt!625830 () (_ BitVec 32))

(assert (=> b!1419531 (= lt!625830 (toIndex!0 (select (store (arr!46781 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(assert (= (and start!122562 res!954963) b!1419526))

(assert (= (and b!1419526 res!954958) b!1419529))

(assert (= (and b!1419529 res!954962) b!1419524))

(assert (= (and b!1419524 res!954959) b!1419528))

(assert (= (and b!1419528 res!954960) b!1419530))

(assert (= (and b!1419530 res!954961) b!1419527))

(assert (= (and b!1419527 res!954957) b!1419525))

(assert (= (and b!1419525 res!954964) b!1419531))

(declare-fun m!1309959 () Bool)

(assert (=> start!122562 m!1309959))

(declare-fun m!1309961 () Bool)

(assert (=> start!122562 m!1309961))

(declare-fun m!1309963 () Bool)

(assert (=> b!1419529 m!1309963))

(assert (=> b!1419529 m!1309963))

(declare-fun m!1309965 () Bool)

(assert (=> b!1419529 m!1309965))

(declare-fun m!1309967 () Bool)

(assert (=> b!1419528 m!1309967))

(declare-fun m!1309969 () Bool)

(assert (=> b!1419531 m!1309969))

(declare-fun m!1309971 () Bool)

(assert (=> b!1419531 m!1309971))

(assert (=> b!1419531 m!1309971))

(declare-fun m!1309973 () Bool)

(assert (=> b!1419531 m!1309973))

(declare-fun m!1309975 () Bool)

(assert (=> b!1419530 m!1309975))

(declare-fun m!1309977 () Bool)

(assert (=> b!1419525 m!1309977))

(assert (=> b!1419525 m!1309977))

(declare-fun m!1309979 () Bool)

(assert (=> b!1419525 m!1309979))

(assert (=> b!1419525 m!1309979))

(assert (=> b!1419525 m!1309977))

(declare-fun m!1309981 () Bool)

(assert (=> b!1419525 m!1309981))

(assert (=> b!1419524 m!1309977))

(assert (=> b!1419524 m!1309977))

(declare-fun m!1309983 () Bool)

(assert (=> b!1419524 m!1309983))

(push 1)

(assert (not b!1419530))

(assert (not b!1419529))

(assert (not start!122562))

(assert (not b!1419524))

(assert (not b!1419528))

(assert (not b!1419525))

(assert (not b!1419531))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

