; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31368 () Bool)

(assert start!31368)

(declare-fun b!314483 () Bool)

(declare-fun e!195838 () Bool)

(declare-fun e!195840 () Bool)

(assert (=> b!314483 (= e!195838 e!195840)))

(declare-fun res!170286 () Bool)

(assert (=> b!314483 (=> (not res!170286) (not e!195840))))

(declare-datatypes ((SeekEntryResult!2705 0))(
  ( (MissingZero!2705 (index!12996 (_ BitVec 32))) (Found!2705 (index!12997 (_ BitVec 32))) (Intermediate!2705 (undefined!3517 Bool) (index!12998 (_ BitVec 32)) (x!31332 (_ BitVec 32))) (Undefined!2705) (MissingVacant!2705 (index!12999 (_ BitVec 32))) )
))
(declare-fun lt!153938 () SeekEntryResult!2705)

(declare-datatypes ((array!16052 0))(
  ( (array!16053 (arr!7600 (Array (_ BitVec 32) (_ BitVec 64))) (size!7952 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16052)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16052 (_ BitVec 32)) SeekEntryResult!2705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314483 (= res!170286 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153938))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314483 (= lt!153938 (Intermediate!2705 false resIndex!52 resX!52))))

(declare-fun b!314484 () Bool)

(declare-fun res!170289 () Bool)

(assert (=> b!314484 (=> (not res!170289) (not e!195838))))

(declare-fun arrayContainsKey!0 (array!16052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314484 (= res!170289 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!153939 () SeekEntryResult!2705)

(declare-fun b!314485 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!314485 (= e!195840 (and (= lt!153939 lt!153938) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7600 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7600 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7600 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!153939 (Intermediate!2705 false index!1781 resX!52)))))))

