; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31446 () Bool)

(assert start!31446)

(declare-datatypes ((array!16072 0))(
  ( (array!16073 (arr!7609 (Array (_ BitVec 32) (_ BitVec 64))) (size!7961 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16072)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun e!196096 () Bool)

(declare-fun b!314961 () Bool)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2749 0))(
  ( (MissingZero!2749 (index!13172 (_ BitVec 32))) (Found!2749 (index!13173 (_ BitVec 32))) (Intermediate!2749 (undefined!3561 Bool) (index!13174 (_ BitVec 32)) (x!31401 (_ BitVec 32))) (Undefined!2749) (MissingVacant!2749 (index!13175 (_ BitVec 32))) )
))
(declare-fun lt!154064 () SeekEntryResult!2749)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16072 (_ BitVec 32)) SeekEntryResult!2749)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314961 (= e!196096 (not (= lt!154064 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))))

(declare-fun b!314962 () Bool)

(declare-fun res!170570 () Bool)

(declare-fun e!196093 () Bool)

(assert (=> b!314962 (=> (not res!170570) (not e!196093))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16072 (_ BitVec 32)) SeekEntryResult!2749)

(assert (=> b!314962 (= res!170570 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2749 i!1240)))))

(declare-fun b!314963 () Bool)

(declare-fun res!170574 () Bool)

