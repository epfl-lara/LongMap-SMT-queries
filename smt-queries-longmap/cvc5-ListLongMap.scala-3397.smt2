; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46914 () Bool)

(assert start!46914)

(declare-fun b!517546 () Bool)

(declare-fun e!302015 () Bool)

(declare-fun e!302014 () Bool)

(assert (=> b!517546 (= e!302015 (not e!302014))))

(declare-fun res!316747 () Bool)

(assert (=> b!517546 (=> res!316747 e!302014)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!236917 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4388 0))(
  ( (MissingZero!4388 (index!19740 (_ BitVec 32))) (Found!4388 (index!19741 (_ BitVec 32))) (Intermediate!4388 (undefined!5200 Bool) (index!19742 (_ BitVec 32)) (x!48707 (_ BitVec 32))) (Undefined!4388) (MissingVacant!4388 (index!19743 (_ BitVec 32))) )
))
(declare-fun lt!236914 () SeekEntryResult!4388)

(declare-datatypes ((array!33112 0))(
  ( (array!33113 (arr!15921 (Array (_ BitVec 32) (_ BitVec 64))) (size!16285 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33112)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33112 (_ BitVec 32)) SeekEntryResult!4388)

(assert (=> b!517546 (= res!316747 (= lt!236914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236917 (select (store (arr!15921 a!3235) i!1204 k!2280) j!176) (array!33113 (store (arr!15921 a!3235) i!1204 k!2280) (size!16285 a!3235)) mask!3524)))))

(declare-fun lt!236916 () (_ BitVec 32))

(assert (=> b!517546 (= lt!236914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236916 (select (arr!15921 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517546 (= lt!236917 (toIndex!0 (select (store (arr!15921 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!517546 (= lt!236916 (toIndex!0 (select (arr!15921 a!3235) j!176) mask!3524))))

(declare-fun e!302012 () Bool)

(assert (=> b!517546 e!302012))

(declare-fun res!316745 () Bool)

(assert (=> b!517546 (=> (not res!316745) (not e!302012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33112 (_ BitVec 32)) Bool)

(assert (=> b!517546 (= res!316745 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16034 0))(
  ( (Unit!16035) )
))
(declare-fun lt!236913 () Unit!16034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16034)

(assert (=> b!517546 (= lt!236913 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517547 () Bool)

(declare-fun res!316752 () Bool)

(assert (=> b!517547 (=> (not res!316752) (not e!302015))))

(declare-datatypes ((List!10079 0))(
  ( (Nil!10076) (Cons!10075 (h!10979 (_ BitVec 64)) (t!16307 List!10079)) )
))
(declare-fun arrayNoDuplicates!0 (array!33112 (_ BitVec 32) List!10079) Bool)

(assert (=> b!517547 (= res!316752 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10076))))

(declare-fun b!517548 () Bool)

(declare-fun res!316750 () Bool)

(assert (=> b!517548 (=> res!316750 e!302014)))

(assert (=> b!517548 (= res!316750 (or (undefined!5200 lt!236914) (not (is-Intermediate!4388 lt!236914))))))

(declare-fun b!517549 () Bool)

(assert (=> b!517549 (= e!302014 (or (not (= (select (arr!15921 a!3235) (index!19742 lt!236914)) (select (arr!15921 a!3235) j!176))) (bvsgt (x!48707 lt!236914) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48707 lt!236914)) (bvslt lt!236916 #b00000000000000000000000000000000) (bvsge lt!236916 (size!16285 a!3235)) (and (bvsge (index!19742 lt!236914) #b00000000000000000000000000000000) (bvslt (index!19742 lt!236914) (size!16285 a!3235)))))))

(assert (=> b!517549 (and (bvslt (x!48707 lt!236914) #b01111111111111111111111111111110) (or (= (select (arr!15921 a!3235) (index!19742 lt!236914)) (select (arr!15921 a!3235) j!176)) (= (select (arr!15921 a!3235) (index!19742 lt!236914)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15921 a!3235) (index!19742 lt!236914)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!316748 () Bool)

(declare-fun e!302013 () Bool)

(assert (=> start!46914 (=> (not res!316748) (not e!302013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46914 (= res!316748 (validMask!0 mask!3524))))

(assert (=> start!46914 e!302013))

(assert (=> start!46914 true))

(declare-fun array_inv!11717 (array!33112) Bool)

(assert (=> start!46914 (array_inv!11717 a!3235)))

(declare-fun b!517550 () Bool)

(declare-fun res!316754 () Bool)

(assert (=> b!517550 (=> (not res!316754) (not e!302013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517550 (= res!316754 (validKeyInArray!0 (select (arr!15921 a!3235) j!176)))))

(declare-fun b!517551 () Bool)

(declare-fun res!316753 () Bool)

(assert (=> b!517551 (=> (not res!316753) (not e!302013))))

(declare-fun arrayContainsKey!0 (array!33112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517551 (= res!316753 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517552 () Bool)

(assert (=> b!517552 (= e!302013 e!302015)))

(declare-fun res!316746 () Bool)

(assert (=> b!517552 (=> (not res!316746) (not e!302015))))

(declare-fun lt!236915 () SeekEntryResult!4388)

(assert (=> b!517552 (= res!316746 (or (= lt!236915 (MissingZero!4388 i!1204)) (= lt!236915 (MissingVacant!4388 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33112 (_ BitVec 32)) SeekEntryResult!4388)

(assert (=> b!517552 (= lt!236915 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!517553 () Bool)

(assert (=> b!517553 (= e!302012 (= (seekEntryOrOpen!0 (select (arr!15921 a!3235) j!176) a!3235 mask!3524) (Found!4388 j!176)))))

(declare-fun b!517554 () Bool)

(declare-fun res!316751 () Bool)

(assert (=> b!517554 (=> (not res!316751) (not e!302013))))

(assert (=> b!517554 (= res!316751 (and (= (size!16285 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16285 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16285 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517555 () Bool)

(declare-fun res!316749 () Bool)

(assert (=> b!517555 (=> (not res!316749) (not e!302013))))

(assert (=> b!517555 (= res!316749 (validKeyInArray!0 k!2280))))

(declare-fun b!517556 () Bool)

(declare-fun res!316744 () Bool)

(assert (=> b!517556 (=> (not res!316744) (not e!302015))))

(assert (=> b!517556 (= res!316744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46914 res!316748) b!517554))

(assert (= (and b!517554 res!316751) b!517550))

(assert (= (and b!517550 res!316754) b!517555))

(assert (= (and b!517555 res!316749) b!517551))

(assert (= (and b!517551 res!316753) b!517552))

(assert (= (and b!517552 res!316746) b!517556))

(assert (= (and b!517556 res!316744) b!517547))

(assert (= (and b!517547 res!316752) b!517546))

(assert (= (and b!517546 res!316745) b!517553))

(assert (= (and b!517546 (not res!316747)) b!517548))

(assert (= (and b!517548 (not res!316750)) b!517549))

(declare-fun m!498939 () Bool)

(assert (=> b!517550 m!498939))

(assert (=> b!517550 m!498939))

(declare-fun m!498941 () Bool)

(assert (=> b!517550 m!498941))

(declare-fun m!498943 () Bool)

(assert (=> b!517551 m!498943))

(declare-fun m!498945 () Bool)

(assert (=> b!517547 m!498945))

(declare-fun m!498947 () Bool)

(assert (=> b!517552 m!498947))

(declare-fun m!498949 () Bool)

(assert (=> start!46914 m!498949))

(declare-fun m!498951 () Bool)

(assert (=> start!46914 m!498951))

(declare-fun m!498953 () Bool)

(assert (=> b!517556 m!498953))

(declare-fun m!498955 () Bool)

(assert (=> b!517549 m!498955))

(assert (=> b!517549 m!498939))

(declare-fun m!498957 () Bool)

(assert (=> b!517555 m!498957))

(assert (=> b!517553 m!498939))

(assert (=> b!517553 m!498939))

(declare-fun m!498959 () Bool)

(assert (=> b!517553 m!498959))

(declare-fun m!498961 () Bool)

(assert (=> b!517546 m!498961))

(assert (=> b!517546 m!498939))

(declare-fun m!498963 () Bool)

(assert (=> b!517546 m!498963))

(declare-fun m!498965 () Bool)

(assert (=> b!517546 m!498965))

(declare-fun m!498967 () Bool)

(assert (=> b!517546 m!498967))

(assert (=> b!517546 m!498967))

(declare-fun m!498969 () Bool)

(assert (=> b!517546 m!498969))

(assert (=> b!517546 m!498939))

(declare-fun m!498971 () Bool)

(assert (=> b!517546 m!498971))

(assert (=> b!517546 m!498939))

(declare-fun m!498973 () Bool)

(assert (=> b!517546 m!498973))

(assert (=> b!517546 m!498967))

(declare-fun m!498975 () Bool)

(assert (=> b!517546 m!498975))

(push 1)

(assert (not start!46914))

(assert (not b!517553))

(assert (not b!517552))

(assert (not b!517555))

(assert (not b!517550))

(assert (not b!517551))

(assert (not b!517556))

(assert (not b!517546))

(assert (not b!517547))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79773 () Bool)

(assert (=> d!79773 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517555 d!79773))

(declare-fun d!79781 () Bool)

(assert (=> d!79781 (= (validKeyInArray!0 (select (arr!15921 a!3235) j!176)) (and (not (= (select (arr!15921 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15921 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517550 d!79781))

(declare-fun b!517688 () Bool)

(declare-fun e!302092 () Bool)

(declare-fun e!302094 () Bool)

(assert (=> b!517688 (= e!302092 e!302094)))

(declare-fun c!60713 () Bool)

(assert (=> b!517688 (= c!60713 (validKeyInArray!0 (select (arr!15921 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79783 () Bool)

(declare-fun res!316846 () Bool)

(assert (=> d!79783 (=> res!316846 e!302092)))

(assert (=> d!79783 (= res!316846 (bvsge #b00000000000000000000000000000000 (size!16285 a!3235)))))

(assert (=> d!79783 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302092)))

(declare-fun b!517689 () Bool)

(declare-fun call!31694 () Bool)

(assert (=> b!517689 (= e!302094 call!31694)))

(declare-fun b!517690 () Bool)

(declare-fun e!302093 () Bool)

(assert (=> b!517690 (= e!302094 e!302093)))

(declare-fun lt!236981 () (_ BitVec 64))

(assert (=> b!517690 (= lt!236981 (select (arr!15921 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236983 () Unit!16034)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33112 (_ BitVec 64) (_ BitVec 32)) Unit!16034)

(assert (=> b!517690 (= lt!236983 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236981 #b00000000000000000000000000000000))))

(assert (=> b!517690 (arrayContainsKey!0 a!3235 lt!236981 #b00000000000000000000000000000000)))

(declare-fun lt!236982 () Unit!16034)

(assert (=> b!517690 (= lt!236982 lt!236983)))

(declare-fun res!316847 () Bool)

(assert (=> b!517690 (= res!316847 (= (seekEntryOrOpen!0 (select (arr!15921 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4388 #b00000000000000000000000000000000)))))

(assert (=> b!517690 (=> (not res!316847) (not e!302093))))

(declare-fun b!517691 () Bool)

(assert (=> b!517691 (= e!302093 call!31694)))

(declare-fun bm!31691 () Bool)

(assert (=> bm!31691 (= call!31694 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79783 (not res!316846)) b!517688))

(assert (= (and b!517688 c!60713) b!517690))

(assert (= (and b!517688 (not c!60713)) b!517689))

(assert (= (and b!517690 res!316847) b!517691))

(assert (= (or b!517691 b!517689) bm!31691))

(declare-fun m!499093 () Bool)

(assert (=> b!517688 m!499093))

(assert (=> b!517688 m!499093))

(declare-fun m!499095 () Bool)

(assert (=> b!517688 m!499095))

(assert (=> b!517690 m!499093))

(declare-fun m!499097 () Bool)

(assert (=> b!517690 m!499097))

(declare-fun m!499099 () Bool)

(assert (=> b!517690 m!499099))

(assert (=> b!517690 m!499093))

(declare-fun m!499101 () Bool)

(assert (=> b!517690 m!499101))

(declare-fun m!499103 () Bool)

(assert (=> bm!31691 m!499103))

(assert (=> b!517556 d!79783))

(declare-fun d!79787 () Bool)

(assert (=> d!79787 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46914 d!79787))

(declare-fun d!79795 () Bool)

(assert (=> d!79795 (= (array_inv!11717 a!3235) (bvsge (size!16285 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46914 d!79795))

(declare-fun d!79799 () Bool)

(declare-fun res!316861 () Bool)

(declare-fun e!302117 () Bool)

(assert (=> d!79799 (=> res!316861 e!302117)))

(assert (=> d!79799 (= res!316861 (= (select (arr!15921 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79799 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!302117)))

(declare-fun b!517724 () Bool)

(declare-fun e!302118 () Bool)

(assert (=> b!517724 (= e!302117 e!302118)))

(declare-fun res!316862 () Bool)

(assert (=> b!517724 (=> (not res!316862) (not e!302118))))

(assert (=> b!517724 (= res!316862 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16285 a!3235)))))

(declare-fun b!517725 () Bool)

(assert (=> b!517725 (= e!302118 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79799 (not res!316861)) b!517724))

(assert (= (and b!517724 res!316862) b!517725))

(assert (=> d!79799 m!499093))

(declare-fun m!499125 () Bool)

(assert (=> b!517725 m!499125))

(assert (=> b!517551 d!79799))

(declare-fun d!79801 () Bool)

(declare-fun lt!237007 () (_ BitVec 32))

(declare-fun lt!237006 () (_ BitVec 32))

(assert (=> d!79801 (= lt!237007 (bvmul (bvxor lt!237006 (bvlshr lt!237006 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79801 (= lt!237006 ((_ extract 31 0) (bvand (bvxor (select (arr!15921 a!3235) j!176) (bvlshr (select (arr!15921 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79801 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316863 (let ((h!10983 ((_ extract 31 0) (bvand (bvxor (select (arr!15921 a!3235) j!176) (bvlshr (select (arr!15921 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48711 (bvmul (bvxor h!10983 (bvlshr h!10983 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48711 (bvlshr x!48711 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316863 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316863 #b00000000000000000000000000000000))))))

(assert (=> d!79801 (= (toIndex!0 (select (arr!15921 a!3235) j!176) mask!3524) (bvand (bvxor lt!237007 (bvlshr lt!237007 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517546 d!79801))

(declare-fun b!517726 () Bool)

(declare-fun e!302119 () Bool)

(declare-fun e!302121 () Bool)

(assert (=> b!517726 (= e!302119 e!302121)))

(declare-fun c!60724 () Bool)

(assert (=> b!517726 (= c!60724 (validKeyInArray!0 (select (arr!15921 a!3235) j!176)))))

(declare-fun d!79803 () Bool)

(declare-fun res!316864 () Bool)

(assert (=> d!79803 (=> res!316864 e!302119)))

(assert (=> d!79803 (= res!316864 (bvsge j!176 (size!16285 a!3235)))))

(assert (=> d!79803 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302119)))

(declare-fun b!517727 () Bool)

(declare-fun call!31696 () Bool)

(assert (=> b!517727 (= e!302121 call!31696)))

(declare-fun b!517728 () Bool)

(declare-fun e!302120 () Bool)

(assert (=> b!517728 (= e!302121 e!302120)))

(declare-fun lt!237008 () (_ BitVec 64))

(assert (=> b!517728 (= lt!237008 (select (arr!15921 a!3235) j!176))))

(declare-fun lt!237010 () Unit!16034)

(assert (=> b!517728 (= lt!237010 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237008 j!176))))

(assert (=> b!517728 (arrayContainsKey!0 a!3235 lt!237008 #b00000000000000000000000000000000)))

(declare-fun lt!237009 () Unit!16034)

(assert (=> b!517728 (= lt!237009 lt!237010)))

(declare-fun res!316865 () Bool)

(assert (=> b!517728 (= res!316865 (= (seekEntryOrOpen!0 (select (arr!15921 a!3235) j!176) a!3235 mask!3524) (Found!4388 j!176)))))

(assert (=> b!517728 (=> (not res!316865) (not e!302120))))

(declare-fun b!517729 () Bool)

(assert (=> b!517729 (= e!302120 call!31696)))

(declare-fun bm!31693 () Bool)

(assert (=> bm!31693 (= call!31696 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79803 (not res!316864)) b!517726))

(assert (= (and b!517726 c!60724) b!517728))

(assert (= (and b!517726 (not c!60724)) b!517727))

(assert (= (and b!517728 res!316865) b!517729))

(assert (= (or b!517729 b!517727) bm!31693))

(assert (=> b!517726 m!498939))

(assert (=> b!517726 m!498939))

(assert (=> b!517726 m!498941))

(assert (=> b!517728 m!498939))

(declare-fun m!499127 () Bool)

(assert (=> b!517728 m!499127))

(declare-fun m!499129 () Bool)

(assert (=> b!517728 m!499129))

(assert (=> b!517728 m!498939))

(assert (=> b!517728 m!498959))

(declare-fun m!499131 () Bool)

(assert (=> bm!31693 m!499131))

(assert (=> b!517546 d!79803))

(declare-fun d!79805 () Bool)

(declare-fun lt!237012 () (_ BitVec 32))

(declare-fun lt!237011 () (_ BitVec 32))

(assert (=> d!79805 (= lt!237012 (bvmul (bvxor lt!237011 (bvlshr lt!237011 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79805 (= lt!237011 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15921 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15921 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79805 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316863 (let ((h!10983 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15921 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15921 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48711 (bvmul (bvxor h!10983 (bvlshr h!10983 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48711 (bvlshr x!48711 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316863 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316863 #b00000000000000000000000000000000))))))

(assert (=> d!79805 (= (toIndex!0 (select (store (arr!15921 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!237012 (bvlshr lt!237012 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517546 d!79805))

(declare-fun b!517817 () Bool)

(declare-fun e!302170 () SeekEntryResult!4388)

(assert (=> b!517817 (= e!302170 (Intermediate!4388 false lt!236916 #b00000000000000000000000000000000))))

(declare-fun b!517818 () Bool)

(declare-fun e!302173 () Bool)

(declare-fun e!302174 () Bool)

(assert (=> b!517818 (= e!302173 e!302174)))

(declare-fun res!316894 () Bool)

(declare-fun lt!237046 () SeekEntryResult!4388)

(assert (=> b!517818 (= res!316894 (and (is-Intermediate!4388 lt!237046) (not (undefined!5200 lt!237046)) (bvslt (x!48707 lt!237046) #b01111111111111111111111111111110) (bvsge (x!48707 lt!237046) #b00000000000000000000000000000000) (bvsge (x!48707 lt!237046) #b00000000000000000000000000000000)))))

(assert (=> b!517818 (=> (not res!316894) (not e!302174))))

(declare-fun b!517819 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517819 (= e!302170 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236916 #b00000000000000000000000000000000 mask!3524) (select (arr!15921 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517820 () Bool)

(declare-fun e!302171 () SeekEntryResult!4388)

(assert (=> b!517820 (= e!302171 (Intermediate!4388 true lt!236916 #b00000000000000000000000000000000))))

(declare-fun b!517821 () Bool)

(assert (=> b!517821 (= e!302171 e!302170)))

(declare-fun lt!237045 () (_ BitVec 64))

(declare-fun c!60757 () Bool)

(assert (=> b!517821 (= c!60757 (or (= lt!237045 (select (arr!15921 a!3235) j!176)) (= (bvadd lt!237045 lt!237045) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517822 () Bool)

(assert (=> b!517822 (= e!302173 (bvsge (x!48707 lt!237046) #b01111111111111111111111111111110))))

(declare-fun b!517823 () Bool)

(assert (=> b!517823 (and (bvsge (index!19742 lt!237046) #b00000000000000000000000000000000) (bvslt (index!19742 lt!237046) (size!16285 a!3235)))))

(declare-fun res!316896 () Bool)

(assert (=> b!517823 (= res!316896 (= (select (arr!15921 a!3235) (index!19742 lt!237046)) (select (arr!15921 a!3235) j!176)))))

(declare-fun e!302172 () Bool)

(assert (=> b!517823 (=> res!316896 e!302172)))

(assert (=> b!517823 (= e!302174 e!302172)))

(declare-fun b!517825 () Bool)

(assert (=> b!517825 (and (bvsge (index!19742 lt!237046) #b00000000000000000000000000000000) (bvslt (index!19742 lt!237046) (size!16285 a!3235)))))

(assert (=> b!517825 (= e!302172 (= (select (arr!15921 a!3235) (index!19742 lt!237046)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517824 () Bool)

(assert (=> b!517824 (and (bvsge (index!19742 lt!237046) #b00000000000000000000000000000000) (bvslt (index!19742 lt!237046) (size!16285 a!3235)))))

(declare-fun res!316895 () Bool)

(assert (=> b!517824 (= res!316895 (= (select (arr!15921 a!3235) (index!19742 lt!237046)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517824 (=> res!316895 e!302172)))

(declare-fun d!79807 () Bool)

(assert (=> d!79807 e!302173))

(declare-fun c!60756 () Bool)

(assert (=> d!79807 (= c!60756 (and (is-Intermediate!4388 lt!237046) (undefined!5200 lt!237046)))))

(assert (=> d!79807 (= lt!237046 e!302171)))

(declare-fun c!60755 () Bool)

(assert (=> d!79807 (= c!60755 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79807 (= lt!237045 (select (arr!15921 a!3235) lt!236916))))

(assert (=> d!79807 (validMask!0 mask!3524)))

(assert (=> d!79807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236916 (select (arr!15921 a!3235) j!176) a!3235 mask!3524) lt!237046)))

(assert (= (and d!79807 c!60755) b!517820))

(assert (= (and d!79807 (not c!60755)) b!517821))

(assert (= (and b!517821 c!60757) b!517817))

(assert (= (and b!517821 (not c!60757)) b!517819))

(assert (= (and d!79807 c!60756) b!517822))

(assert (= (and d!79807 (not c!60756)) b!517818))

(assert (= (and b!517818 res!316894) b!517823))

(assert (= (and b!517823 (not res!316896)) b!517824))

(assert (= (and b!517824 (not res!316895)) b!517825))

(declare-fun m!499173 () Bool)

(assert (=> b!517825 m!499173))

(declare-fun m!499175 () Bool)

(assert (=> b!517819 m!499175))

(assert (=> b!517819 m!499175))

(assert (=> b!517819 m!498939))

(declare-fun m!499177 () Bool)

(assert (=> b!517819 m!499177))

(assert (=> b!517823 m!499173))

(assert (=> b!517824 m!499173))

(declare-fun m!499181 () Bool)

(assert (=> d!79807 m!499181))

(assert (=> d!79807 m!498949))

(assert (=> b!517546 d!79807))

(declare-fun d!79825 () Bool)

(assert (=> d!79825 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237059 () Unit!16034)

(declare-fun choose!38 (array!33112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16034)

(assert (=> d!79825 (= lt!237059 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79825 (validMask!0 mask!3524)))

(assert (=> d!79825 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237059)))

(declare-fun bs!16344 () Bool)

(assert (= bs!16344 d!79825))

(assert (=> bs!16344 m!498973))

(declare-fun m!499197 () Bool)

(assert (=> bs!16344 m!499197))

(assert (=> bs!16344 m!498949))

(assert (=> b!517546 d!79825))

(declare-fun b!517839 () Bool)

(declare-fun e!302183 () SeekEntryResult!4388)

(assert (=> b!517839 (= e!302183 (Intermediate!4388 false lt!236917 #b00000000000000000000000000000000))))

(declare-fun b!517840 () Bool)

(declare-fun e!302186 () Bool)

(declare-fun e!302187 () Bool)

(assert (=> b!517840 (= e!302186 e!302187)))

(declare-fun res!316902 () Bool)

(declare-fun lt!237061 () SeekEntryResult!4388)

(assert (=> b!517840 (= res!316902 (and (is-Intermediate!4388 lt!237061) (not (undefined!5200 lt!237061)) (bvslt (x!48707 lt!237061) #b01111111111111111111111111111110) (bvsge (x!48707 lt!237061) #b00000000000000000000000000000000) (bvsge (x!48707 lt!237061) #b00000000000000000000000000000000)))))

(assert (=> b!517840 (=> (not res!316902) (not e!302187))))

(declare-fun b!517841 () Bool)

(assert (=> b!517841 (= e!302183 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236917 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15921 a!3235) i!1204 k!2280) j!176) (array!33113 (store (arr!15921 a!3235) i!1204 k!2280) (size!16285 a!3235)) mask!3524))))

(declare-fun b!517842 () Bool)

(declare-fun e!302184 () SeekEntryResult!4388)

(assert (=> b!517842 (= e!302184 (Intermediate!4388 true lt!236917 #b00000000000000000000000000000000))))

(declare-fun b!517843 () Bool)

(assert (=> b!517843 (= e!302184 e!302183)))

(declare-fun c!60764 () Bool)

(declare-fun lt!237060 () (_ BitVec 64))

(assert (=> b!517843 (= c!60764 (or (= lt!237060 (select (store (arr!15921 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!237060 lt!237060) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517844 () Bool)

(assert (=> b!517844 (= e!302186 (bvsge (x!48707 lt!237061) #b01111111111111111111111111111110))))

(declare-fun b!517845 () Bool)

(assert (=> b!517845 (and (bvsge (index!19742 lt!237061) #b00000000000000000000000000000000) (bvslt (index!19742 lt!237061) (size!16285 (array!33113 (store (arr!15921 a!3235) i!1204 k!2280) (size!16285 a!3235)))))))

(declare-fun res!316904 () Bool)

(assert (=> b!517845 (= res!316904 (= (select (arr!15921 (array!33113 (store (arr!15921 a!3235) i!1204 k!2280) (size!16285 a!3235))) (index!19742 lt!237061)) (select (store (arr!15921 a!3235) i!1204 k!2280) j!176)))))

(declare-fun e!302185 () Bool)

(assert (=> b!517845 (=> res!316904 e!302185)))

(assert (=> b!517845 (= e!302187 e!302185)))

(declare-fun b!517847 () Bool)

(assert (=> b!517847 (and (bvsge (index!19742 lt!237061) #b00000000000000000000000000000000) (bvslt (index!19742 lt!237061) (size!16285 (array!33113 (store (arr!15921 a!3235) i!1204 k!2280) (size!16285 a!3235)))))))

(assert (=> b!517847 (= e!302185 (= (select (arr!15921 (array!33113 (store (arr!15921 a!3235) i!1204 k!2280) (size!16285 a!3235))) (index!19742 lt!237061)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517846 () Bool)

(assert (=> b!517846 (and (bvsge (index!19742 lt!237061) #b00000000000000000000000000000000) (bvslt (index!19742 lt!237061) (size!16285 (array!33113 (store (arr!15921 a!3235) i!1204 k!2280) (size!16285 a!3235)))))))

(declare-fun res!316903 () Bool)

(assert (=> b!517846 (= res!316903 (= (select (arr!15921 (array!33113 (store (arr!15921 a!3235) i!1204 k!2280) (size!16285 a!3235))) (index!19742 lt!237061)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517846 (=> res!316903 e!302185)))

(declare-fun d!79833 () Bool)

(assert (=> d!79833 e!302186))

(declare-fun c!60763 () Bool)

(assert (=> d!79833 (= c!60763 (and (is-Intermediate!4388 lt!237061) (undefined!5200 lt!237061)))))

(assert (=> d!79833 (= lt!237061 e!302184)))

(declare-fun c!60762 () Bool)

(assert (=> d!79833 (= c!60762 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79833 (= lt!237060 (select (arr!15921 (array!33113 (store (arr!15921 a!3235) i!1204 k!2280) (size!16285 a!3235))) lt!236917))))

(assert (=> d!79833 (validMask!0 mask!3524)))

(assert (=> d!79833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236917 (select (store (arr!15921 a!3235) i!1204 k!2280) j!176) (array!33113 (store (arr!15921 a!3235) i!1204 k!2280) (size!16285 a!3235)) mask!3524) lt!237061)))

(assert (= (and d!79833 c!60762) b!517842))

(assert (= (and d!79833 (not c!60762)) b!517843))

(assert (= (and b!517843 c!60764) b!517839))

(assert (= (and b!517843 (not c!60764)) b!517841))

(assert (= (and d!79833 c!60763) b!517844))

(assert (= (and d!79833 (not c!60763)) b!517840))

(assert (= (and b!517840 res!316902) b!517845))

(assert (= (and b!517845 (not res!316904)) b!517846))

(assert (= (and b!517846 (not res!316903)) b!517847))

(declare-fun m!499199 () Bool)

(assert (=> b!517847 m!499199))

(declare-fun m!499201 () Bool)

(assert (=> b!517841 m!499201))

(assert (=> b!517841 m!499201))

(assert (=> b!517841 m!498967))

(declare-fun m!499203 () Bool)

(assert (=> b!517841 m!499203))

(assert (=> b!517845 m!499199))

(assert (=> b!517846 m!499199))

(declare-fun m!499205 () Bool)

(assert (=> d!79833 m!499205))

(assert (=> d!79833 m!498949))

(assert (=> b!517546 d!79833))

(declare-fun b!517887 () Bool)

(declare-fun e!302217 () SeekEntryResult!4388)

(declare-fun lt!237073 () SeekEntryResult!4388)

(assert (=> b!517887 (= e!302217 (Found!4388 (index!19742 lt!237073)))))

(declare-fun e!302215 () SeekEntryResult!4388)

(declare-fun b!517888 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33112 (_ BitVec 32)) SeekEntryResult!4388)

(assert (=> b!517888 (= e!302215 (seekKeyOrZeroReturnVacant!0 (x!48707 lt!237073) (index!19742 lt!237073) (index!19742 lt!237073) k!2280 a!3235 mask!3524))))

(declare-fun b!517890 () Bool)

(declare-fun e!302216 () SeekEntryResult!4388)

(assert (=> b!517890 (= e!302216 Undefined!4388)))

(declare-fun b!517891 () Bool)

(assert (=> b!517891 (= e!302215 (MissingZero!4388 (index!19742 lt!237073)))))

(declare-fun b!517892 () Bool)

(assert (=> b!517892 (= e!302216 e!302217)))

(declare-fun lt!237072 () (_ BitVec 64))

(assert (=> b!517892 (= lt!237072 (select (arr!15921 a!3235) (index!19742 lt!237073)))))

(declare-fun c!60779 () Bool)

(assert (=> b!517892 (= c!60779 (= lt!237072 k!2280))))

(declare-fun d!79835 () Bool)

(declare-fun lt!237071 () SeekEntryResult!4388)

(assert (=> d!79835 (and (or (is-Undefined!4388 lt!237071) (not (is-Found!4388 lt!237071)) (and (bvsge (index!19741 lt!237071) #b00000000000000000000000000000000) (bvslt (index!19741 lt!237071) (size!16285 a!3235)))) (or (is-Undefined!4388 lt!237071) (is-Found!4388 lt!237071) (not (is-MissingZero!4388 lt!237071)) (and (bvsge (index!19740 lt!237071) #b00000000000000000000000000000000) (bvslt (index!19740 lt!237071) (size!16285 a!3235)))) (or (is-Undefined!4388 lt!237071) (is-Found!4388 lt!237071) (is-MissingZero!4388 lt!237071) (not (is-MissingVacant!4388 lt!237071)) (and (bvsge (index!19743 lt!237071) #b00000000000000000000000000000000) (bvslt (index!19743 lt!237071) (size!16285 a!3235)))) (or (is-Undefined!4388 lt!237071) (ite (is-Found!4388 lt!237071) (= (select (arr!15921 a!3235) (index!19741 lt!237071)) k!2280) (ite (is-MissingZero!4388 lt!237071) (= (select (arr!15921 a!3235) (index!19740 lt!237071)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4388 lt!237071) (= (select (arr!15921 a!3235) (index!19743 lt!237071)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79835 (= lt!237071 e!302216)))

(declare-fun c!60777 () Bool)

(assert (=> d!79835 (= c!60777 (and (is-Intermediate!4388 lt!237073) (undefined!5200 lt!237073)))))

(assert (=> d!79835 (= lt!237073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79835 (validMask!0 mask!3524)))

(assert (=> d!79835 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!237071)))

(declare-fun b!517889 () Bool)

(declare-fun c!60778 () Bool)

(assert (=> b!517889 (= c!60778 (= lt!237072 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517889 (= e!302217 e!302215)))

(assert (= (and d!79835 c!60777) b!517890))

(assert (= (and d!79835 (not c!60777)) b!517892))

(assert (= (and b!517892 c!60779) b!517887))

(assert (= (and b!517892 (not c!60779)) b!517889))

(assert (= (and b!517889 c!60778) b!517891))

(assert (= (and b!517889 (not c!60778)) b!517888))

(declare-fun m!499227 () Bool)

(assert (=> b!517888 m!499227))

(declare-fun m!499229 () Bool)

(assert (=> b!517892 m!499229))

(declare-fun m!499231 () Bool)

(assert (=> d!79835 m!499231))

(declare-fun m!499233 () Bool)

(assert (=> d!79835 m!499233))

(declare-fun m!499235 () Bool)

(assert (=> d!79835 m!499235))

(assert (=> d!79835 m!498949))

(declare-fun m!499237 () Bool)

(assert (=> d!79835 m!499237))

(assert (=> d!79835 m!499231))

(declare-fun m!499239 () Bool)

(assert (=> d!79835 m!499239))

(assert (=> b!517552 d!79835))

(declare-fun d!79847 () Bool)

(declare-fun res!316928 () Bool)

(declare-fun e!302226 () Bool)

(assert (=> d!79847 (=> res!316928 e!302226)))

(assert (=> d!79847 (= res!316928 (bvsge #b00000000000000000000000000000000 (size!16285 a!3235)))))

(assert (=> d!79847 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10076) e!302226)))

(declare-fun b!517903 () Bool)

(declare-fun e!302228 () Bool)

(declare-fun call!31703 () Bool)

(assert (=> b!517903 (= e!302228 call!31703)))

(declare-fun bm!31700 () Bool)

(declare-fun c!60782 () Bool)

(assert (=> bm!31700 (= call!31703 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60782 (Cons!10075 (select (arr!15921 a!3235) #b00000000000000000000000000000000) Nil!10076) Nil!10076)))))

(declare-fun b!517904 () Bool)

(declare-fun e!302227 () Bool)

(declare-fun contains!2747 (List!10079 (_ BitVec 64)) Bool)

(assert (=> b!517904 (= e!302227 (contains!2747 Nil!10076 (select (arr!15921 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517905 () Bool)

(declare-fun e!302229 () Bool)

(assert (=> b!517905 (= e!302226 e!302229)))

(declare-fun res!316927 () Bool)

(assert (=> b!517905 (=> (not res!316927) (not e!302229))))

(assert (=> b!517905 (= res!316927 (not e!302227))))

(declare-fun res!316926 () Bool)

(assert (=> b!517905 (=> (not res!316926) (not e!302227))))

(assert (=> b!517905 (= res!316926 (validKeyInArray!0 (select (arr!15921 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517906 () Bool)

(assert (=> b!517906 (= e!302229 e!302228)))

(assert (=> b!517906 (= c!60782 (validKeyInArray!0 (select (arr!15921 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517907 () Bool)

(assert (=> b!517907 (= e!302228 call!31703)))

(assert (= (and d!79847 (not res!316928)) b!517905))

(assert (= (and b!517905 res!316926) b!517904))

(assert (= (and b!517905 res!316927) b!517906))

(assert (= (and b!517906 c!60782) b!517903))

(assert (= (and b!517906 (not c!60782)) b!517907))

(assert (= (or b!517903 b!517907) bm!31700))

(assert (=> bm!31700 m!499093))

(declare-fun m!499241 () Bool)

(assert (=> bm!31700 m!499241))

(assert (=> b!517904 m!499093))

(assert (=> b!517904 m!499093))

(declare-fun m!499243 () Bool)

(assert (=> b!517904 m!499243))

(assert (=> b!517905 m!499093))

(assert (=> b!517905 m!499093))

(assert (=> b!517905 m!499095))

(assert (=> b!517906 m!499093))

(assert (=> b!517906 m!499093))

(assert (=> b!517906 m!499095))

(assert (=> b!517547 d!79847))

(declare-fun b!517908 () Bool)

(declare-fun e!302232 () SeekEntryResult!4388)

(declare-fun lt!237076 () SeekEntryResult!4388)

(assert (=> b!517908 (= e!302232 (Found!4388 (index!19742 lt!237076)))))

(declare-fun b!517909 () Bool)

(declare-fun e!302230 () SeekEntryResult!4388)

(assert (=> b!517909 (= e!302230 (seekKeyOrZeroReturnVacant!0 (x!48707 lt!237076) (index!19742 lt!237076) (index!19742 lt!237076) (select (arr!15921 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517911 () Bool)

(declare-fun e!302231 () SeekEntryResult!4388)

(assert (=> b!517911 (= e!302231 Undefined!4388)))

(declare-fun b!517912 () Bool)

(assert (=> b!517912 (= e!302230 (MissingZero!4388 (index!19742 lt!237076)))))

(declare-fun b!517913 () Bool)

(assert (=> b!517913 (= e!302231 e!302232)))

(declare-fun lt!237075 () (_ BitVec 64))

(assert (=> b!517913 (= lt!237075 (select (arr!15921 a!3235) (index!19742 lt!237076)))))

(declare-fun c!60785 () Bool)

(assert (=> b!517913 (= c!60785 (= lt!237075 (select (arr!15921 a!3235) j!176)))))

(declare-fun d!79849 () Bool)

(declare-fun lt!237074 () SeekEntryResult!4388)

(assert (=> d!79849 (and (or (is-Undefined!4388 lt!237074) (not (is-Found!4388 lt!237074)) (and (bvsge (index!19741 lt!237074) #b00000000000000000000000000000000) (bvslt (index!19741 lt!237074) (size!16285 a!3235)))) (or (is-Undefined!4388 lt!237074) (is-Found!4388 lt!237074) (not (is-MissingZero!4388 lt!237074)) (and (bvsge (index!19740 lt!237074) #b00000000000000000000000000000000) (bvslt (index!19740 lt!237074) (size!16285 a!3235)))) (or (is-Undefined!4388 lt!237074) (is-Found!4388 lt!237074) (is-MissingZero!4388 lt!237074) (not (is-MissingVacant!4388 lt!237074)) (and (bvsge (index!19743 lt!237074) #b00000000000000000000000000000000) (bvslt (index!19743 lt!237074) (size!16285 a!3235)))) (or (is-Undefined!4388 lt!237074) (ite (is-Found!4388 lt!237074) (= (select (arr!15921 a!3235) (index!19741 lt!237074)) (select (arr!15921 a!3235) j!176)) (ite (is-MissingZero!4388 lt!237074) (= (select (arr!15921 a!3235) (index!19740 lt!237074)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4388 lt!237074) (= (select (arr!15921 a!3235) (index!19743 lt!237074)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79849 (= lt!237074 e!302231)))

(declare-fun c!60783 () Bool)

(assert (=> d!79849 (= c!60783 (and (is-Intermediate!4388 lt!237076) (undefined!5200 lt!237076)))))

(assert (=> d!79849 (= lt!237076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15921 a!3235) j!176) mask!3524) (select (arr!15921 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79849 (validMask!0 mask!3524)))

(assert (=> d!79849 (= (seekEntryOrOpen!0 (select (arr!15921 a!3235) j!176) a!3235 mask!3524) lt!237074)))

(declare-fun b!517910 () Bool)

(declare-fun c!60784 () Bool)

(assert (=> b!517910 (= c!60784 (= lt!237075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517910 (= e!302232 e!302230)))

(assert (= (and d!79849 c!60783) b!517911))

(assert (= (and d!79849 (not c!60783)) b!517913))

(assert (= (and b!517913 c!60785) b!517908))

(assert (= (and b!517913 (not c!60785)) b!517910))

(assert (= (and b!517910 c!60784) b!517912))

(assert (= (and b!517910 (not c!60784)) b!517909))

(assert (=> b!517909 m!498939))

(declare-fun m!499245 () Bool)

(assert (=> b!517909 m!499245))

(declare-fun m!499247 () Bool)

(assert (=> b!517913 m!499247))

(assert (=> d!79849 m!498971))

(assert (=> d!79849 m!498939))

(declare-fun m!499249 () Bool)

(assert (=> d!79849 m!499249))

(declare-fun m!499251 () Bool)

(assert (=> d!79849 m!499251))

(assert (=> d!79849 m!498949))

(declare-fun m!499253 () Bool)

(assert (=> d!79849 m!499253))

(assert (=> d!79849 m!498939))

(assert (=> d!79849 m!498971))

(declare-fun m!499255 () Bool)

(assert (=> d!79849 m!499255))

(assert (=> b!517553 d!79849))

(push 1)

(assert (not b!517905))

(assert (not b!517725))

(assert (not b!517690))

(assert (not bm!31693))

(assert (not d!79849))

(assert (not bm!31691))

(assert (not d!79825))

(assert (not b!517904))

(assert (not b!517906))

(assert (not b!517688))

(assert (not d!79807))

(assert (not b!517726))

(assert (not b!517728))

(assert (not bm!31700))

(assert (not b!517888))

(assert (not b!517909))

(assert (not d!79835))

(assert (not d!79833))

(assert (not b!517819))

(assert (not b!517841))

(check-sat)

(pop 1)

(push 1)

(check-sat)

