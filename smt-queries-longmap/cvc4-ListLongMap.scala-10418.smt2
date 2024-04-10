; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122674 () Bool)

(assert start!122674)

(declare-fun b!1421073 () Bool)

(declare-fun res!956512 () Bool)

(declare-fun e!803613 () Bool)

(assert (=> b!1421073 (=> (not res!956512) (not e!803613))))

(declare-datatypes ((array!97039 0))(
  ( (array!97040 (arr!46837 (Array (_ BitVec 32) (_ BitVec 64))) (size!47387 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97039)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97039 (_ BitVec 32)) Bool)

(assert (=> b!1421073 (= res!956512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421074 () Bool)

(declare-fun res!956510 () Bool)

(assert (=> b!1421074 (=> (not res!956510) (not e!803613))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421074 (= res!956510 (validKeyInArray!0 (select (arr!46837 a!2831) i!982)))))

(declare-fun b!1421075 () Bool)

(declare-fun res!956515 () Bool)

(assert (=> b!1421075 (=> (not res!956515) (not e!803613))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1421075 (= res!956515 (validKeyInArray!0 (select (arr!46837 a!2831) j!81)))))

(declare-fun b!1421076 () Bool)

(declare-fun res!956507 () Bool)

(assert (=> b!1421076 (=> (not res!956507) (not e!803613))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421076 (= res!956507 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47387 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47387 a!2831))))))

(declare-fun res!956509 () Bool)

(assert (=> start!122674 (=> (not res!956509) (not e!803613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122674 (= res!956509 (validMask!0 mask!2608))))

(assert (=> start!122674 e!803613))

(assert (=> start!122674 true))

(declare-fun array_inv!35865 (array!97039) Bool)

(assert (=> start!122674 (array_inv!35865 a!2831)))

(declare-fun b!1421077 () Bool)

(declare-fun e!803614 () Bool)

(declare-fun e!803612 () Bool)

(assert (=> b!1421077 (= e!803614 e!803612)))

(declare-fun res!956513 () Bool)

(assert (=> b!1421077 (=> (not res!956513) (not e!803612))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!626114 () array!97039)

(declare-fun lt!626115 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11122 0))(
  ( (MissingZero!11122 (index!46880 (_ BitVec 32))) (Found!11122 (index!46881 (_ BitVec 32))) (Intermediate!11122 (undefined!11934 Bool) (index!46882 (_ BitVec 32)) (x!128532 (_ BitVec 32))) (Undefined!11122) (MissingVacant!11122 (index!46883 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97039 (_ BitVec 32)) SeekEntryResult!11122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421077 (= res!956513 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626115 mask!2608) lt!626115 lt!626114 mask!2608) (Intermediate!11122 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1421077 (= lt!626115 (select (store (arr!46837 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421077 (= lt!626114 (array!97040 (store (arr!46837 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47387 a!2831)))))

(declare-fun b!1421078 () Bool)

(assert (=> b!1421078 (= e!803613 e!803614)))

(declare-fun res!956508 () Bool)

(assert (=> b!1421078 (=> (not res!956508) (not e!803614))))

(declare-fun lt!626113 () SeekEntryResult!11122)

(assert (=> b!1421078 (= res!956508 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46837 a!2831) j!81) mask!2608) (select (arr!46837 a!2831) j!81) a!2831 mask!2608) lt!626113))))

(assert (=> b!1421078 (= lt!626113 (Intermediate!11122 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421079 () Bool)

(declare-fun res!956511 () Bool)

(assert (=> b!1421079 (=> (not res!956511) (not e!803612))))

(assert (=> b!1421079 (= res!956511 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46837 a!2831) j!81) a!2831 mask!2608) lt!626113))))

(declare-fun b!1421080 () Bool)

(declare-fun res!956506 () Bool)

(assert (=> b!1421080 (=> (not res!956506) (not e!803613))))

(assert (=> b!1421080 (= res!956506 (and (= (size!47387 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47387 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47387 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421081 () Bool)

(declare-fun res!956514 () Bool)

(assert (=> b!1421081 (=> (not res!956514) (not e!803613))))

(declare-datatypes ((List!33347 0))(
  ( (Nil!33344) (Cons!33343 (h!34645 (_ BitVec 64)) (t!48041 List!33347)) )
))
(declare-fun arrayNoDuplicates!0 (array!97039 (_ BitVec 32) List!33347) Bool)

(assert (=> b!1421081 (= res!956514 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33344))))

(declare-fun b!1421082 () Bool)

(assert (=> b!1421082 (= e!803612 false)))

(declare-fun lt!626112 () SeekEntryResult!11122)

(assert (=> b!1421082 (= lt!626112 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626115 lt!626114 mask!2608))))

(assert (= (and start!122674 res!956509) b!1421080))

(assert (= (and b!1421080 res!956506) b!1421074))

(assert (= (and b!1421074 res!956510) b!1421075))

(assert (= (and b!1421075 res!956515) b!1421073))

(assert (= (and b!1421073 res!956512) b!1421081))

(assert (= (and b!1421081 res!956514) b!1421076))

(assert (= (and b!1421076 res!956507) b!1421078))

(assert (= (and b!1421078 res!956508) b!1421077))

(assert (= (and b!1421077 res!956513) b!1421079))

(assert (= (and b!1421079 res!956511) b!1421082))

(declare-fun m!1311619 () Bool)

(assert (=> b!1421074 m!1311619))

(assert (=> b!1421074 m!1311619))

(declare-fun m!1311621 () Bool)

(assert (=> b!1421074 m!1311621))

(declare-fun m!1311623 () Bool)

(assert (=> b!1421081 m!1311623))

(declare-fun m!1311625 () Bool)

(assert (=> b!1421077 m!1311625))

(assert (=> b!1421077 m!1311625))

(declare-fun m!1311627 () Bool)

(assert (=> b!1421077 m!1311627))

(declare-fun m!1311629 () Bool)

(assert (=> b!1421077 m!1311629))

(declare-fun m!1311631 () Bool)

(assert (=> b!1421077 m!1311631))

(declare-fun m!1311633 () Bool)

(assert (=> b!1421075 m!1311633))

(assert (=> b!1421075 m!1311633))

(declare-fun m!1311635 () Bool)

(assert (=> b!1421075 m!1311635))

(declare-fun m!1311637 () Bool)

(assert (=> start!122674 m!1311637))

(declare-fun m!1311639 () Bool)

(assert (=> start!122674 m!1311639))

(assert (=> b!1421078 m!1311633))

(assert (=> b!1421078 m!1311633))

(declare-fun m!1311641 () Bool)

(assert (=> b!1421078 m!1311641))

(assert (=> b!1421078 m!1311641))

(assert (=> b!1421078 m!1311633))

(declare-fun m!1311643 () Bool)

(assert (=> b!1421078 m!1311643))

(assert (=> b!1421079 m!1311633))

(assert (=> b!1421079 m!1311633))

(declare-fun m!1311645 () Bool)

(assert (=> b!1421079 m!1311645))

(declare-fun m!1311647 () Bool)

(assert (=> b!1421082 m!1311647))

(declare-fun m!1311649 () Bool)

(assert (=> b!1421073 m!1311649))

(push 1)

(assert (not b!1421081))

(assert (not b!1421078))

