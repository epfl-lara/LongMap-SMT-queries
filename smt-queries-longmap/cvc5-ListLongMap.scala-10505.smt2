; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123726 () Bool)

(assert start!123726)

(declare-fun b!1434197 () Bool)

(declare-fun res!967671 () Bool)

(declare-fun e!809468 () Bool)

(assert (=> b!1434197 (=> (not res!967671) (not e!809468))))

(declare-datatypes ((SeekEntryResult!11375 0))(
  ( (MissingZero!11375 (index!47892 (_ BitVec 32))) (Found!11375 (index!47893 (_ BitVec 32))) (Intermediate!11375 (undefined!12187 Bool) (index!47894 (_ BitVec 32)) (x!129547 (_ BitVec 32))) (Undefined!11375) (MissingVacant!11375 (index!47895 (_ BitVec 32))) )
))
(declare-fun lt!631366 () SeekEntryResult!11375)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97584 0))(
  ( (array!97585 (arr!47096 (Array (_ BitVec 32) (_ BitVec 64))) (size!47646 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97584)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97584 (_ BitVec 32)) SeekEntryResult!11375)

(assert (=> b!1434197 (= res!967671 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47096 a!2831) j!81) a!2831 mask!2608) lt!631366))))

(declare-fun b!1434198 () Bool)

(declare-fun res!967659 () Bool)

(assert (=> b!1434198 (=> (not res!967659) (not e!809468))))

(declare-fun lt!631365 () array!97584)

(declare-fun lt!631363 () SeekEntryResult!11375)

(declare-fun lt!631367 () (_ BitVec 64))

(assert (=> b!1434198 (= res!967659 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631367 lt!631365 mask!2608) lt!631363))))

(declare-fun b!1434199 () Bool)

(declare-fun e!809467 () Bool)

(declare-fun e!809466 () Bool)

(assert (=> b!1434199 (= e!809467 e!809466)))

(declare-fun res!967668 () Bool)

