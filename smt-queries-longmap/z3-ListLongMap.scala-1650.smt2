; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30682 () Bool)

(assert start!30682)

(declare-fun b!308072 () Bool)

(declare-fun res!164834 () Bool)

(declare-fun e!192701 () Bool)

(assert (=> b!308072 (=> (not res!164834) (not e!192701))))

(declare-datatypes ((array!15686 0))(
  ( (array!15687 (arr!7428 (Array (_ BitVec 32) (_ BitVec 64))) (size!7780 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15686)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308072 (= res!164834 (and (= (select (arr!7428 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7780 a!3293))))))

(declare-fun b!308073 () Bool)

(declare-fun res!164835 () Bool)

(declare-fun e!192702 () Bool)

(assert (=> b!308073 (=> (not res!164835) (not e!192702))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15686 (_ BitVec 32)) Bool)

(assert (=> b!308073 (= res!164835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308074 () Bool)

(declare-fun res!164830 () Bool)

(assert (=> b!308074 (=> (not res!164830) (not e!192702))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308074 (= res!164830 (validKeyInArray!0 k0!2441))))

(declare-fun b!308075 () Bool)

(declare-fun res!164826 () Bool)

(assert (=> b!308075 (=> (not res!164826) (not e!192702))))

(assert (=> b!308075 (= res!164826 (and (= (size!7780 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7780 a!3293))))))

(declare-fun b!308076 () Bool)

(assert (=> b!308076 (= e!192702 e!192701)))

(declare-fun res!164829 () Bool)

(assert (=> b!308076 (=> (not res!164829) (not e!192701))))

(declare-datatypes ((SeekEntryResult!2568 0))(
  ( (MissingZero!2568 (index!12448 (_ BitVec 32))) (Found!2568 (index!12449 (_ BitVec 32))) (Intermediate!2568 (undefined!3380 Bool) (index!12450 (_ BitVec 32)) (x!30683 (_ BitVec 32))) (Undefined!2568) (MissingVacant!2568 (index!12451 (_ BitVec 32))) )
))
(declare-fun lt!151233 () SeekEntryResult!2568)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15686 (_ BitVec 32)) SeekEntryResult!2568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308076 (= res!164829 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151233))))

(assert (=> b!308076 (= lt!151233 (Intermediate!2568 false resIndex!52 resX!52))))

(declare-fun b!308077 () Bool)

(declare-fun res!164831 () Bool)

(assert (=> b!308077 (=> (not res!164831) (not e!192702))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15686 (_ BitVec 32)) SeekEntryResult!2568)

(assert (=> b!308077 (= res!164831 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2568 i!1240)))))

(declare-fun res!164833 () Bool)