(assert (=> b!314485 (= lt!153939 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314486 () Bool)

(declare-fun res!170287 () Bool)

(assert (=> b!314486 (=> (not res!170287) (not e!195840))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314486 (= res!170287 (and (= (select (arr!7600 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7952 a!3293))))))

(declare-fun b!314487 () Bool)

(declare-fun res!170283 () Bool)

(assert (=> b!314487 (=> (not res!170283) (not e!195838))))

(assert (=> b!314487 (= res!170283 (and (= (size!7952 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7952 a!3293))))))

(declare-fun b!314488 () Bool)

(declare-fun res!170282 () Bool)

(assert (=> b!314488 (=> (not res!170282) (not e!195838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16052 (_ BitVec 32)) Bool)

(assert (=> b!314488 (= res!170282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!170288 () Bool)

(assert (=> start!31368 (=> (not res!170288) (not e!195838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31368 (= res!170288 (validMask!0 mask!3709))))

(assert (=> start!31368 e!195838))

(declare-fun array_inv!5550 (array!16052) Bool)

(assert (=> start!31368 (array_inv!5550 a!3293)))

(assert (=> start!31368 true))

(declare-fun b!314489 () Bool)

(declare-fun res!170285 () Bool)

(assert (=> b!314489 (=> (not res!170285) (not e!195838))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16052 (_ BitVec 32)) SeekEntryResult!2705)

(assert (=> b!314489 (= res!170285 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2705 i!1240)))))

(declare-fun b!314490 () Bool)

(declare-fun res!170284 () Bool)

(assert (=> b!314490 (=> (not res!170284) (not e!195838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314490 (= res!170284 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31368 res!170288) b!314487))

(assert (= (and b!314487 res!170283) b!314490))

(assert (= (and b!314490 res!170284) b!314484))

(assert (= (and b!314484 res!170289) b!314489))

(assert (= (and b!314489 res!170285) b!314488))

(assert (= (and b!314488 res!170282) b!314483))

(assert (= (and b!314483 res!170286) b!314486))

(assert (= (and b!314486 res!170287) b!314485))

(declare-fun m!324217 () Bool)

(assert (=> b!314488 m!324217))

(declare-fun m!324219 () Bool)

(assert (=> b!314486 m!324219))

(declare-fun m!324221 () Bool)

(assert (=> b!314490 m!324221))

(declare-fun m!324223 () Bool)

(assert (=> b!314489 m!324223))

(declare-fun m!324225 () Bool)

(assert (=> b!314485 m!324225))

(declare-fun m!324227 () Bool)

(assert (=> b!314485 m!324227))

(declare-fun m!324229 () Bool)

(assert (=> b!314484 m!324229))

(declare-fun m!324231 () Bool)

(assert (=> b!314483 m!324231))

(assert (=> b!314483 m!324231))

(declare-fun m!324233 () Bool)

(assert (=> b!314483 m!324233))

(declare-fun m!324235 () Bool)

(assert (=> start!31368 m!324235))

(declare-fun m!324237 () Bool)

(assert (=> start!31368 m!324237))

(check-sat (not b!314485) (not b!314490) (not start!31368) (not b!314488) (not b!314483) (not b!314484) (not b!314489))
(check-sat)
(get-model)

(declare-fun d!68801 () Bool)

(declare-fun e!195891 () Bool)

(assert (=> d!68801 e!195891))

(declare-fun c!49736 () Bool)

(declare-fun lt!153978 () SeekEntryResult!2705)

(get-info :version)

(assert (=> d!68801 (= c!49736 (and ((_ is Intermediate!2705) lt!153978) (undefined!3517 lt!153978)))))

(declare-fun e!195890 () SeekEntryResult!2705)

(assert (=> d!68801 (= lt!153978 e!195890)))

(declare-fun c!49737 () Bool)

(assert (=> d!68801 (= c!49737 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153977 () (_ BitVec 64))

(assert (=> d!68801 (= lt!153977 (select (arr!7600 a!3293) index!1781))))

(assert (=> d!68801 (validMask!0 mask!3709)))

(assert (=> d!68801 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153978)))

(declare-fun e!195892 () SeekEntryResult!2705)

(declare-fun b!314595 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314595 (= e!195892 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314596 () Bool)

(assert (=> b!314596 (and (bvsge (index!12998 lt!153978) #b00000000000000000000000000000000) (bvslt (index!12998 lt!153978) (size!7952 a!3293)))))

(declare-fun res!170350 () Bool)

(assert (=> b!314596 (= res!170350 (= (select (arr!7600 a!3293) (index!12998 lt!153978)) k0!2441))))

(declare-fun e!195894 () Bool)

(assert (=> b!314596 (=> res!170350 e!195894)))

(declare-fun e!195893 () Bool)

(assert (=> b!314596 (= e!195893 e!195894)))

(declare-fun b!314597 () Bool)

(assert (=> b!314597 (= e!195891 e!195893)))

(declare-fun res!170349 () Bool)

(assert (=> b!314597 (= res!170349 (and ((_ is Intermediate!2705) lt!153978) (not (undefined!3517 lt!153978)) (bvslt (x!31332 lt!153978) #b01111111111111111111111111111110) (bvsge (x!31332 lt!153978) #b00000000000000000000000000000000) (bvsge (x!31332 lt!153978) x!1427)))))

(assert (=> b!314597 (=> (not res!170349) (not e!195893))))

(declare-fun b!314598 () Bool)

(assert (=> b!314598 (and (bvsge (index!12998 lt!153978) #b00000000000000000000000000000000) (bvslt (index!12998 lt!153978) (size!7952 a!3293)))))

(declare-fun res!170348 () Bool)

(assert (=> b!314598 (= res!170348 (= (select (arr!7600 a!3293) (index!12998 lt!153978)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314598 (=> res!170348 e!195894)))

(declare-fun b!314599 () Bool)

(assert (=> b!314599 (= e!195890 (Intermediate!2705 true index!1781 x!1427))))

(declare-fun b!314600 () Bool)

(assert (=> b!314600 (and (bvsge (index!12998 lt!153978) #b00000000000000000000000000000000) (bvslt (index!12998 lt!153978) (size!7952 a!3293)))))

(assert (=> b!314600 (= e!195894 (= (select (arr!7600 a!3293) (index!12998 lt!153978)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314601 () Bool)

(assert (=> b!314601 (= e!195891 (bvsge (x!31332 lt!153978) #b01111111111111111111111111111110))))

(declare-fun b!314602 () Bool)

(assert (=> b!314602 (= e!195892 (Intermediate!2705 false index!1781 x!1427))))

(declare-fun b!314603 () Bool)

(assert (=> b!314603 (= e!195890 e!195892)))

(declare-fun c!49738 () Bool)

(assert (=> b!314603 (= c!49738 (or (= lt!153977 k0!2441) (= (bvadd lt!153977 lt!153977) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68801 c!49737) b!314599))

(assert (= (and d!68801 (not c!49737)) b!314603))

(assert (= (and b!314603 c!49738) b!314602))

(assert (= (and b!314603 (not c!49738)) b!314595))

(assert (= (and d!68801 c!49736) b!314601))

(assert (= (and d!68801 (not c!49736)) b!314597))

(assert (= (and b!314597 res!170349) b!314596))

(assert (= (and b!314596 (not res!170350)) b!314598))

(assert (= (and b!314598 (not res!170348)) b!314600))

(declare-fun m!324293 () Bool)

(assert (=> b!314598 m!324293))

(declare-fun m!324295 () Bool)

(assert (=> b!314595 m!324295))

(assert (=> b!314595 m!324295))

(declare-fun m!324297 () Bool)

(assert (=> b!314595 m!324297))

(assert (=> d!68801 m!324225))

(assert (=> d!68801 m!324235))

(assert (=> b!314600 m!324293))

(assert (=> b!314596 m!324293))

(assert (=> b!314485 d!68801))

(declare-fun d!68807 () Bool)

(assert (=> d!68807 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314490 d!68807))

(declare-fun b!314659 () Bool)

(declare-fun e!195930 () SeekEntryResult!2705)

(declare-fun lt!153998 () SeekEntryResult!2705)

(assert (=> b!314659 (= e!195930 (Found!2705 (index!12998 lt!153998)))))

(declare-fun b!314660 () Bool)

(declare-fun e!195929 () SeekEntryResult!2705)

(assert (=> b!314660 (= e!195929 (MissingZero!2705 (index!12998 lt!153998)))))

(declare-fun d!68811 () Bool)

(declare-fun lt!153997 () SeekEntryResult!2705)

(assert (=> d!68811 (and (or ((_ is Undefined!2705) lt!153997) (not ((_ is Found!2705) lt!153997)) (and (bvsge (index!12997 lt!153997) #b00000000000000000000000000000000) (bvslt (index!12997 lt!153997) (size!7952 a!3293)))) (or ((_ is Undefined!2705) lt!153997) ((_ is Found!2705) lt!153997) (not ((_ is MissingZero!2705) lt!153997)) (and (bvsge (index!12996 lt!153997) #b00000000000000000000000000000000) (bvslt (index!12996 lt!153997) (size!7952 a!3293)))) (or ((_ is Undefined!2705) lt!153997) ((_ is Found!2705) lt!153997) ((_ is MissingZero!2705) lt!153997) (not ((_ is MissingVacant!2705) lt!153997)) (and (bvsge (index!12999 lt!153997) #b00000000000000000000000000000000) (bvslt (index!12999 lt!153997) (size!7952 a!3293)))) (or ((_ is Undefined!2705) lt!153997) (ite ((_ is Found!2705) lt!153997) (= (select (arr!7600 a!3293) (index!12997 lt!153997)) k0!2441) (ite ((_ is MissingZero!2705) lt!153997) (= (select (arr!7600 a!3293) (index!12996 lt!153997)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2705) lt!153997) (= (select (arr!7600 a!3293) (index!12999 lt!153997)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195928 () SeekEntryResult!2705)

(assert (=> d!68811 (= lt!153997 e!195928)))

(declare-fun c!49758 () Bool)

(assert (=> d!68811 (= c!49758 (and ((_ is Intermediate!2705) lt!153998) (undefined!3517 lt!153998)))))

(assert (=> d!68811 (= lt!153998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68811 (validMask!0 mask!3709)))

(assert (=> d!68811 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153997)))

(declare-fun b!314661 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16052 (_ BitVec 32)) SeekEntryResult!2705)

(assert (=> b!314661 (= e!195929 (seekKeyOrZeroReturnVacant!0 (x!31332 lt!153998) (index!12998 lt!153998) (index!12998 lt!153998) k0!2441 a!3293 mask!3709))))

(declare-fun b!314662 () Bool)

(assert (=> b!314662 (= e!195928 e!195930)))

(declare-fun lt!153999 () (_ BitVec 64))

(assert (=> b!314662 (= lt!153999 (select (arr!7600 a!3293) (index!12998 lt!153998)))))

(declare-fun c!49760 () Bool)

(assert (=> b!314662 (= c!49760 (= lt!153999 k0!2441))))

(declare-fun b!314663 () Bool)

(declare-fun c!49759 () Bool)

(assert (=> b!314663 (= c!49759 (= lt!153999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314663 (= e!195930 e!195929)))

(declare-fun b!314664 () Bool)

(assert (=> b!314664 (= e!195928 Undefined!2705)))

(assert (= (and d!68811 c!49758) b!314664))

(assert (= (and d!68811 (not c!49758)) b!314662))

(assert (= (and b!314662 c!49760) b!314659))

(assert (= (and b!314662 (not c!49760)) b!314663))

(assert (= (and b!314663 c!49759) b!314660))

(assert (= (and b!314663 (not c!49759)) b!314661))

(declare-fun m!324325 () Bool)

(assert (=> d!68811 m!324325))

(assert (=> d!68811 m!324235))

(declare-fun m!324329 () Bool)

(assert (=> d!68811 m!324329))

(assert (=> d!68811 m!324231))

(assert (=> d!68811 m!324231))

(assert (=> d!68811 m!324233))

(declare-fun m!324333 () Bool)

(assert (=> d!68811 m!324333))

(declare-fun m!324337 () Bool)

(assert (=> b!314661 m!324337))

(declare-fun m!324339 () Bool)

(assert (=> b!314662 m!324339))

(assert (=> b!314489 d!68811))

(declare-fun d!68821 () Bool)

(declare-fun res!170377 () Bool)

(declare-fun e!195941 () Bool)

(assert (=> d!68821 (=> res!170377 e!195941)))

(assert (=> d!68821 (= res!170377 (= (select (arr!7600 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68821 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195941)))

(declare-fun b!314677 () Bool)

(declare-fun e!195942 () Bool)

(assert (=> b!314677 (= e!195941 e!195942)))

(declare-fun res!170378 () Bool)

(assert (=> b!314677 (=> (not res!170378) (not e!195942))))

(assert (=> b!314677 (= res!170378 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7952 a!3293)))))

(declare-fun b!314678 () Bool)

(assert (=> b!314678 (= e!195942 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68821 (not res!170377)) b!314677))

(assert (= (and b!314677 res!170378) b!314678))

(declare-fun m!324343 () Bool)

(assert (=> d!68821 m!324343))

(declare-fun m!324345 () Bool)

(assert (=> b!314678 m!324345))

(assert (=> b!314484 d!68821))

(declare-fun d!68825 () Bool)

(declare-fun e!195947 () Bool)

(assert (=> d!68825 e!195947))

(declare-fun c!49764 () Bool)

(declare-fun lt!154010 () SeekEntryResult!2705)

(assert (=> d!68825 (= c!49764 (and ((_ is Intermediate!2705) lt!154010) (undefined!3517 lt!154010)))))

(declare-fun e!195946 () SeekEntryResult!2705)

(assert (=> d!68825 (= lt!154010 e!195946)))

(declare-fun c!49765 () Bool)

(assert (=> d!68825 (= c!49765 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154009 () (_ BitVec 64))

(assert (=> d!68825 (= lt!154009 (select (arr!7600 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68825 (validMask!0 mask!3709)))

(assert (=> d!68825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154010)))

(declare-fun b!314683 () Bool)

(declare-fun e!195948 () SeekEntryResult!2705)

(assert (=> b!314683 (= e!195948 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314684 () Bool)

(assert (=> b!314684 (and (bvsge (index!12998 lt!154010) #b00000000000000000000000000000000) (bvslt (index!12998 lt!154010) (size!7952 a!3293)))))

(declare-fun res!170383 () Bool)

(assert (=> b!314684 (= res!170383 (= (select (arr!7600 a!3293) (index!12998 lt!154010)) k0!2441))))

(declare-fun e!195950 () Bool)

(assert (=> b!314684 (=> res!170383 e!195950)))

(declare-fun e!195949 () Bool)

(assert (=> b!314684 (= e!195949 e!195950)))

(declare-fun b!314685 () Bool)

(assert (=> b!314685 (= e!195947 e!195949)))

(declare-fun res!170382 () Bool)

(assert (=> b!314685 (= res!170382 (and ((_ is Intermediate!2705) lt!154010) (not (undefined!3517 lt!154010)) (bvslt (x!31332 lt!154010) #b01111111111111111111111111111110) (bvsge (x!31332 lt!154010) #b00000000000000000000000000000000) (bvsge (x!31332 lt!154010) #b00000000000000000000000000000000)))))

(assert (=> b!314685 (=> (not res!170382) (not e!195949))))

(declare-fun b!314686 () Bool)

(assert (=> b!314686 (and (bvsge (index!12998 lt!154010) #b00000000000000000000000000000000) (bvslt (index!12998 lt!154010) (size!7952 a!3293)))))

(declare-fun res!170381 () Bool)

(assert (=> b!314686 (= res!170381 (= (select (arr!7600 a!3293) (index!12998 lt!154010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314686 (=> res!170381 e!195950)))

(declare-fun b!314687 () Bool)

(assert (=> b!314687 (= e!195946 (Intermediate!2705 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314688 () Bool)

(assert (=> b!314688 (and (bvsge (index!12998 lt!154010) #b00000000000000000000000000000000) (bvslt (index!12998 lt!154010) (size!7952 a!3293)))))

(assert (=> b!314688 (= e!195950 (= (select (arr!7600 a!3293) (index!12998 lt!154010)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314689 () Bool)

(assert (=> b!314689 (= e!195947 (bvsge (x!31332 lt!154010) #b01111111111111111111111111111110))))

(declare-fun b!314690 () Bool)

(assert (=> b!314690 (= e!195948 (Intermediate!2705 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314691 () Bool)

(assert (=> b!314691 (= e!195946 e!195948)))

(declare-fun c!49766 () Bool)

(assert (=> b!314691 (= c!49766 (or (= lt!154009 k0!2441) (= (bvadd lt!154009 lt!154009) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68825 c!49765) b!314687))

(assert (= (and d!68825 (not c!49765)) b!314691))

(assert (= (and b!314691 c!49766) b!314690))

(assert (= (and b!314691 (not c!49766)) b!314683))

(assert (= (and d!68825 c!49764) b!314689))

(assert (= (and d!68825 (not c!49764)) b!314685))

(assert (= (and b!314685 res!170382) b!314684))

(assert (= (and b!314684 (not res!170383)) b!314686))

(assert (= (and b!314686 (not res!170381)) b!314688))

(declare-fun m!324357 () Bool)

(assert (=> b!314686 m!324357))

(assert (=> b!314683 m!324231))

(declare-fun m!324359 () Bool)

(assert (=> b!314683 m!324359))

(assert (=> b!314683 m!324359))

(declare-fun m!324361 () Bool)

(assert (=> b!314683 m!324361))

(assert (=> d!68825 m!324231))

(declare-fun m!324363 () Bool)

(assert (=> d!68825 m!324363))

(assert (=> d!68825 m!324235))

(assert (=> b!314688 m!324357))

(assert (=> b!314684 m!324357))

(assert (=> b!314483 d!68825))

(declare-fun d!68829 () Bool)

(declare-fun lt!154024 () (_ BitVec 32))

(declare-fun lt!154023 () (_ BitVec 32))

(assert (=> d!68829 (= lt!154024 (bvmul (bvxor lt!154023 (bvlshr lt!154023 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68829 (= lt!154023 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68829 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170384 (let ((h!5274 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31338 (bvmul (bvxor h!5274 (bvlshr h!5274 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31338 (bvlshr x!31338 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170384 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170384 #b00000000000000000000000000000000))))))

(assert (=> d!68829 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154024 (bvlshr lt!154024 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314483 d!68829))

(declare-fun b!314709 () Bool)

(declare-fun e!195963 () Bool)

(declare-fun e!195962 () Bool)

(assert (=> b!314709 (= e!195963 e!195962)))

(declare-fun c!49772 () Bool)

(assert (=> b!314709 (= c!49772 (validKeyInArray!0 (select (arr!7600 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!314710 () Bool)

(declare-fun e!195964 () Bool)

(assert (=> b!314710 (= e!195962 e!195964)))

(declare-fun lt!154031 () (_ BitVec 64))

(assert (=> b!314710 (= lt!154031 (select (arr!7600 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9657 0))(
  ( (Unit!9658) )
))
(declare-fun lt!154032 () Unit!9657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16052 (_ BitVec 64) (_ BitVec 32)) Unit!9657)

(assert (=> b!314710 (= lt!154032 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154031 #b00000000000000000000000000000000))))

(assert (=> b!314710 (arrayContainsKey!0 a!3293 lt!154031 #b00000000000000000000000000000000)))

(declare-fun lt!154033 () Unit!9657)

(assert (=> b!314710 (= lt!154033 lt!154032)))

(declare-fun res!170392 () Bool)

(assert (=> b!314710 (= res!170392 (= (seekEntryOrOpen!0 (select (arr!7600 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2705 #b00000000000000000000000000000000)))))

(assert (=> b!314710 (=> (not res!170392) (not e!195964))))

(declare-fun b!314711 () Bool)

(declare-fun call!25967 () Bool)

(assert (=> b!314711 (= e!195962 call!25967)))

(declare-fun bm!25964 () Bool)

(assert (=> bm!25964 (= call!25967 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!314712 () Bool)

(assert (=> b!314712 (= e!195964 call!25967)))

(declare-fun d!68837 () Bool)

(declare-fun res!170393 () Bool)

(assert (=> d!68837 (=> res!170393 e!195963)))

(assert (=> d!68837 (= res!170393 (bvsge #b00000000000000000000000000000000 (size!7952 a!3293)))))

(assert (=> d!68837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195963)))

(assert (= (and d!68837 (not res!170393)) b!314709))

(assert (= (and b!314709 c!49772) b!314710))

(assert (= (and b!314709 (not c!49772)) b!314711))

(assert (= (and b!314710 res!170392) b!314712))

(assert (= (or b!314712 b!314711) bm!25964))

(assert (=> b!314709 m!324343))

(assert (=> b!314709 m!324343))

(declare-fun m!324371 () Bool)

(assert (=> b!314709 m!324371))

(assert (=> b!314710 m!324343))

(declare-fun m!324373 () Bool)

(assert (=> b!314710 m!324373))

(declare-fun m!324375 () Bool)

(assert (=> b!314710 m!324375))

(assert (=> b!314710 m!324343))

(declare-fun m!324377 () Bool)

(assert (=> b!314710 m!324377))

(declare-fun m!324379 () Bool)

(assert (=> bm!25964 m!324379))

(assert (=> b!314488 d!68837))

(declare-fun d!68843 () Bool)

(assert (=> d!68843 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31368 d!68843))

(declare-fun d!68851 () Bool)

(assert (=> d!68851 (= (array_inv!5550 a!3293) (bvsge (size!7952 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31368 d!68851))

(check-sat (not b!314595) (not d!68811) (not d!68801) (not b!314709) (not b!314661) (not b!314683) (not d!68825) (not b!314678) (not bm!25964) (not b!314710))
(check-sat)
