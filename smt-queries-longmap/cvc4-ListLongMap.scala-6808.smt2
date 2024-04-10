; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85636 () Bool)

(assert start!85636)

(declare-fun b!994274 () Bool)

(declare-fun res!664802 () Bool)

(declare-fun e!561106 () Bool)

(assert (=> b!994274 (=> (not res!664802) (not e!561106))))

(declare-datatypes ((List!20994 0))(
  ( (Nil!20991) (Cons!20990 (h!22152 (_ BitVec 64)) (t!29995 List!20994)) )
))
(declare-fun acc!919 () List!20994)

(declare-fun noDuplicate!1453 (List!20994) Bool)

(assert (=> b!994274 (= res!664802 (noDuplicate!1453 acc!919))))

(declare-fun b!994275 () Bool)

(declare-fun res!664799 () Bool)

(assert (=> b!994275 (=> (not res!664799) (not e!561106))))

(declare-fun contains!5855 (List!20994 (_ BitVec 64)) Bool)

(assert (=> b!994275 (= res!664799 (not (contains!5855 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!62876 0))(
  ( (array!62877 (arr!30279 (Array (_ BitVec 32) (_ BitVec 64))) (size!30781 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62876)

(declare-fun b!994276 () Bool)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!62876 (_ BitVec 32) List!20994) Bool)

(assert (=> b!994276 (= e!561106 (not (arrayNoDuplicates!0 a!4424 from!3778 acc!919)))))

(declare-fun b!994277 () Bool)

(declare-fun res!664800 () Bool)

(assert (=> b!994277 (=> (not res!664800) (not e!561106))))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> b!994277 (= res!664800 (bvsge from!3778 size!36))))

(declare-fun res!664803 () Bool)

(assert (=> start!85636 (=> (not res!664803) (not e!561106))))

(assert (=> start!85636 (= res!664803 (and (= (size!30781 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62877 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30781 a!4424))))))

(assert (=> start!85636 e!561106))

(declare-fun array_inv!23403 (array!62876) Bool)

(assert (=> start!85636 (array_inv!23403 a!4424)))

(assert (=> start!85636 true))

(declare-fun b!994278 () Bool)

(declare-fun res!664801 () Bool)

(assert (=> b!994278 (=> (not res!664801) (not e!561106))))

(assert (=> b!994278 (= res!664801 (not (contains!5855 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85636 res!664803) b!994278))

(assert (= (and b!994278 res!664801) b!994275))

(assert (= (and b!994275 res!664799) b!994274))

(assert (= (and b!994274 res!664802) b!994277))

(assert (= (and b!994277 res!664800) b!994276))

(declare-fun m!921895 () Bool)

(assert (=> b!994274 m!921895))

(declare-fun m!921897 () Bool)

(assert (=> b!994278 m!921897))

(declare-fun m!921899 () Bool)

(assert (=> b!994275 m!921899))

(declare-fun m!921901 () Bool)

(assert (=> start!85636 m!921901))

(declare-fun m!921903 () Bool)

(assert (=> b!994276 m!921903))

(push 1)

(assert (not start!85636))

(assert (not b!994278))

(assert (not b!994274))

(assert (not b!994276))

(assert (not b!994275))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118675 () Bool)

(declare-fun lt!440708 () Bool)

(declare-fun content!478 (List!20994) (Set (_ BitVec 64)))

(assert (=> d!118675 (= lt!440708 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!478 acc!919)))))

(declare-fun e!561118 () Bool)

(assert (=> d!118675 (= lt!440708 e!561118)))

(declare-fun res!664815 () Bool)

(assert (=> d!118675 (=> (not res!664815) (not e!561118))))

(assert (=> d!118675 (= res!664815 (is-Cons!20990 acc!919))))

(assert (=> d!118675 (= (contains!5855 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440708)))

(declare-fun b!994289 () Bool)

(declare-fun e!561117 () Bool)

(assert (=> b!994289 (= e!561118 e!561117)))

(declare-fun res!664814 () Bool)

(assert (=> b!994289 (=> res!664814 e!561117)))

(assert (=> b!994289 (= res!664814 (= (h!22152 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994290 () Bool)

(assert (=> b!994290 (= e!561117 (contains!5855 (t!29995 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118675 res!664815) b!994289))

(assert (= (and b!994289 (not res!664814)) b!994290))

(declare-fun m!921911 () Bool)

(assert (=> d!118675 m!921911))

(declare-fun m!921913 () Bool)

(assert (=> d!118675 m!921913))

(declare-fun m!921915 () Bool)

(assert (=> b!994290 m!921915))

(assert (=> b!994278 d!118675))

(declare-fun d!118679 () Bool)

(declare-fun lt!440709 () Bool)

(assert (=> d!118679 (= lt!440709 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!478 acc!919)))))

(declare-fun e!561120 () Bool)

(assert (=> d!118679 (= lt!440709 e!561120)))

(declare-fun res!664817 () Bool)

(assert (=> d!118679 (=> (not res!664817) (not e!561120))))

(assert (=> d!118679 (= res!664817 (is-Cons!20990 acc!919))))

(assert (=> d!118679 (= (contains!5855 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440709)))

(declare-fun b!994291 () Bool)

(declare-fun e!561119 () Bool)

(assert (=> b!994291 (= e!561120 e!561119)))

(declare-fun res!664816 () Bool)

(assert (=> b!994291 (=> res!664816 e!561119)))

(assert (=> b!994291 (= res!664816 (= (h!22152 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994292 () Bool)

(assert (=> b!994292 (= e!561119 (contains!5855 (t!29995 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118679 res!664817) b!994291))

(assert (= (and b!994291 (not res!664816)) b!994292))

(assert (=> d!118679 m!921911))

(declare-fun m!921917 () Bool)

(assert (=> d!118679 m!921917))

(declare-fun m!921919 () Bool)

(assert (=> b!994292 m!921919))

(assert (=> b!994275 d!118679))

(declare-fun b!994333 () Bool)

(declare-fun e!561156 () Bool)

(declare-fun call!42176 () Bool)

(assert (=> b!994333 (= e!561156 call!42176)))

(declare-fun d!118681 () Bool)

(declare-fun res!664842 () Bool)

(declare-fun e!561154 () Bool)

(assert (=> d!118681 (=> res!664842 e!561154)))

(assert (=> d!118681 (= res!664842 (bvsge from!3778 (size!30781 a!4424)))))

(assert (=> d!118681 (= (arrayNoDuplicates!0 a!4424 from!3778 acc!919) e!561154)))

(declare-fun b!994334 () Bool)

(declare-fun e!561155 () Bool)

(assert (=> b!994334 (= e!561154 e!561155)))

(declare-fun res!664844 () Bool)

(assert (=> b!994334 (=> (not res!664844) (not e!561155))))

(declare-fun e!561153 () Bool)

(assert (=> b!994334 (= res!664844 (not e!561153))))

(declare-fun res!664843 () Bool)

(assert (=> b!994334 (=> (not res!664843) (not e!561153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994334 (= res!664843 (validKeyInArray!0 (select (arr!30279 a!4424) from!3778)))))

(declare-fun b!994335 () Bool)

(assert (=> b!994335 (= e!561155 e!561156)))

(declare-fun c!100886 () Bool)

(assert (=> b!994335 (= c!100886 (validKeyInArray!0 (select (arr!30279 a!4424) from!3778)))))

(declare-fun b!994336 () Bool)

(assert (=> b!994336 (= e!561156 call!42176)))

(declare-fun b!994337 () Bool)

(assert (=> b!994337 (= e!561153 (contains!5855 acc!919 (select (arr!30279 a!4424) from!3778)))))

(declare-fun bm!42173 () Bool)

(assert (=> bm!42173 (= call!42176 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!100886 (Cons!20990 (select (arr!30279 a!4424) from!3778) acc!919) acc!919)))))

(assert (= (and d!118681 (not res!664842)) b!994334))

(assert (= (and b!994334 res!664843) b!994337))

(assert (= (and b!994334 res!664844) b!994335))

(assert (= (and b!994335 c!100886) b!994333))

(assert (= (and b!994335 (not c!100886)) b!994336))

(assert (= (or b!994333 b!994336) bm!42173))

(declare-fun m!921933 () Bool)

(assert (=> b!994334 m!921933))

(assert (=> b!994334 m!921933))

(declare-fun m!921939 () Bool)

(assert (=> b!994334 m!921939))

(assert (=> b!994335 m!921933))

(assert (=> b!994335 m!921933))

(assert (=> b!994335 m!921939))

(assert (=> b!994337 m!921933))

(assert (=> b!994337 m!921933))

(declare-fun m!921941 () Bool)

(assert (=> b!994337 m!921941))

(assert (=> bm!42173 m!921933))

(declare-fun m!921943 () Bool)

(assert (=> bm!42173 m!921943))

(assert (=> b!994276 d!118681))

(declare-fun d!118687 () Bool)

(declare-fun res!664855 () Bool)

(declare-fun e!561167 () Bool)

(assert (=> d!118687 (=> res!664855 e!561167)))

(assert (=> d!118687 (= res!664855 (is-Nil!20991 acc!919))))

(assert (=> d!118687 (= (noDuplicate!1453 acc!919) e!561167)))

(declare-fun b!994348 () Bool)

(declare-fun e!561168 () Bool)

(assert (=> b!994348 (= e!561167 e!561168)))

(declare-fun res!664856 () Bool)

(assert (=> b!994348 (=> (not res!664856) (not e!561168))))

(assert (=> b!994348 (= res!664856 (not (contains!5855 (t!29995 acc!919) (h!22152 acc!919))))))

(declare-fun b!994349 () Bool)

(assert (=> b!994349 (= e!561168 (noDuplicate!1453 (t!29995 acc!919)))))

(assert (= (and d!118687 (not res!664855)) b!994348))

(assert (= (and b!994348 res!664856) b!994349))

(declare-fun m!921949 () Bool)

(assert (=> b!994348 m!921949))

(declare-fun m!921951 () Bool)

(assert (=> b!994349 m!921951))

(assert (=> b!994274 d!118687))

(declare-fun d!118691 () Bool)

(assert (=> d!118691 (= (array_inv!23403 a!4424) (bvsge (size!30781 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85636 d!118691))

(push 1)

