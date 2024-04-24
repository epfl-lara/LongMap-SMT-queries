; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92496 () Bool)

(assert start!92496)

(declare-fun b!1049855 () Bool)

(declare-fun e!595584 () Bool)

(declare-fun e!595585 () Bool)

(assert (=> b!1049855 (= e!595584 e!595585)))

(declare-fun res!698181 () Bool)

(assert (=> b!1049855 (=> res!698181 e!595585)))

(declare-fun lt!463739 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049855 (= res!698181 (bvsle lt!463739 i!1381))))

(declare-fun b!1049856 () Bool)

(declare-fun res!698182 () Bool)

(declare-fun e!595583 () Bool)

(assert (=> b!1049856 (=> (not res!698182) (not e!595583))))

(declare-datatypes ((array!66112 0))(
  ( (array!66113 (arr!31789 (Array (_ BitVec 32) (_ BitVec 64))) (size!32326 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66112)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1049856 (= res!698182 (= (select (arr!31789 a!3488) i!1381) k0!2747))))

(declare-fun res!698178 () Bool)

(assert (=> start!92496 (=> (not res!698178) (not e!595583))))

(assert (=> start!92496 (= res!698178 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32326 a!3488)) (bvslt (size!32326 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92496 e!595583))

(assert (=> start!92496 true))

(declare-fun array_inv!24571 (array!66112) Bool)

(assert (=> start!92496 (array_inv!24571 a!3488)))

(declare-fun b!1049857 () Bool)

(declare-fun res!698177 () Bool)

(assert (=> b!1049857 (=> (not res!698177) (not e!595583))))

(declare-datatypes ((List!22071 0))(
  ( (Nil!22068) (Cons!22067 (h!23285 (_ BitVec 64)) (t!31370 List!22071)) )
))
(declare-fun arrayNoDuplicates!0 (array!66112 (_ BitVec 32) List!22071) Bool)

(assert (=> b!1049857 (= res!698177 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22068))))

(declare-fun b!1049858 () Bool)

(declare-fun arrayContainsKey!0 (array!66112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049858 (= e!595585 (arrayContainsKey!0 a!3488 k0!2747 lt!463739))))

(declare-fun b!1049859 () Bool)

(declare-fun res!698183 () Bool)

(assert (=> b!1049859 (=> (not res!698183) (not e!595583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049859 (= res!698183 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049860 () Bool)

(declare-fun e!595581 () Bool)

(declare-fun e!595582 () Bool)

(assert (=> b!1049860 (= e!595581 e!595582)))

(declare-fun res!698179 () Bool)

(assert (=> b!1049860 (=> (not res!698179) (not e!595582))))

(assert (=> b!1049860 (= res!698179 (not (= lt!463739 i!1381)))))

(declare-fun lt!463738 () array!66112)

(declare-fun arrayScanForKey!0 (array!66112 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049860 (= lt!463739 (arrayScanForKey!0 lt!463738 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049861 () Bool)

(assert (=> b!1049861 (= e!595582 (not true))))

(assert (=> b!1049861 e!595584))

(declare-fun res!698176 () Bool)

(assert (=> b!1049861 (=> (not res!698176) (not e!595584))))

(assert (=> b!1049861 (= res!698176 (= (select (store (arr!31789 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463739) k0!2747))))

(declare-fun b!1049862 () Bool)

(assert (=> b!1049862 (= e!595583 e!595581)))

(declare-fun res!698180 () Bool)

(assert (=> b!1049862 (=> (not res!698180) (not e!595581))))

(assert (=> b!1049862 (= res!698180 (arrayContainsKey!0 lt!463738 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049862 (= lt!463738 (array!66113 (store (arr!31789 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32326 a!3488)))))

(assert (= (and start!92496 res!698178) b!1049857))

(assert (= (and b!1049857 res!698177) b!1049859))

(assert (= (and b!1049859 res!698183) b!1049856))

(assert (= (and b!1049856 res!698182) b!1049862))

(assert (= (and b!1049862 res!698180) b!1049860))

(assert (= (and b!1049860 res!698179) b!1049861))

(assert (= (and b!1049861 res!698176) b!1049855))

(assert (= (and b!1049855 (not res!698181)) b!1049858))

(declare-fun m!971153 () Bool)

(assert (=> b!1049859 m!971153))

(declare-fun m!971155 () Bool)

(assert (=> b!1049857 m!971155))

(declare-fun m!971157 () Bool)

(assert (=> start!92496 m!971157))

(declare-fun m!971159 () Bool)

(assert (=> b!1049862 m!971159))

(declare-fun m!971161 () Bool)

(assert (=> b!1049862 m!971161))

(declare-fun m!971163 () Bool)

(assert (=> b!1049860 m!971163))

(declare-fun m!971165 () Bool)

(assert (=> b!1049858 m!971165))

(assert (=> b!1049861 m!971161))

(declare-fun m!971167 () Bool)

(assert (=> b!1049861 m!971167))

(declare-fun m!971169 () Bool)

(assert (=> b!1049856 m!971169))

(check-sat (not start!92496) (not b!1049859) (not b!1049860) (not b!1049858) (not b!1049862) (not b!1049857))
(check-sat)
