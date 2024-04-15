; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92572 () Bool)

(assert start!92572)

(declare-fun b!1052766 () Bool)

(declare-fun res!701976 () Bool)

(declare-fun e!597788 () Bool)

(assert (=> b!1052766 (=> (not res!701976) (not e!597788))))

(declare-datatypes ((array!66314 0))(
  ( (array!66315 (arr!31896 (Array (_ BitVec 32) (_ BitVec 64))) (size!32434 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66314)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052766 (= res!701976 (= (select (arr!31896 a!3488) i!1381) k0!2747))))

(declare-fun b!1052767 () Bool)

(declare-fun res!701979 () Bool)

(assert (=> b!1052767 (=> (not res!701979) (not e!597788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052767 (= res!701979 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052768 () Bool)

(assert (=> b!1052768 (= e!597788 (bvsge #b00000000000000000000000000000000 (size!32434 a!3488)))))

(declare-fun res!701980 () Bool)

(assert (=> start!92572 (=> (not res!701980) (not e!597788))))

(assert (=> start!92572 (= res!701980 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32434 a!3488)) (bvslt (size!32434 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92572 e!597788))

(assert (=> start!92572 true))

(declare-fun array_inv!24679 (array!66314) Bool)

(assert (=> start!92572 (array_inv!24679 a!3488)))

(declare-fun b!1052769 () Bool)

(declare-fun res!701978 () Bool)

(assert (=> b!1052769 (=> (not res!701978) (not e!597788))))

(declare-datatypes ((List!22267 0))(
  ( (Nil!22264) (Cons!22263 (h!23472 (_ BitVec 64)) (t!31565 List!22267)) )
))
(declare-fun arrayNoDuplicates!0 (array!66314 (_ BitVec 32) List!22267) Bool)

(assert (=> b!1052769 (= res!701978 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22264))))

(declare-fun b!1052770 () Bool)

(declare-fun res!701977 () Bool)

(assert (=> b!1052770 (=> (not res!701977) (not e!597788))))

(declare-fun arrayContainsKey!0 (array!66314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052770 (= res!701977 (not (arrayContainsKey!0 (array!66315 (store (arr!31896 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32434 a!3488)) k0!2747 #b00000000000000000000000000000000)))))

(assert (= (and start!92572 res!701980) b!1052769))

(assert (= (and b!1052769 res!701978) b!1052767))

(assert (= (and b!1052767 res!701979) b!1052766))

(assert (= (and b!1052766 res!701976) b!1052770))

(assert (= (and b!1052770 res!701977) b!1052768))

(declare-fun m!972697 () Bool)

(assert (=> start!92572 m!972697))

(declare-fun m!972699 () Bool)

(assert (=> b!1052769 m!972699))

(declare-fun m!972701 () Bool)

(assert (=> b!1052770 m!972701))

(declare-fun m!972703 () Bool)

(assert (=> b!1052770 m!972703))

(declare-fun m!972705 () Bool)

(assert (=> b!1052766 m!972705))

(declare-fun m!972707 () Bool)

(assert (=> b!1052767 m!972707))

(check-sat (not b!1052769) (not b!1052770) (not start!92572) (not b!1052767))
(check-sat)
