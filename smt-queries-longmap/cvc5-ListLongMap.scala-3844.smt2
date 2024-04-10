; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52874 () Bool)

(assert start!52874)

(declare-fun res!364602 () Bool)

(declare-fun e!331611 () Bool)

(assert (=> start!52874 (=> (not res!364602) (not e!331611))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52874 (= res!364602 (validMask!0 mask!3119))))

(assert (=> start!52874 e!331611))

(assert (=> start!52874 true))

(declare-datatypes ((array!35962 0))(
  ( (array!35963 (arr!17262 (Array (_ BitVec 32) (_ BitVec 64))) (size!17626 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35962)

(declare-fun array_inv!13058 (array!35962) Bool)

(assert (=> start!52874 (array_inv!13058 a!3118)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!576362 () Bool)

(declare-fun e!331609 () Bool)

(declare-datatypes ((SeekEntryResult!5711 0))(
  ( (MissingZero!5711 (index!25071 (_ BitVec 32))) (Found!5711 (index!25072 (_ BitVec 32))) (Intermediate!5711 (undefined!6523 Bool) (index!25073 (_ BitVec 32)) (x!53966 (_ BitVec 32))) (Undefined!5711) (MissingVacant!5711 (index!25074 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35962 (_ BitVec 32)) SeekEntryResult!5711)

(assert (=> b!576362 (= e!331609 (= (seekEntryOrOpen!0 (select (arr!17262 a!3118) j!142) a!3118 mask!3119) (Found!5711 j!142)))))

(declare-fun b!576363 () Bool)

(declare-fun res!364601 () Bool)

(declare-fun e!331610 () Bool)

(assert (=> b!576363 (=> (not res!364601) (not e!331610))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35962 (_ BitVec 32)) SeekEntryResult!5711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576363 (= res!364601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17262 a!3118) j!142) mask!3119) (select (arr!17262 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17262 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17262 a!3118) i!1132 k!1914) j!142) (array!35963 (store (arr!17262 a!3118) i!1132 k!1914) (size!17626 a!3118)) mask!3119)))))

(declare-fun b!576364 () Bool)

(declare-fun res!364598 () Bool)

(assert (=> b!576364 (=> (not res!364598) (not e!331611))))

(assert (=> b!576364 (= res!364598 (and (= (size!17626 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17626 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17626 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576365 () Bool)

(declare-fun res!364597 () Bool)

(assert (=> b!576365 (=> (not res!364597) (not e!331611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576365 (= res!364597 (validKeyInArray!0 k!1914))))

(declare-fun b!576366 () Bool)

(assert (=> b!576366 (= e!331610 (not true))))

(assert (=> b!576366 e!331609))

(declare-fun res!364595 () Bool)

(assert (=> b!576366 (=> (not res!364595) (not e!331609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35962 (_ BitVec 32)) Bool)

(assert (=> b!576366 (= res!364595 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18124 0))(
  ( (Unit!18125) )
))
(declare-fun lt!263646 () Unit!18124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18124)

(assert (=> b!576366 (= lt!263646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576367 () Bool)

(declare-fun res!364600 () Bool)

(assert (=> b!576367 (=> (not res!364600) (not e!331611))))

(assert (=> b!576367 (= res!364600 (validKeyInArray!0 (select (arr!17262 a!3118) j!142)))))

(declare-fun b!576368 () Bool)

(assert (=> b!576368 (= e!331611 e!331610)))

(declare-fun res!364599 () Bool)

(assert (=> b!576368 (=> (not res!364599) (not e!331610))))

(declare-fun lt!263647 () SeekEntryResult!5711)

(assert (=> b!576368 (= res!364599 (or (= lt!263647 (MissingZero!5711 i!1132)) (= lt!263647 (MissingVacant!5711 i!1132))))))

(assert (=> b!576368 (= lt!263647 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!576369 () Bool)

(declare-fun res!364604 () Bool)

(assert (=> b!576369 (=> (not res!364604) (not e!331611))))

(declare-fun arrayContainsKey!0 (array!35962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576369 (= res!364604 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576370 () Bool)

(declare-fun res!364596 () Bool)

(assert (=> b!576370 (=> (not res!364596) (not e!331610))))

(assert (=> b!576370 (= res!364596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576371 () Bool)

(declare-fun res!364603 () Bool)

(assert (=> b!576371 (=> (not res!364603) (not e!331610))))

(declare-datatypes ((List!11342 0))(
  ( (Nil!11339) (Cons!11338 (h!12380 (_ BitVec 64)) (t!17570 List!11342)) )
))
(declare-fun arrayNoDuplicates!0 (array!35962 (_ BitVec 32) List!11342) Bool)

(assert (=> b!576371 (= res!364603 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11339))))

(assert (= (and start!52874 res!364602) b!576364))

(assert (= (and b!576364 res!364598) b!576367))

(assert (= (and b!576367 res!364600) b!576365))

(assert (= (and b!576365 res!364597) b!576369))

(assert (= (and b!576369 res!364604) b!576368))

(assert (= (and b!576368 res!364599) b!576370))

(assert (= (and b!576370 res!364596) b!576371))

(assert (= (and b!576371 res!364603) b!576363))

(assert (= (and b!576363 res!364601) b!576366))

(assert (= (and b!576366 res!364595) b!576362))

(declare-fun m!555309 () Bool)

(assert (=> b!576363 m!555309))

(declare-fun m!555311 () Bool)

(assert (=> b!576363 m!555311))

(assert (=> b!576363 m!555309))

(declare-fun m!555313 () Bool)

(assert (=> b!576363 m!555313))

(declare-fun m!555315 () Bool)

(assert (=> b!576363 m!555315))

(assert (=> b!576363 m!555313))

(declare-fun m!555317 () Bool)

(assert (=> b!576363 m!555317))

(assert (=> b!576363 m!555311))

(assert (=> b!576363 m!555309))

(declare-fun m!555319 () Bool)

(assert (=> b!576363 m!555319))

(declare-fun m!555321 () Bool)

(assert (=> b!576363 m!555321))

(assert (=> b!576363 m!555313))

(assert (=> b!576363 m!555315))

(declare-fun m!555323 () Bool)

(assert (=> b!576371 m!555323))

(assert (=> b!576362 m!555309))

(assert (=> b!576362 m!555309))

(declare-fun m!555325 () Bool)

(assert (=> b!576362 m!555325))

(declare-fun m!555327 () Bool)

(assert (=> b!576366 m!555327))

(declare-fun m!555329 () Bool)

(assert (=> b!576366 m!555329))

(declare-fun m!555331 () Bool)

(assert (=> start!52874 m!555331))

(declare-fun m!555333 () Bool)

(assert (=> start!52874 m!555333))

(assert (=> b!576367 m!555309))

(assert (=> b!576367 m!555309))

(declare-fun m!555335 () Bool)

(assert (=> b!576367 m!555335))

(declare-fun m!555337 () Bool)

(assert (=> b!576365 m!555337))

(declare-fun m!555339 () Bool)

(assert (=> b!576368 m!555339))

(declare-fun m!555341 () Bool)

(assert (=> b!576370 m!555341))

(declare-fun m!555343 () Bool)

(assert (=> b!576369 m!555343))

(push 1)

