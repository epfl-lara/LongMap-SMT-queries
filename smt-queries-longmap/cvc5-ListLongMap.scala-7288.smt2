; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93120 () Bool)

(assert start!93120)

(declare-fun b!1056265 () Bool)

(declare-datatypes ((array!66618 0))(
  ( (array!66619 (arr!32035 (Array (_ BitVec 32) (_ BitVec 64))) (size!32571 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66618)

(declare-fun e!600463 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056265 (= e!600463 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun lt!466071 () (_ BitVec 32))

(declare-fun b!1056266 () Bool)

(declare-fun e!600464 () Bool)

(assert (=> b!1056266 (= e!600464 (not (or (bvsgt lt!466071 i!1381) (bvsle i!1381 lt!466071) (bvsle #b00000000000000000000000000000000 (size!32571 a!3488)))))))

(declare-fun e!600462 () Bool)

(assert (=> b!1056266 e!600462))

(declare-fun res!705049 () Bool)

(assert (=> b!1056266 (=> (not res!705049) (not e!600462))))

(assert (=> b!1056266 (= res!705049 (= (select (store (arr!32035 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466071) k!2747))))

(declare-fun b!1056267 () Bool)

(declare-fun res!705044 () Bool)

(declare-fun e!600466 () Bool)

(assert (=> b!1056267 (=> (not res!705044) (not e!600466))))

(assert (=> b!1056267 (= res!705044 (= (select (arr!32035 a!3488) i!1381) k!2747))))

(declare-fun res!705048 () Bool)

(assert (=> start!93120 (=> (not res!705048) (not e!600466))))

(assert (=> start!93120 (= res!705048 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32571 a!3488)) (bvslt (size!32571 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93120 e!600466))

(assert (=> start!93120 true))

(declare-fun array_inv!24815 (array!66618) Bool)

(assert (=> start!93120 (array_inv!24815 a!3488)))

(declare-fun b!1056268 () Bool)

(declare-fun e!600465 () Bool)

(assert (=> b!1056268 (= e!600465 e!600464)))

(declare-fun res!705043 () Bool)

(assert (=> b!1056268 (=> (not res!705043) (not e!600464))))

(assert (=> b!1056268 (= res!705043 (not (= lt!466071 i!1381)))))

(declare-fun lt!466070 () array!66618)

(declare-fun arrayScanForKey!0 (array!66618 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056268 (= lt!466071 (arrayScanForKey!0 lt!466070 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056269 () Bool)

(declare-fun res!705045 () Bool)

(assert (=> b!1056269 (=> (not res!705045) (not e!600466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056269 (= res!705045 (validKeyInArray!0 k!2747))))

(declare-fun b!1056270 () Bool)

(assert (=> b!1056270 (= e!600466 e!600465)))

(declare-fun res!705050 () Bool)

(assert (=> b!1056270 (=> (not res!705050) (not e!600465))))

(assert (=> b!1056270 (= res!705050 (arrayContainsKey!0 lt!466070 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056270 (= lt!466070 (array!66619 (store (arr!32035 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32571 a!3488)))))

(declare-fun b!1056271 () Bool)

(assert (=> b!1056271 (= e!600462 e!600463)))

(declare-fun res!705047 () Bool)

(assert (=> b!1056271 (=> res!705047 e!600463)))

(assert (=> b!1056271 (= res!705047 (or (bvsgt lt!466071 i!1381) (bvsle i!1381 lt!466071)))))

(declare-fun b!1056272 () Bool)

(declare-fun res!705046 () Bool)

(assert (=> b!1056272 (=> (not res!705046) (not e!600466))))

(declare-datatypes ((List!22347 0))(
  ( (Nil!22344) (Cons!22343 (h!23552 (_ BitVec 64)) (t!31654 List!22347)) )
))
(declare-fun arrayNoDuplicates!0 (array!66618 (_ BitVec 32) List!22347) Bool)

(assert (=> b!1056272 (= res!705046 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22344))))

(assert (= (and start!93120 res!705048) b!1056272))

(assert (= (and b!1056272 res!705046) b!1056269))

(assert (= (and b!1056269 res!705045) b!1056267))

(assert (= (and b!1056267 res!705044) b!1056270))

(assert (= (and b!1056270 res!705050) b!1056268))

(assert (= (and b!1056268 res!705043) b!1056266))

(assert (= (and b!1056266 res!705049) b!1056271))

(assert (= (and b!1056271 (not res!705047)) b!1056265))

(declare-fun m!976169 () Bool)

(assert (=> b!1056272 m!976169))

(declare-fun m!976171 () Bool)

(assert (=> start!93120 m!976171))

(declare-fun m!976173 () Bool)

(assert (=> b!1056270 m!976173))

(declare-fun m!976175 () Bool)

(assert (=> b!1056270 m!976175))

(declare-fun m!976177 () Bool)

(assert (=> b!1056267 m!976177))

(declare-fun m!976179 () Bool)

(assert (=> b!1056268 m!976179))

(declare-fun m!976181 () Bool)

(assert (=> b!1056265 m!976181))

(declare-fun m!976183 () Bool)

(assert (=> b!1056269 m!976183))

(assert (=> b!1056266 m!976175))

(declare-fun m!976185 () Bool)

(assert (=> b!1056266 m!976185))

(push 1)

