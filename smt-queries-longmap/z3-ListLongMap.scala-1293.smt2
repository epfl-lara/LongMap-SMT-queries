; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26318 () Bool)

(assert start!26318)

(declare-fun b!272538 () Bool)

(declare-fun e!174835 () Bool)

(declare-fun e!174836 () Bool)

(assert (=> b!272538 (= e!174835 e!174836)))

(declare-fun res!136585 () Bool)

(assert (=> b!272538 (=> (not res!136585) (not e!174836))))

(declare-datatypes ((SeekEntryResult!1508 0))(
  ( (MissingZero!1508 (index!8202 (_ BitVec 32))) (Found!1508 (index!8203 (_ BitVec 32))) (Intermediate!1508 (undefined!2320 Bool) (index!8204 (_ BitVec 32)) (x!26536 (_ BitVec 32))) (Undefined!1508) (MissingVacant!1508 (index!8205 (_ BitVec 32))) )
))
(declare-fun lt!135875 () SeekEntryResult!1508)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272538 (= res!136585 (or (= lt!135875 (MissingZero!1508 i!1267)) (= lt!135875 (MissingVacant!1508 i!1267))))))

(declare-datatypes ((array!13404 0))(
  ( (array!13405 (arr!6351 (Array (_ BitVec 32) (_ BitVec 64))) (size!6704 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13404)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13404 (_ BitVec 32)) SeekEntryResult!1508)

(assert (=> b!272538 (= lt!135875 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272539 () Bool)

(declare-fun res!136582 () Bool)

(assert (=> b!272539 (=> (not res!136582) (not e!174836))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272539 (= res!136582 (not (= startIndex!26 i!1267)))))

(declare-fun res!136587 () Bool)

(assert (=> start!26318 (=> (not res!136587) (not e!174835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26318 (= res!136587 (validMask!0 mask!3868))))

(assert (=> start!26318 e!174835))

(declare-fun array_inv!4323 (array!13404) Bool)

(assert (=> start!26318 (array_inv!4323 a!3325)))

(assert (=> start!26318 true))

(declare-fun b!272540 () Bool)

(assert (=> b!272540 (= e!174836 (not true))))

(declare-datatypes ((List!4132 0))(
  ( (Nil!4129) (Cons!4128 (h!4795 (_ BitVec 64)) (t!9205 List!4132)) )
))
(declare-fun arrayNoDuplicates!0 (array!13404 (_ BitVec 32) List!4132) Bool)

(assert (=> b!272540 (arrayNoDuplicates!0 (array!13405 (store (arr!6351 a!3325) i!1267 k0!2581) (size!6704 a!3325)) #b00000000000000000000000000000000 Nil!4129)))

(declare-datatypes ((Unit!8469 0))(
  ( (Unit!8470) )
))
(declare-fun lt!135876 () Unit!8469)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13404 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4132) Unit!8469)

(assert (=> b!272540 (= lt!135876 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4129))))

(declare-fun b!272541 () Bool)

(declare-fun res!136586 () Bool)

(assert (=> b!272541 (=> (not res!136586) (not e!174835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272541 (= res!136586 (validKeyInArray!0 k0!2581))))

(declare-fun b!272542 () Bool)

(declare-fun res!136583 () Bool)

(assert (=> b!272542 (=> (not res!136583) (not e!174835))))

(assert (=> b!272542 (= res!136583 (and (= (size!6704 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6704 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6704 a!3325))))))

(declare-fun b!272543 () Bool)

(declare-fun res!136580 () Bool)

(assert (=> b!272543 (=> (not res!136580) (not e!174835))))

(assert (=> b!272543 (= res!136580 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4129))))

(declare-fun b!272544 () Bool)

(declare-fun res!136584 () Bool)

(assert (=> b!272544 (=> (not res!136584) (not e!174836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13404 (_ BitVec 32)) Bool)

(assert (=> b!272544 (= res!136584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272545 () Bool)

(declare-fun res!136588 () Bool)

(assert (=> b!272545 (=> (not res!136588) (not e!174836))))

(assert (=> b!272545 (= res!136588 (validKeyInArray!0 (select (arr!6351 a!3325) startIndex!26)))))

(declare-fun b!272546 () Bool)

(declare-fun res!136581 () Bool)

(assert (=> b!272546 (=> (not res!136581) (not e!174835))))

(declare-fun arrayContainsKey!0 (array!13404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272546 (= res!136581 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26318 res!136587) b!272542))

(assert (= (and b!272542 res!136583) b!272541))

(assert (= (and b!272541 res!136586) b!272543))

(assert (= (and b!272543 res!136580) b!272546))

(assert (= (and b!272546 res!136581) b!272538))

(assert (= (and b!272538 res!136585) b!272544))

(assert (= (and b!272544 res!136584) b!272539))

(assert (= (and b!272539 res!136582) b!272545))

(assert (= (and b!272545 res!136588) b!272540))

(declare-fun m!287165 () Bool)

(assert (=> b!272540 m!287165))

(declare-fun m!287167 () Bool)

(assert (=> b!272540 m!287167))

(declare-fun m!287169 () Bool)

(assert (=> b!272540 m!287169))

(declare-fun m!287171 () Bool)

(assert (=> start!26318 m!287171))

(declare-fun m!287173 () Bool)

(assert (=> start!26318 m!287173))

(declare-fun m!287175 () Bool)

(assert (=> b!272546 m!287175))

(declare-fun m!287177 () Bool)

(assert (=> b!272544 m!287177))

(declare-fun m!287179 () Bool)

(assert (=> b!272538 m!287179))

(declare-fun m!287181 () Bool)

(assert (=> b!272543 m!287181))

(declare-fun m!287183 () Bool)

(assert (=> b!272545 m!287183))

(assert (=> b!272545 m!287183))

(declare-fun m!287185 () Bool)

(assert (=> b!272545 m!287185))

(declare-fun m!287187 () Bool)

(assert (=> b!272541 m!287187))

(check-sat (not b!272545) (not b!272544) (not start!26318) (not b!272538) (not b!272540) (not b!272546) (not b!272543) (not b!272541))
(check-sat)
