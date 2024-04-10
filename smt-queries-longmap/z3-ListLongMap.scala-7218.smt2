; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92372 () Bool)

(assert start!92372)

(declare-fun b!1050222 () Bool)

(declare-fun e!595941 () Bool)

(declare-fun e!595940 () Bool)

(assert (=> b!1050222 (= e!595941 e!595940)))

(declare-fun res!699350 () Bool)

(assert (=> b!1050222 (=> (not res!699350) (not e!595940))))

(declare-datatypes ((array!66173 0))(
  ( (array!66174 (arr!31826 (Array (_ BitVec 32) (_ BitVec 64))) (size!32362 (_ BitVec 32))) )
))
(declare-fun lt!463842 () array!66173)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050222 (= res!699350 (arrayContainsKey!0 lt!463842 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66173)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050222 (= lt!463842 (array!66174 (store (arr!31826 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32362 a!3488)))))

(declare-fun b!1050223 () Bool)

(declare-fun res!699354 () Bool)

(assert (=> b!1050223 (=> (not res!699354) (not e!595941))))

(assert (=> b!1050223 (= res!699354 (= (select (arr!31826 a!3488) i!1381) k0!2747))))

(declare-fun res!699353 () Bool)

(assert (=> start!92372 (=> (not res!699353) (not e!595941))))

