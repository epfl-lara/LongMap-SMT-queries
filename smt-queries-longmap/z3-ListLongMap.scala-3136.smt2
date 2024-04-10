; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44114 () Bool)

(assert start!44114)

(declare-fun b!486095 () Bool)

(declare-fun e!286121 () Bool)

(declare-datatypes ((array!31482 0))(
  ( (array!31483 (arr!15139 (Array (_ BitVec 32) (_ BitVec 64))) (size!15503 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31482)

(assert (=> b!486095 (= e!286121 (and (bvsle #b00000000000000000000000000000000 (size!15503 a!3235)) (bvsge (size!15503 a!3235) #b01111111111111111111111111111111)))))

(declare-fun res!289701 () Bool)

(declare-fun e!286120 () Bool)

(assert (=> start!44114 (=> (not res!289701) (not e!286120))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44114 (= res!289701 (validMask!0 mask!3524))))

(assert (=> start!44114 e!286120))

(assert (=> start!44114 true))

(declare-fun array_inv!10935 (array!31482) Bool)

(assert (=> start!44114 (array_inv!10935 a!3235)))

(declare-fun b!486096 () Bool)

(declare-fun res!289697 () Bool)

(assert (=> b!486096 (=> (not res!289697) (not e!286120))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486096 (= res!289697 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486097 () Bool)

(declare-fun res!289703 () Bool)

(assert (=> b!486097 (=> (not res!289703) (not e!286120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486097 (= res!289703 (validKeyInArray!0 k0!2280))))

(declare-fun b!486098 () Bool)

(declare-fun res!289702 () Bool)

(assert (=> b!486098 (=> (not res!289702) (not e!286120))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486098 (= res!289702 (and (= (size!15503 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15503 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15503 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486099 () Bool)

(assert (=> b!486099 (= e!286120 e!286121)))

(declare-fun res!289698 () Bool)

(assert (=> b!486099 (=> (not res!289698) (not e!286121))))

(declare-datatypes ((SeekEntryResult!3606 0))(
  ( (MissingZero!3606 (index!16603 (_ BitVec 32))) (Found!3606 (index!16604 (_ BitVec 32))) (Intermediate!3606 (undefined!4418 Bool) (index!16605 (_ BitVec 32)) (x!45738 (_ BitVec 32))) (Undefined!3606) (MissingVacant!3606 (index!16606 (_ BitVec 32))) )
))
(declare-fun lt!219625 () SeekEntryResult!3606)

(assert (=> b!486099 (= res!289698 (or (= lt!219625 (MissingZero!3606 i!1204)) (= lt!219625 (MissingVacant!3606 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31482 (_ BitVec 32)) SeekEntryResult!3606)

(assert (=> b!486099 (= lt!219625 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486100 () Bool)

(declare-fun res!289699 () Bool)

(assert (=> b!486100 (=> (not res!289699) (not e!286121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31482 (_ BitVec 32)) Bool)

(assert (=> b!486100 (= res!289699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486101 () Bool)

(declare-fun res!289700 () Bool)

(assert (=> b!486101 (=> (not res!289700) (not e!286120))))

(assert (=> b!486101 (= res!289700 (validKeyInArray!0 (select (arr!15139 a!3235) j!176)))))

(assert (= (and start!44114 res!289701) b!486098))

(assert (= (and b!486098 res!289702) b!486101))

(assert (= (and b!486101 res!289700) b!486097))

(assert (= (and b!486097 res!289703) b!486096))

(assert (= (and b!486096 res!289697) b!486099))

(assert (= (and b!486099 res!289698) b!486100))

(assert (= (and b!486100 res!289699) b!486095))

(declare-fun m!466129 () Bool)

(assert (=> start!44114 m!466129))

(declare-fun m!466131 () Bool)

(assert (=> start!44114 m!466131))

(declare-fun m!466133 () Bool)

(assert (=> b!486099 m!466133))

(declare-fun m!466135 () Bool)

(assert (=> b!486096 m!466135))

(declare-fun m!466137 () Bool)

(assert (=> b!486097 m!466137))

(declare-fun m!466139 () Bool)

(assert (=> b!486101 m!466139))

(assert (=> b!486101 m!466139))

(declare-fun m!466141 () Bool)

(assert (=> b!486101 m!466141))

(declare-fun m!466143 () Bool)

(assert (=> b!486100 m!466143))

(check-sat (not b!486099) (not b!486101) (not b!486097) (not b!486100) (not start!44114) (not b!486096))
(check-sat)
(get-model)

(declare-fun b!486135 () Bool)

(declare-fun e!286138 () SeekEntryResult!3606)

(declare-fun lt!219635 () SeekEntryResult!3606)

(assert (=> b!486135 (= e!286138 (Found!3606 (index!16605 lt!219635)))))

(declare-fun b!486136 () Bool)

(declare-fun e!286140 () SeekEntryResult!3606)

(assert (=> b!486136 (= e!286140 (MissingZero!3606 (index!16605 lt!219635)))))

(declare-fun d!77457 () Bool)

(declare-fun lt!219637 () SeekEntryResult!3606)

(get-info :version)

(assert (=> d!77457 (and (or ((_ is Undefined!3606) lt!219637) (not ((_ is Found!3606) lt!219637)) (and (bvsge (index!16604 lt!219637) #b00000000000000000000000000000000) (bvslt (index!16604 lt!219637) (size!15503 a!3235)))) (or ((_ is Undefined!3606) lt!219637) ((_ is Found!3606) lt!219637) (not ((_ is MissingZero!3606) lt!219637)) (and (bvsge (index!16603 lt!219637) #b00000000000000000000000000000000) (bvslt (index!16603 lt!219637) (size!15503 a!3235)))) (or ((_ is Undefined!3606) lt!219637) ((_ is Found!3606) lt!219637) ((_ is MissingZero!3606) lt!219637) (not ((_ is MissingVacant!3606) lt!219637)) (and (bvsge (index!16606 lt!219637) #b00000000000000000000000000000000) (bvslt (index!16606 lt!219637) (size!15503 a!3235)))) (or ((_ is Undefined!3606) lt!219637) (ite ((_ is Found!3606) lt!219637) (= (select (arr!15139 a!3235) (index!16604 lt!219637)) k0!2280) (ite ((_ is MissingZero!3606) lt!219637) (= (select (arr!15139 a!3235) (index!16603 lt!219637)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3606) lt!219637) (= (select (arr!15139 a!3235) (index!16606 lt!219637)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!286139 () SeekEntryResult!3606)

(assert (=> d!77457 (= lt!219637 e!286139)))

(declare-fun c!58475 () Bool)

(assert (=> d!77457 (= c!58475 (and ((_ is Intermediate!3606) lt!219635) (undefined!4418 lt!219635)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31482 (_ BitVec 32)) SeekEntryResult!3606)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77457 (= lt!219635 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77457 (validMask!0 mask!3524)))

(assert (=> d!77457 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!219637)))

(declare-fun b!486137 () Bool)

(assert (=> b!486137 (= e!286139 e!286138)))

(declare-fun lt!219636 () (_ BitVec 64))

(assert (=> b!486137 (= lt!219636 (select (arr!15139 a!3235) (index!16605 lt!219635)))))

(declare-fun c!58474 () Bool)

(assert (=> b!486137 (= c!58474 (= lt!219636 k0!2280))))

(declare-fun b!486138 () Bool)

(declare-fun c!58473 () Bool)

(assert (=> b!486138 (= c!58473 (= lt!219636 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!486138 (= e!286138 e!286140)))

(declare-fun b!486139 () Bool)

(assert (=> b!486139 (= e!286139 Undefined!3606)))

(declare-fun b!486140 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31482 (_ BitVec 32)) SeekEntryResult!3606)

(assert (=> b!486140 (= e!286140 (seekKeyOrZeroReturnVacant!0 (x!45738 lt!219635) (index!16605 lt!219635) (index!16605 lt!219635) k0!2280 a!3235 mask!3524))))

(assert (= (and d!77457 c!58475) b!486139))

(assert (= (and d!77457 (not c!58475)) b!486137))

(assert (= (and b!486137 c!58474) b!486135))

(assert (= (and b!486137 (not c!58474)) b!486138))

(assert (= (and b!486138 c!58473) b!486136))

(assert (= (and b!486138 (not c!58473)) b!486140))

(declare-fun m!466161 () Bool)

(assert (=> d!77457 m!466161))

(declare-fun m!466163 () Bool)

(assert (=> d!77457 m!466163))

(assert (=> d!77457 m!466161))

(declare-fun m!466165 () Bool)

(assert (=> d!77457 m!466165))

(declare-fun m!466167 () Bool)

(assert (=> d!77457 m!466167))

(declare-fun m!466169 () Bool)

(assert (=> d!77457 m!466169))

(assert (=> d!77457 m!466129))

(declare-fun m!466171 () Bool)

(assert (=> b!486137 m!466171))

(declare-fun m!466173 () Bool)

(assert (=> b!486140 m!466173))

(assert (=> b!486099 d!77457))

(declare-fun d!77463 () Bool)

(assert (=> d!77463 (= (validKeyInArray!0 (select (arr!15139 a!3235) j!176)) (and (not (= (select (arr!15139 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15139 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486101 d!77463))

(declare-fun d!77465 () Bool)

(declare-fun res!289729 () Bool)

(declare-fun e!286165 () Bool)

(assert (=> d!77465 (=> res!289729 e!286165)))

(assert (=> d!77465 (= res!289729 (bvsge #b00000000000000000000000000000000 (size!15503 a!3235)))))

(assert (=> d!77465 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286165)))

(declare-fun b!486185 () Bool)

(declare-fun e!286166 () Bool)

(declare-fun e!286167 () Bool)

(assert (=> b!486185 (= e!286166 e!286167)))

(declare-fun lt!219663 () (_ BitVec 64))

(assert (=> b!486185 (= lt!219663 (select (arr!15139 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14188 0))(
  ( (Unit!14189) )
))
(declare-fun lt!219662 () Unit!14188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31482 (_ BitVec 64) (_ BitVec 32)) Unit!14188)

(assert (=> b!486185 (= lt!219662 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219663 #b00000000000000000000000000000000))))

(assert (=> b!486185 (arrayContainsKey!0 a!3235 lt!219663 #b00000000000000000000000000000000)))

(declare-fun lt!219664 () Unit!14188)

(assert (=> b!486185 (= lt!219664 lt!219662)))

(declare-fun res!289730 () Bool)

(assert (=> b!486185 (= res!289730 (= (seekEntryOrOpen!0 (select (arr!15139 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3606 #b00000000000000000000000000000000)))))

(assert (=> b!486185 (=> (not res!289730) (not e!286167))))

(declare-fun b!486186 () Bool)

(declare-fun call!31259 () Bool)

(assert (=> b!486186 (= e!286167 call!31259)))

(declare-fun b!486187 () Bool)

(assert (=> b!486187 (= e!286166 call!31259)))

(declare-fun b!486188 () Bool)

(assert (=> b!486188 (= e!286165 e!286166)))

(declare-fun c!58496 () Bool)

(assert (=> b!486188 (= c!58496 (validKeyInArray!0 (select (arr!15139 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31256 () Bool)

(assert (=> bm!31256 (= call!31259 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!77465 (not res!289729)) b!486188))

(assert (= (and b!486188 c!58496) b!486185))

(assert (= (and b!486188 (not c!58496)) b!486187))

(assert (= (and b!486185 res!289730) b!486186))

(assert (= (or b!486186 b!486187) bm!31256))

(declare-fun m!466193 () Bool)

(assert (=> b!486185 m!466193))

(declare-fun m!466197 () Bool)

(assert (=> b!486185 m!466197))

(declare-fun m!466201 () Bool)

(assert (=> b!486185 m!466201))

(assert (=> b!486185 m!466193))

(declare-fun m!466205 () Bool)

(assert (=> b!486185 m!466205))

(assert (=> b!486188 m!466193))

(assert (=> b!486188 m!466193))

(declare-fun m!466211 () Bool)

(assert (=> b!486188 m!466211))

(declare-fun m!466213 () Bool)

(assert (=> bm!31256 m!466213))

(assert (=> b!486100 d!77465))

(declare-fun d!77473 () Bool)

(assert (=> d!77473 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44114 d!77473))

(declare-fun d!77481 () Bool)

(assert (=> d!77481 (= (array_inv!10935 a!3235) (bvsge (size!15503 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44114 d!77481))

(declare-fun d!77483 () Bool)

(assert (=> d!77483 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486097 d!77483))

(declare-fun d!77487 () Bool)

(declare-fun res!289747 () Bool)

(declare-fun e!286190 () Bool)

(assert (=> d!77487 (=> res!289747 e!286190)))

(assert (=> d!77487 (= res!289747 (= (select (arr!15139 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77487 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!286190)))

(declare-fun b!486217 () Bool)

(declare-fun e!286191 () Bool)

(assert (=> b!486217 (= e!286190 e!286191)))

(declare-fun res!289748 () Bool)

(assert (=> b!486217 (=> (not res!289748) (not e!286191))))

(assert (=> b!486217 (= res!289748 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15503 a!3235)))))

(declare-fun b!486218 () Bool)

(assert (=> b!486218 (= e!286191 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77487 (not res!289747)) b!486217))

(assert (= (and b!486217 res!289748) b!486218))

(assert (=> d!77487 m!466193))

(declare-fun m!466239 () Bool)

(assert (=> b!486218 m!466239))

(assert (=> b!486096 d!77487))

(check-sat (not b!486140) (not b!486185) (not bm!31256) (not b!486218) (not b!486188) (not d!77457))
(check-sat)
