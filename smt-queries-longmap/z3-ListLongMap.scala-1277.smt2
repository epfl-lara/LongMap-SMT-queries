; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26220 () Bool)

(assert start!26220)

(declare-fun b!271264 () Bool)

(declare-fun res!135229 () Bool)

(declare-fun e!174529 () Bool)

(assert (=> b!271264 (=> (not res!135229) (not e!174529))))

(declare-datatypes ((List!4028 0))(
  ( (Nil!4025) (Cons!4024 (h!4691 (_ BitVec 64)) (t!9102 List!4028)) )
))
(declare-fun noDuplicate!137 (List!4028) Bool)

(assert (=> b!271264 (= res!135229 (noDuplicate!137 Nil!4025))))

(declare-fun res!135236 () Bool)

(declare-fun e!174530 () Bool)

(assert (=> start!26220 (=> (not res!135236) (not e!174530))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26220 (= res!135236 (validMask!0 mask!3868))))

(assert (=> start!26220 e!174530))

(declare-datatypes ((array!13316 0))(
  ( (array!13317 (arr!6307 (Array (_ BitVec 32) (_ BitVec 64))) (size!6659 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13316)

(declare-fun array_inv!4257 (array!13316) Bool)

(assert (=> start!26220 (array_inv!4257 a!3325)))

(assert (=> start!26220 true))

(declare-fun b!271265 () Bool)

(declare-fun res!135239 () Bool)

(assert (=> b!271265 (=> (not res!135239) (not e!174529))))

(declare-fun contains!1921 (List!4028 (_ BitVec 64)) Bool)

(assert (=> b!271265 (= res!135239 (not (contains!1921 Nil!4025 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271266 () Bool)

(declare-fun res!135231 () Bool)

(assert (=> b!271266 (=> (not res!135231) (not e!174529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13316 (_ BitVec 32)) Bool)

(assert (=> b!271266 (= res!135231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271267 () Bool)

(declare-fun res!135234 () Bool)

(assert (=> b!271267 (=> (not res!135234) (not e!174529))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271267 (= res!135234 (validKeyInArray!0 (select (arr!6307 a!3325) startIndex!26)))))

(declare-fun b!271268 () Bool)

(declare-fun res!135232 () Bool)

(assert (=> b!271268 (=> (not res!135232) (not e!174529))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271268 (= res!135232 (not (= startIndex!26 i!1267)))))

(declare-fun b!271269 () Bool)

(declare-fun res!135228 () Bool)

(assert (=> b!271269 (=> (not res!135228) (not e!174529))))

(assert (=> b!271269 (= res!135228 (not (contains!1921 Nil!4025 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271270 () Bool)

(declare-fun res!135235 () Bool)

(assert (=> b!271270 (=> (not res!135235) (not e!174530))))

(declare-fun arrayNoDuplicates!0 (array!13316 (_ BitVec 32) List!4028) Bool)

(assert (=> b!271270 (= res!135235 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4025))))

(declare-fun b!271271 () Bool)

(declare-fun res!135230 () Bool)

(assert (=> b!271271 (=> (not res!135230) (not e!174530))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271271 (= res!135230 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271272 () Bool)

(declare-fun res!135233 () Bool)

(assert (=> b!271272 (=> (not res!135233) (not e!174529))))

(assert (=> b!271272 (= res!135233 (and (bvslt (size!6659 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6659 a!3325))))))

(declare-fun b!271273 () Bool)

(declare-fun res!135237 () Bool)

(assert (=> b!271273 (=> (not res!135237) (not e!174530))))

(assert (=> b!271273 (= res!135237 (and (= (size!6659 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6659 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6659 a!3325))))))

(declare-fun b!271274 () Bool)

(declare-fun res!135238 () Bool)

(assert (=> b!271274 (=> (not res!135238) (not e!174530))))

(assert (=> b!271274 (= res!135238 (validKeyInArray!0 k0!2581))))

(declare-fun b!271275 () Bool)

(assert (=> b!271275 (= e!174530 e!174529)))

(declare-fun res!135240 () Bool)

(assert (=> b!271275 (=> (not res!135240) (not e!174529))))

(declare-datatypes ((SeekEntryResult!1430 0))(
  ( (MissingZero!1430 (index!7890 (_ BitVec 32))) (Found!1430 (index!7891 (_ BitVec 32))) (Intermediate!1430 (undefined!2242 Bool) (index!7892 (_ BitVec 32)) (x!26331 (_ BitVec 32))) (Undefined!1430) (MissingVacant!1430 (index!7893 (_ BitVec 32))) )
))
(declare-fun lt!135828 () SeekEntryResult!1430)

(assert (=> b!271275 (= res!135240 (or (= lt!135828 (MissingZero!1430 i!1267)) (= lt!135828 (MissingVacant!1430 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13316 (_ BitVec 32)) SeekEntryResult!1430)

(assert (=> b!271275 (= lt!135828 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271276 () Bool)

(assert (=> b!271276 (= e!174529 false)))

(declare-fun lt!135827 () Bool)

(assert (=> b!271276 (= lt!135827 (contains!1921 Nil!4025 k0!2581))))

(assert (= (and start!26220 res!135236) b!271273))

(assert (= (and b!271273 res!135237) b!271274))

(assert (= (and b!271274 res!135238) b!271270))

(assert (= (and b!271270 res!135235) b!271271))

(assert (= (and b!271271 res!135230) b!271275))

(assert (= (and b!271275 res!135240) b!271266))

(assert (= (and b!271266 res!135231) b!271268))

(assert (= (and b!271268 res!135232) b!271267))

(assert (= (and b!271267 res!135234) b!271272))

(assert (= (and b!271272 res!135233) b!271264))

(assert (= (and b!271264 res!135229) b!271269))

(assert (= (and b!271269 res!135228) b!271265))

(assert (= (and b!271265 res!135239) b!271276))

(declare-fun m!286781 () Bool)

(assert (=> start!26220 m!286781))

(declare-fun m!286783 () Bool)

(assert (=> start!26220 m!286783))

(declare-fun m!286785 () Bool)

(assert (=> b!271270 m!286785))

(declare-fun m!286787 () Bool)

(assert (=> b!271275 m!286787))

(declare-fun m!286789 () Bool)

(assert (=> b!271267 m!286789))

(assert (=> b!271267 m!286789))

(declare-fun m!286791 () Bool)

(assert (=> b!271267 m!286791))

(declare-fun m!286793 () Bool)

(assert (=> b!271264 m!286793))

(declare-fun m!286795 () Bool)

(assert (=> b!271266 m!286795))

(declare-fun m!286797 () Bool)

(assert (=> b!271276 m!286797))

(declare-fun m!286799 () Bool)

(assert (=> b!271265 m!286799))

(declare-fun m!286801 () Bool)

(assert (=> b!271271 m!286801))

(declare-fun m!286803 () Bool)

(assert (=> b!271269 m!286803))

(declare-fun m!286805 () Bool)

(assert (=> b!271274 m!286805))

(check-sat (not b!271270) (not b!271275) (not start!26220) (not b!271267) (not b!271271) (not b!271265) (not b!271266) (not b!271276) (not b!271264) (not b!271269) (not b!271274))
(check-sat)
