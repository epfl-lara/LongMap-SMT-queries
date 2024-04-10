; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26432 () Bool)

(assert start!26432)

(declare-fun b!274256 () Bool)

(declare-fun e!175621 () Bool)

(declare-fun e!175624 () Bool)

(assert (=> b!274256 (= e!175621 e!175624)))

(declare-fun res!138249 () Bool)

(assert (=> b!274256 (=> (not res!138249) (not e!175624))))

(declare-datatypes ((SeekEntryResult!1572 0))(
  ( (MissingZero!1572 (index!8458 (_ BitVec 32))) (Found!1572 (index!8459 (_ BitVec 32))) (Intermediate!1572 (undefined!2384 Bool) (index!8460 (_ BitVec 32)) (x!26753 (_ BitVec 32))) (Undefined!1572) (MissingVacant!1572 (index!8461 (_ BitVec 32))) )
))
(declare-fun lt!136841 () SeekEntryResult!1572)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274256 (= res!138249 (or (= lt!136841 (MissingZero!1572 i!1267)) (= lt!136841 (MissingVacant!1572 i!1267))))))

(declare-datatypes ((array!13529 0))(
  ( (array!13530 (arr!6414 (Array (_ BitVec 32) (_ BitVec 64))) (size!6766 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13529)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13529 (_ BitVec 32)) SeekEntryResult!1572)

(assert (=> b!274256 (= lt!136841 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274257 () Bool)

(declare-fun e!175623 () Bool)

(assert (=> b!274257 (= e!175624 e!175623)))

(declare-fun res!138252 () Bool)

(assert (=> b!274257 (=> (not res!138252) (not e!175623))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274257 (= res!138252 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136840 () array!13529)

(assert (=> b!274257 (= lt!136840 (array!13530 (store (arr!6414 a!3325) i!1267 k0!2581) (size!6766 a!3325)))))

(declare-fun b!274258 () Bool)

(declare-fun res!138248 () Bool)

(assert (=> b!274258 (=> (not res!138248) (not e!175624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13529 (_ BitVec 32)) Bool)

(assert (=> b!274258 (= res!138248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274259 () Bool)

(declare-fun res!138247 () Bool)

(assert (=> b!274259 (=> (not res!138247) (not e!175621))))

(declare-fun arrayContainsKey!0 (array!13529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274259 (= res!138247 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274260 () Bool)

(declare-fun res!138250 () Bool)

(assert (=> b!274260 (=> (not res!138250) (not e!175623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274260 (= res!138250 (validKeyInArray!0 (select (arr!6414 a!3325) startIndex!26)))))

(declare-fun b!274262 () Bool)

(declare-fun res!138246 () Bool)

(assert (=> b!274262 (=> (not res!138246) (not e!175621))))

(assert (=> b!274262 (= res!138246 (and (= (size!6766 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6766 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6766 a!3325))))))

(declare-fun b!274263 () Bool)

(declare-fun e!175625 () Bool)

(assert (=> b!274263 (= e!175623 (not e!175625))))

(declare-fun res!138255 () Bool)

(assert (=> b!274263 (=> res!138255 e!175625)))

(assert (=> b!274263 (= res!138255 (or (bvsge startIndex!26 (bvsub (size!6766 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274263 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8631 0))(
  ( (Unit!8632) )
))
(declare-fun lt!136839 () Unit!8631)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8631)

(assert (=> b!274263 (= lt!136839 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274263 (= (seekEntryOrOpen!0 (select (arr!6414 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6414 a!3325) i!1267 k0!2581) startIndex!26) lt!136840 mask!3868))))

(declare-fun lt!136842 () Unit!8631)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8631)

(assert (=> b!274263 (= lt!136842 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4222 0))(
  ( (Nil!4219) (Cons!4218 (h!4885 (_ BitVec 64)) (t!9304 List!4222)) )
))
(declare-fun arrayNoDuplicates!0 (array!13529 (_ BitVec 32) List!4222) Bool)

(assert (=> b!274263 (arrayNoDuplicates!0 lt!136840 #b00000000000000000000000000000000 Nil!4219)))

(declare-fun lt!136843 () Unit!8631)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13529 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4222) Unit!8631)

(assert (=> b!274263 (= lt!136843 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4219))))

(declare-fun b!274264 () Bool)

(declare-fun res!138251 () Bool)

(assert (=> b!274264 (=> (not res!138251) (not e!175621))))

(assert (=> b!274264 (= res!138251 (validKeyInArray!0 k0!2581))))

(declare-fun b!274265 () Bool)

(declare-fun res!138254 () Bool)

(assert (=> b!274265 (=> (not res!138254) (not e!175621))))

(assert (=> b!274265 (= res!138254 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4219))))

(declare-fun res!138253 () Bool)

(assert (=> start!26432 (=> (not res!138253) (not e!175621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26432 (= res!138253 (validMask!0 mask!3868))))

(assert (=> start!26432 e!175621))

(declare-fun array_inv!4377 (array!13529) Bool)

(assert (=> start!26432 (array_inv!4377 a!3325)))

(assert (=> start!26432 true))

(declare-fun b!274261 () Bool)

(assert (=> b!274261 (= e!175625 true)))

(assert (=> b!274261 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136840 mask!3868)))

(declare-fun lt!136838 () Unit!8631)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8631)

(assert (=> b!274261 (= lt!136838 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (= (and start!26432 res!138253) b!274262))

(assert (= (and b!274262 res!138246) b!274264))

(assert (= (and b!274264 res!138251) b!274265))

(assert (= (and b!274265 res!138254) b!274259))

(assert (= (and b!274259 res!138247) b!274256))

(assert (= (and b!274256 res!138249) b!274258))

(assert (= (and b!274258 res!138248) b!274257))

(assert (= (and b!274257 res!138252) b!274260))

(assert (= (and b!274260 res!138250) b!274263))

(assert (= (and b!274263 (not res!138255)) b!274261))

(declare-fun m!289717 () Bool)

(assert (=> start!26432 m!289717))

(declare-fun m!289719 () Bool)

(assert (=> start!26432 m!289719))

(declare-fun m!289721 () Bool)

(assert (=> b!274256 m!289721))

(declare-fun m!289723 () Bool)

(assert (=> b!274263 m!289723))

(declare-fun m!289725 () Bool)

(assert (=> b!274263 m!289725))

(declare-fun m!289727 () Bool)

(assert (=> b!274263 m!289727))

(declare-fun m!289729 () Bool)

(assert (=> b!274263 m!289729))

(declare-fun m!289731 () Bool)

(assert (=> b!274263 m!289731))

(declare-fun m!289733 () Bool)

(assert (=> b!274263 m!289733))

(declare-fun m!289735 () Bool)

(assert (=> b!274263 m!289735))

(assert (=> b!274263 m!289731))

(declare-fun m!289737 () Bool)

(assert (=> b!274263 m!289737))

(declare-fun m!289739 () Bool)

(assert (=> b!274263 m!289739))

(assert (=> b!274263 m!289725))

(declare-fun m!289741 () Bool)

(assert (=> b!274263 m!289741))

(declare-fun m!289743 () Bool)

(assert (=> b!274261 m!289743))

(declare-fun m!289745 () Bool)

(assert (=> b!274261 m!289745))

(declare-fun m!289747 () Bool)

(assert (=> b!274258 m!289747))

(declare-fun m!289749 () Bool)

(assert (=> b!274265 m!289749))

(assert (=> b!274260 m!289731))

(assert (=> b!274260 m!289731))

(declare-fun m!289751 () Bool)

(assert (=> b!274260 m!289751))

(declare-fun m!289753 () Bool)

(assert (=> b!274259 m!289753))

(assert (=> b!274257 m!289727))

(declare-fun m!289755 () Bool)

(assert (=> b!274264 m!289755))

(check-sat (not b!274264) (not start!26432) (not b!274259) (not b!274263) (not b!274265) (not b!274258) (not b!274261) (not b!274260) (not b!274256))
(check-sat)
