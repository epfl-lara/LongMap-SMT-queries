; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62190 () Bool)

(assert start!62190)

(declare-fun b!696332 () Bool)

(declare-fun res!460414 () Bool)

(declare-fun e!395938 () Bool)

(assert (=> b!696332 (=> (not res!460414) (not e!395938))))

(declare-datatypes ((array!39958 0))(
  ( (array!39959 (arr!19138 (Array (_ BitVec 32) (_ BitVec 64))) (size!19520 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39958)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696332 (= res!460414 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696333 () Bool)

(declare-fun res!460415 () Bool)

(assert (=> b!696333 (=> (not res!460415) (not e!395938))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13218 0))(
  ( (Nil!13215) (Cons!13214 (h!14259 (_ BitVec 64)) (t!19491 List!13218)) )
))
(declare-fun acc!681 () List!13218)

(declare-fun arrayNoDuplicates!0 (array!39958 (_ BitVec 32) List!13218) Bool)

(assert (=> b!696333 (= res!460415 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!460418 () Bool)

(assert (=> start!62190 (=> (not res!460418) (not e!395938))))

(assert (=> start!62190 (= res!460418 (and (bvslt (size!19520 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19520 a!3626))))))

(assert (=> start!62190 e!395938))

(assert (=> start!62190 true))

(declare-fun array_inv!15021 (array!39958) Bool)

(assert (=> start!62190 (array_inv!15021 a!3626)))

(declare-fun b!696334 () Bool)

(declare-fun e!395942 () Bool)

(declare-fun contains!3740 (List!13218 (_ BitVec 64)) Bool)

(assert (=> b!696334 (= e!395942 (contains!3740 acc!681 k!2843))))

(declare-fun b!696335 () Bool)

(declare-fun e!395944 () Bool)

(assert (=> b!696335 (= e!395944 (contains!3740 acc!681 k!2843))))

(declare-fun b!696336 () Bool)

(declare-fun res!460424 () Bool)

(assert (=> b!696336 (=> (not res!460424) (not e!395938))))

(assert (=> b!696336 (= res!460424 (not (contains!3740 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696337 () Bool)

(declare-fun res!460411 () Bool)

(assert (=> b!696337 (=> (not res!460411) (not e!395938))))

(assert (=> b!696337 (= res!460411 (not (contains!3740 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696338 () Bool)

(declare-fun res!460426 () Bool)

(assert (=> b!696338 (=> (not res!460426) (not e!395938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696338 (= res!460426 (not (validKeyInArray!0 (select (arr!19138 a!3626) from!3004))))))

(declare-fun b!696339 () Bool)

(assert (=> b!696339 (= e!395938 false)))

(declare-fun lt!316863 () Bool)

(assert (=> b!696339 (= lt!316863 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!696340 () Bool)

(declare-fun res!460410 () Bool)

(assert (=> b!696340 (=> (not res!460410) (not e!395938))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696340 (= res!460410 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19520 a!3626))))))

(declare-fun b!696341 () Bool)

(declare-fun e!395945 () Bool)

(declare-fun e!395939 () Bool)

(assert (=> b!696341 (= e!395945 e!395939)))

(declare-fun res!460423 () Bool)

(assert (=> b!696341 (=> (not res!460423) (not e!395939))))

(assert (=> b!696341 (= res!460423 (bvsle from!3004 i!1382))))

(declare-fun b!696342 () Bool)

(declare-fun res!460412 () Bool)

(assert (=> b!696342 (=> (not res!460412) (not e!395938))))

(assert (=> b!696342 (= res!460412 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696343 () Bool)

(declare-fun res!460416 () Bool)

(assert (=> b!696343 (=> (not res!460416) (not e!395938))))

(assert (=> b!696343 (= res!460416 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13215))))

(declare-fun b!696344 () Bool)

(declare-fun res!460413 () Bool)

(assert (=> b!696344 (=> (not res!460413) (not e!395938))))

(declare-fun e!395941 () Bool)

(assert (=> b!696344 (= res!460413 e!395941)))

(declare-fun res!460425 () Bool)

(assert (=> b!696344 (=> res!460425 e!395941)))

(assert (=> b!696344 (= res!460425 e!395944)))

(declare-fun res!460428 () Bool)

(assert (=> b!696344 (=> (not res!460428) (not e!395944))))

(assert (=> b!696344 (= res!460428 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696345 () Bool)

(declare-fun res!460422 () Bool)

(assert (=> b!696345 (=> (not res!460422) (not e!395938))))

(declare-fun noDuplicate!1009 (List!13218) Bool)

(assert (=> b!696345 (= res!460422 (noDuplicate!1009 acc!681))))

(declare-fun b!696346 () Bool)

(assert (=> b!696346 (= e!395939 (not (contains!3740 acc!681 k!2843)))))

(declare-fun b!696347 () Bool)

(declare-fun res!460421 () Bool)

(assert (=> b!696347 (=> (not res!460421) (not e!395938))))

(assert (=> b!696347 (= res!460421 e!395945)))

(declare-fun res!460417 () Bool)

(assert (=> b!696347 (=> res!460417 e!395945)))

(assert (=> b!696347 (= res!460417 e!395942)))

(declare-fun res!460420 () Bool)

(assert (=> b!696347 (=> (not res!460420) (not e!395942))))

(assert (=> b!696347 (= res!460420 (bvsgt from!3004 i!1382))))

(declare-fun b!696348 () Bool)

(declare-fun e!395940 () Bool)

(assert (=> b!696348 (= e!395941 e!395940)))

(declare-fun res!460427 () Bool)

(assert (=> b!696348 (=> (not res!460427) (not e!395940))))

(assert (=> b!696348 (= res!460427 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696349 () Bool)

(declare-fun res!460419 () Bool)

(assert (=> b!696349 (=> (not res!460419) (not e!395938))))

(assert (=> b!696349 (= res!460419 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19520 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696350 () Bool)

(assert (=> b!696350 (= e!395940 (not (contains!3740 acc!681 k!2843)))))

(declare-fun b!696351 () Bool)

(declare-fun res!460429 () Bool)

(assert (=> b!696351 (=> (not res!460429) (not e!395938))))

(assert (=> b!696351 (= res!460429 (validKeyInArray!0 k!2843))))

(assert (= (and start!62190 res!460418) b!696345))

(assert (= (and b!696345 res!460422) b!696336))

(assert (= (and b!696336 res!460424) b!696337))

(assert (= (and b!696337 res!460411) b!696347))

(assert (= (and b!696347 res!460420) b!696334))

(assert (= (and b!696347 (not res!460417)) b!696341))

(assert (= (and b!696341 res!460423) b!696346))

(assert (= (and b!696347 res!460421) b!696343))

(assert (= (and b!696343 res!460416) b!696333))

(assert (= (and b!696333 res!460415) b!696340))

(assert (= (and b!696340 res!460410) b!696351))

(assert (= (and b!696351 res!460429) b!696332))

(assert (= (and b!696332 res!460414) b!696349))

(assert (= (and b!696349 res!460419) b!696338))

(assert (= (and b!696338 res!460426) b!696342))

(assert (= (and b!696342 res!460412) b!696344))

(assert (= (and b!696344 res!460428) b!696335))

(assert (= (and b!696344 (not res!460425)) b!696348))

(assert (= (and b!696348 res!460427) b!696350))

(assert (= (and b!696344 res!460413) b!696339))

(declare-fun m!656733 () Bool)

(assert (=> b!696343 m!656733))

(declare-fun m!656735 () Bool)

(assert (=> b!696333 m!656735))

(declare-fun m!656737 () Bool)

(assert (=> b!696332 m!656737))

(declare-fun m!656739 () Bool)

(assert (=> b!696334 m!656739))

(assert (=> b!696350 m!656739))

(assert (=> b!696346 m!656739))

(declare-fun m!656741 () Bool)

(assert (=> b!696345 m!656741))

(declare-fun m!656743 () Bool)

(assert (=> b!696351 m!656743))

(declare-fun m!656745 () Bool)

(assert (=> b!696337 m!656745))

(declare-fun m!656747 () Bool)

(assert (=> b!696336 m!656747))

(assert (=> b!696335 m!656739))

(declare-fun m!656749 () Bool)

(assert (=> b!696339 m!656749))

(declare-fun m!656751 () Bool)

(assert (=> b!696338 m!656751))

(assert (=> b!696338 m!656751))

(declare-fun m!656753 () Bool)

(assert (=> b!696338 m!656753))

(declare-fun m!656755 () Bool)

(assert (=> start!62190 m!656755))

(push 1)

(assert (not b!696343))

(assert (not b!696350))

(assert (not b!696333))

(assert (not b!696339))

(assert (not b!696338))

(assert (not b!696336))

(assert (not b!696335))

(assert (not b!696332))

(assert (not b!696337))

(assert (not b!696351))

(assert (not b!696346))

(assert (not b!696334))

(assert (not start!62190))

(assert (not b!696345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

