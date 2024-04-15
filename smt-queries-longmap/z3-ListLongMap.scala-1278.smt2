; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26228 () Bool)

(assert start!26228)

(declare-fun b!271187 () Bool)

(declare-fun res!135233 () Bool)

(declare-fun e!174431 () Bool)

(assert (=> b!271187 (=> (not res!135233) (not e!174431))))

(declare-datatypes ((List!4087 0))(
  ( (Nil!4084) (Cons!4083 (h!4750 (_ BitVec 64)) (t!9160 List!4087)) )
))
(declare-fun contains!1925 (List!4087 (_ BitVec 64)) Bool)

(assert (=> b!271187 (= res!135233 (not (contains!1925 Nil!4084 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271188 () Bool)

(declare-fun res!135234 () Bool)

(assert (=> b!271188 (=> (not res!135234) (not e!174431))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271188 (= res!135234 (not (= startIndex!26 i!1267)))))

(declare-fun b!271189 () Bool)

(declare-fun e!174432 () Bool)

(assert (=> b!271189 (= e!174432 e!174431)))

(declare-fun res!135231 () Bool)

(assert (=> b!271189 (=> (not res!135231) (not e!174431))))

(declare-datatypes ((SeekEntryResult!1463 0))(
  ( (MissingZero!1463 (index!8022 (_ BitVec 32))) (Found!1463 (index!8023 (_ BitVec 32))) (Intermediate!1463 (undefined!2275 Bool) (index!8024 (_ BitVec 32)) (x!26371 (_ BitVec 32))) (Undefined!1463) (MissingVacant!1463 (index!8025 (_ BitVec 32))) )
))
(declare-fun lt!135606 () SeekEntryResult!1463)

(assert (=> b!271189 (= res!135231 (or (= lt!135606 (MissingZero!1463 i!1267)) (= lt!135606 (MissingVacant!1463 i!1267))))))

(declare-datatypes ((array!13314 0))(
  ( (array!13315 (arr!6306 (Array (_ BitVec 32) (_ BitVec 64))) (size!6659 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13314)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13314 (_ BitVec 32)) SeekEntryResult!1463)

(assert (=> b!271189 (= lt!135606 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271190 () Bool)

(declare-fun res!135229 () Bool)

(assert (=> b!271190 (=> (not res!135229) (not e!174432))))

(assert (=> b!271190 (= res!135229 (and (= (size!6659 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6659 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6659 a!3325))))))

(declare-fun b!271191 () Bool)

(declare-fun res!135236 () Bool)

(assert (=> b!271191 (=> (not res!135236) (not e!174432))))

(declare-fun arrayNoDuplicates!0 (array!13314 (_ BitVec 32) List!4087) Bool)

(assert (=> b!271191 (= res!135236 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4084))))

(declare-fun b!271192 () Bool)

(declare-fun res!135235 () Bool)

(assert (=> b!271192 (=> (not res!135235) (not e!174432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271192 (= res!135235 (validKeyInArray!0 k0!2581))))

(declare-fun b!271193 () Bool)

(declare-fun res!135230 () Bool)

(assert (=> b!271193 (=> (not res!135230) (not e!174431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13314 (_ BitVec 32)) Bool)

(assert (=> b!271193 (= res!135230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271194 () Bool)

(declare-fun res!135240 () Bool)

(assert (=> b!271194 (=> (not res!135240) (not e!174431))))

(declare-fun noDuplicate!139 (List!4087) Bool)

(assert (=> b!271194 (= res!135240 (noDuplicate!139 Nil!4084))))

(declare-fun b!271195 () Bool)

(declare-fun res!135232 () Bool)

(assert (=> b!271195 (=> (not res!135232) (not e!174431))))

(assert (=> b!271195 (= res!135232 (not (contains!1925 Nil!4084 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271196 () Bool)

(declare-fun res!135238 () Bool)

(assert (=> b!271196 (=> (not res!135238) (not e!174432))))

(declare-fun arrayContainsKey!0 (array!13314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271196 (= res!135238 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271197 () Bool)

(declare-fun res!135241 () Bool)

(assert (=> b!271197 (=> (not res!135241) (not e!174431))))

(assert (=> b!271197 (= res!135241 (validKeyInArray!0 (select (arr!6306 a!3325) startIndex!26)))))

(declare-fun b!271198 () Bool)

(declare-fun res!135239 () Bool)

(assert (=> b!271198 (=> (not res!135239) (not e!174431))))

(assert (=> b!271198 (= res!135239 (and (bvslt (size!6659 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6659 a!3325))))))

(declare-fun b!271199 () Bool)

(assert (=> b!271199 (= e!174431 false)))

(declare-fun lt!135605 () Bool)

(assert (=> b!271199 (= lt!135605 (contains!1925 Nil!4084 k0!2581))))

(declare-fun res!135237 () Bool)

(assert (=> start!26228 (=> (not res!135237) (not e!174432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26228 (= res!135237 (validMask!0 mask!3868))))

(assert (=> start!26228 e!174432))

(declare-fun array_inv!4278 (array!13314) Bool)

(assert (=> start!26228 (array_inv!4278 a!3325)))

(assert (=> start!26228 true))

(assert (= (and start!26228 res!135237) b!271190))

(assert (= (and b!271190 res!135229) b!271192))

(assert (= (and b!271192 res!135235) b!271191))

(assert (= (and b!271191 res!135236) b!271196))

(assert (= (and b!271196 res!135238) b!271189))

(assert (= (and b!271189 res!135231) b!271193))

(assert (= (and b!271193 res!135230) b!271188))

(assert (= (and b!271188 res!135234) b!271197))

(assert (= (and b!271197 res!135241) b!271198))

(assert (= (and b!271198 res!135239) b!271194))

(assert (= (and b!271194 res!135240) b!271195))

(assert (= (and b!271195 res!135232) b!271187))

(assert (= (and b!271187 res!135233) b!271199))

(declare-fun m!286061 () Bool)

(assert (=> b!271193 m!286061))

(declare-fun m!286063 () Bool)

(assert (=> b!271196 m!286063))

(declare-fun m!286065 () Bool)

(assert (=> b!271197 m!286065))

(assert (=> b!271197 m!286065))

(declare-fun m!286067 () Bool)

(assert (=> b!271197 m!286067))

(declare-fun m!286069 () Bool)

(assert (=> b!271192 m!286069))

(declare-fun m!286071 () Bool)

(assert (=> start!26228 m!286071))

(declare-fun m!286073 () Bool)

(assert (=> start!26228 m!286073))

(declare-fun m!286075 () Bool)

(assert (=> b!271199 m!286075))

(declare-fun m!286077 () Bool)

(assert (=> b!271194 m!286077))

(declare-fun m!286079 () Bool)

(assert (=> b!271191 m!286079))

(declare-fun m!286081 () Bool)

(assert (=> b!271195 m!286081))

(declare-fun m!286083 () Bool)

(assert (=> b!271189 m!286083))

(declare-fun m!286085 () Bool)

(assert (=> b!271187 m!286085))

(check-sat (not b!271192) (not b!271195) (not start!26228) (not b!271187) (not b!271193) (not b!271194) (not b!271197) (not b!271191) (not b!271199) (not b!271189) (not b!271196))
(check-sat)
