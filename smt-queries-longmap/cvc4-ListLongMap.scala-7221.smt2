; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92392 () Bool)

(assert start!92392)

(declare-fun b!1050504 () Bool)

(declare-fun e!596150 () Bool)

(declare-fun e!596153 () Bool)

(assert (=> b!1050504 (= e!596150 (not e!596153))))

(declare-fun res!699630 () Bool)

(assert (=> b!1050504 (=> res!699630 e!596153)))

(declare-fun lt!463991 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050504 (= res!699630 (bvsle lt!463991 i!1381))))

(declare-fun e!596155 () Bool)

(assert (=> b!1050504 e!596155))

(declare-fun res!699634 () Bool)

(assert (=> b!1050504 (=> (not res!699634) (not e!596155))))

(declare-datatypes ((array!66193 0))(
  ( (array!66194 (arr!31836 (Array (_ BitVec 32) (_ BitVec 64))) (size!32372 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66193)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1050504 (= res!699634 (= (select (store (arr!31836 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463991) k!2747))))

(declare-fun b!1050505 () Bool)

(declare-fun res!699637 () Bool)

(declare-fun e!596149 () Bool)

(assert (=> b!1050505 (=> (not res!699637) (not e!596149))))

(declare-datatypes ((List!22148 0))(
  ( (Nil!22145) (Cons!22144 (h!23353 (_ BitVec 64)) (t!31455 List!22148)) )
))
(declare-fun arrayNoDuplicates!0 (array!66193 (_ BitVec 32) List!22148) Bool)

(assert (=> b!1050505 (= res!699637 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22145))))

(declare-fun b!1050506 () Bool)

(declare-fun e!596152 () Bool)

(assert (=> b!1050506 (= e!596152 e!596150)))

(declare-fun res!699632 () Bool)

(assert (=> b!1050506 (=> (not res!699632) (not e!596150))))

(assert (=> b!1050506 (= res!699632 (not (= lt!463991 i!1381)))))

(declare-fun lt!463990 () array!66193)

(declare-fun arrayScanForKey!0 (array!66193 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050506 (= lt!463991 (arrayScanForKey!0 lt!463990 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050507 () Bool)

(assert (=> b!1050507 (= e!596149 e!596152)))

(declare-fun res!699633 () Bool)

(assert (=> b!1050507 (=> (not res!699633) (not e!596152))))

(declare-fun arrayContainsKey!0 (array!66193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050507 (= res!699633 (arrayContainsKey!0 lt!463990 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050507 (= lt!463990 (array!66194 (store (arr!31836 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32372 a!3488)))))

(declare-fun b!1050508 () Bool)

(declare-fun e!596154 () Bool)

(assert (=> b!1050508 (= e!596155 e!596154)))

(declare-fun res!699636 () Bool)

(assert (=> b!1050508 (=> res!699636 e!596154)))

(assert (=> b!1050508 (= res!699636 (bvsle lt!463991 i!1381))))

(declare-fun b!1050510 () Bool)

(assert (=> b!1050510 (= e!596154 (arrayContainsKey!0 a!3488 k!2747 lt!463991))))

(declare-fun b!1050511 () Bool)

(declare-fun res!699638 () Bool)

(assert (=> b!1050511 (=> (not res!699638) (not e!596149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050511 (= res!699638 (validKeyInArray!0 k!2747))))

(declare-fun b!1050512 () Bool)

(declare-fun res!699635 () Bool)

(assert (=> b!1050512 (=> (not res!699635) (not e!596149))))

(assert (=> b!1050512 (= res!699635 (= (select (arr!31836 a!3488) i!1381) k!2747))))

(declare-fun b!1050509 () Bool)

(assert (=> b!1050509 (= e!596153 true)))

(assert (=> b!1050509 false))

(declare-datatypes ((Unit!34392 0))(
  ( (Unit!34393) )
))
(declare-fun lt!463989 () Unit!34392)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66193 (_ BitVec 64) (_ BitVec 32) List!22148) Unit!34392)

(assert (=> b!1050509 (= lt!463989 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22145))))

(assert (=> b!1050509 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463992 () Unit!34392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66193 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34392)

(assert (=> b!1050509 (= lt!463992 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463991 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050509 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22145)))

(declare-fun lt!463988 () Unit!34392)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66193 (_ BitVec 32) (_ BitVec 32)) Unit!34392)

(assert (=> b!1050509 (= lt!463988 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!699631 () Bool)

(assert (=> start!92392 (=> (not res!699631) (not e!596149))))

(assert (=> start!92392 (= res!699631 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32372 a!3488)) (bvslt (size!32372 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92392 e!596149))

(assert (=> start!92392 true))

(declare-fun array_inv!24616 (array!66193) Bool)

(assert (=> start!92392 (array_inv!24616 a!3488)))

(assert (= (and start!92392 res!699631) b!1050505))

(assert (= (and b!1050505 res!699637) b!1050511))

(assert (= (and b!1050511 res!699638) b!1050512))

(assert (= (and b!1050512 res!699635) b!1050507))

(assert (= (and b!1050507 res!699633) b!1050506))

(assert (= (and b!1050506 res!699632) b!1050504))

(assert (= (and b!1050504 res!699634) b!1050508))

(assert (= (and b!1050508 (not res!699636)) b!1050510))

(assert (= (and b!1050504 (not res!699630)) b!1050509))

(declare-fun m!971185 () Bool)

(assert (=> b!1050511 m!971185))

(declare-fun m!971187 () Bool)

(assert (=> start!92392 m!971187))

(declare-fun m!971189 () Bool)

(assert (=> b!1050509 m!971189))

(declare-fun m!971191 () Bool)

(assert (=> b!1050509 m!971191))

(declare-fun m!971193 () Bool)

(assert (=> b!1050509 m!971193))

(declare-fun m!971195 () Bool)

(assert (=> b!1050509 m!971195))

(declare-fun m!971197 () Bool)

(assert (=> b!1050509 m!971197))

(declare-fun m!971199 () Bool)

(assert (=> b!1050505 m!971199))

(declare-fun m!971201 () Bool)

(assert (=> b!1050506 m!971201))

(declare-fun m!971203 () Bool)

(assert (=> b!1050512 m!971203))

(declare-fun m!971205 () Bool)

(assert (=> b!1050510 m!971205))

(declare-fun m!971207 () Bool)

(assert (=> b!1050504 m!971207))

(declare-fun m!971209 () Bool)

(assert (=> b!1050504 m!971209))

(declare-fun m!971211 () Bool)

(assert (=> b!1050507 m!971211))

(assert (=> b!1050507 m!971207))

(push 1)

(assert (not b!1050510))

(assert (not b!1050509))

(assert (not b!1050511))

(assert (not b!1050507))

(assert (not b!1050505))

(assert (not b!1050506))

(assert (not start!92392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

