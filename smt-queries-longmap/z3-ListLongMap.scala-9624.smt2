; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114106 () Bool)

(assert start!114106)

(declare-fun b!1351826 () Bool)

(declare-fun res!896503 () Bool)

(declare-fun e!769141 () Bool)

(assert (=> b!1351826 (=> (not res!896503) (not e!769141))))

(declare-datatypes ((List!31561 0))(
  ( (Nil!31558) (Cons!31557 (h!32775 (_ BitVec 64)) (t!46211 List!31561)) )
))
(declare-fun acc!759 () List!31561)

(declare-fun contains!9273 (List!31561 (_ BitVec 64)) Bool)

(assert (=> b!1351826 (= res!896503 (not (contains!9273 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351825 () Bool)

(declare-fun res!896505 () Bool)

(assert (=> b!1351825 (=> (not res!896505) (not e!769141))))

(declare-fun noDuplicate!2104 (List!31561) Bool)

(assert (=> b!1351825 (= res!896505 (noDuplicate!2104 acc!759))))

(declare-fun b!1351828 () Bool)

(assert (=> b!1351828 (= e!769141 false)))

(declare-fun lt!597462 () Bool)

(declare-datatypes ((array!92179 0))(
  ( (array!92180 (arr!44533 (Array (_ BitVec 32) (_ BitVec 64))) (size!45084 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92179)

(declare-fun arrayNoDuplicates!0 (array!92179 (_ BitVec 32) List!31561) Bool)

(assert (=> b!1351828 (= lt!597462 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31558))))

(declare-fun b!1351827 () Bool)

(declare-fun res!896502 () Bool)

(assert (=> b!1351827 (=> (not res!896502) (not e!769141))))

(assert (=> b!1351827 (= res!896502 (not (contains!9273 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896504 () Bool)

(assert (=> start!114106 (=> (not res!896504) (not e!769141))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114106 (= res!896504 (and (bvslt (size!45084 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45084 a!3742))))))

(assert (=> start!114106 e!769141))

(declare-fun array_inv!33814 (array!92179) Bool)

(assert (=> start!114106 (array_inv!33814 a!3742)))

(assert (=> start!114106 true))

(assert (= (and start!114106 res!896504) b!1351825))

(assert (= (and b!1351825 res!896505) b!1351826))

(assert (= (and b!1351826 res!896503) b!1351827))

(assert (= (and b!1351827 res!896502) b!1351828))

(declare-fun m!1239343 () Bool)

(assert (=> b!1351826 m!1239343))

(declare-fun m!1239345 () Bool)

(assert (=> b!1351827 m!1239345))

(declare-fun m!1239347 () Bool)

(assert (=> b!1351828 m!1239347))

(declare-fun m!1239349 () Bool)

(assert (=> b!1351825 m!1239349))

(declare-fun m!1239351 () Bool)

(assert (=> start!114106 m!1239351))

(check-sat (not start!114106) (not b!1351825) (not b!1351827) (not b!1351828) (not b!1351826))
(check-sat)
