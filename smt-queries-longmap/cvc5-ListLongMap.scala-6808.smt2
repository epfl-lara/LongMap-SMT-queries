; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85626 () Bool)

(assert start!85626)

(declare-fun res!664709 () Bool)

(declare-fun e!560974 () Bool)

(assert (=> start!85626 (=> (not res!664709) (not e!560974))))

(declare-datatypes ((array!62814 0))(
  ( (array!62815 (arr!30248 (Array (_ BitVec 32) (_ BitVec 64))) (size!30752 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62814)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun from!3778 () (_ BitVec 32))

(assert (=> start!85626 (= res!664709 (and (= (size!30752 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62815 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30752 a!4424))))))

(assert (=> start!85626 e!560974))

(declare-fun array_inv!23391 (array!62814) Bool)

(assert (=> start!85626 (array_inv!23391 a!4424)))

(assert (=> start!85626 true))

(declare-fun b!994056 () Bool)

(declare-fun res!664706 () Bool)

(assert (=> b!994056 (=> (not res!664706) (not e!560974))))

(declare-datatypes ((List!21029 0))(
  ( (Nil!21026) (Cons!21025 (h!22187 (_ BitVec 64)) (t!30021 List!21029)) )
))
(declare-fun acc!919 () List!21029)

(declare-fun contains!5828 (List!21029 (_ BitVec 64)) Bool)

(assert (=> b!994056 (= res!664706 (not (contains!5828 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994057 () Bool)

(declare-fun arrayNoDuplicates!0 (array!62814 (_ BitVec 32) List!21029) Bool)

(assert (=> b!994057 (= e!560974 (not (arrayNoDuplicates!0 a!4424 from!3778 acc!919)))))

(declare-fun b!994058 () Bool)

(declare-fun res!664708 () Bool)

(assert (=> b!994058 (=> (not res!664708) (not e!560974))))

(assert (=> b!994058 (= res!664708 (not (contains!5828 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!994059 () Bool)

(declare-fun res!664705 () Bool)

(assert (=> b!994059 (=> (not res!664705) (not e!560974))))

(declare-fun noDuplicate!1461 (List!21029) Bool)

(assert (=> b!994059 (= res!664705 (noDuplicate!1461 acc!919))))

(declare-fun b!994060 () Bool)

(declare-fun res!664707 () Bool)

(assert (=> b!994060 (=> (not res!664707) (not e!560974))))

(assert (=> b!994060 (= res!664707 (bvsge from!3778 size!36))))

(assert (= (and start!85626 res!664709) b!994058))

(assert (= (and b!994058 res!664708) b!994056))

(assert (= (and b!994056 res!664706) b!994059))

(assert (= (and b!994059 res!664705) b!994060))

(assert (= (and b!994060 res!664707) b!994057))

(declare-fun m!921165 () Bool)

(assert (=> b!994058 m!921165))

(declare-fun m!921167 () Bool)

(assert (=> start!85626 m!921167))

(declare-fun m!921169 () Bool)

(assert (=> b!994059 m!921169))

(declare-fun m!921171 () Bool)

(assert (=> b!994056 m!921171))

(declare-fun m!921173 () Bool)

(assert (=> b!994057 m!921173))

(push 1)

(assert (not b!994058))

(assert (not start!85626))

(assert (not b!994059))

(assert (not b!994057))

(assert (not b!994056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!42142 () Bool)

(declare-fun c!100819 () Bool)

(declare-fun call!42145 () Bool)

(assert (=> bm!42142 (= call!42145 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!100819 (Cons!21025 (select (arr!30248 a!4424) from!3778) acc!919) acc!919)))))

(declare-fun b!994091 () Bool)

(declare-fun e!561005 () Bool)

(declare-fun e!561007 () Bool)

(assert (=> b!994091 (= e!561005 e!561007)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994091 (= c!100819 (validKeyInArray!0 (select (arr!30248 a!4424) from!3778)))))

(declare-fun d!118495 () Bool)

(declare-fun res!664737 () Bool)

(declare-fun e!561006 () Bool)

(assert (=> d!118495 (=> res!664737 e!561006)))

(assert (=> d!118495 (= res!664737 (bvsge from!3778 (size!30752 a!4424)))))

(assert (=> d!118495 (= (arrayNoDuplicates!0 a!4424 from!3778 acc!919) e!561006)))

(declare-fun b!994092 () Bool)

(assert (=> b!994092 (= e!561006 e!561005)))

(declare-fun res!664736 () Bool)

(assert (=> b!994092 (=> (not res!664736) (not e!561005))))

(declare-fun e!561004 () Bool)

(assert (=> b!994092 (= res!664736 (not e!561004))))

(declare-fun res!664738 () Bool)

(assert (=> b!994092 (=> (not res!664738) (not e!561004))))

(assert (=> b!994092 (= res!664738 (validKeyInArray!0 (select (arr!30248 a!4424) from!3778)))))

(declare-fun b!994093 () Bool)

(assert (=> b!994093 (= e!561007 call!42145)))

(declare-fun b!994094 () Bool)

(assert (=> b!994094 (= e!561007 call!42145)))

(declare-fun b!994095 () Bool)

(assert (=> b!994095 (= e!561004 (contains!5828 acc!919 (select (arr!30248 a!4424) from!3778)))))

(assert (= (and d!118495 (not res!664737)) b!994092))

(assert (= (and b!994092 res!664738) b!994095))

(assert (= (and b!994092 res!664736) b!994091))

(assert (= (and b!994091 c!100819) b!994094))

(assert (= (and b!994091 (not c!100819)) b!994093))

(assert (= (or b!994094 b!994093) bm!42142))

(declare-fun m!921195 () Bool)

(assert (=> bm!42142 m!921195))

(declare-fun m!921197 () Bool)

(assert (=> bm!42142 m!921197))

(assert (=> b!994091 m!921195))

(assert (=> b!994091 m!921195))

(declare-fun m!921199 () Bool)

(assert (=> b!994091 m!921199))

(assert (=> b!994092 m!921195))

(assert (=> b!994092 m!921195))

(assert (=> b!994092 m!921199))

(assert (=> b!994095 m!921195))

(assert (=> b!994095 m!921195))

(declare-fun m!921201 () Bool)

(assert (=> b!994095 m!921201))

(assert (=> b!994057 d!118495))

(declare-fun d!118507 () Bool)

(declare-fun lt!440480 () Bool)

(declare-fun content!478 (List!21029) (Set (_ BitVec 64)))

(assert (=> d!118507 (= lt!440480 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!478 acc!919)))))

(declare-fun e!561026 () Bool)

(assert (=> d!118507 (= lt!440480 e!561026)))

(declare-fun res!664755 () Bool)

(assert (=> d!118507 (=> (not res!664755) (not e!561026))))

(assert (=> d!118507 (= res!664755 (is-Cons!21025 acc!919))))

(assert (=> d!118507 (= (contains!5828 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440480)))

(declare-fun b!994116 () Bool)

(declare-fun e!561027 () Bool)

(assert (=> b!994116 (= e!561026 e!561027)))

(declare-fun res!664756 () Bool)

(assert (=> b!994116 (=> res!664756 e!561027)))

(assert (=> b!994116 (= res!664756 (= (h!22187 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994117 () Bool)

(assert (=> b!994117 (= e!561027 (contains!5828 (t!30021 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118507 res!664755) b!994116))

(assert (= (and b!994116 (not res!664756)) b!994117))

(declare-fun m!921207 () Bool)

(assert (=> d!118507 m!921207))

(declare-fun m!921209 () Bool)

(assert (=> d!118507 m!921209))

(declare-fun m!921211 () Bool)

(assert (=> b!994117 m!921211))

(assert (=> b!994056 d!118507))

(declare-fun d!118511 () Bool)

(assert (=> d!118511 (= (array_inv!23391 a!4424) (bvsge (size!30752 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85626 d!118511))

(declare-fun d!118513 () Bool)

(declare-fun res!664770 () Bool)

(declare-fun e!561044 () Bool)

(assert (=> d!118513 (=> res!664770 e!561044)))

(assert (=> d!118513 (= res!664770 (is-Nil!21026 acc!919))))

(assert (=> d!118513 (= (noDuplicate!1461 acc!919) e!561044)))

(declare-fun b!994137 () Bool)

(declare-fun e!561045 () Bool)

(assert (=> b!994137 (= e!561044 e!561045)))

(declare-fun res!664771 () Bool)

(assert (=> b!994137 (=> (not res!664771) (not e!561045))))

(assert (=> b!994137 (= res!664771 (not (contains!5828 (t!30021 acc!919) (h!22187 acc!919))))))

(declare-fun b!994138 () Bool)

(assert (=> b!994138 (= e!561045 (noDuplicate!1461 (t!30021 acc!919)))))

(assert (= (and d!118513 (not res!664770)) b!994137))

(assert (= (and b!994137 res!664771) b!994138))

(declare-fun m!921221 () Bool)

(assert (=> b!994137 m!921221))

(declare-fun m!921223 () Bool)

(assert (=> b!994138 m!921223))

(assert (=> b!994059 d!118513))

(declare-fun d!118517 () Bool)

(declare-fun lt!440481 () Bool)

(assert (=> d!118517 (= lt!440481 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!478 acc!919)))))

(declare-fun e!561050 () Bool)

(assert (=> d!118517 (= lt!440481 e!561050)))

(declare-fun res!664775 () Bool)

(assert (=> d!118517 (=> (not res!664775) (not e!561050))))

(assert (=> d!118517 (= res!664775 (is-Cons!21025 acc!919))))

(assert (=> d!118517 (= (contains!5828 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440481)))

(declare-fun b!994144 () Bool)

(declare-fun e!561051 () Bool)

(assert (=> b!994144 (= e!561050 e!561051)))

(declare-fun res!664776 () Bool)

(assert (=> b!994144 (=> res!664776 e!561051)))

(assert (=> b!994144 (= res!664776 (= (h!22187 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!994145 () Bool)

(assert (=> b!994145 (= e!561051 (contains!5828 (t!30021 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118517 res!664775) b!994144))

(assert (= (and b!994144 (not res!664776)) b!994145))

(assert (=> d!118517 m!921207))

(declare-fun m!921225 () Bool)

(assert (=> d!118517 m!921225))

(declare-fun m!921227 () Bool)

(assert (=> b!994145 m!921227))

(assert (=> b!994058 d!118517))

(push 1)

(assert (not bm!42142))

(assert (not d!118507))

(assert (not b!994092))

(assert (not b!994145))

(assert (not d!118517))

(assert (not b!994138))

(assert (not b!994091))

(assert (not b!994117))

(assert (not b!994137))

(assert (not b!994095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