(assert (=> start!92372 (= res!699353 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32362 a!3488)) (bvslt (size!32362 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92372 e!595941))

(assert (=> start!92372 true))

(declare-fun array_inv!24606 (array!66173) Bool)

(assert (=> start!92372 (array_inv!24606 a!3488)))

(declare-fun b!1050224 () Bool)

(declare-fun e!595935 () Bool)

(declare-fun e!595938 () Bool)

(assert (=> b!1050224 (= e!595935 e!595938)))

(declare-fun res!699352 () Bool)

(assert (=> b!1050224 (=> res!699352 e!595938)))

(declare-fun lt!463840 () (_ BitVec 32))

(assert (=> b!1050224 (= res!699352 (bvsle lt!463840 i!1381))))

(declare-fun b!1050225 () Bool)

(declare-fun res!699359 () Bool)

(declare-fun e!595942 () Bool)

(assert (=> b!1050225 (=> res!699359 e!595942)))

(declare-datatypes ((List!22138 0))(
  ( (Nil!22135) (Cons!22134 (h!23343 (_ BitVec 64)) (t!31445 List!22138)) )
))
(declare-fun contains!6131 (List!22138 (_ BitVec 64)) Bool)

(assert (=> b!1050225 (= res!699359 (contains!6131 Nil!22135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050226 () Bool)

(assert (=> b!1050226 (= e!595942 true)))

(declare-fun lt!463838 () Bool)

(assert (=> b!1050226 (= lt!463838 (contains!6131 Nil!22135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050227 () Bool)

(declare-fun res!699357 () Bool)

(assert (=> b!1050227 (=> (not res!699357) (not e!595941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050227 (= res!699357 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050228 () Bool)

(declare-fun res!699351 () Bool)

(assert (=> b!1050228 (=> res!699351 e!595942)))

(declare-fun noDuplicate!1516 (List!22138) Bool)

(assert (=> b!1050228 (= res!699351 (not (noDuplicate!1516 Nil!22135)))))

(declare-fun b!1050229 () Bool)

(declare-fun e!595939 () Bool)

(assert (=> b!1050229 (= e!595939 e!595942)))

(declare-fun res!699356 () Bool)

(assert (=> b!1050229 (=> res!699356 e!595942)))

(assert (=> b!1050229 (= res!699356 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32362 a!3488)))))

(assert (=> b!1050229 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34372 0))(
  ( (Unit!34373) )
))
(declare-fun lt!463839 () Unit!34372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66173 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34372)

(assert (=> b!1050229 (= lt!463839 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463840 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66173 (_ BitVec 32) List!22138) Bool)

(assert (=> b!1050229 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22135)))

(declare-fun lt!463841 () Unit!34372)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66173 (_ BitVec 32) (_ BitVec 32)) Unit!34372)

(assert (=> b!1050229 (= lt!463841 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050230 () Bool)

(assert (=> b!1050230 (= e!595938 (arrayContainsKey!0 a!3488 k0!2747 lt!463840))))

(declare-fun b!1050231 () Bool)

(declare-fun e!595937 () Bool)

(assert (=> b!1050231 (= e!595940 e!595937)))

(declare-fun res!699348 () Bool)

(assert (=> b!1050231 (=> (not res!699348) (not e!595937))))

(assert (=> b!1050231 (= res!699348 (not (= lt!463840 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66173 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050231 (= lt!463840 (arrayScanForKey!0 lt!463842 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050232 () Bool)

(declare-fun res!699349 () Bool)

(assert (=> b!1050232 (=> (not res!699349) (not e!595941))))

(assert (=> b!1050232 (= res!699349 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22135))))

(declare-fun b!1050233 () Bool)

(assert (=> b!1050233 (= e!595937 (not e!595939))))

(declare-fun res!699358 () Bool)

(assert (=> b!1050233 (=> res!699358 e!595939)))

(assert (=> b!1050233 (= res!699358 (bvsle lt!463840 i!1381))))

(assert (=> b!1050233 e!595935))

(declare-fun res!699355 () Bool)

(assert (=> b!1050233 (=> (not res!699355) (not e!595935))))

(assert (=> b!1050233 (= res!699355 (= (select (store (arr!31826 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463840) k0!2747))))

(assert (= (and start!92372 res!699353) b!1050232))

(assert (= (and b!1050232 res!699349) b!1050227))

(assert (= (and b!1050227 res!699357) b!1050223))

(assert (= (and b!1050223 res!699354) b!1050222))

(assert (= (and b!1050222 res!699350) b!1050231))

(assert (= (and b!1050231 res!699348) b!1050233))

(assert (= (and b!1050233 res!699355) b!1050224))

(assert (= (and b!1050224 (not res!699352)) b!1050230))

(assert (= (and b!1050233 (not res!699358)) b!1050229))

(assert (= (and b!1050229 (not res!699356)) b!1050228))

(assert (= (and b!1050228 (not res!699351)) b!1050225))

(assert (= (and b!1050225 (not res!699359)) b!1050226))

(declare-fun m!970897 () Bool)

(assert (=> b!1050233 m!970897))

(declare-fun m!970899 () Bool)

(assert (=> b!1050233 m!970899))

(declare-fun m!970901 () Bool)

(assert (=> b!1050222 m!970901))

(assert (=> b!1050222 m!970897))

(declare-fun m!970903 () Bool)

(assert (=> start!92372 m!970903))

(declare-fun m!970905 () Bool)

(assert (=> b!1050229 m!970905))

(declare-fun m!970907 () Bool)

(assert (=> b!1050229 m!970907))

(declare-fun m!970909 () Bool)

(assert (=> b!1050229 m!970909))

(declare-fun m!970911 () Bool)

(assert (=> b!1050229 m!970911))

(declare-fun m!970913 () Bool)

(assert (=> b!1050225 m!970913))

(declare-fun m!970915 () Bool)

(assert (=> b!1050223 m!970915))

(declare-fun m!970917 () Bool)

(assert (=> b!1050232 m!970917))

(declare-fun m!970919 () Bool)

(assert (=> b!1050230 m!970919))

(declare-fun m!970921 () Bool)

(assert (=> b!1050226 m!970921))

(declare-fun m!970923 () Bool)

(assert (=> b!1050231 m!970923))

(declare-fun m!970925 () Bool)

(assert (=> b!1050227 m!970925))

(declare-fun m!970927 () Bool)

(assert (=> b!1050228 m!970927))

(check-sat (not b!1050225) (not b!1050228) (not b!1050222) (not b!1050231) (not b!1050229) (not b!1050227) (not start!92372) (not b!1050230) (not b!1050226) (not b!1050232))
