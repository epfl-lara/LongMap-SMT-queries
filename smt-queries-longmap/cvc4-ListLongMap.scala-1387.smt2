; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27178 () Bool)

(assert start!27178)

(declare-fun b!281229 () Bool)

(declare-fun res!144298 () Bool)

(declare-fun e!178805 () Bool)

(assert (=> b!281229 (=> (not res!144298) (not e!178805))))

(declare-datatypes ((array!13996 0))(
  ( (array!13997 (arr!6640 (Array (_ BitVec 32) (_ BitVec 64))) (size!6992 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13996)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13996 (_ BitVec 32)) Bool)

(assert (=> b!281229 (= res!144298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281230 () Bool)

(declare-fun res!144303 () Bool)

(declare-fun e!178803 () Bool)

(assert (=> b!281230 (=> (not res!144303) (not e!178803))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281230 (= res!144303 (and (= (size!6992 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6992 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6992 a!3325))))))

(declare-fun b!281231 () Bool)

(assert (=> b!281231 (= e!178803 e!178805)))

(declare-fun res!144306 () Bool)

(assert (=> b!281231 (=> (not res!144306) (not e!178805))))

(declare-datatypes ((SeekEntryResult!1798 0))(
  ( (MissingZero!1798 (index!9362 (_ BitVec 32))) (Found!1798 (index!9363 (_ BitVec 32))) (Intermediate!1798 (undefined!2610 Bool) (index!9364 (_ BitVec 32)) (x!27588 (_ BitVec 32))) (Undefined!1798) (MissingVacant!1798 (index!9365 (_ BitVec 32))) )
))
(declare-fun lt!139003 () SeekEntryResult!1798)

(assert (=> b!281231 (= res!144306 (or (= lt!139003 (MissingZero!1798 i!1267)) (= lt!139003 (MissingVacant!1798 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13996 (_ BitVec 32)) SeekEntryResult!1798)

(assert (=> b!281231 (= lt!139003 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281232 () Bool)

(declare-fun res!144301 () Bool)

(assert (=> b!281232 (=> (not res!144301) (not e!178803))))

(declare-fun arrayContainsKey!0 (array!13996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281232 (= res!144301 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281233 () Bool)

(declare-fun res!144305 () Bool)

(assert (=> b!281233 (=> (not res!144305) (not e!178803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281233 (= res!144305 (validKeyInArray!0 k!2581))))

(declare-fun b!281234 () Bool)

(declare-fun res!144300 () Bool)

(assert (=> b!281234 (=> (not res!144300) (not e!178803))))

(declare-datatypes ((List!4448 0))(
  ( (Nil!4445) (Cons!4444 (h!5114 (_ BitVec 64)) (t!9530 List!4448)) )
))
(declare-fun arrayNoDuplicates!0 (array!13996 (_ BitVec 32) List!4448) Bool)

(assert (=> b!281234 (= res!144300 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4445))))

(declare-fun b!281235 () Bool)

(declare-fun res!144299 () Bool)

(assert (=> b!281235 (=> (not res!144299) (not e!178805))))

(assert (=> b!281235 (= res!144299 (not (= startIndex!26 i!1267)))))

(declare-fun res!144302 () Bool)

(assert (=> start!27178 (=> (not res!144302) (not e!178803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27178 (= res!144302 (validMask!0 mask!3868))))

(assert (=> start!27178 e!178803))

(declare-fun array_inv!4603 (array!13996) Bool)

(assert (=> start!27178 (array_inv!4603 a!3325)))

(assert (=> start!27178 true))

(declare-fun b!281236 () Bool)

(declare-fun res!144304 () Bool)

(assert (=> b!281236 (=> (not res!144304) (not e!178805))))

(assert (=> b!281236 (= res!144304 (validKeyInArray!0 (select (arr!6640 a!3325) startIndex!26)))))

(declare-fun b!281237 () Bool)

(assert (=> b!281237 (= e!178805 (not true))))

(assert (=> b!281237 (arrayNoDuplicates!0 (array!13997 (store (arr!6640 a!3325) i!1267 k!2581) (size!6992 a!3325)) #b00000000000000000000000000000000 Nil!4445)))

(declare-datatypes ((Unit!8880 0))(
  ( (Unit!8881) )
))
(declare-fun lt!139002 () Unit!8880)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13996 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4448) Unit!8880)

(assert (=> b!281237 (= lt!139002 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4445))))

(assert (= (and start!27178 res!144302) b!281230))

(assert (= (and b!281230 res!144303) b!281233))

(assert (= (and b!281233 res!144305) b!281234))

(assert (= (and b!281234 res!144300) b!281232))

(assert (= (and b!281232 res!144301) b!281231))

(assert (= (and b!281231 res!144306) b!281229))

(assert (= (and b!281229 res!144298) b!281235))

(assert (= (and b!281235 res!144299) b!281236))

(assert (= (and b!281236 res!144304) b!281237))

(declare-fun m!295575 () Bool)

(assert (=> b!281231 m!295575))

(declare-fun m!295577 () Bool)

(assert (=> b!281233 m!295577))

(declare-fun m!295579 () Bool)

(assert (=> b!281236 m!295579))

(assert (=> b!281236 m!295579))

(declare-fun m!295581 () Bool)

(assert (=> b!281236 m!295581))

(declare-fun m!295583 () Bool)

(assert (=> b!281232 m!295583))

(declare-fun m!295585 () Bool)

(assert (=> start!27178 m!295585))

(declare-fun m!295587 () Bool)

(assert (=> start!27178 m!295587))

(declare-fun m!295589 () Bool)

(assert (=> b!281234 m!295589))

(declare-fun m!295591 () Bool)

(assert (=> b!281229 m!295591))

(declare-fun m!295593 () Bool)

(assert (=> b!281237 m!295593))

(declare-fun m!295595 () Bool)

(assert (=> b!281237 m!295595))

(declare-fun m!295597 () Bool)

(assert (=> b!281237 m!295597))

(push 1)