(assert (=> b!1434199 (=> (not res!967668) (not e!809466))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434199 (= res!967668 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47096 a!2831) j!81) mask!2608) (select (arr!47096 a!2831) j!81) a!2831 mask!2608) lt!631366))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1434199 (= lt!631366 (Intermediate!11375 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434200 () Bool)

(declare-fun res!967666 () Bool)

(assert (=> b!1434200 (=> (not res!967666) (not e!809467))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434200 (= res!967666 (and (= (size!47646 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47646 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47646 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434201 () Bool)

(declare-fun res!967665 () Bool)

(assert (=> b!1434201 (=> (not res!967665) (not e!809467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97584 (_ BitVec 32)) Bool)

(assert (=> b!1434201 (= res!967665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434203 () Bool)

(declare-fun e!809471 () Bool)

(assert (=> b!1434203 (= e!809471 true)))

(declare-fun lt!631368 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434203 (= lt!631368 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun e!809470 () Bool)

(declare-fun b!1434204 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97584 (_ BitVec 32)) SeekEntryResult!11375)

(assert (=> b!1434204 (= e!809470 (= (seekEntryOrOpen!0 (select (arr!47096 a!2831) j!81) a!2831 mask!2608) (Found!11375 j!81)))))

(declare-fun b!1434205 () Bool)

(declare-fun res!967663 () Bool)

(assert (=> b!1434205 (=> (not res!967663) (not e!809468))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434205 (= res!967663 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434206 () Bool)

(declare-fun res!967667 () Bool)

(assert (=> b!1434206 (=> (not res!967667) (not e!809467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434206 (= res!967667 (validKeyInArray!0 (select (arr!47096 a!2831) j!81)))))

(declare-fun b!1434207 () Bool)

(assert (=> b!1434207 (= e!809468 (not e!809471))))

(declare-fun res!967664 () Bool)

(assert (=> b!1434207 (=> res!967664 e!809471)))

(assert (=> b!1434207 (= res!967664 (or (= (select (arr!47096 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47096 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47096 a!2831) index!585) (select (arr!47096 a!2831) j!81)) (= (select (store (arr!47096 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434207 e!809470))

(declare-fun res!967670 () Bool)

(assert (=> b!1434207 (=> (not res!967670) (not e!809470))))

(assert (=> b!1434207 (= res!967670 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48496 0))(
  ( (Unit!48497) )
))
(declare-fun lt!631364 () Unit!48496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48496)

(assert (=> b!1434207 (= lt!631364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434208 () Bool)

(declare-fun res!967660 () Bool)

(assert (=> b!1434208 (=> (not res!967660) (not e!809467))))

(assert (=> b!1434208 (= res!967660 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47646 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47646 a!2831))))))

(declare-fun res!967669 () Bool)

(assert (=> start!123726 (=> (not res!967669) (not e!809467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123726 (= res!967669 (validMask!0 mask!2608))))

(assert (=> start!123726 e!809467))

(assert (=> start!123726 true))

(declare-fun array_inv!36124 (array!97584) Bool)

(assert (=> start!123726 (array_inv!36124 a!2831)))

(declare-fun b!1434202 () Bool)

(declare-fun res!967662 () Bool)

(assert (=> b!1434202 (=> (not res!967662) (not e!809467))))

(declare-datatypes ((List!33606 0))(
  ( (Nil!33603) (Cons!33602 (h!34931 (_ BitVec 64)) (t!48300 List!33606)) )
))
(declare-fun arrayNoDuplicates!0 (array!97584 (_ BitVec 32) List!33606) Bool)

(assert (=> b!1434202 (= res!967662 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33603))))

(declare-fun b!1434209 () Bool)

(assert (=> b!1434209 (= e!809466 e!809468)))

(declare-fun res!967661 () Bool)

(assert (=> b!1434209 (=> (not res!967661) (not e!809468))))

(assert (=> b!1434209 (= res!967661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631367 mask!2608) lt!631367 lt!631365 mask!2608) lt!631363))))

(assert (=> b!1434209 (= lt!631363 (Intermediate!11375 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434209 (= lt!631367 (select (store (arr!47096 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434209 (= lt!631365 (array!97585 (store (arr!47096 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47646 a!2831)))))

(declare-fun b!1434210 () Bool)

(declare-fun res!967672 () Bool)

(assert (=> b!1434210 (=> (not res!967672) (not e!809467))))

(assert (=> b!1434210 (= res!967672 (validKeyInArray!0 (select (arr!47096 a!2831) i!982)))))

(assert (= (and start!123726 res!967669) b!1434200))

(assert (= (and b!1434200 res!967666) b!1434210))

(assert (= (and b!1434210 res!967672) b!1434206))

(assert (= (and b!1434206 res!967667) b!1434201))

(assert (= (and b!1434201 res!967665) b!1434202))

(assert (= (and b!1434202 res!967662) b!1434208))

(assert (= (and b!1434208 res!967660) b!1434199))

(assert (= (and b!1434199 res!967668) b!1434209))

(assert (= (and b!1434209 res!967661) b!1434197))

(assert (= (and b!1434197 res!967671) b!1434198))

(assert (= (and b!1434198 res!967659) b!1434205))

(assert (= (and b!1434205 res!967663) b!1434207))

(assert (= (and b!1434207 res!967670) b!1434204))

(assert (= (and b!1434207 (not res!967664)) b!1434203))

(declare-fun m!1323813 () Bool)

(assert (=> b!1434207 m!1323813))

(declare-fun m!1323815 () Bool)

(assert (=> b!1434207 m!1323815))

(declare-fun m!1323817 () Bool)

(assert (=> b!1434207 m!1323817))

(declare-fun m!1323819 () Bool)

(assert (=> b!1434207 m!1323819))

(declare-fun m!1323821 () Bool)

(assert (=> b!1434207 m!1323821))

(declare-fun m!1323823 () Bool)

(assert (=> b!1434207 m!1323823))

(assert (=> b!1434199 m!1323821))

(assert (=> b!1434199 m!1323821))

(declare-fun m!1323825 () Bool)

(assert (=> b!1434199 m!1323825))

(assert (=> b!1434199 m!1323825))

(assert (=> b!1434199 m!1323821))

(declare-fun m!1323827 () Bool)

(assert (=> b!1434199 m!1323827))

(assert (=> b!1434197 m!1323821))

(assert (=> b!1434197 m!1323821))

(declare-fun m!1323829 () Bool)

(assert (=> b!1434197 m!1323829))

(declare-fun m!1323831 () Bool)

(assert (=> b!1434201 m!1323831))

(declare-fun m!1323833 () Bool)

(assert (=> b!1434198 m!1323833))

(declare-fun m!1323835 () Bool)

(assert (=> start!123726 m!1323835))

(declare-fun m!1323837 () Bool)

(assert (=> start!123726 m!1323837))

(assert (=> b!1434206 m!1323821))

(assert (=> b!1434206 m!1323821))

(declare-fun m!1323839 () Bool)

(assert (=> b!1434206 m!1323839))

(declare-fun m!1323841 () Bool)

(assert (=> b!1434209 m!1323841))

(assert (=> b!1434209 m!1323841))

(declare-fun m!1323843 () Bool)

(assert (=> b!1434209 m!1323843))

(assert (=> b!1434209 m!1323813))

(declare-fun m!1323845 () Bool)

(assert (=> b!1434209 m!1323845))

(declare-fun m!1323847 () Bool)

(assert (=> b!1434203 m!1323847))

(assert (=> b!1434204 m!1323821))

(assert (=> b!1434204 m!1323821))

(declare-fun m!1323849 () Bool)

(assert (=> b!1434204 m!1323849))

(declare-fun m!1323851 () Bool)

(assert (=> b!1434202 m!1323851))

(declare-fun m!1323853 () Bool)

(assert (=> b!1434210 m!1323853))

(assert (=> b!1434210 m!1323853))

(declare-fun m!1323855 () Bool)

(assert (=> b!1434210 m!1323855))

(push 1)

