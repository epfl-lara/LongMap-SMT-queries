; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92282 () Bool)

(assert start!92282)

(declare-fun b!1048780 () Bool)

(declare-fun res!697912 () Bool)

(declare-fun e!594917 () Bool)

(assert (=> b!1048780 (=> (not res!697912) (not e!594917))))

(declare-datatypes ((array!66083 0))(
  ( (array!66084 (arr!31781 (Array (_ BitVec 32) (_ BitVec 64))) (size!32317 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66083)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048780 (= res!697912 (= (select (arr!31781 a!3488) i!1381) k0!2747))))

(declare-fun b!1048781 () Bool)

(declare-fun e!594921 () Bool)

(assert (=> b!1048781 (= e!594917 e!594921)))

(declare-fun res!697911 () Bool)

(assert (=> b!1048781 (=> (not res!697911) (not e!594921))))

(declare-fun lt!463284 () array!66083)

(declare-fun arrayContainsKey!0 (array!66083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048781 (= res!697911 (arrayContainsKey!0 lt!463284 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048781 (= lt!463284 (array!66084 (store (arr!31781 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32317 a!3488)))))

(declare-fun b!1048782 () Bool)

(declare-fun res!697907 () Bool)

(assert (=> b!1048782 (=> (not res!697907) (not e!594917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048782 (= res!697907 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048783 () Bool)

(declare-fun e!594919 () Bool)

(assert (=> b!1048783 (= e!594921 e!594919)))

(declare-fun res!697913 () Bool)

(assert (=> b!1048783 (=> (not res!697913) (not e!594919))))

(declare-fun lt!463283 () (_ BitVec 32))

(assert (=> b!1048783 (= res!697913 (not (= lt!463283 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66083 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048783 (= lt!463283 (arrayScanForKey!0 lt!463284 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048784 () Bool)

(assert (=> b!1048784 (= e!594919 (not true))))

(declare-fun e!594918 () Bool)

(assert (=> b!1048784 e!594918))

(declare-fun res!697910 () Bool)

(assert (=> b!1048784 (=> (not res!697910) (not e!594918))))

(assert (=> b!1048784 (= res!697910 (= (select (store (arr!31781 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463283) k0!2747))))

(declare-fun res!697909 () Bool)

(assert (=> start!92282 (=> (not res!697909) (not e!594917))))

(assert (=> start!92282 (= res!697909 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32317 a!3488)) (bvslt (size!32317 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92282 e!594917))

(assert (=> start!92282 true))

(declare-fun array_inv!24561 (array!66083) Bool)

(assert (=> start!92282 (array_inv!24561 a!3488)))

(declare-fun b!1048785 () Bool)

(declare-fun e!594922 () Bool)

(assert (=> b!1048785 (= e!594918 e!594922)))

(declare-fun res!697906 () Bool)

(assert (=> b!1048785 (=> res!697906 e!594922)))

(assert (=> b!1048785 (= res!697906 (bvsle lt!463283 i!1381))))

(declare-fun b!1048786 () Bool)

(assert (=> b!1048786 (= e!594922 (arrayContainsKey!0 a!3488 k0!2747 lt!463283))))

(declare-fun b!1048787 () Bool)

(declare-fun res!697908 () Bool)

(assert (=> b!1048787 (=> (not res!697908) (not e!594917))))

(declare-datatypes ((List!22093 0))(
  ( (Nil!22090) (Cons!22089 (h!23298 (_ BitVec 64)) (t!31400 List!22093)) )
))
(declare-fun arrayNoDuplicates!0 (array!66083 (_ BitVec 32) List!22093) Bool)

(assert (=> b!1048787 (= res!697908 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22090))))

(assert (= (and start!92282 res!697909) b!1048787))

(assert (= (and b!1048787 res!697908) b!1048782))

(assert (= (and b!1048782 res!697907) b!1048780))

(assert (= (and b!1048780 res!697912) b!1048781))

(assert (= (and b!1048781 res!697911) b!1048783))

(assert (= (and b!1048783 res!697913) b!1048784))

(assert (= (and b!1048784 res!697910) b!1048785))

(assert (= (and b!1048785 (not res!697906)) b!1048786))

(declare-fun m!969665 () Bool)

(assert (=> b!1048786 m!969665))

(declare-fun m!969667 () Bool)

(assert (=> b!1048783 m!969667))

(declare-fun m!969669 () Bool)

(assert (=> b!1048780 m!969669))

(declare-fun m!969671 () Bool)

(assert (=> start!92282 m!969671))

(declare-fun m!969673 () Bool)

(assert (=> b!1048787 m!969673))

(declare-fun m!969675 () Bool)

(assert (=> b!1048784 m!969675))

(declare-fun m!969677 () Bool)

(assert (=> b!1048784 m!969677))

(declare-fun m!969679 () Bool)

(assert (=> b!1048782 m!969679))

(declare-fun m!969681 () Bool)

(assert (=> b!1048781 m!969681))

(assert (=> b!1048781 m!969675))

(check-sat (not b!1048782) (not start!92282) (not b!1048786) (not b!1048783) (not b!1048787) (not b!1048781))
(check-sat)
