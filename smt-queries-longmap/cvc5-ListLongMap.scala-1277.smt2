; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26220 () Bool)

(assert start!26220)

(declare-fun b!271218 () Bool)

(declare-fun res!135213 () Bool)

(declare-fun e!174505 () Bool)

(assert (=> b!271218 (=> (not res!135213) (not e!174505))))

(declare-datatypes ((List!4116 0))(
  ( (Nil!4113) (Cons!4112 (h!4779 (_ BitVec 64)) (t!9198 List!4116)) )
))
(declare-fun contains!1946 (List!4116 (_ BitVec 64)) Bool)

(assert (=> b!271218 (= res!135213 (not (contains!1946 Nil!4113 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271219 () Bool)

(declare-fun res!135216 () Bool)

(assert (=> b!271219 (=> (not res!135216) (not e!174505))))

(assert (=> b!271219 (= res!135216 (not (contains!1946 Nil!4113 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271220 () Bool)

(declare-fun res!135207 () Bool)

(assert (=> b!271220 (=> (not res!135207) (not e!174505))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271220 (= res!135207 (not (= startIndex!26 i!1267)))))

(declare-fun b!271221 () Bool)

(declare-fun res!135211 () Bool)

(assert (=> b!271221 (=> (not res!135211) (not e!174505))))

(declare-datatypes ((array!13317 0))(
  ( (array!13318 (arr!6308 (Array (_ BitVec 32) (_ BitVec 64))) (size!6660 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13317)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271221 (= res!135211 (validKeyInArray!0 (select (arr!6308 a!3325) startIndex!26)))))

(declare-fun b!271222 () Bool)

(declare-fun e!174504 () Bool)

(assert (=> b!271222 (= e!174504 e!174505)))

(declare-fun res!135219 () Bool)

(assert (=> b!271222 (=> (not res!135219) (not e!174505))))

(declare-datatypes ((SeekEntryResult!1466 0))(
  ( (MissingZero!1466 (index!8034 (_ BitVec 32))) (Found!1466 (index!8035 (_ BitVec 32))) (Intermediate!1466 (undefined!2278 Bool) (index!8036 (_ BitVec 32)) (x!26367 (_ BitVec 32))) (Undefined!1466) (MissingVacant!1466 (index!8037 (_ BitVec 32))) )
))
(declare-fun lt!135768 () SeekEntryResult!1466)

(assert (=> b!271222 (= res!135219 (or (= lt!135768 (MissingZero!1466 i!1267)) (= lt!135768 (MissingVacant!1466 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13317 (_ BitVec 32)) SeekEntryResult!1466)

(assert (=> b!271222 (= lt!135768 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271223 () Bool)

(declare-fun res!135212 () Bool)

(assert (=> b!271223 (=> (not res!135212) (not e!174504))))

(assert (=> b!271223 (= res!135212 (and (= (size!6660 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6660 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6660 a!3325))))))

(declare-fun b!271224 () Bool)

(declare-fun res!135217 () Bool)

(assert (=> b!271224 (=> (not res!135217) (not e!174505))))

(declare-fun noDuplicate!134 (List!4116) Bool)

(assert (=> b!271224 (= res!135217 (noDuplicate!134 Nil!4113))))

(declare-fun b!271225 () Bool)

(declare-fun res!135209 () Bool)

(assert (=> b!271225 (=> (not res!135209) (not e!174504))))

(assert (=> b!271225 (= res!135209 (validKeyInArray!0 k!2581))))

(declare-fun b!271226 () Bool)

(declare-fun res!135208 () Bool)

(assert (=> b!271226 (=> (not res!135208) (not e!174505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13317 (_ BitVec 32)) Bool)

(assert (=> b!271226 (= res!135208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271227 () Bool)

(declare-fun res!135218 () Bool)

(assert (=> b!271227 (=> (not res!135218) (not e!174504))))

(declare-fun arrayContainsKey!0 (array!13317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271227 (= res!135218 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271217 () Bool)

(assert (=> b!271217 (= e!174505 false)))

(declare-fun lt!135769 () Bool)

(assert (=> b!271217 (= lt!135769 (contains!1946 Nil!4113 k!2581))))

(declare-fun res!135210 () Bool)

(assert (=> start!26220 (=> (not res!135210) (not e!174504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26220 (= res!135210 (validMask!0 mask!3868))))

(assert (=> start!26220 e!174504))

(declare-fun array_inv!4271 (array!13317) Bool)

(assert (=> start!26220 (array_inv!4271 a!3325)))

(assert (=> start!26220 true))

(declare-fun b!271228 () Bool)

(declare-fun res!135215 () Bool)

(assert (=> b!271228 (=> (not res!135215) (not e!174505))))

(assert (=> b!271228 (= res!135215 (and (bvslt (size!6660 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6660 a!3325))))))

(declare-fun b!271229 () Bool)

(declare-fun res!135214 () Bool)

(assert (=> b!271229 (=> (not res!135214) (not e!174504))))

(declare-fun arrayNoDuplicates!0 (array!13317 (_ BitVec 32) List!4116) Bool)

(assert (=> b!271229 (= res!135214 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4113))))

(assert (= (and start!26220 res!135210) b!271223))

(assert (= (and b!271223 res!135212) b!271225))

(assert (= (and b!271225 res!135209) b!271229))

(assert (= (and b!271229 res!135214) b!271227))

(assert (= (and b!271227 res!135218) b!271222))

(assert (= (and b!271222 res!135219) b!271226))

(assert (= (and b!271226 res!135208) b!271220))

(assert (= (and b!271220 res!135207) b!271221))

(assert (= (and b!271221 res!135211) b!271228))

(assert (= (and b!271228 res!135215) b!271224))

(assert (= (and b!271224 res!135217) b!271218))

(assert (= (and b!271218 res!135213) b!271219))

(assert (= (and b!271219 res!135216) b!271217))

(declare-fun m!286575 () Bool)

(assert (=> b!271226 m!286575))

(declare-fun m!286577 () Bool)

(assert (=> b!271229 m!286577))

(declare-fun m!286579 () Bool)

(assert (=> b!271227 m!286579))

(declare-fun m!286581 () Bool)

(assert (=> b!271219 m!286581))

(declare-fun m!286583 () Bool)

(assert (=> b!271224 m!286583))

(declare-fun m!286585 () Bool)

(assert (=> b!271225 m!286585))

(declare-fun m!286587 () Bool)

(assert (=> b!271221 m!286587))

(assert (=> b!271221 m!286587))

(declare-fun m!286589 () Bool)

(assert (=> b!271221 m!286589))

(declare-fun m!286591 () Bool)

(assert (=> b!271222 m!286591))

(declare-fun m!286593 () Bool)

(assert (=> start!26220 m!286593))

(declare-fun m!286595 () Bool)

(assert (=> start!26220 m!286595))

(declare-fun m!286597 () Bool)

(assert (=> b!271217 m!286597))

(declare-fun m!286599 () Bool)

(assert (=> b!271218 m!286599))

(push 1)

