; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92404 () Bool)

(assert start!92404)

(declare-fun b!1050482 () Bool)

(declare-fun e!596145 () Bool)

(assert (=> b!1050482 (= e!596145 (not true))))

(declare-fun lt!463834 () (_ BitVec 32))

(declare-datatypes ((array!66146 0))(
  ( (array!66147 (arr!31812 (Array (_ BitVec 32) (_ BitVec 64))) (size!32350 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66146)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050482 (= (select (store (arr!31812 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463834) k0!2747)))

(declare-fun b!1050483 () Bool)

(declare-fun res!699694 () Bool)

(declare-fun e!596148 () Bool)

(assert (=> b!1050483 (=> (not res!699694) (not e!596148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050483 (= res!699694 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050484 () Bool)

(declare-fun e!596147 () Bool)

(assert (=> b!1050484 (= e!596147 e!596145)))

(declare-fun res!699692 () Bool)

(assert (=> b!1050484 (=> (not res!699692) (not e!596145))))

(assert (=> b!1050484 (= res!699692 (not (= lt!463834 i!1381)))))

(declare-fun lt!463833 () array!66146)

(declare-fun arrayScanForKey!0 (array!66146 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050484 (= lt!463834 (arrayScanForKey!0 lt!463833 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050485 () Bool)

(declare-fun res!699693 () Bool)

(assert (=> b!1050485 (=> (not res!699693) (not e!596148))))

(declare-datatypes ((List!22183 0))(
  ( (Nil!22180) (Cons!22179 (h!23388 (_ BitVec 64)) (t!31481 List!22183)) )
))
(declare-fun arrayNoDuplicates!0 (array!66146 (_ BitVec 32) List!22183) Bool)

(assert (=> b!1050485 (= res!699693 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22180))))

(declare-fun res!699696 () Bool)

(assert (=> start!92404 (=> (not res!699696) (not e!596148))))

(assert (=> start!92404 (= res!699696 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32350 a!3488)) (bvslt (size!32350 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92404 e!596148))

(assert (=> start!92404 true))

(declare-fun array_inv!24595 (array!66146) Bool)

(assert (=> start!92404 (array_inv!24595 a!3488)))

(declare-fun b!1050486 () Bool)

(declare-fun res!699695 () Bool)

(assert (=> b!1050486 (=> (not res!699695) (not e!596148))))

(assert (=> b!1050486 (= res!699695 (= (select (arr!31812 a!3488) i!1381) k0!2747))))

(declare-fun b!1050487 () Bool)

(assert (=> b!1050487 (= e!596148 e!596147)))

(declare-fun res!699697 () Bool)

(assert (=> b!1050487 (=> (not res!699697) (not e!596147))))

(declare-fun arrayContainsKey!0 (array!66146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050487 (= res!699697 (arrayContainsKey!0 lt!463833 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050487 (= lt!463833 (array!66147 (store (arr!31812 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32350 a!3488)))))

(assert (= (and start!92404 res!699696) b!1050485))

(assert (= (and b!1050485 res!699693) b!1050483))

(assert (= (and b!1050483 res!699694) b!1050486))

(assert (= (and b!1050486 res!699695) b!1050487))

(assert (= (and b!1050487 res!699697) b!1050484))

(assert (= (and b!1050484 res!699692) b!1050482))

(declare-fun m!970693 () Bool)

(assert (=> b!1050482 m!970693))

(declare-fun m!970695 () Bool)

(assert (=> b!1050482 m!970695))

(declare-fun m!970697 () Bool)

(assert (=> start!92404 m!970697))

(declare-fun m!970699 () Bool)

(assert (=> b!1050486 m!970699))

(declare-fun m!970701 () Bool)

(assert (=> b!1050483 m!970701))

(declare-fun m!970703 () Bool)

(assert (=> b!1050485 m!970703))

(declare-fun m!970705 () Bool)

(assert (=> b!1050487 m!970705))

(assert (=> b!1050487 m!970693))

(declare-fun m!970707 () Bool)

(assert (=> b!1050484 m!970707))

(check-sat (not b!1050487) (not b!1050483) (not b!1050485) (not b!1050484) (not start!92404))
(check-sat)
