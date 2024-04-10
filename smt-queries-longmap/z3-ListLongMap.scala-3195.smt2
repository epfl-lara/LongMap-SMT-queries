; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44798 () Bool)

(assert start!44798)

(declare-fun b!491897 () Bool)

(declare-fun res!294842 () Bool)

(declare-fun e!288974 () Bool)

(assert (=> b!491897 (=> (not res!294842) (not e!288974))))

(declare-datatypes ((array!31857 0))(
  ( (array!31858 (arr!15316 (Array (_ BitVec 32) (_ BitVec 64))) (size!15680 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31857)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31857 (_ BitVec 32)) Bool)

(assert (=> b!491897 (= res!294842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491898 () Bool)

(declare-fun res!294833 () Bool)

(declare-fun e!288971 () Bool)

(assert (=> b!491898 (=> (not res!294833) (not e!288971))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491898 (= res!294833 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!294841 () Bool)

(assert (=> start!44798 (=> (not res!294841) (not e!288971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44798 (= res!294841 (validMask!0 mask!3524))))

(assert (=> start!44798 e!288971))

(assert (=> start!44798 true))

(declare-fun array_inv!11112 (array!31857) Bool)

(assert (=> start!44798 (array_inv!11112 a!3235)))

(declare-fun b!491899 () Bool)

(assert (=> b!491899 (= e!288971 e!288974)))

(declare-fun res!294840 () Bool)

(assert (=> b!491899 (=> (not res!294840) (not e!288974))))

(declare-datatypes ((SeekEntryResult!3783 0))(
  ( (MissingZero!3783 (index!17311 (_ BitVec 32))) (Found!3783 (index!17312 (_ BitVec 32))) (Intermediate!3783 (undefined!4595 Bool) (index!17313 (_ BitVec 32)) (x!46393 (_ BitVec 32))) (Undefined!3783) (MissingVacant!3783 (index!17314 (_ BitVec 32))) )
))
(declare-fun lt!222388 () SeekEntryResult!3783)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491899 (= res!294840 (or (= lt!222388 (MissingZero!3783 i!1204)) (= lt!222388 (MissingVacant!3783 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31857 (_ BitVec 32)) SeekEntryResult!3783)

(assert (=> b!491899 (= lt!222388 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491900 () Bool)

(declare-fun e!288975 () Bool)

(assert (=> b!491900 (= e!288974 (not e!288975))))

(declare-fun res!294838 () Bool)

(assert (=> b!491900 (=> res!294838 e!288975)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31857 (_ BitVec 32)) SeekEntryResult!3783)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491900 (= res!294838 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15316 a!3235) j!176) mask!3524) (select (arr!15316 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) (array!31858 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235)) mask!3524)))))

(declare-fun e!288973 () Bool)

(assert (=> b!491900 e!288973))

(declare-fun res!294837 () Bool)

(assert (=> b!491900 (=> (not res!294837) (not e!288973))))

(assert (=> b!491900 (= res!294837 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14512 0))(
  ( (Unit!14513) )
))
(declare-fun lt!222387 () Unit!14512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14512)

(assert (=> b!491900 (= lt!222387 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491901 () Bool)

(declare-fun res!294839 () Bool)

(assert (=> b!491901 (=> (not res!294839) (not e!288971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491901 (= res!294839 (validKeyInArray!0 k0!2280))))

(declare-fun b!491902 () Bool)

(assert (=> b!491902 (= e!288975 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(declare-fun b!491903 () Bool)

(declare-fun res!294834 () Bool)

(assert (=> b!491903 (=> (not res!294834) (not e!288974))))

(declare-datatypes ((List!9474 0))(
  ( (Nil!9471) (Cons!9470 (h!10332 (_ BitVec 64)) (t!15702 List!9474)) )
))
(declare-fun arrayNoDuplicates!0 (array!31857 (_ BitVec 32) List!9474) Bool)

(assert (=> b!491903 (= res!294834 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9471))))

(declare-fun b!491904 () Bool)

(declare-fun res!294835 () Bool)

(assert (=> b!491904 (=> (not res!294835) (not e!288971))))

(assert (=> b!491904 (= res!294835 (validKeyInArray!0 (select (arr!15316 a!3235) j!176)))))

(declare-fun b!491905 () Bool)

(declare-fun res!294836 () Bool)

(assert (=> b!491905 (=> (not res!294836) (not e!288971))))

(assert (=> b!491905 (= res!294836 (and (= (size!15680 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15680 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15680 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491906 () Bool)

(assert (=> b!491906 (= e!288973 (= (seekEntryOrOpen!0 (select (arr!15316 a!3235) j!176) a!3235 mask!3524) (Found!3783 j!176)))))

(assert (= (and start!44798 res!294841) b!491905))

(assert (= (and b!491905 res!294836) b!491904))

(assert (= (and b!491904 res!294835) b!491901))

(assert (= (and b!491901 res!294839) b!491898))

(assert (= (and b!491898 res!294833) b!491899))

(assert (= (and b!491899 res!294840) b!491897))

(assert (= (and b!491897 res!294842) b!491903))

(assert (= (and b!491903 res!294834) b!491900))

(assert (= (and b!491900 res!294837) b!491906))

(assert (= (and b!491900 (not res!294838)) b!491902))

(declare-fun m!472653 () Bool)

(assert (=> b!491897 m!472653))

(declare-fun m!472655 () Bool)

(assert (=> start!44798 m!472655))

(declare-fun m!472657 () Bool)

(assert (=> start!44798 m!472657))

(declare-fun m!472659 () Bool)

(assert (=> b!491903 m!472659))

(declare-fun m!472661 () Bool)

(assert (=> b!491899 m!472661))

(declare-fun m!472663 () Bool)

(assert (=> b!491901 m!472663))

(declare-fun m!472665 () Bool)

(assert (=> b!491906 m!472665))

(assert (=> b!491906 m!472665))

(declare-fun m!472667 () Bool)

(assert (=> b!491906 m!472667))

(declare-fun m!472669 () Bool)

(assert (=> b!491898 m!472669))

(assert (=> b!491904 m!472665))

(assert (=> b!491904 m!472665))

(declare-fun m!472671 () Bool)

(assert (=> b!491904 m!472671))

(declare-fun m!472673 () Bool)

(assert (=> b!491900 m!472673))

(declare-fun m!472675 () Bool)

(assert (=> b!491900 m!472675))

(declare-fun m!472677 () Bool)

(assert (=> b!491900 m!472677))

(declare-fun m!472679 () Bool)

(assert (=> b!491900 m!472679))

(assert (=> b!491900 m!472665))

(declare-fun m!472681 () Bool)

(assert (=> b!491900 m!472681))

(assert (=> b!491900 m!472665))

(assert (=> b!491900 m!472679))

(declare-fun m!472683 () Bool)

(assert (=> b!491900 m!472683))

(assert (=> b!491900 m!472677))

(declare-fun m!472685 () Bool)

(assert (=> b!491900 m!472685))

(assert (=> b!491900 m!472665))

(declare-fun m!472687 () Bool)

(assert (=> b!491900 m!472687))

(assert (=> b!491900 m!472677))

(assert (=> b!491900 m!472683))

(check-sat (not b!491901) (not start!44798) (not b!491897) (not b!491904) (not b!491899) (not b!491903) (not b!491898) (not b!491906) (not b!491900))
(check-sat)
(get-model)

(declare-fun d!78001 () Bool)

(declare-fun res!294881 () Bool)

(declare-fun e!289002 () Bool)

(assert (=> d!78001 (=> res!294881 e!289002)))

(assert (=> d!78001 (= res!294881 (bvsge #b00000000000000000000000000000000 (size!15680 a!3235)))))

(assert (=> d!78001 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9471) e!289002)))

(declare-fun b!491947 () Bool)

(declare-fun e!289001 () Bool)

(declare-fun e!289000 () Bool)

(assert (=> b!491947 (= e!289001 e!289000)))

(declare-fun c!58805 () Bool)

(assert (=> b!491947 (= c!58805 (validKeyInArray!0 (select (arr!15316 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!491948 () Bool)

(declare-fun call!31370 () Bool)

(assert (=> b!491948 (= e!289000 call!31370)))

(declare-fun bm!31367 () Bool)

(assert (=> bm!31367 (= call!31370 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58805 (Cons!9470 (select (arr!15316 a!3235) #b00000000000000000000000000000000) Nil!9471) Nil!9471)))))

(declare-fun b!491949 () Bool)

(assert (=> b!491949 (= e!289002 e!289001)))

(declare-fun res!294880 () Bool)

(assert (=> b!491949 (=> (not res!294880) (not e!289001))))

(declare-fun e!288999 () Bool)

(assert (=> b!491949 (= res!294880 (not e!288999))))

(declare-fun res!294879 () Bool)

(assert (=> b!491949 (=> (not res!294879) (not e!288999))))

(assert (=> b!491949 (= res!294879 (validKeyInArray!0 (select (arr!15316 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!491950 () Bool)

(assert (=> b!491950 (= e!289000 call!31370)))

(declare-fun b!491951 () Bool)

(declare-fun contains!2709 (List!9474 (_ BitVec 64)) Bool)

(assert (=> b!491951 (= e!288999 (contains!2709 Nil!9471 (select (arr!15316 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78001 (not res!294881)) b!491949))

(assert (= (and b!491949 res!294879) b!491951))

(assert (= (and b!491949 res!294880) b!491947))

(assert (= (and b!491947 c!58805) b!491950))

(assert (= (and b!491947 (not c!58805)) b!491948))

(assert (= (or b!491950 b!491948) bm!31367))

(declare-fun m!472725 () Bool)

(assert (=> b!491947 m!472725))

(assert (=> b!491947 m!472725))

(declare-fun m!472727 () Bool)

(assert (=> b!491947 m!472727))

(assert (=> bm!31367 m!472725))

(declare-fun m!472729 () Bool)

(assert (=> bm!31367 m!472729))

(assert (=> b!491949 m!472725))

(assert (=> b!491949 m!472725))

(assert (=> b!491949 m!472727))

(assert (=> b!491951 m!472725))

(assert (=> b!491951 m!472725))

(declare-fun m!472731 () Bool)

(assert (=> b!491951 m!472731))

(assert (=> b!491903 d!78001))

(declare-fun d!78003 () Bool)

(declare-fun res!294886 () Bool)

(declare-fun e!289011 () Bool)

(assert (=> d!78003 (=> res!294886 e!289011)))

(assert (=> d!78003 (= res!294886 (bvsge #b00000000000000000000000000000000 (size!15680 a!3235)))))

(assert (=> d!78003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!289011)))

(declare-fun b!491960 () Bool)

(declare-fun e!289010 () Bool)

(declare-fun call!31373 () Bool)

(assert (=> b!491960 (= e!289010 call!31373)))

(declare-fun b!491961 () Bool)

(declare-fun e!289009 () Bool)

(assert (=> b!491961 (= e!289009 e!289010)))

(declare-fun lt!222401 () (_ BitVec 64))

(assert (=> b!491961 (= lt!222401 (select (arr!15316 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!222402 () Unit!14512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31857 (_ BitVec 64) (_ BitVec 32)) Unit!14512)

(assert (=> b!491961 (= lt!222402 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222401 #b00000000000000000000000000000000))))

(assert (=> b!491961 (arrayContainsKey!0 a!3235 lt!222401 #b00000000000000000000000000000000)))

(declare-fun lt!222403 () Unit!14512)

(assert (=> b!491961 (= lt!222403 lt!222402)))

(declare-fun res!294887 () Bool)

(assert (=> b!491961 (= res!294887 (= (seekEntryOrOpen!0 (select (arr!15316 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3783 #b00000000000000000000000000000000)))))

(assert (=> b!491961 (=> (not res!294887) (not e!289010))))

(declare-fun bm!31370 () Bool)

(assert (=> bm!31370 (= call!31373 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!491962 () Bool)

(assert (=> b!491962 (= e!289011 e!289009)))

(declare-fun c!58808 () Bool)

(assert (=> b!491962 (= c!58808 (validKeyInArray!0 (select (arr!15316 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!491963 () Bool)

(assert (=> b!491963 (= e!289009 call!31373)))

(assert (= (and d!78003 (not res!294886)) b!491962))

(assert (= (and b!491962 c!58808) b!491961))

(assert (= (and b!491962 (not c!58808)) b!491963))

(assert (= (and b!491961 res!294887) b!491960))

(assert (= (or b!491960 b!491963) bm!31370))

(assert (=> b!491961 m!472725))

(declare-fun m!472733 () Bool)

(assert (=> b!491961 m!472733))

(declare-fun m!472735 () Bool)

(assert (=> b!491961 m!472735))

(assert (=> b!491961 m!472725))

(declare-fun m!472737 () Bool)

(assert (=> b!491961 m!472737))

(declare-fun m!472739 () Bool)

(assert (=> bm!31370 m!472739))

(assert (=> b!491962 m!472725))

(assert (=> b!491962 m!472725))

(assert (=> b!491962 m!472727))

(assert (=> b!491897 d!78003))

(declare-fun d!78005 () Bool)

(assert (=> d!78005 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!491901 d!78005))

(declare-fun d!78007 () Bool)

(declare-fun lt!222410 () SeekEntryResult!3783)

(get-info :version)

(assert (=> d!78007 (and (or ((_ is Undefined!3783) lt!222410) (not ((_ is Found!3783) lt!222410)) (and (bvsge (index!17312 lt!222410) #b00000000000000000000000000000000) (bvslt (index!17312 lt!222410) (size!15680 a!3235)))) (or ((_ is Undefined!3783) lt!222410) ((_ is Found!3783) lt!222410) (not ((_ is MissingZero!3783) lt!222410)) (and (bvsge (index!17311 lt!222410) #b00000000000000000000000000000000) (bvslt (index!17311 lt!222410) (size!15680 a!3235)))) (or ((_ is Undefined!3783) lt!222410) ((_ is Found!3783) lt!222410) ((_ is MissingZero!3783) lt!222410) (not ((_ is MissingVacant!3783) lt!222410)) (and (bvsge (index!17314 lt!222410) #b00000000000000000000000000000000) (bvslt (index!17314 lt!222410) (size!15680 a!3235)))) (or ((_ is Undefined!3783) lt!222410) (ite ((_ is Found!3783) lt!222410) (= (select (arr!15316 a!3235) (index!17312 lt!222410)) (select (arr!15316 a!3235) j!176)) (ite ((_ is MissingZero!3783) lt!222410) (= (select (arr!15316 a!3235) (index!17311 lt!222410)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3783) lt!222410) (= (select (arr!15316 a!3235) (index!17314 lt!222410)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!289031 () SeekEntryResult!3783)

(assert (=> d!78007 (= lt!222410 e!289031)))

(declare-fun c!58820 () Bool)

(declare-fun lt!222412 () SeekEntryResult!3783)

(assert (=> d!78007 (= c!58820 (and ((_ is Intermediate!3783) lt!222412) (undefined!4595 lt!222412)))))

(assert (=> d!78007 (= lt!222412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15316 a!3235) j!176) mask!3524) (select (arr!15316 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78007 (validMask!0 mask!3524)))

(assert (=> d!78007 (= (seekEntryOrOpen!0 (select (arr!15316 a!3235) j!176) a!3235 mask!3524) lt!222410)))

(declare-fun b!491991 () Bool)

(declare-fun e!289032 () SeekEntryResult!3783)

(assert (=> b!491991 (= e!289031 e!289032)))

(declare-fun lt!222411 () (_ BitVec 64))

(assert (=> b!491991 (= lt!222411 (select (arr!15316 a!3235) (index!17313 lt!222412)))))

(declare-fun c!58819 () Bool)

(assert (=> b!491991 (= c!58819 (= lt!222411 (select (arr!15316 a!3235) j!176)))))

(declare-fun b!491992 () Bool)

(assert (=> b!491992 (= e!289031 Undefined!3783)))

(declare-fun b!491993 () Bool)

(assert (=> b!491993 (= e!289032 (Found!3783 (index!17313 lt!222412)))))

(declare-fun b!491994 () Bool)

(declare-fun c!58818 () Bool)

(assert (=> b!491994 (= c!58818 (= lt!222411 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289030 () SeekEntryResult!3783)

(assert (=> b!491994 (= e!289032 e!289030)))

(declare-fun b!491995 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31857 (_ BitVec 32)) SeekEntryResult!3783)

(assert (=> b!491995 (= e!289030 (seekKeyOrZeroReturnVacant!0 (x!46393 lt!222412) (index!17313 lt!222412) (index!17313 lt!222412) (select (arr!15316 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!491996 () Bool)

(assert (=> b!491996 (= e!289030 (MissingZero!3783 (index!17313 lt!222412)))))

(assert (= (and d!78007 c!58820) b!491992))

(assert (= (and d!78007 (not c!58820)) b!491991))

(assert (= (and b!491991 c!58819) b!491993))

(assert (= (and b!491991 (not c!58819)) b!491994))

(assert (= (and b!491994 c!58818) b!491996))

(assert (= (and b!491994 (not c!58818)) b!491995))

(declare-fun m!472749 () Bool)

(assert (=> d!78007 m!472749))

(assert (=> d!78007 m!472655))

(assert (=> d!78007 m!472665))

(assert (=> d!78007 m!472679))

(assert (=> d!78007 m!472679))

(assert (=> d!78007 m!472665))

(assert (=> d!78007 m!472681))

(declare-fun m!472751 () Bool)

(assert (=> d!78007 m!472751))

(declare-fun m!472753 () Bool)

(assert (=> d!78007 m!472753))

(declare-fun m!472755 () Bool)

(assert (=> b!491991 m!472755))

(assert (=> b!491995 m!472665))

(declare-fun m!472757 () Bool)

(assert (=> b!491995 m!472757))

(assert (=> b!491906 d!78007))

(declare-fun b!492042 () Bool)

(declare-fun e!289058 () Bool)

(declare-fun lt!222430 () SeekEntryResult!3783)

(assert (=> b!492042 (= e!289058 (bvsge (x!46393 lt!222430) #b01111111111111111111111111111110))))

(declare-fun e!289059 () SeekEntryResult!3783)

(declare-fun b!492043 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492043 (= e!289059 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!15316 a!3235) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (arr!15316 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492044 () Bool)

(assert (=> b!492044 (and (bvsge (index!17313 lt!222430) #b00000000000000000000000000000000) (bvslt (index!17313 lt!222430) (size!15680 a!3235)))))

(declare-fun e!289060 () Bool)

(assert (=> b!492044 (= e!289060 (= (select (arr!15316 a!3235) (index!17313 lt!222430)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492045 () Bool)

(assert (=> b!492045 (and (bvsge (index!17313 lt!222430) #b00000000000000000000000000000000) (bvslt (index!17313 lt!222430) (size!15680 a!3235)))))

(declare-fun res!294914 () Bool)

(assert (=> b!492045 (= res!294914 (= (select (arr!15316 a!3235) (index!17313 lt!222430)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492045 (=> res!294914 e!289060)))

(declare-fun b!492046 () Bool)

(declare-fun e!289061 () Bool)

(assert (=> b!492046 (= e!289058 e!289061)))

(declare-fun res!294915 () Bool)

(assert (=> b!492046 (= res!294915 (and ((_ is Intermediate!3783) lt!222430) (not (undefined!4595 lt!222430)) (bvslt (x!46393 lt!222430) #b01111111111111111111111111111110) (bvsge (x!46393 lt!222430) #b00000000000000000000000000000000) (bvsge (x!46393 lt!222430) #b00000000000000000000000000000000)))))

(assert (=> b!492046 (=> (not res!294915) (not e!289061))))

(declare-fun b!492047 () Bool)

(assert (=> b!492047 (= e!289059 (Intermediate!3783 false (toIndex!0 (select (arr!15316 a!3235) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun d!78015 () Bool)

(assert (=> d!78015 e!289058))

(declare-fun c!58838 () Bool)

(assert (=> d!78015 (= c!58838 (and ((_ is Intermediate!3783) lt!222430) (undefined!4595 lt!222430)))))

(declare-fun e!289062 () SeekEntryResult!3783)

(assert (=> d!78015 (= lt!222430 e!289062)))

(declare-fun c!58837 () Bool)

(assert (=> d!78015 (= c!58837 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222429 () (_ BitVec 64))

(assert (=> d!78015 (= lt!222429 (select (arr!15316 a!3235) (toIndex!0 (select (arr!15316 a!3235) j!176) mask!3524)))))

(assert (=> d!78015 (validMask!0 mask!3524)))

(assert (=> d!78015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15316 a!3235) j!176) mask!3524) (select (arr!15316 a!3235) j!176) a!3235 mask!3524) lt!222430)))

(declare-fun b!492048 () Bool)

(assert (=> b!492048 (and (bvsge (index!17313 lt!222430) #b00000000000000000000000000000000) (bvslt (index!17313 lt!222430) (size!15680 a!3235)))))

(declare-fun res!294913 () Bool)

(assert (=> b!492048 (= res!294913 (= (select (arr!15316 a!3235) (index!17313 lt!222430)) (select (arr!15316 a!3235) j!176)))))

(assert (=> b!492048 (=> res!294913 e!289060)))

(assert (=> b!492048 (= e!289061 e!289060)))

(declare-fun b!492049 () Bool)

(assert (=> b!492049 (= e!289062 e!289059)))

(declare-fun c!58836 () Bool)

(assert (=> b!492049 (= c!58836 (or (= lt!222429 (select (arr!15316 a!3235) j!176)) (= (bvadd lt!222429 lt!222429) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492050 () Bool)

(assert (=> b!492050 (= e!289062 (Intermediate!3783 true (toIndex!0 (select (arr!15316 a!3235) j!176) mask!3524) #b00000000000000000000000000000000))))

(assert (= (and d!78015 c!58837) b!492050))

(assert (= (and d!78015 (not c!58837)) b!492049))

(assert (= (and b!492049 c!58836) b!492047))

(assert (= (and b!492049 (not c!58836)) b!492043))

(assert (= (and d!78015 c!58838) b!492042))

(assert (= (and d!78015 (not c!58838)) b!492046))

(assert (= (and b!492046 res!294915) b!492048))

(assert (= (and b!492048 (not res!294913)) b!492045))

(assert (= (and b!492045 (not res!294914)) b!492044))

(declare-fun m!472767 () Bool)

(assert (=> b!492048 m!472767))

(assert (=> b!492045 m!472767))

(assert (=> b!492044 m!472767))

(assert (=> d!78015 m!472679))

(declare-fun m!472769 () Bool)

(assert (=> d!78015 m!472769))

(assert (=> d!78015 m!472655))

(assert (=> b!492043 m!472679))

(declare-fun m!472771 () Bool)

(assert (=> b!492043 m!472771))

(assert (=> b!492043 m!472771))

(assert (=> b!492043 m!472665))

(declare-fun m!472773 () Bool)

(assert (=> b!492043 m!472773))

(assert (=> b!491900 d!78015))

(declare-fun d!78023 () Bool)

(declare-fun lt!222446 () (_ BitVec 32))

(declare-fun lt!222445 () (_ BitVec 32))

(assert (=> d!78023 (= lt!222446 (bvmul (bvxor lt!222445 (bvlshr lt!222445 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78023 (= lt!222445 ((_ extract 31 0) (bvand (bvxor (select (arr!15316 a!3235) j!176) (bvlshr (select (arr!15316 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78023 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!294916 (let ((h!10335 ((_ extract 31 0) (bvand (bvxor (select (arr!15316 a!3235) j!176) (bvlshr (select (arr!15316 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46398 (bvmul (bvxor h!10335 (bvlshr h!10335 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46398 (bvlshr x!46398 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!294916 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!294916 #b00000000000000000000000000000000))))))

(assert (=> d!78023 (= (toIndex!0 (select (arr!15316 a!3235) j!176) mask!3524) (bvand (bvxor lt!222446 (bvlshr lt!222446 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!491900 d!78023))

(declare-fun d!78025 () Bool)

(declare-fun res!294921 () Bool)

(declare-fun e!289073 () Bool)

(assert (=> d!78025 (=> res!294921 e!289073)))

(assert (=> d!78025 (= res!294921 (bvsge j!176 (size!15680 a!3235)))))

(assert (=> d!78025 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!289073)))

(declare-fun b!492063 () Bool)

(declare-fun e!289072 () Bool)

(declare-fun call!31379 () Bool)

(assert (=> b!492063 (= e!289072 call!31379)))

(declare-fun b!492064 () Bool)

(declare-fun e!289071 () Bool)

(assert (=> b!492064 (= e!289071 e!289072)))

(declare-fun lt!222449 () (_ BitVec 64))

(assert (=> b!492064 (= lt!222449 (select (arr!15316 a!3235) j!176))))

(declare-fun lt!222450 () Unit!14512)

(assert (=> b!492064 (= lt!222450 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222449 j!176))))

(assert (=> b!492064 (arrayContainsKey!0 a!3235 lt!222449 #b00000000000000000000000000000000)))

(declare-fun lt!222451 () Unit!14512)

(assert (=> b!492064 (= lt!222451 lt!222450)))

(declare-fun res!294922 () Bool)

(assert (=> b!492064 (= res!294922 (= (seekEntryOrOpen!0 (select (arr!15316 a!3235) j!176) a!3235 mask!3524) (Found!3783 j!176)))))

(assert (=> b!492064 (=> (not res!294922) (not e!289072))))

(declare-fun bm!31374 () Bool)

(assert (=> bm!31374 (= call!31379 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!492066 () Bool)

(assert (=> b!492066 (= e!289073 e!289071)))

(declare-fun c!58843 () Bool)

(assert (=> b!492066 (= c!58843 (validKeyInArray!0 (select (arr!15316 a!3235) j!176)))))

(declare-fun b!492068 () Bool)

(assert (=> b!492068 (= e!289071 call!31379)))

(assert (= (and d!78025 (not res!294921)) b!492066))

(assert (= (and b!492066 c!58843) b!492064))

(assert (= (and b!492066 (not c!58843)) b!492068))

(assert (= (and b!492064 res!294922) b!492063))

(assert (= (or b!492063 b!492068) bm!31374))

(assert (=> b!492064 m!472665))

(declare-fun m!472775 () Bool)

(assert (=> b!492064 m!472775))

(declare-fun m!472777 () Bool)

(assert (=> b!492064 m!472777))

(assert (=> b!492064 m!472665))

(assert (=> b!492064 m!472667))

(declare-fun m!472779 () Bool)

(assert (=> bm!31374 m!472779))

(assert (=> b!492066 m!472665))

(assert (=> b!492066 m!472665))

(assert (=> b!492066 m!472671))

(assert (=> b!491900 d!78025))

(declare-fun d!78027 () Bool)

(assert (=> d!78027 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222457 () Unit!14512)

(declare-fun choose!38 (array!31857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14512)

(assert (=> d!78027 (= lt!222457 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78027 (validMask!0 mask!3524)))

(assert (=> d!78027 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!222457)))

(declare-fun bs!15688 () Bool)

(assert (= bs!15688 d!78027))

(assert (=> bs!15688 m!472687))

(declare-fun m!472787 () Bool)

(assert (=> bs!15688 m!472787))

(assert (=> bs!15688 m!472655))

(assert (=> b!491900 d!78027))

(declare-fun d!78031 () Bool)

(declare-fun lt!222459 () (_ BitVec 32))

(declare-fun lt!222458 () (_ BitVec 32))

(assert (=> d!78031 (= lt!222459 (bvmul (bvxor lt!222458 (bvlshr lt!222458 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78031 (= lt!222458 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78031 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!294916 (let ((h!10335 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46398 (bvmul (bvxor h!10335 (bvlshr h!10335 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46398 (bvlshr x!46398 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!294916 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!294916 #b00000000000000000000000000000000))))))

(assert (=> d!78031 (= (toIndex!0 (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!222459 (bvlshr lt!222459 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!491900 d!78031))

(declare-fun b!492085 () Bool)

(declare-fun e!289084 () Bool)

(declare-fun lt!222464 () SeekEntryResult!3783)

(assert (=> b!492085 (= e!289084 (bvsge (x!46393 lt!222464) #b01111111111111111111111111111110))))

(declare-fun b!492086 () Bool)

(declare-fun e!289085 () SeekEntryResult!3783)

(assert (=> b!492086 (= e!289085 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) (array!31858 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235)) mask!3524))))

(declare-fun b!492087 () Bool)

(assert (=> b!492087 (and (bvsge (index!17313 lt!222464) #b00000000000000000000000000000000) (bvslt (index!17313 lt!222464) (size!15680 (array!31858 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235)))))))

(declare-fun e!289086 () Bool)

(assert (=> b!492087 (= e!289086 (= (select (arr!15316 (array!31858 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235))) (index!17313 lt!222464)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492088 () Bool)

(assert (=> b!492088 (and (bvsge (index!17313 lt!222464) #b00000000000000000000000000000000) (bvslt (index!17313 lt!222464) (size!15680 (array!31858 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235)))))))

(declare-fun res!294926 () Bool)

(assert (=> b!492088 (= res!294926 (= (select (arr!15316 (array!31858 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235))) (index!17313 lt!222464)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492088 (=> res!294926 e!289086)))

(declare-fun b!492089 () Bool)

(declare-fun e!289087 () Bool)

(assert (=> b!492089 (= e!289084 e!289087)))

(declare-fun res!294927 () Bool)

(assert (=> b!492089 (= res!294927 (and ((_ is Intermediate!3783) lt!222464) (not (undefined!4595 lt!222464)) (bvslt (x!46393 lt!222464) #b01111111111111111111111111111110) (bvsge (x!46393 lt!222464) #b00000000000000000000000000000000) (bvsge (x!46393 lt!222464) #b00000000000000000000000000000000)))))

(assert (=> b!492089 (=> (not res!294927) (not e!289087))))

(declare-fun b!492090 () Bool)

(assert (=> b!492090 (= e!289085 (Intermediate!3783 false (toIndex!0 (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun d!78033 () Bool)

(assert (=> d!78033 e!289084))

(declare-fun c!58854 () Bool)

(assert (=> d!78033 (= c!58854 (and ((_ is Intermediate!3783) lt!222464) (undefined!4595 lt!222464)))))

(declare-fun e!289088 () SeekEntryResult!3783)

(assert (=> d!78033 (= lt!222464 e!289088)))

(declare-fun c!58853 () Bool)

(assert (=> d!78033 (= c!58853 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222463 () (_ BitVec 64))

(assert (=> d!78033 (= lt!222463 (select (arr!15316 (array!31858 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235))) (toIndex!0 (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) mask!3524)))))

(assert (=> d!78033 (validMask!0 mask!3524)))

(assert (=> d!78033 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) (array!31858 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235)) mask!3524) lt!222464)))

(declare-fun b!492091 () Bool)

(assert (=> b!492091 (and (bvsge (index!17313 lt!222464) #b00000000000000000000000000000000) (bvslt (index!17313 lt!222464) (size!15680 (array!31858 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235)))))))

(declare-fun res!294925 () Bool)

(assert (=> b!492091 (= res!294925 (= (select (arr!15316 (array!31858 (store (arr!15316 a!3235) i!1204 k0!2280) (size!15680 a!3235))) (index!17313 lt!222464)) (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!492091 (=> res!294925 e!289086)))

(assert (=> b!492091 (= e!289087 e!289086)))

(declare-fun b!492092 () Bool)

(assert (=> b!492092 (= e!289088 e!289085)))

(declare-fun c!58852 () Bool)

(assert (=> b!492092 (= c!58852 (or (= lt!222463 (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!222463 lt!222463) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492093 () Bool)

(assert (=> b!492093 (= e!289088 (Intermediate!3783 true (toIndex!0 (select (store (arr!15316 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(assert (= (and d!78033 c!58853) b!492093))

(assert (= (and d!78033 (not c!58853)) b!492092))

(assert (= (and b!492092 c!58852) b!492090))

(assert (= (and b!492092 (not c!58852)) b!492086))

(assert (= (and d!78033 c!58854) b!492085))

(assert (= (and d!78033 (not c!58854)) b!492089))

(assert (= (and b!492089 res!294927) b!492091))

(assert (= (and b!492091 (not res!294925)) b!492088))

(assert (= (and b!492088 (not res!294926)) b!492087))

(declare-fun m!472803 () Bool)

(assert (=> b!492091 m!472803))

(assert (=> b!492088 m!472803))

(assert (=> b!492087 m!472803))

(assert (=> d!78033 m!472683))

(declare-fun m!472805 () Bool)

(assert (=> d!78033 m!472805))

(assert (=> d!78033 m!472655))

(assert (=> b!492086 m!472683))

(declare-fun m!472807 () Bool)

(assert (=> b!492086 m!472807))

(assert (=> b!492086 m!472807))

(assert (=> b!492086 m!472677))

(declare-fun m!472809 () Bool)

(assert (=> b!492086 m!472809))

(assert (=> b!491900 d!78033))

(declare-fun d!78037 () Bool)

(assert (=> d!78037 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44798 d!78037))

(declare-fun d!78047 () Bool)

(assert (=> d!78047 (= (array_inv!11112 a!3235) (bvsge (size!15680 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44798 d!78047))

(declare-fun d!78049 () Bool)

(declare-fun lt!222475 () SeekEntryResult!3783)

(assert (=> d!78049 (and (or ((_ is Undefined!3783) lt!222475) (not ((_ is Found!3783) lt!222475)) (and (bvsge (index!17312 lt!222475) #b00000000000000000000000000000000) (bvslt (index!17312 lt!222475) (size!15680 a!3235)))) (or ((_ is Undefined!3783) lt!222475) ((_ is Found!3783) lt!222475) (not ((_ is MissingZero!3783) lt!222475)) (and (bvsge (index!17311 lt!222475) #b00000000000000000000000000000000) (bvslt (index!17311 lt!222475) (size!15680 a!3235)))) (or ((_ is Undefined!3783) lt!222475) ((_ is Found!3783) lt!222475) ((_ is MissingZero!3783) lt!222475) (not ((_ is MissingVacant!3783) lt!222475)) (and (bvsge (index!17314 lt!222475) #b00000000000000000000000000000000) (bvslt (index!17314 lt!222475) (size!15680 a!3235)))) (or ((_ is Undefined!3783) lt!222475) (ite ((_ is Found!3783) lt!222475) (= (select (arr!15316 a!3235) (index!17312 lt!222475)) k0!2280) (ite ((_ is MissingZero!3783) lt!222475) (= (select (arr!15316 a!3235) (index!17311 lt!222475)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3783) lt!222475) (= (select (arr!15316 a!3235) (index!17314 lt!222475)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!289098 () SeekEntryResult!3783)

(assert (=> d!78049 (= lt!222475 e!289098)))

(declare-fun c!58861 () Bool)

(declare-fun lt!222477 () SeekEntryResult!3783)

(assert (=> d!78049 (= c!58861 (and ((_ is Intermediate!3783) lt!222477) (undefined!4595 lt!222477)))))

(assert (=> d!78049 (= lt!222477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78049 (validMask!0 mask!3524)))

(assert (=> d!78049 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!222475)))

(declare-fun b!492107 () Bool)

(declare-fun e!289099 () SeekEntryResult!3783)

(assert (=> b!492107 (= e!289098 e!289099)))

(declare-fun lt!222476 () (_ BitVec 64))

(assert (=> b!492107 (= lt!222476 (select (arr!15316 a!3235) (index!17313 lt!222477)))))

(declare-fun c!58860 () Bool)

(assert (=> b!492107 (= c!58860 (= lt!222476 k0!2280))))

(declare-fun b!492108 () Bool)

(assert (=> b!492108 (= e!289098 Undefined!3783)))

(declare-fun b!492109 () Bool)

(assert (=> b!492109 (= e!289099 (Found!3783 (index!17313 lt!222477)))))

(declare-fun b!492110 () Bool)

(declare-fun c!58859 () Bool)

(assert (=> b!492110 (= c!58859 (= lt!222476 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289097 () SeekEntryResult!3783)

(assert (=> b!492110 (= e!289099 e!289097)))

(declare-fun b!492111 () Bool)

(assert (=> b!492111 (= e!289097 (seekKeyOrZeroReturnVacant!0 (x!46393 lt!222477) (index!17313 lt!222477) (index!17313 lt!222477) k0!2280 a!3235 mask!3524))))

(declare-fun b!492112 () Bool)

(assert (=> b!492112 (= e!289097 (MissingZero!3783 (index!17313 lt!222477)))))

(assert (= (and d!78049 c!58861) b!492108))

(assert (= (and d!78049 (not c!58861)) b!492107))

(assert (= (and b!492107 c!58860) b!492109))

(assert (= (and b!492107 (not c!58860)) b!492110))

(assert (= (and b!492110 c!58859) b!492112))

(assert (= (and b!492110 (not c!58859)) b!492111))

(declare-fun m!472829 () Bool)

(assert (=> d!78049 m!472829))

(assert (=> d!78049 m!472655))

(declare-fun m!472831 () Bool)

(assert (=> d!78049 m!472831))

(assert (=> d!78049 m!472831))

(declare-fun m!472833 () Bool)

(assert (=> d!78049 m!472833))

(declare-fun m!472835 () Bool)

(assert (=> d!78049 m!472835))

(declare-fun m!472837 () Bool)

(assert (=> d!78049 m!472837))

(declare-fun m!472839 () Bool)

(assert (=> b!492107 m!472839))

(declare-fun m!472841 () Bool)

(assert (=> b!492111 m!472841))

(assert (=> b!491899 d!78049))

(declare-fun d!78051 () Bool)

(assert (=> d!78051 (= (validKeyInArray!0 (select (arr!15316 a!3235) j!176)) (and (not (= (select (arr!15316 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15316 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!491904 d!78051))

(declare-fun d!78053 () Bool)

(declare-fun res!294937 () Bool)

(declare-fun e!289104 () Bool)

(assert (=> d!78053 (=> res!294937 e!289104)))

(assert (=> d!78053 (= res!294937 (= (select (arr!15316 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78053 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!289104)))

(declare-fun b!492117 () Bool)

(declare-fun e!289105 () Bool)

(assert (=> b!492117 (= e!289104 e!289105)))

(declare-fun res!294938 () Bool)

(assert (=> b!492117 (=> (not res!294938) (not e!289105))))

(assert (=> b!492117 (= res!294938 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15680 a!3235)))))

(declare-fun b!492118 () Bool)

(assert (=> b!492118 (= e!289105 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78053 (not res!294937)) b!492117))

(assert (= (and b!492117 res!294938) b!492118))

(assert (=> d!78053 m!472725))

(declare-fun m!472843 () Bool)

(assert (=> b!492118 m!472843))

(assert (=> b!491898 d!78053))

(check-sat (not bm!31374) (not b!492043) (not d!78027) (not b!491949) (not b!491995) (not b!492086) (not b!491947) (not d!78033) (not b!492111) (not bm!31367) (not d!78049) (not bm!31370) (not b!491962) (not b!492064) (not b!491951) (not b!492066) (not b!491961) (not b!492118) (not d!78007) (not d!78015))
(check-sat)
