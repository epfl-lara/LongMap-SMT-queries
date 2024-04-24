; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122754 () Bool)

(assert start!122754)

(declare-fun b!1420712 () Bool)

(declare-fun res!955466 () Bool)

(declare-fun e!803903 () Bool)

(assert (=> b!1420712 (=> (not res!955466) (not e!803903))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97041 0))(
  ( (array!97042 (arr!46836 (Array (_ BitVec 32) (_ BitVec 64))) (size!47387 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97041)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420712 (= res!955466 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47387 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47387 a!2831))))))

(declare-fun b!1420713 () Bool)

(declare-fun res!955463 () Bool)

(assert (=> b!1420713 (=> (not res!955463) (not e!803903))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420713 (= res!955463 (validKeyInArray!0 (select (arr!46836 a!2831) i!982)))))

(declare-fun b!1420714 () Bool)

(declare-fun res!955465 () Bool)

(assert (=> b!1420714 (=> (not res!955465) (not e!803903))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11023 0))(
  ( (MissingZero!11023 (index!46484 (_ BitVec 32))) (Found!11023 (index!46485 (_ BitVec 32))) (Intermediate!11023 (undefined!11835 Bool) (index!46486 (_ BitVec 32)) (x!128308 (_ BitVec 32))) (Undefined!11023) (MissingVacant!11023 (index!46487 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97041 (_ BitVec 32)) SeekEntryResult!11023)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420714 (= res!955465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46836 a!2831) j!81) mask!2608) (select (arr!46836 a!2831) j!81) a!2831 mask!2608) (Intermediate!11023 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420715 () Bool)

(declare-fun res!955464 () Bool)

(assert (=> b!1420715 (=> (not res!955464) (not e!803903))))

(assert (=> b!1420715 (= res!955464 (and (= (size!47387 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47387 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47387 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420716 () Bool)

(declare-fun res!955461 () Bool)

(assert (=> b!1420716 (=> (not res!955461) (not e!803903))))

(declare-datatypes ((List!33333 0))(
  ( (Nil!33330) (Cons!33329 (h!34639 (_ BitVec 64)) (t!48019 List!33333)) )
))
(declare-fun arrayNoDuplicates!0 (array!97041 (_ BitVec 32) List!33333) Bool)

(assert (=> b!1420716 (= res!955461 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33330))))

(declare-fun b!1420717 () Bool)

(assert (=> b!1420717 (= e!803903 false)))

(declare-fun lt!626234 () (_ BitVec 32))

(assert (=> b!1420717 (= lt!626234 (toIndex!0 (select (store (arr!46836 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1420718 () Bool)

(declare-fun res!955467 () Bool)

(assert (=> b!1420718 (=> (not res!955467) (not e!803903))))

(assert (=> b!1420718 (= res!955467 (validKeyInArray!0 (select (arr!46836 a!2831) j!81)))))

(declare-fun b!1420719 () Bool)

(declare-fun res!955462 () Bool)

(assert (=> b!1420719 (=> (not res!955462) (not e!803903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97041 (_ BitVec 32)) Bool)

(assert (=> b!1420719 (= res!955462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!955468 () Bool)

(assert (=> start!122754 (=> (not res!955468) (not e!803903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122754 (= res!955468 (validMask!0 mask!2608))))

(assert (=> start!122754 e!803903))

(assert (=> start!122754 true))

(declare-fun array_inv!36117 (array!97041) Bool)

(assert (=> start!122754 (array_inv!36117 a!2831)))

(assert (= (and start!122754 res!955468) b!1420715))

(assert (= (and b!1420715 res!955464) b!1420713))

(assert (= (and b!1420713 res!955463) b!1420718))

(assert (= (and b!1420718 res!955467) b!1420719))

(assert (= (and b!1420719 res!955462) b!1420716))

(assert (= (and b!1420716 res!955461) b!1420712))

(assert (= (and b!1420712 res!955466) b!1420714))

(assert (= (and b!1420714 res!955465) b!1420717))

(declare-fun m!1311379 () Bool)

(assert (=> b!1420718 m!1311379))

(assert (=> b!1420718 m!1311379))

(declare-fun m!1311381 () Bool)

(assert (=> b!1420718 m!1311381))

(declare-fun m!1311383 () Bool)

(assert (=> b!1420717 m!1311383))

(declare-fun m!1311385 () Bool)

(assert (=> b!1420717 m!1311385))

(assert (=> b!1420717 m!1311385))

(declare-fun m!1311387 () Bool)

(assert (=> b!1420717 m!1311387))

(declare-fun m!1311389 () Bool)

(assert (=> start!122754 m!1311389))

(declare-fun m!1311391 () Bool)

(assert (=> start!122754 m!1311391))

(declare-fun m!1311393 () Bool)

(assert (=> b!1420713 m!1311393))

(assert (=> b!1420713 m!1311393))

(declare-fun m!1311395 () Bool)

(assert (=> b!1420713 m!1311395))

(assert (=> b!1420714 m!1311379))

(assert (=> b!1420714 m!1311379))

(declare-fun m!1311397 () Bool)

(assert (=> b!1420714 m!1311397))

(assert (=> b!1420714 m!1311397))

(assert (=> b!1420714 m!1311379))

(declare-fun m!1311399 () Bool)

(assert (=> b!1420714 m!1311399))

(declare-fun m!1311401 () Bool)

(assert (=> b!1420719 m!1311401))

(declare-fun m!1311403 () Bool)

(assert (=> b!1420716 m!1311403))

(push 1)

(assert (not b!1420714))

(assert (not b!1420719))

(assert (not b!1420713))

(assert (not start!122754))

(assert (not b!1420718))

(assert (not b!1420717))

(assert (not b!1420716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

