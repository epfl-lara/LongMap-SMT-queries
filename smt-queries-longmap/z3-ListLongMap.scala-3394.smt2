; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46766 () Bool)

(assert start!46766)

(declare-fun b!516606 () Bool)

(declare-fun res!316233 () Bool)

(declare-fun e!301467 () Bool)

(assert (=> b!516606 (=> (not res!316233) (not e!301467))))

(declare-datatypes ((array!33079 0))(
  ( (array!33080 (arr!15907 (Array (_ BitVec 32) (_ BitVec 64))) (size!16271 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33079)

(declare-datatypes ((List!9972 0))(
  ( (Nil!9969) (Cons!9968 (h!10866 (_ BitVec 64)) (t!16192 List!9972)) )
))
(declare-fun arrayNoDuplicates!0 (array!33079 (_ BitVec 32) List!9972) Bool)

(assert (=> b!516606 (= res!316233 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9969))))

(declare-fun b!516607 () Bool)

(declare-fun res!316229 () Bool)

(declare-fun e!301466 () Bool)

(assert (=> b!516607 (=> (not res!316229) (not e!301466))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516607 (= res!316229 (validKeyInArray!0 k0!2280))))

(declare-fun b!516608 () Bool)

(declare-fun res!316228 () Bool)

(assert (=> b!516608 (=> (not res!316228) (not e!301466))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516608 (= res!316228 (validKeyInArray!0 (select (arr!15907 a!3235) j!176)))))

(declare-fun b!516609 () Bool)

(declare-fun e!301468 () Bool)

(assert (=> b!516609 (= e!301467 (not e!301468))))

(declare-fun res!316227 () Bool)

(assert (=> b!516609 (=> res!316227 e!301468)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!236534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4330 0))(
  ( (MissingZero!4330 (index!19508 (_ BitVec 32))) (Found!4330 (index!19509 (_ BitVec 32))) (Intermediate!4330 (undefined!5142 Bool) (index!19510 (_ BitVec 32)) (x!48610 (_ BitVec 32))) (Undefined!4330) (MissingVacant!4330 (index!19511 (_ BitVec 32))) )
))
(declare-fun lt!236535 () SeekEntryResult!4330)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33079 (_ BitVec 32)) SeekEntryResult!4330)

(assert (=> b!516609 (= res!316227 (= lt!236535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236534 (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) (array!33080 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235)) mask!3524)))))

(declare-fun lt!236536 () (_ BitVec 32))

