; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26218 () Bool)

(assert start!26218)

(declare-fun b!271178 () Bool)

(declare-fun res!135170 () Bool)

(declare-fun e!174495 () Bool)

(assert (=> b!271178 (=> (not res!135170) (not e!174495))))

(declare-datatypes ((array!13315 0))(
  ( (array!13316 (arr!6307 (Array (_ BitVec 32) (_ BitVec 64))) (size!6659 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13315)

(declare-datatypes ((List!4115 0))(
  ( (Nil!4112) (Cons!4111 (h!4778 (_ BitVec 64)) (t!9197 List!4115)) )
))
(declare-fun arrayNoDuplicates!0 (array!13315 (_ BitVec 32) List!4115) Bool)

(assert (=> b!271178 (= res!135170 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4112))))

(declare-fun b!271179 () Bool)

(declare-fun res!135172 () Bool)

(declare-fun e!174496 () Bool)

(assert (=> b!271179 (=> (not res!135172) (not e!174496))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271179 (= res!135172 (not (= startIndex!26 i!1267)))))

(declare-fun b!271180 () Bool)

(declare-fun res!135177 () Bool)

(assert (=> b!271180 (=> (not res!135177) (not e!174496))))

(declare-fun contains!1945 (List!4115 (_ BitVec 64)) Bool)

(assert (=> b!271180 (= res!135177 (not (contains!1945 Nil!4112 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271181 () Bool)

(assert (=> b!271181 (= e!174495 e!174496)))

(declare-fun res!135171 () Bool)

(assert (=> b!271181 (=> (not res!135171) (not e!174496))))

(declare-datatypes ((SeekEntryResult!1465 0))(
  ( (MissingZero!1465 (index!8030 (_ BitVec 32))) (Found!1465 (index!8031 (_ BitVec 32))) (Intermediate!1465 (undefined!2277 Bool) (index!8032 (_ BitVec 32)) (x!26358 (_ BitVec 32))) (Undefined!1465) (MissingVacant!1465 (index!8033 (_ BitVec 32))) )
))
(declare-fun lt!135762 () SeekEntryResult!1465)

(assert (=> b!271181 (= res!135171 (or (= lt!135762 (MissingZero!1465 i!1267)) (= lt!135762 (MissingVacant!1465 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13315 (_ BitVec 32)) SeekEntryResult!1465)

(assert (=> b!271181 (= lt!135762 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271182 () Bool)

(declare-fun res!135169 () Bool)

(assert (=> b!271182 (=> (not res!135169) (not e!174495))))

(declare-fun arrayContainsKey!0 (array!13315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271182 (= res!135169 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!135175 () Bool)

(assert (=> start!26218 (=> (not res!135175) (not e!174495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26218 (= res!135175 (validMask!0 mask!3868))))

(assert (=> start!26218 e!174495))

(declare-fun array_inv!4270 (array!13315) Bool)

(assert (=> start!26218 (array_inv!4270 a!3325)))

(assert (=> start!26218 true))

(declare-fun b!271183 () Bool)

(declare-fun res!135179 () Bool)

(assert (=> b!271183 (=> (not res!135179) (not e!174495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271183 (= res!135179 (validKeyInArray!0 k!2581))))

(declare-fun b!271184 () Bool)

(declare-fun res!135174 () Bool)

(assert (=> b!271184 (=> (not res!135174) (not e!174495))))

(assert (=> b!271184 (= res!135174 (and (= (size!6659 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6659 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6659 a!3325))))))

(declare-fun b!271185 () Bool)

(declare-fun res!135176 () Bool)

(assert (=> b!271185 (=> (not res!135176) (not e!174496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13315 (_ BitVec 32)) Bool)

(assert (=> b!271185 (= res!135176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271186 () Bool)

(declare-fun res!135180 () Bool)

(assert (=> b!271186 (=> (not res!135180) (not e!174496))))

(assert (=> b!271186 (= res!135180 (not (contains!1945 Nil!4112 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271187 () Bool)

(assert (=> b!271187 (= e!174496 false)))

(declare-fun lt!135763 () Bool)

(assert (=> b!271187 (= lt!135763 (contains!1945 Nil!4112 k!2581))))

(declare-fun b!271188 () Bool)

(declare-fun res!135168 () Bool)

(assert (=> b!271188 (=> (not res!135168) (not e!174496))))

(declare-fun noDuplicate!133 (List!4115) Bool)

(assert (=> b!271188 (= res!135168 (noDuplicate!133 Nil!4112))))

(declare-fun b!271189 () Bool)

(declare-fun res!135173 () Bool)

(assert (=> b!271189 (=> (not res!135173) (not e!174496))))

(assert (=> b!271189 (= res!135173 (and (bvslt (size!6659 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6659 a!3325))))))

(declare-fun b!271190 () Bool)

(declare-fun res!135178 () Bool)

(assert (=> b!271190 (=> (not res!135178) (not e!174496))))

(assert (=> b!271190 (= res!135178 (validKeyInArray!0 (select (arr!6307 a!3325) startIndex!26)))))

(assert (= (and start!26218 res!135175) b!271184))

(assert (= (and b!271184 res!135174) b!271183))

(assert (= (and b!271183 res!135179) b!271178))

(assert (= (and b!271178 res!135170) b!271182))

(assert (= (and b!271182 res!135169) b!271181))

(assert (= (and b!271181 res!135171) b!271185))

(assert (= (and b!271185 res!135176) b!271179))

(assert (= (and b!271179 res!135172) b!271190))

(assert (= (and b!271190 res!135178) b!271189))

(assert (= (and b!271189 res!135173) b!271188))

(assert (= (and b!271188 res!135168) b!271186))

(assert (= (and b!271186 res!135180) b!271180))

(assert (= (and b!271180 res!135177) b!271187))

(declare-fun m!286549 () Bool)

(assert (=> b!271190 m!286549))

(assert (=> b!271190 m!286549))

(declare-fun m!286551 () Bool)

(assert (=> b!271190 m!286551))

(declare-fun m!286553 () Bool)

(assert (=> b!271186 m!286553))

(declare-fun m!286555 () Bool)

(assert (=> b!271187 m!286555))

(declare-fun m!286557 () Bool)

(assert (=> b!271181 m!286557))

(declare-fun m!286559 () Bool)

(assert (=> b!271180 m!286559))

(declare-fun m!286561 () Bool)

(assert (=> b!271178 m!286561))

(declare-fun m!286563 () Bool)

(assert (=> b!271188 m!286563))

(declare-fun m!286565 () Bool)

(assert (=> start!26218 m!286565))

(declare-fun m!286567 () Bool)

(assert (=> start!26218 m!286567))

(declare-fun m!286569 () Bool)

(assert (=> b!271185 m!286569))

(declare-fun m!286571 () Bool)

(assert (=> b!271183 m!286571))

(declare-fun m!286573 () Bool)

(assert (=> b!271182 m!286573))

(push 1)

