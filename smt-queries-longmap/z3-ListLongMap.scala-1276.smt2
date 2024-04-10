; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26216 () Bool)

(assert start!26216)

(declare-fun b!271139 () Bool)

(declare-fun res!135139 () Bool)

(declare-fun e!174487 () Bool)

(assert (=> b!271139 (=> (not res!135139) (not e!174487))))

(declare-datatypes ((array!13313 0))(
  ( (array!13314 (arr!6306 (Array (_ BitVec 32) (_ BitVec 64))) (size!6658 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13313)

(assert (=> b!271139 (= res!135139 (and (bvslt (size!6658 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6658 a!3325))))))

(declare-fun b!271140 () Bool)

(assert (=> b!271140 (= e!174487 false)))

(declare-fun lt!135757 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4114 0))(
  ( (Nil!4111) (Cons!4110 (h!4777 (_ BitVec 64)) (t!9196 List!4114)) )
))
(declare-fun contains!1944 (List!4114 (_ BitVec 64)) Bool)

(assert (=> b!271140 (= lt!135757 (contains!1944 Nil!4111 k0!2581))))

(declare-fun b!271141 () Bool)

(declare-fun res!135133 () Bool)

(declare-fun e!174488 () Bool)

(assert (=> b!271141 (=> (not res!135133) (not e!174488))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271141 (= res!135133 (and (= (size!6658 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6658 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6658 a!3325))))))

(declare-fun b!271142 () Bool)

(declare-fun res!135137 () Bool)

(assert (=> b!271142 (=> (not res!135137) (not e!174488))))

(declare-fun arrayContainsKey!0 (array!13313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271142 (= res!135137 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271143 () Bool)

(assert (=> b!271143 (= e!174488 e!174487)))

(declare-fun res!135132 () Bool)

(assert (=> b!271143 (=> (not res!135132) (not e!174487))))

(declare-datatypes ((SeekEntryResult!1464 0))(
  ( (MissingZero!1464 (index!8026 (_ BitVec 32))) (Found!1464 (index!8027 (_ BitVec 32))) (Intermediate!1464 (undefined!2276 Bool) (index!8028 (_ BitVec 32)) (x!26357 (_ BitVec 32))) (Undefined!1464) (MissingVacant!1464 (index!8029 (_ BitVec 32))) )
))
(declare-fun lt!135756 () SeekEntryResult!1464)

(assert (=> b!271143 (= res!135132 (or (= lt!135756 (MissingZero!1464 i!1267)) (= lt!135756 (MissingVacant!1464 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13313 (_ BitVec 32)) SeekEntryResult!1464)

(assert (=> b!271143 (= lt!135756 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271144 () Bool)

(declare-fun res!135135 () Bool)

(assert (=> b!271144 (=> (not res!135135) (not e!174487))))

(assert (=> b!271144 (= res!135135 (not (contains!1944 Nil!4111 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271145 () Bool)

(declare-fun res!135136 () Bool)

(assert (=> b!271145 (=> (not res!135136) (not e!174487))))

(declare-fun noDuplicate!132 (List!4114) Bool)

(assert (=> b!271145 (= res!135136 (noDuplicate!132 Nil!4111))))

(declare-fun b!271146 () Bool)

(declare-fun res!135140 () Bool)

(assert (=> b!271146 (=> (not res!135140) (not e!174488))))

(declare-fun arrayNoDuplicates!0 (array!13313 (_ BitVec 32) List!4114) Bool)

(assert (=> b!271146 (= res!135140 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4111))))

(declare-fun b!271147 () Bool)

(declare-fun res!135130 () Bool)

(assert (=> b!271147 (=> (not res!135130) (not e!174487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271147 (= res!135130 (validKeyInArray!0 (select (arr!6306 a!3325) startIndex!26)))))

(declare-fun b!271148 () Bool)

(declare-fun res!135131 () Bool)

(assert (=> b!271148 (=> (not res!135131) (not e!174487))))

(assert (=> b!271148 (= res!135131 (not (= startIndex!26 i!1267)))))

(declare-fun b!271149 () Bool)

(declare-fun res!135134 () Bool)

(assert (=> b!271149 (=> (not res!135134) (not e!174488))))

(assert (=> b!271149 (= res!135134 (validKeyInArray!0 k0!2581))))

(declare-fun b!271150 () Bool)

(declare-fun res!135129 () Bool)

(assert (=> b!271150 (=> (not res!135129) (not e!174487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13313 (_ BitVec 32)) Bool)

(assert (=> b!271150 (= res!135129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!135141 () Bool)

(assert (=> start!26216 (=> (not res!135141) (not e!174488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26216 (= res!135141 (validMask!0 mask!3868))))

(assert (=> start!26216 e!174488))

(declare-fun array_inv!4269 (array!13313) Bool)

(assert (=> start!26216 (array_inv!4269 a!3325)))

(assert (=> start!26216 true))

(declare-fun b!271151 () Bool)

(declare-fun res!135138 () Bool)

(assert (=> b!271151 (=> (not res!135138) (not e!174487))))

(assert (=> b!271151 (= res!135138 (not (contains!1944 Nil!4111 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!26216 res!135141) b!271141))

(assert (= (and b!271141 res!135133) b!271149))

(assert (= (and b!271149 res!135134) b!271146))

(assert (= (and b!271146 res!135140) b!271142))

(assert (= (and b!271142 res!135137) b!271143))

(assert (= (and b!271143 res!135132) b!271150))

(assert (= (and b!271150 res!135129) b!271148))

(assert (= (and b!271148 res!135131) b!271147))

(assert (= (and b!271147 res!135130) b!271139))

(assert (= (and b!271139 res!135139) b!271145))

(assert (= (and b!271145 res!135136) b!271151))

(assert (= (and b!271151 res!135138) b!271144))

(assert (= (and b!271144 res!135135) b!271140))

(declare-fun m!286523 () Bool)

(assert (=> b!271150 m!286523))

(declare-fun m!286525 () Bool)

(assert (=> b!271149 m!286525))

(declare-fun m!286527 () Bool)

(assert (=> b!271144 m!286527))

(declare-fun m!286529 () Bool)

(assert (=> b!271146 m!286529))

(declare-fun m!286531 () Bool)

(assert (=> b!271151 m!286531))

(declare-fun m!286533 () Bool)

(assert (=> b!271147 m!286533))

(assert (=> b!271147 m!286533))

(declare-fun m!286535 () Bool)

(assert (=> b!271147 m!286535))

(declare-fun m!286537 () Bool)

(assert (=> b!271140 m!286537))

(declare-fun m!286539 () Bool)

(assert (=> start!26216 m!286539))

(declare-fun m!286541 () Bool)

(assert (=> start!26216 m!286541))

(declare-fun m!286543 () Bool)

(assert (=> b!271145 m!286543))

(declare-fun m!286545 () Bool)

(assert (=> b!271143 m!286545))

(declare-fun m!286547 () Bool)

(assert (=> b!271142 m!286547))

(check-sat (not b!271144) (not b!271151) (not b!271146) (not b!271147) (not start!26216) (not b!271150) (not b!271145) (not b!271149) (not b!271140) (not b!271142) (not b!271143))
(check-sat)
