; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62526 () Bool)

(assert start!62526)

(declare-fun b!704404 () Bool)

(declare-fun res!468220 () Bool)

(declare-fun e!397716 () Bool)

(assert (=> b!704404 (=> (not res!468220) (not e!397716))))

(declare-datatypes ((List!13300 0))(
  ( (Nil!13297) (Cons!13296 (h!14341 (_ BitVec 64)) (t!19582 List!13300)) )
))
(declare-fun acc!652 () List!13300)

(declare-fun noDuplicate!1124 (List!13300) Bool)

(assert (=> b!704404 (= res!468220 (noDuplicate!1124 acc!652))))

(declare-fun b!704405 () Bool)

(declare-fun res!468222 () Bool)

(assert (=> b!704405 (=> (not res!468222) (not e!397716))))

(declare-fun newAcc!49 () List!13300)

(declare-fun contains!3877 (List!13300 (_ BitVec 64)) Bool)

(assert (=> b!704405 (= res!468222 (not (contains!3877 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704406 () Bool)

(declare-fun res!468223 () Bool)

(assert (=> b!704406 (=> (not res!468223) (not e!397716))))

(assert (=> b!704406 (= res!468223 (not (contains!3877 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704407 () Bool)

(declare-fun res!468221 () Bool)

(assert (=> b!704407 (=> (not res!468221) (not e!397716))))

(declare-datatypes ((array!40205 0))(
  ( (array!40206 (arr!19259 (Array (_ BitVec 32) (_ BitVec 64))) (size!19644 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40205)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704407 (= res!468221 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704408 () Bool)

(declare-fun res!468228 () Bool)

(assert (=> b!704408 (=> (not res!468228) (not e!397716))))

(declare-fun subseq!322 (List!13300 List!13300) Bool)

(assert (=> b!704408 (= res!468228 (subseq!322 acc!652 newAcc!49))))

(declare-fun res!468215 () Bool)

(assert (=> start!62526 (=> (not res!468215) (not e!397716))))

(assert (=> start!62526 (= res!468215 (and (bvslt (size!19644 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19644 a!3591))))))

(assert (=> start!62526 e!397716))

(assert (=> start!62526 true))

(declare-fun array_inv!15055 (array!40205) Bool)

(assert (=> start!62526 (array_inv!15055 a!3591)))

(declare-fun b!704409 () Bool)

(declare-fun res!468226 () Bool)

(assert (=> b!704409 (=> (not res!468226) (not e!397716))))

(declare-fun arrayNoDuplicates!0 (array!40205 (_ BitVec 32) List!13300) Bool)

(assert (=> b!704409 (= res!468226 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704410 () Bool)

(declare-fun res!468230 () Bool)

(assert (=> b!704410 (=> (not res!468230) (not e!397716))))

(assert (=> b!704410 (= res!468230 (not (contains!3877 acc!652 k!2824)))))

(declare-fun b!704411 () Bool)

(declare-fun res!468224 () Bool)

(assert (=> b!704411 (=> (not res!468224) (not e!397716))))

(declare-fun -!287 (List!13300 (_ BitVec 64)) List!13300)

(assert (=> b!704411 (= res!468224 (= (-!287 newAcc!49 k!2824) acc!652))))

(declare-fun b!704412 () Bool)

(declare-fun res!468225 () Bool)

(assert (=> b!704412 (=> (not res!468225) (not e!397716))))

(assert (=> b!704412 (= res!468225 (not (contains!3877 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704413 () Bool)

(declare-fun res!468231 () Bool)

(assert (=> b!704413 (=> (not res!468231) (not e!397716))))

(assert (=> b!704413 (= res!468231 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704414 () Bool)

(assert (=> b!704414 (= e!397716 false)))

(declare-fun lt!317841 () Bool)

(assert (=> b!704414 (= lt!317841 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704415 () Bool)

(declare-fun res!468219 () Bool)

(assert (=> b!704415 (=> (not res!468219) (not e!397716))))

(assert (=> b!704415 (= res!468219 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704416 () Bool)

(declare-fun res!468217 () Bool)

(assert (=> b!704416 (=> (not res!468217) (not e!397716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704416 (= res!468217 (validKeyInArray!0 k!2824))))

(declare-fun b!704417 () Bool)

(declare-fun res!468227 () Bool)

(assert (=> b!704417 (=> (not res!468227) (not e!397716))))

(assert (=> b!704417 (= res!468227 (noDuplicate!1124 newAcc!49))))

(declare-fun b!704418 () Bool)

(declare-fun res!468214 () Bool)

(assert (=> b!704418 (=> (not res!468214) (not e!397716))))

(assert (=> b!704418 (= res!468214 (contains!3877 newAcc!49 k!2824))))

(declare-fun b!704419 () Bool)

(declare-fun res!468216 () Bool)

(assert (=> b!704419 (=> (not res!468216) (not e!397716))))

(assert (=> b!704419 (= res!468216 (not (validKeyInArray!0 (select (arr!19259 a!3591) from!2969))))))

(declare-fun b!704420 () Bool)

(declare-fun res!468229 () Bool)

(assert (=> b!704420 (=> (not res!468229) (not e!397716))))

(assert (=> b!704420 (= res!468229 (not (contains!3877 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704421 () Bool)

(declare-fun res!468218 () Bool)

(assert (=> b!704421 (=> (not res!468218) (not e!397716))))

(assert (=> b!704421 (= res!468218 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19644 a!3591)))))

(assert (= (and start!62526 res!468215) b!704404))

(assert (= (and b!704404 res!468220) b!704417))

(assert (= (and b!704417 res!468227) b!704406))

(assert (= (and b!704406 res!468223) b!704420))

(assert (= (and b!704420 res!468229) b!704415))

(assert (= (and b!704415 res!468219) b!704410))

(assert (= (and b!704410 res!468230) b!704416))

(assert (= (and b!704416 res!468217) b!704409))

(assert (= (and b!704409 res!468226) b!704408))

(assert (= (and b!704408 res!468228) b!704418))

(assert (= (and b!704418 res!468214) b!704411))

(assert (= (and b!704411 res!468224) b!704412))

(assert (= (and b!704412 res!468225) b!704405))

(assert (= (and b!704405 res!468222) b!704421))

(assert (= (and b!704421 res!468218) b!704419))

(assert (= (and b!704419 res!468216) b!704413))

(assert (= (and b!704413 res!468231) b!704407))

(assert (= (and b!704407 res!468221) b!704414))

(declare-fun m!662911 () Bool)

(assert (=> b!704407 m!662911))

(declare-fun m!662913 () Bool)

(assert (=> start!62526 m!662913))

(declare-fun m!662915 () Bool)

(assert (=> b!704411 m!662915))

(declare-fun m!662917 () Bool)

(assert (=> b!704410 m!662917))

(declare-fun m!662919 () Bool)

(assert (=> b!704412 m!662919))

(declare-fun m!662921 () Bool)

(assert (=> b!704415 m!662921))

(declare-fun m!662923 () Bool)

(assert (=> b!704404 m!662923))

(declare-fun m!662925 () Bool)

(assert (=> b!704420 m!662925))

(declare-fun m!662927 () Bool)

(assert (=> b!704408 m!662927))

(declare-fun m!662929 () Bool)

(assert (=> b!704406 m!662929))

(declare-fun m!662931 () Bool)

(assert (=> b!704414 m!662931))

(declare-fun m!662933 () Bool)

(assert (=> b!704418 m!662933))

(declare-fun m!662935 () Bool)

(assert (=> b!704405 m!662935))

(declare-fun m!662937 () Bool)

(assert (=> b!704416 m!662937))

(declare-fun m!662939 () Bool)

(assert (=> b!704419 m!662939))

(assert (=> b!704419 m!662939))

(declare-fun m!662941 () Bool)

(assert (=> b!704419 m!662941))

(declare-fun m!662943 () Bool)

(assert (=> b!704417 m!662943))

(declare-fun m!662945 () Bool)

(assert (=> b!704409 m!662945))

(push 1)

(assert (not b!704407))

(assert (not b!704418))

(assert (not b!704420))

(assert (not b!704405))

(assert (not b!704406))

(assert (not b!704414))

(assert (not b!704417))

(assert (not b!704411))

(assert (not b!704409))

(assert (not b!704419))

(assert (not b!704410))

(assert (not start!62526))

(assert (not b!704416))

(assert (not b!704412))

(assert (not b!704404))

(assert (not b!704415))

(assert (not b!704408))

(check-sat)

