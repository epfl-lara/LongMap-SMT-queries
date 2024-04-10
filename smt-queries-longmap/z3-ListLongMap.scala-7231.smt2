; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92450 () Bool)

(assert start!92450)

(declare-fun b!1051161 () Bool)

(declare-fun res!700290 () Bool)

(declare-fun e!596636 () Bool)

(assert (=> b!1051161 (=> (not res!700290) (not e!596636))))

(declare-datatypes ((array!66251 0))(
  ( (array!66252 (arr!31865 (Array (_ BitVec 32) (_ BitVec 64))) (size!32401 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66251)

(declare-datatypes ((List!22177 0))(
  ( (Nil!22174) (Cons!22173 (h!23382 (_ BitVec 64)) (t!31484 List!22177)) )
))
(declare-fun arrayNoDuplicates!0 (array!66251 (_ BitVec 32) List!22177) Bool)

(assert (=> b!1051161 (= res!700290 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22174))))

(declare-fun b!1051162 () Bool)

(declare-fun e!596635 () Bool)

(declare-fun e!596638 () Bool)

(assert (=> b!1051162 (= e!596635 e!596638)))

(declare-fun res!700292 () Bool)

(assert (=> b!1051162 (=> (not res!700292) (not e!596638))))

(declare-fun lt!464179 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051162 (= res!700292 (not (= lt!464179 i!1381)))))

(declare-fun lt!464181 () array!66251)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66251 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051162 (= lt!464179 (arrayScanForKey!0 lt!464181 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700288 () Bool)

(assert (=> start!92450 (=> (not res!700288) (not e!596636))))

(assert (=> start!92450 (= res!700288 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32401 a!3488)) (bvslt (size!32401 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92450 e!596636))

(assert (=> start!92450 true))

(declare-fun array_inv!24645 (array!66251) Bool)

(assert (=> start!92450 (array_inv!24645 a!3488)))

(declare-fun b!1051163 () Bool)

(declare-fun e!596637 () Bool)

(declare-fun arrayContainsKey!0 (array!66251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051163 (= e!596637 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051164 () Bool)

(declare-fun e!596634 () Bool)

(assert (=> b!1051164 (= e!596638 (not e!596634))))

(declare-fun res!700293 () Bool)

(assert (=> b!1051164 (=> res!700293 e!596634)))

(assert (=> b!1051164 (= res!700293 (or (bvsgt lt!464179 i!1381) (bvsle i!1381 lt!464179)))))

(declare-fun e!596633 () Bool)

(assert (=> b!1051164 e!596633))

(declare-fun res!700294 () Bool)

(assert (=> b!1051164 (=> (not res!700294) (not e!596633))))

(assert (=> b!1051164 (= res!700294 (= (select (store (arr!31865 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464179) k0!2747))))

(declare-fun b!1051165 () Bool)

(assert (=> b!1051165 (= e!596634 true)))

(assert (=> b!1051165 (arrayNoDuplicates!0 a!3488 lt!464179 Nil!22174)))

(declare-datatypes ((Unit!34402 0))(
  ( (Unit!34403) )
))
(declare-fun lt!464180 () Unit!34402)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66251 (_ BitVec 32) (_ BitVec 32)) Unit!34402)

(assert (=> b!1051165 (= lt!464180 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464179))))

(declare-fun b!1051166 () Bool)

(assert (=> b!1051166 (= e!596633 e!596637)))

(declare-fun res!700295 () Bool)

(assert (=> b!1051166 (=> res!700295 e!596637)))

(assert (=> b!1051166 (= res!700295 (or (bvsgt lt!464179 i!1381) (bvsle i!1381 lt!464179)))))

(declare-fun b!1051167 () Bool)

(assert (=> b!1051167 (= e!596636 e!596635)))

(declare-fun res!700289 () Bool)

(assert (=> b!1051167 (=> (not res!700289) (not e!596635))))

(assert (=> b!1051167 (= res!700289 (arrayContainsKey!0 lt!464181 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051167 (= lt!464181 (array!66252 (store (arr!31865 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32401 a!3488)))))

(declare-fun b!1051168 () Bool)

(declare-fun res!700291 () Bool)

(assert (=> b!1051168 (=> (not res!700291) (not e!596636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051168 (= res!700291 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051169 () Bool)

(declare-fun res!700287 () Bool)

(assert (=> b!1051169 (=> (not res!700287) (not e!596636))))

(assert (=> b!1051169 (= res!700287 (= (select (arr!31865 a!3488) i!1381) k0!2747))))

(assert (= (and start!92450 res!700288) b!1051161))

(assert (= (and b!1051161 res!700290) b!1051168))

(assert (= (and b!1051168 res!700291) b!1051169))

(assert (= (and b!1051169 res!700287) b!1051167))

(assert (= (and b!1051167 res!700289) b!1051162))

(assert (= (and b!1051162 res!700292) b!1051164))

(assert (= (and b!1051164 res!700294) b!1051166))

(assert (= (and b!1051166 (not res!700295)) b!1051163))

(assert (= (and b!1051164 (not res!700293)) b!1051165))

(declare-fun m!971715 () Bool)

(assert (=> b!1051165 m!971715))

(declare-fun m!971717 () Bool)

(assert (=> b!1051165 m!971717))

(declare-fun m!971719 () Bool)

(assert (=> b!1051163 m!971719))

(declare-fun m!971721 () Bool)

(assert (=> start!92450 m!971721))

(declare-fun m!971723 () Bool)

(assert (=> b!1051168 m!971723))

(declare-fun m!971725 () Bool)

(assert (=> b!1051169 m!971725))

(declare-fun m!971727 () Bool)

(assert (=> b!1051167 m!971727))

(declare-fun m!971729 () Bool)

(assert (=> b!1051167 m!971729))

(declare-fun m!971731 () Bool)

(assert (=> b!1051161 m!971731))

(assert (=> b!1051164 m!971729))

(declare-fun m!971733 () Bool)

(assert (=> b!1051164 m!971733))

(declare-fun m!971735 () Bool)

(assert (=> b!1051162 m!971735))

(check-sat (not b!1051163) (not b!1051167) (not b!1051161) (not b!1051162) (not b!1051165) (not b!1051168) (not start!92450))
(check-sat)
