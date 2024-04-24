; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27210 () Bool)

(assert start!27210)

(declare-fun b!281708 () Bool)

(declare-fun res!144759 () Bool)

(declare-fun e!178994 () Bool)

(assert (=> b!281708 (=> (not res!144759) (not e!178994))))

(declare-datatypes ((array!14027 0))(
  ( (array!14028 (arr!6655 (Array (_ BitVec 32) (_ BitVec 64))) (size!7007 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14027)

(declare-datatypes ((List!4376 0))(
  ( (Nil!4373) (Cons!4372 (h!5042 (_ BitVec 64)) (t!9450 List!4376)) )
))
(declare-fun arrayNoDuplicates!0 (array!14027 (_ BitVec 32) List!4376) Bool)

(assert (=> b!281708 (= res!144759 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4373))))

(declare-fun b!281709 () Bool)

(declare-fun res!144754 () Bool)

(declare-fun e!178992 () Bool)

(assert (=> b!281709 (=> (not res!144754) (not e!178992))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281709 (= res!144754 (validKeyInArray!0 (select (arr!6655 a!3325) startIndex!26)))))

(declare-fun b!281710 () Bool)

(declare-fun res!144753 () Bool)

(declare-fun e!178993 () Bool)

(assert (=> b!281710 (=> (not res!144753) (not e!178993))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14027 (_ BitVec 32)) Bool)

(assert (=> b!281710 (= res!144753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281711 () Bool)

(assert (=> b!281711 (= e!178992 (not (bvsle #b00000000000000000000000000000000 (size!7007 a!3325))))))

(declare-fun lt!139198 () array!14027)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1778 0))(
  ( (MissingZero!1778 (index!9282 (_ BitVec 32))) (Found!1778 (index!9283 (_ BitVec 32))) (Intermediate!1778 (undefined!2590 Bool) (index!9284 (_ BitVec 32)) (x!27616 (_ BitVec 32))) (Undefined!1778) (MissingVacant!1778 (index!9285 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14027 (_ BitVec 32)) SeekEntryResult!1778)

(assert (=> b!281711 (= (seekEntryOrOpen!0 (select (arr!6655 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6655 a!3325) i!1267 k0!2581) startIndex!26) lt!139198 mask!3868))))

(declare-datatypes ((Unit!8886 0))(
  ( (Unit!8887) )
))
(declare-fun lt!139199 () Unit!8886)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14027 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8886)

(assert (=> b!281711 (= lt!139199 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!281711 (arrayNoDuplicates!0 lt!139198 #b00000000000000000000000000000000 Nil!4373)))

(declare-fun lt!139200 () Unit!8886)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14027 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4376) Unit!8886)

(assert (=> b!281711 (= lt!139200 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4373))))

(declare-fun b!281712 () Bool)

(assert (=> b!281712 (= e!178994 e!178993)))

(declare-fun res!144756 () Bool)

(assert (=> b!281712 (=> (not res!144756) (not e!178993))))

(declare-fun lt!139197 () SeekEntryResult!1778)

(assert (=> b!281712 (= res!144756 (or (= lt!139197 (MissingZero!1778 i!1267)) (= lt!139197 (MissingVacant!1778 i!1267))))))

(assert (=> b!281712 (= lt!139197 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281713 () Bool)

(assert (=> b!281713 (= e!178993 e!178992)))

(declare-fun res!144758 () Bool)

(assert (=> b!281713 (=> (not res!144758) (not e!178992))))

(assert (=> b!281713 (= res!144758 (not (= startIndex!26 i!1267)))))

(assert (=> b!281713 (= lt!139198 (array!14028 (store (arr!6655 a!3325) i!1267 k0!2581) (size!7007 a!3325)))))

(declare-fun b!281715 () Bool)

(declare-fun res!144751 () Bool)

(assert (=> b!281715 (=> (not res!144751) (not e!178994))))

(declare-fun arrayContainsKey!0 (array!14027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281715 (= res!144751 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281716 () Bool)

(declare-fun res!144752 () Bool)

(assert (=> b!281716 (=> (not res!144752) (not e!178994))))

(assert (=> b!281716 (= res!144752 (and (= (size!7007 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7007 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7007 a!3325))))))

(declare-fun res!144755 () Bool)

(assert (=> start!27210 (=> (not res!144755) (not e!178994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27210 (= res!144755 (validMask!0 mask!3868))))

(assert (=> start!27210 e!178994))

(declare-fun array_inv!4605 (array!14027) Bool)

(assert (=> start!27210 (array_inv!4605 a!3325)))

(assert (=> start!27210 true))

(declare-fun b!281714 () Bool)

(declare-fun res!144757 () Bool)

(assert (=> b!281714 (=> (not res!144757) (not e!178994))))

(assert (=> b!281714 (= res!144757 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27210 res!144755) b!281716))

(assert (= (and b!281716 res!144752) b!281714))

(assert (= (and b!281714 res!144757) b!281708))

(assert (= (and b!281708 res!144759) b!281715))

(assert (= (and b!281715 res!144751) b!281712))

(assert (= (and b!281712 res!144756) b!281710))

(assert (= (and b!281710 res!144753) b!281713))

(assert (= (and b!281713 res!144758) b!281709))

(assert (= (and b!281709 res!144754) b!281711))

(declare-fun m!296213 () Bool)

(assert (=> b!281715 m!296213))

(declare-fun m!296215 () Bool)

(assert (=> b!281714 m!296215))

(declare-fun m!296217 () Bool)

(assert (=> start!27210 m!296217))

(declare-fun m!296219 () Bool)

(assert (=> start!27210 m!296219))

(declare-fun m!296221 () Bool)

(assert (=> b!281708 m!296221))

(declare-fun m!296223 () Bool)

(assert (=> b!281712 m!296223))

(declare-fun m!296225 () Bool)

(assert (=> b!281709 m!296225))

(assert (=> b!281709 m!296225))

(declare-fun m!296227 () Bool)

(assert (=> b!281709 m!296227))

(declare-fun m!296229 () Bool)

(assert (=> b!281711 m!296229))

(declare-fun m!296231 () Bool)

(assert (=> b!281711 m!296231))

(declare-fun m!296233 () Bool)

(assert (=> b!281711 m!296233))

(assert (=> b!281711 m!296225))

(declare-fun m!296235 () Bool)

(assert (=> b!281711 m!296235))

(declare-fun m!296237 () Bool)

(assert (=> b!281711 m!296237))

(assert (=> b!281711 m!296231))

(declare-fun m!296239 () Bool)

(assert (=> b!281711 m!296239))

(assert (=> b!281711 m!296225))

(declare-fun m!296241 () Bool)

(assert (=> b!281711 m!296241))

(assert (=> b!281713 m!296233))

(declare-fun m!296243 () Bool)

(assert (=> b!281710 m!296243))

(check-sat (not b!281710) (not b!281714) (not b!281712) (not start!27210) (not b!281708) (not b!281709) (not b!281715) (not b!281711))
(check-sat)
