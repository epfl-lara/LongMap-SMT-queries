; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131186 () Bool)

(assert start!131186)

(declare-fun b!1539009 () Bool)

(declare-fun res!1055990 () Bool)

(declare-fun e!856123 () Bool)

(assert (=> b!1539009 (=> (not res!1055990) (not e!856123))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102251 0))(
  ( (array!102252 (arr!49340 (Array (_ BitVec 32) (_ BitVec 64))) (size!49890 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102251)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13466 0))(
  ( (MissingZero!13466 (index!56259 (_ BitVec 32))) (Found!13466 (index!56260 (_ BitVec 32))) (Intermediate!13466 (undefined!14278 Bool) (index!56261 (_ BitVec 32)) (x!137991 (_ BitVec 32))) (Undefined!13466) (MissingVacant!13466 (index!56262 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102251 (_ BitVec 32)) SeekEntryResult!13466)

(assert (=> b!1539009 (= res!1055990 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49340 a!2792) j!64) a!2792 mask!2480) (Found!13466 j!64)))))

(declare-fun b!1539010 () Bool)

(assert (=> b!1539010 (= e!856123 false)))

(declare-fun lt!664963 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539010 (= lt!664963 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539011 () Bool)

(declare-fun res!1055995 () Bool)

(assert (=> b!1539011 (=> (not res!1055995) (not e!856123))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539011 (= res!1055995 (and (= (size!49890 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49890 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49890 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539012 () Bool)

(declare-fun res!1055988 () Bool)

(assert (=> b!1539012 (=> (not res!1055988) (not e!856123))))

(assert (=> b!1539012 (= res!1055988 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49890 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49890 a!2792)) (= (select (arr!49340 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539013 () Bool)

(declare-fun res!1055992 () Bool)

(assert (=> b!1539013 (=> (not res!1055992) (not e!856123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539013 (= res!1055992 (validKeyInArray!0 (select (arr!49340 a!2792) i!951)))))

(declare-fun b!1539014 () Bool)

(declare-fun res!1055993 () Bool)

(assert (=> b!1539014 (=> (not res!1055993) (not e!856123))))

(declare-datatypes ((List!35814 0))(
  ( (Nil!35811) (Cons!35810 (h!37255 (_ BitVec 64)) (t!50508 List!35814)) )
))
(declare-fun arrayNoDuplicates!0 (array!102251 (_ BitVec 32) List!35814) Bool)

(assert (=> b!1539014 (= res!1055993 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35811))))

(declare-fun b!1539015 () Bool)

(declare-fun res!1055989 () Bool)

(assert (=> b!1539015 (=> (not res!1055989) (not e!856123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102251 (_ BitVec 32)) Bool)

(assert (=> b!1539015 (= res!1055989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539016 () Bool)

(declare-fun res!1055987 () Bool)

(assert (=> b!1539016 (=> (not res!1055987) (not e!856123))))

(assert (=> b!1539016 (= res!1055987 (not (= (select (arr!49340 a!2792) index!463) (select (arr!49340 a!2792) j!64))))))

(declare-fun b!1539017 () Bool)

(declare-fun res!1055991 () Bool)

(assert (=> b!1539017 (=> (not res!1055991) (not e!856123))))

(assert (=> b!1539017 (= res!1055991 (validKeyInArray!0 (select (arr!49340 a!2792) j!64)))))

(declare-fun res!1055994 () Bool)

(assert (=> start!131186 (=> (not res!1055994) (not e!856123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131186 (= res!1055994 (validMask!0 mask!2480))))

(assert (=> start!131186 e!856123))

(assert (=> start!131186 true))

(declare-fun array_inv!38368 (array!102251) Bool)

(assert (=> start!131186 (array_inv!38368 a!2792)))

(assert (= (and start!131186 res!1055994) b!1539011))

(assert (= (and b!1539011 res!1055995) b!1539013))

(assert (= (and b!1539013 res!1055992) b!1539017))

(assert (= (and b!1539017 res!1055991) b!1539015))

(assert (= (and b!1539015 res!1055989) b!1539014))

(assert (= (and b!1539014 res!1055993) b!1539012))

(assert (= (and b!1539012 res!1055988) b!1539009))

(assert (= (and b!1539009 res!1055990) b!1539016))

(assert (= (and b!1539016 res!1055987) b!1539010))

(declare-fun m!1421379 () Bool)

(assert (=> b!1539017 m!1421379))

(assert (=> b!1539017 m!1421379))

(declare-fun m!1421381 () Bool)

(assert (=> b!1539017 m!1421381))

(declare-fun m!1421383 () Bool)

(assert (=> b!1539013 m!1421383))

(assert (=> b!1539013 m!1421383))

(declare-fun m!1421385 () Bool)

(assert (=> b!1539013 m!1421385))

(declare-fun m!1421387 () Bool)

(assert (=> b!1539010 m!1421387))

(declare-fun m!1421389 () Bool)

(assert (=> b!1539015 m!1421389))

(declare-fun m!1421391 () Bool)

(assert (=> start!131186 m!1421391))

(declare-fun m!1421393 () Bool)

(assert (=> start!131186 m!1421393))

(declare-fun m!1421395 () Bool)

(assert (=> b!1539016 m!1421395))

(assert (=> b!1539016 m!1421379))

(assert (=> b!1539009 m!1421379))

(assert (=> b!1539009 m!1421379))

(declare-fun m!1421397 () Bool)

(assert (=> b!1539009 m!1421397))

(declare-fun m!1421399 () Bool)

(assert (=> b!1539012 m!1421399))

(declare-fun m!1421401 () Bool)

(assert (=> b!1539014 m!1421401))

(push 1)

(assert (not b!1539014))

(assert (not b!1539010))

(assert (not b!1539009))

(assert (not b!1539017))

(assert (not start!131186))

(assert (not b!1539013))

(assert (not b!1539015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