(assert (=> b!516609 (= lt!236535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236536 (select (arr!15907 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516609 (= lt!236534 (toIndex!0 (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516609 (= lt!236536 (toIndex!0 (select (arr!15907 a!3235) j!176) mask!3524))))

(declare-fun e!301470 () Bool)

(assert (=> b!516609 e!301470))

(declare-fun res!316226 () Bool)

(assert (=> b!516609 (=> (not res!316226) (not e!301470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33079 (_ BitVec 32)) Bool)

(assert (=> b!516609 (= res!316226 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15979 0))(
  ( (Unit!15980) )
))
(declare-fun lt!236533 () Unit!15979)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15979)

(assert (=> b!516609 (= lt!236533 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516610 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33079 (_ BitVec 32)) SeekEntryResult!4330)

(assert (=> b!516610 (= e!301470 (= (seekEntryOrOpen!0 (select (arr!15907 a!3235) j!176) a!3235 mask!3524) (Found!4330 j!176)))))

(declare-fun b!516612 () Bool)

(assert (=> b!516612 (= e!301468 (or (not (= (select (arr!15907 a!3235) (index!19510 lt!236535)) (select (arr!15907 a!3235) j!176))) (bvsgt (x!48610 lt!236535) #b01111111111111111111111111111110) (bvsle #b00000000000000000000000000000000 (x!48610 lt!236535))))))

(assert (=> b!516612 (and (bvslt (x!48610 lt!236535) #b01111111111111111111111111111110) (or (= (select (arr!15907 a!3235) (index!19510 lt!236535)) (select (arr!15907 a!3235) j!176)) (= (select (arr!15907 a!3235) (index!19510 lt!236535)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15907 a!3235) (index!19510 lt!236535)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516613 () Bool)

(declare-fun res!316234 () Bool)

(assert (=> b!516613 (=> (not res!316234) (not e!301467))))

(assert (=> b!516613 (= res!316234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516614 () Bool)

(declare-fun res!316230 () Bool)

(assert (=> b!516614 (=> res!316230 e!301468)))

(get-info :version)

(assert (=> b!516614 (= res!316230 (or (undefined!5142 lt!236535) (not ((_ is Intermediate!4330) lt!236535))))))

(declare-fun b!516615 () Bool)

(declare-fun res!316232 () Bool)

(assert (=> b!516615 (=> (not res!316232) (not e!301466))))

(declare-fun arrayContainsKey!0 (array!33079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516615 (= res!316232 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516616 () Bool)

(declare-fun res!316231 () Bool)

(assert (=> b!516616 (=> (not res!316231) (not e!301466))))

(assert (=> b!516616 (= res!316231 (and (= (size!16271 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16271 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16271 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!316224 () Bool)

(assert (=> start!46766 (=> (not res!316224) (not e!301466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46766 (= res!316224 (validMask!0 mask!3524))))

(assert (=> start!46766 e!301466))

(assert (=> start!46766 true))

(declare-fun array_inv!11766 (array!33079) Bool)

(assert (=> start!46766 (array_inv!11766 a!3235)))

(declare-fun b!516611 () Bool)

(assert (=> b!516611 (= e!301466 e!301467)))

(declare-fun res!316225 () Bool)

(assert (=> b!516611 (=> (not res!316225) (not e!301467))))

(declare-fun lt!236532 () SeekEntryResult!4330)

(assert (=> b!516611 (= res!316225 (or (= lt!236532 (MissingZero!4330 i!1204)) (= lt!236532 (MissingVacant!4330 i!1204))))))

(assert (=> b!516611 (= lt!236532 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46766 res!316224) b!516616))

(assert (= (and b!516616 res!316231) b!516608))

(assert (= (and b!516608 res!316228) b!516607))

(assert (= (and b!516607 res!316229) b!516615))

(assert (= (and b!516615 res!316232) b!516611))

(assert (= (and b!516611 res!316225) b!516613))

(assert (= (and b!516613 res!316234) b!516606))

(assert (= (and b!516606 res!316233) b!516609))

(assert (= (and b!516609 res!316226) b!516610))

(assert (= (and b!516609 (not res!316227)) b!516614))

(assert (= (and b!516614 (not res!316230)) b!516612))

(declare-fun m!498373 () Bool)

(assert (=> b!516612 m!498373))

(declare-fun m!498375 () Bool)

(assert (=> b!516612 m!498375))

(assert (=> b!516610 m!498375))

(assert (=> b!516610 m!498375))

(declare-fun m!498377 () Bool)

(assert (=> b!516610 m!498377))

(declare-fun m!498379 () Bool)

(assert (=> b!516606 m!498379))

(declare-fun m!498381 () Bool)

(assert (=> b!516615 m!498381))

(declare-fun m!498383 () Bool)

(assert (=> b!516607 m!498383))

(assert (=> b!516608 m!498375))

(assert (=> b!516608 m!498375))

(declare-fun m!498385 () Bool)

(assert (=> b!516608 m!498385))

(declare-fun m!498387 () Bool)

(assert (=> b!516609 m!498387))

(declare-fun m!498389 () Bool)

(assert (=> b!516609 m!498389))

(declare-fun m!498391 () Bool)

(assert (=> b!516609 m!498391))

(declare-fun m!498393 () Bool)

(assert (=> b!516609 m!498393))

(assert (=> b!516609 m!498389))

(assert (=> b!516609 m!498375))

(declare-fun m!498395 () Bool)

(assert (=> b!516609 m!498395))

(assert (=> b!516609 m!498389))

(declare-fun m!498397 () Bool)

(assert (=> b!516609 m!498397))

(assert (=> b!516609 m!498375))

(declare-fun m!498399 () Bool)

(assert (=> b!516609 m!498399))

(assert (=> b!516609 m!498375))

(declare-fun m!498401 () Bool)

(assert (=> b!516609 m!498401))

(declare-fun m!498403 () Bool)

(assert (=> b!516613 m!498403))

(declare-fun m!498405 () Bool)

(assert (=> start!46766 m!498405))

(declare-fun m!498407 () Bool)

(assert (=> start!46766 m!498407))

(declare-fun m!498409 () Bool)

(assert (=> b!516611 m!498409))

(check-sat (not b!516613) (not b!516610) (not start!46766) (not b!516609) (not b!516611) (not b!516615) (not b!516607) (not b!516608) (not b!516606))
(check-sat)
(get-model)

(declare-fun b!516693 () Bool)

(declare-fun e!301509 () Bool)

(declare-fun e!301510 () Bool)

(assert (=> b!516693 (= e!301509 e!301510)))

(declare-fun res!316307 () Bool)

(assert (=> b!516693 (=> (not res!316307) (not e!301510))))

(declare-fun e!301512 () Bool)

(assert (=> b!516693 (= res!316307 (not e!301512))))

(declare-fun res!316308 () Bool)

(assert (=> b!516693 (=> (not res!316308) (not e!301512))))

(assert (=> b!516693 (= res!316308 (validKeyInArray!0 (select (arr!15907 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516694 () Bool)

(declare-fun e!301511 () Bool)

(assert (=> b!516694 (= e!301510 e!301511)))

(declare-fun c!60482 () Bool)

(assert (=> b!516694 (= c!60482 (validKeyInArray!0 (select (arr!15907 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79609 () Bool)

(declare-fun res!316309 () Bool)

(assert (=> d!79609 (=> res!316309 e!301509)))

(assert (=> d!79609 (= res!316309 (bvsge #b00000000000000000000000000000000 (size!16271 a!3235)))))

(assert (=> d!79609 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9969) e!301509)))

(declare-fun b!516695 () Bool)

(declare-fun call!31629 () Bool)

(assert (=> b!516695 (= e!301511 call!31629)))

(declare-fun b!516696 () Bool)

(declare-fun contains!2719 (List!9972 (_ BitVec 64)) Bool)

(assert (=> b!516696 (= e!301512 (contains!2719 Nil!9969 (select (arr!15907 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516697 () Bool)

(assert (=> b!516697 (= e!301511 call!31629)))

(declare-fun bm!31626 () Bool)

(assert (=> bm!31626 (= call!31629 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60482 (Cons!9968 (select (arr!15907 a!3235) #b00000000000000000000000000000000) Nil!9969) Nil!9969)))))

(assert (= (and d!79609 (not res!316309)) b!516693))

(assert (= (and b!516693 res!316308) b!516696))

(assert (= (and b!516693 res!316307) b!516694))

(assert (= (and b!516694 c!60482) b!516695))

(assert (= (and b!516694 (not c!60482)) b!516697))

(assert (= (or b!516695 b!516697) bm!31626))

(declare-fun m!498487 () Bool)

(assert (=> b!516693 m!498487))

(assert (=> b!516693 m!498487))

(declare-fun m!498489 () Bool)

(assert (=> b!516693 m!498489))

(assert (=> b!516694 m!498487))

(assert (=> b!516694 m!498487))

(assert (=> b!516694 m!498489))

(assert (=> b!516696 m!498487))

(assert (=> b!516696 m!498487))

(declare-fun m!498491 () Bool)

(assert (=> b!516696 m!498491))

(assert (=> bm!31626 m!498487))

(declare-fun m!498493 () Bool)

(assert (=> bm!31626 m!498493))

(assert (=> b!516606 d!79609))

(declare-fun d!79611 () Bool)

(assert (=> d!79611 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516607 d!79611))

(declare-fun b!516710 () Bool)

(declare-fun e!301521 () SeekEntryResult!4330)

(assert (=> b!516710 (= e!301521 Undefined!4330)))

(declare-fun b!516711 () Bool)

(declare-fun e!301519 () SeekEntryResult!4330)

(assert (=> b!516711 (= e!301521 e!301519)))

(declare-fun lt!236575 () (_ BitVec 64))

(declare-fun lt!236574 () SeekEntryResult!4330)

(assert (=> b!516711 (= lt!236575 (select (arr!15907 a!3235) (index!19510 lt!236574)))))

(declare-fun c!60489 () Bool)

(assert (=> b!516711 (= c!60489 (= lt!236575 (select (arr!15907 a!3235) j!176)))))

(declare-fun b!516712 () Bool)

(declare-fun e!301520 () SeekEntryResult!4330)

(assert (=> b!516712 (= e!301520 (MissingZero!4330 (index!19510 lt!236574)))))

(declare-fun b!516713 () Bool)

(assert (=> b!516713 (= e!301519 (Found!4330 (index!19510 lt!236574)))))

(declare-fun b!516714 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33079 (_ BitVec 32)) SeekEntryResult!4330)

(assert (=> b!516714 (= e!301520 (seekKeyOrZeroReturnVacant!0 (x!48610 lt!236574) (index!19510 lt!236574) (index!19510 lt!236574) (select (arr!15907 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!516715 () Bool)

(declare-fun c!60490 () Bool)

(assert (=> b!516715 (= c!60490 (= lt!236575 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!516715 (= e!301519 e!301520)))

(declare-fun d!79613 () Bool)

(declare-fun lt!236573 () SeekEntryResult!4330)

(assert (=> d!79613 (and (or ((_ is Undefined!4330) lt!236573) (not ((_ is Found!4330) lt!236573)) (and (bvsge (index!19509 lt!236573) #b00000000000000000000000000000000) (bvslt (index!19509 lt!236573) (size!16271 a!3235)))) (or ((_ is Undefined!4330) lt!236573) ((_ is Found!4330) lt!236573) (not ((_ is MissingZero!4330) lt!236573)) (and (bvsge (index!19508 lt!236573) #b00000000000000000000000000000000) (bvslt (index!19508 lt!236573) (size!16271 a!3235)))) (or ((_ is Undefined!4330) lt!236573) ((_ is Found!4330) lt!236573) ((_ is MissingZero!4330) lt!236573) (not ((_ is MissingVacant!4330) lt!236573)) (and (bvsge (index!19511 lt!236573) #b00000000000000000000000000000000) (bvslt (index!19511 lt!236573) (size!16271 a!3235)))) (or ((_ is Undefined!4330) lt!236573) (ite ((_ is Found!4330) lt!236573) (= (select (arr!15907 a!3235) (index!19509 lt!236573)) (select (arr!15907 a!3235) j!176)) (ite ((_ is MissingZero!4330) lt!236573) (= (select (arr!15907 a!3235) (index!19508 lt!236573)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4330) lt!236573) (= (select (arr!15907 a!3235) (index!19511 lt!236573)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79613 (= lt!236573 e!301521)))

(declare-fun c!60491 () Bool)

(assert (=> d!79613 (= c!60491 (and ((_ is Intermediate!4330) lt!236574) (undefined!5142 lt!236574)))))

(assert (=> d!79613 (= lt!236574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15907 a!3235) j!176) mask!3524) (select (arr!15907 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79613 (validMask!0 mask!3524)))

(assert (=> d!79613 (= (seekEntryOrOpen!0 (select (arr!15907 a!3235) j!176) a!3235 mask!3524) lt!236573)))

(assert (= (and d!79613 c!60491) b!516710))

(assert (= (and d!79613 (not c!60491)) b!516711))

(assert (= (and b!516711 c!60489) b!516713))

(assert (= (and b!516711 (not c!60489)) b!516715))

(assert (= (and b!516715 c!60490) b!516712))

(assert (= (and b!516715 (not c!60490)) b!516714))

(declare-fun m!498495 () Bool)

(assert (=> b!516711 m!498495))

(assert (=> b!516714 m!498375))

(declare-fun m!498497 () Bool)

(assert (=> b!516714 m!498497))

(declare-fun m!498499 () Bool)

(assert (=> d!79613 m!498499))

(assert (=> d!79613 m!498375))

(assert (=> d!79613 m!498399))

(assert (=> d!79613 m!498405))

(declare-fun m!498501 () Bool)

(assert (=> d!79613 m!498501))

(declare-fun m!498503 () Bool)

(assert (=> d!79613 m!498503))

(assert (=> d!79613 m!498399))

(assert (=> d!79613 m!498375))

(declare-fun m!498505 () Bool)

(assert (=> d!79613 m!498505))

(assert (=> b!516610 d!79613))

(declare-fun b!516716 () Bool)

(declare-fun e!301524 () SeekEntryResult!4330)

(assert (=> b!516716 (= e!301524 Undefined!4330)))

(declare-fun b!516717 () Bool)

(declare-fun e!301522 () SeekEntryResult!4330)

(assert (=> b!516717 (= e!301524 e!301522)))

(declare-fun lt!236578 () (_ BitVec 64))

(declare-fun lt!236577 () SeekEntryResult!4330)

(assert (=> b!516717 (= lt!236578 (select (arr!15907 a!3235) (index!19510 lt!236577)))))

(declare-fun c!60492 () Bool)

(assert (=> b!516717 (= c!60492 (= lt!236578 k0!2280))))

(declare-fun b!516718 () Bool)

(declare-fun e!301523 () SeekEntryResult!4330)

(assert (=> b!516718 (= e!301523 (MissingZero!4330 (index!19510 lt!236577)))))

(declare-fun b!516719 () Bool)

(assert (=> b!516719 (= e!301522 (Found!4330 (index!19510 lt!236577)))))

(declare-fun b!516720 () Bool)

(assert (=> b!516720 (= e!301523 (seekKeyOrZeroReturnVacant!0 (x!48610 lt!236577) (index!19510 lt!236577) (index!19510 lt!236577) k0!2280 a!3235 mask!3524))))

(declare-fun b!516721 () Bool)

(declare-fun c!60493 () Bool)

(assert (=> b!516721 (= c!60493 (= lt!236578 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!516721 (= e!301522 e!301523)))

(declare-fun d!79615 () Bool)

(declare-fun lt!236576 () SeekEntryResult!4330)

(assert (=> d!79615 (and (or ((_ is Undefined!4330) lt!236576) (not ((_ is Found!4330) lt!236576)) (and (bvsge (index!19509 lt!236576) #b00000000000000000000000000000000) (bvslt (index!19509 lt!236576) (size!16271 a!3235)))) (or ((_ is Undefined!4330) lt!236576) ((_ is Found!4330) lt!236576) (not ((_ is MissingZero!4330) lt!236576)) (and (bvsge (index!19508 lt!236576) #b00000000000000000000000000000000) (bvslt (index!19508 lt!236576) (size!16271 a!3235)))) (or ((_ is Undefined!4330) lt!236576) ((_ is Found!4330) lt!236576) ((_ is MissingZero!4330) lt!236576) (not ((_ is MissingVacant!4330) lt!236576)) (and (bvsge (index!19511 lt!236576) #b00000000000000000000000000000000) (bvslt (index!19511 lt!236576) (size!16271 a!3235)))) (or ((_ is Undefined!4330) lt!236576) (ite ((_ is Found!4330) lt!236576) (= (select (arr!15907 a!3235) (index!19509 lt!236576)) k0!2280) (ite ((_ is MissingZero!4330) lt!236576) (= (select (arr!15907 a!3235) (index!19508 lt!236576)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4330) lt!236576) (= (select (arr!15907 a!3235) (index!19511 lt!236576)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79615 (= lt!236576 e!301524)))

(declare-fun c!60494 () Bool)

(assert (=> d!79615 (= c!60494 (and ((_ is Intermediate!4330) lt!236577) (undefined!5142 lt!236577)))))

(assert (=> d!79615 (= lt!236577 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79615 (validMask!0 mask!3524)))

(assert (=> d!79615 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!236576)))

(assert (= (and d!79615 c!60494) b!516716))

(assert (= (and d!79615 (not c!60494)) b!516717))

(assert (= (and b!516717 c!60492) b!516719))

(assert (= (and b!516717 (not c!60492)) b!516721))

(assert (= (and b!516721 c!60493) b!516718))

(assert (= (and b!516721 (not c!60493)) b!516720))

(declare-fun m!498507 () Bool)

(assert (=> b!516717 m!498507))

(declare-fun m!498509 () Bool)

(assert (=> b!516720 m!498509))

(declare-fun m!498511 () Bool)

(assert (=> d!79615 m!498511))

(declare-fun m!498513 () Bool)

(assert (=> d!79615 m!498513))

(assert (=> d!79615 m!498405))

(declare-fun m!498515 () Bool)

(assert (=> d!79615 m!498515))

(declare-fun m!498517 () Bool)

(assert (=> d!79615 m!498517))

(assert (=> d!79615 m!498513))

(declare-fun m!498519 () Bool)

(assert (=> d!79615 m!498519))

(assert (=> b!516611 d!79615))

(declare-fun d!79619 () Bool)

(assert (=> d!79619 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46766 d!79619))

(declare-fun d!79625 () Bool)

(assert (=> d!79625 (= (array_inv!11766 a!3235) (bvsge (size!16271 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46766 d!79625))

(declare-fun d!79627 () Bool)

(declare-fun lt!236596 () (_ BitVec 32))

(declare-fun lt!236595 () (_ BitVec 32))

(assert (=> d!79627 (= lt!236596 (bvmul (bvxor lt!236595 (bvlshr lt!236595 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79627 (= lt!236595 ((_ extract 31 0) (bvand (bvxor (select (arr!15907 a!3235) j!176) (bvlshr (select (arr!15907 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79627 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316316 (let ((h!10869 ((_ extract 31 0) (bvand (bvxor (select (arr!15907 a!3235) j!176) (bvlshr (select (arr!15907 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48613 (bvmul (bvxor h!10869 (bvlshr h!10869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48613 (bvlshr x!48613 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316316 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316316 #b00000000000000000000000000000000))))))

(assert (=> d!79627 (= (toIndex!0 (select (arr!15907 a!3235) j!176) mask!3524) (bvand (bvxor lt!236596 (bvlshr lt!236596 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516609 d!79627))

(declare-fun b!516776 () Bool)

(declare-fun e!301561 () Bool)

(declare-fun e!301562 () Bool)

(assert (=> b!516776 (= e!301561 e!301562)))

(declare-fun lt!236621 () (_ BitVec 64))

(assert (=> b!516776 (= lt!236621 (select (arr!15907 a!3235) j!176))))

(declare-fun lt!236623 () Unit!15979)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33079 (_ BitVec 64) (_ BitVec 32)) Unit!15979)

(assert (=> b!516776 (= lt!236623 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236621 j!176))))

(assert (=> b!516776 (arrayContainsKey!0 a!3235 lt!236621 #b00000000000000000000000000000000)))

(declare-fun lt!236622 () Unit!15979)

(assert (=> b!516776 (= lt!236622 lt!236623)))

(declare-fun res!316330 () Bool)

(assert (=> b!516776 (= res!316330 (= (seekEntryOrOpen!0 (select (arr!15907 a!3235) j!176) a!3235 mask!3524) (Found!4330 j!176)))))

(assert (=> b!516776 (=> (not res!316330) (not e!301562))))

(declare-fun b!516777 () Bool)

(declare-fun e!301563 () Bool)

(assert (=> b!516777 (= e!301563 e!301561)))

(declare-fun c!60513 () Bool)

(assert (=> b!516777 (= c!60513 (validKeyInArray!0 (select (arr!15907 a!3235) j!176)))))

(declare-fun d!79629 () Bool)

(declare-fun res!316331 () Bool)

(assert (=> d!79629 (=> res!316331 e!301563)))

(assert (=> d!79629 (= res!316331 (bvsge j!176 (size!16271 a!3235)))))

(assert (=> d!79629 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301563)))

(declare-fun bm!31633 () Bool)

(declare-fun call!31636 () Bool)

(assert (=> bm!31633 (= call!31636 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!516778 () Bool)

(assert (=> b!516778 (= e!301561 call!31636)))

(declare-fun b!516779 () Bool)

(assert (=> b!516779 (= e!301562 call!31636)))

(assert (= (and d!79629 (not res!316331)) b!516777))

(assert (= (and b!516777 c!60513) b!516776))

(assert (= (and b!516777 (not c!60513)) b!516778))

(assert (= (and b!516776 res!316330) b!516779))

(assert (= (or b!516779 b!516778) bm!31633))

(assert (=> b!516776 m!498375))

(declare-fun m!498567 () Bool)

(assert (=> b!516776 m!498567))

(declare-fun m!498569 () Bool)

(assert (=> b!516776 m!498569))

(assert (=> b!516776 m!498375))

(assert (=> b!516776 m!498377))

(assert (=> b!516777 m!498375))

(assert (=> b!516777 m!498375))

(assert (=> b!516777 m!498385))

(declare-fun m!498571 () Bool)

(assert (=> bm!31633 m!498571))

(assert (=> b!516609 d!79629))

(declare-fun b!516840 () Bool)

(declare-fun e!301605 () SeekEntryResult!4330)

(assert (=> b!516840 (= e!301605 (Intermediate!4330 true lt!236534 #b00000000000000000000000000000000))))

(declare-fun b!516841 () Bool)

(declare-fun lt!236640 () SeekEntryResult!4330)

(assert (=> b!516841 (and (bvsge (index!19510 lt!236640) #b00000000000000000000000000000000) (bvslt (index!19510 lt!236640) (size!16271 (array!33080 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235)))))))

(declare-fun res!316358 () Bool)

(assert (=> b!516841 (= res!316358 (= (select (arr!15907 (array!33080 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235))) (index!19510 lt!236640)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301602 () Bool)

(assert (=> b!516841 (=> res!316358 e!301602)))

(declare-fun d!79643 () Bool)

(declare-fun e!301604 () Bool)

(assert (=> d!79643 e!301604))

(declare-fun c!60533 () Bool)

(assert (=> d!79643 (= c!60533 (and ((_ is Intermediate!4330) lt!236640) (undefined!5142 lt!236640)))))

(assert (=> d!79643 (= lt!236640 e!301605)))

(declare-fun c!60534 () Bool)

(assert (=> d!79643 (= c!60534 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!236641 () (_ BitVec 64))

(assert (=> d!79643 (= lt!236641 (select (arr!15907 (array!33080 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235))) lt!236534))))

(assert (=> d!79643 (validMask!0 mask!3524)))

(assert (=> d!79643 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236534 (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) (array!33080 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235)) mask!3524) lt!236640)))

(declare-fun b!516842 () Bool)

(assert (=> b!516842 (and (bvsge (index!19510 lt!236640) #b00000000000000000000000000000000) (bvslt (index!19510 lt!236640) (size!16271 (array!33080 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235)))))))

(declare-fun res!316359 () Bool)

(assert (=> b!516842 (= res!316359 (= (select (arr!15907 (array!33080 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235))) (index!19510 lt!236640)) (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!516842 (=> res!316359 e!301602)))

(declare-fun e!301601 () Bool)

(assert (=> b!516842 (= e!301601 e!301602)))

(declare-fun b!516843 () Bool)

(assert (=> b!516843 (= e!301604 (bvsge (x!48610 lt!236640) #b01111111111111111111111111111110))))

(declare-fun b!516844 () Bool)

(declare-fun e!301603 () SeekEntryResult!4330)

(assert (=> b!516844 (= e!301605 e!301603)))

(declare-fun c!60532 () Bool)

(assert (=> b!516844 (= c!60532 (or (= lt!236641 (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!236641 lt!236641) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516845 () Bool)

(assert (=> b!516845 (and (bvsge (index!19510 lt!236640) #b00000000000000000000000000000000) (bvslt (index!19510 lt!236640) (size!16271 (array!33080 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235)))))))

(assert (=> b!516845 (= e!301602 (= (select (arr!15907 (array!33080 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235))) (index!19510 lt!236640)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!516846 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516846 (= e!301603 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236534 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) (array!33080 (store (arr!15907 a!3235) i!1204 k0!2280) (size!16271 a!3235)) mask!3524))))

(declare-fun b!516847 () Bool)

(assert (=> b!516847 (= e!301604 e!301601)))

(declare-fun res!316357 () Bool)

(assert (=> b!516847 (= res!316357 (and ((_ is Intermediate!4330) lt!236640) (not (undefined!5142 lt!236640)) (bvslt (x!48610 lt!236640) #b01111111111111111111111111111110) (bvsge (x!48610 lt!236640) #b00000000000000000000000000000000) (bvsge (x!48610 lt!236640) #b00000000000000000000000000000000)))))

(assert (=> b!516847 (=> (not res!316357) (not e!301601))))

(declare-fun b!516848 () Bool)

(assert (=> b!516848 (= e!301603 (Intermediate!4330 false lt!236534 #b00000000000000000000000000000000))))

(assert (= (and d!79643 c!60534) b!516840))

(assert (= (and d!79643 (not c!60534)) b!516844))

(assert (= (and b!516844 c!60532) b!516848))

(assert (= (and b!516844 (not c!60532)) b!516846))

(assert (= (and d!79643 c!60533) b!516843))

(assert (= (and d!79643 (not c!60533)) b!516847))

(assert (= (and b!516847 res!316357) b!516842))

(assert (= (and b!516842 (not res!316359)) b!516841))

(assert (= (and b!516841 (not res!316358)) b!516845))

(declare-fun m!498589 () Bool)

(assert (=> b!516846 m!498589))

(assert (=> b!516846 m!498589))

(assert (=> b!516846 m!498389))

(declare-fun m!498591 () Bool)

(assert (=> b!516846 m!498591))

(declare-fun m!498593 () Bool)

(assert (=> b!516841 m!498593))

(assert (=> b!516842 m!498593))

(declare-fun m!498595 () Bool)

(assert (=> d!79643 m!498595))

(assert (=> d!79643 m!498405))

(assert (=> b!516845 m!498593))

(assert (=> b!516609 d!79643))

(declare-fun d!79655 () Bool)

(assert (=> d!79655 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236650 () Unit!15979)

(declare-fun choose!38 (array!33079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15979)

(assert (=> d!79655 (= lt!236650 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79655 (validMask!0 mask!3524)))

(assert (=> d!79655 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236650)))

(declare-fun bs!16343 () Bool)

(assert (= bs!16343 d!79655))

(assert (=> bs!16343 m!498395))

(declare-fun m!498605 () Bool)

(assert (=> bs!16343 m!498605))

(assert (=> bs!16343 m!498405))

(assert (=> b!516609 d!79655))

(declare-fun d!79659 () Bool)

(declare-fun lt!236656 () (_ BitVec 32))

(declare-fun lt!236655 () (_ BitVec 32))

(assert (=> d!79659 (= lt!236656 (bvmul (bvxor lt!236655 (bvlshr lt!236655 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79659 (= lt!236655 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79659 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316316 (let ((h!10869 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48613 (bvmul (bvxor h!10869 (bvlshr h!10869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48613 (bvlshr x!48613 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316316 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316316 #b00000000000000000000000000000000))))))

(assert (=> d!79659 (= (toIndex!0 (select (store (arr!15907 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!236656 (bvlshr lt!236656 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516609 d!79659))

(declare-fun b!516866 () Bool)

(declare-fun e!301621 () SeekEntryResult!4330)

(assert (=> b!516866 (= e!301621 (Intermediate!4330 true lt!236536 #b00000000000000000000000000000000))))

(declare-fun b!516867 () Bool)

(declare-fun lt!236658 () SeekEntryResult!4330)

(assert (=> b!516867 (and (bvsge (index!19510 lt!236658) #b00000000000000000000000000000000) (bvslt (index!19510 lt!236658) (size!16271 a!3235)))))

(declare-fun res!316368 () Bool)

(assert (=> b!516867 (= res!316368 (= (select (arr!15907 a!3235) (index!19510 lt!236658)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301618 () Bool)

(assert (=> b!516867 (=> res!316368 e!301618)))

(declare-fun d!79661 () Bool)

(declare-fun e!301620 () Bool)

(assert (=> d!79661 e!301620))

(declare-fun c!60541 () Bool)

(assert (=> d!79661 (= c!60541 (and ((_ is Intermediate!4330) lt!236658) (undefined!5142 lt!236658)))))

(assert (=> d!79661 (= lt!236658 e!301621)))

(declare-fun c!60542 () Bool)

(assert (=> d!79661 (= c!60542 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!236659 () (_ BitVec 64))

(assert (=> d!79661 (= lt!236659 (select (arr!15907 a!3235) lt!236536))))

(assert (=> d!79661 (validMask!0 mask!3524)))

(assert (=> d!79661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236536 (select (arr!15907 a!3235) j!176) a!3235 mask!3524) lt!236658)))

(declare-fun b!516868 () Bool)

(assert (=> b!516868 (and (bvsge (index!19510 lt!236658) #b00000000000000000000000000000000) (bvslt (index!19510 lt!236658) (size!16271 a!3235)))))

(declare-fun res!316369 () Bool)

(assert (=> b!516868 (= res!316369 (= (select (arr!15907 a!3235) (index!19510 lt!236658)) (select (arr!15907 a!3235) j!176)))))

(assert (=> b!516868 (=> res!316369 e!301618)))

(declare-fun e!301617 () Bool)

(assert (=> b!516868 (= e!301617 e!301618)))

(declare-fun b!516869 () Bool)

(assert (=> b!516869 (= e!301620 (bvsge (x!48610 lt!236658) #b01111111111111111111111111111110))))

(declare-fun b!516870 () Bool)

(declare-fun e!301619 () SeekEntryResult!4330)

(assert (=> b!516870 (= e!301621 e!301619)))

(declare-fun c!60540 () Bool)

(assert (=> b!516870 (= c!60540 (or (= lt!236659 (select (arr!15907 a!3235) j!176)) (= (bvadd lt!236659 lt!236659) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516871 () Bool)

(assert (=> b!516871 (and (bvsge (index!19510 lt!236658) #b00000000000000000000000000000000) (bvslt (index!19510 lt!236658) (size!16271 a!3235)))))

(assert (=> b!516871 (= e!301618 (= (select (arr!15907 a!3235) (index!19510 lt!236658)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!516872 () Bool)

(assert (=> b!516872 (= e!301619 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236536 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15907 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!516873 () Bool)

(assert (=> b!516873 (= e!301620 e!301617)))

(declare-fun res!316367 () Bool)

(assert (=> b!516873 (= res!316367 (and ((_ is Intermediate!4330) lt!236658) (not (undefined!5142 lt!236658)) (bvslt (x!48610 lt!236658) #b01111111111111111111111111111110) (bvsge (x!48610 lt!236658) #b00000000000000000000000000000000) (bvsge (x!48610 lt!236658) #b00000000000000000000000000000000)))))

(assert (=> b!516873 (=> (not res!316367) (not e!301617))))

(declare-fun b!516874 () Bool)

(assert (=> b!516874 (= e!301619 (Intermediate!4330 false lt!236536 #b00000000000000000000000000000000))))

(assert (= (and d!79661 c!60542) b!516866))

(assert (= (and d!79661 (not c!60542)) b!516870))

(assert (= (and b!516870 c!60540) b!516874))

(assert (= (and b!516870 (not c!60540)) b!516872))

(assert (= (and d!79661 c!60541) b!516869))

(assert (= (and d!79661 (not c!60541)) b!516873))

(assert (= (and b!516873 res!316367) b!516868))

(assert (= (and b!516868 (not res!316369)) b!516867))

(assert (= (and b!516867 (not res!316368)) b!516871))

(declare-fun m!498609 () Bool)

(assert (=> b!516872 m!498609))

(assert (=> b!516872 m!498609))

(assert (=> b!516872 m!498375))

(declare-fun m!498611 () Bool)

(assert (=> b!516872 m!498611))

(declare-fun m!498613 () Bool)

(assert (=> b!516867 m!498613))

(assert (=> b!516868 m!498613))

(declare-fun m!498615 () Bool)

(assert (=> d!79661 m!498615))

(assert (=> d!79661 m!498405))

(assert (=> b!516871 m!498613))

(assert (=> b!516609 d!79661))

(declare-fun d!79667 () Bool)

(declare-fun res!316379 () Bool)

(declare-fun e!301633 () Bool)

(assert (=> d!79667 (=> res!316379 e!301633)))

(assert (=> d!79667 (= res!316379 (= (select (arr!15907 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79667 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!301633)))

(declare-fun b!516885 () Bool)

(declare-fun e!301634 () Bool)

(assert (=> b!516885 (= e!301633 e!301634)))

(declare-fun res!316381 () Bool)

(assert (=> b!516885 (=> (not res!316381) (not e!301634))))

(assert (=> b!516885 (= res!316381 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16271 a!3235)))))

(declare-fun b!516886 () Bool)

(assert (=> b!516886 (= e!301634 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79667 (not res!316379)) b!516885))

(assert (= (and b!516885 res!316381) b!516886))

(assert (=> d!79667 m!498487))

(declare-fun m!498623 () Bool)

(assert (=> b!516886 m!498623))

(assert (=> b!516615 d!79667))

(declare-fun b!516895 () Bool)

(declare-fun e!301639 () Bool)

(declare-fun e!301640 () Bool)

(assert (=> b!516895 (= e!301639 e!301640)))

(declare-fun lt!236665 () (_ BitVec 64))

(assert (=> b!516895 (= lt!236665 (select (arr!15907 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236667 () Unit!15979)

(assert (=> b!516895 (= lt!236667 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236665 #b00000000000000000000000000000000))))

(assert (=> b!516895 (arrayContainsKey!0 a!3235 lt!236665 #b00000000000000000000000000000000)))

(declare-fun lt!236666 () Unit!15979)

(assert (=> b!516895 (= lt!236666 lt!236667)))

(declare-fun res!316384 () Bool)

(assert (=> b!516895 (= res!316384 (= (seekEntryOrOpen!0 (select (arr!15907 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4330 #b00000000000000000000000000000000)))))

(assert (=> b!516895 (=> (not res!316384) (not e!301640))))

(declare-fun b!516896 () Bool)

(declare-fun e!301641 () Bool)

(assert (=> b!516896 (= e!301641 e!301639)))

(declare-fun c!60546 () Bool)

(assert (=> b!516896 (= c!60546 (validKeyInArray!0 (select (arr!15907 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79671 () Bool)

(declare-fun res!316385 () Bool)

(assert (=> d!79671 (=> res!316385 e!301641)))

(assert (=> d!79671 (= res!316385 (bvsge #b00000000000000000000000000000000 (size!16271 a!3235)))))

(assert (=> d!79671 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301641)))

(declare-fun bm!31640 () Bool)

(declare-fun call!31643 () Bool)

(assert (=> bm!31640 (= call!31643 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!516897 () Bool)

(assert (=> b!516897 (= e!301639 call!31643)))

(declare-fun b!516898 () Bool)

(assert (=> b!516898 (= e!301640 call!31643)))

(assert (= (and d!79671 (not res!316385)) b!516896))

(assert (= (and b!516896 c!60546) b!516895))

(assert (= (and b!516896 (not c!60546)) b!516897))

(assert (= (and b!516895 res!316384) b!516898))

(assert (= (or b!516898 b!516897) bm!31640))

(assert (=> b!516895 m!498487))

(declare-fun m!498625 () Bool)

(assert (=> b!516895 m!498625))

(declare-fun m!498627 () Bool)

(assert (=> b!516895 m!498627))

(assert (=> b!516895 m!498487))

(declare-fun m!498629 () Bool)

(assert (=> b!516895 m!498629))

(assert (=> b!516896 m!498487))

(assert (=> b!516896 m!498487))

(assert (=> b!516896 m!498489))

(declare-fun m!498631 () Bool)

(assert (=> bm!31640 m!498631))

(assert (=> b!516613 d!79671))

(declare-fun d!79673 () Bool)

(assert (=> d!79673 (= (validKeyInArray!0 (select (arr!15907 a!3235) j!176)) (and (not (= (select (arr!15907 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15907 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516608 d!79673))

(check-sat (not bm!31640) (not bm!31626) (not d!79655) (not b!516872) (not b!516896) (not d!79613) (not b!516693) (not d!79661) (not b!516714) (not b!516694) (not bm!31633) (not d!79643) (not b!516895) (not b!516696) (not b!516886) (not b!516776) (not d!79615) (not b!516720) (not b!516777) (not b!516846))
(check-sat)
