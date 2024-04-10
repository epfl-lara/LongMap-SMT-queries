; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66666 () Bool)

(assert start!66666)

(declare-fun b!768295 () Bool)

(declare-fun res!519706 () Bool)

(declare-fun e!427826 () Bool)

(assert (=> b!768295 (=> (not res!519706) (not e!427826))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768295 (= res!519706 (validKeyInArray!0 k!2102))))

(declare-fun b!768296 () Bool)

(declare-fun e!427833 () Bool)

(declare-fun e!427832 () Bool)

(assert (=> b!768296 (= e!427833 e!427832)))

(declare-fun res!519709 () Bool)

(assert (=> b!768296 (=> (not res!519709) (not e!427832))))

(declare-datatypes ((array!42307 0))(
  ( (array!42308 (arr!20255 (Array (_ BitVec 32) (_ BitVec 64))) (size!20676 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42307)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7855 0))(
  ( (MissingZero!7855 (index!33788 (_ BitVec 32))) (Found!7855 (index!33789 (_ BitVec 32))) (Intermediate!7855 (undefined!8667 Bool) (index!33790 (_ BitVec 32)) (x!64709 (_ BitVec 32))) (Undefined!7855) (MissingVacant!7855 (index!33791 (_ BitVec 32))) )
))
(declare-fun lt!341793 () SeekEntryResult!7855)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42307 (_ BitVec 32)) SeekEntryResult!7855)

(assert (=> b!768296 (= res!519709 (= (seekEntryOrOpen!0 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341793))))

(assert (=> b!768296 (= lt!341793 (Found!7855 j!159))))

(declare-fun b!768297 () Bool)

(declare-fun res!519711 () Bool)

(assert (=> b!768297 (=> (not res!519711) (not e!427826))))

(declare-fun arrayContainsKey!0 (array!42307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768297 (= res!519711 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!768298 () Bool)

(declare-fun res!519713 () Bool)

(declare-fun e!427824 () Bool)

(assert (=> b!768298 (=> (not res!519713) (not e!427824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42307 (_ BitVec 32)) Bool)

(assert (=> b!768298 (= res!519713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!768299 () Bool)

(declare-fun res!519716 () Bool)

(declare-fun e!427827 () Bool)

(assert (=> b!768299 (=> res!519716 e!427827)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!341796 () SeekEntryResult!7855)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42307 (_ BitVec 32)) SeekEntryResult!7855)

(assert (=> b!768299 (= res!519716 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341796))))

(declare-fun b!768300 () Bool)

(declare-fun res!519717 () Bool)

(assert (=> b!768300 (=> (not res!519717) (not e!427826))))

(assert (=> b!768300 (= res!519717 (validKeyInArray!0 (select (arr!20255 a!3186) j!159)))))

(declare-fun b!768301 () Bool)

(declare-fun e!427830 () Bool)

(assert (=> b!768301 (= e!427824 e!427830)))

(declare-fun res!519707 () Bool)

(assert (=> b!768301 (=> (not res!519707) (not e!427830))))

(declare-fun lt!341798 () SeekEntryResult!7855)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42307 (_ BitVec 32)) SeekEntryResult!7855)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768301 (= res!519707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20255 a!3186) j!159) mask!3328) (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341798))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768301 (= lt!341798 (Intermediate!7855 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!768302 () Bool)

(declare-fun e!427831 () Bool)

(declare-fun e!427825 () Bool)

(assert (=> b!768302 (= e!427831 (not e!427825))))

(declare-fun res!519710 () Bool)

(assert (=> b!768302 (=> res!519710 e!427825)))

(declare-fun lt!341792 () SeekEntryResult!7855)

(assert (=> b!768302 (= res!519710 (or (not (is-Intermediate!7855 lt!341792)) (bvsge x!1131 (x!64709 lt!341792))))))

(assert (=> b!768302 (= lt!341796 (Found!7855 j!159))))

(assert (=> b!768302 e!427833))

(declare-fun res!519704 () Bool)

(assert (=> b!768302 (=> (not res!519704) (not e!427833))))

(assert (=> b!768302 (= res!519704 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26436 0))(
  ( (Unit!26437) )
))
(declare-fun lt!341794 () Unit!26436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26436)

(assert (=> b!768302 (= lt!341794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!519705 () Bool)

(assert (=> start!66666 (=> (not res!519705) (not e!427826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66666 (= res!519705 (validMask!0 mask!3328))))

(assert (=> start!66666 e!427826))

(assert (=> start!66666 true))

(declare-fun array_inv!16051 (array!42307) Bool)

(assert (=> start!66666 (array_inv!16051 a!3186)))

(declare-fun b!768303 () Bool)

(declare-fun res!519715 () Bool)

(assert (=> b!768303 (=> (not res!519715) (not e!427824))))

(declare-datatypes ((List!14257 0))(
  ( (Nil!14254) (Cons!14253 (h!15349 (_ BitVec 64)) (t!20572 List!14257)) )
))
(declare-fun arrayNoDuplicates!0 (array!42307 (_ BitVec 32) List!14257) Bool)

(assert (=> b!768303 (= res!519715 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14254))))

(declare-fun b!768304 () Bool)

(declare-fun res!519721 () Bool)

(assert (=> b!768304 (=> (not res!519721) (not e!427824))))

(assert (=> b!768304 (= res!519721 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20676 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20676 a!3186))))))

(declare-fun b!768305 () Bool)

(assert (=> b!768305 (= e!427826 e!427824)))

(declare-fun res!519714 () Bool)

(assert (=> b!768305 (=> (not res!519714) (not e!427824))))

(declare-fun lt!341801 () SeekEntryResult!7855)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!768305 (= res!519714 (or (= lt!341801 (MissingZero!7855 i!1173)) (= lt!341801 (MissingVacant!7855 i!1173))))))

(assert (=> b!768305 (= lt!341801 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!768306 () Bool)

(declare-fun res!519720 () Bool)

(assert (=> b!768306 (=> (not res!519720) (not e!427830))))

(assert (=> b!768306 (= res!519720 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20255 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!427829 () Bool)

(declare-fun b!768307 () Bool)

(assert (=> b!768307 (= e!427829 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) (Found!7855 j!159)))))

(declare-fun b!768308 () Bool)

(assert (=> b!768308 (= e!427829 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341798))))

(declare-fun b!768309 () Bool)

(assert (=> b!768309 (= e!427830 e!427831)))

(declare-fun res!519708 () Bool)

(assert (=> b!768309 (=> (not res!519708) (not e!427831))))

(declare-fun lt!341799 () SeekEntryResult!7855)

(assert (=> b!768309 (= res!519708 (= lt!341799 lt!341792))))

(declare-fun lt!341800 () array!42307)

(declare-fun lt!341797 () (_ BitVec 64))

(assert (=> b!768309 (= lt!341792 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341797 lt!341800 mask!3328))))

(assert (=> b!768309 (= lt!341799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341797 mask!3328) lt!341797 lt!341800 mask!3328))))

