; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92442 () Bool)

(assert start!92442)

(declare-fun b!1051053 () Bool)

(declare-fun res!700184 () Bool)

(declare-fun e!596549 () Bool)

(assert (=> b!1051053 (=> (not res!700184) (not e!596549))))

(declare-datatypes ((array!66243 0))(
  ( (array!66244 (arr!31861 (Array (_ BitVec 32) (_ BitVec 64))) (size!32397 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66243)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051053 (= res!700184 (= (select (arr!31861 a!3488) i!1381) k!2747))))

(declare-fun b!1051054 () Bool)

(declare-fun res!700186 () Bool)

(assert (=> b!1051054 (=> (not res!700186) (not e!596549))))

(declare-datatypes ((List!22173 0))(
  ( (Nil!22170) (Cons!22169 (h!23378 (_ BitVec 64)) (t!31480 List!22173)) )
))
(declare-fun arrayNoDuplicates!0 (array!66243 (_ BitVec 32) List!22173) Bool)

(assert (=> b!1051054 (= res!700186 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22170))))

(declare-fun b!1051055 () Bool)

(declare-fun e!596548 () Bool)

(assert (=> b!1051055 (= e!596549 e!596548)))

(declare-fun res!700179 () Bool)

(assert (=> b!1051055 (=> (not res!700179) (not e!596548))))

(declare-fun lt!464143 () array!66243)

(declare-fun arrayContainsKey!0 (array!66243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051055 (= res!700179 (arrayContainsKey!0 lt!464143 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051055 (= lt!464143 (array!66244 (store (arr!31861 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32397 a!3488)))))

(declare-fun b!1051056 () Bool)

(declare-fun e!596552 () Bool)

(assert (=> b!1051056 (= e!596552 true)))

(declare-fun lt!464144 () (_ BitVec 32))

(assert (=> b!1051056 (arrayNoDuplicates!0 a!3488 lt!464144 Nil!22170)))

(declare-datatypes ((Unit!34394 0))(
  ( (Unit!34395) )
))
(declare-fun lt!464145 () Unit!34394)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66243 (_ BitVec 32) (_ BitVec 32)) Unit!34394)

(assert (=> b!1051056 (= lt!464145 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464144))))

(declare-fun b!1051057 () Bool)

(declare-fun res!700182 () Bool)

(assert (=> b!1051057 (=> (not res!700182) (not e!596549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051057 (= res!700182 (validKeyInArray!0 k!2747))))

(declare-fun b!1051058 () Bool)

(declare-fun e!596554 () Bool)

(declare-fun e!596550 () Bool)

(assert (=> b!1051058 (= e!596554 e!596550)))

(declare-fun res!700181 () Bool)

(assert (=> b!1051058 (=> res!700181 e!596550)))

(assert (=> b!1051058 (= res!700181 (or (bvsgt lt!464144 i!1381) (bvsle i!1381 lt!464144)))))

(declare-fun b!1051059 () Bool)

(assert (=> b!1051059 (= e!596550 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun res!700185 () Bool)

(assert (=> start!92442 (=> (not res!700185) (not e!596549))))

(assert (=> start!92442 (= res!700185 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32397 a!3488)) (bvslt (size!32397 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92442 e!596549))

(assert (=> start!92442 true))

(declare-fun array_inv!24641 (array!66243) Bool)

(assert (=> start!92442 (array_inv!24641 a!3488)))

(declare-fun b!1051060 () Bool)

(declare-fun e!596553 () Bool)

(assert (=> b!1051060 (= e!596553 (not e!596552))))

(declare-fun res!700180 () Bool)

(assert (=> b!1051060 (=> res!700180 e!596552)))

(assert (=> b!1051060 (= res!700180 (or (bvsgt lt!464144 i!1381) (bvsle i!1381 lt!464144)))))

(assert (=> b!1051060 e!596554))

(declare-fun res!700187 () Bool)

(assert (=> b!1051060 (=> (not res!700187) (not e!596554))))

(assert (=> b!1051060 (= res!700187 (= (select (store (arr!31861 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464144) k!2747))))

(declare-fun b!1051061 () Bool)

(assert (=> b!1051061 (= e!596548 e!596553)))

(declare-fun res!700183 () Bool)

(assert (=> b!1051061 (=> (not res!700183) (not e!596553))))

(assert (=> b!1051061 (= res!700183 (not (= lt!464144 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66243 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051061 (= lt!464144 (arrayScanForKey!0 lt!464143 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92442 res!700185) b!1051054))

(assert (= (and b!1051054 res!700186) b!1051057))

(assert (= (and b!1051057 res!700182) b!1051053))

(assert (= (and b!1051053 res!700184) b!1051055))

(assert (= (and b!1051055 res!700179) b!1051061))

(assert (= (and b!1051061 res!700183) b!1051060))

(assert (= (and b!1051060 res!700187) b!1051058))

(assert (= (and b!1051058 (not res!700181)) b!1051059))

(assert (= (and b!1051060 (not res!700180)) b!1051056))

(declare-fun m!971627 () Bool)

(assert (=> b!1051053 m!971627))

(declare-fun m!971629 () Bool)

(assert (=> b!1051054 m!971629))

(declare-fun m!971631 () Bool)

(assert (=> b!1051060 m!971631))

(declare-fun m!971633 () Bool)

(assert (=> b!1051060 m!971633))

(declare-fun m!971635 () Bool)

(assert (=> b!1051057 m!971635))

(declare-fun m!971637 () Bool)

(assert (=> b!1051061 m!971637))

(declare-fun m!971639 () Bool)

(assert (=> b!1051059 m!971639))

(declare-fun m!971641 () Bool)

(assert (=> b!1051055 m!971641))

(assert (=> b!1051055 m!971631))

(declare-fun m!971643 () Bool)

(assert (=> start!92442 m!971643))

(declare-fun m!971645 () Bool)

(assert (=> b!1051056 m!971645))

(declare-fun m!971647 () Bool)

(assert (=> b!1051056 m!971647))

(push 1)

(assert (not start!92442))

(assert (not b!1051061))

(assert (not b!1051057))

(assert (not b!1051055))

(assert (not b!1051054))

(assert (not b!1051059))

(assert (not b!1051056))

(check-sat)

