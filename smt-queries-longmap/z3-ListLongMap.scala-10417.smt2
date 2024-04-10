; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122666 () Bool)

(assert start!122666)

(declare-fun b!1420953 () Bool)

(declare-fun e!803567 () Bool)

(declare-fun e!803566 () Bool)

(assert (=> b!1420953 (= e!803567 e!803566)))

(declare-fun res!956386 () Bool)

(assert (=> b!1420953 (=> (not res!956386) (not e!803566))))

(declare-datatypes ((SeekEntryResult!11118 0))(
  ( (MissingZero!11118 (index!46864 (_ BitVec 32))) (Found!11118 (index!46865 (_ BitVec 32))) (Intermediate!11118 (undefined!11930 Bool) (index!46866 (_ BitVec 32)) (x!128520 (_ BitVec 32))) (Undefined!11118) (MissingVacant!11118 (index!46867 (_ BitVec 32))) )
))
(declare-fun lt!626064 () SeekEntryResult!11118)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97031 0))(
  ( (array!97032 (arr!46833 (Array (_ BitVec 32) (_ BitVec 64))) (size!47383 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97031)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97031 (_ BitVec 32)) SeekEntryResult!11118)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420953 (= res!956386 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46833 a!2831) j!81) mask!2608) (select (arr!46833 a!2831) j!81) a!2831 mask!2608) lt!626064))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420953 (= lt!626064 (Intermediate!11118 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420954 () Bool)

(declare-fun res!956389 () Bool)

(assert (=> b!1420954 (=> (not res!956389) (not e!803567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97031 (_ BitVec 32)) Bool)

(assert (=> b!1420954 (= res!956389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420955 () Bool)

(declare-fun res!956394 () Bool)

(assert (=> b!1420955 (=> (not res!956394) (not e!803567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420955 (= res!956394 (validKeyInArray!0 (select (arr!46833 a!2831) j!81)))))

(declare-fun b!1420956 () Bool)

(declare-fun res!956390 () Bool)

(assert (=> b!1420956 (=> (not res!956390) (not e!803567))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420956 (= res!956390 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47383 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47383 a!2831))))))

(declare-fun b!1420957 () Bool)

(declare-fun res!956391 () Bool)

(assert (=> b!1420957 (=> (not res!956391) (not e!803567))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420957 (= res!956391 (validKeyInArray!0 (select (arr!46833 a!2831) i!982)))))

(declare-fun b!1420958 () Bool)

(declare-fun res!956393 () Bool)

(assert (=> b!1420958 (=> (not res!956393) (not e!803567))))

(assert (=> b!1420958 (= res!956393 (and (= (size!47383 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47383 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47383 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420959 () Bool)

(declare-fun e!803564 () Bool)

(assert (=> b!1420959 (= e!803566 e!803564)))

(declare-fun res!956388 () Bool)

(assert (=> b!1420959 (=> (not res!956388) (not e!803564))))

(declare-fun lt!626066 () (_ BitVec 64))

(declare-fun lt!626065 () array!97031)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1420959 (= res!956388 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626066 mask!2608) lt!626066 lt!626065 mask!2608) (Intermediate!11118 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420959 (= lt!626066 (select (store (arr!46833 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420959 (= lt!626065 (array!97032 (store (arr!46833 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47383 a!2831)))))

(declare-fun b!1420960 () Bool)

(declare-fun res!956387 () Bool)

(assert (=> b!1420960 (=> (not res!956387) (not e!803564))))

(assert (=> b!1420960 (= res!956387 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46833 a!2831) j!81) a!2831 mask!2608) lt!626064))))

(declare-fun b!1420961 () Bool)

(assert (=> b!1420961 (= e!803564 false)))

(declare-fun lt!626067 () SeekEntryResult!11118)

(assert (=> b!1420961 (= lt!626067 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626066 lt!626065 mask!2608))))

(declare-fun res!956392 () Bool)

(assert (=> start!122666 (=> (not res!956392) (not e!803567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122666 (= res!956392 (validMask!0 mask!2608))))

(assert (=> start!122666 e!803567))

(assert (=> start!122666 true))

(declare-fun array_inv!35861 (array!97031) Bool)

(assert (=> start!122666 (array_inv!35861 a!2831)))

(declare-fun b!1420962 () Bool)

(declare-fun res!956395 () Bool)

(assert (=> b!1420962 (=> (not res!956395) (not e!803567))))

(declare-datatypes ((List!33343 0))(
  ( (Nil!33340) (Cons!33339 (h!34641 (_ BitVec 64)) (t!48037 List!33343)) )
))
(declare-fun arrayNoDuplicates!0 (array!97031 (_ BitVec 32) List!33343) Bool)

(assert (=> b!1420962 (= res!956395 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33340))))

(assert (= (and start!122666 res!956392) b!1420958))

(assert (= (and b!1420958 res!956393) b!1420957))

(assert (= (and b!1420957 res!956391) b!1420955))

(assert (= (and b!1420955 res!956394) b!1420954))

(assert (= (and b!1420954 res!956389) b!1420962))

(assert (= (and b!1420962 res!956395) b!1420956))

(assert (= (and b!1420956 res!956390) b!1420953))

(assert (= (and b!1420953 res!956386) b!1420959))

(assert (= (and b!1420959 res!956388) b!1420960))

(assert (= (and b!1420960 res!956387) b!1420961))

(declare-fun m!1311491 () Bool)

(assert (=> b!1420961 m!1311491))

(declare-fun m!1311493 () Bool)

(assert (=> b!1420955 m!1311493))

(assert (=> b!1420955 m!1311493))

(declare-fun m!1311495 () Bool)

(assert (=> b!1420955 m!1311495))

(assert (=> b!1420953 m!1311493))

(assert (=> b!1420953 m!1311493))

(declare-fun m!1311497 () Bool)

(assert (=> b!1420953 m!1311497))

(assert (=> b!1420953 m!1311497))

(assert (=> b!1420953 m!1311493))

(declare-fun m!1311499 () Bool)

(assert (=> b!1420953 m!1311499))

(declare-fun m!1311501 () Bool)

(assert (=> b!1420959 m!1311501))

(assert (=> b!1420959 m!1311501))

(declare-fun m!1311503 () Bool)

(assert (=> b!1420959 m!1311503))

(declare-fun m!1311505 () Bool)

(assert (=> b!1420959 m!1311505))

(declare-fun m!1311507 () Bool)

(assert (=> b!1420959 m!1311507))

(declare-fun m!1311509 () Bool)

(assert (=> b!1420957 m!1311509))

(assert (=> b!1420957 m!1311509))

(declare-fun m!1311511 () Bool)

(assert (=> b!1420957 m!1311511))

(declare-fun m!1311513 () Bool)

(assert (=> b!1420954 m!1311513))

(declare-fun m!1311515 () Bool)

(assert (=> b!1420962 m!1311515))

(assert (=> b!1420960 m!1311493))

(assert (=> b!1420960 m!1311493))

(declare-fun m!1311517 () Bool)

(assert (=> b!1420960 m!1311517))

(declare-fun m!1311519 () Bool)

(assert (=> start!122666 m!1311519))

(declare-fun m!1311521 () Bool)

(assert (=> start!122666 m!1311521))

(check-sat (not b!1420957) (not b!1420954) (not b!1420953) (not b!1420959) (not b!1420960) (not b!1420961) (not b!1420962) (not b!1420955) (not start!122666))
