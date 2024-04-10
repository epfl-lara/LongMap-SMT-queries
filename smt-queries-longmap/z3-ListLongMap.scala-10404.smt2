; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122588 () Bool)

(assert start!122588)

(declare-fun b!1419854 () Bool)

(declare-fun res!955288 () Bool)

(declare-fun e!803239 () Bool)

(assert (=> b!1419854 (=> (not res!955288) (not e!803239))))

(declare-datatypes ((array!96953 0))(
  ( (array!96954 (arr!46794 (Array (_ BitVec 32) (_ BitVec 64))) (size!47344 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96953)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419854 (= res!955288 (validKeyInArray!0 (select (arr!46794 a!2831) j!81)))))

(declare-fun b!1419855 () Bool)

(declare-fun res!955293 () Bool)

(assert (=> b!1419855 (=> (not res!955293) (not e!803239))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11079 0))(
  ( (MissingZero!11079 (index!46708 (_ BitVec 32))) (Found!11079 (index!46709 (_ BitVec 32))) (Intermediate!11079 (undefined!11891 Bool) (index!46710 (_ BitVec 32)) (x!128377 (_ BitVec 32))) (Undefined!11079) (MissingVacant!11079 (index!46711 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96953 (_ BitVec 32)) SeekEntryResult!11079)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419855 (= res!955293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46794 a!2831) j!81) mask!2608) (select (arr!46794 a!2831) j!81) a!2831 mask!2608) (Intermediate!11079 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419856 () Bool)

(declare-fun res!955292 () Bool)

(assert (=> b!1419856 (=> (not res!955292) (not e!803239))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419856 (= res!955292 (validKeyInArray!0 (select (arr!46794 a!2831) i!982)))))

(declare-fun b!1419857 () Bool)

(declare-fun res!955287 () Bool)

(assert (=> b!1419857 (=> (not res!955287) (not e!803239))))

(declare-datatypes ((List!33304 0))(
  ( (Nil!33301) (Cons!33300 (h!34602 (_ BitVec 64)) (t!47998 List!33304)) )
))
(declare-fun arrayNoDuplicates!0 (array!96953 (_ BitVec 32) List!33304) Bool)

(assert (=> b!1419857 (= res!955287 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33301))))

(declare-fun b!1419858 () Bool)

(declare-fun res!955291 () Bool)

(assert (=> b!1419858 (=> (not res!955291) (not e!803239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96953 (_ BitVec 32)) Bool)

(assert (=> b!1419858 (= res!955291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419859 () Bool)

(declare-fun res!955289 () Bool)

(assert (=> b!1419859 (=> (not res!955289) (not e!803239))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419859 (= res!955289 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47344 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47344 a!2831))))))

(declare-fun b!1419860 () Bool)

(assert (=> b!1419860 (= e!803239 false)))

(declare-fun lt!625860 () SeekEntryResult!11079)

(assert (=> b!1419860 (= lt!625860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46794 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46794 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96954 (store (arr!46794 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47344 a!2831)) mask!2608))))

(declare-fun b!1419861 () Bool)

(declare-fun res!955294 () Bool)

(assert (=> b!1419861 (=> (not res!955294) (not e!803239))))

(assert (=> b!1419861 (= res!955294 (and (= (size!47344 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47344 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47344 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!955290 () Bool)

(assert (=> start!122588 (=> (not res!955290) (not e!803239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122588 (= res!955290 (validMask!0 mask!2608))))

(assert (=> start!122588 e!803239))

(assert (=> start!122588 true))

(declare-fun array_inv!35822 (array!96953) Bool)

(assert (=> start!122588 (array_inv!35822 a!2831)))

(assert (= (and start!122588 res!955290) b!1419861))

(assert (= (and b!1419861 res!955294) b!1419856))

(assert (= (and b!1419856 res!955292) b!1419854))

(assert (= (and b!1419854 res!955288) b!1419858))

(assert (= (and b!1419858 res!955291) b!1419857))

(assert (= (and b!1419857 res!955287) b!1419859))

(assert (= (and b!1419859 res!955289) b!1419855))

(assert (= (and b!1419855 res!955293) b!1419860))

(declare-fun m!1310317 () Bool)

(assert (=> start!122588 m!1310317))

(declare-fun m!1310319 () Bool)

(assert (=> start!122588 m!1310319))

(declare-fun m!1310321 () Bool)

(assert (=> b!1419856 m!1310321))

(assert (=> b!1419856 m!1310321))

(declare-fun m!1310323 () Bool)

(assert (=> b!1419856 m!1310323))

(declare-fun m!1310325 () Bool)

(assert (=> b!1419855 m!1310325))

(assert (=> b!1419855 m!1310325))

(declare-fun m!1310327 () Bool)

(assert (=> b!1419855 m!1310327))

(assert (=> b!1419855 m!1310327))

(assert (=> b!1419855 m!1310325))

(declare-fun m!1310329 () Bool)

(assert (=> b!1419855 m!1310329))

(assert (=> b!1419854 m!1310325))

(assert (=> b!1419854 m!1310325))

(declare-fun m!1310331 () Bool)

(assert (=> b!1419854 m!1310331))

(declare-fun m!1310333 () Bool)

(assert (=> b!1419858 m!1310333))

(declare-fun m!1310335 () Bool)

(assert (=> b!1419860 m!1310335))

(declare-fun m!1310337 () Bool)

(assert (=> b!1419860 m!1310337))

(assert (=> b!1419860 m!1310337))

(declare-fun m!1310339 () Bool)

(assert (=> b!1419860 m!1310339))

(assert (=> b!1419860 m!1310339))

(assert (=> b!1419860 m!1310337))

(declare-fun m!1310341 () Bool)

(assert (=> b!1419860 m!1310341))

(declare-fun m!1310343 () Bool)

(assert (=> b!1419857 m!1310343))

(check-sat (not start!122588) (not b!1419856) (not b!1419857) (not b!1419858) (not b!1419860) (not b!1419854) (not b!1419855))
