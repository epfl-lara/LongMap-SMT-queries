; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102108 () Bool)

(assert start!102108)

(declare-fun b!1228174 () Bool)

(declare-fun res!816045 () Bool)

(declare-fun e!697517 () Bool)

(assert (=> b!1228174 (=> (not res!816045) (not e!697517))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79247 0))(
  ( (array!79248 (arr!38243 (Array (_ BitVec 32) (_ BitVec 64))) (size!38780 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79247)

(assert (=> b!1228174 (= res!816045 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38780 a!3806)) (bvslt from!3184 (size!38780 a!3806))))))

(declare-datatypes ((List!27029 0))(
  ( (Nil!27026) (Cons!27025 (h!28243 (_ BitVec 64)) (t!40484 List!27029)) )
))
(declare-fun acc!823 () List!27029)

(declare-fun b!1228175 () Bool)

(declare-fun noDuplicate!1681 (List!27029) Bool)

(assert (=> b!1228175 (= e!697517 (not (noDuplicate!1681 (Cons!27025 (select (arr!38243 a!3806) from!3184) acc!823))))))

(declare-fun b!1228176 () Bool)

(declare-fun res!816047 () Bool)

(assert (=> b!1228176 (=> (not res!816047) (not e!697517))))

(declare-fun contains!7100 (List!27029 (_ BitVec 64)) Bool)

