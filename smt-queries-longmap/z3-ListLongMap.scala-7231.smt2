; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92446 () Bool)

(assert start!92446)

(declare-fun e!596520 () Bool)

(declare-fun b!1050983 () Bool)

(declare-datatypes ((array!66188 0))(
  ( (array!66189 (arr!31833 (Array (_ BitVec 32) (_ BitVec 64))) (size!32371 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66188)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050983 (= e!596520 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050984 () Bool)

(declare-fun res!700199 () Bool)

(declare-fun e!596526 () Bool)

(assert (=> b!1050984 (=> (not res!700199) (not e!596526))))

(declare-datatypes ((List!22204 0))(
  ( (Nil!22201) (Cons!22200 (h!23409 (_ BitVec 64)) (t!31502 List!22204)) )
))
(declare-fun arrayNoDuplicates!0 (array!66188 (_ BitVec 32) List!22204) Bool)

(assert (=> b!1050984 (= res!700199 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22201))))

(declare-fun b!1050985 () Bool)

(declare-fun e!596524 () Bool)

(assert (=> b!1050985 (= e!596524 e!596520)))

(declare-fun res!700198 () Bool)

(assert (=> b!1050985 (=> res!700198 e!596520)))

(declare-fun lt!463971 () (_ BitVec 32))

(assert (=> b!1050985 (= res!700198 (or (bvsgt lt!463971 i!1381) (bvsle i!1381 lt!463971)))))

(declare-fun b!1050986 () Bool)

(declare-fun res!700197 () Bool)

(assert (=> b!1050986 (=> (not res!700197) (not e!596526))))

(assert (=> b!1050986 (= res!700197 (= (select (arr!31833 a!3488) i!1381) k0!2747))))

(declare-fun b!1050987 () Bool)

(declare-fun e!596521 () Bool)

(assert (=> b!1050987 (= e!596526 e!596521)))

(declare-fun res!700196 () Bool)

(assert (=> b!1050987 (=> (not res!700196) (not e!596521))))

(declare-fun lt!463970 () array!66188)

(assert (=> b!1050987 (= res!700196 (arrayContainsKey!0 lt!463970 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050987 (= lt!463970 (array!66189 (store (arr!31833 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32371 a!3488)))))

(declare-fun b!1050988 () Bool)

(declare-fun e!596522 () Bool)

(assert (=> b!1050988 (= e!596522 true)))

(assert (=> b!1050988 (arrayNoDuplicates!0 a!3488 lt!463971 Nil!22201)))

(declare-datatypes ((Unit!34271 0))(
  ( (Unit!34272) )
))
(declare-fun lt!463972 () Unit!34271)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66188 (_ BitVec 32) (_ BitVec 32)) Unit!34271)

(assert (=> b!1050988 (= lt!463972 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!463971))))

(declare-fun b!1050989 () Bool)

(declare-fun res!700200 () Bool)

(assert (=> b!1050989 (=> (not res!700200) (not e!596526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050989 (= res!700200 (validKeyInArray!0 k0!2747))))

(declare-fun res!700193 () Bool)

(assert (=> start!92446 (=> (not res!700193) (not e!596526))))

(assert (=> start!92446 (= res!700193 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32371 a!3488)) (bvslt (size!32371 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92446 e!596526))

(assert (=> start!92446 true))

(declare-fun array_inv!24616 (array!66188) Bool)

(assert (=> start!92446 (array_inv!24616 a!3488)))

(declare-fun b!1050990 () Bool)

(declare-fun e!596525 () Bool)

(assert (=> b!1050990 (= e!596521 e!596525)))

(declare-fun res!700201 () Bool)

(assert (=> b!1050990 (=> (not res!700201) (not e!596525))))

(assert (=> b!1050990 (= res!700201 (not (= lt!463971 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66188 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050990 (= lt!463971 (arrayScanForKey!0 lt!463970 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050991 () Bool)

(assert (=> b!1050991 (= e!596525 (not e!596522))))

(declare-fun res!700194 () Bool)

(assert (=> b!1050991 (=> res!700194 e!596522)))

(assert (=> b!1050991 (= res!700194 (or (bvsgt lt!463971 i!1381) (bvsle i!1381 lt!463971)))))

(assert (=> b!1050991 e!596524))

(declare-fun res!700195 () Bool)

(assert (=> b!1050991 (=> (not res!700195) (not e!596524))))

(assert (=> b!1050991 (= res!700195 (= (select (store (arr!31833 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463971) k0!2747))))

(assert (= (and start!92446 res!700193) b!1050984))

(assert (= (and b!1050984 res!700199) b!1050989))

(assert (= (and b!1050989 res!700200) b!1050986))

(assert (= (and b!1050986 res!700197) b!1050987))

(assert (= (and b!1050987 res!700196) b!1050990))

(assert (= (and b!1050990 res!700201) b!1050991))

(assert (= (and b!1050991 res!700195) b!1050985))

(assert (= (and b!1050985 (not res!700198)) b!1050983))

(assert (= (and b!1050991 (not res!700194)) b!1050988))

(declare-fun m!971077 () Bool)

(assert (=> b!1050983 m!971077))

(declare-fun m!971079 () Bool)

(assert (=> b!1050988 m!971079))

(declare-fun m!971081 () Bool)

(assert (=> b!1050988 m!971081))

(declare-fun m!971083 () Bool)

(assert (=> b!1050990 m!971083))

(declare-fun m!971085 () Bool)

(assert (=> b!1050989 m!971085))

(declare-fun m!971087 () Bool)

(assert (=> b!1050984 m!971087))

(declare-fun m!971089 () Bool)

(assert (=> start!92446 m!971089))

(declare-fun m!971091 () Bool)

(assert (=> b!1050987 m!971091))

(declare-fun m!971093 () Bool)

(assert (=> b!1050987 m!971093))

(assert (=> b!1050991 m!971093))

(declare-fun m!971095 () Bool)

(assert (=> b!1050991 m!971095))

(declare-fun m!971097 () Bool)

(assert (=> b!1050986 m!971097))

(check-sat (not b!1050984) (not start!92446) (not b!1050987) (not b!1050983) (not b!1050990) (not b!1050989) (not b!1050988))
(check-sat)
