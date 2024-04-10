; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92420 () Bool)

(assert start!92420)

(declare-fun b!1050787 () Bool)

(declare-fun res!699920 () Bool)

(declare-fun e!596352 () Bool)

(assert (=> b!1050787 (=> (not res!699920) (not e!596352))))

(declare-datatypes ((array!66221 0))(
  ( (array!66222 (arr!31850 (Array (_ BitVec 32) (_ BitVec 64))) (size!32386 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66221)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050787 (= res!699920 (= (select (arr!31850 a!3488) i!1381) k0!2747))))

(declare-fun b!1050788 () Bool)

(declare-fun e!596349 () Bool)

(assert (=> b!1050788 (= e!596349 (not true))))

(declare-fun e!596350 () Bool)

(assert (=> b!1050788 e!596350))

(declare-fun res!699914 () Bool)

(assert (=> b!1050788 (=> (not res!699914) (not e!596350))))

(declare-fun lt!464076 () (_ BitVec 32))

(assert (=> b!1050788 (= res!699914 (= (select (store (arr!31850 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464076) k0!2747))))

(declare-fun b!1050789 () Bool)

(declare-fun e!596351 () Bool)

(assert (=> b!1050789 (= e!596350 e!596351)))

(declare-fun res!699915 () Bool)

(assert (=> b!1050789 (=> res!699915 e!596351)))

(assert (=> b!1050789 (= res!699915 (or (bvsgt lt!464076 i!1381) (bvsle i!1381 lt!464076)))))

(declare-fun res!699919 () Bool)

(assert (=> start!92420 (=> (not res!699919) (not e!596352))))

(assert (=> start!92420 (= res!699919 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32386 a!3488)) (bvslt (size!32386 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92420 e!596352))

(assert (=> start!92420 true))

(declare-fun array_inv!24630 (array!66221) Bool)

(assert (=> start!92420 (array_inv!24630 a!3488)))

(declare-fun b!1050790 () Bool)

(declare-fun e!596348 () Bool)

(assert (=> b!1050790 (= e!596352 e!596348)))

(declare-fun res!699917 () Bool)

(assert (=> b!1050790 (=> (not res!699917) (not e!596348))))

(declare-fun lt!464075 () array!66221)

(declare-fun arrayContainsKey!0 (array!66221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050790 (= res!699917 (arrayContainsKey!0 lt!464075 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050790 (= lt!464075 (array!66222 (store (arr!31850 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32386 a!3488)))))

(declare-fun b!1050791 () Bool)

(assert (=> b!1050791 (= e!596348 e!596349)))

(declare-fun res!699916 () Bool)

(assert (=> b!1050791 (=> (not res!699916) (not e!596349))))

(assert (=> b!1050791 (= res!699916 (not (= lt!464076 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66221 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050791 (= lt!464076 (arrayScanForKey!0 lt!464075 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050792 () Bool)

(assert (=> b!1050792 (= e!596351 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050793 () Bool)

(declare-fun res!699913 () Bool)

(assert (=> b!1050793 (=> (not res!699913) (not e!596352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050793 (= res!699913 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050794 () Bool)

(declare-fun res!699918 () Bool)

(assert (=> b!1050794 (=> (not res!699918) (not e!596352))))

(declare-datatypes ((List!22162 0))(
  ( (Nil!22159) (Cons!22158 (h!23367 (_ BitVec 64)) (t!31469 List!22162)) )
))
(declare-fun arrayNoDuplicates!0 (array!66221 (_ BitVec 32) List!22162) Bool)

(assert (=> b!1050794 (= res!699918 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22159))))

(assert (= (and start!92420 res!699919) b!1050794))

(assert (= (and b!1050794 res!699918) b!1050793))

(assert (= (and b!1050793 res!699913) b!1050787))

(assert (= (and b!1050787 res!699920) b!1050790))

(assert (= (and b!1050790 res!699917) b!1050791))

(assert (= (and b!1050791 res!699916) b!1050788))

(assert (= (and b!1050788 res!699914) b!1050789))

(assert (= (and b!1050789 (not res!699915)) b!1050792))

(declare-fun m!971429 () Bool)

(assert (=> b!1050794 m!971429))

(declare-fun m!971431 () Bool)

(assert (=> b!1050793 m!971431))

(declare-fun m!971433 () Bool)

(assert (=> b!1050790 m!971433))

(declare-fun m!971435 () Bool)

(assert (=> b!1050790 m!971435))

(declare-fun m!971437 () Bool)

(assert (=> b!1050791 m!971437))

(declare-fun m!971439 () Bool)

(assert (=> start!92420 m!971439))

(declare-fun m!971441 () Bool)

(assert (=> b!1050792 m!971441))

(declare-fun m!971443 () Bool)

(assert (=> b!1050787 m!971443))

(assert (=> b!1050788 m!971435))

(declare-fun m!971445 () Bool)

(assert (=> b!1050788 m!971445))

(check-sat (not b!1050791) (not b!1050792) (not start!92420) (not b!1050790) (not b!1050794) (not b!1050793))
(check-sat)
