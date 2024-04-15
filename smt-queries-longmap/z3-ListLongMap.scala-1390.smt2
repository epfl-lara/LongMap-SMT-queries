; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27194 () Bool)

(assert start!27194)

(declare-fun res!144398 () Bool)

(declare-fun e!178766 () Bool)

(assert (=> start!27194 (=> (not res!144398) (not e!178766))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27194 (= res!144398 (validMask!0 mask!3868))))

(assert (=> start!27194 e!178766))

(declare-datatypes ((array!14001 0))(
  ( (array!14002 (arr!6642 (Array (_ BitVec 32) (_ BitVec 64))) (size!6995 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14001)

(declare-fun array_inv!4614 (array!14001) Bool)

(assert (=> start!27194 (array_inv!4614 a!3325)))

(assert (=> start!27194 true))

(declare-fun b!281271 () Bool)

(declare-fun res!144397 () Bool)

(assert (=> b!281271 (=> (not res!144397) (not e!178766))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281271 (= res!144397 (and (= (size!6995 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6995 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6995 a!3325))))))

(declare-fun b!281272 () Bool)

(declare-fun res!144396 () Bool)

(assert (=> b!281272 (=> (not res!144396) (not e!178766))))

(declare-datatypes ((List!4423 0))(
  ( (Nil!4420) (Cons!4419 (h!5089 (_ BitVec 64)) (t!9496 List!4423)) )
))
(declare-fun arrayNoDuplicates!0 (array!14001 (_ BitVec 32) List!4423) Bool)

(assert (=> b!281272 (= res!144396 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4420))))

(declare-fun b!281273 () Bool)

(declare-fun res!144394 () Bool)

(declare-fun e!178765 () Bool)

(assert (=> b!281273 (=> (not res!144394) (not e!178765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14001 (_ BitVec 32)) Bool)

(assert (=> b!281273 (= res!144394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281274 () Bool)

(assert (=> b!281274 (= e!178766 e!178765)))

(declare-fun res!144393 () Bool)

(assert (=> b!281274 (=> (not res!144393) (not e!178765))))

(declare-datatypes ((SeekEntryResult!1799 0))(
  ( (MissingZero!1799 (index!9366 (_ BitVec 32))) (Found!1799 (index!9367 (_ BitVec 32))) (Intermediate!1799 (undefined!2611 Bool) (index!9368 (_ BitVec 32)) (x!27612 (_ BitVec 32))) (Undefined!1799) (MissingVacant!1799 (index!9369 (_ BitVec 32))) )
))
(declare-fun lt!138864 () SeekEntryResult!1799)

(assert (=> b!281274 (= res!144393 (or (= lt!138864 (MissingZero!1799 i!1267)) (= lt!138864 (MissingVacant!1799 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14001 (_ BitVec 32)) SeekEntryResult!1799)

(assert (=> b!281274 (= lt!138864 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281275 () Bool)

(declare-fun res!144392 () Bool)

(assert (=> b!281275 (=> (not res!144392) (not e!178766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281275 (= res!144392 (validKeyInArray!0 k0!2581))))

(declare-fun b!281276 () Bool)

(declare-fun res!144395 () Bool)

(assert (=> b!281276 (=> (not res!144395) (not e!178765))))

(assert (=> b!281276 (= res!144395 (not (= startIndex!26 i!1267)))))

(declare-fun b!281277 () Bool)

(declare-fun res!144400 () Bool)

(assert (=> b!281277 (=> (not res!144400) (not e!178766))))

(declare-fun arrayContainsKey!0 (array!14001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281277 (= res!144400 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281278 () Bool)

(declare-fun res!144399 () Bool)

(assert (=> b!281278 (=> (not res!144399) (not e!178765))))

(assert (=> b!281278 (= res!144399 (validKeyInArray!0 (select (arr!6642 a!3325) startIndex!26)))))

(declare-fun b!281279 () Bool)

(assert (=> b!281279 (= e!178765 (not true))))

(assert (=> b!281279 (arrayNoDuplicates!0 (array!14002 (store (arr!6642 a!3325) i!1267 k0!2581) (size!6995 a!3325)) #b00000000000000000000000000000000 Nil!4420)))

(declare-datatypes ((Unit!8844 0))(
  ( (Unit!8845) )
))
(declare-fun lt!138863 () Unit!8844)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14001 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4423) Unit!8844)

(assert (=> b!281279 (= lt!138863 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4420))))

(assert (= (and start!27194 res!144398) b!281271))

(assert (= (and b!281271 res!144397) b!281275))

(assert (= (and b!281275 res!144392) b!281272))

(assert (= (and b!281272 res!144396) b!281277))

(assert (= (and b!281277 res!144400) b!281274))

(assert (= (and b!281274 res!144393) b!281273))

(assert (= (and b!281273 res!144394) b!281276))

(assert (= (and b!281276 res!144395) b!281278))

(assert (= (and b!281278 res!144399) b!281279))

(declare-fun m!295151 () Bool)

(assert (=> b!281278 m!295151))

(assert (=> b!281278 m!295151))

(declare-fun m!295153 () Bool)

(assert (=> b!281278 m!295153))

(declare-fun m!295155 () Bool)

(assert (=> b!281275 m!295155))

(declare-fun m!295157 () Bool)

(assert (=> b!281279 m!295157))

(declare-fun m!295159 () Bool)

(assert (=> b!281279 m!295159))

(declare-fun m!295161 () Bool)

(assert (=> b!281279 m!295161))

(declare-fun m!295163 () Bool)

(assert (=> b!281272 m!295163))

(declare-fun m!295165 () Bool)

(assert (=> b!281274 m!295165))

(declare-fun m!295167 () Bool)

(assert (=> b!281277 m!295167))

(declare-fun m!295169 () Bool)

(assert (=> b!281273 m!295169))

(declare-fun m!295171 () Bool)

(assert (=> start!27194 m!295171))

(declare-fun m!295173 () Bool)

(assert (=> start!27194 m!295173))

(check-sat (not b!281273) (not b!281279) (not b!281278) (not start!27194) (not b!281277) (not b!281274) (not b!281272) (not b!281275))
(check-sat)
