; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71788 () Bool)

(assert start!71788)

(declare-fun b!834349 () Bool)

(declare-fun e!465500 () Bool)

(declare-fun e!465499 () Bool)

(assert (=> b!834349 (= e!465500 e!465499)))

(declare-fun res!567364 () Bool)

(assert (=> b!834349 (=> (not res!567364) (not e!465499))))

(declare-fun lt!378962 () (_ BitVec 32))

(declare-fun lt!378966 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-datatypes ((array!46698 0))(
  ( (array!46699 (arr!22383 (Array (_ BitVec 32) (_ BitVec 64))) (size!22804 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46698)

(assert (=> b!834349 (= res!567364 (and (= lt!378962 lt!378966) (not (= to!390 (size!22804 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46698 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834349 (= lt!378966 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378961 () array!46698)

(assert (=> b!834349 (= lt!378962 (arrayCountValidKeys!0 lt!378961 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834349 (= lt!378961 (array!46699 (store (arr!22383 a!4227) i!1466 k!2968) (size!22804 a!4227)))))

(declare-fun b!834350 () Bool)

(declare-fun e!465497 () Bool)

(assert (=> b!834350 (= e!465497 false)))

(declare-fun lt!378970 () (_ BitVec 32))

(assert (=> b!834350 (= lt!378970 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!378967 () (_ BitVec 32))

(assert (=> b!834350 (= lt!378967 (arrayCountValidKeys!0 lt!378961 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834351 () Bool)

(declare-datatypes ((Unit!28659 0))(
  ( (Unit!28660) )
))
(declare-fun e!465501 () Unit!28659)

(declare-fun lt!378968 () Unit!28659)

(assert (=> b!834351 (= e!465501 lt!378968)))

(declare-fun lt!378969 () Unit!28659)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46698 (_ BitVec 32) (_ BitVec 32)) Unit!28659)

(assert (=> b!834351 (= lt!378969 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36529 () (_ BitVec 32))

(assert (=> b!834351 (= call!36529 (bvadd #b00000000000000000000000000000001 lt!378966))))

(assert (=> b!834351 (= lt!378968 (lemmaValidKeyIncreasesNumOfKeys!0 lt!378961 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36530 () (_ BitVec 32))

(assert (=> b!834351 (= call!36530 (bvadd #b00000000000000000000000000000001 lt!378962))))

(declare-fun bm!36526 () Bool)

(assert (=> bm!36526 (= call!36530 (arrayCountValidKeys!0 lt!378961 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834352 () Bool)

(declare-fun res!567365 () Bool)

(assert (=> b!834352 (=> (not res!567365) (not e!465500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834352 (= res!567365 (validKeyInArray!0 k!2968))))

(declare-fun bm!36527 () Bool)

(assert (=> bm!36527 (= call!36529 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834354 () Bool)

(declare-fun lt!378965 () Unit!28659)

(assert (=> b!834354 (= e!465501 lt!378965)))

(declare-fun lt!378964 () Unit!28659)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46698 (_ BitVec 32) (_ BitVec 32)) Unit!28659)

(assert (=> b!834354 (= lt!378964 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834354 (= call!36529 lt!378966)))

(assert (=> b!834354 (= lt!378965 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!378961 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834354 (= call!36530 lt!378962)))

(declare-fun b!834355 () Bool)

(declare-fun res!567360 () Bool)

(assert (=> b!834355 (=> (not res!567360) (not e!465500))))

(assert (=> b!834355 (= res!567360 (not (validKeyInArray!0 (select (arr!22383 a!4227) i!1466))))))

(declare-fun b!834356 () Bool)

(assert (=> b!834356 (= e!465499 e!465497)))

(declare-fun res!567361 () Bool)

(assert (=> b!834356 (=> (not res!567361) (not e!465497))))

(assert (=> b!834356 (= res!567361 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22804 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!378963 () Unit!28659)

(assert (=> b!834356 (= lt!378963 e!465501)))

(declare-fun c!90890 () Bool)

(assert (=> b!834356 (= c!90890 (validKeyInArray!0 (select (arr!22383 a!4227) to!390)))))

(declare-fun res!567363 () Bool)

(assert (=> start!71788 (=> (not res!567363) (not e!465500))))

(assert (=> start!71788 (= res!567363 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22804 a!4227))))))

(assert (=> start!71788 e!465500))

(assert (=> start!71788 true))

(declare-fun array_inv!17830 (array!46698) Bool)

(assert (=> start!71788 (array_inv!17830 a!4227)))

(declare-fun b!834353 () Bool)

(declare-fun res!567362 () Bool)

(assert (=> b!834353 (=> (not res!567362) (not e!465500))))

(assert (=> b!834353 (= res!567362 (and (bvslt (size!22804 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22804 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71788 res!567363) b!834355))

(assert (= (and b!834355 res!567360) b!834352))

(assert (= (and b!834352 res!567365) b!834353))

(assert (= (and b!834353 res!567362) b!834349))

(assert (= (and b!834349 res!567364) b!834356))

(assert (= (and b!834356 c!90890) b!834351))

(assert (= (and b!834356 (not c!90890)) b!834354))

(assert (= (or b!834351 b!834354) bm!36526))

(assert (= (or b!834351 b!834354) bm!36527))

(assert (= (and b!834356 res!567361) b!834350))

(declare-fun m!779317 () Bool)

(assert (=> start!71788 m!779317))

(declare-fun m!779319 () Bool)

(assert (=> b!834350 m!779319))

(declare-fun m!779321 () Bool)

(assert (=> b!834350 m!779321))

(declare-fun m!779323 () Bool)

(assert (=> b!834352 m!779323))

(declare-fun m!779325 () Bool)

(assert (=> b!834355 m!779325))

(assert (=> b!834355 m!779325))

(declare-fun m!779327 () Bool)

(assert (=> b!834355 m!779327))

(declare-fun m!779329 () Bool)

(assert (=> b!834351 m!779329))

(declare-fun m!779331 () Bool)

(assert (=> b!834351 m!779331))

(assert (=> bm!36527 m!779319))

(assert (=> bm!36526 m!779321))

(declare-fun m!779333 () Bool)

(assert (=> b!834349 m!779333))

(declare-fun m!779335 () Bool)

(assert (=> b!834349 m!779335))

(declare-fun m!779337 () Bool)

(assert (=> b!834349 m!779337))

(declare-fun m!779339 () Bool)

(assert (=> b!834356 m!779339))

(assert (=> b!834356 m!779339))

(declare-fun m!779341 () Bool)

(assert (=> b!834356 m!779341))

(declare-fun m!779343 () Bool)

(assert (=> b!834354 m!779343))

(declare-fun m!779345 () Bool)

(assert (=> b!834354 m!779345))

(push 1)

