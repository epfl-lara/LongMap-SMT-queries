; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44784 () Bool)

(assert start!44784)

(declare-fun b!491596 () Bool)

(declare-fun res!294677 () Bool)

(declare-fun e!288784 () Bool)

(assert (=> b!491596 (=> (not res!294677) (not e!288784))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31853 0))(
  ( (array!31854 (arr!15314 (Array (_ BitVec 32) (_ BitVec 64))) (size!15679 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31853)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491596 (= res!294677 (and (= (size!15679 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15679 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15679 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491597 () Bool)

(declare-fun res!294674 () Bool)

(declare-fun e!288782 () Bool)

(assert (=> b!491597 (=> (not res!294674) (not e!288782))))

(declare-datatypes ((List!9511 0))(
  ( (Nil!9508) (Cons!9507 (h!10369 (_ BitVec 64)) (t!15730 List!9511)) )
))
(declare-fun arrayNoDuplicates!0 (array!31853 (_ BitVec 32) List!9511) Bool)

(assert (=> b!491597 (= res!294674 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9508))))

(declare-fun b!491598 () Bool)

(declare-fun res!294679 () Bool)

(assert (=> b!491598 (=> (not res!294679) (not e!288784))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491598 (= res!294679 (validKeyInArray!0 k0!2280))))

(declare-fun b!491599 () Bool)

(declare-fun res!294681 () Bool)

(assert (=> b!491599 (=> (not res!294681) (not e!288784))))

(declare-fun arrayContainsKey!0 (array!31853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491599 (= res!294681 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491600 () Bool)

(declare-fun e!288785 () Bool)

(declare-datatypes ((SeekEntryResult!3778 0))(
  ( (MissingZero!3778 (index!17291 (_ BitVec 32))) (Found!3778 (index!17292 (_ BitVec 32))) (Intermediate!3778 (undefined!4590 Bool) (index!17293 (_ BitVec 32)) (x!46383 (_ BitVec 32))) (Undefined!3778) (MissingVacant!3778 (index!17294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31853 (_ BitVec 32)) SeekEntryResult!3778)

(assert (=> b!491600 (= e!288785 (= (seekEntryOrOpen!0 (select (arr!15314 a!3235) j!176) a!3235 mask!3524) (Found!3778 j!176)))))

(declare-fun b!491601 () Bool)

(declare-fun res!294682 () Bool)

(assert (=> b!491601 (=> (not res!294682) (not e!288782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31853 (_ BitVec 32)) Bool)

(assert (=> b!491601 (= res!294682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491602 () Bool)

(declare-fun res!294675 () Bool)

(assert (=> b!491602 (=> (not res!294675) (not e!288784))))

(assert (=> b!491602 (= res!294675 (validKeyInArray!0 (select (arr!15314 a!3235) j!176)))))

(declare-fun b!491603 () Bool)

(assert (=> b!491603 (= e!288784 e!288782)))

(declare-fun res!294680 () Bool)

(assert (=> b!491603 (=> (not res!294680) (not e!288782))))

(declare-fun lt!222147 () SeekEntryResult!3778)

(assert (=> b!491603 (= res!294680 (or (= lt!222147 (MissingZero!3778 i!1204)) (= lt!222147 (MissingVacant!3778 i!1204))))))

(assert (=> b!491603 (= lt!222147 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!294676 () Bool)

(assert (=> start!44784 (=> (not res!294676) (not e!288784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44784 (= res!294676 (validMask!0 mask!3524))))

(assert (=> start!44784 e!288784))

(assert (=> start!44784 true))

(declare-fun array_inv!11197 (array!31853) Bool)

(assert (=> start!44784 (array_inv!11197 a!3235)))

(declare-fun b!491604 () Bool)

(declare-fun e!288783 () Bool)

(assert (=> b!491604 (= e!288783 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(declare-fun b!491605 () Bool)

(assert (=> b!491605 (= e!288782 (not e!288783))))

(declare-fun res!294678 () Bool)

(assert (=> b!491605 (=> res!294678 e!288783)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31853 (_ BitVec 32)) SeekEntryResult!3778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491605 (= res!294678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15314 a!3235) j!176) mask!3524) (select (arr!15314 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) (array!31854 (store (arr!15314 a!3235) i!1204 k0!2280) (size!15679 a!3235)) mask!3524)))))

(assert (=> b!491605 e!288785))

(declare-fun res!294683 () Bool)

(assert (=> b!491605 (=> (not res!294683) (not e!288785))))

(assert (=> b!491605 (= res!294683 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14488 0))(
  ( (Unit!14489) )
))
(declare-fun lt!222148 () Unit!14488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14488)

(assert (=> b!491605 (= lt!222148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44784 res!294676) b!491596))

(assert (= (and b!491596 res!294677) b!491602))

(assert (= (and b!491602 res!294675) b!491598))

(assert (= (and b!491598 res!294679) b!491599))

(assert (= (and b!491599 res!294681) b!491603))

(assert (= (and b!491603 res!294680) b!491601))

(assert (= (and b!491601 res!294682) b!491597))

(assert (= (and b!491597 res!294674) b!491605))

(assert (= (and b!491605 res!294683) b!491600))

(assert (= (and b!491605 (not res!294678)) b!491604))

(declare-fun m!471865 () Bool)

(assert (=> b!491598 m!471865))

(declare-fun m!471867 () Bool)

(assert (=> b!491597 m!471867))

(declare-fun m!471869 () Bool)

(assert (=> b!491605 m!471869))

(declare-fun m!471871 () Bool)

(assert (=> b!491605 m!471871))

(declare-fun m!471873 () Bool)

(assert (=> b!491605 m!471873))

(declare-fun m!471875 () Bool)

(assert (=> b!491605 m!471875))

(declare-fun m!471877 () Bool)

(assert (=> b!491605 m!471877))

(declare-fun m!471879 () Bool)

(assert (=> b!491605 m!471879))

(assert (=> b!491605 m!471877))

(assert (=> b!491605 m!471875))

(declare-fun m!471881 () Bool)

(assert (=> b!491605 m!471881))

(assert (=> b!491605 m!471873))

(declare-fun m!471883 () Bool)

(assert (=> b!491605 m!471883))

(assert (=> b!491605 m!471877))

(declare-fun m!471885 () Bool)

(assert (=> b!491605 m!471885))

(assert (=> b!491605 m!471873))

(assert (=> b!491605 m!471881))

(assert (=> b!491600 m!471877))

(assert (=> b!491600 m!471877))

(declare-fun m!471887 () Bool)

(assert (=> b!491600 m!471887))

(declare-fun m!471889 () Bool)

(assert (=> b!491599 m!471889))

(declare-fun m!471891 () Bool)

(assert (=> start!44784 m!471891))

(declare-fun m!471893 () Bool)

(assert (=> start!44784 m!471893))

(assert (=> b!491602 m!471877))

(assert (=> b!491602 m!471877))

(declare-fun m!471895 () Bool)

(assert (=> b!491602 m!471895))

(declare-fun m!471897 () Bool)

(assert (=> b!491601 m!471897))

(declare-fun m!471899 () Bool)

(assert (=> b!491603 m!471899))

(check-sat (not b!491605) (not b!491599) (not b!491597) (not b!491601) (not b!491600) (not b!491598) (not b!491603) (not b!491602) (not start!44784))
(check-sat)
(get-model)

(declare-fun b!491678 () Bool)

(declare-fun lt!222169 () SeekEntryResult!3778)

(declare-fun e!288825 () SeekEntryResult!3778)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31853 (_ BitVec 32)) SeekEntryResult!3778)

(assert (=> b!491678 (= e!288825 (seekKeyOrZeroReturnVacant!0 (x!46383 lt!222169) (index!17293 lt!222169) (index!17293 lt!222169) (select (arr!15314 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!491679 () Bool)

(declare-fun e!288824 () SeekEntryResult!3778)

(assert (=> b!491679 (= e!288824 (Found!3778 (index!17293 lt!222169)))))

(declare-fun b!491680 () Bool)

(assert (=> b!491680 (= e!288825 (MissingZero!3778 (index!17293 lt!222169)))))

(declare-fun b!491681 () Bool)

(declare-fun e!288823 () SeekEntryResult!3778)

(assert (=> b!491681 (= e!288823 e!288824)))

(declare-fun lt!222167 () (_ BitVec 64))

(assert (=> b!491681 (= lt!222167 (select (arr!15314 a!3235) (index!17293 lt!222169)))))

(declare-fun c!58739 () Bool)

(assert (=> b!491681 (= c!58739 (= lt!222167 (select (arr!15314 a!3235) j!176)))))

(declare-fun d!77797 () Bool)

(declare-fun lt!222168 () SeekEntryResult!3778)

(get-info :version)

(assert (=> d!77797 (and (or ((_ is Undefined!3778) lt!222168) (not ((_ is Found!3778) lt!222168)) (and (bvsge (index!17292 lt!222168) #b00000000000000000000000000000000) (bvslt (index!17292 lt!222168) (size!15679 a!3235)))) (or ((_ is Undefined!3778) lt!222168) ((_ is Found!3778) lt!222168) (not ((_ is MissingZero!3778) lt!222168)) (and (bvsge (index!17291 lt!222168) #b00000000000000000000000000000000) (bvslt (index!17291 lt!222168) (size!15679 a!3235)))) (or ((_ is Undefined!3778) lt!222168) ((_ is Found!3778) lt!222168) ((_ is MissingZero!3778) lt!222168) (not ((_ is MissingVacant!3778) lt!222168)) (and (bvsge (index!17294 lt!222168) #b00000000000000000000000000000000) (bvslt (index!17294 lt!222168) (size!15679 a!3235)))) (or ((_ is Undefined!3778) lt!222168) (ite ((_ is Found!3778) lt!222168) (= (select (arr!15314 a!3235) (index!17292 lt!222168)) (select (arr!15314 a!3235) j!176)) (ite ((_ is MissingZero!3778) lt!222168) (= (select (arr!15314 a!3235) (index!17291 lt!222168)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3778) lt!222168) (= (select (arr!15314 a!3235) (index!17294 lt!222168)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77797 (= lt!222168 e!288823)))

(declare-fun c!58740 () Bool)

(assert (=> d!77797 (= c!58740 (and ((_ is Intermediate!3778) lt!222169) (undefined!4590 lt!222169)))))

(assert (=> d!77797 (= lt!222169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15314 a!3235) j!176) mask!3524) (select (arr!15314 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77797 (validMask!0 mask!3524)))

(assert (=> d!77797 (= (seekEntryOrOpen!0 (select (arr!15314 a!3235) j!176) a!3235 mask!3524) lt!222168)))

(declare-fun b!491682 () Bool)

(declare-fun c!58738 () Bool)

(assert (=> b!491682 (= c!58738 (= lt!222167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!491682 (= e!288824 e!288825)))

(declare-fun b!491683 () Bool)

(assert (=> b!491683 (= e!288823 Undefined!3778)))

(assert (= (and d!77797 c!58740) b!491683))

(assert (= (and d!77797 (not c!58740)) b!491681))

(assert (= (and b!491681 c!58739) b!491679))

(assert (= (and b!491681 (not c!58739)) b!491682))

(assert (= (and b!491682 c!58738) b!491680))

(assert (= (and b!491682 (not c!58738)) b!491678))

(assert (=> b!491678 m!471877))

(declare-fun m!471973 () Bool)

(assert (=> b!491678 m!471973))

(declare-fun m!471975 () Bool)

(assert (=> b!491681 m!471975))

(declare-fun m!471977 () Bool)

(assert (=> d!77797 m!471977))

(assert (=> d!77797 m!471875))

(assert (=> d!77797 m!471877))

(assert (=> d!77797 m!471879))

(assert (=> d!77797 m!471877))

(assert (=> d!77797 m!471875))

(declare-fun m!471979 () Bool)

(assert (=> d!77797 m!471979))

(assert (=> d!77797 m!471891))

(declare-fun m!471981 () Bool)

(assert (=> d!77797 m!471981))

(assert (=> b!491600 d!77797))

(declare-fun b!491730 () Bool)

(declare-fun lt!222189 () SeekEntryResult!3778)

(assert (=> b!491730 (and (bvsge (index!17293 lt!222189) #b00000000000000000000000000000000) (bvslt (index!17293 lt!222189) (size!15679 a!3235)))))

(declare-fun e!288856 () Bool)

(assert (=> b!491730 (= e!288856 (= (select (arr!15314 a!3235) (index!17293 lt!222189)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!491731 () Bool)

(declare-fun e!288859 () SeekEntryResult!3778)

(declare-fun e!288858 () SeekEntryResult!3778)

(assert (=> b!491731 (= e!288859 e!288858)))

(declare-fun lt!222190 () (_ BitVec 64))

(declare-fun c!58758 () Bool)

(assert (=> b!491731 (= c!58758 (or (= lt!222190 (select (arr!15314 a!3235) j!176)) (= (bvadd lt!222190 lt!222190) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!491732 () Bool)

(assert (=> b!491732 (and (bvsge (index!17293 lt!222189) #b00000000000000000000000000000000) (bvslt (index!17293 lt!222189) (size!15679 a!3235)))))

(declare-fun res!294761 () Bool)

(assert (=> b!491732 (= res!294761 (= (select (arr!15314 a!3235) (index!17293 lt!222189)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!491732 (=> res!294761 e!288856)))

(declare-fun d!77799 () Bool)

(declare-fun e!288855 () Bool)

(assert (=> d!77799 e!288855))

(declare-fun c!58757 () Bool)

(assert (=> d!77799 (= c!58757 (and ((_ is Intermediate!3778) lt!222189) (undefined!4590 lt!222189)))))

(assert (=> d!77799 (= lt!222189 e!288859)))

(declare-fun c!58756 () Bool)

(assert (=> d!77799 (= c!58756 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!77799 (= lt!222190 (select (arr!15314 a!3235) (toIndex!0 (select (arr!15314 a!3235) j!176) mask!3524)))))

(assert (=> d!77799 (validMask!0 mask!3524)))

(assert (=> d!77799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15314 a!3235) j!176) mask!3524) (select (arr!15314 a!3235) j!176) a!3235 mask!3524) lt!222189)))

(declare-fun b!491733 () Bool)

(assert (=> b!491733 (and (bvsge (index!17293 lt!222189) #b00000000000000000000000000000000) (bvslt (index!17293 lt!222189) (size!15679 a!3235)))))

(declare-fun res!294762 () Bool)

(assert (=> b!491733 (= res!294762 (= (select (arr!15314 a!3235) (index!17293 lt!222189)) (select (arr!15314 a!3235) j!176)))))

(assert (=> b!491733 (=> res!294762 e!288856)))

(declare-fun e!288857 () Bool)

(assert (=> b!491733 (= e!288857 e!288856)))

(declare-fun b!491734 () Bool)

(assert (=> b!491734 (= e!288855 (bvsge (x!46383 lt!222189) #b01111111111111111111111111111110))))

(declare-fun b!491735 () Bool)

(assert (=> b!491735 (= e!288858 (Intermediate!3778 false (toIndex!0 (select (arr!15314 a!3235) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!491736 () Bool)

(assert (=> b!491736 (= e!288855 e!288857)))

(declare-fun res!294760 () Bool)

(assert (=> b!491736 (= res!294760 (and ((_ is Intermediate!3778) lt!222189) (not (undefined!4590 lt!222189)) (bvslt (x!46383 lt!222189) #b01111111111111111111111111111110) (bvsge (x!46383 lt!222189) #b00000000000000000000000000000000) (bvsge (x!46383 lt!222189) #b00000000000000000000000000000000)))))

(assert (=> b!491736 (=> (not res!294760) (not e!288857))))

(declare-fun b!491737 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491737 (= e!288858 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!15314 a!3235) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (arr!15314 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!491738 () Bool)

(assert (=> b!491738 (= e!288859 (Intermediate!3778 true (toIndex!0 (select (arr!15314 a!3235) j!176) mask!3524) #b00000000000000000000000000000000))))

(assert (= (and d!77799 c!58756) b!491738))

(assert (= (and d!77799 (not c!58756)) b!491731))

(assert (= (and b!491731 c!58758) b!491735))

(assert (= (and b!491731 (not c!58758)) b!491737))

(assert (= (and d!77799 c!58757) b!491734))

(assert (= (and d!77799 (not c!58757)) b!491736))

(assert (= (and b!491736 res!294760) b!491733))

(assert (= (and b!491733 (not res!294762)) b!491732))

(assert (= (and b!491732 (not res!294761)) b!491730))

(declare-fun m!471995 () Bool)

(assert (=> b!491730 m!471995))

(assert (=> b!491737 m!471875))

(declare-fun m!471997 () Bool)

(assert (=> b!491737 m!471997))

(assert (=> b!491737 m!471997))

(assert (=> b!491737 m!471877))

(declare-fun m!471999 () Bool)

(assert (=> b!491737 m!471999))

(assert (=> d!77799 m!471875))

(declare-fun m!472001 () Bool)

(assert (=> d!77799 m!472001))

(assert (=> d!77799 m!471891))

(assert (=> b!491732 m!471995))

(assert (=> b!491733 m!471995))

(assert (=> b!491605 d!77799))

(declare-fun d!77807 () Bool)

(declare-fun lt!222199 () (_ BitVec 32))

(declare-fun lt!222198 () (_ BitVec 32))

(assert (=> d!77807 (= lt!222199 (bvmul (bvxor lt!222198 (bvlshr lt!222198 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77807 (= lt!222198 ((_ extract 31 0) (bvand (bvxor (select (arr!15314 a!3235) j!176) (bvlshr (select (arr!15314 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77807 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!294765 (let ((h!10372 ((_ extract 31 0) (bvand (bvxor (select (arr!15314 a!3235) j!176) (bvlshr (select (arr!15314 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46387 (bvmul (bvxor h!10372 (bvlshr h!10372 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46387 (bvlshr x!46387 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!294765 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!294765 #b00000000000000000000000000000000))))))

(assert (=> d!77807 (= (toIndex!0 (select (arr!15314 a!3235) j!176) mask!3524) (bvand (bvxor lt!222199 (bvlshr lt!222199 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!491605 d!77807))

(declare-fun b!491770 () Bool)

(declare-fun e!288884 () Bool)

(declare-fun e!288883 () Bool)

(assert (=> b!491770 (= e!288884 e!288883)))

(declare-fun c!58767 () Bool)

(assert (=> b!491770 (= c!58767 (validKeyInArray!0 (select (arr!15314 a!3235) j!176)))))

(declare-fun b!491771 () Bool)

(declare-fun e!288885 () Bool)

(declare-fun call!31351 () Bool)

(assert (=> b!491771 (= e!288885 call!31351)))

(declare-fun d!77815 () Bool)

(declare-fun res!294779 () Bool)

(assert (=> d!77815 (=> res!294779 e!288884)))

(assert (=> d!77815 (= res!294779 (bvsge j!176 (size!15679 a!3235)))))

(assert (=> d!77815 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!288884)))

(declare-fun bm!31348 () Bool)

(assert (=> bm!31348 (= call!31351 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!491772 () Bool)

(assert (=> b!491772 (= e!288883 call!31351)))

(declare-fun b!491773 () Bool)

(assert (=> b!491773 (= e!288883 e!288885)))

(declare-fun lt!222207 () (_ BitVec 64))

(assert (=> b!491773 (= lt!222207 (select (arr!15314 a!3235) j!176))))

(declare-fun lt!222208 () Unit!14488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31853 (_ BitVec 64) (_ BitVec 32)) Unit!14488)

(assert (=> b!491773 (= lt!222208 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222207 j!176))))

(assert (=> b!491773 (arrayContainsKey!0 a!3235 lt!222207 #b00000000000000000000000000000000)))

(declare-fun lt!222206 () Unit!14488)

(assert (=> b!491773 (= lt!222206 lt!222208)))

(declare-fun res!294780 () Bool)

(assert (=> b!491773 (= res!294780 (= (seekEntryOrOpen!0 (select (arr!15314 a!3235) j!176) a!3235 mask!3524) (Found!3778 j!176)))))

(assert (=> b!491773 (=> (not res!294780) (not e!288885))))

(assert (= (and d!77815 (not res!294779)) b!491770))

(assert (= (and b!491770 c!58767) b!491773))

(assert (= (and b!491770 (not c!58767)) b!491772))

(assert (= (and b!491773 res!294780) b!491771))

(assert (= (or b!491771 b!491772) bm!31348))

(assert (=> b!491770 m!471877))

(assert (=> b!491770 m!471877))

(assert (=> b!491770 m!471895))

(declare-fun m!472027 () Bool)

(assert (=> bm!31348 m!472027))

(assert (=> b!491773 m!471877))

(declare-fun m!472029 () Bool)

(assert (=> b!491773 m!472029))

(declare-fun m!472031 () Bool)

(assert (=> b!491773 m!472031))

(assert (=> b!491773 m!471877))

(assert (=> b!491773 m!471887))

(assert (=> b!491605 d!77815))

(declare-fun d!77819 () Bool)

(assert (=> d!77819 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222215 () Unit!14488)

(declare-fun choose!38 (array!31853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14488)

(assert (=> d!77819 (= lt!222215 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77819 (validMask!0 mask!3524)))

(assert (=> d!77819 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!222215)))

(declare-fun bs!15658 () Bool)

(assert (= bs!15658 d!77819))

(assert (=> bs!15658 m!471885))

(declare-fun m!472033 () Bool)

(assert (=> bs!15658 m!472033))

(assert (=> bs!15658 m!471891))

(assert (=> b!491605 d!77819))

(declare-fun d!77821 () Bool)

(declare-fun lt!222217 () (_ BitVec 32))

(declare-fun lt!222216 () (_ BitVec 32))

(assert (=> d!77821 (= lt!222217 (bvmul (bvxor lt!222216 (bvlshr lt!222216 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77821 (= lt!222216 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77821 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!294765 (let ((h!10372 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46387 (bvmul (bvxor h!10372 (bvlshr h!10372 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46387 (bvlshr x!46387 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!294765 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!294765 #b00000000000000000000000000000000))))))

(assert (=> d!77821 (= (toIndex!0 (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!222217 (bvlshr lt!222217 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!491605 d!77821))

(declare-fun lt!222218 () SeekEntryResult!3778)

(declare-fun b!491792 () Bool)

(assert (=> b!491792 (and (bvsge (index!17293 lt!222218) #b00000000000000000000000000000000) (bvslt (index!17293 lt!222218) (size!15679 (array!31854 (store (arr!15314 a!3235) i!1204 k0!2280) (size!15679 a!3235)))))))

(declare-fun e!288897 () Bool)

(assert (=> b!491792 (= e!288897 (= (select (arr!15314 (array!31854 (store (arr!15314 a!3235) i!1204 k0!2280) (size!15679 a!3235))) (index!17293 lt!222218)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!491793 () Bool)

(declare-fun e!288900 () SeekEntryResult!3778)

(declare-fun e!288899 () SeekEntryResult!3778)

(assert (=> b!491793 (= e!288900 e!288899)))

(declare-fun c!58776 () Bool)

(declare-fun lt!222219 () (_ BitVec 64))

(assert (=> b!491793 (= c!58776 (or (= lt!222219 (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!222219 lt!222219) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!491794 () Bool)

(assert (=> b!491794 (and (bvsge (index!17293 lt!222218) #b00000000000000000000000000000000) (bvslt (index!17293 lt!222218) (size!15679 (array!31854 (store (arr!15314 a!3235) i!1204 k0!2280) (size!15679 a!3235)))))))

(declare-fun res!294788 () Bool)

(assert (=> b!491794 (= res!294788 (= (select (arr!15314 (array!31854 (store (arr!15314 a!3235) i!1204 k0!2280) (size!15679 a!3235))) (index!17293 lt!222218)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!491794 (=> res!294788 e!288897)))

(declare-fun d!77823 () Bool)

(declare-fun e!288896 () Bool)

(assert (=> d!77823 e!288896))

(declare-fun c!58775 () Bool)

(assert (=> d!77823 (= c!58775 (and ((_ is Intermediate!3778) lt!222218) (undefined!4590 lt!222218)))))

(assert (=> d!77823 (= lt!222218 e!288900)))

(declare-fun c!58774 () Bool)

(assert (=> d!77823 (= c!58774 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!77823 (= lt!222219 (select (arr!15314 (array!31854 (store (arr!15314 a!3235) i!1204 k0!2280) (size!15679 a!3235))) (toIndex!0 (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) mask!3524)))))

(assert (=> d!77823 (validMask!0 mask!3524)))

(assert (=> d!77823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) (array!31854 (store (arr!15314 a!3235) i!1204 k0!2280) (size!15679 a!3235)) mask!3524) lt!222218)))

(declare-fun b!491795 () Bool)

(assert (=> b!491795 (and (bvsge (index!17293 lt!222218) #b00000000000000000000000000000000) (bvslt (index!17293 lt!222218) (size!15679 (array!31854 (store (arr!15314 a!3235) i!1204 k0!2280) (size!15679 a!3235)))))))

(declare-fun res!294789 () Bool)

(assert (=> b!491795 (= res!294789 (= (select (arr!15314 (array!31854 (store (arr!15314 a!3235) i!1204 k0!2280) (size!15679 a!3235))) (index!17293 lt!222218)) (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!491795 (=> res!294789 e!288897)))

(declare-fun e!288898 () Bool)

(assert (=> b!491795 (= e!288898 e!288897)))

(declare-fun b!491796 () Bool)

(assert (=> b!491796 (= e!288896 (bvsge (x!46383 lt!222218) #b01111111111111111111111111111110))))

(declare-fun b!491797 () Bool)

(assert (=> b!491797 (= e!288899 (Intermediate!3778 false (toIndex!0 (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!491798 () Bool)

(assert (=> b!491798 (= e!288896 e!288898)))

(declare-fun res!294787 () Bool)

(assert (=> b!491798 (= res!294787 (and ((_ is Intermediate!3778) lt!222218) (not (undefined!4590 lt!222218)) (bvslt (x!46383 lt!222218) #b01111111111111111111111111111110) (bvsge (x!46383 lt!222218) #b00000000000000000000000000000000) (bvsge (x!46383 lt!222218) #b00000000000000000000000000000000)))))

(assert (=> b!491798 (=> (not res!294787) (not e!288898))))

(declare-fun b!491799 () Bool)

(assert (=> b!491799 (= e!288899 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) (array!31854 (store (arr!15314 a!3235) i!1204 k0!2280) (size!15679 a!3235)) mask!3524))))

(declare-fun b!491800 () Bool)

(assert (=> b!491800 (= e!288900 (Intermediate!3778 true (toIndex!0 (select (store (arr!15314 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(assert (= (and d!77823 c!58774) b!491800))

(assert (= (and d!77823 (not c!58774)) b!491793))

(assert (= (and b!491793 c!58776) b!491797))

(assert (= (and b!491793 (not c!58776)) b!491799))

(assert (= (and d!77823 c!58775) b!491796))

(assert (= (and d!77823 (not c!58775)) b!491798))

(assert (= (and b!491798 res!294787) b!491795))

(assert (= (and b!491795 (not res!294789)) b!491794))

(assert (= (and b!491794 (not res!294788)) b!491792))

(declare-fun m!472035 () Bool)

(assert (=> b!491792 m!472035))

(assert (=> b!491799 m!471881))

(declare-fun m!472037 () Bool)

(assert (=> b!491799 m!472037))

(assert (=> b!491799 m!472037))

(assert (=> b!491799 m!471873))

(declare-fun m!472039 () Bool)

(assert (=> b!491799 m!472039))

(assert (=> d!77823 m!471881))

(declare-fun m!472041 () Bool)

(assert (=> d!77823 m!472041))

(assert (=> d!77823 m!471891))

(assert (=> b!491794 m!472035))

(assert (=> b!491795 m!472035))

(assert (=> b!491605 d!77823))

(declare-fun b!491810 () Bool)

(declare-fun e!288907 () Bool)

(declare-fun e!288906 () Bool)

(assert (=> b!491810 (= e!288907 e!288906)))

(declare-fun c!58780 () Bool)

(assert (=> b!491810 (= c!58780 (validKeyInArray!0 (select (arr!15314 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!491811 () Bool)

(declare-fun e!288908 () Bool)

(declare-fun call!31352 () Bool)

(assert (=> b!491811 (= e!288908 call!31352)))

(declare-fun d!77825 () Bool)

(declare-fun res!294793 () Bool)

(assert (=> d!77825 (=> res!294793 e!288907)))

(assert (=> d!77825 (= res!294793 (bvsge #b00000000000000000000000000000000 (size!15679 a!3235)))))

(assert (=> d!77825 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!288907)))

(declare-fun bm!31349 () Bool)

(assert (=> bm!31349 (= call!31352 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!491812 () Bool)

(assert (=> b!491812 (= e!288906 call!31352)))

(declare-fun b!491813 () Bool)

(assert (=> b!491813 (= e!288906 e!288908)))

(declare-fun lt!222223 () (_ BitVec 64))

(assert (=> b!491813 (= lt!222223 (select (arr!15314 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!222224 () Unit!14488)

(assert (=> b!491813 (= lt!222224 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222223 #b00000000000000000000000000000000))))

(assert (=> b!491813 (arrayContainsKey!0 a!3235 lt!222223 #b00000000000000000000000000000000)))

(declare-fun lt!222222 () Unit!14488)

(assert (=> b!491813 (= lt!222222 lt!222224)))

(declare-fun res!294794 () Bool)

(assert (=> b!491813 (= res!294794 (= (seekEntryOrOpen!0 (select (arr!15314 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3778 #b00000000000000000000000000000000)))))

(assert (=> b!491813 (=> (not res!294794) (not e!288908))))

(assert (= (and d!77825 (not res!294793)) b!491810))

(assert (= (and b!491810 c!58780) b!491813))

(assert (= (and b!491810 (not c!58780)) b!491812))

(assert (= (and b!491813 res!294794) b!491811))

(assert (= (or b!491811 b!491812) bm!31349))

(declare-fun m!472043 () Bool)

(assert (=> b!491810 m!472043))

(assert (=> b!491810 m!472043))

(declare-fun m!472045 () Bool)

(assert (=> b!491810 m!472045))

(declare-fun m!472047 () Bool)

(assert (=> bm!31349 m!472047))

(assert (=> b!491813 m!472043))

(declare-fun m!472051 () Bool)

(assert (=> b!491813 m!472051))

(declare-fun m!472053 () Bool)

(assert (=> b!491813 m!472053))

(assert (=> b!491813 m!472043))

(declare-fun m!472057 () Bool)

(assert (=> b!491813 m!472057))

(assert (=> b!491601 d!77825))

(declare-fun d!77827 () Bool)

(assert (=> d!77827 (= (validKeyInArray!0 (select (arr!15314 a!3235) j!176)) (and (not (= (select (arr!15314 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15314 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!491602 d!77827))

(declare-fun b!491846 () Bool)

(declare-fun e!288932 () Bool)

(declare-fun contains!2692 (List!9511 (_ BitVec 64)) Bool)

(assert (=> b!491846 (= e!288932 (contains!2692 Nil!9508 (select (arr!15314 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77831 () Bool)

(declare-fun res!294811 () Bool)

(declare-fun e!288930 () Bool)

(assert (=> d!77831 (=> res!294811 e!288930)))

(assert (=> d!77831 (= res!294811 (bvsge #b00000000000000000000000000000000 (size!15679 a!3235)))))

(assert (=> d!77831 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9508) e!288930)))

(declare-fun b!491847 () Bool)

(declare-fun e!288933 () Bool)

(assert (=> b!491847 (= e!288930 e!288933)))

(declare-fun res!294812 () Bool)

(assert (=> b!491847 (=> (not res!294812) (not e!288933))))

(assert (=> b!491847 (= res!294812 (not e!288932))))

(declare-fun res!294810 () Bool)

(assert (=> b!491847 (=> (not res!294810) (not e!288932))))

(assert (=> b!491847 (= res!294810 (validKeyInArray!0 (select (arr!15314 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31353 () Bool)

(declare-fun call!31356 () Bool)

(declare-fun c!58790 () Bool)

(assert (=> bm!31353 (= call!31356 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58790 (Cons!9507 (select (arr!15314 a!3235) #b00000000000000000000000000000000) Nil!9508) Nil!9508)))))

(declare-fun b!491848 () Bool)

(declare-fun e!288931 () Bool)

(assert (=> b!491848 (= e!288931 call!31356)))

(declare-fun b!491849 () Bool)

(assert (=> b!491849 (= e!288933 e!288931)))

(assert (=> b!491849 (= c!58790 (validKeyInArray!0 (select (arr!15314 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!491850 () Bool)

(assert (=> b!491850 (= e!288931 call!31356)))

(assert (= (and d!77831 (not res!294811)) b!491847))

(assert (= (and b!491847 res!294810) b!491846))

(assert (= (and b!491847 res!294812) b!491849))

(assert (= (and b!491849 c!58790) b!491848))

(assert (= (and b!491849 (not c!58790)) b!491850))

(assert (= (or b!491848 b!491850) bm!31353))

(assert (=> b!491846 m!472043))

(assert (=> b!491846 m!472043))

(declare-fun m!472069 () Bool)

(assert (=> b!491846 m!472069))

(assert (=> b!491847 m!472043))

(assert (=> b!491847 m!472043))

(assert (=> b!491847 m!472045))

(assert (=> bm!31353 m!472043))

(declare-fun m!472071 () Bool)

(assert (=> bm!31353 m!472071))

(assert (=> b!491849 m!472043))

(assert (=> b!491849 m!472043))

(assert (=> b!491849 m!472045))

(assert (=> b!491597 d!77831))

(declare-fun d!77837 () Bool)

(assert (=> d!77837 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!491598 d!77837))

(declare-fun lt!222240 () SeekEntryResult!3778)

(declare-fun b!491851 () Bool)

(declare-fun e!288936 () SeekEntryResult!3778)

(assert (=> b!491851 (= e!288936 (seekKeyOrZeroReturnVacant!0 (x!46383 lt!222240) (index!17293 lt!222240) (index!17293 lt!222240) k0!2280 a!3235 mask!3524))))

(declare-fun b!491852 () Bool)

(declare-fun e!288935 () SeekEntryResult!3778)

(assert (=> b!491852 (= e!288935 (Found!3778 (index!17293 lt!222240)))))

(declare-fun b!491853 () Bool)

(assert (=> b!491853 (= e!288936 (MissingZero!3778 (index!17293 lt!222240)))))

(declare-fun b!491854 () Bool)

(declare-fun e!288934 () SeekEntryResult!3778)

(assert (=> b!491854 (= e!288934 e!288935)))

(declare-fun lt!222238 () (_ BitVec 64))

(assert (=> b!491854 (= lt!222238 (select (arr!15314 a!3235) (index!17293 lt!222240)))))

(declare-fun c!58792 () Bool)

(assert (=> b!491854 (= c!58792 (= lt!222238 k0!2280))))

(declare-fun d!77839 () Bool)

(declare-fun lt!222239 () SeekEntryResult!3778)

(assert (=> d!77839 (and (or ((_ is Undefined!3778) lt!222239) (not ((_ is Found!3778) lt!222239)) (and (bvsge (index!17292 lt!222239) #b00000000000000000000000000000000) (bvslt (index!17292 lt!222239) (size!15679 a!3235)))) (or ((_ is Undefined!3778) lt!222239) ((_ is Found!3778) lt!222239) (not ((_ is MissingZero!3778) lt!222239)) (and (bvsge (index!17291 lt!222239) #b00000000000000000000000000000000) (bvslt (index!17291 lt!222239) (size!15679 a!3235)))) (or ((_ is Undefined!3778) lt!222239) ((_ is Found!3778) lt!222239) ((_ is MissingZero!3778) lt!222239) (not ((_ is MissingVacant!3778) lt!222239)) (and (bvsge (index!17294 lt!222239) #b00000000000000000000000000000000) (bvslt (index!17294 lt!222239) (size!15679 a!3235)))) (or ((_ is Undefined!3778) lt!222239) (ite ((_ is Found!3778) lt!222239) (= (select (arr!15314 a!3235) (index!17292 lt!222239)) k0!2280) (ite ((_ is MissingZero!3778) lt!222239) (= (select (arr!15314 a!3235) (index!17291 lt!222239)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3778) lt!222239) (= (select (arr!15314 a!3235) (index!17294 lt!222239)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77839 (= lt!222239 e!288934)))

(declare-fun c!58793 () Bool)

(assert (=> d!77839 (= c!58793 (and ((_ is Intermediate!3778) lt!222240) (undefined!4590 lt!222240)))))

(assert (=> d!77839 (= lt!222240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77839 (validMask!0 mask!3524)))

(assert (=> d!77839 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!222239)))

(declare-fun b!491855 () Bool)

(declare-fun c!58791 () Bool)

(assert (=> b!491855 (= c!58791 (= lt!222238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!491855 (= e!288935 e!288936)))

(declare-fun b!491856 () Bool)

(assert (=> b!491856 (= e!288934 Undefined!3778)))

(assert (= (and d!77839 c!58793) b!491856))

(assert (= (and d!77839 (not c!58793)) b!491854))

(assert (= (and b!491854 c!58792) b!491852))

(assert (= (and b!491854 (not c!58792)) b!491855))

(assert (= (and b!491855 c!58791) b!491853))

(assert (= (and b!491855 (not c!58791)) b!491851))

(declare-fun m!472073 () Bool)

(assert (=> b!491851 m!472073))

(declare-fun m!472075 () Bool)

(assert (=> b!491854 m!472075))

(declare-fun m!472077 () Bool)

(assert (=> d!77839 m!472077))

(declare-fun m!472079 () Bool)

(assert (=> d!77839 m!472079))

(declare-fun m!472081 () Bool)

(assert (=> d!77839 m!472081))

(assert (=> d!77839 m!472079))

(declare-fun m!472083 () Bool)

(assert (=> d!77839 m!472083))

(assert (=> d!77839 m!471891))

(declare-fun m!472085 () Bool)

(assert (=> d!77839 m!472085))

(assert (=> b!491603 d!77839))

(declare-fun d!77841 () Bool)

(assert (=> d!77841 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44784 d!77841))

(declare-fun d!77853 () Bool)

(assert (=> d!77853 (= (array_inv!11197 a!3235) (bvsge (size!15679 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44784 d!77853))

(declare-fun d!77855 () Bool)

(declare-fun res!294828 () Bool)

(declare-fun e!288957 () Bool)

(assert (=> d!77855 (=> res!294828 e!288957)))

(assert (=> d!77855 (= res!294828 (= (select (arr!15314 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77855 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!288957)))

(declare-fun b!491887 () Bool)

(declare-fun e!288958 () Bool)

(assert (=> b!491887 (= e!288957 e!288958)))

(declare-fun res!294829 () Bool)

(assert (=> b!491887 (=> (not res!294829) (not e!288958))))

(assert (=> b!491887 (= res!294829 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15679 a!3235)))))

(declare-fun b!491888 () Bool)

(assert (=> b!491888 (= e!288958 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77855 (not res!294828)) b!491887))

(assert (= (and b!491887 res!294829) b!491888))

(assert (=> d!77855 m!472043))

(declare-fun m!472105 () Bool)

(assert (=> b!491888 m!472105))

(assert (=> b!491599 d!77855))

(check-sat (not b!491846) (not bm!31349) (not b!491851) (not d!77823) (not b!491810) (not b!491770) (not d!77839) (not bm!31348) (not b!491678) (not b!491773) (not d!77819) (not b!491813) (not d!77799) (not bm!31353) (not d!77797) (not b!491737) (not b!491799) (not b!491847) (not b!491888) (not b!491849))
(check-sat)
