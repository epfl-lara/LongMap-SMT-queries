; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92834 () Bool)

(assert start!92834)

(declare-fun b!1054230 () Bool)

(declare-fun e!598894 () Bool)

(declare-fun e!598889 () Bool)

(assert (=> b!1054230 (= e!598894 e!598889)))

(declare-fun res!703176 () Bool)

(assert (=> b!1054230 (=> (not res!703176) (not e!598889))))

(declare-datatypes ((array!66494 0))(
  ( (array!66495 (arr!31979 (Array (_ BitVec 32) (_ BitVec 64))) (size!32515 (_ BitVec 32))) )
))
(declare-fun lt!465341 () array!66494)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054230 (= res!703176 (arrayContainsKey!0 lt!465341 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66494)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054230 (= lt!465341 (array!66495 (store (arr!31979 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32515 a!3488)))))

(declare-fun res!703170 () Bool)

(assert (=> start!92834 (=> (not res!703170) (not e!598894))))

(assert (=> start!92834 (= res!703170 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32515 a!3488)) (bvslt (size!32515 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92834 e!598894))

(assert (=> start!92834 true))

(declare-fun array_inv!24759 (array!66494) Bool)

(assert (=> start!92834 (array_inv!24759 a!3488)))

(declare-fun b!1054231 () Bool)

(declare-fun e!598891 () Bool)

(declare-fun e!598888 () Bool)

(assert (=> b!1054231 (= e!598891 e!598888)))

(declare-fun res!703173 () Bool)

(assert (=> b!1054231 (=> res!703173 e!598888)))

(declare-fun lt!465340 () (_ BitVec 32))

(assert (=> b!1054231 (= res!703173 (bvsle lt!465340 i!1381))))

(declare-fun b!1054232 () Bool)

(declare-fun res!703174 () Bool)

(assert (=> b!1054232 (=> (not res!703174) (not e!598894))))

(declare-datatypes ((List!22291 0))(
  ( (Nil!22288) (Cons!22287 (h!23496 (_ BitVec 64)) (t!31598 List!22291)) )
))
(declare-fun arrayNoDuplicates!0 (array!66494 (_ BitVec 32) List!22291) Bool)

(assert (=> b!1054232 (= res!703174 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22288))))

(declare-fun b!1054233 () Bool)

(declare-fun res!703172 () Bool)

(assert (=> b!1054233 (=> (not res!703172) (not e!598894))))

(assert (=> b!1054233 (= res!703172 (= (select (arr!31979 a!3488) i!1381) k0!2747))))

(declare-fun b!1054234 () Bool)

(declare-fun e!598893 () Bool)

(assert (=> b!1054234 (= e!598893 (or (bvslt lt!465340 #b00000000000000000000000000000000) (bvsge lt!465340 (size!32515 a!3488)) (bvsge (bvadd #b00000000000000000000000000000001 i!1381) #b00000000000000000000000000000000)))))

(assert (=> b!1054234 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22288)))

(declare-datatypes ((Unit!34516 0))(
  ( (Unit!34517) )
))
(declare-fun lt!465342 () Unit!34516)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66494 (_ BitVec 32) (_ BitVec 32)) Unit!34516)

(assert (=> b!1054234 (= lt!465342 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054235 () Bool)

(declare-fun e!598892 () Bool)

(assert (=> b!1054235 (= e!598889 e!598892)))

(declare-fun res!703175 () Bool)

(assert (=> b!1054235 (=> (not res!703175) (not e!598892))))

(assert (=> b!1054235 (= res!703175 (not (= lt!465340 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66494 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054235 (= lt!465340 (arrayScanForKey!0 lt!465341 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054236 () Bool)

(assert (=> b!1054236 (= e!598888 (arrayContainsKey!0 a!3488 k0!2747 lt!465340))))

(declare-fun b!1054237 () Bool)

(declare-fun res!703177 () Bool)

(assert (=> b!1054237 (=> (not res!703177) (not e!598894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054237 (= res!703177 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054238 () Bool)

(assert (=> b!1054238 (= e!598892 (not e!598893))))

(declare-fun res!703178 () Bool)

(assert (=> b!1054238 (=> res!703178 e!598893)))

(assert (=> b!1054238 (= res!703178 (bvsle lt!465340 i!1381))))

(assert (=> b!1054238 e!598891))

(declare-fun res!703171 () Bool)

(assert (=> b!1054238 (=> (not res!703171) (not e!598891))))

(assert (=> b!1054238 (= res!703171 (= (select (store (arr!31979 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465340) k0!2747))))

(assert (= (and start!92834 res!703170) b!1054232))

(assert (= (and b!1054232 res!703174) b!1054237))

(assert (= (and b!1054237 res!703177) b!1054233))

(assert (= (and b!1054233 res!703172) b!1054230))

(assert (= (and b!1054230 res!703176) b!1054235))

(assert (= (and b!1054235 res!703175) b!1054238))

(assert (= (and b!1054238 res!703171) b!1054231))

(assert (= (and b!1054231 (not res!703173)) b!1054236))

(assert (= (and b!1054238 (not res!703178)) b!1054234))

(declare-fun m!974337 () Bool)

(assert (=> b!1054233 m!974337))

(declare-fun m!974339 () Bool)

(assert (=> b!1054230 m!974339))

(declare-fun m!974341 () Bool)

(assert (=> b!1054230 m!974341))

(declare-fun m!974343 () Bool)

(assert (=> b!1054237 m!974343))

(declare-fun m!974345 () Bool)

(assert (=> start!92834 m!974345))

(declare-fun m!974347 () Bool)

(assert (=> b!1054236 m!974347))

(assert (=> b!1054238 m!974341))

(declare-fun m!974349 () Bool)

(assert (=> b!1054238 m!974349))

(declare-fun m!974351 () Bool)

(assert (=> b!1054235 m!974351))

(declare-fun m!974353 () Bool)

(assert (=> b!1054232 m!974353))

(declare-fun m!974355 () Bool)

(assert (=> b!1054234 m!974355))

(declare-fun m!974357 () Bool)

(assert (=> b!1054234 m!974357))

(check-sat (not start!92834) (not b!1054236) (not b!1054234) (not b!1054235) (not b!1054237) (not b!1054230) (not b!1054232))
(check-sat)
