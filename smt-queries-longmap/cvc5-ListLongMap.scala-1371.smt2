; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26970 () Bool)

(assert start!26970)

(declare-fun b!279246 () Bool)

(declare-fun res!142500 () Bool)

(declare-fun e!178040 () Bool)

(assert (=> b!279246 (=> (not res!142500) (not e!178040))))

(declare-datatypes ((List!4398 0))(
  ( (Nil!4395) (Cons!4394 (h!5064 (_ BitVec 64)) (t!9480 List!4398)) )
))
(declare-fun noDuplicate!152 (List!4398) Bool)

(assert (=> b!279246 (= res!142500 (noDuplicate!152 Nil!4395))))

(declare-fun b!279247 () Bool)

(declare-fun res!142503 () Bool)

(assert (=> b!279247 (=> (not res!142503) (not e!178040))))

(declare-datatypes ((array!13890 0))(
  ( (array!13891 (arr!6590 (Array (_ BitVec 32) (_ BitVec 64))) (size!6942 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13890)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279247 (= res!142503 (validKeyInArray!0 (select (arr!6590 a!3325) startIndex!26)))))

(declare-fun b!279248 () Bool)

(declare-fun res!142504 () Bool)

(assert (=> b!279248 (=> (not res!142504) (not e!178040))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13890 (_ BitVec 32)) Bool)

(assert (=> b!279248 (= res!142504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279249 () Bool)

(declare-fun res!142498 () Bool)

(declare-fun e!178042 () Bool)

(assert (=> b!279249 (=> (not res!142498) (not e!178042))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279249 (= res!142498 (and (= (size!6942 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6942 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6942 a!3325))))))

(declare-fun b!279250 () Bool)

(declare-fun res!142501 () Bool)

(assert (=> b!279250 (=> (not res!142501) (not e!178042))))

(declare-fun arrayNoDuplicates!0 (array!13890 (_ BitVec 32) List!4398) Bool)

(assert (=> b!279250 (= res!142501 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4395))))

(declare-fun b!279251 () Bool)

(declare-fun res!142496 () Bool)

(assert (=> b!279251 (=> (not res!142496) (not e!178040))))

(assert (=> b!279251 (= res!142496 (and (bvslt (size!6942 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6942 a!3325))))))

(declare-fun b!279252 () Bool)

(declare-fun res!142502 () Bool)

(assert (=> b!279252 (=> (not res!142502) (not e!178042))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!279252 (= res!142502 (validKeyInArray!0 k!2581))))

(declare-fun b!279254 () Bool)

(declare-fun e!178041 () Bool)

(declare-fun contains!1970 (List!4398 (_ BitVec 64)) Bool)

(assert (=> b!279254 (= e!178041 (contains!1970 Nil!4395 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279255 () Bool)

(declare-fun res!142495 () Bool)

(assert (=> b!279255 (=> (not res!142495) (not e!178040))))

(assert (=> b!279255 (= res!142495 (not (= startIndex!26 i!1267)))))

(declare-fun b!279256 () Bool)

(assert (=> b!279256 (= e!178042 e!178040)))

(declare-fun res!142505 () Bool)

(assert (=> b!279256 (=> (not res!142505) (not e!178040))))

(declare-datatypes ((SeekEntryResult!1748 0))(
  ( (MissingZero!1748 (index!9162 (_ BitVec 32))) (Found!1748 (index!9163 (_ BitVec 32))) (Intermediate!1748 (undefined!2560 Bool) (index!9164 (_ BitVec 32)) (x!27410 (_ BitVec 32))) (Undefined!1748) (MissingVacant!1748 (index!9165 (_ BitVec 32))) )
))
(declare-fun lt!138583 () SeekEntryResult!1748)

(assert (=> b!279256 (= res!142505 (or (= lt!138583 (MissingZero!1748 i!1267)) (= lt!138583 (MissingVacant!1748 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13890 (_ BitVec 32)) SeekEntryResult!1748)

(assert (=> b!279256 (= lt!138583 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!279257 () Bool)

(declare-fun res!142499 () Bool)

(assert (=> b!279257 (=> (not res!142499) (not e!178042))))

(declare-fun arrayContainsKey!0 (array!13890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279257 (= res!142499 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!142497 () Bool)

(assert (=> start!26970 (=> (not res!142497) (not e!178042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26970 (= res!142497 (validMask!0 mask!3868))))

(assert (=> start!26970 e!178042))

(declare-fun array_inv!4553 (array!13890) Bool)

(assert (=> start!26970 (array_inv!4553 a!3325)))

(assert (=> start!26970 true))

(declare-fun b!279253 () Bool)

(assert (=> b!279253 (= e!178040 e!178041)))

(declare-fun res!142506 () Bool)

(assert (=> b!279253 (=> res!142506 e!178041)))

(assert (=> b!279253 (= res!142506 (contains!1970 Nil!4395 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!26970 res!142497) b!279249))

(assert (= (and b!279249 res!142498) b!279252))

(assert (= (and b!279252 res!142502) b!279250))

(assert (= (and b!279250 res!142501) b!279257))

(assert (= (and b!279257 res!142499) b!279256))

(assert (= (and b!279256 res!142505) b!279248))

(assert (= (and b!279248 res!142504) b!279255))

(assert (= (and b!279255 res!142495) b!279247))

(assert (= (and b!279247 res!142503) b!279251))

(assert (= (and b!279251 res!142496) b!279246))

(assert (= (and b!279246 res!142500) b!279253))

(assert (= (and b!279253 (not res!142506)) b!279254))

(declare-fun m!294051 () Bool)

(assert (=> b!279247 m!294051))

(assert (=> b!279247 m!294051))

(declare-fun m!294053 () Bool)

(assert (=> b!279247 m!294053))

(declare-fun m!294055 () Bool)

(assert (=> b!279257 m!294055))

(declare-fun m!294057 () Bool)

(assert (=> b!279252 m!294057))

(declare-fun m!294059 () Bool)

(assert (=> b!279256 m!294059))

(declare-fun m!294061 () Bool)

(assert (=> b!279246 m!294061))

(declare-fun m!294063 () Bool)

(assert (=> b!279253 m!294063))

(declare-fun m!294065 () Bool)

(assert (=> b!279254 m!294065))

(declare-fun m!294067 () Bool)

(assert (=> b!279248 m!294067))

(declare-fun m!294069 () Bool)

(assert (=> start!26970 m!294069))

(declare-fun m!294071 () Bool)

(assert (=> start!26970 m!294071))

(declare-fun m!294073 () Bool)

(assert (=> b!279250 m!294073))

(push 1)

(assert (not b!279253))

(assert (not b!279250))

(assert (not start!26970))

(assert (not b!279254))

(assert (not b!279246))

(assert (not b!279248))

(assert (not b!279247))

(assert (not b!279256))

(assert (not b!279257))

(assert (not b!279252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!279352 () Bool)

(declare-fun e!178083 () Bool)

(declare-fun e!178084 () Bool)

(assert (=> b!279352 (= e!178083 e!178084)))

(declare-fun c!45936 () Bool)

(assert (=> b!279352 (= c!45936 (validKeyInArray!0 (select (arr!6590 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279353 () Bool)

(declare-fun e!178082 () Bool)

(assert (=> b!279353 (= e!178082 e!178083)))

(declare-fun res!142585 () Bool)

(assert (=> b!279353 (=> (not res!142585) (not e!178083))))

(declare-fun e!178085 () Bool)

(assert (=> b!279353 (= res!142585 (not e!178085))))

(declare-fun res!142586 () Bool)

(assert (=> b!279353 (=> (not res!142586) (not e!178085))))

(assert (=> b!279353 (= res!142586 (validKeyInArray!0 (select (arr!6590 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65041 () Bool)

(declare-fun res!142587 () Bool)

(assert (=> d!65041 (=> res!142587 e!178082)))

(assert (=> d!65041 (= res!142587 (bvsge #b00000000000000000000000000000000 (size!6942 a!3325)))))

(assert (=> d!65041 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4395) e!178082)))

(declare-fun bm!25423 () Bool)

(declare-fun call!25426 () Bool)

(assert (=> bm!25423 (= call!25426 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45936 (Cons!4394 (select (arr!6590 a!3325) #b00000000000000000000000000000000) Nil!4395) Nil!4395)))))

(declare-fun b!279354 () Bool)

(assert (=> b!279354 (= e!178084 call!25426)))

(declare-fun b!279355 () Bool)

(assert (=> b!279355 (= e!178084 call!25426)))

(declare-fun b!279356 () Bool)

(assert (=> b!279356 (= e!178085 (contains!1970 Nil!4395 (select (arr!6590 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65041 (not res!142587)) b!279353))

(assert (= (and b!279353 res!142586) b!279356))

(assert (= (and b!279353 res!142585) b!279352))

(assert (= (and b!279352 c!45936) b!279354))

(assert (= (and b!279352 (not c!45936)) b!279355))

(assert (= (or b!279354 b!279355) bm!25423))

(declare-fun m!294123 () Bool)

(assert (=> b!279352 m!294123))

(assert (=> b!279352 m!294123))

(declare-fun m!294125 () Bool)

(assert (=> b!279352 m!294125))

(assert (=> b!279353 m!294123))

(assert (=> b!279353 m!294123))

(assert (=> b!279353 m!294125))

(assert (=> bm!25423 m!294123))

(declare-fun m!294127 () Bool)

(assert (=> bm!25423 m!294127))

(assert (=> b!279356 m!294123))

(assert (=> b!279356 m!294123))

(declare-fun m!294129 () Bool)

(assert (=> b!279356 m!294129))

(assert (=> b!279250 d!65041))

(declare-fun d!65045 () Bool)

(declare-fun lt!138610 () Bool)

(declare-fun content!187 (List!4398) (Set (_ BitVec 64)))

(assert (=> d!65045 (= lt!138610 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!187 Nil!4395)))))

(declare-fun e!178102 () Bool)

(assert (=> d!65045 (= lt!138610 e!178102)))

(declare-fun res!142599 () Bool)

(assert (=> d!65045 (=> (not res!142599) (not e!178102))))

(assert (=> d!65045 (= res!142599 (is-Cons!4394 Nil!4395))))

(assert (=> d!65045 (= (contains!1970 Nil!4395 #b1000000000000000000000000000000000000000000000000000000000000000) lt!138610)))

(declare-fun b!279379 () Bool)

(declare-fun e!178103 () Bool)

(assert (=> b!279379 (= e!178102 e!178103)))

(declare-fun res!142598 () Bool)

(assert (=> b!279379 (=> res!142598 e!178103)))

(assert (=> b!279379 (= res!142598 (= (h!5064 Nil!4395) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279380 () Bool)

(assert (=> b!279380 (= e!178103 (contains!1970 (t!9480 Nil!4395) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65045 res!142599) b!279379))

(assert (= (and b!279379 (not res!142598)) b!279380))

(declare-fun m!294157 () Bool)

(assert (=> d!65045 m!294157))

(declare-fun m!294159 () Bool)

(assert (=> d!65045 m!294159))

(declare-fun m!294161 () Bool)

(assert (=> b!279380 m!294161))

(assert (=> b!279254 d!65045))

(declare-fun b!279401 () Bool)

(declare-fun e!178121 () Bool)

(declare-fun e!178122 () Bool)

(assert (=> b!279401 (= e!178121 e!178122)))

(declare-fun lt!138626 () (_ BitVec 64))

(assert (=> b!279401 (= lt!138626 (select (arr!6590 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8816 0))(
  ( (Unit!8817) )
))
(declare-fun lt!138625 () Unit!8816)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13890 (_ BitVec 64) (_ BitVec 32)) Unit!8816)

(assert (=> b!279401 (= lt!138625 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138626 #b00000000000000000000000000000000))))

(assert (=> b!279401 (arrayContainsKey!0 a!3325 lt!138626 #b00000000000000000000000000000000)))

(declare-fun lt!138621 () Unit!8816)

(assert (=> b!279401 (= lt!138621 lt!138625)))

(declare-fun res!142613 () Bool)

(assert (=> b!279401 (= res!142613 (= (seekEntryOrOpen!0 (select (arr!6590 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1748 #b00000000000000000000000000000000)))))

(assert (=> b!279401 (=> (not res!142613) (not e!178122))))

(declare-fun b!279402 () Bool)

(declare-fun call!25432 () Bool)

(assert (=> b!279402 (= e!178121 call!25432)))

(declare-fun bm!25429 () Bool)

(assert (=> bm!25429 (= call!25432 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65051 () Bool)

(declare-fun res!142612 () Bool)

(declare-fun e!178120 () Bool)

(assert (=> d!65051 (=> res!142612 e!178120)))

(assert (=> d!65051 (= res!142612 (bvsge #b00000000000000000000000000000000 (size!6942 a!3325)))))

(assert (=> d!65051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!178120)))

(declare-fun b!279403 () Bool)

(assert (=> b!279403 (= e!178120 e!178121)))

(declare-fun c!45947 () Bool)

(assert (=> b!279403 (= c!45947 (validKeyInArray!0 (select (arr!6590 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279404 () Bool)

(assert (=> b!279404 (= e!178122 call!25432)))

(assert (= (and d!65051 (not res!142612)) b!279403))

(assert (= (and b!279403 c!45947) b!279401))

(assert (= (and b!279403 (not c!45947)) b!279402))

(assert (= (and b!279401 res!142613) b!279404))

(assert (= (or b!279404 b!279402) bm!25429))

(assert (=> b!279401 m!294123))

(declare-fun m!294169 () Bool)

(assert (=> b!279401 m!294169))

(declare-fun m!294171 () Bool)

(assert (=> b!279401 m!294171))

(assert (=> b!279401 m!294123))

(declare-fun m!294173 () Bool)

(assert (=> b!279401 m!294173))

(declare-fun m!294175 () Bool)

(assert (=> bm!25429 m!294175))

(assert (=> b!279403 m!294123))

(assert (=> b!279403 m!294123))

(assert (=> b!279403 m!294125))

(assert (=> b!279248 d!65051))

(declare-fun d!65055 () Bool)

(declare-fun lt!138629 () Bool)

(assert (=> d!65055 (= lt!138629 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!187 Nil!4395)))))

(declare-fun e!178125 () Bool)

(assert (=> d!65055 (= lt!138629 e!178125)))

(declare-fun res!142617 () Bool)

(assert (=> d!65055 (=> (not res!142617) (not e!178125))))

(assert (=> d!65055 (= res!142617 (is-Cons!4394 Nil!4395))))

(assert (=> d!65055 (= (contains!1970 Nil!4395 #b0000000000000000000000000000000000000000000000000000000000000000) lt!138629)))

(declare-fun b!279407 () Bool)

(declare-fun e!178126 () Bool)

(assert (=> b!279407 (= e!178125 e!178126)))

(declare-fun res!142616 () Bool)

(assert (=> b!279407 (=> res!142616 e!178126)))

(assert (=> b!279407 (= res!142616 (= (h!5064 Nil!4395) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279408 () Bool)

(assert (=> b!279408 (= e!178126 (contains!1970 (t!9480 Nil!4395) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65055 res!142617) b!279407))

(assert (= (and b!279407 (not res!142616)) b!279408))

(assert (=> d!65055 m!294157))

(declare-fun m!294177 () Bool)

(assert (=> d!65055 m!294177))

(declare-fun m!294179 () Bool)

(assert (=> b!279408 m!294179))

(assert (=> b!279253 d!65055))

(declare-fun d!65057 () Bool)

(assert (=> d!65057 (= (validKeyInArray!0 (select (arr!6590 a!3325) startIndex!26)) (and (not (= (select (arr!6590 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6590 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279247 d!65057))

(declare-fun d!65059 () Bool)

(assert (=> d!65059 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

