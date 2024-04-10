; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27248 () Bool)

(assert start!27248)

(declare-fun b!282174 () Bool)

(declare-fun res!145248 () Bool)

(declare-fun e!179198 () Bool)

(assert (=> b!282174 (=> (not res!145248) (not e!179198))))

(declare-datatypes ((array!14066 0))(
  ( (array!14067 (arr!6675 (Array (_ BitVec 32) (_ BitVec 64))) (size!7027 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14066)

(declare-datatypes ((List!4483 0))(
  ( (Nil!4480) (Cons!4479 (h!5149 (_ BitVec 64)) (t!9565 List!4483)) )
))
(declare-fun arrayNoDuplicates!0 (array!14066 (_ BitVec 32) List!4483) Bool)

(assert (=> b!282174 (= res!145248 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4480))))

(declare-fun b!282175 () Bool)

(declare-fun res!145247 () Bool)

(assert (=> b!282175 (=> (not res!145247) (not e!179198))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282175 (= res!145247 (and (= (size!7027 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7027 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7027 a!3325))))))

(declare-fun b!282176 () Bool)

(declare-fun res!145245 () Bool)

(declare-fun e!179195 () Bool)

(assert (=> b!282176 (=> (not res!145245) (not e!179195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282176 (= res!145245 (validKeyInArray!0 (select (arr!6675 a!3325) startIndex!26)))))

(declare-fun b!282178 () Bool)

(declare-fun e!179196 () Bool)

(assert (=> b!282178 (= e!179196 e!179195)))

(declare-fun res!145243 () Bool)

(assert (=> b!282178 (=> (not res!145243) (not e!179195))))

(assert (=> b!282178 (= res!145243 (not (= startIndex!26 i!1267)))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139400 () array!14066)

(assert (=> b!282178 (= lt!139400 (array!14067 (store (arr!6675 a!3325) i!1267 k0!2581) (size!7027 a!3325)))))

(declare-fun b!282179 () Bool)

(declare-fun res!145250 () Bool)

(assert (=> b!282179 (=> (not res!145250) (not e!179196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14066 (_ BitVec 32)) Bool)

(assert (=> b!282179 (= res!145250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282180 () Bool)

(assert (=> b!282180 (= e!179198 e!179196)))

(declare-fun res!145244 () Bool)

(assert (=> b!282180 (=> (not res!145244) (not e!179196))))

(declare-datatypes ((SeekEntryResult!1833 0))(
  ( (MissingZero!1833 (index!9502 (_ BitVec 32))) (Found!1833 (index!9503 (_ BitVec 32))) (Intermediate!1833 (undefined!2645 Bool) (index!9504 (_ BitVec 32)) (x!27719 (_ BitVec 32))) (Undefined!1833) (MissingVacant!1833 (index!9505 (_ BitVec 32))) )
))
(declare-fun lt!139399 () SeekEntryResult!1833)

(assert (=> b!282180 (= res!145244 (or (= lt!139399 (MissingZero!1833 i!1267)) (= lt!139399 (MissingVacant!1833 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14066 (_ BitVec 32)) SeekEntryResult!1833)

(assert (=> b!282180 (= lt!139399 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282181 () Bool)

(assert (=> b!282181 (= e!179195 (not true))))

(assert (=> b!282181 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8950 0))(
  ( (Unit!8951) )
))
(declare-fun lt!139402 () Unit!8950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8950)

(assert (=> b!282181 (= lt!139402 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282181 (= (seekEntryOrOpen!0 (select (arr!6675 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6675 a!3325) i!1267 k0!2581) startIndex!26) lt!139400 mask!3868))))

(declare-fun lt!139401 () Unit!8950)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14066 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8950)

(assert (=> b!282181 (= lt!139401 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282181 (arrayNoDuplicates!0 lt!139400 #b00000000000000000000000000000000 Nil!4480)))

(declare-fun lt!139398 () Unit!8950)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14066 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4483) Unit!8950)

(assert (=> b!282181 (= lt!139398 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4480))))

(declare-fun b!282182 () Bool)

(declare-fun res!145251 () Bool)

(assert (=> b!282182 (=> (not res!145251) (not e!179198))))

(declare-fun arrayContainsKey!0 (array!14066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282182 (= res!145251 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!145246 () Bool)

(assert (=> start!27248 (=> (not res!145246) (not e!179198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27248 (= res!145246 (validMask!0 mask!3868))))

(assert (=> start!27248 e!179198))

(declare-fun array_inv!4638 (array!14066) Bool)

(assert (=> start!27248 (array_inv!4638 a!3325)))

(assert (=> start!27248 true))

(declare-fun b!282177 () Bool)

(declare-fun res!145249 () Bool)

(assert (=> b!282177 (=> (not res!145249) (not e!179198))))

(assert (=> b!282177 (= res!145249 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27248 res!145246) b!282175))

(assert (= (and b!282175 res!145247) b!282177))

(assert (= (and b!282177 res!145249) b!282174))

(assert (= (and b!282174 res!145248) b!282182))

(assert (= (and b!282182 res!145251) b!282180))

(assert (= (and b!282180 res!145244) b!282179))

(assert (= (and b!282179 res!145250) b!282178))

(assert (= (and b!282178 res!145243) b!282176))

(assert (= (and b!282176 res!145245) b!282181))

(declare-fun m!296655 () Bool)

(assert (=> start!27248 m!296655))

(declare-fun m!296657 () Bool)

(assert (=> start!27248 m!296657))

(declare-fun m!296659 () Bool)

(assert (=> b!282180 m!296659))

(declare-fun m!296661 () Bool)

(assert (=> b!282182 m!296661))

(declare-fun m!296663 () Bool)

(assert (=> b!282176 m!296663))

(assert (=> b!282176 m!296663))

(declare-fun m!296665 () Bool)

(assert (=> b!282176 m!296665))

(declare-fun m!296667 () Bool)

(assert (=> b!282178 m!296667))

(declare-fun m!296669 () Bool)

(assert (=> b!282174 m!296669))

(declare-fun m!296671 () Bool)

(assert (=> b!282181 m!296671))

(declare-fun m!296673 () Bool)

(assert (=> b!282181 m!296673))

(declare-fun m!296675 () Bool)

(assert (=> b!282181 m!296675))

(assert (=> b!282181 m!296673))

(assert (=> b!282181 m!296667))

(assert (=> b!282181 m!296663))

(declare-fun m!296677 () Bool)

(assert (=> b!282181 m!296677))

(declare-fun m!296679 () Bool)

(assert (=> b!282181 m!296679))

(assert (=> b!282181 m!296663))

(declare-fun m!296681 () Bool)

(assert (=> b!282181 m!296681))

(declare-fun m!296683 () Bool)

(assert (=> b!282181 m!296683))

(declare-fun m!296685 () Bool)

(assert (=> b!282181 m!296685))

(declare-fun m!296687 () Bool)

(assert (=> b!282177 m!296687))

(declare-fun m!296689 () Bool)

(assert (=> b!282179 m!296689))

(check-sat (not b!282181) (not b!282176) (not b!282180) (not start!27248) (not b!282177) (not b!282179) (not b!282174) (not b!282182))
(check-sat)
