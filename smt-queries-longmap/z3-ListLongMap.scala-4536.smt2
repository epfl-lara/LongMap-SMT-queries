; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62950 () Bool)

(assert start!62950)

(declare-fun b!709356 () Bool)

(declare-fun res!473019 () Bool)

(declare-fun e!399213 () Bool)

(assert (=> b!709356 (=> (not res!473019) (not e!399213))))

(declare-datatypes ((List!13417 0))(
  ( (Nil!13414) (Cons!13413 (h!14458 (_ BitVec 64)) (t!19705 List!13417)) )
))
(declare-fun acc!652 () List!13417)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3939 (List!13417 (_ BitVec 64)) Bool)

(assert (=> b!709356 (= res!473019 (not (contains!3939 acc!652 k0!2824)))))

(declare-fun b!709357 () Bool)

(declare-fun res!473020 () Bool)

(assert (=> b!709357 (=> (not res!473020) (not e!399213))))

(declare-datatypes ((array!40377 0))(
  ( (array!40378 (arr!19337 (Array (_ BitVec 32) (_ BitVec 64))) (size!19731 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40377)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709357 (= res!473020 (validKeyInArray!0 (select (arr!19337 a!3591) from!2969)))))

(declare-fun b!709358 () Bool)

(declare-fun e!399212 () Bool)

(assert (=> b!709358 (= e!399212 false)))

(declare-fun lt!317998 () Bool)

(declare-fun lt!317999 () List!13417)

(assert (=> b!709358 (= lt!317998 (contains!3939 lt!317999 k0!2824))))

(declare-fun b!709359 () Bool)

(declare-fun res!473026 () Bool)

(assert (=> b!709359 (=> (not res!473026) (not e!399213))))

(declare-fun noDuplicate!1208 (List!13417) Bool)

(assert (=> b!709359 (= res!473026 (noDuplicate!1208 acc!652))))

(declare-fun b!709360 () Bool)

(declare-fun res!473015 () Bool)

(assert (=> b!709360 (=> (not res!473015) (not e!399213))))

(declare-fun arrayContainsKey!0 (array!40377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709360 (= res!473015 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!709361 () Bool)

(declare-fun res!473027 () Bool)

(assert (=> b!709361 (=> (not res!473027) (not e!399213))))

(declare-fun newAcc!49 () List!13417)

(assert (=> b!709361 (= res!473027 (contains!3939 newAcc!49 k0!2824))))

(declare-fun b!709362 () Bool)

(declare-fun res!473025 () Bool)

(assert (=> b!709362 (=> (not res!473025) (not e!399212))))

(assert (=> b!709362 (= res!473025 (not (contains!3939 lt!317999 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709363 () Bool)

(declare-fun res!473033 () Bool)

(assert (=> b!709363 (=> (not res!473033) (not e!399212))))

(declare-fun $colon$colon!511 (List!13417 (_ BitVec 64)) List!13417)

(assert (=> b!709363 (= res!473033 (noDuplicate!1208 ($colon$colon!511 newAcc!49 (select (arr!19337 a!3591) from!2969))))))

(declare-fun b!709355 () Bool)

(declare-fun res!473017 () Bool)

(assert (=> b!709355 (=> (not res!473017) (not e!399213))))

(assert (=> b!709355 (= res!473017 (not (contains!3939 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!473032 () Bool)

(assert (=> start!62950 (=> (not res!473032) (not e!399213))))

(assert (=> start!62950 (= res!473032 (and (bvslt (size!19731 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19731 a!3591))))))

(assert (=> start!62950 e!399213))

(assert (=> start!62950 true))

(declare-fun array_inv!15220 (array!40377) Bool)

(assert (=> start!62950 (array_inv!15220 a!3591)))

(declare-fun b!709364 () Bool)

(declare-fun res!473029 () Bool)

(assert (=> b!709364 (=> (not res!473029) (not e!399213))))

(assert (=> b!709364 (= res!473029 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19731 a!3591)))))

(declare-fun b!709365 () Bool)

(assert (=> b!709365 (= e!399213 e!399212)))

(declare-fun res!473021 () Bool)

(assert (=> b!709365 (=> (not res!473021) (not e!399212))))

(assert (=> b!709365 (= res!473021 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!709365 (= lt!317999 ($colon$colon!511 acc!652 (select (arr!19337 a!3591) from!2969)))))

(declare-fun b!709366 () Bool)

(declare-fun res!473031 () Bool)

(assert (=> b!709366 (=> (not res!473031) (not e!399213))))

(declare-fun arrayNoDuplicates!0 (array!40377 (_ BitVec 32) List!13417) Bool)

(assert (=> b!709366 (= res!473031 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709367 () Bool)

(declare-fun res!473030 () Bool)

(assert (=> b!709367 (=> (not res!473030) (not e!399212))))

(assert (=> b!709367 (= res!473030 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709368 () Bool)

(declare-fun res!473018 () Bool)

(assert (=> b!709368 (=> (not res!473018) (not e!399213))))

(assert (=> b!709368 (= res!473018 (not (contains!3939 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709369 () Bool)

(declare-fun res!473013 () Bool)

(assert (=> b!709369 (=> (not res!473013) (not e!399213))))

(assert (=> b!709369 (= res!473013 (not (contains!3939 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709370 () Bool)

(declare-fun res!473024 () Bool)

(assert (=> b!709370 (=> (not res!473024) (not e!399213))))

(assert (=> b!709370 (= res!473024 (validKeyInArray!0 k0!2824))))

(declare-fun b!709371 () Bool)

(declare-fun res!473028 () Bool)

(assert (=> b!709371 (=> (not res!473028) (not e!399212))))

(assert (=> b!709371 (= res!473028 (not (contains!3939 lt!317999 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709372 () Bool)

(declare-fun res!473023 () Bool)

(assert (=> b!709372 (=> (not res!473023) (not e!399213))))

(declare-fun subseq!401 (List!13417 List!13417) Bool)

(assert (=> b!709372 (= res!473023 (subseq!401 acc!652 newAcc!49))))

(declare-fun b!709373 () Bool)

(declare-fun res!473014 () Bool)

(assert (=> b!709373 (=> (not res!473014) (not e!399213))))

(assert (=> b!709373 (= res!473014 (not (contains!3939 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709374 () Bool)

(declare-fun res!473034 () Bool)

(assert (=> b!709374 (=> (not res!473034) (not e!399213))))

(assert (=> b!709374 (= res!473034 (noDuplicate!1208 newAcc!49))))

(declare-fun b!709375 () Bool)

(declare-fun res!473016 () Bool)

(assert (=> b!709375 (=> (not res!473016) (not e!399212))))

(assert (=> b!709375 (= res!473016 (noDuplicate!1208 lt!317999))))

(declare-fun b!709376 () Bool)

(declare-fun res!473022 () Bool)

(assert (=> b!709376 (=> (not res!473022) (not e!399213))))

(declare-fun -!366 (List!13417 (_ BitVec 64)) List!13417)

(assert (=> b!709376 (= res!473022 (= (-!366 newAcc!49 k0!2824) acc!652))))

(assert (= (and start!62950 res!473032) b!709359))

(assert (= (and b!709359 res!473026) b!709374))

(assert (= (and b!709374 res!473034) b!709355))

(assert (= (and b!709355 res!473017) b!709369))

(assert (= (and b!709369 res!473013) b!709360))

(assert (= (and b!709360 res!473015) b!709356))

(assert (= (and b!709356 res!473019) b!709370))

(assert (= (and b!709370 res!473024) b!709366))

(assert (= (and b!709366 res!473031) b!709372))

(assert (= (and b!709372 res!473023) b!709361))

(assert (= (and b!709361 res!473027) b!709376))

(assert (= (and b!709376 res!473022) b!709368))

(assert (= (and b!709368 res!473018) b!709373))

(assert (= (and b!709373 res!473014) b!709364))

(assert (= (and b!709364 res!473029) b!709357))

(assert (= (and b!709357 res!473020) b!709365))

(assert (= (and b!709365 res!473021) b!709375))

(assert (= (and b!709375 res!473016) b!709363))

(assert (= (and b!709363 res!473033) b!709371))

(assert (= (and b!709371 res!473028) b!709362))

(assert (= (and b!709362 res!473025) b!709367))

(assert (= (and b!709367 res!473030) b!709358))

(declare-fun m!666141 () Bool)

(assert (=> b!709366 m!666141))

(declare-fun m!666143 () Bool)

(assert (=> b!709355 m!666143))

(declare-fun m!666145 () Bool)

(assert (=> b!709371 m!666145))

(declare-fun m!666147 () Bool)

(assert (=> b!709376 m!666147))

(declare-fun m!666149 () Bool)

(assert (=> b!709359 m!666149))

(declare-fun m!666151 () Bool)

(assert (=> b!709365 m!666151))

(assert (=> b!709365 m!666151))

(declare-fun m!666153 () Bool)

(assert (=> b!709365 m!666153))

(assert (=> b!709357 m!666151))

(assert (=> b!709357 m!666151))

(declare-fun m!666155 () Bool)

(assert (=> b!709357 m!666155))

(declare-fun m!666157 () Bool)

(assert (=> b!709360 m!666157))

(declare-fun m!666159 () Bool)

(assert (=> b!709362 m!666159))

(declare-fun m!666161 () Bool)

(assert (=> b!709367 m!666161))

(declare-fun m!666163 () Bool)

(assert (=> b!709370 m!666163))

(declare-fun m!666165 () Bool)

(assert (=> b!709374 m!666165))

(declare-fun m!666167 () Bool)

(assert (=> b!709361 m!666167))

(declare-fun m!666169 () Bool)

(assert (=> b!709356 m!666169))

(declare-fun m!666171 () Bool)

(assert (=> b!709372 m!666171))

(declare-fun m!666173 () Bool)

(assert (=> b!709368 m!666173))

(assert (=> b!709363 m!666151))

(assert (=> b!709363 m!666151))

(declare-fun m!666175 () Bool)

(assert (=> b!709363 m!666175))

(assert (=> b!709363 m!666175))

(declare-fun m!666177 () Bool)

(assert (=> b!709363 m!666177))

(declare-fun m!666179 () Bool)

(assert (=> b!709369 m!666179))

(declare-fun m!666181 () Bool)

(assert (=> start!62950 m!666181))

(declare-fun m!666183 () Bool)

(assert (=> b!709375 m!666183))

(declare-fun m!666185 () Bool)

(assert (=> b!709358 m!666185))

(declare-fun m!666187 () Bool)

(assert (=> b!709373 m!666187))

(check-sat (not b!709361) (not start!62950) (not b!709368) (not b!709374) (not b!709365) (not b!709369) (not b!709362) (not b!709356) (not b!709366) (not b!709376) (not b!709358) (not b!709357) (not b!709363) (not b!709367) (not b!709373) (not b!709370) (not b!709372) (not b!709360) (not b!709359) (not b!709355) (not b!709375) (not b!709371))
(check-sat)
