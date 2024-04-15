; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27386 () Bool)

(assert start!27386)

(declare-fun b!283258 () Bool)

(declare-fun e!179727 () Bool)

(declare-fun e!179726 () Bool)

(assert (=> b!283258 (= e!179727 e!179726)))

(declare-fun res!146228 () Bool)

(assert (=> b!283258 (=> (not res!146228) (not e!179726))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!283258 (= res!146228 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14130 0))(
  ( (array!14131 (arr!6705 (Array (_ BitVec 32) (_ BitVec 64))) (size!7058 (_ BitVec 32))) )
))
(declare-fun lt!139895 () array!14130)

(declare-fun a!3325 () array!14130)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!283258 (= lt!139895 (array!14131 (store (arr!6705 a!3325) i!1267 k0!2581) (size!7058 a!3325)))))

(declare-fun b!283259 () Bool)

(declare-fun res!146236 () Bool)

(declare-fun e!179725 () Bool)

(assert (=> b!283259 (=> (not res!146236) (not e!179725))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!283259 (= res!146236 (and (= (size!7058 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7058 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7058 a!3325))))))

(declare-fun b!283260 () Bool)

(declare-fun res!146235 () Bool)

(assert (=> b!283260 (=> (not res!146235) (not e!179727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14130 (_ BitVec 32)) Bool)

(assert (=> b!283260 (= res!146235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283261 () Bool)

(declare-fun res!146234 () Bool)

(assert (=> b!283261 (=> (not res!146234) (not e!179725))))

(declare-fun arrayContainsKey!0 (array!14130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283261 (= res!146234 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283262 () Bool)

(declare-fun res!146231 () Bool)

(assert (=> b!283262 (=> (not res!146231) (not e!179725))))

(declare-datatypes ((List!4486 0))(
  ( (Nil!4483) (Cons!4482 (h!5152 (_ BitVec 64)) (t!9559 List!4486)) )
))
(declare-fun arrayNoDuplicates!0 (array!14130 (_ BitVec 32) List!4486) Bool)

(assert (=> b!283262 (= res!146231 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4483))))

(declare-fun b!283263 () Bool)

(declare-fun res!146232 () Bool)

(assert (=> b!283263 (=> (not res!146232) (not e!179726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283263 (= res!146232 (validKeyInArray!0 (select (arr!6705 a!3325) startIndex!26)))))

(declare-fun b!283264 () Bool)

(declare-fun res!146230 () Bool)

(assert (=> b!283264 (=> (not res!146230) (not e!179725))))

(assert (=> b!283264 (= res!146230 (validKeyInArray!0 k0!2581))))

(declare-fun b!283265 () Bool)

(assert (=> b!283265 (= e!179725 e!179727)))

(declare-fun res!146229 () Bool)

(assert (=> b!283265 (=> (not res!146229) (not e!179727))))

(declare-datatypes ((SeekEntryResult!1862 0))(
  ( (MissingZero!1862 (index!9618 (_ BitVec 32))) (Found!1862 (index!9619 (_ BitVec 32))) (Intermediate!1862 (undefined!2674 Bool) (index!9620 (_ BitVec 32)) (x!27843 (_ BitVec 32))) (Undefined!1862) (MissingVacant!1862 (index!9621 (_ BitVec 32))) )
))
(declare-fun lt!139897 () SeekEntryResult!1862)

(assert (=> b!283265 (= res!146229 (or (= lt!139897 (MissingZero!1862 i!1267)) (= lt!139897 (MissingVacant!1862 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14130 (_ BitVec 32)) SeekEntryResult!1862)

(assert (=> b!283265 (= lt!139897 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!146233 () Bool)

(assert (=> start!27386 (=> (not res!146233) (not e!179725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27386 (= res!146233 (validMask!0 mask!3868))))

(assert (=> start!27386 e!179725))

(declare-fun array_inv!4677 (array!14130) Bool)

(assert (=> start!27386 (array_inv!4677 a!3325)))

(assert (=> start!27386 true))

(declare-fun b!283257 () Bool)

(assert (=> b!283257 (= e!179726 (not true))))

(assert (=> b!283257 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8970 0))(
  ( (Unit!8971) )
))
(declare-fun lt!139899 () Unit!8970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8970)

(assert (=> b!283257 (= lt!139899 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!283257 (= (seekEntryOrOpen!0 (select (arr!6705 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6705 a!3325) i!1267 k0!2581) startIndex!26) lt!139895 mask!3868))))

(declare-fun lt!139896 () Unit!8970)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14130 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8970)

(assert (=> b!283257 (= lt!139896 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!283257 (arrayNoDuplicates!0 lt!139895 #b00000000000000000000000000000000 Nil!4483)))

(declare-fun lt!139898 () Unit!8970)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14130 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4486) Unit!8970)

(assert (=> b!283257 (= lt!139898 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4483))))

(assert (= (and start!27386 res!146233) b!283259))

(assert (= (and b!283259 res!146236) b!283264))

(assert (= (and b!283264 res!146230) b!283262))

(assert (= (and b!283262 res!146231) b!283261))

(assert (= (and b!283261 res!146234) b!283265))

(assert (= (and b!283265 res!146229) b!283260))

(assert (= (and b!283260 res!146235) b!283258))

(assert (= (and b!283258 res!146228) b!283263))

(assert (= (and b!283263 res!146232) b!283257))

(declare-fun m!297689 () Bool)

(assert (=> b!283261 m!297689))

(declare-fun m!297691 () Bool)

(assert (=> b!283260 m!297691))

(declare-fun m!297693 () Bool)

(assert (=> b!283258 m!297693))

(declare-fun m!297695 () Bool)

(assert (=> b!283264 m!297695))

(declare-fun m!297697 () Bool)

(assert (=> b!283265 m!297697))

(declare-fun m!297699 () Bool)

(assert (=> b!283263 m!297699))

(assert (=> b!283263 m!297699))

(declare-fun m!297701 () Bool)

(assert (=> b!283263 m!297701))

(declare-fun m!297703 () Bool)

(assert (=> b!283257 m!297703))

(declare-fun m!297705 () Bool)

(assert (=> b!283257 m!297705))

(declare-fun m!297707 () Bool)

(assert (=> b!283257 m!297707))

(declare-fun m!297709 () Bool)

(assert (=> b!283257 m!297709))

(assert (=> b!283257 m!297699))

(declare-fun m!297711 () Bool)

(assert (=> b!283257 m!297711))

(declare-fun m!297713 () Bool)

(assert (=> b!283257 m!297713))

(assert (=> b!283257 m!297699))

(declare-fun m!297715 () Bool)

(assert (=> b!283257 m!297715))

(assert (=> b!283257 m!297707))

(declare-fun m!297717 () Bool)

(assert (=> b!283257 m!297717))

(assert (=> b!283257 m!297693))

(declare-fun m!297719 () Bool)

(assert (=> b!283262 m!297719))

(declare-fun m!297721 () Bool)

(assert (=> start!27386 m!297721))

(declare-fun m!297723 () Bool)

(assert (=> start!27386 m!297723))

(check-sat (not b!283260) (not b!283261) (not b!283264) (not b!283257) (not b!283262) (not b!283263) (not start!27386) (not b!283265))
(check-sat)
