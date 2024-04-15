; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26234 () Bool)

(assert start!26234)

(declare-fun b!271304 () Bool)

(declare-fun res!135354 () Bool)

(declare-fun e!174457 () Bool)

(assert (=> b!271304 (=> (not res!135354) (not e!174457))))

(declare-datatypes ((List!4090 0))(
  ( (Nil!4087) (Cons!4086 (h!4753 (_ BitVec 64)) (t!9163 List!4090)) )
))
(declare-fun contains!1928 (List!4090 (_ BitVec 64)) Bool)

(assert (=> b!271304 (= res!135354 (not (contains!1928 Nil!4087 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271305 () Bool)

(declare-fun res!135357 () Bool)

(declare-fun e!174459 () Bool)

(assert (=> b!271305 (=> (not res!135357) (not e!174459))))

(declare-datatypes ((array!13320 0))(
  ( (array!13321 (arr!6309 (Array (_ BitVec 32) (_ BitVec 64))) (size!6662 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13320)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271305 (= res!135357 (and (= (size!6662 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6662 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6662 a!3325))))))

(declare-fun res!135348 () Bool)

(assert (=> start!26234 (=> (not res!135348) (not e!174459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26234 (= res!135348 (validMask!0 mask!3868))))

(assert (=> start!26234 e!174459))

(declare-fun array_inv!4281 (array!13320) Bool)

(assert (=> start!26234 (array_inv!4281 a!3325)))

(assert (=> start!26234 true))

(declare-fun b!271306 () Bool)

(declare-fun res!135346 () Bool)

(assert (=> b!271306 (=> (not res!135346) (not e!174457))))

(declare-fun noDuplicate!142 (List!4090) Bool)

(assert (=> b!271306 (= res!135346 (noDuplicate!142 Nil!4087))))

(declare-fun b!271307 () Bool)

(declare-fun res!135355 () Bool)

(assert (=> b!271307 (=> (not res!135355) (not e!174459))))

(declare-fun arrayNoDuplicates!0 (array!13320 (_ BitVec 32) List!4090) Bool)

(assert (=> b!271307 (= res!135355 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4087))))

(declare-fun b!271308 () Bool)

(declare-fun res!135349 () Bool)

(assert (=> b!271308 (=> (not res!135349) (not e!174459))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271308 (= res!135349 (validKeyInArray!0 k0!2581))))

(declare-fun b!271309 () Bool)

(declare-fun res!135356 () Bool)

(assert (=> b!271309 (=> (not res!135356) (not e!174457))))

(assert (=> b!271309 (= res!135356 (not (= startIndex!26 i!1267)))))

(declare-fun b!271310 () Bool)

(assert (=> b!271310 (= e!174459 e!174457)))

(declare-fun res!135350 () Bool)

(assert (=> b!271310 (=> (not res!135350) (not e!174457))))

(declare-datatypes ((SeekEntryResult!1466 0))(
  ( (MissingZero!1466 (index!8034 (_ BitVec 32))) (Found!1466 (index!8035 (_ BitVec 32))) (Intermediate!1466 (undefined!2278 Bool) (index!8036 (_ BitVec 32)) (x!26382 (_ BitVec 32))) (Undefined!1466) (MissingVacant!1466 (index!8037 (_ BitVec 32))) )
))
(declare-fun lt!135623 () SeekEntryResult!1466)

(assert (=> b!271310 (= res!135350 (or (= lt!135623 (MissingZero!1466 i!1267)) (= lt!135623 (MissingVacant!1466 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13320 (_ BitVec 32)) SeekEntryResult!1466)

(assert (=> b!271310 (= lt!135623 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271311 () Bool)

(declare-fun res!135351 () Bool)

(assert (=> b!271311 (=> (not res!135351) (not e!174459))))

(declare-fun arrayContainsKey!0 (array!13320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271311 (= res!135351 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271312 () Bool)

(declare-fun res!135358 () Bool)

(assert (=> b!271312 (=> (not res!135358) (not e!174457))))

(assert (=> b!271312 (= res!135358 (not (contains!1928 Nil!4087 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271313 () Bool)

(assert (=> b!271313 (= e!174457 false)))

(declare-fun lt!135624 () Bool)

(assert (=> b!271313 (= lt!135624 (contains!1928 Nil!4087 k0!2581))))

(declare-fun b!271314 () Bool)

(declare-fun res!135353 () Bool)

(assert (=> b!271314 (=> (not res!135353) (not e!174457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13320 (_ BitVec 32)) Bool)

(assert (=> b!271314 (= res!135353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271315 () Bool)

(declare-fun res!135347 () Bool)

(assert (=> b!271315 (=> (not res!135347) (not e!174457))))

(assert (=> b!271315 (= res!135347 (validKeyInArray!0 (select (arr!6309 a!3325) startIndex!26)))))

(declare-fun b!271316 () Bool)

(declare-fun res!135352 () Bool)

(assert (=> b!271316 (=> (not res!135352) (not e!174457))))

(assert (=> b!271316 (= res!135352 (and (bvslt (size!6662 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6662 a!3325))))))

(assert (= (and start!26234 res!135348) b!271305))

(assert (= (and b!271305 res!135357) b!271308))

(assert (= (and b!271308 res!135349) b!271307))

(assert (= (and b!271307 res!135355) b!271311))

(assert (= (and b!271311 res!135351) b!271310))

(assert (= (and b!271310 res!135350) b!271314))

(assert (= (and b!271314 res!135353) b!271309))

(assert (= (and b!271309 res!135356) b!271315))

(assert (= (and b!271315 res!135347) b!271316))

(assert (= (and b!271316 res!135352) b!271306))

(assert (= (and b!271306 res!135346) b!271304))

(assert (= (and b!271304 res!135354) b!271312))

(assert (= (and b!271312 res!135358) b!271313))

(declare-fun m!286139 () Bool)

(assert (=> b!271312 m!286139))

(declare-fun m!286141 () Bool)

(assert (=> b!271315 m!286141))

(assert (=> b!271315 m!286141))

(declare-fun m!286143 () Bool)

(assert (=> b!271315 m!286143))

(declare-fun m!286145 () Bool)

(assert (=> b!271311 m!286145))

(declare-fun m!286147 () Bool)

(assert (=> b!271308 m!286147))

(declare-fun m!286149 () Bool)

(assert (=> b!271310 m!286149))

(declare-fun m!286151 () Bool)

(assert (=> b!271314 m!286151))

(declare-fun m!286153 () Bool)

(assert (=> b!271304 m!286153))

(declare-fun m!286155 () Bool)

(assert (=> start!26234 m!286155))

(declare-fun m!286157 () Bool)

(assert (=> start!26234 m!286157))

(declare-fun m!286159 () Bool)

(assert (=> b!271313 m!286159))

(declare-fun m!286161 () Bool)

(assert (=> b!271307 m!286161))

(declare-fun m!286163 () Bool)

(assert (=> b!271306 m!286163))

(check-sat (not b!271304) (not b!271313) (not b!271310) (not b!271308) (not b!271311) (not b!271314) (not b!271312) (not b!271315) (not b!271306) (not start!26234) (not b!271307))
(check-sat)
