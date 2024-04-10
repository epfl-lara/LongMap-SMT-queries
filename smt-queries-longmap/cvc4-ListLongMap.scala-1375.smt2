; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27106 () Bool)

(assert start!27106)

(declare-fun b!280181 () Bool)

(declare-fun res!143250 () Bool)

(declare-fun e!178480 () Bool)

(assert (=> b!280181 (=> (not res!143250) (not e!178480))))

(declare-datatypes ((List!4412 0))(
  ( (Nil!4409) (Cons!4408 (h!5078 (_ BitVec 64)) (t!9494 List!4412)) )
))
(declare-fun contains!1984 (List!4412 (_ BitVec 64)) Bool)

(assert (=> b!280181 (= res!143250 (not (contains!1984 Nil!4409 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280182 () Bool)

(declare-fun res!143256 () Bool)

(assert (=> b!280182 (=> (not res!143256) (not e!178480))))

(declare-datatypes ((array!13924 0))(
  ( (array!13925 (arr!6604 (Array (_ BitVec 32) (_ BitVec 64))) (size!6956 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13924)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280182 (= res!143256 (validKeyInArray!0 (select (arr!6604 a!3325) startIndex!26)))))

(declare-fun b!280183 () Bool)

(declare-fun res!143251 () Bool)

(assert (=> b!280183 (=> (not res!143251) (not e!178480))))

(assert (=> b!280183 (= res!143251 (and (bvslt (size!6956 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6956 a!3325))))))

(declare-fun res!143255 () Bool)

(declare-fun e!178479 () Bool)

(assert (=> start!27106 (=> (not res!143255) (not e!178479))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27106 (= res!143255 (validMask!0 mask!3868))))

(assert (=> start!27106 e!178479))

(declare-fun array_inv!4567 (array!13924) Bool)

(assert (=> start!27106 (array_inv!4567 a!3325)))

(assert (=> start!27106 true))

(declare-fun b!280184 () Bool)

(declare-fun res!143257 () Bool)

(assert (=> b!280184 (=> (not res!143257) (not e!178479))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!280184 (= res!143257 (validKeyInArray!0 k!2581))))

(declare-fun b!280185 () Bool)

(declare-fun res!143261 () Bool)

(assert (=> b!280185 (=> (not res!143261) (not e!178480))))

(declare-fun noDuplicate!166 (List!4412) Bool)

(assert (=> b!280185 (= res!143261 (noDuplicate!166 Nil!4409))))

(declare-fun b!280186 () Bool)

(declare-fun res!143259 () Bool)

(assert (=> b!280186 (=> (not res!143259) (not e!178479))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280186 (= res!143259 (and (= (size!6956 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6956 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6956 a!3325))))))

(declare-fun b!280187 () Bool)

(assert (=> b!280187 (= e!178480 false)))

(declare-fun lt!138787 () Bool)

(assert (=> b!280187 (= lt!138787 (contains!1984 Nil!4409 k!2581))))

(declare-fun b!280188 () Bool)

(assert (=> b!280188 (= e!178479 e!178480)))

(declare-fun res!143254 () Bool)

(assert (=> b!280188 (=> (not res!143254) (not e!178480))))

(declare-datatypes ((SeekEntryResult!1762 0))(
  ( (MissingZero!1762 (index!9218 (_ BitVec 32))) (Found!1762 (index!9219 (_ BitVec 32))) (Intermediate!1762 (undefined!2574 Bool) (index!9220 (_ BitVec 32)) (x!27456 (_ BitVec 32))) (Undefined!1762) (MissingVacant!1762 (index!9221 (_ BitVec 32))) )
))
(declare-fun lt!138786 () SeekEntryResult!1762)

(assert (=> b!280188 (= res!143254 (or (= lt!138786 (MissingZero!1762 i!1267)) (= lt!138786 (MissingVacant!1762 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13924 (_ BitVec 32)) SeekEntryResult!1762)

(assert (=> b!280188 (= lt!138786 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280189 () Bool)

(declare-fun res!143258 () Bool)

(assert (=> b!280189 (=> (not res!143258) (not e!178480))))

(assert (=> b!280189 (= res!143258 (not (contains!1984 Nil!4409 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280190 () Bool)

(declare-fun res!143260 () Bool)

(assert (=> b!280190 (=> (not res!143260) (not e!178479))))

(declare-fun arrayNoDuplicates!0 (array!13924 (_ BitVec 32) List!4412) Bool)

(assert (=> b!280190 (= res!143260 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4409))))

(declare-fun b!280191 () Bool)

(declare-fun res!143252 () Bool)

(assert (=> b!280191 (=> (not res!143252) (not e!178479))))

(declare-fun arrayContainsKey!0 (array!13924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280191 (= res!143252 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280192 () Bool)

(declare-fun res!143253 () Bool)

(assert (=> b!280192 (=> (not res!143253) (not e!178480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13924 (_ BitVec 32)) Bool)

(assert (=> b!280192 (= res!143253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280193 () Bool)

(declare-fun res!143262 () Bool)

(assert (=> b!280193 (=> (not res!143262) (not e!178480))))

(assert (=> b!280193 (= res!143262 (not (= startIndex!26 i!1267)))))

(assert (= (and start!27106 res!143255) b!280186))

(assert (= (and b!280186 res!143259) b!280184))

(assert (= (and b!280184 res!143257) b!280190))

(assert (= (and b!280190 res!143260) b!280191))

(assert (= (and b!280191 res!143252) b!280188))

(assert (= (and b!280188 res!143254) b!280192))

(assert (= (and b!280192 res!143253) b!280193))

(assert (= (and b!280193 res!143262) b!280182))

(assert (= (and b!280182 res!143256) b!280183))

(assert (= (and b!280183 res!143251) b!280185))

(assert (= (and b!280185 res!143261) b!280181))

(assert (= (and b!280181 res!143250) b!280189))

(assert (= (and b!280189 res!143258) b!280187))

(declare-fun m!294697 () Bool)

(assert (=> b!280181 m!294697))

(declare-fun m!294699 () Bool)

(assert (=> start!27106 m!294699))

(declare-fun m!294701 () Bool)

(assert (=> start!27106 m!294701))

(declare-fun m!294703 () Bool)

(assert (=> b!280189 m!294703))

(declare-fun m!294705 () Bool)

(assert (=> b!280182 m!294705))

(assert (=> b!280182 m!294705))

(declare-fun m!294707 () Bool)

(assert (=> b!280182 m!294707))

(declare-fun m!294709 () Bool)

(assert (=> b!280190 m!294709))

(declare-fun m!294711 () Bool)

(assert (=> b!280184 m!294711))

(declare-fun m!294713 () Bool)

(assert (=> b!280191 m!294713))

(declare-fun m!294715 () Bool)

(assert (=> b!280185 m!294715))

(declare-fun m!294717 () Bool)

(assert (=> b!280188 m!294717))

(declare-fun m!294719 () Bool)

(assert (=> b!280192 m!294719))

(declare-fun m!294721 () Bool)

(assert (=> b!280187 m!294721))

(push 1)

(assert (not b!280192))

(assert (not b!280184))

(assert (not b!280187))

(assert (not b!280185))

(assert (not b!280188))

(assert (not b!280191))

(assert (not b!280182))

(assert (not start!27106))

(assert (not b!280181))

(assert (not b!280190))

(assert (not b!280189))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