(assert (=> b!768309 (= lt!341797 (select (store (arr!20255 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!768309 (= lt!341800 (array!42308 (store (arr!20255 a!3186) i!1173 k!2102) (size!20676 a!3186)))))

(declare-fun b!768310 () Bool)

(declare-fun res!519719 () Bool)

(assert (=> b!768310 (=> (not res!519719) (not e!427826))))

(assert (=> b!768310 (= res!519719 (and (= (size!20676 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20676 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20676 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!768311 () Bool)

(declare-fun lt!341795 () (_ BitVec 32))

(assert (=> b!768311 (= e!427827 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341795 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341796))))

(declare-fun b!768312 () Bool)

(assert (=> b!768312 (= e!427825 e!427827)))

(declare-fun res!519718 () Bool)

(assert (=> b!768312 (=> res!519718 e!427827)))

(assert (=> b!768312 (= res!519718 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768312 (= lt!341795 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!768313 () Bool)

(assert (=> b!768313 (= e!427832 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341793))))

(declare-fun b!768314 () Bool)

(declare-fun res!519712 () Bool)

(assert (=> b!768314 (=> (not res!519712) (not e!427830))))

(assert (=> b!768314 (= res!519712 e!427829)))

(declare-fun c!84688 () Bool)

(assert (=> b!768314 (= c!84688 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66666 res!519705) b!768310))

(assert (= (and b!768310 res!519719) b!768300))

(assert (= (and b!768300 res!519717) b!768295))

(assert (= (and b!768295 res!519706) b!768297))

(assert (= (and b!768297 res!519711) b!768305))

(assert (= (and b!768305 res!519714) b!768298))

(assert (= (and b!768298 res!519713) b!768303))

(assert (= (and b!768303 res!519715) b!768304))

(assert (= (and b!768304 res!519721) b!768301))

(assert (= (and b!768301 res!519707) b!768306))

(assert (= (and b!768306 res!519720) b!768314))

(assert (= (and b!768314 c!84688) b!768308))

(assert (= (and b!768314 (not c!84688)) b!768307))

(assert (= (and b!768314 res!519712) b!768309))

(assert (= (and b!768309 res!519708) b!768302))

(assert (= (and b!768302 res!519704) b!768296))

(assert (= (and b!768296 res!519709) b!768313))

(assert (= (and b!768302 (not res!519710)) b!768312))

(assert (= (and b!768312 (not res!519718)) b!768299))

(assert (= (and b!768299 (not res!519716)) b!768311))

(declare-fun m!713875 () Bool)

(assert (=> b!768300 m!713875))

(assert (=> b!768300 m!713875))

(declare-fun m!713877 () Bool)

(assert (=> b!768300 m!713877))

(declare-fun m!713879 () Bool)

(assert (=> b!768312 m!713879))

(assert (=> b!768313 m!713875))

(assert (=> b!768313 m!713875))

(declare-fun m!713881 () Bool)

(assert (=> b!768313 m!713881))

(declare-fun m!713883 () Bool)

(assert (=> b!768306 m!713883))

(assert (=> b!768307 m!713875))

(assert (=> b!768307 m!713875))

(declare-fun m!713885 () Bool)

(assert (=> b!768307 m!713885))

(declare-fun m!713887 () Bool)

(assert (=> start!66666 m!713887))

(declare-fun m!713889 () Bool)

(assert (=> start!66666 m!713889))

(assert (=> b!768308 m!713875))

(assert (=> b!768308 m!713875))

(declare-fun m!713891 () Bool)

(assert (=> b!768308 m!713891))

(declare-fun m!713893 () Bool)

(assert (=> b!768302 m!713893))

(declare-fun m!713895 () Bool)

(assert (=> b!768302 m!713895))

(declare-fun m!713897 () Bool)

(assert (=> b!768298 m!713897))

(declare-fun m!713899 () Bool)

(assert (=> b!768305 m!713899))

(declare-fun m!713901 () Bool)

(assert (=> b!768303 m!713901))

(declare-fun m!713903 () Bool)

(assert (=> b!768297 m!713903))

(assert (=> b!768296 m!713875))

(assert (=> b!768296 m!713875))

(declare-fun m!713905 () Bool)

(assert (=> b!768296 m!713905))

(declare-fun m!713907 () Bool)

(assert (=> b!768295 m!713907))

(assert (=> b!768301 m!713875))

(assert (=> b!768301 m!713875))

(declare-fun m!713909 () Bool)

(assert (=> b!768301 m!713909))

(assert (=> b!768301 m!713909))

(assert (=> b!768301 m!713875))

(declare-fun m!713911 () Bool)

(assert (=> b!768301 m!713911))

(assert (=> b!768311 m!713875))

(assert (=> b!768311 m!713875))

(declare-fun m!713913 () Bool)

(assert (=> b!768311 m!713913))

(declare-fun m!713915 () Bool)

(assert (=> b!768309 m!713915))

(declare-fun m!713917 () Bool)

(assert (=> b!768309 m!713917))

(declare-fun m!713919 () Bool)

(assert (=> b!768309 m!713919))

(declare-fun m!713921 () Bool)

(assert (=> b!768309 m!713921))

(assert (=> b!768309 m!713921))

(declare-fun m!713923 () Bool)

(assert (=> b!768309 m!713923))

(assert (=> b!768299 m!713875))

(assert (=> b!768299 m!713875))

(assert (=> b!768299 m!713885))

(push 1)

(assert (not b!768295))

(assert (not b!768299))

(assert (not b!768307))

(assert (not b!768298))

(assert (not b!768305))

(assert (not b!768302))

(assert (not start!66666))

(assert (not b!768313))

(assert (not b!768300))

(assert (not b!768301))

(assert (not b!768296))

(assert (not b!768312))

(assert (not b!768309))

(assert (not b!768308))

(assert (not b!768311))

(assert (not b!768297))

(assert (not b!768303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101505 () Bool)

(declare-fun lt!341858 () SeekEntryResult!7855)

(assert (=> d!101505 (and (or (is-Undefined!7855 lt!341858) (not (is-Found!7855 lt!341858)) (and (bvsge (index!33789 lt!341858) #b00000000000000000000000000000000) (bvslt (index!33789 lt!341858) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341858) (is-Found!7855 lt!341858) (not (is-MissingZero!7855 lt!341858)) (and (bvsge (index!33788 lt!341858) #b00000000000000000000000000000000) (bvslt (index!33788 lt!341858) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341858) (is-Found!7855 lt!341858) (is-MissingZero!7855 lt!341858) (not (is-MissingVacant!7855 lt!341858)) (and (bvsge (index!33791 lt!341858) #b00000000000000000000000000000000) (bvslt (index!33791 lt!341858) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341858) (ite (is-Found!7855 lt!341858) (= (select (arr!20255 a!3186) (index!33789 lt!341858)) k!2102) (ite (is-MissingZero!7855 lt!341858) (= (select (arr!20255 a!3186) (index!33788 lt!341858)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7855 lt!341858) (= (select (arr!20255 a!3186) (index!33791 lt!341858)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!427909 () SeekEntryResult!7855)

(assert (=> d!101505 (= lt!341858 e!427909)))

(declare-fun c!84729 () Bool)

(declare-fun lt!341859 () SeekEntryResult!7855)

(assert (=> d!101505 (= c!84729 (and (is-Intermediate!7855 lt!341859) (undefined!8667 lt!341859)))))

(assert (=> d!101505 (= lt!341859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101505 (validMask!0 mask!3328)))

(assert (=> d!101505 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!341858)))

(declare-fun b!768432 () Bool)

(declare-fun e!427908 () SeekEntryResult!7855)

(assert (=> b!768432 (= e!427908 (MissingZero!7855 (index!33790 lt!341859)))))

(declare-fun b!768433 () Bool)

(assert (=> b!768433 (= e!427908 (seekKeyOrZeroReturnVacant!0 (x!64709 lt!341859) (index!33790 lt!341859) (index!33790 lt!341859) k!2102 a!3186 mask!3328))))

(declare-fun b!768434 () Bool)

(declare-fun c!84728 () Bool)

(declare-fun lt!341860 () (_ BitVec 64))

(assert (=> b!768434 (= c!84728 (= lt!341860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427907 () SeekEntryResult!7855)

(assert (=> b!768434 (= e!427907 e!427908)))

(declare-fun b!768435 () Bool)

(assert (=> b!768435 (= e!427909 e!427907)))

(assert (=> b!768435 (= lt!341860 (select (arr!20255 a!3186) (index!33790 lt!341859)))))

(declare-fun c!84730 () Bool)

(assert (=> b!768435 (= c!84730 (= lt!341860 k!2102))))

(declare-fun b!768436 () Bool)

(assert (=> b!768436 (= e!427907 (Found!7855 (index!33790 lt!341859)))))

(declare-fun b!768437 () Bool)

(assert (=> b!768437 (= e!427909 Undefined!7855)))

(assert (= (and d!101505 c!84729) b!768437))

(assert (= (and d!101505 (not c!84729)) b!768435))

(assert (= (and b!768435 c!84730) b!768436))

(assert (= (and b!768435 (not c!84730)) b!768434))

(assert (= (and b!768434 c!84728) b!768432))

(assert (= (and b!768434 (not c!84728)) b!768433))

(declare-fun m!713989 () Bool)

(assert (=> d!101505 m!713989))

(declare-fun m!713991 () Bool)

(assert (=> d!101505 m!713991))

(declare-fun m!713993 () Bool)

(assert (=> d!101505 m!713993))

(assert (=> d!101505 m!713989))

(declare-fun m!713995 () Bool)

(assert (=> d!101505 m!713995))

(assert (=> d!101505 m!713887))

(declare-fun m!713997 () Bool)

(assert (=> d!101505 m!713997))

(declare-fun m!713999 () Bool)

(assert (=> b!768433 m!713999))

(declare-fun m!714001 () Bool)

(assert (=> b!768435 m!714001))

(assert (=> b!768305 d!101505))

(declare-fun d!101521 () Bool)

(declare-fun lt!341861 () SeekEntryResult!7855)

(assert (=> d!101521 (and (or (is-Undefined!7855 lt!341861) (not (is-Found!7855 lt!341861)) (and (bvsge (index!33789 lt!341861) #b00000000000000000000000000000000) (bvslt (index!33789 lt!341861) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341861) (is-Found!7855 lt!341861) (not (is-MissingZero!7855 lt!341861)) (and (bvsge (index!33788 lt!341861) #b00000000000000000000000000000000) (bvslt (index!33788 lt!341861) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341861) (is-Found!7855 lt!341861) (is-MissingZero!7855 lt!341861) (not (is-MissingVacant!7855 lt!341861)) (and (bvsge (index!33791 lt!341861) #b00000000000000000000000000000000) (bvslt (index!33791 lt!341861) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341861) (ite (is-Found!7855 lt!341861) (= (select (arr!20255 a!3186) (index!33789 lt!341861)) (select (arr!20255 a!3186) j!159)) (ite (is-MissingZero!7855 lt!341861) (= (select (arr!20255 a!3186) (index!33788 lt!341861)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7855 lt!341861) (= (select (arr!20255 a!3186) (index!33791 lt!341861)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!427912 () SeekEntryResult!7855)

(assert (=> d!101521 (= lt!341861 e!427912)))

(declare-fun c!84732 () Bool)

(declare-fun lt!341862 () SeekEntryResult!7855)

(assert (=> d!101521 (= c!84732 (and (is-Intermediate!7855 lt!341862) (undefined!8667 lt!341862)))))

(assert (=> d!101521 (= lt!341862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20255 a!3186) j!159) mask!3328) (select (arr!20255 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101521 (validMask!0 mask!3328)))

(assert (=> d!101521 (= (seekEntryOrOpen!0 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341861)))

(declare-fun b!768438 () Bool)

(declare-fun e!427911 () SeekEntryResult!7855)

(assert (=> b!768438 (= e!427911 (MissingZero!7855 (index!33790 lt!341862)))))

(declare-fun b!768439 () Bool)

(assert (=> b!768439 (= e!427911 (seekKeyOrZeroReturnVacant!0 (x!64709 lt!341862) (index!33790 lt!341862) (index!33790 lt!341862) (select (arr!20255 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768440 () Bool)

(declare-fun c!84731 () Bool)

(declare-fun lt!341863 () (_ BitVec 64))

(assert (=> b!768440 (= c!84731 (= lt!341863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427910 () SeekEntryResult!7855)

(assert (=> b!768440 (= e!427910 e!427911)))

(declare-fun b!768441 () Bool)

(assert (=> b!768441 (= e!427912 e!427910)))

(assert (=> b!768441 (= lt!341863 (select (arr!20255 a!3186) (index!33790 lt!341862)))))

(declare-fun c!84733 () Bool)

(assert (=> b!768441 (= c!84733 (= lt!341863 (select (arr!20255 a!3186) j!159)))))

(declare-fun b!768442 () Bool)

(assert (=> b!768442 (= e!427910 (Found!7855 (index!33790 lt!341862)))))

(declare-fun b!768443 () Bool)

(assert (=> b!768443 (= e!427912 Undefined!7855)))

(assert (= (and d!101521 c!84732) b!768443))

(assert (= (and d!101521 (not c!84732)) b!768441))

(assert (= (and b!768441 c!84733) b!768442))

(assert (= (and b!768441 (not c!84733)) b!768440))

(assert (= (and b!768440 c!84731) b!768438))

(assert (= (and b!768440 (not c!84731)) b!768439))

(assert (=> d!101521 m!713909))

(assert (=> d!101521 m!713875))

(assert (=> d!101521 m!713911))

(declare-fun m!714003 () Bool)

(assert (=> d!101521 m!714003))

(assert (=> d!101521 m!713875))

(assert (=> d!101521 m!713909))

(declare-fun m!714005 () Bool)

(assert (=> d!101521 m!714005))

(assert (=> d!101521 m!713887))

(declare-fun m!714007 () Bool)

(assert (=> d!101521 m!714007))

(assert (=> b!768439 m!713875))

(declare-fun m!714009 () Bool)

(assert (=> b!768439 m!714009))

(declare-fun m!714011 () Bool)

(assert (=> b!768441 m!714011))

(assert (=> b!768296 d!101521))

(declare-fun d!101523 () Bool)

(assert (=> d!101523 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66666 d!101523))

(declare-fun d!101527 () Bool)

(assert (=> d!101527 (= (array_inv!16051 a!3186) (bvsge (size!20676 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66666 d!101527))

(declare-fun d!101529 () Bool)

(assert (=> d!101529 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!768295 d!101529))

(declare-fun d!101531 () Bool)

(declare-fun res!519766 () Bool)

(declare-fun e!427932 () Bool)

(assert (=> d!101531 (=> res!519766 e!427932)))

(assert (=> d!101531 (= res!519766 (= (select (arr!20255 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101531 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!427932)))

(declare-fun b!768478 () Bool)

(declare-fun e!427933 () Bool)

(assert (=> b!768478 (= e!427932 e!427933)))

(declare-fun res!519767 () Bool)

(assert (=> b!768478 (=> (not res!519767) (not e!427933))))

(assert (=> b!768478 (= res!519767 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20676 a!3186)))))

(declare-fun b!768479 () Bool)

(assert (=> b!768479 (= e!427933 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101531 (not res!519766)) b!768478))

(assert (= (and b!768478 res!519767) b!768479))

(declare-fun m!714023 () Bool)

(assert (=> d!101531 m!714023))

(declare-fun m!714025 () Bool)

(assert (=> b!768479 m!714025))

(assert (=> b!768297 d!101531))

(declare-fun b!768562 () Bool)

(declare-fun e!427983 () SeekEntryResult!7855)

(declare-fun e!427984 () SeekEntryResult!7855)

(assert (=> b!768562 (= e!427983 e!427984)))

(declare-fun lt!341905 () (_ BitVec 64))

(declare-fun c!84780 () Bool)

(assert (=> b!768562 (= c!84780 (or (= lt!341905 (select (arr!20255 a!3186) j!159)) (= (bvadd lt!341905 lt!341905) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768563 () Bool)

(assert (=> b!768563 (= e!427983 (Intermediate!7855 true index!1321 x!1131))))

(declare-fun b!768564 () Bool)

(assert (=> b!768564 (= e!427984 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20255 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101533 () Bool)

(declare-fun e!427986 () Bool)

(assert (=> d!101533 e!427986))

(declare-fun c!84782 () Bool)

(declare-fun lt!341906 () SeekEntryResult!7855)

(assert (=> d!101533 (= c!84782 (and (is-Intermediate!7855 lt!341906) (undefined!8667 lt!341906)))))

(assert (=> d!101533 (= lt!341906 e!427983)))

(declare-fun c!84781 () Bool)

(assert (=> d!101533 (= c!84781 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101533 (= lt!341905 (select (arr!20255 a!3186) index!1321))))

(assert (=> d!101533 (validMask!0 mask!3328)))

(assert (=> d!101533 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341906)))

(declare-fun b!768565 () Bool)

(assert (=> b!768565 (and (bvsge (index!33790 lt!341906) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341906) (size!20676 a!3186)))))

(declare-fun res!519790 () Bool)

(assert (=> b!768565 (= res!519790 (= (select (arr!20255 a!3186) (index!33790 lt!341906)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427985 () Bool)

(assert (=> b!768565 (=> res!519790 e!427985)))

(declare-fun b!768566 () Bool)

(assert (=> b!768566 (and (bvsge (index!33790 lt!341906) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341906) (size!20676 a!3186)))))

(assert (=> b!768566 (= e!427985 (= (select (arr!20255 a!3186) (index!33790 lt!341906)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768567 () Bool)

(declare-fun e!427982 () Bool)

(assert (=> b!768567 (= e!427986 e!427982)))

(declare-fun res!519788 () Bool)

(assert (=> b!768567 (= res!519788 (and (is-Intermediate!7855 lt!341906) (not (undefined!8667 lt!341906)) (bvslt (x!64709 lt!341906) #b01111111111111111111111111111110) (bvsge (x!64709 lt!341906) #b00000000000000000000000000000000) (bvsge (x!64709 lt!341906) x!1131)))))

(assert (=> b!768567 (=> (not res!519788) (not e!427982))))

(declare-fun b!768568 () Bool)

(assert (=> b!768568 (= e!427984 (Intermediate!7855 false index!1321 x!1131))))

(declare-fun b!768569 () Bool)

(assert (=> b!768569 (and (bvsge (index!33790 lt!341906) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341906) (size!20676 a!3186)))))

(declare-fun res!519789 () Bool)

(assert (=> b!768569 (= res!519789 (= (select (arr!20255 a!3186) (index!33790 lt!341906)) (select (arr!20255 a!3186) j!159)))))

(assert (=> b!768569 (=> res!519789 e!427985)))

(assert (=> b!768569 (= e!427982 e!427985)))

(declare-fun b!768570 () Bool)

(assert (=> b!768570 (= e!427986 (bvsge (x!64709 lt!341906) #b01111111111111111111111111111110))))

(assert (= (and d!101533 c!84781) b!768563))

(assert (= (and d!101533 (not c!84781)) b!768562))

(assert (= (and b!768562 c!84780) b!768568))

(assert (= (and b!768562 (not c!84780)) b!768564))

(assert (= (and d!101533 c!84782) b!768570))

(assert (= (and d!101533 (not c!84782)) b!768567))

(assert (= (and b!768567 res!519788) b!768569))

(assert (= (and b!768569 (not res!519789)) b!768565))

(assert (= (and b!768565 (not res!519790)) b!768566))

(assert (=> b!768564 m!713879))

(assert (=> b!768564 m!713879))

(assert (=> b!768564 m!713875))

(declare-fun m!714087 () Bool)

(assert (=> b!768564 m!714087))

(declare-fun m!714089 () Bool)

(assert (=> b!768565 m!714089))

(declare-fun m!714091 () Bool)

(assert (=> d!101533 m!714091))

(assert (=> d!101533 m!713887))

(assert (=> b!768569 m!714089))

(assert (=> b!768566 m!714089))

(assert (=> b!768308 d!101533))

(declare-fun lt!341924 () SeekEntryResult!7855)

(declare-fun d!101549 () Bool)

(assert (=> d!101549 (and (or (is-Undefined!7855 lt!341924) (not (is-Found!7855 lt!341924)) (and (bvsge (index!33789 lt!341924) #b00000000000000000000000000000000) (bvslt (index!33789 lt!341924) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341924) (is-Found!7855 lt!341924) (not (is-MissingVacant!7855 lt!341924)) (not (= (index!33791 lt!341924) resIntermediateIndex!5)) (and (bvsge (index!33791 lt!341924) #b00000000000000000000000000000000) (bvslt (index!33791 lt!341924) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341924) (ite (is-Found!7855 lt!341924) (= (select (arr!20255 a!3186) (index!33789 lt!341924)) (select (arr!20255 a!3186) j!159)) (and (is-MissingVacant!7855 lt!341924) (= (index!33791 lt!341924) resIntermediateIndex!5) (= (select (arr!20255 a!3186) (index!33791 lt!341924)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!428010 () SeekEntryResult!7855)

(assert (=> d!101549 (= lt!341924 e!428010)))

(declare-fun c!84800 () Bool)

(assert (=> d!101549 (= c!84800 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341923 () (_ BitVec 64))

(assert (=> d!101549 (= lt!341923 (select (arr!20255 a!3186) index!1321))))

(assert (=> d!101549 (validMask!0 mask!3328)))

(assert (=> d!101549 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341924)))

(declare-fun e!428008 () SeekEntryResult!7855)

(declare-fun b!768610 () Bool)

(assert (=> b!768610 (= e!428008 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768611 () Bool)

(declare-fun e!428009 () SeekEntryResult!7855)

(assert (=> b!768611 (= e!428009 (Found!7855 index!1321))))

(declare-fun b!768612 () Bool)

(assert (=> b!768612 (= e!428008 (MissingVacant!7855 resIntermediateIndex!5))))

(declare-fun b!768613 () Bool)

(assert (=> b!768613 (= e!428010 e!428009)))

(declare-fun c!84799 () Bool)

(assert (=> b!768613 (= c!84799 (= lt!341923 (select (arr!20255 a!3186) j!159)))))

(declare-fun b!768614 () Bool)

(assert (=> b!768614 (= e!428010 Undefined!7855)))

(declare-fun b!768615 () Bool)

(declare-fun c!84798 () Bool)

(assert (=> b!768615 (= c!84798 (= lt!341923 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768615 (= e!428009 e!428008)))

(assert (= (and d!101549 c!84800) b!768614))

(assert (= (and d!101549 (not c!84800)) b!768613))

(assert (= (and b!768613 c!84799) b!768611))

(assert (= (and b!768613 (not c!84799)) b!768615))

(assert (= (and b!768615 c!84798) b!768612))

(assert (= (and b!768615 (not c!84798)) b!768610))

(declare-fun m!714101 () Bool)

(assert (=> d!101549 m!714101))

(declare-fun m!714103 () Bool)

(assert (=> d!101549 m!714103))

(assert (=> d!101549 m!714091))

(assert (=> d!101549 m!713887))

(assert (=> b!768610 m!713879))

(assert (=> b!768610 m!713879))

(assert (=> b!768610 m!713875))

(declare-fun m!714105 () Bool)

(assert (=> b!768610 m!714105))

(assert (=> b!768307 d!101549))

(declare-fun b!768616 () Bool)

(declare-fun e!428012 () SeekEntryResult!7855)

(declare-fun e!428013 () SeekEntryResult!7855)

(assert (=> b!768616 (= e!428012 e!428013)))

(declare-fun c!84801 () Bool)

(declare-fun lt!341925 () (_ BitVec 64))

(assert (=> b!768616 (= c!84801 (or (= lt!341925 lt!341797) (= (bvadd lt!341925 lt!341925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768617 () Bool)

(assert (=> b!768617 (= e!428012 (Intermediate!7855 true index!1321 x!1131))))

(declare-fun b!768618 () Bool)

(assert (=> b!768618 (= e!428013 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!341797 lt!341800 mask!3328))))

(declare-fun d!101557 () Bool)

(declare-fun e!428015 () Bool)

(assert (=> d!101557 e!428015))

(declare-fun c!84803 () Bool)

(declare-fun lt!341926 () SeekEntryResult!7855)

(assert (=> d!101557 (= c!84803 (and (is-Intermediate!7855 lt!341926) (undefined!8667 lt!341926)))))

(assert (=> d!101557 (= lt!341926 e!428012)))

(declare-fun c!84802 () Bool)

(assert (=> d!101557 (= c!84802 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101557 (= lt!341925 (select (arr!20255 lt!341800) index!1321))))

(assert (=> d!101557 (validMask!0 mask!3328)))

(assert (=> d!101557 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341797 lt!341800 mask!3328) lt!341926)))

(declare-fun b!768619 () Bool)

(assert (=> b!768619 (and (bvsge (index!33790 lt!341926) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341926) (size!20676 lt!341800)))))

(declare-fun res!519803 () Bool)

(assert (=> b!768619 (= res!519803 (= (select (arr!20255 lt!341800) (index!33790 lt!341926)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!428014 () Bool)

(assert (=> b!768619 (=> res!519803 e!428014)))

(declare-fun b!768620 () Bool)

(assert (=> b!768620 (and (bvsge (index!33790 lt!341926) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341926) (size!20676 lt!341800)))))

(assert (=> b!768620 (= e!428014 (= (select (arr!20255 lt!341800) (index!33790 lt!341926)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768621 () Bool)

(declare-fun e!428011 () Bool)

(assert (=> b!768621 (= e!428015 e!428011)))

(declare-fun res!519801 () Bool)

(assert (=> b!768621 (= res!519801 (and (is-Intermediate!7855 lt!341926) (not (undefined!8667 lt!341926)) (bvslt (x!64709 lt!341926) #b01111111111111111111111111111110) (bvsge (x!64709 lt!341926) #b00000000000000000000000000000000) (bvsge (x!64709 lt!341926) x!1131)))))

(assert (=> b!768621 (=> (not res!519801) (not e!428011))))

(declare-fun b!768622 () Bool)

(assert (=> b!768622 (= e!428013 (Intermediate!7855 false index!1321 x!1131))))

(declare-fun b!768623 () Bool)

(assert (=> b!768623 (and (bvsge (index!33790 lt!341926) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341926) (size!20676 lt!341800)))))

(declare-fun res!519802 () Bool)

(assert (=> b!768623 (= res!519802 (= (select (arr!20255 lt!341800) (index!33790 lt!341926)) lt!341797))))

(assert (=> b!768623 (=> res!519802 e!428014)))

(assert (=> b!768623 (= e!428011 e!428014)))

(declare-fun b!768624 () Bool)

(assert (=> b!768624 (= e!428015 (bvsge (x!64709 lt!341926) #b01111111111111111111111111111110))))

(assert (= (and d!101557 c!84802) b!768617))

(assert (= (and d!101557 (not c!84802)) b!768616))

(assert (= (and b!768616 c!84801) b!768622))

(assert (= (and b!768616 (not c!84801)) b!768618))

(assert (= (and d!101557 c!84803) b!768624))

(assert (= (and d!101557 (not c!84803)) b!768621))

(assert (= (and b!768621 res!519801) b!768623))

(assert (= (and b!768623 (not res!519802)) b!768619))

(assert (= (and b!768619 (not res!519803)) b!768620))

(assert (=> b!768618 m!713879))

(assert (=> b!768618 m!713879))

(declare-fun m!714107 () Bool)

(assert (=> b!768618 m!714107))

(declare-fun m!714109 () Bool)

(assert (=> b!768619 m!714109))

(declare-fun m!714111 () Bool)

(assert (=> d!101557 m!714111))

(assert (=> d!101557 m!713887))

(assert (=> b!768623 m!714109))

(assert (=> b!768620 m!714109))

(assert (=> b!768309 d!101557))

(declare-fun b!768625 () Bool)

(declare-fun e!428017 () SeekEntryResult!7855)

(declare-fun e!428018 () SeekEntryResult!7855)

(assert (=> b!768625 (= e!428017 e!428018)))

(declare-fun c!84804 () Bool)

(declare-fun lt!341927 () (_ BitVec 64))

(assert (=> b!768625 (= c!84804 (or (= lt!341927 lt!341797) (= (bvadd lt!341927 lt!341927) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768626 () Bool)

(assert (=> b!768626 (= e!428017 (Intermediate!7855 true (toIndex!0 lt!341797 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768627 () Bool)

(assert (=> b!768627 (= e!428018 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341797 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341797 lt!341800 mask!3328))))

(declare-fun d!101559 () Bool)

(declare-fun e!428020 () Bool)

(assert (=> d!101559 e!428020))

(declare-fun c!84806 () Bool)

(declare-fun lt!341928 () SeekEntryResult!7855)

(assert (=> d!101559 (= c!84806 (and (is-Intermediate!7855 lt!341928) (undefined!8667 lt!341928)))))

(assert (=> d!101559 (= lt!341928 e!428017)))

(declare-fun c!84805 () Bool)

(assert (=> d!101559 (= c!84805 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101559 (= lt!341927 (select (arr!20255 lt!341800) (toIndex!0 lt!341797 mask!3328)))))

(assert (=> d!101559 (validMask!0 mask!3328)))

(assert (=> d!101559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341797 mask!3328) lt!341797 lt!341800 mask!3328) lt!341928)))

(declare-fun b!768628 () Bool)

(assert (=> b!768628 (and (bvsge (index!33790 lt!341928) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341928) (size!20676 lt!341800)))))

(declare-fun res!519806 () Bool)

(assert (=> b!768628 (= res!519806 (= (select (arr!20255 lt!341800) (index!33790 lt!341928)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!428019 () Bool)

(assert (=> b!768628 (=> res!519806 e!428019)))

(declare-fun b!768629 () Bool)

(assert (=> b!768629 (and (bvsge (index!33790 lt!341928) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341928) (size!20676 lt!341800)))))

(assert (=> b!768629 (= e!428019 (= (select (arr!20255 lt!341800) (index!33790 lt!341928)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768630 () Bool)

(declare-fun e!428016 () Bool)

(assert (=> b!768630 (= e!428020 e!428016)))

(declare-fun res!519804 () Bool)

(assert (=> b!768630 (= res!519804 (and (is-Intermediate!7855 lt!341928) (not (undefined!8667 lt!341928)) (bvslt (x!64709 lt!341928) #b01111111111111111111111111111110) (bvsge (x!64709 lt!341928) #b00000000000000000000000000000000) (bvsge (x!64709 lt!341928) #b00000000000000000000000000000000)))))

(assert (=> b!768630 (=> (not res!519804) (not e!428016))))

(declare-fun b!768631 () Bool)

(assert (=> b!768631 (= e!428018 (Intermediate!7855 false (toIndex!0 lt!341797 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768632 () Bool)

(assert (=> b!768632 (and (bvsge (index!33790 lt!341928) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341928) (size!20676 lt!341800)))))

(declare-fun res!519805 () Bool)

(assert (=> b!768632 (= res!519805 (= (select (arr!20255 lt!341800) (index!33790 lt!341928)) lt!341797))))

(assert (=> b!768632 (=> res!519805 e!428019)))

(assert (=> b!768632 (= e!428016 e!428019)))

(declare-fun b!768633 () Bool)

(assert (=> b!768633 (= e!428020 (bvsge (x!64709 lt!341928) #b01111111111111111111111111111110))))

(assert (= (and d!101559 c!84805) b!768626))

(assert (= (and d!101559 (not c!84805)) b!768625))

(assert (= (and b!768625 c!84804) b!768631))

(assert (= (and b!768625 (not c!84804)) b!768627))

(assert (= (and d!101559 c!84806) b!768633))

(assert (= (and d!101559 (not c!84806)) b!768630))

(assert (= (and b!768630 res!519804) b!768632))

(assert (= (and b!768632 (not res!519805)) b!768628))

(assert (= (and b!768628 (not res!519806)) b!768629))

(assert (=> b!768627 m!713921))

(declare-fun m!714113 () Bool)

(assert (=> b!768627 m!714113))

(assert (=> b!768627 m!714113))

(declare-fun m!714115 () Bool)

(assert (=> b!768627 m!714115))

(declare-fun m!714117 () Bool)

(assert (=> b!768628 m!714117))

(assert (=> d!101559 m!713921))

(declare-fun m!714119 () Bool)

(assert (=> d!101559 m!714119))

(assert (=> d!101559 m!713887))

(assert (=> b!768632 m!714117))

(assert (=> b!768629 m!714117))

(assert (=> b!768309 d!101559))

(declare-fun d!101561 () Bool)

(declare-fun lt!341934 () (_ BitVec 32))

(declare-fun lt!341933 () (_ BitVec 32))

(assert (=> d!101561 (= lt!341934 (bvmul (bvxor lt!341933 (bvlshr lt!341933 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101561 (= lt!341933 ((_ extract 31 0) (bvand (bvxor lt!341797 (bvlshr lt!341797 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101561 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519807 (let ((h!15352 ((_ extract 31 0) (bvand (bvxor lt!341797 (bvlshr lt!341797 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64719 (bvmul (bvxor h!15352 (bvlshr h!15352 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64719 (bvlshr x!64719 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519807 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519807 #b00000000000000000000000000000000))))))

(assert (=> d!101561 (= (toIndex!0 lt!341797 mask!3328) (bvand (bvxor lt!341934 (bvlshr lt!341934 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!768309 d!101561))

(declare-fun bm!35098 () Bool)

(declare-fun call!35101 () Bool)

(assert (=> bm!35098 (= call!35101 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!768657 () Bool)

(declare-fun e!428039 () Bool)

(assert (=> b!768657 (= e!428039 call!35101)))

(declare-fun d!101563 () Bool)

(declare-fun res!519822 () Bool)

(declare-fun e!428041 () Bool)

(assert (=> d!101563 (=> res!519822 e!428041)))

(assert (=> d!101563 (= res!519822 (bvsge #b00000000000000000000000000000000 (size!20676 a!3186)))))

(assert (=> d!101563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!428041)))

(declare-fun b!768658 () Bool)

(declare-fun e!428040 () Bool)

(assert (=> b!768658 (= e!428040 e!428039)))

(declare-fun lt!341942 () (_ BitVec 64))

(assert (=> b!768658 (= lt!341942 (select (arr!20255 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341943 () Unit!26436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42307 (_ BitVec 64) (_ BitVec 32)) Unit!26436)

(assert (=> b!768658 (= lt!341943 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341942 #b00000000000000000000000000000000))))

(assert (=> b!768658 (arrayContainsKey!0 a!3186 lt!341942 #b00000000000000000000000000000000)))

(declare-fun lt!341941 () Unit!26436)

(assert (=> b!768658 (= lt!341941 lt!341943)))

(declare-fun res!519821 () Bool)

(assert (=> b!768658 (= res!519821 (= (seekEntryOrOpen!0 (select (arr!20255 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7855 #b00000000000000000000000000000000)))))

(assert (=> b!768658 (=> (not res!519821) (not e!428039))))

(declare-fun b!768659 () Bool)

(assert (=> b!768659 (= e!428041 e!428040)))

(declare-fun c!84812 () Bool)

(assert (=> b!768659 (= c!84812 (validKeyInArray!0 (select (arr!20255 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768660 () Bool)

(assert (=> b!768660 (= e!428040 call!35101)))

(assert (= (and d!101563 (not res!519822)) b!768659))

(assert (= (and b!768659 c!84812) b!768658))

(assert (= (and b!768659 (not c!84812)) b!768660))

(assert (= (and b!768658 res!519821) b!768657))

(assert (= (or b!768657 b!768660) bm!35098))

(declare-fun m!714127 () Bool)

(assert (=> bm!35098 m!714127))

(assert (=> b!768658 m!714023))

(declare-fun m!714129 () Bool)

(assert (=> b!768658 m!714129))

(declare-fun m!714131 () Bool)

(assert (=> b!768658 m!714131))

(assert (=> b!768658 m!714023))

(declare-fun m!714133 () Bool)

(assert (=> b!768658 m!714133))

(assert (=> b!768659 m!714023))

(assert (=> b!768659 m!714023))

(declare-fun m!714135 () Bool)

(assert (=> b!768659 m!714135))

(assert (=> b!768298 d!101563))

(declare-fun d!101571 () Bool)

(assert (=> d!101571 (= (validKeyInArray!0 (select (arr!20255 a!3186) j!159)) (and (not (= (select (arr!20255 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20255 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!768300 d!101571))

(assert (=> b!768299 d!101549))

(declare-fun b!768667 () Bool)

(declare-fun e!428046 () SeekEntryResult!7855)

(declare-fun e!428047 () SeekEntryResult!7855)

(assert (=> b!768667 (= e!428046 e!428047)))

(declare-fun lt!341947 () (_ BitVec 64))

(declare-fun c!84816 () Bool)

(assert (=> b!768667 (= c!84816 (or (= lt!341947 (select (arr!20255 a!3186) j!159)) (= (bvadd lt!341947 lt!341947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768668 () Bool)

(assert (=> b!768668 (= e!428046 (Intermediate!7855 true (toIndex!0 (select (arr!20255 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768669 () Bool)

(assert (=> b!768669 (= e!428047 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20255 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20255 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101573 () Bool)

(declare-fun e!428049 () Bool)

(assert (=> d!101573 e!428049))

(declare-fun c!84818 () Bool)

(declare-fun lt!341948 () SeekEntryResult!7855)

(assert (=> d!101573 (= c!84818 (and (is-Intermediate!7855 lt!341948) (undefined!8667 lt!341948)))))

(assert (=> d!101573 (= lt!341948 e!428046)))

(declare-fun c!84817 () Bool)

(assert (=> d!101573 (= c!84817 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101573 (= lt!341947 (select (arr!20255 a!3186) (toIndex!0 (select (arr!20255 a!3186) j!159) mask!3328)))))

(assert (=> d!101573 (validMask!0 mask!3328)))

(assert (=> d!101573 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20255 a!3186) j!159) mask!3328) (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341948)))

(declare-fun b!768670 () Bool)

(assert (=> b!768670 (and (bvsge (index!33790 lt!341948) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341948) (size!20676 a!3186)))))

(declare-fun res!519825 () Bool)

(assert (=> b!768670 (= res!519825 (= (select (arr!20255 a!3186) (index!33790 lt!341948)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!428048 () Bool)

(assert (=> b!768670 (=> res!519825 e!428048)))

(declare-fun b!768671 () Bool)

(assert (=> b!768671 (and (bvsge (index!33790 lt!341948) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341948) (size!20676 a!3186)))))

(assert (=> b!768671 (= e!428048 (= (select (arr!20255 a!3186) (index!33790 lt!341948)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!768672 () Bool)

(declare-fun e!428045 () Bool)

(assert (=> b!768672 (= e!428049 e!428045)))

(declare-fun res!519823 () Bool)

(assert (=> b!768672 (= res!519823 (and (is-Intermediate!7855 lt!341948) (not (undefined!8667 lt!341948)) (bvslt (x!64709 lt!341948) #b01111111111111111111111111111110) (bvsge (x!64709 lt!341948) #b00000000000000000000000000000000) (bvsge (x!64709 lt!341948) #b00000000000000000000000000000000)))))

(assert (=> b!768672 (=> (not res!519823) (not e!428045))))

(declare-fun b!768673 () Bool)

(assert (=> b!768673 (= e!428047 (Intermediate!7855 false (toIndex!0 (select (arr!20255 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!768674 () Bool)

(assert (=> b!768674 (and (bvsge (index!33790 lt!341948) #b00000000000000000000000000000000) (bvslt (index!33790 lt!341948) (size!20676 a!3186)))))

(declare-fun res!519824 () Bool)

(assert (=> b!768674 (= res!519824 (= (select (arr!20255 a!3186) (index!33790 lt!341948)) (select (arr!20255 a!3186) j!159)))))

(assert (=> b!768674 (=> res!519824 e!428048)))

(assert (=> b!768674 (= e!428045 e!428048)))

(declare-fun b!768675 () Bool)

(assert (=> b!768675 (= e!428049 (bvsge (x!64709 lt!341948) #b01111111111111111111111111111110))))

(assert (= (and d!101573 c!84817) b!768668))

(assert (= (and d!101573 (not c!84817)) b!768667))

(assert (= (and b!768667 c!84816) b!768673))

(assert (= (and b!768667 (not c!84816)) b!768669))

(assert (= (and d!101573 c!84818) b!768675))

(assert (= (and d!101573 (not c!84818)) b!768672))

(assert (= (and b!768672 res!519823) b!768674))

(assert (= (and b!768674 (not res!519824)) b!768670))

(assert (= (and b!768670 (not res!519825)) b!768671))

(assert (=> b!768669 m!713909))

(declare-fun m!714151 () Bool)

(assert (=> b!768669 m!714151))

(assert (=> b!768669 m!714151))

(assert (=> b!768669 m!713875))

(declare-fun m!714153 () Bool)

(assert (=> b!768669 m!714153))

(declare-fun m!714155 () Bool)

(assert (=> b!768670 m!714155))

(assert (=> d!101573 m!713909))

(declare-fun m!714159 () Bool)

(assert (=> d!101573 m!714159))

(assert (=> d!101573 m!713887))

(assert (=> b!768674 m!714155))

(assert (=> b!768671 m!714155))

(assert (=> b!768301 d!101573))

(declare-fun d!101577 () Bool)

(declare-fun lt!341953 () (_ BitVec 32))

(declare-fun lt!341952 () (_ BitVec 32))

(assert (=> d!101577 (= lt!341953 (bvmul (bvxor lt!341952 (bvlshr lt!341952 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101577 (= lt!341952 ((_ extract 31 0) (bvand (bvxor (select (arr!20255 a!3186) j!159) (bvlshr (select (arr!20255 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101577 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519807 (let ((h!15352 ((_ extract 31 0) (bvand (bvxor (select (arr!20255 a!3186) j!159) (bvlshr (select (arr!20255 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64719 (bvmul (bvxor h!15352 (bvlshr h!15352 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64719 (bvlshr x!64719 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519807 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519807 #b00000000000000000000000000000000))))))

(assert (=> d!101577 (= (toIndex!0 (select (arr!20255 a!3186) j!159) mask!3328) (bvand (bvxor lt!341953 (bvlshr lt!341953 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!768301 d!101577))

(declare-fun d!101581 () Bool)

(declare-fun lt!341962 () (_ BitVec 32))

(assert (=> d!101581 (and (bvsge lt!341962 #b00000000000000000000000000000000) (bvslt lt!341962 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101581 (= lt!341962 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101581 (validMask!0 mask!3328)))

(assert (=> d!101581 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!341962)))

(declare-fun bs!21537 () Bool)

(assert (= bs!21537 d!101581))

(declare-fun m!714181 () Bool)

(assert (=> bs!21537 m!714181))

(assert (=> bs!21537 m!713887))

(assert (=> b!768312 d!101581))

(declare-fun lt!341964 () SeekEntryResult!7855)

(declare-fun d!101587 () Bool)

(assert (=> d!101587 (and (or (is-Undefined!7855 lt!341964) (not (is-Found!7855 lt!341964)) (and (bvsge (index!33789 lt!341964) #b00000000000000000000000000000000) (bvslt (index!33789 lt!341964) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341964) (is-Found!7855 lt!341964) (not (is-MissingVacant!7855 lt!341964)) (not (= (index!33791 lt!341964) resIntermediateIndex!5)) (and (bvsge (index!33791 lt!341964) #b00000000000000000000000000000000) (bvslt (index!33791 lt!341964) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341964) (ite (is-Found!7855 lt!341964) (= (select (arr!20255 a!3186) (index!33789 lt!341964)) (select (arr!20255 a!3186) j!159)) (and (is-MissingVacant!7855 lt!341964) (= (index!33791 lt!341964) resIntermediateIndex!5) (= (select (arr!20255 a!3186) (index!33791 lt!341964)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!428068 () SeekEntryResult!7855)

(assert (=> d!101587 (= lt!341964 e!428068)))

(declare-fun c!84831 () Bool)

(assert (=> d!101587 (= c!84831 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!341963 () (_ BitVec 64))

(assert (=> d!101587 (= lt!341963 (select (arr!20255 a!3186) lt!341795))))

(assert (=> d!101587 (validMask!0 mask!3328)))

(assert (=> d!101587 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341795 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341964)))

(declare-fun b!768704 () Bool)

(declare-fun e!428066 () SeekEntryResult!7855)

(assert (=> b!768704 (= e!428066 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341795 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768705 () Bool)

(declare-fun e!428067 () SeekEntryResult!7855)

(assert (=> b!768705 (= e!428067 (Found!7855 lt!341795))))

(declare-fun b!768706 () Bool)

(assert (=> b!768706 (= e!428066 (MissingVacant!7855 resIntermediateIndex!5))))

(declare-fun b!768707 () Bool)

(assert (=> b!768707 (= e!428068 e!428067)))

(declare-fun c!84830 () Bool)

(assert (=> b!768707 (= c!84830 (= lt!341963 (select (arr!20255 a!3186) j!159)))))

(declare-fun b!768708 () Bool)

(assert (=> b!768708 (= e!428068 Undefined!7855)))

(declare-fun b!768709 () Bool)

(declare-fun c!84829 () Bool)

(assert (=> b!768709 (= c!84829 (= lt!341963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768709 (= e!428067 e!428066)))

(assert (= (and d!101587 c!84831) b!768708))

(assert (= (and d!101587 (not c!84831)) b!768707))

(assert (= (and b!768707 c!84830) b!768705))

(assert (= (and b!768707 (not c!84830)) b!768709))

(assert (= (and b!768709 c!84829) b!768706))

(assert (= (and b!768709 (not c!84829)) b!768704))

(declare-fun m!714189 () Bool)

(assert (=> d!101587 m!714189))

(declare-fun m!714191 () Bool)

(assert (=> d!101587 m!714191))

(declare-fun m!714193 () Bool)

(assert (=> d!101587 m!714193))

(assert (=> d!101587 m!713887))

(declare-fun m!714195 () Bool)

(assert (=> b!768704 m!714195))

(assert (=> b!768704 m!714195))

(assert (=> b!768704 m!713875))

(declare-fun m!714197 () Bool)

(assert (=> b!768704 m!714197))

(assert (=> b!768311 d!101587))

(declare-fun d!101591 () Bool)

(declare-fun lt!341968 () SeekEntryResult!7855)

(assert (=> d!101591 (and (or (is-Undefined!7855 lt!341968) (not (is-Found!7855 lt!341968)) (and (bvsge (index!33789 lt!341968) #b00000000000000000000000000000000) (bvslt (index!33789 lt!341968) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341968) (is-Found!7855 lt!341968) (not (is-MissingVacant!7855 lt!341968)) (not (= (index!33791 lt!341968) resIntermediateIndex!5)) (and (bvsge (index!33791 lt!341968) #b00000000000000000000000000000000) (bvslt (index!33791 lt!341968) (size!20676 a!3186)))) (or (is-Undefined!7855 lt!341968) (ite (is-Found!7855 lt!341968) (= (select (arr!20255 a!3186) (index!33789 lt!341968)) (select (arr!20255 a!3186) j!159)) (and (is-MissingVacant!7855 lt!341968) (= (index!33791 lt!341968) resIntermediateIndex!5) (= (select (arr!20255 a!3186) (index!33791 lt!341968)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!428076 () SeekEntryResult!7855)

(assert (=> d!101591 (= lt!341968 e!428076)))

(declare-fun c!84837 () Bool)

(assert (=> d!101591 (= c!84837 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!341967 () (_ BitVec 64))

(assert (=> d!101591 (= lt!341967 (select (arr!20255 a!3186) resIntermediateIndex!5))))

(assert (=> d!101591 (validMask!0 mask!3328)))

(assert (=> d!101591 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341968)))

(declare-fun b!768719 () Bool)

(declare-fun e!428074 () SeekEntryResult!7855)

(assert (=> b!768719 (= e!428074 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768720 () Bool)

(declare-fun e!428075 () SeekEntryResult!7855)

(assert (=> b!768720 (= e!428075 (Found!7855 resIntermediateIndex!5))))

(declare-fun b!768721 () Bool)

(assert (=> b!768721 (= e!428074 (MissingVacant!7855 resIntermediateIndex!5))))

(declare-fun b!768722 () Bool)

(assert (=> b!768722 (= e!428076 e!428075)))

(declare-fun c!84836 () Bool)

(assert (=> b!768722 (= c!84836 (= lt!341967 (select (arr!20255 a!3186) j!159)))))

(declare-fun b!768723 () Bool)

(assert (=> b!768723 (= e!428076 Undefined!7855)))

(declare-fun b!768724 () Bool)

(declare-fun c!84835 () Bool)

(assert (=> b!768724 (= c!84835 (= lt!341967 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!768724 (= e!428075 e!428074)))

(assert (= (and d!101591 c!84837) b!768723))

(assert (= (and d!101591 (not c!84837)) b!768722))

(assert (= (and b!768722 c!84836) b!768720))

(assert (= (and b!768722 (not c!84836)) b!768724))

(assert (= (and b!768724 c!84835) b!768721))

(assert (= (and b!768724 (not c!84835)) b!768719))

(declare-fun m!714207 () Bool)

(assert (=> d!101591 m!714207))

(declare-fun m!714209 () Bool)

(assert (=> d!101591 m!714209))

(assert (=> d!101591 m!713883))

(assert (=> d!101591 m!713887))

(declare-fun m!714211 () Bool)

(assert (=> b!768719 m!714211))

(assert (=> b!768719 m!714211))

(assert (=> b!768719 m!713875))

(declare-fun m!714213 () Bool)

(assert (=> b!768719 m!714213))

(assert (=> b!768313 d!101591))

(declare-fun call!35103 () Bool)

(declare-fun bm!35100 () Bool)

(assert (=> bm!35100 (= call!35103 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!768725 () Bool)

(declare-fun e!428077 () Bool)

(assert (=> b!768725 (= e!428077 call!35103)))

(declare-fun d!101597 () Bool)

(declare-fun res!519838 () Bool)

(declare-fun e!428079 () Bool)

(assert (=> d!101597 (=> res!519838 e!428079)))

(assert (=> d!101597 (= res!519838 (bvsge j!159 (size!20676 a!3186)))))

(assert (=> d!101597 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!428079)))

(declare-fun b!768726 () Bool)

(declare-fun e!428078 () Bool)

(assert (=> b!768726 (= e!428078 e!428077)))

(declare-fun lt!341972 () (_ BitVec 64))

(assert (=> b!768726 (= lt!341972 (select (arr!20255 a!3186) j!159))))

(declare-fun lt!341973 () Unit!26436)

(assert (=> b!768726 (= lt!341973 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341972 j!159))))

(assert (=> b!768726 (arrayContainsKey!0 a!3186 lt!341972 #b00000000000000000000000000000000)))

(declare-fun lt!341971 () Unit!26436)

(assert (=> b!768726 (= lt!341971 lt!341973)))

(declare-fun res!519837 () Bool)

(assert (=> b!768726 (= res!519837 (= (seekEntryOrOpen!0 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) (Found!7855 j!159)))))

(assert (=> b!768726 (=> (not res!519837) (not e!428077))))

(declare-fun b!768727 () Bool)

(assert (=> b!768727 (= e!428079 e!428078)))

(declare-fun c!84838 () Bool)

(assert (=> b!768727 (= c!84838 (validKeyInArray!0 (select (arr!20255 a!3186) j!159)))))

(declare-fun b!768728 () Bool)

(assert (=> b!768728 (= e!428078 call!35103)))

(assert (= (and d!101597 (not res!519838)) b!768727))

(assert (= (and b!768727 c!84838) b!768726))

(assert (= (and b!768727 (not c!84838)) b!768728))

(assert (= (and b!768726 res!519837) b!768725))

(assert (= (or b!768725 b!768728) bm!35100))

(declare-fun m!714215 () Bool)

(assert (=> bm!35100 m!714215))

(assert (=> b!768726 m!713875))

(declare-fun m!714217 () Bool)

(assert (=> b!768726 m!714217))

(declare-fun m!714219 () Bool)

(assert (=> b!768726 m!714219))

(assert (=> b!768726 m!713875))

(assert (=> b!768726 m!713905))

(assert (=> b!768727 m!713875))

(assert (=> b!768727 m!713875))

(assert (=> b!768727 m!713877))

(assert (=> b!768302 d!101597))

(declare-fun d!101599 () Bool)

(assert (=> d!101599 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341981 () Unit!26436)

(declare-fun choose!38 (array!42307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26436)

(assert (=> d!101599 (= lt!341981 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101599 (validMask!0 mask!3328)))

(assert (=> d!101599 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341981)))

(declare-fun bs!21539 () Bool)

(assert (= bs!21539 d!101599))

(assert (=> bs!21539 m!713893))

(declare-fun m!714231 () Bool)

(assert (=> bs!21539 m!714231))

(assert (=> bs!21539 m!713887))

(assert (=> b!768302 d!101599))

(declare-fun d!101603 () Bool)

(declare-fun res!519847 () Bool)

(declare-fun e!428092 () Bool)

(assert (=> d!101603 (=> res!519847 e!428092)))

(assert (=> d!101603 (= res!519847 (bvsge #b00000000000000000000000000000000 (size!20676 a!3186)))))

(assert (=> d!101603 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14254) e!428092)))

(declare-fun bm!35103 () Bool)

(declare-fun call!35106 () Bool)

(declare-fun c!84844 () Bool)

(assert (=> bm!35103 (= call!35106 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84844 (Cons!14253 (select (arr!20255 a!3186) #b00000000000000000000000000000000) Nil!14254) Nil!14254)))))

(declare-fun b!768745 () Bool)

(declare-fun e!428094 () Bool)

(declare-fun contains!4088 (List!14257 (_ BitVec 64)) Bool)

(assert (=> b!768745 (= e!428094 (contains!4088 Nil!14254 (select (arr!20255 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768746 () Bool)

(declare-fun e!428093 () Bool)

(assert (=> b!768746 (= e!428093 call!35106)))

(declare-fun b!768747 () Bool)

(declare-fun e!428091 () Bool)

(assert (=> b!768747 (= e!428091 e!428093)))

(assert (=> b!768747 (= c!84844 (validKeyInArray!0 (select (arr!20255 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768748 () Bool)

(assert (=> b!768748 (= e!428092 e!428091)))

(declare-fun res!519845 () Bool)

(assert (=> b!768748 (=> (not res!519845) (not e!428091))))

(assert (=> b!768748 (= res!519845 (not e!428094))))

(declare-fun res!519846 () Bool)

(assert (=> b!768748 (=> (not res!519846) (not e!428094))))

(assert (=> b!768748 (= res!519846 (validKeyInArray!0 (select (arr!20255 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!768749 () Bool)

(assert (=> b!768749 (= e!428093 call!35106)))

(assert (= (and d!101603 (not res!519847)) b!768748))

(assert (= (and b!768748 res!519846) b!768745))

(assert (= (and b!768748 res!519845) b!768747))

(assert (= (and b!768747 c!84844) b!768746))

(assert (= (and b!768747 (not c!84844)) b!768749))

(assert (= (or b!768746 b!768749) bm!35103))

(assert (=> bm!35103 m!714023))

(declare-fun m!714233 () Bool)

(assert (=> bm!35103 m!714233))

(assert (=> b!768745 m!714023))

(assert (=> b!768745 m!714023))

(declare-fun m!714235 () Bool)

(assert (=> b!768745 m!714235))

(assert (=> b!768747 m!714023))

(assert (=> b!768747 m!714023))

(assert (=> b!768747 m!714135))

(assert (=> b!768748 m!714023))

(assert (=> b!768748 m!714023))

(assert (=> b!768748 m!714135))

(assert (=> b!768303 d!101603))

(push 1)

(assert (not b!768610))

(assert (not b!768727))

(assert (not b!768748))

(assert (not d!101573))

(assert (not bm!35103))

(assert (not d!101559))

(assert (not b!768747))

(assert (not b!768704))

(assert (not b!768659))

(assert (not d!101599))

(assert (not b!768433))

(assert (not b!768479))

(assert (not d!101557))

(assert (not b!768439))

(assert (not bm!35100))

(assert (not b!768618))

(assert (not d!101591))

(assert (not b!768669))

(assert (not d!101521))

(assert (not b!768658))

(assert (not d!101587))

(assert (not b!768564))

(assert (not b!768745))

(assert (not d!101581))

(assert (not b!768627))

(assert (not b!768726))

(assert (not d!101505))

(assert (not d!101533))

(assert (not d!101549))

(assert (not bm!35098))

(assert (not b!768719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

