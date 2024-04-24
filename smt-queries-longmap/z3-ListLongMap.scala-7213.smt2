; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92574 () Bool)

(assert start!92574)

(declare-fun b!1050961 () Bool)

(declare-fun e!596401 () Bool)

(declare-fun e!596400 () Bool)

(assert (=> b!1050961 (= e!596401 e!596400)))

(declare-fun res!699288 () Bool)

(assert (=> b!1050961 (=> res!699288 e!596400)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66190 0))(
  ( (array!66191 (arr!31828 (Array (_ BitVec 32) (_ BitVec 64))) (size!32365 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66190)

(assert (=> b!1050961 (= res!699288 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32365 a!3488)))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050961 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34345 0))(
  ( (Unit!34346) )
))
(declare-fun lt!464116 () Unit!34345)

(declare-fun lt!464115 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66190 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34345)

(assert (=> b!1050961 (= lt!464116 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464115 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22110 0))(
  ( (Nil!22107) (Cons!22106 (h!23324 (_ BitVec 64)) (t!31409 List!22110)) )
))
(declare-fun arrayNoDuplicates!0 (array!66190 (_ BitVec 32) List!22110) Bool)

(assert (=> b!1050961 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22107)))

(declare-fun lt!464117 () Unit!34345)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66190 (_ BitVec 32) (_ BitVec 32)) Unit!34345)