(assert (=> start!30682 (=> (not res!164833) (not e!192702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30682 (= res!164833 (validMask!0 mask!3709))))

(assert (=> start!30682 e!192702))

(declare-fun array_inv!5391 (array!15686) Bool)

(assert (=> start!30682 (array_inv!5391 a!3293)))

(assert (=> start!30682 true))

(declare-fun b!308078 () Bool)

(declare-fun res!164827 () Bool)

(assert (=> b!308078 (=> (not res!164827) (not e!192701))))

(assert (=> b!308078 (= res!164827 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151233))))

(declare-fun b!308079 () Bool)

(declare-fun res!164832 () Bool)

(assert (=> b!308079 (=> (not res!164832) (not e!192701))))

(assert (=> b!308079 (= res!164832 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7428 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308080 () Bool)

(declare-fun lt!151232 () (_ BitVec 32))

(assert (=> b!308080 (= e!192701 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!151232 #b00000000000000000000000000000000) (bvsge lt!151232 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308080 (= lt!151232 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!308081 () Bool)

(declare-fun res!164828 () Bool)

(assert (=> b!308081 (=> (not res!164828) (not e!192702))))

(declare-fun arrayContainsKey!0 (array!15686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308081 (= res!164828 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30682 res!164833) b!308075))

(assert (= (and b!308075 res!164826) b!308074))

(assert (= (and b!308074 res!164830) b!308081))

(assert (= (and b!308081 res!164828) b!308077))

(assert (= (and b!308077 res!164831) b!308073))

(assert (= (and b!308073 res!164835) b!308076))

(assert (= (and b!308076 res!164829) b!308072))

(assert (= (and b!308072 res!164834) b!308078))

(assert (= (and b!308078 res!164827) b!308079))

(assert (= (and b!308079 res!164832) b!308080))

(declare-fun m!318257 () Bool)

(assert (=> b!308073 m!318257))

(declare-fun m!318259 () Bool)

(assert (=> b!308079 m!318259))

(declare-fun m!318261 () Bool)

(assert (=> b!308078 m!318261))

(declare-fun m!318263 () Bool)

(assert (=> start!30682 m!318263))

(declare-fun m!318265 () Bool)

(assert (=> start!30682 m!318265))

(declare-fun m!318267 () Bool)

(assert (=> b!308077 m!318267))

(declare-fun m!318269 () Bool)

(assert (=> b!308081 m!318269))

(declare-fun m!318271 () Bool)

(assert (=> b!308072 m!318271))

(declare-fun m!318273 () Bool)

(assert (=> b!308074 m!318273))

(declare-fun m!318275 () Bool)

(assert (=> b!308076 m!318275))

(assert (=> b!308076 m!318275))

(declare-fun m!318277 () Bool)

(assert (=> b!308076 m!318277))

(declare-fun m!318279 () Bool)

(assert (=> b!308080 m!318279))

(check-sat (not b!308076) (not b!308073) (not start!30682) (not b!308074) (not b!308077) (not b!308080) (not b!308081) (not b!308078))
(check-sat)
(get-model)

(declare-fun b!308124 () Bool)

(declare-fun e!192719 () SeekEntryResult!2568)

(declare-fun lt!151247 () SeekEntryResult!2568)

(assert (=> b!308124 (= e!192719 (Found!2568 (index!12450 lt!151247)))))

(declare-fun d!68253 () Bool)

(declare-fun lt!151248 () SeekEntryResult!2568)

(get-info :version)

(assert (=> d!68253 (and (or ((_ is Undefined!2568) lt!151248) (not ((_ is Found!2568) lt!151248)) (and (bvsge (index!12449 lt!151248) #b00000000000000000000000000000000) (bvslt (index!12449 lt!151248) (size!7780 a!3293)))) (or ((_ is Undefined!2568) lt!151248) ((_ is Found!2568) lt!151248) (not ((_ is MissingZero!2568) lt!151248)) (and (bvsge (index!12448 lt!151248) #b00000000000000000000000000000000) (bvslt (index!12448 lt!151248) (size!7780 a!3293)))) (or ((_ is Undefined!2568) lt!151248) ((_ is Found!2568) lt!151248) ((_ is MissingZero!2568) lt!151248) (not ((_ is MissingVacant!2568) lt!151248)) (and (bvsge (index!12451 lt!151248) #b00000000000000000000000000000000) (bvslt (index!12451 lt!151248) (size!7780 a!3293)))) (or ((_ is Undefined!2568) lt!151248) (ite ((_ is Found!2568) lt!151248) (= (select (arr!7428 a!3293) (index!12449 lt!151248)) k0!2441) (ite ((_ is MissingZero!2568) lt!151248) (= (select (arr!7428 a!3293) (index!12448 lt!151248)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2568) lt!151248) (= (select (arr!7428 a!3293) (index!12451 lt!151248)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!192721 () SeekEntryResult!2568)

(assert (=> d!68253 (= lt!151248 e!192721)))

(declare-fun c!49233 () Bool)

(assert (=> d!68253 (= c!49233 (and ((_ is Intermediate!2568) lt!151247) (undefined!3380 lt!151247)))))

(assert (=> d!68253 (= lt!151247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68253 (validMask!0 mask!3709)))

(assert (=> d!68253 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!151248)))

(declare-fun b!308125 () Bool)

(declare-fun c!49232 () Bool)

(declare-fun lt!151246 () (_ BitVec 64))

(assert (=> b!308125 (= c!49232 (= lt!151246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!192720 () SeekEntryResult!2568)

(assert (=> b!308125 (= e!192719 e!192720)))

(declare-fun b!308126 () Bool)

(assert (=> b!308126 (= e!192721 e!192719)))

(assert (=> b!308126 (= lt!151246 (select (arr!7428 a!3293) (index!12450 lt!151247)))))

(declare-fun c!49231 () Bool)

(assert (=> b!308126 (= c!49231 (= lt!151246 k0!2441))))

(declare-fun b!308127 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15686 (_ BitVec 32)) SeekEntryResult!2568)

(assert (=> b!308127 (= e!192720 (seekKeyOrZeroReturnVacant!0 (x!30683 lt!151247) (index!12450 lt!151247) (index!12450 lt!151247) k0!2441 a!3293 mask!3709))))

(declare-fun b!308128 () Bool)

(assert (=> b!308128 (= e!192720 (MissingZero!2568 (index!12450 lt!151247)))))

(declare-fun b!308129 () Bool)

(assert (=> b!308129 (= e!192721 Undefined!2568)))

(assert (= (and d!68253 c!49233) b!308129))

(assert (= (and d!68253 (not c!49233)) b!308126))

(assert (= (and b!308126 c!49231) b!308124))

(assert (= (and b!308126 (not c!49231)) b!308125))

(assert (= (and b!308125 c!49232) b!308128))

(assert (= (and b!308125 (not c!49232)) b!308127))

(assert (=> d!68253 m!318263))

(declare-fun m!318305 () Bool)

(assert (=> d!68253 m!318305))

(assert (=> d!68253 m!318275))

(declare-fun m!318307 () Bool)

(assert (=> d!68253 m!318307))

(declare-fun m!318309 () Bool)

(assert (=> d!68253 m!318309))

(assert (=> d!68253 m!318275))

(assert (=> d!68253 m!318277))

(declare-fun m!318311 () Bool)

(assert (=> b!308126 m!318311))

(declare-fun m!318313 () Bool)

(assert (=> b!308127 m!318313))

(assert (=> b!308077 d!68253))

(declare-fun d!68257 () Bool)

(declare-fun e!192754 () Bool)

(assert (=> d!68257 e!192754))

(declare-fun c!49253 () Bool)

(declare-fun lt!151271 () SeekEntryResult!2568)

(assert (=> d!68257 (= c!49253 (and ((_ is Intermediate!2568) lt!151271) (undefined!3380 lt!151271)))))

(declare-fun e!192756 () SeekEntryResult!2568)

(assert (=> d!68257 (= lt!151271 e!192756)))

(declare-fun c!49252 () Bool)

(assert (=> d!68257 (= c!49252 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!151270 () (_ BitVec 64))

(assert (=> d!68257 (= lt!151270 (select (arr!7428 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68257 (validMask!0 mask!3709)))

(assert (=> d!68257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151271)))

(declare-fun b!308184 () Bool)

(assert (=> b!308184 (and (bvsge (index!12450 lt!151271) #b00000000000000000000000000000000) (bvslt (index!12450 lt!151271) (size!7780 a!3293)))))

(declare-fun res!164885 () Bool)

(assert (=> b!308184 (= res!164885 (= (select (arr!7428 a!3293) (index!12450 lt!151271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!192753 () Bool)

(assert (=> b!308184 (=> res!164885 e!192753)))

(declare-fun b!308185 () Bool)

(declare-fun e!192755 () SeekEntryResult!2568)

(assert (=> b!308185 (= e!192756 e!192755)))

(declare-fun c!49254 () Bool)

(assert (=> b!308185 (= c!49254 (or (= lt!151270 k0!2441) (= (bvadd lt!151270 lt!151270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!308186 () Bool)

(assert (=> b!308186 (and (bvsge (index!12450 lt!151271) #b00000000000000000000000000000000) (bvslt (index!12450 lt!151271) (size!7780 a!3293)))))

(assert (=> b!308186 (= e!192753 (= (select (arr!7428 a!3293) (index!12450 lt!151271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!308187 () Bool)

(declare-fun e!192752 () Bool)

(assert (=> b!308187 (= e!192754 e!192752)))

(declare-fun res!164887 () Bool)

(assert (=> b!308187 (= res!164887 (and ((_ is Intermediate!2568) lt!151271) (not (undefined!3380 lt!151271)) (bvslt (x!30683 lt!151271) #b01111111111111111111111111111110) (bvsge (x!30683 lt!151271) #b00000000000000000000000000000000) (bvsge (x!30683 lt!151271) #b00000000000000000000000000000000)))))

(assert (=> b!308187 (=> (not res!164887) (not e!192752))))

(declare-fun b!308188 () Bool)

(assert (=> b!308188 (and (bvsge (index!12450 lt!151271) #b00000000000000000000000000000000) (bvslt (index!12450 lt!151271) (size!7780 a!3293)))))

(declare-fun res!164886 () Bool)

(assert (=> b!308188 (= res!164886 (= (select (arr!7428 a!3293) (index!12450 lt!151271)) k0!2441))))

(assert (=> b!308188 (=> res!164886 e!192753)))

(assert (=> b!308188 (= e!192752 e!192753)))

(declare-fun b!308189 () Bool)

(assert (=> b!308189 (= e!192755 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308190 () Bool)

(assert (=> b!308190 (= e!192756 (Intermediate!2568 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!308191 () Bool)

(assert (=> b!308191 (= e!192754 (bvsge (x!30683 lt!151271) #b01111111111111111111111111111110))))

(declare-fun b!308192 () Bool)

(assert (=> b!308192 (= e!192755 (Intermediate!2568 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!68257 c!49252) b!308190))

(assert (= (and d!68257 (not c!49252)) b!308185))

(assert (= (and b!308185 c!49254) b!308192))

(assert (= (and b!308185 (not c!49254)) b!308189))

(assert (= (and d!68257 c!49253) b!308191))

(assert (= (and d!68257 (not c!49253)) b!308187))

(assert (= (and b!308187 res!164887) b!308188))

(assert (= (and b!308188 (not res!164886)) b!308184))

(assert (= (and b!308184 (not res!164885)) b!308186))

(declare-fun m!318329 () Bool)

(assert (=> b!308188 m!318329))

(assert (=> d!68257 m!318275))

(declare-fun m!318331 () Bool)

(assert (=> d!68257 m!318331))

(assert (=> d!68257 m!318263))

(assert (=> b!308186 m!318329))

(assert (=> b!308189 m!318275))

(declare-fun m!318333 () Bool)

(assert (=> b!308189 m!318333))

(assert (=> b!308189 m!318333))

(declare-fun m!318335 () Bool)

(assert (=> b!308189 m!318335))

(assert (=> b!308184 m!318329))

(assert (=> b!308076 d!68257))

(declare-fun d!68271 () Bool)

(declare-fun lt!151280 () (_ BitVec 32))

(declare-fun lt!151279 () (_ BitVec 32))

(assert (=> d!68271 (= lt!151280 (bvmul (bvxor lt!151279 (bvlshr lt!151279 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68271 (= lt!151279 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68271 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!164888 (let ((h!5341 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30689 (bvmul (bvxor h!5341 (bvlshr h!5341 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30689 (bvlshr x!30689 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!164888 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!164888 #b00000000000000000000000000000000))))))

(assert (=> d!68271 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!151280 (bvlshr lt!151280 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!308076 d!68271))

(declare-fun d!68277 () Bool)

(declare-fun res!164899 () Bool)

(declare-fun e!192767 () Bool)

(assert (=> d!68277 (=> res!164899 e!192767)))

(assert (=> d!68277 (= res!164899 (= (select (arr!7428 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68277 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!192767)))

(declare-fun b!308203 () Bool)

(declare-fun e!192768 () Bool)

(assert (=> b!308203 (= e!192767 e!192768)))

(declare-fun res!164900 () Bool)

(assert (=> b!308203 (=> (not res!164900) (not e!192768))))

(assert (=> b!308203 (= res!164900 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7780 a!3293)))))

(declare-fun b!308204 () Bool)

(assert (=> b!308204 (= e!192768 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68277 (not res!164899)) b!308203))

(assert (= (and b!308203 res!164900) b!308204))

(declare-fun m!318343 () Bool)

(assert (=> d!68277 m!318343))

(declare-fun m!318345 () Bool)

(assert (=> b!308204 m!318345))

(assert (=> b!308081 d!68277))

(declare-fun d!68283 () Bool)

(assert (=> d!68283 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30682 d!68283))

(declare-fun d!68291 () Bool)

(assert (=> d!68291 (= (array_inv!5391 a!3293) (bvsge (size!7780 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30682 d!68291))

(declare-fun d!68293 () Bool)

(declare-fun lt!151292 () (_ BitVec 32))

(assert (=> d!68293 (and (bvsge lt!151292 #b00000000000000000000000000000000) (bvslt lt!151292 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68293 (= lt!151292 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68293 (validMask!0 mask!3709)))

(assert (=> d!68293 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!151292)))

(declare-fun bs!10831 () Bool)

(assert (= bs!10831 d!68293))

(declare-fun m!318357 () Bool)

(assert (=> bs!10831 m!318357))

(assert (=> bs!10831 m!318263))

(assert (=> b!308080 d!68293))

(declare-fun d!68295 () Bool)

(assert (=> d!68295 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!308074 d!68295))

(declare-fun b!308261 () Bool)

(declare-fun e!192804 () Bool)

(declare-fun call!25915 () Bool)

(assert (=> b!308261 (= e!192804 call!25915)))

(declare-fun d!68297 () Bool)

(declare-fun res!164918 () Bool)

(declare-fun e!192803 () Bool)

(assert (=> d!68297 (=> res!164918 e!192803)))

(assert (=> d!68297 (= res!164918 (bvsge #b00000000000000000000000000000000 (size!7780 a!3293)))))

(assert (=> d!68297 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!192803)))

(declare-fun b!308262 () Bool)

(declare-fun e!192805 () Bool)

(assert (=> b!308262 (= e!192805 e!192804)))

(declare-fun lt!151314 () (_ BitVec 64))

(assert (=> b!308262 (= lt!151314 (select (arr!7428 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9583 0))(
  ( (Unit!9584) )
))
(declare-fun lt!151313 () Unit!9583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15686 (_ BitVec 64) (_ BitVec 32)) Unit!9583)

(assert (=> b!308262 (= lt!151313 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!151314 #b00000000000000000000000000000000))))

(assert (=> b!308262 (arrayContainsKey!0 a!3293 lt!151314 #b00000000000000000000000000000000)))

(declare-fun lt!151312 () Unit!9583)

(assert (=> b!308262 (= lt!151312 lt!151313)))

(declare-fun res!164917 () Bool)

(assert (=> b!308262 (= res!164917 (= (seekEntryOrOpen!0 (select (arr!7428 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2568 #b00000000000000000000000000000000)))))

(assert (=> b!308262 (=> (not res!164917) (not e!192804))))

(declare-fun bm!25912 () Bool)

(assert (=> bm!25912 (= call!25915 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!308263 () Bool)

(assert (=> b!308263 (= e!192803 e!192805)))

(declare-fun c!49275 () Bool)

(assert (=> b!308263 (= c!49275 (validKeyInArray!0 (select (arr!7428 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!308264 () Bool)

(assert (=> b!308264 (= e!192805 call!25915)))

(assert (= (and d!68297 (not res!164918)) b!308263))

(assert (= (and b!308263 c!49275) b!308262))

(assert (= (and b!308263 (not c!49275)) b!308264))

(assert (= (and b!308262 res!164917) b!308261))

(assert (= (or b!308261 b!308264) bm!25912))

(assert (=> b!308262 m!318343))

(declare-fun m!318369 () Bool)

(assert (=> b!308262 m!318369))

(declare-fun m!318371 () Bool)

(assert (=> b!308262 m!318371))

(assert (=> b!308262 m!318343))

(declare-fun m!318373 () Bool)

(assert (=> b!308262 m!318373))

(declare-fun m!318375 () Bool)

(assert (=> bm!25912 m!318375))

(assert (=> b!308263 m!318343))

(assert (=> b!308263 m!318343))

(declare-fun m!318377 () Bool)

(assert (=> b!308263 m!318377))

(assert (=> b!308073 d!68297))

(declare-fun d!68299 () Bool)

(declare-fun e!192808 () Bool)

(assert (=> d!68299 e!192808))

(declare-fun c!49277 () Bool)

(declare-fun lt!151316 () SeekEntryResult!2568)

(assert (=> d!68299 (= c!49277 (and ((_ is Intermediate!2568) lt!151316) (undefined!3380 lt!151316)))))

(declare-fun e!192810 () SeekEntryResult!2568)

(assert (=> d!68299 (= lt!151316 e!192810)))

(declare-fun c!49276 () Bool)

(assert (=> d!68299 (= c!49276 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!151315 () (_ BitVec 64))

(assert (=> d!68299 (= lt!151315 (select (arr!7428 a!3293) index!1781))))

(assert (=> d!68299 (validMask!0 mask!3709)))

(assert (=> d!68299 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151316)))

(declare-fun b!308265 () Bool)

(assert (=> b!308265 (and (bvsge (index!12450 lt!151316) #b00000000000000000000000000000000) (bvslt (index!12450 lt!151316) (size!7780 a!3293)))))

(declare-fun res!164919 () Bool)

(assert (=> b!308265 (= res!164919 (= (select (arr!7428 a!3293) (index!12450 lt!151316)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!192807 () Bool)

(assert (=> b!308265 (=> res!164919 e!192807)))

(declare-fun b!308266 () Bool)

(declare-fun e!192809 () SeekEntryResult!2568)

(assert (=> b!308266 (= e!192810 e!192809)))

(declare-fun c!49278 () Bool)

(assert (=> b!308266 (= c!49278 (or (= lt!151315 k0!2441) (= (bvadd lt!151315 lt!151315) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!308267 () Bool)

(assert (=> b!308267 (and (bvsge (index!12450 lt!151316) #b00000000000000000000000000000000) (bvslt (index!12450 lt!151316) (size!7780 a!3293)))))

(assert (=> b!308267 (= e!192807 (= (select (arr!7428 a!3293) (index!12450 lt!151316)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!308268 () Bool)

(declare-fun e!192806 () Bool)

(assert (=> b!308268 (= e!192808 e!192806)))

(declare-fun res!164921 () Bool)

(assert (=> b!308268 (= res!164921 (and ((_ is Intermediate!2568) lt!151316) (not (undefined!3380 lt!151316)) (bvslt (x!30683 lt!151316) #b01111111111111111111111111111110) (bvsge (x!30683 lt!151316) #b00000000000000000000000000000000) (bvsge (x!30683 lt!151316) x!1427)))))

(assert (=> b!308268 (=> (not res!164921) (not e!192806))))

(declare-fun b!308269 () Bool)

(assert (=> b!308269 (and (bvsge (index!12450 lt!151316) #b00000000000000000000000000000000) (bvslt (index!12450 lt!151316) (size!7780 a!3293)))))

(declare-fun res!164920 () Bool)

(assert (=> b!308269 (= res!164920 (= (select (arr!7428 a!3293) (index!12450 lt!151316)) k0!2441))))

(assert (=> b!308269 (=> res!164920 e!192807)))

(assert (=> b!308269 (= e!192806 e!192807)))

(declare-fun b!308270 () Bool)

(assert (=> b!308270 (= e!192809 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308271 () Bool)

(assert (=> b!308271 (= e!192810 (Intermediate!2568 true index!1781 x!1427))))

(declare-fun b!308272 () Bool)

(assert (=> b!308272 (= e!192808 (bvsge (x!30683 lt!151316) #b01111111111111111111111111111110))))

(declare-fun b!308273 () Bool)

(assert (=> b!308273 (= e!192809 (Intermediate!2568 false index!1781 x!1427))))

(assert (= (and d!68299 c!49276) b!308271))

(assert (= (and d!68299 (not c!49276)) b!308266))

(assert (= (and b!308266 c!49278) b!308273))

(assert (= (and b!308266 (not c!49278)) b!308270))

(assert (= (and d!68299 c!49277) b!308272))

(assert (= (and d!68299 (not c!49277)) b!308268))

(assert (= (and b!308268 res!164921) b!308269))

(assert (= (and b!308269 (not res!164920)) b!308265))

(assert (= (and b!308265 (not res!164919)) b!308267))

(declare-fun m!318379 () Bool)

(assert (=> b!308269 m!318379))

(assert (=> d!68299 m!318259))

(assert (=> d!68299 m!318263))

(assert (=> b!308267 m!318379))

(assert (=> b!308270 m!318279))

(assert (=> b!308270 m!318279))

(declare-fun m!318381 () Bool)

(assert (=> b!308270 m!318381))

(assert (=> b!308265 m!318379))

(assert (=> b!308078 d!68299))

(check-sat (not b!308270) (not b!308189) (not d!68299) (not b!308262) (not b!308204) (not b!308263) (not d!68253) (not bm!25912) (not d!68293) (not b!308127) (not d!68257))
(check-sat)
