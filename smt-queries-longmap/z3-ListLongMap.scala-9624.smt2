; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113884 () Bool)

(assert start!113884)

(declare-fun b!1350539 () Bool)

(declare-fun res!895996 () Bool)

(declare-fun e!768304 () Bool)

(assert (=> b!1350539 (=> (not res!895996) (not e!768304))))

(declare-datatypes ((List!31522 0))(
  ( (Nil!31519) (Cons!31518 (h!32727 (_ BitVec 64)) (t!46180 List!31522)) )
))
(declare-fun acc!759 () List!31522)

(declare-fun contains!9231 (List!31522 (_ BitVec 64)) Bool)

(assert (=> b!1350539 (= res!895996 (not (contains!9231 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!895998 () Bool)

(assert (=> start!113884 (=> (not res!895998) (not e!768304))))

(declare-datatypes ((array!92066 0))(
  ( (array!92067 (arr!44481 (Array (_ BitVec 32) (_ BitVec 64))) (size!45031 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92066)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113884 (= res!895998 (and (bvslt (size!45031 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45031 a!3742))))))

(assert (=> start!113884 e!768304))

(declare-fun array_inv!33509 (array!92066) Bool)

(assert (=> start!113884 (array_inv!33509 a!3742)))

(assert (=> start!113884 true))

(declare-fun b!1350541 () Bool)

(assert (=> b!1350541 (= e!768304 false)))

(declare-fun lt!596989 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92066 (_ BitVec 32) List!31522) Bool)

(assert (=> b!1350541 (= lt!596989 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31519))))

(declare-fun b!1350540 () Bool)

(declare-fun res!895997 () Bool)

(assert (=> b!1350540 (=> (not res!895997) (not e!768304))))

(assert (=> b!1350540 (= res!895997 (not (contains!9231 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350538 () Bool)

(declare-fun res!895999 () Bool)

(assert (=> b!1350538 (=> (not res!895999) (not e!768304))))

(declare-fun noDuplicate!2088 (List!31522) Bool)

(assert (=> b!1350538 (= res!895999 (noDuplicate!2088 acc!759))))

(assert (= (and start!113884 res!895998) b!1350538))

(assert (= (and b!1350538 res!895999) b!1350539))

(assert (= (and b!1350539 res!895996) b!1350540))

(assert (= (and b!1350540 res!895997) b!1350541))

(declare-fun m!1237757 () Bool)

(assert (=> b!1350538 m!1237757))

(declare-fun m!1237759 () Bool)

(assert (=> b!1350541 m!1237759))

(declare-fun m!1237761 () Bool)

(assert (=> start!113884 m!1237761))

(declare-fun m!1237763 () Bool)

(assert (=> b!1350540 m!1237763))

(declare-fun m!1237765 () Bool)

(assert (=> b!1350539 m!1237765))

(check-sat (not b!1350539) (not start!113884) (not b!1350541) (not b!1350540) (not b!1350538))
(check-sat)
