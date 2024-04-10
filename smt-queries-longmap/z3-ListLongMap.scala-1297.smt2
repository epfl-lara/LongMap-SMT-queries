; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26342 () Bool)

(assert start!26342)

(declare-fun b!273036 () Bool)

(declare-fun res!137030 () Bool)

(declare-fun e!175076 () Bool)

(assert (=> b!273036 (=> (not res!137030) (not e!175076))))

(declare-datatypes ((array!13439 0))(
  ( (array!13440 (arr!6369 (Array (_ BitVec 32) (_ BitVec 64))) (size!6721 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13439)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13439 (_ BitVec 32)) Bool)

(assert (=> b!273036 (= res!137030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273037 () Bool)

(declare-fun res!137027 () Bool)

(declare-fun e!175077 () Bool)

(assert (=> b!273037 (=> (not res!137027) (not e!175077))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273037 (= res!137027 (validKeyInArray!0 k0!2581))))

(declare-fun b!273038 () Bool)

(declare-fun res!137034 () Bool)

(declare-fun e!175079 () Bool)

(assert (=> b!273038 (=> (not res!137034) (not e!175079))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273038 (= res!137034 (validKeyInArray!0 (select (arr!6369 a!3325) startIndex!26)))))

(declare-fun res!137031 () Bool)

(assert (=> start!26342 (=> (not res!137031) (not e!175077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26342 (= res!137031 (validMask!0 mask!3868))))

(assert (=> start!26342 e!175077))

(declare-fun array_inv!4332 (array!13439) Bool)

(assert (=> start!26342 (array_inv!4332 a!3325)))

(assert (=> start!26342 true))

(declare-fun b!273039 () Bool)

(assert (=> b!273039 (= e!175076 e!175079)))

(declare-fun res!137032 () Bool)

(assert (=> b!273039 (=> (not res!137032) (not e!175079))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273039 (= res!137032 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136182 () array!13439)

(assert (=> b!273039 (= lt!136182 (array!13440 (store (arr!6369 a!3325) i!1267 k0!2581) (size!6721 a!3325)))))

(declare-fun b!273040 () Bool)

(declare-fun res!137026 () Bool)

(assert (=> b!273040 (=> (not res!137026) (not e!175077))))

(declare-datatypes ((List!4177 0))(
  ( (Nil!4174) (Cons!4173 (h!4840 (_ BitVec 64)) (t!9259 List!4177)) )
))
(declare-fun arrayNoDuplicates!0 (array!13439 (_ BitVec 32) List!4177) Bool)

(assert (=> b!273040 (= res!137026 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4174))))

(declare-fun b!273041 () Bool)

(assert (=> b!273041 (= e!175079 (not true))))

(declare-datatypes ((SeekEntryResult!1527 0))(
  ( (MissingZero!1527 (index!8278 (_ BitVec 32))) (Found!1527 (index!8279 (_ BitVec 32))) (Intermediate!1527 (undefined!2339 Bool) (index!8280 (_ BitVec 32)) (x!26588 (_ BitVec 32))) (Undefined!1527) (MissingVacant!1527 (index!8281 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13439 (_ BitVec 32)) SeekEntryResult!1527)

(assert (=> b!273041 (= (seekEntryOrOpen!0 (select (arr!6369 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6369 a!3325) i!1267 k0!2581) startIndex!26) lt!136182 mask!3868))))

(declare-datatypes ((Unit!8541 0))(
  ( (Unit!8542) )
))
(declare-fun lt!136183 () Unit!8541)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13439 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8541)

(assert (=> b!273041 (= lt!136183 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273041 (arrayNoDuplicates!0 lt!136182 #b00000000000000000000000000000000 Nil!4174)))

(declare-fun lt!136180 () Unit!8541)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13439 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4177) Unit!8541)

(assert (=> b!273041 (= lt!136180 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4174))))

(declare-fun b!273042 () Bool)

(declare-fun res!137028 () Bool)

(assert (=> b!273042 (=> (not res!137028) (not e!175077))))

(declare-fun arrayContainsKey!0 (array!13439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273042 (= res!137028 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273043 () Bool)

(assert (=> b!273043 (= e!175077 e!175076)))

(declare-fun res!137029 () Bool)

(assert (=> b!273043 (=> (not res!137029) (not e!175076))))

(declare-fun lt!136181 () SeekEntryResult!1527)

(assert (=> b!273043 (= res!137029 (or (= lt!136181 (MissingZero!1527 i!1267)) (= lt!136181 (MissingVacant!1527 i!1267))))))

(assert (=> b!273043 (= lt!136181 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273044 () Bool)

(declare-fun res!137033 () Bool)

(assert (=> b!273044 (=> (not res!137033) (not e!175077))))

(assert (=> b!273044 (= res!137033 (and (= (size!6721 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6721 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6721 a!3325))))))

(assert (= (and start!26342 res!137031) b!273044))

(assert (= (and b!273044 res!137033) b!273037))

(assert (= (and b!273037 res!137027) b!273040))

(assert (= (and b!273040 res!137026) b!273042))

(assert (= (and b!273042 res!137028) b!273043))

(assert (= (and b!273043 res!137029) b!273036))

(assert (= (and b!273036 res!137030) b!273039))

(assert (= (and b!273039 res!137032) b!273038))

(assert (= (and b!273038 res!137034) b!273041))

(declare-fun m!288125 () Bool)

(assert (=> b!273041 m!288125))

(declare-fun m!288127 () Bool)

(assert (=> b!273041 m!288127))

(assert (=> b!273041 m!288127))

(declare-fun m!288129 () Bool)

(assert (=> b!273041 m!288129))

(declare-fun m!288131 () Bool)

(assert (=> b!273041 m!288131))

(declare-fun m!288133 () Bool)

(assert (=> b!273041 m!288133))

(declare-fun m!288135 () Bool)

(assert (=> b!273041 m!288135))

(declare-fun m!288137 () Bool)

(assert (=> b!273041 m!288137))

(assert (=> b!273041 m!288133))

(declare-fun m!288139 () Bool)

(assert (=> b!273041 m!288139))

(assert (=> b!273039 m!288131))

(declare-fun m!288141 () Bool)

(assert (=> b!273036 m!288141))

(declare-fun m!288143 () Bool)

(assert (=> b!273040 m!288143))

(declare-fun m!288145 () Bool)

(assert (=> b!273042 m!288145))

(declare-fun m!288147 () Bool)

(assert (=> b!273043 m!288147))

(declare-fun m!288149 () Bool)

(assert (=> start!26342 m!288149))

(declare-fun m!288151 () Bool)

(assert (=> start!26342 m!288151))

(assert (=> b!273038 m!288133))

(assert (=> b!273038 m!288133))

(declare-fun m!288153 () Bool)

(assert (=> b!273038 m!288153))

(declare-fun m!288155 () Bool)

(assert (=> b!273037 m!288155))

(check-sat (not b!273037) (not b!273041) (not b!273042) (not b!273036) (not start!26342) (not b!273038) (not b!273043) (not b!273040))
(check-sat)
