; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27116 () Bool)

(assert start!27116)

(declare-fun b!280190 () Bool)

(declare-fun res!143313 () Bool)

(declare-fun e!178416 () Bool)

(assert (=> b!280190 (=> (not res!143313) (not e!178416))))

(declare-datatypes ((List!4384 0))(
  ( (Nil!4381) (Cons!4380 (h!5050 (_ BitVec 64)) (t!9457 List!4384)) )
))
(declare-fun contains!1963 (List!4384 (_ BitVec 64)) Bool)

(assert (=> b!280190 (= res!143313 (not (contains!1963 Nil!4381 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280191 () Bool)

(declare-fun res!143317 () Bool)

(declare-fun e!178414 () Bool)

(assert (=> b!280191 (=> (not res!143317) (not e!178414))))

(declare-datatypes ((array!13923 0))(
  ( (array!13924 (arr!6603 (Array (_ BitVec 32) (_ BitVec 64))) (size!6956 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13923)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280191 (= res!143317 (and (= (size!6956 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6956 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6956 a!3325))))))

(declare-fun b!280192 () Bool)

(declare-fun res!143323 () Bool)

(assert (=> b!280192 (=> (not res!143323) (not e!178414))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280192 (= res!143323 (validKeyInArray!0 k0!2581))))

(declare-fun b!280193 () Bool)

(assert (=> b!280193 (= e!178416 false)))

(declare-fun lt!138630 () Bool)

(assert (=> b!280193 (= lt!138630 (contains!1963 Nil!4381 k0!2581))))

(declare-fun b!280194 () Bool)

(declare-fun res!143312 () Bool)

(assert (=> b!280194 (=> (not res!143312) (not e!178414))))

(declare-fun arrayNoDuplicates!0 (array!13923 (_ BitVec 32) List!4384) Bool)

(assert (=> b!280194 (= res!143312 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4381))))

(declare-fun b!280195 () Bool)

(declare-fun res!143322 () Bool)

(assert (=> b!280195 (=> (not res!143322) (not e!178416))))

(assert (=> b!280195 (= res!143322 (not (= startIndex!26 i!1267)))))

(declare-fun b!280196 () Bool)

(declare-fun res!143318 () Bool)

(assert (=> b!280196 (=> (not res!143318) (not e!178416))))

(assert (=> b!280196 (= res!143318 (and (bvslt (size!6956 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6956 a!3325))))))

(declare-fun b!280197 () Bool)

(declare-fun res!143315 () Bool)

(assert (=> b!280197 (=> (not res!143315) (not e!178416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13923 (_ BitVec 32)) Bool)

(assert (=> b!280197 (= res!143315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280198 () Bool)

(declare-fun res!143311 () Bool)

(assert (=> b!280198 (=> (not res!143311) (not e!178416))))

(assert (=> b!280198 (= res!143311 (not (contains!1963 Nil!4381 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280200 () Bool)

(declare-fun res!143321 () Bool)

(assert (=> b!280200 (=> (not res!143321) (not e!178416))))

(declare-fun noDuplicate!172 (List!4384) Bool)

(assert (=> b!280200 (= res!143321 (noDuplicate!172 Nil!4381))))

(declare-fun b!280201 () Bool)

(declare-fun res!143316 () Bool)

(assert (=> b!280201 (=> (not res!143316) (not e!178416))))

(assert (=> b!280201 (= res!143316 (validKeyInArray!0 (select (arr!6603 a!3325) startIndex!26)))))

(declare-fun b!280202 () Bool)

(assert (=> b!280202 (= e!178414 e!178416)))

(declare-fun res!143319 () Bool)

(assert (=> b!280202 (=> (not res!143319) (not e!178416))))

(declare-datatypes ((SeekEntryResult!1760 0))(
  ( (MissingZero!1760 (index!9210 (_ BitVec 32))) (Found!1760 (index!9211 (_ BitVec 32))) (Intermediate!1760 (undefined!2572 Bool) (index!9212 (_ BitVec 32)) (x!27469 (_ BitVec 32))) (Undefined!1760) (MissingVacant!1760 (index!9213 (_ BitVec 32))) )
))
(declare-fun lt!138629 () SeekEntryResult!1760)

(assert (=> b!280202 (= res!143319 (or (= lt!138629 (MissingZero!1760 i!1267)) (= lt!138629 (MissingVacant!1760 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13923 (_ BitVec 32)) SeekEntryResult!1760)

(assert (=> b!280202 (= lt!138629 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!143320 () Bool)

(assert (=> start!27116 (=> (not res!143320) (not e!178414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27116 (= res!143320 (validMask!0 mask!3868))))

(assert (=> start!27116 e!178414))

(declare-fun array_inv!4575 (array!13923) Bool)

(assert (=> start!27116 (array_inv!4575 a!3325)))

(assert (=> start!27116 true))

(declare-fun b!280199 () Bool)

(declare-fun res!143314 () Bool)

(assert (=> b!280199 (=> (not res!143314) (not e!178414))))

(declare-fun arrayContainsKey!0 (array!13923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280199 (= res!143314 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27116 res!143320) b!280191))

(assert (= (and b!280191 res!143317) b!280192))

(assert (= (and b!280192 res!143323) b!280194))

(assert (= (and b!280194 res!143312) b!280199))

(assert (= (and b!280199 res!143314) b!280202))

(assert (= (and b!280202 res!143319) b!280197))

(assert (= (and b!280197 res!143315) b!280195))

(assert (= (and b!280195 res!143322) b!280201))

(assert (= (and b!280201 res!143316) b!280196))

(assert (= (and b!280196 res!143318) b!280200))

(assert (= (and b!280200 res!143321) b!280198))

(assert (= (and b!280198 res!143311) b!280190))

(assert (= (and b!280190 res!143313) b!280193))

(declare-fun m!294209 () Bool)

(assert (=> b!280198 m!294209))

(declare-fun m!294211 () Bool)

(assert (=> start!27116 m!294211))

(declare-fun m!294213 () Bool)

(assert (=> start!27116 m!294213))

(declare-fun m!294215 () Bool)

(assert (=> b!280190 m!294215))

(declare-fun m!294217 () Bool)

(assert (=> b!280199 m!294217))

(declare-fun m!294219 () Bool)

(assert (=> b!280192 m!294219))

(declare-fun m!294221 () Bool)

(assert (=> b!280200 m!294221))

(declare-fun m!294223 () Bool)

(assert (=> b!280197 m!294223))

(declare-fun m!294225 () Bool)

(assert (=> b!280201 m!294225))

(assert (=> b!280201 m!294225))

(declare-fun m!294227 () Bool)

(assert (=> b!280201 m!294227))

(declare-fun m!294229 () Bool)

(assert (=> b!280194 m!294229))

(declare-fun m!294231 () Bool)

(assert (=> b!280202 m!294231))

(declare-fun m!294233 () Bool)

(assert (=> b!280193 m!294233))

(check-sat (not b!280197) (not b!280198) (not b!280202) (not b!280193) (not b!280190) (not b!280192) (not b!280201) (not b!280199) (not start!27116) (not b!280194) (not b!280200))
(check-sat)
