; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136488 () Bool)

(assert start!136488)

(declare-fun b!1577653 () Bool)

(declare-fun res!1077808 () Bool)

(declare-fun e!879974 () Bool)

(assert (=> b!1577653 (=> (not res!1077808) (not e!879974))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577653 (= res!1077808 (validKeyInArray!0 k0!768))))

(declare-fun x!458 () (_ BitVec 32))

(declare-datatypes ((array!105625 0))(
  ( (array!105626 (arr!50930 (Array (_ BitVec 32) (_ BitVec 64))) (size!51480 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105625)

(declare-fun b!1577655 () Bool)

(declare-datatypes ((SeekEntryResult!13759 0))(
  ( (MissingZero!13759 (index!57434 (_ BitVec 32))) (Found!13759 (index!57435 (_ BitVec 32))) (Intermediate!13759 (undefined!14571 Bool) (index!57436 (_ BitVec 32)) (x!142568 (_ BitVec 32))) (Undefined!13759) (MissingVacant!13759 (index!57437 (_ BitVec 32))) )
))
(declare-fun lt!676060 () SeekEntryResult!13759)

(get-info :version)

(assert (=> b!1577655 (= e!879974 (and ((_ is Intermediate!13759) lt!676060) (not (undefined!14571 lt!676060)) (bvslt (x!142568 lt!676060) #b01111111111111111111111111111110) (bvsge (x!142568 lt!676060) #b00000000000000000000000000000000) (bvsge (x!142568 lt!676060) x!458) (not (= (select (arr!50930 _keys!610) (index!57436 lt!676060)) k0!768)) (not (= (select (arr!50930 _keys!610) (index!57436 lt!676060)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!57436 lt!676060) #b00000000000000000000000000000000) (bvsge (index!57436 lt!676060) (size!51480 _keys!610)))))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105625 (_ BitVec 32)) SeekEntryResult!13759)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577655 (= lt!676060 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577654 () Bool)

(declare-fun res!1077809 () Bool)

(assert (=> b!1577654 (=> (not res!1077809) (not e!879974))))

(assert (=> b!1577654 (= res!1077809 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50930 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50930 _keys!610) ee!12) (select (arr!50930 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577652 () Bool)

(declare-fun res!1077807 () Bool)

(assert (=> b!1577652 (=> (not res!1077807) (not e!879974))))

(assert (=> b!1577652 (= res!1077807 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51480 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077810 () Bool)

(assert (=> start!136488 (=> (not res!1077810) (not e!879974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136488 (= res!1077810 (validMask!0 mask!910))))

(assert (=> start!136488 e!879974))

(assert (=> start!136488 true))

(declare-fun array_inv!39657 (array!105625) Bool)

(assert (=> start!136488 (array_inv!39657 _keys!610)))

(assert (= (and start!136488 res!1077810) b!1577652))

(assert (= (and b!1577652 res!1077807) b!1577653))

(assert (= (and b!1577653 res!1077808) b!1577654))

(assert (= (and b!1577654 res!1077809) b!1577655))

(declare-fun m!1449837 () Bool)

(assert (=> b!1577653 m!1449837))

(declare-fun m!1449839 () Bool)

(assert (=> b!1577655 m!1449839))

(declare-fun m!1449841 () Bool)

(assert (=> b!1577655 m!1449841))

(assert (=> b!1577655 m!1449841))

(declare-fun m!1449843 () Bool)

(assert (=> b!1577655 m!1449843))

(declare-fun m!1449845 () Bool)

(assert (=> b!1577654 m!1449845))

(declare-fun m!1449847 () Bool)

(assert (=> start!136488 m!1449847))

(declare-fun m!1449849 () Bool)

(assert (=> start!136488 m!1449849))

(check-sat (not b!1577653) (not b!1577655) (not start!136488))
(check-sat)
(get-model)

(declare-fun d!165927 () Bool)

(assert (=> d!165927 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577653 d!165927))

(declare-fun d!165929 () Bool)

(declare-fun e!879995 () Bool)

(assert (=> d!165929 e!879995))

(declare-fun c!146214 () Bool)

(declare-fun lt!676068 () SeekEntryResult!13759)

(assert (=> d!165929 (= c!146214 (and ((_ is Intermediate!13759) lt!676068) (undefined!14571 lt!676068)))))

(declare-fun e!879991 () SeekEntryResult!13759)

(assert (=> d!165929 (= lt!676068 e!879991)))

(declare-fun c!146213 () Bool)

(assert (=> d!165929 (= c!146213 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!676069 () (_ BitVec 64))

(assert (=> d!165929 (= lt!676069 (select (arr!50930 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165929 (validMask!0 mask!910)))

(assert (=> d!165929 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910) lt!676068)))

(declare-fun b!1577686 () Bool)

(declare-fun e!879993 () SeekEntryResult!13759)

(assert (=> b!1577686 (= e!879993 (Intermediate!13759 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577687 () Bool)

(assert (=> b!1577687 (= e!879993 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577688 () Bool)

(assert (=> b!1577688 (= e!879995 (bvsge (x!142568 lt!676068) #b01111111111111111111111111111110))))

(declare-fun b!1577689 () Bool)

(assert (=> b!1577689 (and (bvsge (index!57436 lt!676068) #b00000000000000000000000000000000) (bvslt (index!57436 lt!676068) (size!51480 _keys!610)))))

(declare-fun res!1077831 () Bool)

(assert (=> b!1577689 (= res!1077831 (= (select (arr!50930 _keys!610) (index!57436 lt!676068)) k0!768))))

(declare-fun e!879992 () Bool)

(assert (=> b!1577689 (=> res!1077831 e!879992)))

(declare-fun e!879994 () Bool)

(assert (=> b!1577689 (= e!879994 e!879992)))

(declare-fun b!1577690 () Bool)

(assert (=> b!1577690 (= e!879995 e!879994)))

(declare-fun res!1077829 () Bool)

(assert (=> b!1577690 (= res!1077829 (and ((_ is Intermediate!13759) lt!676068) (not (undefined!14571 lt!676068)) (bvslt (x!142568 lt!676068) #b01111111111111111111111111111110) (bvsge (x!142568 lt!676068) #b00000000000000000000000000000000) (bvsge (x!142568 lt!676068) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577690 (=> (not res!1077829) (not e!879994))))

(declare-fun b!1577691 () Bool)

(assert (=> b!1577691 (and (bvsge (index!57436 lt!676068) #b00000000000000000000000000000000) (bvslt (index!57436 lt!676068) (size!51480 _keys!610)))))

(declare-fun res!1077830 () Bool)

(assert (=> b!1577691 (= res!1077830 (= (select (arr!50930 _keys!610) (index!57436 lt!676068)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577691 (=> res!1077830 e!879992)))

(declare-fun b!1577692 () Bool)

(assert (=> b!1577692 (= e!879991 (Intermediate!13759 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577693 () Bool)

(assert (=> b!1577693 (= e!879991 e!879993)))

(declare-fun c!146212 () Bool)

(assert (=> b!1577693 (= c!146212 (or (= lt!676069 k0!768) (= (bvadd lt!676069 lt!676069) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577694 () Bool)

(assert (=> b!1577694 (and (bvsge (index!57436 lt!676068) #b00000000000000000000000000000000) (bvslt (index!57436 lt!676068) (size!51480 _keys!610)))))

(assert (=> b!1577694 (= e!879992 (= (select (arr!50930 _keys!610) (index!57436 lt!676068)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165929 c!146213) b!1577692))

(assert (= (and d!165929 (not c!146213)) b!1577693))

(assert (= (and b!1577693 c!146212) b!1577686))

(assert (= (and b!1577693 (not c!146212)) b!1577687))

(assert (= (and d!165929 c!146214) b!1577688))

(assert (= (and d!165929 (not c!146214)) b!1577690))

(assert (= (and b!1577690 res!1077829) b!1577689))

(assert (= (and b!1577689 (not res!1077831)) b!1577691))

(assert (= (and b!1577691 (not res!1077830)) b!1577694))

(declare-fun m!1449865 () Bool)

(assert (=> b!1577694 m!1449865))

(assert (=> b!1577687 m!1449841))

(declare-fun m!1449867 () Bool)

(assert (=> b!1577687 m!1449867))

(assert (=> b!1577687 m!1449867))

(declare-fun m!1449869 () Bool)

(assert (=> b!1577687 m!1449869))

(assert (=> b!1577689 m!1449865))

(assert (=> b!1577691 m!1449865))

(assert (=> d!165929 m!1449841))

(declare-fun m!1449871 () Bool)

(assert (=> d!165929 m!1449871))

(assert (=> d!165929 m!1449847))

(assert (=> b!1577655 d!165929))

(declare-fun d!165939 () Bool)

(declare-fun lt!676072 () (_ BitVec 32))

(assert (=> d!165939 (and (bvsge lt!676072 #b00000000000000000000000000000000) (bvslt lt!676072 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165939 (= lt!676072 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165939 (validMask!0 mask!910)))

(assert (=> d!165939 (= (nextIndex!0 ee!12 x!458 mask!910) lt!676072)))

(declare-fun bs!45595 () Bool)

(assert (= bs!45595 d!165939))

(declare-fun m!1449873 () Bool)

(assert (=> bs!45595 m!1449873))

(assert (=> bs!45595 m!1449847))

(assert (=> b!1577655 d!165939))

(declare-fun d!165941 () Bool)

(assert (=> d!165941 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136488 d!165941))

(declare-fun d!165943 () Bool)

(assert (=> d!165943 (= (array_inv!39657 _keys!610) (bvsge (size!51480 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136488 d!165943))

(check-sat (not d!165929) (not d!165939) (not b!1577687))
(check-sat)
