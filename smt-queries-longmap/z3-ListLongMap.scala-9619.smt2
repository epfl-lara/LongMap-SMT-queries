; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113818 () Bool)

(assert start!113818)

(declare-fun b!1350215 () Bool)

(declare-fun res!895672 () Bool)

(declare-fun e!768096 () Bool)

(assert (=> b!1350215 (=> (not res!895672) (not e!768096))))

(declare-datatypes ((List!31507 0))(
  ( (Nil!31504) (Cons!31503 (h!32712 (_ BitVec 64)) (t!46165 List!31507)) )
))
(declare-fun acc!759 () List!31507)

(declare-fun contains!9216 (List!31507 (_ BitVec 64)) Bool)

(assert (=> b!1350215 (= res!895672 (not (contains!9216 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!895675 () Bool)

(assert (=> start!113818 (=> (not res!895675) (not e!768096))))

(declare-datatypes ((array!92030 0))(
  ( (array!92031 (arr!44466 (Array (_ BitVec 32) (_ BitVec 64))) (size!45016 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92030)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113818 (= res!895675 (and (bvslt (size!45016 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45016 a!3742))))))

(assert (=> start!113818 e!768096))

(declare-fun array_inv!33494 (array!92030) Bool)

(assert (=> start!113818 (array_inv!33494 a!3742)))

(assert (=> start!113818 true))

(declare-fun b!1350216 () Bool)

(declare-fun res!895673 () Bool)

(assert (=> b!1350216 (=> (not res!895673) (not e!768096))))

(assert (=> b!1350216 (= res!895673 (not (contains!9216 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350214 () Bool)

(declare-fun res!895674 () Bool)

(assert (=> b!1350214 (=> (not res!895674) (not e!768096))))

(declare-fun noDuplicate!2073 (List!31507) Bool)

(assert (=> b!1350214 (= res!895674 (noDuplicate!2073 acc!759))))

(declare-fun b!1350217 () Bool)

(assert (=> b!1350217 (= e!768096 (bvsgt #b00000000000000000000000000000000 (size!45016 a!3742)))))

(assert (= (and start!113818 res!895675) b!1350214))

(assert (= (and b!1350214 res!895674) b!1350215))

(assert (= (and b!1350215 res!895672) b!1350216))

(assert (= (and b!1350216 res!895673) b!1350217))

(declare-fun m!1237467 () Bool)

(assert (=> b!1350215 m!1237467))

(declare-fun m!1237469 () Bool)

(assert (=> start!113818 m!1237469))

(declare-fun m!1237471 () Bool)

(assert (=> b!1350216 m!1237471))

(declare-fun m!1237473 () Bool)

(assert (=> b!1350214 m!1237473))

(check-sat (not b!1350216) (not start!113818) (not b!1350214) (not b!1350215))
(check-sat)
