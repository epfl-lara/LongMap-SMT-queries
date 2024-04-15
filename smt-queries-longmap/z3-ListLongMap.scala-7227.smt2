; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92422 () Bool)

(assert start!92422)

(declare-fun b!1050684 () Bool)

(declare-fun res!699900 () Bool)

(declare-fun e!596295 () Bool)

(assert (=> b!1050684 (=> (not res!699900) (not e!596295))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050684 (= res!699900 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050685 () Bool)

(declare-fun e!596296 () Bool)

(declare-fun e!596297 () Bool)

(assert (=> b!1050685 (= e!596296 e!596297)))

(declare-fun res!699897 () Bool)

(assert (=> b!1050685 (=> (not res!699897) (not e!596297))))

(declare-fun lt!463887 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050685 (= res!699897 (not (= lt!463887 i!1381)))))

(declare-datatypes ((array!66164 0))(
  ( (array!66165 (arr!31821 (Array (_ BitVec 32) (_ BitVec 64))) (size!32359 (_ BitVec 32))) )
))
(declare-fun lt!463888 () array!66164)

(declare-fun arrayScanForKey!0 (array!66164 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050685 (= lt!463887 (arrayScanForKey!0 lt!463888 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050686 () Bool)

(assert (=> b!1050686 (= e!596297 (not true))))

(declare-fun e!596294 () Bool)

(assert (=> b!1050686 e!596294))

(declare-fun res!699894 () Bool)

(assert (=> b!1050686 (=> (not res!699894) (not e!596294))))

(declare-fun a!3488 () array!66164)

(assert (=> b!1050686 (= res!699894 (= (select (store (arr!31821 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463887) k0!2747))))

(declare-fun res!699896 () Bool)

(assert (=> start!92422 (=> (not res!699896) (not e!596295))))

(assert (=> start!92422 (= res!699896 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32359 a!3488)) (bvslt (size!32359 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92422 e!596295))

(assert (=> start!92422 true))

(declare-fun array_inv!24604 (array!66164) Bool)

(assert (=> start!92422 (array_inv!24604 a!3488)))

(declare-fun b!1050687 () Bool)

(declare-fun res!699901 () Bool)

(assert (=> b!1050687 (=> (not res!699901) (not e!596295))))

(declare-datatypes ((List!22192 0))(
  ( (Nil!22189) (Cons!22188 (h!23397 (_ BitVec 64)) (t!31490 List!22192)) )
))
(declare-fun arrayNoDuplicates!0 (array!66164 (_ BitVec 32) List!22192) Bool)

(assert (=> b!1050687 (= res!699901 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22189))))

(declare-fun b!1050688 () Bool)

(assert (=> b!1050688 (= e!596295 e!596296)))

(declare-fun res!699899 () Bool)

(assert (=> b!1050688 (=> (not res!699899) (not e!596296))))

(declare-fun arrayContainsKey!0 (array!66164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050688 (= res!699899 (arrayContainsKey!0 lt!463888 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050688 (= lt!463888 (array!66165 (store (arr!31821 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32359 a!3488)))))

(declare-fun b!1050689 () Bool)

(declare-fun e!596293 () Bool)

(assert (=> b!1050689 (= e!596293 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050690 () Bool)

(assert (=> b!1050690 (= e!596294 e!596293)))

(declare-fun res!699895 () Bool)

(assert (=> b!1050690 (=> res!699895 e!596293)))

(assert (=> b!1050690 (= res!699895 (or (bvsgt lt!463887 i!1381) (bvsle i!1381 lt!463887)))))

(declare-fun b!1050691 () Bool)

(declare-fun res!699898 () Bool)

(assert (=> b!1050691 (=> (not res!699898) (not e!596295))))

(assert (=> b!1050691 (= res!699898 (= (select (arr!31821 a!3488) i!1381) k0!2747))))

(assert (= (and start!92422 res!699896) b!1050687))

(assert (= (and b!1050687 res!699901) b!1050684))

(assert (= (and b!1050684 res!699900) b!1050691))

(assert (= (and b!1050691 res!699898) b!1050688))

(assert (= (and b!1050688 res!699899) b!1050685))

(assert (= (and b!1050685 res!699897) b!1050686))

(assert (= (and b!1050686 res!699894) b!1050690))

(assert (= (and b!1050690 (not res!699895)) b!1050689))

(declare-fun m!970849 () Bool)

(assert (=> b!1050686 m!970849))

(declare-fun m!970851 () Bool)

(assert (=> b!1050686 m!970851))

(declare-fun m!970853 () Bool)

(assert (=> b!1050689 m!970853))

(declare-fun m!970855 () Bool)

(assert (=> b!1050685 m!970855))

(declare-fun m!970857 () Bool)

(assert (=> b!1050691 m!970857))

(declare-fun m!970859 () Bool)

(assert (=> start!92422 m!970859))

(declare-fun m!970861 () Bool)

(assert (=> b!1050688 m!970861))

(assert (=> b!1050688 m!970849))

(declare-fun m!970863 () Bool)

(assert (=> b!1050684 m!970863))

(declare-fun m!970865 () Bool)

(assert (=> b!1050687 m!970865))

(check-sat (not b!1050687) (not b!1050684) (not b!1050689) (not b!1050688) (not start!92422) (not b!1050685))
(check-sat)
