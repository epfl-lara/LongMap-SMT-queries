; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102280 () Bool)

(assert start!102280)

(declare-fun b!1231084 () Bool)

(declare-fun e!698339 () Bool)

(declare-datatypes ((List!27102 0))(
  ( (Nil!27099) (Cons!27098 (h!28307 (_ BitVec 64)) (t!40565 List!27102)) )
))
(declare-fun contains!7164 (List!27102 (_ BitVec 64)) Bool)

(assert (=> b!1231084 (= e!698339 (not (contains!7164 Nil!27099 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231085 () Bool)

(declare-fun e!698340 () Bool)

(assert (=> b!1231085 (= e!698340 e!698339)))

(declare-fun res!819551 () Bool)

(assert (=> b!1231085 (=> (not res!819551) (not e!698339))))

(assert (=> b!1231085 (= res!819551 (not (contains!7164 Nil!27099 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231086 () Bool)

(declare-fun res!819550 () Bool)

(declare-fun e!698338 () Bool)

(assert (=> b!1231086 (=> (not res!819550) (not e!698338))))

(declare-fun acc!823 () List!27102)

(declare-fun noDuplicate!1761 (List!27102) Bool)

(assert (=> b!1231086 (= res!819550 (noDuplicate!1761 acc!823))))

(declare-fun b!1231087 () Bool)

(declare-fun res!819555 () Bool)

(assert (=> b!1231087 (=> (not res!819555) (not e!698338))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79422 0))(
  ( (array!79423 (arr!38329 (Array (_ BitVec 32) (_ BitVec 64))) (size!38865 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79422)

(assert (=> b!1231087 (= res!819555 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38865 a!3806)) (bvslt from!3184 (size!38865 a!3806))))))

(declare-fun b!1231088 () Bool)

(declare-fun res!819547 () Bool)

(assert (=> b!1231088 (=> (not res!819547) (not e!698338))))

(declare-fun arrayNoDuplicates!0 (array!79422 (_ BitVec 32) List!27102) Bool)

(assert (=> b!1231088 (= res!819547 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!819548 () Bool)

(assert (=> start!102280 (=> (not res!819548) (not e!698338))))

(assert (=> start!102280 (= res!819548 (bvslt (size!38865 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102280 e!698338))

(declare-fun array_inv!29177 (array!79422) Bool)

(assert (=> start!102280 (array_inv!29177 a!3806)))

(assert (=> start!102280 true))

(declare-fun b!1231089 () Bool)

(declare-fun res!819552 () Bool)

(assert (=> b!1231089 (=> (not res!819552) (not e!698338))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231089 (= res!819552 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231090 () Bool)

(declare-fun res!819553 () Bool)

(assert (=> b!1231090 (=> (not res!819553) (not e!698338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231090 (= res!819553 (validKeyInArray!0 k!2913))))

(declare-fun b!1231091 () Bool)

(declare-fun res!819554 () Bool)

(assert (=> b!1231091 (=> (not res!819554) (not e!698338))))

(assert (=> b!1231091 (= res!819554 (validKeyInArray!0 (select (arr!38329 a!3806) from!3184)))))

(declare-fun b!1231092 () Bool)

(declare-fun res!819549 () Bool)

(assert (=> b!1231092 (=> (not res!819549) (not e!698338))))

(assert (=> b!1231092 (= res!819549 (not (contains!7164 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231093 () Bool)

(assert (=> b!1231093 (= e!698338 (not e!698340))))

(declare-fun res!819556 () Bool)

(assert (=> b!1231093 (=> res!819556 e!698340)))

(assert (=> b!1231093 (= res!819556 (bvsgt from!3184 (size!38865 a!3806)))))

(assert (=> b!1231093 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27098 (select (arr!38329 a!3806) from!3184) acc!823))))

(declare-fun b!1231094 () Bool)

(declare-fun res!819546 () Bool)

(assert (=> b!1231094 (=> (not res!819546) (not e!698338))))

(assert (=> b!1231094 (= res!819546 (not (contains!7164 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102280 res!819548) b!1231090))

(assert (= (and b!1231090 res!819553) b!1231087))

(assert (= (and b!1231087 res!819555) b!1231086))

(assert (= (and b!1231086 res!819550) b!1231092))

(assert (= (and b!1231092 res!819549) b!1231094))

(assert (= (and b!1231094 res!819546) b!1231089))

(assert (= (and b!1231089 res!819552) b!1231088))

(assert (= (and b!1231088 res!819547) b!1231091))

(assert (= (and b!1231091 res!819554) b!1231093))

(assert (= (and b!1231093 (not res!819556)) b!1231085))

(assert (= (and b!1231085 res!819551) b!1231084))

(declare-fun m!1135315 () Bool)

(assert (=> b!1231090 m!1135315))

(declare-fun m!1135317 () Bool)

(assert (=> b!1231089 m!1135317))

(declare-fun m!1135319 () Bool)

(assert (=> start!102280 m!1135319))

(declare-fun m!1135321 () Bool)

(assert (=> b!1231084 m!1135321))

(declare-fun m!1135323 () Bool)

(assert (=> b!1231085 m!1135323))

(declare-fun m!1135325 () Bool)

(assert (=> b!1231086 m!1135325))

(declare-fun m!1135327 () Bool)

(assert (=> b!1231088 m!1135327))

(declare-fun m!1135329 () Bool)

(assert (=> b!1231093 m!1135329))

(declare-fun m!1135331 () Bool)

(assert (=> b!1231093 m!1135331))

(declare-fun m!1135333 () Bool)

(assert (=> b!1231094 m!1135333))

(declare-fun m!1135335 () Bool)

(assert (=> b!1231092 m!1135335))

(assert (=> b!1231091 m!1135329))

(assert (=> b!1231091 m!1135329))

(declare-fun m!1135337 () Bool)

(assert (=> b!1231091 m!1135337))

(push 1)

(assert (not b!1231092))

(assert (not b!1231088))

(assert (not start!102280))

(assert (not b!1231091))

(assert (not b!1231090))

(assert (not b!1231086))

(assert (not b!1231084))

(assert (not b!1231093))

(assert (not b!1231094))

(assert (not b!1231085))

(assert (not b!1231089))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!698384 () Bool)

(declare-fun b!1231137 () Bool)

(assert (=> b!1231137 (= e!698384 (contains!7164 acc!823 (select (arr!38329 a!3806) from!3184)))))

(declare-fun d!134641 () Bool)

(declare-fun res!819597 () Bool)

(declare-fun e!698383 () Bool)

(assert (=> d!134641 (=> res!819597 e!698383)))

(assert (=> d!134641 (= res!819597 (bvsge from!3184 (size!38865 a!3806)))))

(assert (=> d!134641 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698383)))

(declare-fun b!1231138 () Bool)

(declare-fun e!698385 () Bool)

(assert (=> b!1231138 (= e!698383 e!698385)))

(declare-fun res!819599 () Bool)

(assert (=> b!1231138 (=> (not res!819599) (not e!698385))))

(assert (=> b!1231138 (= res!819599 (not e!698384))))

(declare-fun res!819598 () Bool)

(assert (=> b!1231138 (=> (not res!819598) (not e!698384))))

(assert (=> b!1231138 (= res!819598 (validKeyInArray!0 (select (arr!38329 a!3806) from!3184)))))

(declare-fun b!1231139 () Bool)

(declare-fun e!698386 () Bool)

(assert (=> b!1231139 (= e!698385 e!698386)))

(declare-fun c!120631 () Bool)

(assert (=> b!1231139 (= c!120631 (validKeyInArray!0 (select (arr!38329 a!3806) from!3184)))))

(declare-fun b!1231140 () Bool)

(declare-fun call!60868 () Bool)

(assert (=> b!1231140 (= e!698386 call!60868)))

(declare-fun bm!60865 () Bool)

(assert (=> bm!60865 (= call!60868 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120631 (Cons!27098 (select (arr!38329 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1231141 () Bool)

(assert (=> b!1231141 (= e!698386 call!60868)))

(assert (= (and d!134641 (not res!819597)) b!1231138))

(assert (= (and b!1231138 res!819598) b!1231137))

(assert (= (and b!1231138 res!819599) b!1231139))

(assert (= (and b!1231139 c!120631) b!1231140))

(assert (= (and b!1231139 (not c!120631)) b!1231141))

(assert (= (or b!1231140 b!1231141) bm!60865))

(assert (=> b!1231137 m!1135329))

(assert (=> b!1231137 m!1135329))

(declare-fun m!1135369 () Bool)

(assert (=> b!1231137 m!1135369))

(assert (=> b!1231138 m!1135329))

(assert (=> b!1231138 m!1135329))

(assert (=> b!1231138 m!1135337))

(assert (=> b!1231139 m!1135329))

(assert (=> b!1231139 m!1135329))

(assert (=> b!1231139 m!1135337))

(assert (=> bm!60865 m!1135329))

(declare-fun m!1135371 () Bool)

(assert (=> bm!60865 m!1135371))

(assert (=> b!1231088 d!134641))

(declare-fun e!698390 () Bool)

(declare-fun b!1231148 () Bool)

(assert (=> b!1231148 (= e!698390 (contains!7164 (Cons!27098 (select (arr!38329 a!3806) from!3184) acc!823) (select (arr!38329 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134653 () Bool)

(declare-fun res!819600 () Bool)

(declare-fun e!698389 () Bool)

(assert (=> d!134653 (=> res!819600 e!698389)))

(assert (=> d!134653 (= res!819600 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38865 a!3806)))))

(assert (=> d!134653 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27098 (select (arr!38329 a!3806) from!3184) acc!823)) e!698389)))

(declare-fun b!1231149 () Bool)

(declare-fun e!698391 () Bool)

(assert (=> b!1231149 (= e!698389 e!698391)))

(declare-fun res!819602 () Bool)

(assert (=> b!1231149 (=> (not res!819602) (not e!698391))))

(assert (=> b!1231149 (= res!819602 (not e!698390))))

(declare-fun res!819601 () Bool)

(assert (=> b!1231149 (=> (not res!819601) (not e!698390))))

(assert (=> b!1231149 (= res!819601 (validKeyInArray!0 (select (arr!38329 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231150 () Bool)

(declare-fun e!698392 () Bool)

(assert (=> b!1231150 (= e!698391 e!698392)))

(declare-fun c!120634 () Bool)

(assert (=> b!1231150 (= c!120634 (validKeyInArray!0 (select (arr!38329 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231151 () Bool)

(declare-fun call!60871 () Bool)

(assert (=> b!1231151 (= e!698392 call!60871)))

(declare-fun bm!60868 () Bool)

(assert (=> bm!60868 (= call!60871 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120634 (Cons!27098 (select (arr!38329 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27098 (select (arr!38329 a!3806) from!3184) acc!823)) (Cons!27098 (select (arr!38329 a!3806) from!3184) acc!823))))))

(declare-fun b!1231152 () Bool)

(assert (=> b!1231152 (= e!698392 call!60871)))

(assert (= (and d!134653 (not res!819600)) b!1231149))

(assert (= (and b!1231149 res!819601) b!1231148))

(assert (= (and b!1231149 res!819602) b!1231150))

(assert (= (and b!1231150 c!120634) b!1231151))

(assert (= (and b!1231150 (not c!120634)) b!1231152))

(assert (= (or b!1231151 b!1231152) bm!60868))

(declare-fun m!1135373 () Bool)

(assert (=> b!1231148 m!1135373))

(assert (=> b!1231148 m!1135373))

(declare-fun m!1135375 () Bool)

(assert (=> b!1231148 m!1135375))

(assert (=> b!1231149 m!1135373))

(assert (=> b!1231149 m!1135373))

(declare-fun m!1135377 () Bool)

(assert (=> b!1231149 m!1135377))

(assert (=> b!1231150 m!1135373))

(assert (=> b!1231150 m!1135373))

(assert (=> b!1231150 m!1135377))

(assert (=> bm!60868 m!1135373))

(declare-fun m!1135379 () Bool)

(assert (=> bm!60868 m!1135379))

(assert (=> b!1231093 d!134653))

(declare-fun d!134655 () Bool)

(declare-fun lt!559393 () Bool)

(declare-fun content!562 (List!27102) (Set (_ BitVec 64)))

(assert (=> d!134655 (= lt!559393 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!562 Nil!27099)))))

(declare-fun e!698415 () Bool)

(assert (=> d!134655 (= lt!559393 e!698415)))

(declare-fun res!819622 () Bool)

(assert (=> d!134655 (=> (not res!819622) (not e!698415))))

(assert (=> d!134655 (= res!819622 (is-Cons!27098 Nil!27099))))

(assert (=> d!134655 (= (contains!7164 Nil!27099 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559393)))

(declare-fun b!1231179 () Bool)

(declare-fun e!698416 () Bool)

(assert (=> b!1231179 (= e!698415 e!698416)))

(declare-fun res!819621 () Bool)

(assert (=> b!1231179 (=> res!819621 e!698416)))

(assert (=> b!1231179 (= res!819621 (= (h!28307 Nil!27099) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231180 () Bool)

(assert (=> b!1231180 (= e!698416 (contains!7164 (t!40565 Nil!27099) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134655 res!819622) b!1231179))

(assert (= (and b!1231179 (not res!819621)) b!1231180))

(declare-fun m!1135389 () Bool)

(assert (=> d!134655 m!1135389))

(declare-fun m!1135391 () Bool)

(assert (=> d!134655 m!1135391))

(declare-fun m!1135393 () Bool)

(assert (=> b!1231180 m!1135393))

(assert (=> b!1231084 d!134655))

(declare-fun d!134659 () Bool)

(declare-fun res!819638 () Bool)

(declare-fun e!698433 () Bool)

(assert (=> d!134659 (=> res!819638 e!698433)))

(assert (=> d!134659 (= res!819638 (= (select (arr!38329 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134659 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698433)))

(declare-fun b!1231198 () Bool)

(declare-fun e!698434 () Bool)

(assert (=> b!1231198 (= e!698433 e!698434)))

(declare-fun res!819639 () Bool)

(assert (=> b!1231198 (=> (not res!819639) (not e!698434))))

(assert (=> b!1231198 (= res!819639 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38865 a!3806)))))

(declare-fun b!1231199 () Bool)

(assert (=> b!1231199 (= e!698434 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134659 (not res!819638)) b!1231198))