(assert (=> b!1228176 (= res!816047 (not (contains!7100 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228177 () Bool)

(declare-fun res!816050 () Bool)

(assert (=> b!1228177 (=> (not res!816050) (not e!697517))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228177 (= res!816050 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228178 () Bool)

(declare-fun res!816042 () Bool)

(assert (=> b!1228178 (=> (not res!816042) (not e!697517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228178 (= res!816042 (validKeyInArray!0 (select (arr!38243 a!3806) from!3184)))))

(declare-fun b!1228179 () Bool)

(declare-fun res!816048 () Bool)

(assert (=> b!1228179 (=> (not res!816048) (not e!697517))))

(assert (=> b!1228179 (= res!816048 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun b!1228180 () Bool)

(declare-fun res!816043 () Bool)

(assert (=> b!1228180 (=> (not res!816043) (not e!697517))))

(declare-fun arrayNoDuplicates!0 (array!79247 (_ BitVec 32) List!27029) Bool)

(assert (=> b!1228180 (= res!816043 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228182 () Bool)

(declare-fun res!816041 () Bool)

(assert (=> b!1228182 (=> (not res!816041) (not e!697517))))

(assert (=> b!1228182 (= res!816041 (validKeyInArray!0 k0!2913))))

(declare-fun b!1228183 () Bool)

(declare-fun res!816046 () Bool)

(assert (=> b!1228183 (=> (not res!816046) (not e!697517))))

(assert (=> b!1228183 (= res!816046 (noDuplicate!1681 acc!823))))

(declare-fun res!816044 () Bool)

(assert (=> start!102108 (=> (not res!816044) (not e!697517))))

(assert (=> start!102108 (= res!816044 (bvslt (size!38780 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102108 e!697517))

(declare-fun array_inv!29181 (array!79247) Bool)

(assert (=> start!102108 (array_inv!29181 a!3806)))

(assert (=> start!102108 true))

(declare-fun b!1228181 () Bool)

(declare-fun res!816049 () Bool)

(assert (=> b!1228181 (=> (not res!816049) (not e!697517))))

(assert (=> b!1228181 (= res!816049 (not (contains!7100 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102108 res!816044) b!1228182))

(assert (= (and b!1228182 res!816041) b!1228174))

(assert (= (and b!1228174 res!816045) b!1228183))

(assert (= (and b!1228183 res!816046) b!1228181))

(assert (= (and b!1228181 res!816049) b!1228176))

(assert (= (and b!1228176 res!816047) b!1228177))

(assert (= (and b!1228177 res!816050) b!1228180))

(assert (= (and b!1228180 res!816043) b!1228178))

(assert (= (and b!1228178 res!816042) b!1228179))

(assert (= (and b!1228179 res!816048) b!1228175))

(declare-fun m!1133415 () Bool)

(assert (=> b!1228178 m!1133415))

(assert (=> b!1228178 m!1133415))

(declare-fun m!1133417 () Bool)

(assert (=> b!1228178 m!1133417))

(declare-fun m!1133419 () Bool)

(assert (=> b!1228177 m!1133419))

(assert (=> b!1228175 m!1133415))

(declare-fun m!1133421 () Bool)

(assert (=> b!1228175 m!1133421))

(declare-fun m!1133423 () Bool)

(assert (=> b!1228180 m!1133423))

(declare-fun m!1133425 () Bool)

(assert (=> b!1228176 m!1133425))

(declare-fun m!1133427 () Bool)

(assert (=> b!1228181 m!1133427))

(declare-fun m!1133429 () Bool)

(assert (=> start!102108 m!1133429))

(declare-fun m!1133431 () Bool)

(assert (=> b!1228183 m!1133431))

(declare-fun m!1133433 () Bool)

(assert (=> b!1228182 m!1133433))

(check-sat (not b!1228177) (not b!1228175) (not b!1228178) (not start!102108) (not b!1228176) (not b!1228183) (not b!1228180) (not b!1228182) (not b!1228181))
(check-sat)
(get-model)

(declare-fun b!1228254 () Bool)

(declare-fun e!697541 () Bool)

(declare-fun e!697540 () Bool)

(assert (=> b!1228254 (= e!697541 e!697540)))

(declare-fun c!120936 () Bool)

(assert (=> b!1228254 (= c!120936 (validKeyInArray!0 (select (arr!38243 a!3806) from!3184)))))

(declare-fun b!1228255 () Bool)

(declare-fun e!697538 () Bool)

(assert (=> b!1228255 (= e!697538 (contains!7100 acc!823 (select (arr!38243 a!3806) from!3184)))))

(declare-fun b!1228256 () Bool)

(declare-fun call!60858 () Bool)

(assert (=> b!1228256 (= e!697540 call!60858)))

(declare-fun b!1228257 () Bool)

(assert (=> b!1228257 (= e!697540 call!60858)))

(declare-fun bm!60855 () Bool)

(assert (=> bm!60855 (= call!60858 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120936 (Cons!27025 (select (arr!38243 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun d!134499 () Bool)

(declare-fun res!816117 () Bool)

(declare-fun e!697539 () Bool)

(assert (=> d!134499 (=> res!816117 e!697539)))

(assert (=> d!134499 (= res!816117 (bvsge from!3184 (size!38780 a!3806)))))

(assert (=> d!134499 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!697539)))

(declare-fun b!1228258 () Bool)

(assert (=> b!1228258 (= e!697539 e!697541)))

(declare-fun res!816119 () Bool)

(assert (=> b!1228258 (=> (not res!816119) (not e!697541))))

(assert (=> b!1228258 (= res!816119 (not e!697538))))

(declare-fun res!816118 () Bool)

(assert (=> b!1228258 (=> (not res!816118) (not e!697538))))

(assert (=> b!1228258 (= res!816118 (validKeyInArray!0 (select (arr!38243 a!3806) from!3184)))))

(assert (= (and d!134499 (not res!816117)) b!1228258))

(assert (= (and b!1228258 res!816118) b!1228255))

(assert (= (and b!1228258 res!816119) b!1228254))

(assert (= (and b!1228254 c!120936) b!1228256))

(assert (= (and b!1228254 (not c!120936)) b!1228257))

(assert (= (or b!1228256 b!1228257) bm!60855))

(assert (=> b!1228254 m!1133415))

(assert (=> b!1228254 m!1133415))

(assert (=> b!1228254 m!1133417))

(assert (=> b!1228255 m!1133415))

(assert (=> b!1228255 m!1133415))

(declare-fun m!1133475 () Bool)

(assert (=> b!1228255 m!1133475))

(assert (=> bm!60855 m!1133415))

(declare-fun m!1133477 () Bool)

(assert (=> bm!60855 m!1133477))

(assert (=> b!1228258 m!1133415))

(assert (=> b!1228258 m!1133415))

(assert (=> b!1228258 m!1133417))

(assert (=> b!1228180 d!134499))

(declare-fun d!134505 () Bool)

(declare-fun res!816134 () Bool)

(declare-fun e!697558 () Bool)

(assert (=> d!134505 (=> res!816134 e!697558)))

(get-info :version)

(assert (=> d!134505 (= res!816134 ((_ is Nil!27026) (Cons!27025 (select (arr!38243 a!3806) from!3184) acc!823)))))

(assert (=> d!134505 (= (noDuplicate!1681 (Cons!27025 (select (arr!38243 a!3806) from!3184) acc!823)) e!697558)))

(declare-fun b!1228277 () Bool)

(declare-fun e!697559 () Bool)

(assert (=> b!1228277 (= e!697558 e!697559)))

(declare-fun res!816135 () Bool)

(assert (=> b!1228277 (=> (not res!816135) (not e!697559))))

(assert (=> b!1228277 (= res!816135 (not (contains!7100 (t!40484 (Cons!27025 (select (arr!38243 a!3806) from!3184) acc!823)) (h!28243 (Cons!27025 (select (arr!38243 a!3806) from!3184) acc!823)))))))

(declare-fun b!1228278 () Bool)

(assert (=> b!1228278 (= e!697559 (noDuplicate!1681 (t!40484 (Cons!27025 (select (arr!38243 a!3806) from!3184) acc!823))))))

(assert (= (and d!134505 (not res!816134)) b!1228277))

(assert (= (and b!1228277 res!816135) b!1228278))

(declare-fun m!1133479 () Bool)

(assert (=> b!1228277 m!1133479))

(declare-fun m!1133481 () Bool)

(assert (=> b!1228278 m!1133481))

(assert (=> b!1228175 d!134505))

(declare-fun d!134507 () Bool)

(assert (=> d!134507 (= (array_inv!29181 a!3806) (bvsge (size!38780 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102108 d!134507))

(declare-fun d!134513 () Bool)

(declare-fun lt!559350 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!552 (List!27029) (InoxSet (_ BitVec 64)))

(assert (=> d!134513 (= lt!559350 (select (content!552 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697588 () Bool)

(assert (=> d!134513 (= lt!559350 e!697588)))

(declare-fun res!816164 () Bool)

(assert (=> d!134513 (=> (not res!816164) (not e!697588))))

(assert (=> d!134513 (= res!816164 ((_ is Cons!27025) acc!823))))

(assert (=> d!134513 (= (contains!7100 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559350)))

(declare-fun b!1228310 () Bool)

(declare-fun e!697589 () Bool)

(assert (=> b!1228310 (= e!697588 e!697589)))

(declare-fun res!816163 () Bool)

(assert (=> b!1228310 (=> res!816163 e!697589)))

(assert (=> b!1228310 (= res!816163 (= (h!28243 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228311 () Bool)

(assert (=> b!1228311 (= e!697589 (contains!7100 (t!40484 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134513 res!816164) b!1228310))

(assert (= (and b!1228310 (not res!816163)) b!1228311))

(declare-fun m!1133501 () Bool)

(assert (=> d!134513 m!1133501))

(declare-fun m!1133503 () Bool)

(assert (=> d!134513 m!1133503))

(declare-fun m!1133505 () Bool)

(assert (=> b!1228311 m!1133505))

(assert (=> b!1228181 d!134513))

(declare-fun d!134519 () Bool)

(declare-fun lt!559351 () Bool)

(assert (=> d!134519 (= lt!559351 (select (content!552 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!697592 () Bool)

(assert (=> d!134519 (= lt!559351 e!697592)))

(declare-fun res!816166 () Bool)

(assert (=> d!134519 (=> (not res!816166) (not e!697592))))

(assert (=> d!134519 (= res!816166 ((_ is Cons!27025) acc!823))))

(assert (=> d!134519 (= (contains!7100 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559351)))

(declare-fun b!1228314 () Bool)

(declare-fun e!697593 () Bool)

(assert (=> b!1228314 (= e!697592 e!697593)))

(declare-fun res!816165 () Bool)

(assert (=> b!1228314 (=> res!816165 e!697593)))

(assert (=> b!1228314 (= res!816165 (= (h!28243 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228315 () Bool)

(assert (=> b!1228315 (= e!697593 (contains!7100 (t!40484 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134519 res!816166) b!1228314))

(assert (= (and b!1228314 (not res!816165)) b!1228315))

(assert (=> d!134519 m!1133501))

(declare-fun m!1133507 () Bool)

(assert (=> d!134519 m!1133507))

(declare-fun m!1133509 () Bool)

(assert (=> b!1228315 m!1133509))

(assert (=> b!1228176 d!134519))

(declare-fun d!134521 () Bool)

(assert (=> d!134521 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228182 d!134521))

(declare-fun d!134523 () Bool)

(declare-fun res!816184 () Bool)

(declare-fun e!697612 () Bool)

(assert (=> d!134523 (=> res!816184 e!697612)))

(assert (=> d!134523 (= res!816184 (= (select (arr!38243 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134523 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!697612)))

(declare-fun b!1228335 () Bool)

(declare-fun e!697613 () Bool)

(assert (=> b!1228335 (= e!697612 e!697613)))

(declare-fun res!816185 () Bool)

(assert (=> b!1228335 (=> (not res!816185) (not e!697613))))

(assert (=> b!1228335 (= res!816185 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38780 a!3806)))))

(declare-fun b!1228336 () Bool)

(assert (=> b!1228336 (= e!697613 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134523 (not res!816184)) b!1228335))

(assert (= (and b!1228335 res!816185) b!1228336))

(declare-fun m!1133529 () Bool)

(assert (=> d!134523 m!1133529))

(declare-fun m!1133531 () Bool)

(assert (=> b!1228336 m!1133531))

(assert (=> b!1228177 d!134523))

(declare-fun d!134537 () Bool)

(declare-fun res!816186 () Bool)

(declare-fun e!697614 () Bool)

(assert (=> d!134537 (=> res!816186 e!697614)))

(assert (=> d!134537 (= res!816186 ((_ is Nil!27026) acc!823))))

(assert (=> d!134537 (= (noDuplicate!1681 acc!823) e!697614)))

(declare-fun b!1228337 () Bool)

(declare-fun e!697615 () Bool)

(assert (=> b!1228337 (= e!697614 e!697615)))

(declare-fun res!816187 () Bool)

(assert (=> b!1228337 (=> (not res!816187) (not e!697615))))

(assert (=> b!1228337 (= res!816187 (not (contains!7100 (t!40484 acc!823) (h!28243 acc!823))))))

(declare-fun b!1228338 () Bool)

(assert (=> b!1228338 (= e!697615 (noDuplicate!1681 (t!40484 acc!823)))))

(assert (= (and d!134537 (not res!816186)) b!1228337))

(assert (= (and b!1228337 res!816187) b!1228338))

(declare-fun m!1133533 () Bool)

(assert (=> b!1228337 m!1133533))

(declare-fun m!1133535 () Bool)

(assert (=> b!1228338 m!1133535))

(assert (=> b!1228183 d!134537))

(declare-fun d!134541 () Bool)

(assert (=> d!134541 (= (validKeyInArray!0 (select (arr!38243 a!3806) from!3184)) (and (not (= (select (arr!38243 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38243 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228178 d!134541))

(check-sat (not b!1228311) (not bm!60855) (not d!134513) (not b!1228336) (not b!1228338) (not b!1228277) (not b!1228254) (not b!1228315) (not b!1228337) (not b!1228258) (not b!1228278) (not d!134519) (not b!1228255))
(check-sat)
