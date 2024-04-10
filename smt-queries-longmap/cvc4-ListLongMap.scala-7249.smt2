; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92560 () Bool)

(assert start!92560)

(declare-fun b!1052838 () Bool)

(declare-fun res!701967 () Bool)

(declare-fun e!597820 () Bool)

(assert (=> b!1052838 (=> (not res!701967) (not e!597820))))

(declare-datatypes ((array!66361 0))(
  ( (array!66362 (arr!31920 (Array (_ BitVec 32) (_ BitVec 64))) (size!32456 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66361)

(declare-datatypes ((List!22232 0))(
  ( (Nil!22229) (Cons!22228 (h!23437 (_ BitVec 64)) (t!31539 List!22232)) )
))
(declare-fun arrayNoDuplicates!0 (array!66361 (_ BitVec 32) List!22232) Bool)

(assert (=> b!1052838 (= res!701967 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22229))))

(declare-fun b!1052839 () Bool)

(declare-fun e!597817 () Bool)

(declare-fun e!597819 () Bool)

(assert (=> b!1052839 (= e!597817 e!597819)))

(declare-fun res!701968 () Bool)

(assert (=> b!1052839 (=> (not res!701968) (not e!597819))))

(declare-fun lt!464982 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052839 (= res!701968 (not (= lt!464982 i!1381)))))

(declare-fun lt!464981 () array!66361)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66361 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052839 (= lt!464982 (arrayScanForKey!0 lt!464981 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052840 () Bool)

(declare-fun res!701964 () Bool)

(assert (=> b!1052840 (=> (not res!701964) (not e!597820))))

(assert (=> b!1052840 (= res!701964 (= (select (arr!31920 a!3488) i!1381) k!2747))))

(declare-fun b!1052841 () Bool)

(declare-fun res!701966 () Bool)

(assert (=> b!1052841 (=> (not res!701966) (not e!597820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052841 (= res!701966 (validKeyInArray!0 k!2747))))

(declare-fun res!701965 () Bool)

(assert (=> start!92560 (=> (not res!701965) (not e!597820))))

(assert (=> start!92560 (= res!701965 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32456 a!3488)) (bvslt (size!32456 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92560 e!597820))

(assert (=> start!92560 true))

(declare-fun array_inv!24700 (array!66361) Bool)

(assert (=> start!92560 (array_inv!24700 a!3488)))

(declare-fun b!1052842 () Bool)

(assert (=> b!1052842 (= e!597820 e!597817)))

(declare-fun res!701969 () Bool)

(assert (=> b!1052842 (=> (not res!701969) (not e!597817))))

(declare-fun arrayContainsKey!0 (array!66361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052842 (= res!701969 (arrayContainsKey!0 lt!464981 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052842 (= lt!464981 (array!66362 (store (arr!31920 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32456 a!3488)))))

(declare-fun b!1052843 () Bool)

(assert (=> b!1052843 (= e!597819 (not (or (bvsgt lt!464982 i!1381) (bvsgt i!1381 lt!464982) (bvslt #b00000000000000000000000000000000 (size!32456 a!3488)))))))

(assert (=> b!1052843 (= (select (store (arr!31920 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464982) k!2747)))

(assert (= (and start!92560 res!701965) b!1052838))

(assert (= (and b!1052838 res!701967) b!1052841))

(assert (= (and b!1052841 res!701966) b!1052840))

(assert (= (and b!1052840 res!701964) b!1052842))

(assert (= (and b!1052842 res!701969) b!1052839))

(assert (= (and b!1052839 res!701968) b!1052843))

(declare-fun m!973237 () Bool)

(assert (=> b!1052843 m!973237))

(declare-fun m!973239 () Bool)

(assert (=> b!1052843 m!973239))

(declare-fun m!973241 () Bool)

(assert (=> start!92560 m!973241))

(declare-fun m!973243 () Bool)

(assert (=> b!1052842 m!973243))

(assert (=> b!1052842 m!973237))

(declare-fun m!973245 () Bool)

(assert (=> b!1052841 m!973245))

(declare-fun m!973247 () Bool)

(assert (=> b!1052840 m!973247))

(declare-fun m!973249 () Bool)

(assert (=> b!1052839 m!973249))

(declare-fun m!973251 () Bool)

(assert (=> b!1052838 m!973251))

(push 1)