(assert (=> b!314963 (=> (not res!170574) (not e!196093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16072 (_ BitVec 32)) Bool)

(assert (=> b!314963 (= res!170574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314964 () Bool)

(declare-fun res!170572 () Bool)

(declare-fun e!196094 () Bool)

(assert (=> b!314964 (=> (not res!170572) (not e!196094))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314964 (= res!170572 (and (= (select (arr!7609 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7961 a!3293))))))

(declare-fun b!314965 () Bool)

(assert (=> b!314965 (= e!196094 e!196096)))

(declare-fun res!170576 () Bool)

(assert (=> b!314965 (=> (not res!170576) (not e!196096))))

(declare-fun lt!154065 () SeekEntryResult!2749)

(assert (=> b!314965 (= res!170576 (and (= lt!154064 lt!154065) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7609 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7609 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7609 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314965 (= lt!154064 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314966 () Bool)

(declare-fun res!170573 () Bool)

(assert (=> b!314966 (=> (not res!170573) (not e!196093))))

(assert (=> b!314966 (= res!170573 (and (= (size!7961 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7961 a!3293))))))

(declare-fun b!314967 () Bool)

(declare-fun res!170571 () Bool)

(assert (=> b!314967 (=> (not res!170571) (not e!196093))))

(declare-fun arrayContainsKey!0 (array!16072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314967 (= res!170571 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314968 () Bool)

(assert (=> b!314968 (= e!196093 e!196094)))

(declare-fun res!170569 () Bool)

(assert (=> b!314968 (=> (not res!170569) (not e!196094))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314968 (= res!170569 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154065))))

(assert (=> b!314968 (= lt!154065 (Intermediate!2749 false resIndex!52 resX!52))))

(declare-fun res!170575 () Bool)

(assert (=> start!31446 (=> (not res!170575) (not e!196093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31446 (= res!170575 (validMask!0 mask!3709))))

(assert (=> start!31446 e!196093))

(declare-fun array_inv!5572 (array!16072) Bool)

(assert (=> start!31446 (array_inv!5572 a!3293)))

(assert (=> start!31446 true))

(declare-fun b!314969 () Bool)

(declare-fun res!170577 () Bool)

(assert (=> b!314969 (=> (not res!170577) (not e!196093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314969 (= res!170577 (validKeyInArray!0 k!2441))))

(assert (= (and start!31446 res!170575) b!314966))

(assert (= (and b!314966 res!170573) b!314969))

(assert (= (and b!314969 res!170577) b!314967))

(assert (= (and b!314967 res!170571) b!314962))

(assert (= (and b!314962 res!170570) b!314963))

(assert (= (and b!314963 res!170574) b!314968))

(assert (= (and b!314968 res!170569) b!314964))

(assert (= (and b!314964 res!170572) b!314965))

(assert (= (and b!314965 res!170576) b!314961))

(declare-fun m!324375 () Bool)

(assert (=> b!314965 m!324375))

(declare-fun m!324377 () Bool)

(assert (=> b!314965 m!324377))

(declare-fun m!324379 () Bool)

(assert (=> b!314968 m!324379))

(assert (=> b!314968 m!324379))

(declare-fun m!324381 () Bool)

(assert (=> b!314968 m!324381))

(declare-fun m!324383 () Bool)

(assert (=> b!314967 m!324383))

(declare-fun m!324385 () Bool)

(assert (=> b!314964 m!324385))

(declare-fun m!324387 () Bool)

(assert (=> b!314961 m!324387))

(assert (=> b!314961 m!324387))

(declare-fun m!324389 () Bool)

(assert (=> b!314961 m!324389))

(declare-fun m!324391 () Bool)

(assert (=> start!31446 m!324391))

(declare-fun m!324393 () Bool)

(assert (=> start!31446 m!324393))

(declare-fun m!324395 () Bool)

(assert (=> b!314963 m!324395))

(declare-fun m!324397 () Bool)

(assert (=> b!314969 m!324397))

(declare-fun m!324399 () Bool)

(assert (=> b!314962 m!324399))

(push 1)

(assert (not b!314969))

(assert (not b!314968))

(assert (not b!314967))

(assert (not b!314965))

(assert (not b!314961))

(assert (not start!31446))

(assert (not b!314962))

(assert (not b!314963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!196137 () SeekEntryResult!2749)

(declare-fun b!315042 () Bool)

(assert (=> b!315042 (= e!196137 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun d!68833 () Bool)

(declare-fun e!196141 () Bool)

(assert (=> d!68833 e!196141))

(declare-fun c!49834 () Bool)

(declare-fun lt!154085 () SeekEntryResult!2749)

(assert (=> d!68833 (= c!49834 (and (is-Intermediate!2749 lt!154085) (undefined!3561 lt!154085)))))

(declare-fun e!196139 () SeekEntryResult!2749)

(assert (=> d!68833 (= lt!154085 e!196139)))

(declare-fun c!49835 () Bool)

(assert (=> d!68833 (= c!49835 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154086 () (_ BitVec 64))

(assert (=> d!68833 (= lt!154086 (select (arr!7609 a!3293) index!1781))))

(assert (=> d!68833 (validMask!0 mask!3709)))

(assert (=> d!68833 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154085)))

(declare-fun b!315043 () Bool)

(assert (=> b!315043 (and (bvsge (index!13174 lt!154085) #b00000000000000000000000000000000) (bvslt (index!13174 lt!154085) (size!7961 a!3293)))))

(declare-fun e!196138 () Bool)

(assert (=> b!315043 (= e!196138 (= (select (arr!7609 a!3293) (index!13174 lt!154085)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315044 () Bool)

(declare-fun e!196140 () Bool)

(assert (=> b!315044 (= e!196141 e!196140)))

(declare-fun res!170604 () Bool)

(assert (=> b!315044 (= res!170604 (and (is-Intermediate!2749 lt!154085) (not (undefined!3561 lt!154085)) (bvslt (x!31401 lt!154085) #b01111111111111111111111111111110) (bvsge (x!31401 lt!154085) #b00000000000000000000000000000000) (bvsge (x!31401 lt!154085) x!1427)))))

(assert (=> b!315044 (=> (not res!170604) (not e!196140))))

(declare-fun b!315045 () Bool)

(assert (=> b!315045 (and (bvsge (index!13174 lt!154085) #b00000000000000000000000000000000) (bvslt (index!13174 lt!154085) (size!7961 a!3293)))))

(declare-fun res!170603 () Bool)

(assert (=> b!315045 (= res!170603 (= (select (arr!7609 a!3293) (index!13174 lt!154085)) k!2441))))

(assert (=> b!315045 (=> res!170603 e!196138)))

(assert (=> b!315045 (= e!196140 e!196138)))

(declare-fun b!315046 () Bool)

(assert (=> b!315046 (and (bvsge (index!13174 lt!154085) #b00000000000000000000000000000000) (bvslt (index!13174 lt!154085) (size!7961 a!3293)))))

(declare-fun res!170602 () Bool)

(assert (=> b!315046 (= res!170602 (= (select (arr!7609 a!3293) (index!13174 lt!154085)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315046 (=> res!170602 e!196138)))

(declare-fun b!315047 () Bool)

(assert (=> b!315047 (= e!196141 (bvsge (x!31401 lt!154085) #b01111111111111111111111111111110))))

(declare-fun b!315048 () Bool)

(assert (=> b!315048 (= e!196139 e!196137)))

(declare-fun c!49836 () Bool)

(assert (=> b!315048 (= c!49836 (or (= lt!154086 k!2441) (= (bvadd lt!154086 lt!154086) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315049 () Bool)

(assert (=> b!315049 (= e!196139 (Intermediate!2749 true index!1781 x!1427))))

(declare-fun b!315050 () Bool)

(assert (=> b!315050 (= e!196137 (Intermediate!2749 false index!1781 x!1427))))

(assert (= (and d!68833 c!49835) b!315049))

(assert (= (and d!68833 (not c!49835)) b!315048))

(assert (= (and b!315048 c!49836) b!315050))

(assert (= (and b!315048 (not c!49836)) b!315042))

(assert (= (and d!68833 c!49834) b!315047))

(assert (= (and d!68833 (not c!49834)) b!315044))

(assert (= (and b!315044 res!170604) b!315045))

(assert (= (and b!315045 (not res!170603)) b!315046))

(assert (= (and b!315046 (not res!170602)) b!315043))

(assert (=> d!68833 m!324375))

(assert (=> d!68833 m!324391))

(assert (=> b!315042 m!324387))

(assert (=> b!315042 m!324387))

(declare-fun m!324415 () Bool)

(assert (=> b!315042 m!324415))

(declare-fun m!324417 () Bool)

(assert (=> b!315046 m!324417))

(assert (=> b!315043 m!324417))

(assert (=> b!315045 m!324417))

(assert (=> b!314965 d!68833))

(declare-fun d!68847 () Bool)

(declare-fun res!170613 () Bool)

(declare-fun e!196151 () Bool)

(assert (=> d!68847 (=> res!170613 e!196151)))

(assert (=> d!68847 (= res!170613 (= (select (arr!7609 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68847 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!196151)))

(declare-fun b!315064 () Bool)

(declare-fun e!196152 () Bool)

(assert (=> b!315064 (= e!196151 e!196152)))

(declare-fun res!170614 () Bool)

(assert (=> b!315064 (=> (not res!170614) (not e!196152))))

(assert (=> b!315064 (= res!170614 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7961 a!3293)))))

(declare-fun b!315065 () Bool)

(assert (=> b!315065 (= e!196152 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68847 (not res!170613)) b!315064))

(assert (= (and b!315064 res!170614) b!315065))

(declare-fun m!324427 () Bool)

(assert (=> d!68847 m!324427))

(declare-fun m!324429 () Bool)

(assert (=> b!315065 m!324429))

(assert (=> b!314967 d!68847))

(declare-fun d!68853 () Bool)

(assert (=> d!68853 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31446 d!68853))

(declare-fun d!68861 () Bool)

(assert (=> d!68861 (= (array_inv!5572 a!3293) (bvsge (size!7961 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31446 d!68861))

(declare-fun e!196153 () SeekEntryResult!2749)

(declare-fun b!315066 () Bool)

(assert (=> b!315066 (= e!196153 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun d!68863 () Bool)

(declare-fun e!196157 () Bool)

(assert (=> d!68863 e!196157))

(declare-fun c!49840 () Bool)

(declare-fun lt!154095 () SeekEntryResult!2749)

(assert (=> d!68863 (= c!49840 (and (is-Intermediate!2749 lt!154095) (undefined!3561 lt!154095)))))

(declare-fun e!196155 () SeekEntryResult!2749)

(assert (=> d!68863 (= lt!154095 e!196155)))

(declare-fun c!49841 () Bool)

(assert (=> d!68863 (= c!49841 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154096 () (_ BitVec 64))

(assert (=> d!68863 (= lt!154096 (select (arr!7609 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68863 (validMask!0 mask!3709)))

(assert (=> d!68863 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709) lt!154095)))

(declare-fun b!315067 () Bool)

(assert (=> b!315067 (and (bvsge (index!13174 lt!154095) #b00000000000000000000000000000000) (bvslt (index!13174 lt!154095) (size!7961 a!3293)))))

(declare-fun e!196154 () Bool)

(assert (=> b!315067 (= e!196154 (= (select (arr!7609 a!3293) (index!13174 lt!154095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315068 () Bool)

(declare-fun e!196156 () Bool)

(assert (=> b!315068 (= e!196157 e!196156)))

(declare-fun res!170617 () Bool)

(assert (=> b!315068 (= res!170617 (and (is-Intermediate!2749 lt!154095) (not (undefined!3561 lt!154095)) (bvslt (x!31401 lt!154095) #b01111111111111111111111111111110) (bvsge (x!31401 lt!154095) #b00000000000000000000000000000000) (bvsge (x!31401 lt!154095) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!315068 (=> (not res!170617) (not e!196156))))

(declare-fun b!315069 () Bool)

(assert (=> b!315069 (and (bvsge (index!13174 lt!154095) #b00000000000000000000000000000000) (bvslt (index!13174 lt!154095) (size!7961 a!3293)))))

(declare-fun res!170616 () Bool)

(assert (=> b!315069 (= res!170616 (= (select (arr!7609 a!3293) (index!13174 lt!154095)) k!2441))))

(assert (=> b!315069 (=> res!170616 e!196154)))

(assert (=> b!315069 (= e!196156 e!196154)))

(declare-fun b!315070 () Bool)

(assert (=> b!315070 (and (bvsge (index!13174 lt!154095) #b00000000000000000000000000000000) (bvslt (index!13174 lt!154095) (size!7961 a!3293)))))

(declare-fun res!170615 () Bool)

(assert (=> b!315070 (= res!170615 (= (select (arr!7609 a!3293) (index!13174 lt!154095)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315070 (=> res!170615 e!196154)))

(declare-fun b!315071 () Bool)

(assert (=> b!315071 (= e!196157 (bvsge (x!31401 lt!154095) #b01111111111111111111111111111110))))

(declare-fun b!315072 () Bool)

(assert (=> b!315072 (= e!196155 e!196153)))

(declare-fun c!49842 () Bool)

(assert (=> b!315072 (= c!49842 (or (= lt!154096 k!2441) (= (bvadd lt!154096 lt!154096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315073 () Bool)

(assert (=> b!315073 (= e!196155 (Intermediate!2749 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315074 () Bool)

(assert (=> b!315074 (= e!196153 (Intermediate!2749 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(assert (= (and d!68863 c!49841) b!315073))

(assert (= (and d!68863 (not c!49841)) b!315072))

(assert (= (and b!315072 c!49842) b!315074))

(assert (= (and b!315072 (not c!49842)) b!315066))

(assert (= (and d!68863 c!49840) b!315071))

(assert (= (and d!68863 (not c!49840)) b!315068))

(assert (= (and b!315068 res!170617) b!315069))

(assert (= (and b!315069 (not res!170616)) b!315070))

(assert (= (and b!315070 (not res!170615)) b!315067))

(assert (=> d!68863 m!324387))

(declare-fun m!324431 () Bool)

(assert (=> d!68863 m!324431))

(assert (=> d!68863 m!324391))

(assert (=> b!315066 m!324387))

(declare-fun m!324433 () Bool)

(assert (=> b!315066 m!324433))

(assert (=> b!315066 m!324433))

(declare-fun m!324435 () Bool)

(assert (=> b!315066 m!324435))

(declare-fun m!324437 () Bool)

(assert (=> b!315070 m!324437))

(assert (=> b!315067 m!324437))

(assert (=> b!315069 m!324437))

(assert (=> b!314961 d!68863))

(declare-fun d!68865 () Bool)

(declare-fun lt!154099 () (_ BitVec 32))

(assert (=> d!68865 (and (bvsge lt!154099 #b00000000000000000000000000000000) (bvslt lt!154099 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68865 (= lt!154099 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68865 (validMask!0 mask!3709)))

(assert (=> d!68865 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154099)))

(declare-fun bs!11019 () Bool)

(assert (= bs!11019 d!68865))

(declare-fun m!324439 () Bool)

(assert (=> bs!11019 m!324439))

(assert (=> bs!11019 m!324391))

(assert (=> b!314961 d!68865))

(declare-fun bm!25981 () Bool)

(declare-fun call!25984 () Bool)

(assert (=> bm!25981 (= call!25984 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68867 () Bool)

(declare-fun res!170623 () Bool)

(declare-fun e!196177 () Bool)

(assert (=> d!68867 (=> res!170623 e!196177)))

(assert (=> d!68867 (= res!170623 (bvsge #b00000000000000000000000000000000 (size!7961 a!3293)))))

(assert (=> d!68867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196177)))

(declare-fun b!315107 () Bool)

(declare-fun e!196178 () Bool)

(declare-fun e!196176 () Bool)

(assert (=> b!315107 (= e!196178 e!196176)))

(declare-fun lt!154118 () (_ BitVec 64))

(assert (=> b!315107 (= lt!154118 (select (arr!7609 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9697 0))(
  ( (Unit!9698) )
))
(declare-fun lt!154120 () Unit!9697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16072 (_ BitVec 64) (_ BitVec 32)) Unit!9697)

(assert (=> b!315107 (= lt!154120 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154118 #b00000000000000000000000000000000))))

(assert (=> b!315107 (arrayContainsKey!0 a!3293 lt!154118 #b00000000000000000000000000000000)))

(declare-fun lt!154119 () Unit!9697)

(assert (=> b!315107 (= lt!154119 lt!154120)))

(declare-fun res!170622 () Bool)

(assert (=> b!315107 (= res!170622 (= (seekEntryOrOpen!0 (select (arr!7609 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2749 #b00000000000000000000000000000000)))))

(assert (=> b!315107 (=> (not res!170622) (not e!196176))))

(declare-fun b!315108 () Bool)

(assert (=> b!315108 (= e!196178 call!25984)))

(declare-fun b!315109 () Bool)

(assert (=> b!315109 (= e!196176 call!25984)))

(declare-fun b!315110 () Bool)

(assert (=> b!315110 (= e!196177 e!196178)))

(declare-fun c!49857 () Bool)

(assert (=> b!315110 (= c!49857 (validKeyInArray!0 (select (arr!7609 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68867 (not res!170623)) b!315110))

(assert (= (and b!315110 c!49857) b!315107))

(assert (= (and b!315110 (not c!49857)) b!315108))

(assert (= (and b!315107 res!170622) b!315109))

(assert (= (or b!315109 b!315108) bm!25981))

(declare-fun m!324441 () Bool)

(assert (=> bm!25981 m!324441))

(assert (=> b!315107 m!324427))

(declare-fun m!324443 () Bool)

(assert (=> b!315107 m!324443))

(declare-fun m!324445 () Bool)

(assert (=> b!315107 m!324445))

(assert (=> b!315107 m!324427))

(declare-fun m!324447 () Bool)

(assert (=> b!315107 m!324447))

(assert (=> b!315110 m!324427))

(assert (=> b!315110 m!324427))

(declare-fun m!324449 () Bool)

(assert (=> b!315110 m!324449))

(assert (=> b!314963 d!68867))

(declare-fun e!196179 () SeekEntryResult!2749)

(declare-fun b!315111 () Bool)

(assert (=> b!315111 (= e!196179 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun d!68869 () Bool)

(declare-fun e!196183 () Bool)

(assert (=> d!68869 e!196183))

(declare-fun c!49858 () Bool)

(declare-fun lt!154121 () SeekEntryResult!2749)

(assert (=> d!68869 (= c!49858 (and (is-Intermediate!2749 lt!154121) (undefined!3561 lt!154121)))))

(declare-fun e!196181 () SeekEntryResult!2749)

(assert (=> d!68869 (= lt!154121 e!196181)))

(declare-fun c!49859 () Bool)

(assert (=> d!68869 (= c!49859 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154122 () (_ BitVec 64))

(assert (=> d!68869 (= lt!154122 (select (arr!7609 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68869 (validMask!0 mask!3709)))

(assert (=> d!68869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154121)))

(declare-fun b!315112 () Bool)

(assert (=> b!315112 (and (bvsge (index!13174 lt!154121) #b00000000000000000000000000000000) (bvslt (index!13174 lt!154121) (size!7961 a!3293)))))

(declare-fun e!196180 () Bool)

(assert (=> b!315112 (= e!196180 (= (select (arr!7609 a!3293) (index!13174 lt!154121)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315113 () Bool)

(declare-fun e!196182 () Bool)

(assert (=> b!315113 (= e!196183 e!196182)))

(declare-fun res!170626 () Bool)

(assert (=> b!315113 (= res!170626 (and (is-Intermediate!2749 lt!154121) (not (undefined!3561 lt!154121)) (bvslt (x!31401 lt!154121) #b01111111111111111111111111111110) (bvsge (x!31401 lt!154121) #b00000000000000000000000000000000) (bvsge (x!31401 lt!154121) #b00000000000000000000000000000000)))))

(assert (=> b!315113 (=> (not res!170626) (not e!196182))))

(declare-fun b!315114 () Bool)

(assert (=> b!315114 (and (bvsge (index!13174 lt!154121) #b00000000000000000000000000000000) (bvslt (index!13174 lt!154121) (size!7961 a!3293)))))

(declare-fun res!170625 () Bool)

(assert (=> b!315114 (= res!170625 (= (select (arr!7609 a!3293) (index!13174 lt!154121)) k!2441))))

(assert (=> b!315114 (=> res!170625 e!196180)))

(assert (=> b!315114 (= e!196182 e!196180)))

(declare-fun b!315115 () Bool)

(assert (=> b!315115 (and (bvsge (index!13174 lt!154121) #b00000000000000000000000000000000) (bvslt (index!13174 lt!154121) (size!7961 a!3293)))))

(declare-fun res!170624 () Bool)

(assert (=> b!315115 (= res!170624 (= (select (arr!7609 a!3293) (index!13174 lt!154121)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315115 (=> res!170624 e!196180)))

(declare-fun b!315116 () Bool)

(assert (=> b!315116 (= e!196183 (bvsge (x!31401 lt!154121) #b01111111111111111111111111111110))))

(declare-fun b!315117 () Bool)

(assert (=> b!315117 (= e!196181 e!196179)))

(declare-fun c!49860 () Bool)

(assert (=> b!315117 (= c!49860 (or (= lt!154122 k!2441) (= (bvadd lt!154122 lt!154122) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315118 () Bool)

(assert (=> b!315118 (= e!196181 (Intermediate!2749 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315119 () Bool)

(assert (=> b!315119 (= e!196179 (Intermediate!2749 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!68869 c!49859) b!315118))

(assert (= (and d!68869 (not c!49859)) b!315117))

(assert (= (and b!315117 c!49860) b!315119))

(assert (= (and b!315117 (not c!49860)) b!315111))

(assert (= (and d!68869 c!49858) b!315116))

(assert (= (and d!68869 (not c!49858)) b!315113))

(assert (= (and b!315113 res!170626) b!315114))

(assert (= (and b!315114 (not res!170625)) b!315115))

(assert (= (and b!315115 (not res!170624)) b!315112))

(assert (=> d!68869 m!324379))

(declare-fun m!324451 () Bool)

(assert (=> d!68869 m!324451))

(assert (=> d!68869 m!324391))

(assert (=> b!315111 m!324379))

(declare-fun m!324453 () Bool)

(assert (=> b!315111 m!324453))

(assert (=> b!315111 m!324453))

(declare-fun m!324455 () Bool)

(assert (=> b!315111 m!324455))

(declare-fun m!324459 () Bool)

(assert (=> b!315115 m!324459))

(assert (=> b!315112 m!324459))

(assert (=> b!315114 m!324459))

(assert (=> b!314968 d!68869))

(declare-fun d!68871 () Bool)

(declare-fun lt!154138 () (_ BitVec 32))

(declare-fun lt!154137 () (_ BitVec 32))

(assert (=> d!68871 (= lt!154138 (bvmul (bvxor lt!154137 (bvlshr lt!154137 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68871 (= lt!154137 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68871 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170627 (let ((h!5365 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31408 (bvmul (bvxor h!5365 (bvlshr h!5365 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31408 (bvlshr x!31408 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170627 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170627 #b00000000000000000000000000000000))))))

(assert (=> d!68871 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!154138 (bvlshr lt!154138 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314968 d!68871))

(declare-fun b!315207 () Bool)

(declare-fun e!196241 () SeekEntryResult!2749)

(declare-fun lt!154176 () SeekEntryResult!2749)

(assert (=> b!315207 (= e!196241 (Found!2749 (index!13174 lt!154176)))))

(declare-fun b!315208 () Bool)

(declare-fun c!49890 () Bool)

(declare-fun lt!154175 () (_ BitVec 64))

(assert (=> b!315208 (= c!49890 (= lt!154175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196243 () SeekEntryResult!2749)

(assert (=> b!315208 (= e!196241 e!196243)))

(declare-fun b!315209 () Bool)

(assert (=> b!315209 (= e!196243 (MissingZero!2749 (index!13174 lt!154176)))))

(declare-fun b!315210 () Bool)

(declare-fun e!196242 () SeekEntryResult!2749)

(assert (=> b!315210 (= e!196242 e!196241)))

(assert (=> b!315210 (= lt!154175 (select (arr!7609 a!3293) (index!13174 lt!154176)))))

(declare-fun c!49889 () Bool)

(assert (=> b!315210 (= c!49889 (= lt!154175 k!2441))))

(declare-fun b!315211 () Bool)

(assert (=> b!315211 (= e!196242 Undefined!2749)))

(declare-fun b!315212 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16072 (_ BitVec 32)) SeekEntryResult!2749)

(assert (=> b!315212 (= e!196243 (seekKeyOrZeroReturnVacant!0 (x!31401 lt!154176) (index!13174 lt!154176) (index!13174 lt!154176) k!2441 a!3293 mask!3709))))

(declare-fun d!68883 () Bool)

(declare-fun lt!154174 () SeekEntryResult!2749)

(assert (=> d!68883 (and (or (is-Undefined!2749 lt!154174) (not (is-Found!2749 lt!154174)) (and (bvsge (index!13173 lt!154174) #b00000000000000000000000000000000) (bvslt (index!13173 lt!154174) (size!7961 a!3293)))) (or (is-Undefined!2749 lt!154174) (is-Found!2749 lt!154174) (not (is-MissingZero!2749 lt!154174)) (and (bvsge (index!13172 lt!154174) #b00000000000000000000000000000000) (bvslt (index!13172 lt!154174) (size!7961 a!3293)))) (or (is-Undefined!2749 lt!154174) (is-Found!2749 lt!154174) (is-MissingZero!2749 lt!154174) (not (is-MissingVacant!2749 lt!154174)) (and (bvsge (index!13175 lt!154174) #b00000000000000000000000000000000) (bvslt (index!13175 lt!154174) (size!7961 a!3293)))) (or (is-Undefined!2749 lt!154174) (ite (is-Found!2749 lt!154174) (= (select (arr!7609 a!3293) (index!13173 lt!154174)) k!2441) (ite (is-MissingZero!2749 lt!154174) (= (select (arr!7609 a!3293) (index!13172 lt!154174)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2749 lt!154174) (= (select (arr!7609 a!3293) (index!13175 lt!154174)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68883 (= lt!154174 e!196242)))

(declare-fun c!49888 () Bool)

(assert (=> d!68883 (= c!49888 (and (is-Intermediate!2749 lt!154176) (undefined!3561 lt!154176)))))

(assert (=> d!68883 (= lt!154176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68883 (validMask!0 mask!3709)))

(assert (=> d!68883 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!154174)))

(assert (= (and d!68883 c!49888) b!315211))

(assert (= (and d!68883 (not c!49888)) b!315210))

(assert (= (and b!315210 c!49889) b!315207))

(assert (= (and b!315210 (not c!49889)) b!315208))

(assert (= (and b!315208 c!49890) b!315209))

(assert (= (and b!315208 (not c!49890)) b!315212))

(declare-fun m!324529 () Bool)

(assert (=> b!315210 m!324529))

(declare-fun m!324531 () Bool)

(assert (=> b!315212 m!324531))

(assert (=> d!68883 m!324379))

(assert (=> d!68883 m!324381))

(declare-fun m!324533 () Bool)

(assert (=> d!68883 m!324533))

(assert (=> d!68883 m!324379))

(declare-fun m!324535 () Bool)

(assert (=> d!68883 m!324535))

(declare-fun m!324537 () Bool)

(assert (=> d!68883 m!324537))

(assert (=> d!68883 m!324391))

(assert (=> b!314962 d!68883))

(declare-fun d!68893 () Bool)

(assert (=> d!68893 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314969 d!68893))

(push 1)

