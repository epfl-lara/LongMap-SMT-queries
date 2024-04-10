; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92552 () Bool)

(assert start!92552)

(declare-fun b!1052766 () Bool)

(declare-fun res!701895 () Bool)

(declare-fun e!597770 () Bool)

(assert (=> b!1052766 (=> (not res!701895) (not e!597770))))

(declare-datatypes ((array!66353 0))(
  ( (array!66354 (arr!31916 (Array (_ BitVec 32) (_ BitVec 64))) (size!32452 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66353)

(declare-datatypes ((List!22228 0))(
  ( (Nil!22225) (Cons!22224 (h!23433 (_ BitVec 64)) (t!31535 List!22228)) )
))
(declare-fun arrayNoDuplicates!0 (array!66353 (_ BitVec 32) List!22228) Bool)

(assert (=> b!1052766 (= res!701895 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22225))))

(declare-fun b!1052767 () Bool)

(declare-fun res!701897 () Bool)

(assert (=> b!1052767 (=> (not res!701897) (not e!597770))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052767 (= res!701897 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052768 () Bool)

(declare-fun res!701894 () Bool)

(assert (=> b!1052768 (=> (not res!701894) (not e!597770))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052768 (= res!701894 (= (select (arr!31916 a!3488) i!1381) k0!2747))))

(declare-fun res!701892 () Bool)

(assert (=> start!92552 (=> (not res!701892) (not e!597770))))

(assert (=> start!92552 (= res!701892 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32452 a!3488)) (bvslt (size!32452 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92552 e!597770))

(assert (=> start!92552 true))

(declare-fun array_inv!24696 (array!66353) Bool)

(assert (=> start!92552 (array_inv!24696 a!3488)))

(declare-fun b!1052769 () Bool)

(declare-fun e!597771 () Bool)

(declare-fun e!597772 () Bool)

(assert (=> b!1052769 (= e!597771 e!597772)))

(declare-fun res!701896 () Bool)

(assert (=> b!1052769 (=> (not res!701896) (not e!597772))))

(declare-fun lt!464958 () (_ BitVec 32))

(assert (=> b!1052769 (= res!701896 (not (= lt!464958 i!1381)))))

(declare-fun lt!464957 () array!66353)

(declare-fun arrayScanForKey!0 (array!66353 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052769 (= lt!464958 (arrayScanForKey!0 lt!464957 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052770 () Bool)

(assert (=> b!1052770 (= e!597772 (not true))))

(assert (=> b!1052770 (= (select (store (arr!31916 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464958) k0!2747)))

(declare-fun b!1052771 () Bool)

(assert (=> b!1052771 (= e!597770 e!597771)))

(declare-fun res!701893 () Bool)

(assert (=> b!1052771 (=> (not res!701893) (not e!597771))))

(declare-fun arrayContainsKey!0 (array!66353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052771 (= res!701893 (arrayContainsKey!0 lt!464957 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052771 (= lt!464957 (array!66354 (store (arr!31916 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32452 a!3488)))))

(assert (= (and start!92552 res!701892) b!1052766))

(assert (= (and b!1052766 res!701895) b!1052767))

(assert (= (and b!1052767 res!701897) b!1052768))

(assert (= (and b!1052768 res!701894) b!1052771))

(assert (= (and b!1052771 res!701893) b!1052769))

(assert (= (and b!1052769 res!701896) b!1052770))

(declare-fun m!973173 () Bool)

(assert (=> b!1052769 m!973173))

(declare-fun m!973175 () Bool)

(assert (=> b!1052766 m!973175))

(declare-fun m!973177 () Bool)

(assert (=> b!1052768 m!973177))

(declare-fun m!973179 () Bool)

(assert (=> b!1052767 m!973179))

(declare-fun m!973181 () Bool)

(assert (=> b!1052770 m!973181))

(declare-fun m!973183 () Bool)

(assert (=> b!1052770 m!973183))

(declare-fun m!973185 () Bool)

(assert (=> start!92552 m!973185))

(declare-fun m!973187 () Bool)

(assert (=> b!1052771 m!973187))

(assert (=> b!1052771 m!973181))

(check-sat (not start!92552) (not b!1052767) (not b!1052766) (not b!1052771) (not b!1052769))
(check-sat)
