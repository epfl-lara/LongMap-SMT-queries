; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85632 () Bool)

(assert start!85632)

(declare-fun b!994244 () Bool)

(declare-fun res!664772 () Bool)

(declare-fun e!561094 () Bool)

(assert (=> b!994244 (=> (not res!664772) (not e!561094))))

(declare-datatypes ((List!20992 0))(
  ( (Nil!20989) (Cons!20988 (h!22150 (_ BitVec 64)) (t!29993 List!20992)) )
))
(declare-fun acc!919 () List!20992)

(declare-fun contains!5853 (List!20992 (_ BitVec 64)) Bool)

(assert (=> b!994244 (= res!664772 (not (contains!5853 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994245 () Bool)

(declare-fun res!664771 () Bool)

(assert (=> b!994245 (=> (not res!664771) (not e!561094))))

(assert (=> b!994245 (= res!664771 (not (contains!5853 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!664773 () Bool)

(assert (=> start!85632 (=> (not res!664773) (not e!561094))))

(declare-datatypes ((array!62872 0))(
  ( (array!62873 (arr!30277 (Array (_ BitVec 32) (_ BitVec 64))) (size!30779 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62872)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85632 (= res!664773 (and (= (size!30779 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62873 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30779 a!4424))))))

(assert (=> start!85632 e!561094))

(declare-fun array_inv!23401 (array!62872) Bool)

(assert (=> start!85632 (array_inv!23401 a!4424)))

(assert (=> start!85632 true))

(declare-fun b!994246 () Bool)

(declare-fun arrayNoDuplicates!0 (array!62872 (_ BitVec 32) List!20992) Bool)

(assert (=> b!994246 (= e!561094 (not (arrayNoDuplicates!0 a!4424 from!3778 acc!919)))))

(declare-fun b!994247 () Bool)

(declare-fun res!664770 () Bool)

(assert (=> b!994247 (=> (not res!664770) (not e!561094))))

(declare-fun noDuplicate!1451 (List!20992) Bool)

(assert (=> b!994247 (= res!664770 (noDuplicate!1451 acc!919))))

(declare-fun b!994248 () Bool)

(declare-fun res!664769 () Bool)

(assert (=> b!994248 (=> (not res!664769) (not e!561094))))

(assert (=> b!994248 (= res!664769 (bvsge from!3778 size!36))))

(assert (= (and start!85632 res!664773) b!994245))

(assert (= (and b!994245 res!664771) b!994244))

(assert (= (and b!994244 res!664772) b!994247))

(assert (= (and b!994247 res!664770) b!994248))

(assert (= (and b!994248 res!664769) b!994246))

(declare-fun m!921875 () Bool)

(assert (=> b!994247 m!921875))

(declare-fun m!921877 () Bool)

(assert (=> start!85632 m!921877))

(declare-fun m!921879 () Bool)

(assert (=> b!994246 m!921879))

(declare-fun m!921881 () Bool)

(assert (=> b!994245 m!921881))

(declare-fun m!921883 () Bool)

(assert (=> b!994244 m!921883))

(push 1)

(assert (not b!994247))

(assert (not b!994245))

(assert (not start!85632))

(assert (not b!994246))

(assert (not b!994244))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!994328 () Bool)

(declare-fun e!561151 () Bool)

(declare-fun call!42175 () Bool)

(assert (=> b!994328 (= e!561151 call!42175)))

(declare-fun b!994329 () Bool)

(declare-fun e!561150 () Bool)

(assert (=> b!994329 (= e!561150 e!561151)))

(declare-fun c!100885 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994329 (= c!100885 (validKeyInArray!0 (select (arr!30277 a!4424) from!3778)))))

(declare-fun e!561152 () Bool)

(declare-fun b!994330 () Bool)

(assert (=> b!994330 (= e!561152 (contains!5853 acc!919 (select (arr!30277 a!4424) from!3778)))))

(declare-fun d!118673 () Bool)

(declare-fun res!664840 () Bool)

(declare-fun e!561149 () Bool)

(assert (=> d!118673 (=> res!664840 e!561149)))

(assert (=> d!118673 (= res!664840 (bvsge from!3778 (size!30779 a!4424)))))

(assert (=> d!118673 (= (arrayNoDuplicates!0 a!4424 from!3778 acc!919) e!561149)))

(declare-fun b!994331 () Bool)

(assert (=> b!994331 (= e!561149 e!561150)))

(declare-fun res!664839 () Bool)

(assert (=> b!994331 (=> (not res!664839) (not e!561150))))

(assert (=> b!994331 (= res!664839 (not e!561152))))

(declare-fun res!664841 () Bool)

(assert (=> b!994331 (=> (not res!664841) (not e!561152))))

(assert (=> b!994331 (= res!664841 (validKeyInArray!0 (select (arr!30277 a!4424) from!3778)))))

(declare-fun bm!42172 () Bool)

(assert (=> bm!42172 (= call!42175 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!100885 (Cons!20988 (select (arr!30277 a!4424) from!3778) acc!919) acc!919)))))

(declare-fun b!994332 () Bool)

(assert (=> b!994332 (= e!561151 call!42175)))

(assert (= (and d!118673 (not res!664840)) b!994331))

(assert (= (and b!994331 res!664841) b!994330))

(assert (= (and b!994331 res!664839) b!994329))

(assert (= (and b!994329 c!100885) b!994332))

(assert (= (and b!994329 (not c!100885)) b!994328))

(assert (= (or b!994332 b!994328) bm!42172))

(declare-fun m!921922 () Bool)

(assert (=> b!994329 m!921922))

(assert (=> b!994329 m!921922))

(declare-fun m!921927 () Bool)

(assert (=> b!994329 m!921927))

(assert (=> b!994330 m!921922))

(assert (=> b!994330 m!921922))

(declare-fun m!921929 () Bool)

(assert (=> b!994330 m!921929))

(assert (=> b!994331 m!921922))

(assert (=> b!994331 m!921922))

(assert (=> b!994331 m!921927))

(assert (=> bm!42172 m!921922))

(declare-fun m!921936 () Bool)

(assert (=> bm!42172 m!921936))

(assert (=> b!994246 d!118673))

(declare-fun d!118685 () Bool)

(declare-fun lt!440713 () Bool)

(declare-fun content!480 (List!20992) (Set (_ BitVec 64)))

(assert (=> d!118685 (= lt!440713 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!480 acc!919)))))

(declare-fun e!561176 () Bool)

(assert (=> d!118685 (= lt!440713 e!561176)))

(declare-fun res!664864 () Bool)

(assert (=> d!118685 (=> (not res!664864) (not e!561176))))

(assert (=> d!118685 (= res!664864 (is-Cons!20988 acc!919))))

(assert (=> d!118685 (= (contains!5853 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440713)))

(declare-fun b!994356 () Bool)

(declare-fun e!561175 () Bool)

(assert (=> b!994356 (= e!561176 e!561175)))

(declare-fun res!664863 () Bool)

(assert (=> b!994356 (=> res!664863 e!561175)))

(assert (=> b!994356 (= res!664863 (= (h!22150 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994357 () Bool)

(assert (=> b!994357 (= e!561175 (contains!5853 (t!29993 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118685 res!664864) b!994356))

(assert (= (and b!994356 (not res!664863)) b!994357))

(declare-fun m!921957 () Bool)

(assert (=> d!118685 m!921957))

(declare-fun m!921959 () Bool)

(assert (=> d!118685 m!921959))

(declare-fun m!921961 () Bool)

(assert (=> b!994357 m!921961))

(assert (=> b!994245 d!118685))

(declare-fun d!118693 () Bool)

(declare-fun lt!440714 () Bool)

(assert (=> d!118693 (= lt!440714 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!480 acc!919)))))

(declare-fun e!561178 () Bool)

(assert (=> d!118693 (= lt!440714 e!561178)))

(declare-fun res!664866 () Bool)

(assert (=> d!118693 (=> (not res!664866) (not e!561178))))

(assert (=> d!118693 (= res!664866 (is-Cons!20988 acc!919))))

(assert (=> d!118693 (= (contains!5853 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440714)))

(declare-fun b!994358 () Bool)

(declare-fun e!561177 () Bool)

(assert (=> b!994358 (= e!561178 e!561177)))

(declare-fun res!664865 () Bool)

(assert (=> b!994358 (=> res!664865 e!561177)))

(assert (=> b!994358 (= res!664865 (= (h!22150 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994359 () Bool)

(assert (=> b!994359 (= e!561177 (contains!5853 (t!29993 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118693 res!664866) b!994358))

(assert (= (and b!994358 (not res!664865)) b!994359))

(assert (=> d!118693 m!921957))

(declare-fun m!921963 () Bool)

(assert (=> d!118693 m!921963))

(declare-fun m!921965 () Bool)

(assert (=> b!994359 m!921965))

(assert (=> b!994244 d!118693))

(declare-fun d!118695 () Bool)

(assert (=> d!118695 (= (array_inv!23401 a!4424) (bvsge (size!30779 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85632 d!118695))

(declare-fun d!118697 () Bool)

(declare-fun res!664871 () Bool)

(declare-fun e!561183 () Bool)

(assert (=> d!118697 (=> res!664871 e!561183)))

(assert (=> d!118697 (= res!664871 (is-Nil!20989 acc!919))))

(assert (=> d!118697 (= (noDuplicate!1451 acc!919) e!561183)))

(declare-fun b!994364 () Bool)

(declare-fun e!561184 () Bool)

(assert (=> b!994364 (= e!561183 e!561184)))

(declare-fun res!664872 () Bool)

(assert (=> b!994364 (=> (not res!664872) (not e!561184))))

(assert (=> b!994364 (= res!664872 (not (contains!5853 (t!29993 acc!919) (h!22150 acc!919))))))

(declare-fun b!994365 () Bool)

(assert (=> b!994365 (= e!561184 (noDuplicate!1451 (t!29993 acc!919)))))

(assert (= (and d!118697 (not res!664871)) b!994364))

(assert (= (and b!994364 res!664872) b!994365))

(declare-fun m!921967 () Bool)

(assert (=> b!994364 m!921967))

(declare-fun m!921969 () Bool)

(assert (=> b!994365 m!921969))

(assert (=> b!994247 d!118697))

(push 1)

(assert (not b!994329))

(assert (not d!118685))

(assert (not d!118693))

(assert (not b!994364))

(assert (not b!994330))

(assert (not b!994365))

(assert (not b!994357))

(assert (not b!994359))

(assert (not b!994331))

(assert (not bm!42172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