(assert (=> b!1050961 (= lt!464117 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050962 () Bool)

(declare-fun res!699283 () Bool)

(declare-fun e!596399 () Bool)

(assert (=> b!1050962 (=> (not res!699283) (not e!596399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050962 (= res!699283 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050963 () Bool)

(declare-fun e!596397 () Bool)

(assert (=> b!1050963 (= e!596399 e!596397)))

(declare-fun res!699291 () Bool)

(assert (=> b!1050963 (=> (not res!699291) (not e!596397))))

(declare-fun lt!464113 () array!66190)

(assert (=> b!1050963 (= res!699291 (arrayContainsKey!0 lt!464113 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050963 (= lt!464113 (array!66191 (store (arr!31828 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32365 a!3488)))))

(declare-fun res!699289 () Bool)

(assert (=> start!92574 (=> (not res!699289) (not e!596399))))

(assert (=> start!92574 (= res!699289 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32365 a!3488)) (bvslt (size!32365 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92574 e!596399))

(assert (=> start!92574 true))

(declare-fun array_inv!24610 (array!66190) Bool)

(assert (=> start!92574 (array_inv!24610 a!3488)))

(declare-fun b!1050964 () Bool)

(declare-fun e!596396 () Bool)

(assert (=> b!1050964 (= e!596396 (arrayContainsKey!0 a!3488 k0!2747 lt!464115))))

(declare-fun b!1050965 () Bool)

(declare-fun res!699282 () Bool)

(assert (=> b!1050965 (=> res!699282 e!596400)))

(declare-fun contains!6140 (List!22110 (_ BitVec 64)) Bool)

(assert (=> b!1050965 (= res!699282 (contains!6140 Nil!22107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050966 () Bool)

(declare-fun res!699290 () Bool)

(assert (=> b!1050966 (=> (not res!699290) (not e!596399))))

(assert (=> b!1050966 (= res!699290 (= (select (arr!31828 a!3488) i!1381) k0!2747))))

(declare-fun b!1050967 () Bool)

(declare-fun res!699287 () Bool)

(assert (=> b!1050967 (=> (not res!699287) (not e!596399))))

(assert (=> b!1050967 (= res!699287 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22107))))

(declare-fun b!1050968 () Bool)

(declare-fun e!596394 () Bool)

(assert (=> b!1050968 (= e!596394 e!596396)))

(declare-fun res!699286 () Bool)

(assert (=> b!1050968 (=> res!699286 e!596396)))

(assert (=> b!1050968 (= res!699286 (bvsle lt!464115 i!1381))))

(declare-fun b!1050969 () Bool)

(assert (=> b!1050969 (= e!596400 true)))

(declare-fun lt!464114 () Bool)

(assert (=> b!1050969 (= lt!464114 (contains!6140 Nil!22107 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050970 () Bool)

(declare-fun e!596398 () Bool)

(assert (=> b!1050970 (= e!596398 (not e!596401))))

(declare-fun res!699284 () Bool)

(assert (=> b!1050970 (=> res!699284 e!596401)))

(assert (=> b!1050970 (= res!699284 (bvsle lt!464115 i!1381))))

(assert (=> b!1050970 e!596394))

(declare-fun res!699293 () Bool)

(assert (=> b!1050970 (=> (not res!699293) (not e!596394))))

(assert (=> b!1050970 (= res!699293 (= (select (store (arr!31828 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464115) k0!2747))))

(declare-fun b!1050971 () Bool)

(assert (=> b!1050971 (= e!596397 e!596398)))

(declare-fun res!699285 () Bool)

(assert (=> b!1050971 (=> (not res!699285) (not e!596398))))

(assert (=> b!1050971 (= res!699285 (not (= lt!464115 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66190 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050971 (= lt!464115 (arrayScanForKey!0 lt!464113 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050972 () Bool)

(declare-fun res!699292 () Bool)

(assert (=> b!1050972 (=> res!699292 e!596400)))

(declare-fun noDuplicate!1516 (List!22110) Bool)

(assert (=> b!1050972 (= res!699292 (not (noDuplicate!1516 Nil!22107)))))

(assert (= (and start!92574 res!699289) b!1050967))

(assert (= (and b!1050967 res!699287) b!1050962))

(assert (= (and b!1050962 res!699283) b!1050966))

(assert (= (and b!1050966 res!699290) b!1050963))

(assert (= (and b!1050963 res!699291) b!1050971))

(assert (= (and b!1050971 res!699285) b!1050970))

(assert (= (and b!1050970 res!699293) b!1050968))

(assert (= (and b!1050968 (not res!699286)) b!1050964))

(assert (= (and b!1050970 (not res!699284)) b!1050961))

(assert (= (and b!1050961 (not res!699288)) b!1050972))

(assert (= (and b!1050972 (not res!699292)) b!1050965))

(assert (= (and b!1050965 (not res!699282)) b!1050969))

(declare-fun m!972053 () Bool)

(assert (=> b!1050965 m!972053))

(declare-fun m!972055 () Bool)

(assert (=> b!1050964 m!972055))

(declare-fun m!972057 () Bool)

(assert (=> start!92574 m!972057))

(declare-fun m!972059 () Bool)

(assert (=> b!1050970 m!972059))

(declare-fun m!972061 () Bool)

(assert (=> b!1050970 m!972061))

(declare-fun m!972063 () Bool)

(assert (=> b!1050972 m!972063))

(declare-fun m!972065 () Bool)

(assert (=> b!1050963 m!972065))

(assert (=> b!1050963 m!972059))

(declare-fun m!972067 () Bool)

(assert (=> b!1050966 m!972067))

(declare-fun m!972069 () Bool)

(assert (=> b!1050962 m!972069))

(declare-fun m!972071 () Bool)

(assert (=> b!1050971 m!972071))

(declare-fun m!972073 () Bool)

(assert (=> b!1050967 m!972073))

(declare-fun m!972075 () Bool)

(assert (=> b!1050961 m!972075))

(declare-fun m!972077 () Bool)

(assert (=> b!1050961 m!972077))

(declare-fun m!972079 () Bool)

(assert (=> b!1050961 m!972079))

(declare-fun m!972081 () Bool)

(assert (=> b!1050961 m!972081))

(declare-fun m!972083 () Bool)

(assert (=> b!1050969 m!972083))

(check-sat (not b!1050962) (not b!1050964) (not b!1050972) (not b!1050971) (not b!1050963) (not start!92574) (not b!1050961) (not b!1050969) (not b!1050965) (not b!1050967))
(check-sat)
