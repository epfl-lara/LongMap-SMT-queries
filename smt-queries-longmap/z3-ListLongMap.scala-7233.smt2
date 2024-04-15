; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92458 () Bool)

(assert start!92458)

(declare-fun b!1051145 () Bool)

(declare-fun e!596648 () Bool)

(declare-fun e!596646 () Bool)

(assert (=> b!1051145 (= e!596648 e!596646)))

(declare-fun res!700361 () Bool)

(assert (=> b!1051145 (=> (not res!700361) (not e!596646))))

(declare-datatypes ((array!66200 0))(
  ( (array!66201 (arr!31839 (Array (_ BitVec 32) (_ BitVec 64))) (size!32377 (_ BitVec 32))) )
))
(declare-fun lt!464026 () array!66200)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051145 (= res!700361 (arrayContainsKey!0 lt!464026 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66200)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051145 (= lt!464026 (array!66201 (store (arr!31839 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32377 a!3488)))))

(declare-fun b!1051146 () Bool)

(declare-fun e!596647 () Bool)

(declare-fun e!596651 () Bool)

(assert (=> b!1051146 (= e!596647 e!596651)))

(declare-fun res!700355 () Bool)

(assert (=> b!1051146 (=> res!700355 e!596651)))

(declare-fun lt!464024 () (_ BitVec 32))

(assert (=> b!1051146 (= res!700355 (or (bvsgt lt!464024 i!1381) (bvsle i!1381 lt!464024)))))

(declare-fun b!1051147 () Bool)

(declare-fun e!596650 () Bool)

(assert (=> b!1051147 (= e!596646 e!596650)))

(declare-fun res!700362 () Bool)

(assert (=> b!1051147 (=> (not res!700362) (not e!596650))))

(assert (=> b!1051147 (= res!700362 (not (= lt!464024 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66200 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051147 (= lt!464024 (arrayScanForKey!0 lt!464026 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051148 () Bool)

(declare-fun e!596649 () Bool)

(assert (=> b!1051148 (= e!596650 (not e!596649))))

(declare-fun res!700358 () Bool)

(assert (=> b!1051148 (=> res!700358 e!596649)))

(assert (=> b!1051148 (= res!700358 (or (bvsgt lt!464024 i!1381) (bvsle i!1381 lt!464024)))))

(assert (=> b!1051148 e!596647))

(declare-fun res!700356 () Bool)

(assert (=> b!1051148 (=> (not res!700356) (not e!596647))))

(assert (=> b!1051148 (= res!700356 (= (select (store (arr!31839 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464024) k0!2747))))

(declare-fun b!1051149 () Bool)

(assert (=> b!1051149 (= e!596651 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!700363 () Bool)

(assert (=> start!92458 (=> (not res!700363) (not e!596648))))

(assert (=> start!92458 (= res!700363 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32377 a!3488)) (bvslt (size!32377 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92458 e!596648))

(assert (=> start!92458 true))

(declare-fun array_inv!24622 (array!66200) Bool)

(assert (=> start!92458 (array_inv!24622 a!3488)))

(declare-fun b!1051150 () Bool)

(declare-fun res!700359 () Bool)

(assert (=> b!1051150 (=> (not res!700359) (not e!596648))))

(declare-datatypes ((List!22210 0))(
  ( (Nil!22207) (Cons!22206 (h!23415 (_ BitVec 64)) (t!31508 List!22210)) )
))
(declare-fun arrayNoDuplicates!0 (array!66200 (_ BitVec 32) List!22210) Bool)

(assert (=> b!1051150 (= res!700359 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22207))))

(declare-fun b!1051151 () Bool)

(declare-fun res!700360 () Bool)

(assert (=> b!1051151 (=> (not res!700360) (not e!596648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051151 (= res!700360 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051152 () Bool)

(declare-fun res!700357 () Bool)

(assert (=> b!1051152 (=> (not res!700357) (not e!596648))))

(assert (=> b!1051152 (= res!700357 (= (select (arr!31839 a!3488) i!1381) k0!2747))))

(declare-fun b!1051153 () Bool)

(assert (=> b!1051153 (= e!596649 true)))

(assert (=> b!1051153 (arrayNoDuplicates!0 a!3488 lt!464024 Nil!22207)))

(declare-datatypes ((Unit!34283 0))(
  ( (Unit!34284) )
))
(declare-fun lt!464025 () Unit!34283)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66200 (_ BitVec 32) (_ BitVec 32)) Unit!34283)

(assert (=> b!1051153 (= lt!464025 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464024))))

(assert (= (and start!92458 res!700363) b!1051150))

(assert (= (and b!1051150 res!700359) b!1051151))

(assert (= (and b!1051151 res!700360) b!1051152))

(assert (= (and b!1051152 res!700357) b!1051145))

(assert (= (and b!1051145 res!700361) b!1051147))

(assert (= (and b!1051147 res!700362) b!1051148))

(assert (= (and b!1051148 res!700356) b!1051146))

(assert (= (and b!1051146 (not res!700355)) b!1051149))

(assert (= (and b!1051148 (not res!700358)) b!1051153))

(declare-fun m!971209 () Bool)

(assert (=> b!1051148 m!971209))

(declare-fun m!971211 () Bool)

(assert (=> b!1051148 m!971211))

(declare-fun m!971213 () Bool)

(assert (=> b!1051145 m!971213))

(assert (=> b!1051145 m!971209))

(declare-fun m!971215 () Bool)

(assert (=> start!92458 m!971215))

(declare-fun m!971217 () Bool)

(assert (=> b!1051149 m!971217))

(declare-fun m!971219 () Bool)

(assert (=> b!1051152 m!971219))

(declare-fun m!971221 () Bool)

(assert (=> b!1051150 m!971221))

(declare-fun m!971223 () Bool)

(assert (=> b!1051151 m!971223))

(declare-fun m!971225 () Bool)

(assert (=> b!1051153 m!971225))

(declare-fun m!971227 () Bool)

(assert (=> b!1051153 m!971227))

(declare-fun m!971229 () Bool)

(assert (=> b!1051147 m!971229))

(check-sat (not b!1051153) (not b!1051147) (not b!1051150) (not b!1051149) (not start!92458) (not b!1051145) (not b!1051151))
(check-sat)
