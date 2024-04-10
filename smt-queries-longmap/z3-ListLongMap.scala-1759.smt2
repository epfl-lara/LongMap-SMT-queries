; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32154 () Bool)

(assert start!32154)

(declare-fun b!320459 () Bool)

(declare-fun res!174704 () Bool)

(declare-fun e!198819 () Bool)

(assert (=> b!320459 (=> (not res!174704) (not e!198819))))

(declare-datatypes ((array!16389 0))(
  ( (array!16390 (arr!7755 (Array (_ BitVec 32) (_ BitVec 64))) (size!8107 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16389)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320459 (= res!174704 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!174707 () Bool)

(assert (=> start!32154 (=> (not res!174707) (not e!198819))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32154 (= res!174707 (validMask!0 mask!3777))))

(assert (=> start!32154 e!198819))

(declare-fun array_inv!5718 (array!16389) Bool)

(assert (=> start!32154 (array_inv!5718 a!3305)))

(assert (=> start!32154 true))

(declare-fun b!320460 () Bool)

(declare-fun res!174703 () Bool)

(assert (=> b!320460 (=> (not res!174703) (not e!198819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320460 (= res!174703 (validKeyInArray!0 k0!2497))))

(declare-fun b!320461 () Bool)

(declare-fun res!174708 () Bool)

(assert (=> b!320461 (=> (not res!174708) (not e!198819))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2886 0))(
  ( (MissingZero!2886 (index!13720 (_ BitVec 32))) (Found!2886 (index!13721 (_ BitVec 32))) (Intermediate!2886 (undefined!3698 Bool) (index!13722 (_ BitVec 32)) (x!31987 (_ BitVec 32))) (Undefined!2886) (MissingVacant!2886 (index!13723 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16389 (_ BitVec 32)) SeekEntryResult!2886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320461 (= res!174708 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2886 false resIndex!58 resX!58)))))

(declare-fun b!320462 () Bool)

(declare-fun res!174705 () Bool)

(assert (=> b!320462 (=> (not res!174705) (not e!198819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16389 (_ BitVec 32)) Bool)

(assert (=> b!320462 (= res!174705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320463 () Bool)

(declare-fun res!174706 () Bool)

(assert (=> b!320463 (=> (not res!174706) (not e!198819))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16389 (_ BitVec 32)) SeekEntryResult!2886)

(assert (=> b!320463 (= res!174706 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2886 i!1250)))))

(declare-fun b!320464 () Bool)

(declare-fun res!174702 () Bool)

(assert (=> b!320464 (=> (not res!174702) (not e!198819))))

(assert (=> b!320464 (= res!174702 (and (= (size!8107 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8107 a!3305))))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!320465 () Bool)

(assert (=> b!320465 (= e!198819 (and (= (select (arr!7755 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8107 a!3305)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(assert (= (and start!32154 res!174707) b!320464))

(assert (= (and b!320464 res!174702) b!320460))

(assert (= (and b!320460 res!174703) b!320459))

(assert (= (and b!320459 res!174704) b!320463))

(assert (= (and b!320463 res!174706) b!320462))

(assert (= (and b!320462 res!174705) b!320461))

(assert (= (and b!320461 res!174708) b!320465))

(declare-fun m!328835 () Bool)

(assert (=> b!320462 m!328835))

(declare-fun m!328837 () Bool)

(assert (=> start!32154 m!328837))

(declare-fun m!328839 () Bool)

(assert (=> start!32154 m!328839))

(declare-fun m!328841 () Bool)

(assert (=> b!320460 m!328841))

(declare-fun m!328843 () Bool)

(assert (=> b!320465 m!328843))

(declare-fun m!328845 () Bool)

(assert (=> b!320459 m!328845))

(declare-fun m!328847 () Bool)

(assert (=> b!320463 m!328847))

(declare-fun m!328849 () Bool)

(assert (=> b!320461 m!328849))

(assert (=> b!320461 m!328849))

(declare-fun m!328851 () Bool)

(assert (=> b!320461 m!328851))

(check-sat (not b!320461) (not b!320463) (not start!32154) (not b!320460) (not b!320459) (not b!320462))
(check-sat)
(get-model)

(declare-fun d!69447 () Bool)

(declare-fun res!174734 () Bool)

(declare-fun e!198831 () Bool)

(assert (=> d!69447 (=> res!174734 e!198831)))

(assert (=> d!69447 (= res!174734 (= (select (arr!7755 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69447 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!198831)))

(declare-fun b!320491 () Bool)

(declare-fun e!198832 () Bool)

(assert (=> b!320491 (= e!198831 e!198832)))

(declare-fun res!174735 () Bool)

(assert (=> b!320491 (=> (not res!174735) (not e!198832))))

(assert (=> b!320491 (= res!174735 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8107 a!3305)))))

(declare-fun b!320492 () Bool)

(assert (=> b!320492 (= e!198832 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69447 (not res!174734)) b!320491))

(assert (= (and b!320491 res!174735) b!320492))

(declare-fun m!328871 () Bool)

(assert (=> d!69447 m!328871))

(declare-fun m!328873 () Bool)

(assert (=> b!320492 m!328873))

(assert (=> b!320459 d!69447))

(declare-fun b!320565 () Bool)

(declare-fun e!198877 () SeekEntryResult!2886)

(declare-fun lt!156051 () SeekEntryResult!2886)

(assert (=> b!320565 (= e!198877 (MissingZero!2886 (index!13722 lt!156051)))))

(declare-fun d!69451 () Bool)

(declare-fun lt!156050 () SeekEntryResult!2886)

(get-info :version)

(assert (=> d!69451 (and (or ((_ is Undefined!2886) lt!156050) (not ((_ is Found!2886) lt!156050)) (and (bvsge (index!13721 lt!156050) #b00000000000000000000000000000000) (bvslt (index!13721 lt!156050) (size!8107 a!3305)))) (or ((_ is Undefined!2886) lt!156050) ((_ is Found!2886) lt!156050) (not ((_ is MissingZero!2886) lt!156050)) (and (bvsge (index!13720 lt!156050) #b00000000000000000000000000000000) (bvslt (index!13720 lt!156050) (size!8107 a!3305)))) (or ((_ is Undefined!2886) lt!156050) ((_ is Found!2886) lt!156050) ((_ is MissingZero!2886) lt!156050) (not ((_ is MissingVacant!2886) lt!156050)) (and (bvsge (index!13723 lt!156050) #b00000000000000000000000000000000) (bvslt (index!13723 lt!156050) (size!8107 a!3305)))) (or ((_ is Undefined!2886) lt!156050) (ite ((_ is Found!2886) lt!156050) (= (select (arr!7755 a!3305) (index!13721 lt!156050)) k0!2497) (ite ((_ is MissingZero!2886) lt!156050) (= (select (arr!7755 a!3305) (index!13720 lt!156050)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2886) lt!156050) (= (select (arr!7755 a!3305) (index!13723 lt!156050)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!198876 () SeekEntryResult!2886)

(assert (=> d!69451 (= lt!156050 e!198876)))

(declare-fun c!50530 () Bool)

(assert (=> d!69451 (= c!50530 (and ((_ is Intermediate!2886) lt!156051) (undefined!3698 lt!156051)))))

(assert (=> d!69451 (= lt!156051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69451 (validMask!0 mask!3777)))

(assert (=> d!69451 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!156050)))

(declare-fun b!320566 () Bool)

(declare-fun e!198878 () SeekEntryResult!2886)

(assert (=> b!320566 (= e!198878 (Found!2886 (index!13722 lt!156051)))))

(declare-fun b!320567 () Bool)

(assert (=> b!320567 (= e!198876 Undefined!2886)))

(declare-fun b!320568 () Bool)

(declare-fun c!50531 () Bool)

(declare-fun lt!156052 () (_ BitVec 64))

(assert (=> b!320568 (= c!50531 (= lt!156052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!320568 (= e!198878 e!198877)))

(declare-fun b!320569 () Bool)

(assert (=> b!320569 (= e!198876 e!198878)))

(assert (=> b!320569 (= lt!156052 (select (arr!7755 a!3305) (index!13722 lt!156051)))))

(declare-fun c!50532 () Bool)

(assert (=> b!320569 (= c!50532 (= lt!156052 k0!2497))))

(declare-fun b!320570 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16389 (_ BitVec 32)) SeekEntryResult!2886)

(assert (=> b!320570 (= e!198877 (seekKeyOrZeroReturnVacant!0 (x!31987 lt!156051) (index!13722 lt!156051) (index!13722 lt!156051) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69451 c!50530) b!320567))

(assert (= (and d!69451 (not c!50530)) b!320569))

(assert (= (and b!320569 c!50532) b!320566))

(assert (= (and b!320569 (not c!50532)) b!320568))

(assert (= (and b!320568 c!50531) b!320565))

(assert (= (and b!320568 (not c!50531)) b!320570))

(declare-fun m!328909 () Bool)

(assert (=> d!69451 m!328909))

(assert (=> d!69451 m!328849))

(assert (=> d!69451 m!328851))

(assert (=> d!69451 m!328849))

(assert (=> d!69451 m!328837))

(declare-fun m!328917 () Bool)

(assert (=> d!69451 m!328917))

(declare-fun m!328921 () Bool)

(assert (=> d!69451 m!328921))

(declare-fun m!328923 () Bool)

(assert (=> b!320569 m!328923))

(declare-fun m!328925 () Bool)

(assert (=> b!320570 m!328925))

(assert (=> b!320463 d!69451))

(declare-fun bm!26059 () Bool)

(declare-fun call!26062 () Bool)

(assert (=> bm!26059 (= call!26062 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!320588 () Bool)

(declare-fun e!198891 () Bool)

(assert (=> b!320588 (= e!198891 call!26062)))

(declare-fun b!320590 () Bool)

(declare-fun e!198890 () Bool)

(declare-fun e!198892 () Bool)

(assert (=> b!320590 (= e!198890 e!198892)))

(declare-fun c!50538 () Bool)

(assert (=> b!320590 (= c!50538 (validKeyInArray!0 (select (arr!7755 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!320591 () Bool)

(assert (=> b!320591 (= e!198892 call!26062)))

(declare-fun b!320589 () Bool)

(assert (=> b!320589 (= e!198892 e!198891)))

(declare-fun lt!156072 () (_ BitVec 64))

(assert (=> b!320589 (= lt!156072 (select (arr!7755 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9828 0))(
  ( (Unit!9829) )
))
(declare-fun lt!156073 () Unit!9828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16389 (_ BitVec 64) (_ BitVec 32)) Unit!9828)

(assert (=> b!320589 (= lt!156073 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!156072 #b00000000000000000000000000000000))))

(assert (=> b!320589 (arrayContainsKey!0 a!3305 lt!156072 #b00000000000000000000000000000000)))

(declare-fun lt!156071 () Unit!9828)

(assert (=> b!320589 (= lt!156071 lt!156073)))

(declare-fun res!174762 () Bool)

(assert (=> b!320589 (= res!174762 (= (seekEntryOrOpen!0 (select (arr!7755 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2886 #b00000000000000000000000000000000)))))

(assert (=> b!320589 (=> (not res!174762) (not e!198891))))

(declare-fun d!69461 () Bool)

(declare-fun res!174763 () Bool)

(assert (=> d!69461 (=> res!174763 e!198890)))

(assert (=> d!69461 (= res!174763 (bvsge #b00000000000000000000000000000000 (size!8107 a!3305)))))

(assert (=> d!69461 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198890)))

(assert (= (and d!69461 (not res!174763)) b!320590))

(assert (= (and b!320590 c!50538) b!320589))

(assert (= (and b!320590 (not c!50538)) b!320591))

(assert (= (and b!320589 res!174762) b!320588))

(assert (= (or b!320588 b!320591) bm!26059))

(declare-fun m!328927 () Bool)

(assert (=> bm!26059 m!328927))

(assert (=> b!320590 m!328871))

(assert (=> b!320590 m!328871))

(declare-fun m!328929 () Bool)

(assert (=> b!320590 m!328929))

(assert (=> b!320589 m!328871))

(declare-fun m!328931 () Bool)

(assert (=> b!320589 m!328931))

(declare-fun m!328933 () Bool)

(assert (=> b!320589 m!328933))

(assert (=> b!320589 m!328871))

(declare-fun m!328935 () Bool)

(assert (=> b!320589 m!328935))

(assert (=> b!320462 d!69461))

(declare-fun b!320667 () Bool)

(declare-fun e!198939 () Bool)

(declare-fun lt!156096 () SeekEntryResult!2886)

(assert (=> b!320667 (= e!198939 (bvsge (x!31987 lt!156096) #b01111111111111111111111111111110))))

(declare-fun b!320668 () Bool)

(declare-fun e!198941 () SeekEntryResult!2886)

(assert (=> b!320668 (= e!198941 (Intermediate!2886 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun e!198943 () SeekEntryResult!2886)

(declare-fun b!320669 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320669 (= e!198943 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!320670 () Bool)

(assert (=> b!320670 (= e!198941 e!198943)))

(declare-fun c!50563 () Bool)

(declare-fun lt!156095 () (_ BitVec 64))

(assert (=> b!320670 (= c!50563 (or (= lt!156095 k0!2497) (= (bvadd lt!156095 lt!156095) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320671 () Bool)

(declare-fun e!198942 () Bool)

(assert (=> b!320671 (= e!198939 e!198942)))

(declare-fun res!174794 () Bool)

(assert (=> b!320671 (= res!174794 (and ((_ is Intermediate!2886) lt!156096) (not (undefined!3698 lt!156096)) (bvslt (x!31987 lt!156096) #b01111111111111111111111111111110) (bvsge (x!31987 lt!156096) #b00000000000000000000000000000000) (bvsge (x!31987 lt!156096) #b00000000000000000000000000000000)))))

(assert (=> b!320671 (=> (not res!174794) (not e!198942))))

(declare-fun d!69465 () Bool)

(assert (=> d!69465 e!198939))

(declare-fun c!50565 () Bool)

(assert (=> d!69465 (= c!50565 (and ((_ is Intermediate!2886) lt!156096) (undefined!3698 lt!156096)))))

(assert (=> d!69465 (= lt!156096 e!198941)))

(declare-fun c!50564 () Bool)

(assert (=> d!69465 (= c!50564 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69465 (= lt!156095 (select (arr!7755 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69465 (validMask!0 mask!3777)))

(assert (=> d!69465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156096)))

(declare-fun b!320672 () Bool)

(assert (=> b!320672 (and (bvsge (index!13722 lt!156096) #b00000000000000000000000000000000) (bvslt (index!13722 lt!156096) (size!8107 a!3305)))))

(declare-fun res!174792 () Bool)

(assert (=> b!320672 (= res!174792 (= (select (arr!7755 a!3305) (index!13722 lt!156096)) k0!2497))))

(declare-fun e!198940 () Bool)

(assert (=> b!320672 (=> res!174792 e!198940)))

(assert (=> b!320672 (= e!198942 e!198940)))

(declare-fun b!320673 () Bool)

(assert (=> b!320673 (and (bvsge (index!13722 lt!156096) #b00000000000000000000000000000000) (bvslt (index!13722 lt!156096) (size!8107 a!3305)))))

(declare-fun res!174793 () Bool)

(assert (=> b!320673 (= res!174793 (= (select (arr!7755 a!3305) (index!13722 lt!156096)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!320673 (=> res!174793 e!198940)))

(declare-fun b!320674 () Bool)

(assert (=> b!320674 (and (bvsge (index!13722 lt!156096) #b00000000000000000000000000000000) (bvslt (index!13722 lt!156096) (size!8107 a!3305)))))

(assert (=> b!320674 (= e!198940 (= (select (arr!7755 a!3305) (index!13722 lt!156096)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320675 () Bool)

(assert (=> b!320675 (= e!198943 (Intermediate!2886 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!69465 c!50564) b!320668))

(assert (= (and d!69465 (not c!50564)) b!320670))

(assert (= (and b!320670 c!50563) b!320675))

(assert (= (and b!320670 (not c!50563)) b!320669))

(assert (= (and d!69465 c!50565) b!320667))

(assert (= (and d!69465 (not c!50565)) b!320671))

(assert (= (and b!320671 res!174794) b!320672))

(assert (= (and b!320672 (not res!174792)) b!320673))

(assert (= (and b!320673 (not res!174793)) b!320674))

(declare-fun m!328959 () Bool)

(assert (=> b!320672 m!328959))

(assert (=> b!320674 m!328959))

(assert (=> d!69465 m!328849))

(declare-fun m!328961 () Bool)

(assert (=> d!69465 m!328961))

(assert (=> d!69465 m!328837))

(assert (=> b!320673 m!328959))

(assert (=> b!320669 m!328849))

(declare-fun m!328963 () Bool)

(assert (=> b!320669 m!328963))

(assert (=> b!320669 m!328963))

(declare-fun m!328965 () Bool)

(assert (=> b!320669 m!328965))

(assert (=> b!320461 d!69465))

(declare-fun d!69483 () Bool)

(declare-fun lt!156102 () (_ BitVec 32))

(declare-fun lt!156101 () (_ BitVec 32))

(assert (=> d!69483 (= lt!156102 (bvmul (bvxor lt!156101 (bvlshr lt!156101 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69483 (= lt!156101 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69483 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!174795 (let ((h!5387 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31994 (bvmul (bvxor h!5387 (bvlshr h!5387 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31994 (bvlshr x!31994 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!174795 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!174795 #b00000000000000000000000000000000))))))

(assert (=> d!69483 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!156102 (bvlshr lt!156102 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!320461 d!69483))

(declare-fun d!69487 () Bool)

(assert (=> d!69487 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!320460 d!69487))

(declare-fun d!69489 () Bool)

(assert (=> d!69489 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32154 d!69489))

(declare-fun d!69491 () Bool)

(assert (=> d!69491 (= (array_inv!5718 a!3305) (bvsge (size!8107 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32154 d!69491))

(check-sat (not b!320492) (not d!69451) (not bm!26059) (not b!320669) (not b!320590) (not d!69465) (not b!320589) (not b!320570))
(check-sat)
