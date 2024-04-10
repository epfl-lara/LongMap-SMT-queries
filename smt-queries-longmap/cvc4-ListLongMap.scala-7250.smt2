; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92566 () Bool)

(assert start!92566)

(declare-fun b!1052892 () Bool)

(declare-fun e!597856 () Bool)

(declare-fun e!597855 () Bool)

(assert (=> b!1052892 (= e!597856 e!597855)))

(declare-fun res!702022 () Bool)

(assert (=> b!1052892 (=> (not res!702022) (not e!597855))))

(declare-datatypes ((array!66367 0))(
  ( (array!66368 (arr!31923 (Array (_ BitVec 32) (_ BitVec 64))) (size!32459 (_ BitVec 32))) )
))
(declare-fun lt!464999 () array!66367)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052892 (= res!702022 (arrayContainsKey!0 lt!464999 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66367)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052892 (= lt!464999 (array!66368 (store (arr!31923 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32459 a!3488)))))

(declare-fun res!702020 () Bool)

(assert (=> start!92566 (=> (not res!702020) (not e!597856))))

(assert (=> start!92566 (= res!702020 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32459 a!3488)) (bvslt (size!32459 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92566 e!597856))

(assert (=> start!92566 true))

(declare-fun array_inv!24703 (array!66367) Bool)

(assert (=> start!92566 (array_inv!24703 a!3488)))

(declare-fun b!1052893 () Bool)

(declare-fun res!702023 () Bool)

(assert (=> b!1052893 (=> (not res!702023) (not e!597856))))

(declare-datatypes ((List!22235 0))(
  ( (Nil!22232) (Cons!22231 (h!23440 (_ BitVec 64)) (t!31542 List!22235)) )
))
(declare-fun arrayNoDuplicates!0 (array!66367 (_ BitVec 32) List!22235) Bool)

(assert (=> b!1052893 (= res!702023 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22232))))

(declare-fun b!1052894 () Bool)

(declare-fun res!702018 () Bool)

(assert (=> b!1052894 (=> (not res!702018) (not e!597856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052894 (= res!702018 (validKeyInArray!0 k!2747))))

(declare-fun b!1052895 () Bool)

(declare-fun e!597853 () Bool)

(assert (=> b!1052895 (= e!597853 (not true))))

(declare-fun lt!465000 () (_ BitVec 32))

(assert (=> b!1052895 (= (select (store (arr!31923 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465000) k!2747)))

(declare-fun b!1052896 () Bool)

(assert (=> b!1052896 (= e!597855 e!597853)))

(declare-fun res!702021 () Bool)

(assert (=> b!1052896 (=> (not res!702021) (not e!597853))))

(assert (=> b!1052896 (= res!702021 (not (= lt!465000 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66367 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052896 (= lt!465000 (arrayScanForKey!0 lt!464999 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052897 () Bool)

(declare-fun res!702019 () Bool)

(assert (=> b!1052897 (=> (not res!702019) (not e!597856))))

(assert (=> b!1052897 (= res!702019 (= (select (arr!31923 a!3488) i!1381) k!2747))))

(assert (= (and start!92566 res!702020) b!1052893))

(assert (= (and b!1052893 res!702023) b!1052894))

(assert (= (and b!1052894 res!702018) b!1052897))

(assert (= (and b!1052897 res!702019) b!1052892))

(assert (= (and b!1052892 res!702022) b!1052896))

(assert (= (and b!1052896 res!702021) b!1052895))

(declare-fun m!973285 () Bool)

(assert (=> b!1052897 m!973285))

(declare-fun m!973287 () Bool)

(assert (=> b!1052894 m!973287))

(declare-fun m!973289 () Bool)

(assert (=> b!1052896 m!973289))

(declare-fun m!973291 () Bool)

(assert (=> start!92566 m!973291))

(declare-fun m!973293 () Bool)

(assert (=> b!1052892 m!973293))

(declare-fun m!973295 () Bool)

(assert (=> b!1052892 m!973295))

(declare-fun m!973297 () Bool)

(assert (=> b!1052893 m!973297))

(assert (=> b!1052895 m!973295))

(declare-fun m!973299 () Bool)

(assert (=> b!1052895 m!973299))

(push 1)

(assert (not b!1052894))

(assert (not b!1052896))

(assert (not b!1052892))

(assert (not b!1052893))

(assert (not start!92566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

