; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131188 () Bool)

(assert start!131188)

(declare-fun b!1539036 () Bool)

(declare-fun res!1056015 () Bool)

(declare-fun e!856128 () Bool)

(assert (=> b!1539036 (=> (not res!1056015) (not e!856128))))

(declare-datatypes ((array!102253 0))(
  ( (array!102254 (arr!49341 (Array (_ BitVec 32) (_ BitVec 64))) (size!49891 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102253)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539036 (= res!1056015 (not (= (select (arr!49341 a!2792) index!463) (select (arr!49341 a!2792) j!64))))))

(declare-fun b!1539037 () Bool)

(declare-fun res!1056021 () Bool)

(assert (=> b!1539037 (=> (not res!1056021) (not e!856128))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1539037 (= res!1056021 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49891 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49891 a!2792)) (= (select (arr!49341 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539038 () Bool)

(declare-fun res!1056020 () Bool)

(assert (=> b!1539038 (=> (not res!1056020) (not e!856128))))

(declare-datatypes ((List!35815 0))(
  ( (Nil!35812) (Cons!35811 (h!37256 (_ BitVec 64)) (t!50509 List!35815)) )
))
(declare-fun arrayNoDuplicates!0 (array!102253 (_ BitVec 32) List!35815) Bool)

(assert (=> b!1539038 (= res!1056020 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35812))))

(declare-fun b!1539039 () Bool)

(declare-fun res!1056016 () Bool)

(assert (=> b!1539039 (=> (not res!1056016) (not e!856128))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102253 (_ BitVec 32)) Bool)

(assert (=> b!1539039 (= res!1056016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539040 () Bool)

(declare-fun res!1056019 () Bool)

(assert (=> b!1539040 (=> (not res!1056019) (not e!856128))))

(declare-datatypes ((SeekEntryResult!13467 0))(
  ( (MissingZero!13467 (index!56263 (_ BitVec 32))) (Found!13467 (index!56264 (_ BitVec 32))) (Intermediate!13467 (undefined!14279 Bool) (index!56265 (_ BitVec 32)) (x!137992 (_ BitVec 32))) (Undefined!13467) (MissingVacant!13467 (index!56266 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102253 (_ BitVec 32)) SeekEntryResult!13467)

(assert (=> b!1539040 (= res!1056019 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49341 a!2792) j!64) a!2792 mask!2480) (Found!13467 j!64)))))

(declare-fun b!1539041 () Bool)

(assert (=> b!1539041 (= e!856128 false)))

(declare-fun lt!664966 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539041 (= lt!664966 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1056014 () Bool)

(assert (=> start!131188 (=> (not res!1056014) (not e!856128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131188 (= res!1056014 (validMask!0 mask!2480))))

(assert (=> start!131188 e!856128))

(assert (=> start!131188 true))

(declare-fun array_inv!38369 (array!102253) Bool)

(assert (=> start!131188 (array_inv!38369 a!2792)))

(declare-fun b!1539042 () Bool)

(declare-fun res!1056022 () Bool)

(assert (=> b!1539042 (=> (not res!1056022) (not e!856128))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539042 (= res!1056022 (and (= (size!49891 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49891 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49891 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539043 () Bool)

(declare-fun res!1056017 () Bool)

(assert (=> b!1539043 (=> (not res!1056017) (not e!856128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539043 (= res!1056017 (validKeyInArray!0 (select (arr!49341 a!2792) i!951)))))

(declare-fun b!1539044 () Bool)

(declare-fun res!1056018 () Bool)

(assert (=> b!1539044 (=> (not res!1056018) (not e!856128))))

(assert (=> b!1539044 (= res!1056018 (validKeyInArray!0 (select (arr!49341 a!2792) j!64)))))

(assert (= (and start!131188 res!1056014) b!1539042))

(assert (= (and b!1539042 res!1056022) b!1539043))

(assert (= (and b!1539043 res!1056017) b!1539044))

(assert (= (and b!1539044 res!1056018) b!1539039))

(assert (= (and b!1539039 res!1056016) b!1539038))

(assert (= (and b!1539038 res!1056020) b!1539037))

(assert (= (and b!1539037 res!1056021) b!1539040))

(assert (= (and b!1539040 res!1056019) b!1539036))

(assert (= (and b!1539036 res!1056015) b!1539041))

(declare-fun m!1421403 () Bool)

(assert (=> b!1539044 m!1421403))

(assert (=> b!1539044 m!1421403))

(declare-fun m!1421405 () Bool)

(assert (=> b!1539044 m!1421405))

(declare-fun m!1421407 () Bool)

(assert (=> b!1539043 m!1421407))

(assert (=> b!1539043 m!1421407))

(declare-fun m!1421409 () Bool)

(assert (=> b!1539043 m!1421409))

(declare-fun m!1421411 () Bool)

(assert (=> b!1539041 m!1421411))

(assert (=> b!1539040 m!1421403))

(assert (=> b!1539040 m!1421403))

(declare-fun m!1421413 () Bool)

(assert (=> b!1539040 m!1421413))

(declare-fun m!1421415 () Bool)

(assert (=> start!131188 m!1421415))

(declare-fun m!1421417 () Bool)

(assert (=> start!131188 m!1421417))

(declare-fun m!1421419 () Bool)

(assert (=> b!1539038 m!1421419))

(declare-fun m!1421421 () Bool)

(assert (=> b!1539037 m!1421421))

(declare-fun m!1421423 () Bool)

(assert (=> b!1539036 m!1421423))

(assert (=> b!1539036 m!1421403))

(declare-fun m!1421425 () Bool)

(assert (=> b!1539039 m!1421425))

(check-sat (not start!131188) (not b!1539038) (not b!1539044) (not b!1539040) (not b!1539043) (not b!1539041) (not b!1539039))
