; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93700 () Bool)

(assert start!93700)

(declare-fun b!1060003 () Bool)

(declare-fun res!707774 () Bool)

(declare-fun e!603175 () Bool)

(assert (=> b!1060003 (=> (not res!707774) (not e!603175))))

(declare-datatypes ((array!66818 0))(
  ( (array!66819 (arr!32121 (Array (_ BitVec 32) (_ BitVec 64))) (size!32658 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66818)

(declare-datatypes ((List!22403 0))(
  ( (Nil!22400) (Cons!22399 (h!23617 (_ BitVec 64)) (t!31702 List!22403)) )
))
(declare-fun arrayNoDuplicates!0 (array!66818 (_ BitVec 32) List!22403) Bool)

(assert (=> b!1060003 (= res!707774 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22400))))

(declare-fun b!1060004 () Bool)

(declare-fun e!603173 () Bool)

(declare-fun lt!467537 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1060004 (= e!603173 (not (or (bvsgt lt!467537 i!1381) (bvsgt i!1381 lt!467537))))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1060004 (= (select (store (arr!32121 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467537) k!2747)))

(declare-fun b!1060005 () Bool)

(declare-fun res!707772 () Bool)

(assert (=> b!1060005 (=> (not res!707772) (not e!603175))))

(assert (=> b!1060005 (= res!707772 (= (select (arr!32121 a!3488) i!1381) k!2747))))

(declare-fun b!1060006 () Bool)

(declare-fun res!707777 () Bool)

(assert (=> b!1060006 (=> (not res!707777) (not e!603175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1060006 (= res!707777 (validKeyInArray!0 k!2747))))

(declare-fun res!707775 () Bool)

(assert (=> start!93700 (=> (not res!707775) (not e!603175))))

(assert (=> start!93700 (= res!707775 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32658 a!3488)) (bvslt (size!32658 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93700 e!603175))

(assert (=> start!93700 true))

(declare-fun array_inv!24903 (array!66818) Bool)

(assert (=> start!93700 (array_inv!24903 a!3488)))

(declare-fun b!1060007 () Bool)

(declare-fun e!603174 () Bool)

(assert (=> b!1060007 (= e!603174 e!603173)))

(declare-fun res!707773 () Bool)

(assert (=> b!1060007 (=> (not res!707773) (not e!603173))))

(assert (=> b!1060007 (= res!707773 (not (= lt!467537 i!1381)))))

(declare-fun lt!467536 () array!66818)

(declare-fun arrayScanForKey!0 (array!66818 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1060007 (= lt!467537 (arrayScanForKey!0 lt!467536 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1060008 () Bool)

(assert (=> b!1060008 (= e!603175 e!603174)))

(declare-fun res!707776 () Bool)

(assert (=> b!1060008 (=> (not res!707776) (not e!603174))))

(declare-fun arrayContainsKey!0 (array!66818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060008 (= res!707776 (arrayContainsKey!0 lt!467536 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1060008 (= lt!467536 (array!66819 (store (arr!32121 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32658 a!3488)))))

(assert (= (and start!93700 res!707775) b!1060003))

(assert (= (and b!1060003 res!707774) b!1060006))

(assert (= (and b!1060006 res!707777) b!1060005))

(assert (= (and b!1060005 res!707772) b!1060008))

(assert (= (and b!1060008 res!707776) b!1060007))

(assert (= (and b!1060007 res!707773) b!1060004))

(declare-fun m!980005 () Bool)

(assert (=> b!1060006 m!980005))

(declare-fun m!980007 () Bool)

(assert (=> b!1060007 m!980007))

(declare-fun m!980009 () Bool)

(assert (=> start!93700 m!980009))

(declare-fun m!980011 () Bool)

(assert (=> b!1060003 m!980011))

(declare-fun m!980013 () Bool)

(assert (=> b!1060008 m!980013))

(declare-fun m!980015 () Bool)

(assert (=> b!1060008 m!980015))

(assert (=> b!1060004 m!980015))

(declare-fun m!980017 () Bool)

(assert (=> b!1060004 m!980017))

(declare-fun m!980019 () Bool)

(assert (=> b!1060005 m!980019))

(push 1)

(assert (not b!1060006))

(assert (not b!1060003))

(assert (not b!1060008))

(assert (not start!93700))

(assert (not b!1060007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

