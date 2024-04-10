; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92318 () Bool)

(assert start!92318)

(declare-fun b!1049262 () Bool)

(declare-fun res!698390 () Bool)

(declare-fun e!595296 () Bool)

(assert (=> b!1049262 (=> (not res!698390) (not e!595296))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049262 (= res!698390 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049263 () Bool)

(declare-fun lt!463443 () (_ BitVec 32))

(declare-datatypes ((array!66119 0))(
  ( (array!66120 (arr!31799 (Array (_ BitVec 32) (_ BitVec 64))) (size!32335 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66119)

(declare-fun e!595294 () Bool)

(declare-fun arrayContainsKey!0 (array!66119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049263 (= e!595294 (arrayContainsKey!0 a!3488 k0!2747 lt!463443))))

(declare-fun res!698394 () Bool)

(assert (=> start!92318 (=> (not res!698394) (not e!595296))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92318 (= res!698394 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32335 a!3488)) (bvslt (size!32335 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92318 e!595296))

(assert (=> start!92318 true))

(declare-fun array_inv!24579 (array!66119) Bool)

(assert (=> start!92318 (array_inv!24579 a!3488)))

(declare-fun b!1049264 () Bool)

(declare-fun e!595295 () Bool)

(declare-fun e!595293 () Bool)

(assert (=> b!1049264 (= e!595295 e!595293)))

(declare-fun res!698396 () Bool)

(assert (=> b!1049264 (=> (not res!698396) (not e!595293))))

(assert (=> b!1049264 (= res!698396 (not (= lt!463443 i!1381)))))

(declare-fun lt!463441 () array!66119)

(declare-fun arrayScanForKey!0 (array!66119 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049264 (= lt!463443 (arrayScanForKey!0 lt!463441 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049265 () Bool)

(declare-fun e!595292 () Bool)

(assert (=> b!1049265 (= e!595293 (not e!595292))))

(declare-fun res!698395 () Bool)

(assert (=> b!1049265 (=> res!698395 e!595292)))

(assert (=> b!1049265 (= res!698395 (bvsle lt!463443 i!1381))))

(declare-fun e!595297 () Bool)

(assert (=> b!1049265 e!595297))

(declare-fun res!698393 () Bool)

(assert (=> b!1049265 (=> (not res!698393) (not e!595297))))

(assert (=> b!1049265 (= res!698393 (= (select (store (arr!31799 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463443) k0!2747))))

(declare-fun b!1049266 () Bool)

(assert (=> b!1049266 (= e!595297 e!595294)))

(declare-fun res!698392 () Bool)

(assert (=> b!1049266 (=> res!698392 e!595294)))

(assert (=> b!1049266 (= res!698392 (bvsle lt!463443 i!1381))))

(declare-fun b!1049267 () Bool)

(declare-fun res!698389 () Bool)

(assert (=> b!1049267 (=> (not res!698389) (not e!595296))))

(declare-datatypes ((List!22111 0))(
  ( (Nil!22108) (Cons!22107 (h!23316 (_ BitVec 64)) (t!31418 List!22111)) )
))
(declare-fun arrayNoDuplicates!0 (array!66119 (_ BitVec 32) List!22111) Bool)

(assert (=> b!1049267 (= res!698389 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22108))))

(declare-fun b!1049268 () Bool)

(declare-fun res!698388 () Bool)

(assert (=> b!1049268 (=> (not res!698388) (not e!595296))))

(assert (=> b!1049268 (= res!698388 (= (select (arr!31799 a!3488) i!1381) k0!2747))))

(declare-fun b!1049269 () Bool)

(assert (=> b!1049269 (= e!595296 e!595295)))

(declare-fun res!698391 () Bool)

(assert (=> b!1049269 (=> (not res!698391) (not e!595295))))

(assert (=> b!1049269 (= res!698391 (arrayContainsKey!0 lt!463441 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049269 (= lt!463441 (array!66120 (store (arr!31799 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32335 a!3488)))))

(declare-fun b!1049270 () Bool)

(assert (=> b!1049270 (= e!595292 true)))

(assert (=> b!1049270 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22108)))

(declare-datatypes ((Unit!34318 0))(
  ( (Unit!34319) )
))
(declare-fun lt!463442 () Unit!34318)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66119 (_ BitVec 32) (_ BitVec 32)) Unit!34318)

(assert (=> b!1049270 (= lt!463442 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92318 res!698394) b!1049267))

(assert (= (and b!1049267 res!698389) b!1049262))

(assert (= (and b!1049262 res!698390) b!1049268))

(assert (= (and b!1049268 res!698388) b!1049269))

(assert (= (and b!1049269 res!698391) b!1049264))

(assert (= (and b!1049264 res!698396) b!1049265))

(assert (= (and b!1049265 res!698393) b!1049266))

(assert (= (and b!1049266 (not res!698392)) b!1049263))

(assert (= (and b!1049265 (not res!698395)) b!1049270))

(declare-fun m!970053 () Bool)

(assert (=> b!1049267 m!970053))

(declare-fun m!970055 () Bool)

(assert (=> b!1049268 m!970055))

(declare-fun m!970057 () Bool)

(assert (=> b!1049269 m!970057))

(declare-fun m!970059 () Bool)

(assert (=> b!1049269 m!970059))

(declare-fun m!970061 () Bool)

(assert (=> b!1049270 m!970061))

(declare-fun m!970063 () Bool)

(assert (=> b!1049270 m!970063))

(declare-fun m!970065 () Bool)

(assert (=> b!1049263 m!970065))

(declare-fun m!970067 () Bool)

(assert (=> b!1049262 m!970067))

(declare-fun m!970069 () Bool)

(assert (=> start!92318 m!970069))

(declare-fun m!970071 () Bool)

(assert (=> b!1049264 m!970071))

(assert (=> b!1049265 m!970059))

(declare-fun m!970073 () Bool)

(assert (=> b!1049265 m!970073))

(check-sat (not b!1049269) (not start!92318) (not b!1049262) (not b!1049263) (not b!1049264) (not b!1049270) (not b!1049267))
