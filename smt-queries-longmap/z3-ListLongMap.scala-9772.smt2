; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116026 () Bool)

(assert start!116026)

(declare-fun b!1370479 () Bool)

(declare-fun res!913180 () Bool)

(declare-fun e!776484 () Bool)

(assert (=> b!1370479 (=> (not res!913180) (not e!776484))))

(declare-datatypes ((List!32005 0))(
  ( (Nil!32002) (Cons!32001 (h!33219 (_ BitVec 64)) (t!46691 List!32005)) )
))
(declare-fun acc!866 () List!32005)

(declare-fun contains!9690 (List!32005 (_ BitVec 64)) Bool)

(assert (=> b!1370479 (= res!913180 (not (contains!9690 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370480 () Bool)

(declare-fun res!913178 () Bool)

(assert (=> b!1370480 (=> (not res!913178) (not e!776484))))

(assert (=> b!1370480 (= res!913178 (not (contains!9690 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370481 () Bool)

(declare-fun res!913176 () Bool)

(assert (=> b!1370481 (=> (not res!913176) (not e!776484))))

(declare-fun newAcc!98 () List!32005)

(assert (=> b!1370481 (= res!913176 (not (contains!9690 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913182 () Bool)

(assert (=> start!116026 (=> (not res!913182) (not e!776484))))

(declare-datatypes ((array!93064 0))(
  ( (array!93065 (arr!44950 (Array (_ BitVec 32) (_ BitVec 64))) (size!45501 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93064)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116026 (= res!913182 (and (bvslt (size!45501 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45501 a!3861))))))

(assert (=> start!116026 e!776484))

(declare-fun array_inv!34231 (array!93064) Bool)

(assert (=> start!116026 (array_inv!34231 a!3861)))

(assert (=> start!116026 true))

(declare-fun b!1370482 () Bool)

(declare-fun res!913179 () Bool)

(assert (=> b!1370482 (=> (not res!913179) (not e!776484))))

(declare-fun noDuplicate!2521 (List!32005) Bool)

(assert (=> b!1370482 (= res!913179 (noDuplicate!2521 acc!866))))

(declare-fun b!1370483 () Bool)

(declare-fun res!913177 () Bool)

(assert (=> b!1370483 (=> (not res!913177) (not e!776484))))

(assert (=> b!1370483 (= res!913177 (not (contains!9690 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370484 () Bool)

(assert (=> b!1370484 (= e!776484 false)))

(declare-fun lt!602684 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93064 (_ BitVec 32) List!32005) Bool)

(assert (=> b!1370484 (= lt!602684 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45170 0))(
  ( (Unit!45171) )
))
(declare-fun lt!602685 () Unit!45170)

(declare-fun noDuplicateSubseq!236 (List!32005 List!32005) Unit!45170)

(assert (=> b!1370484 (= lt!602685 (noDuplicateSubseq!236 newAcc!98 acc!866))))

(declare-fun b!1370485 () Bool)

(declare-fun res!913181 () Bool)

(assert (=> b!1370485 (=> (not res!913181) (not e!776484))))

(declare-fun subseq!1049 (List!32005 List!32005) Bool)

(assert (=> b!1370485 (= res!913181 (subseq!1049 newAcc!98 acc!866))))

(assert (= (and start!116026 res!913182) b!1370482))

(assert (= (and b!1370482 res!913179) b!1370479))

(assert (= (and b!1370479 res!913180) b!1370480))

(assert (= (and b!1370480 res!913178) b!1370481))

(assert (= (and b!1370481 res!913176) b!1370483))

(assert (= (and b!1370483 res!913177) b!1370485))

(assert (= (and b!1370485 res!913181) b!1370484))

(declare-fun m!1254607 () Bool)

(assert (=> b!1370484 m!1254607))

(declare-fun m!1254609 () Bool)

(assert (=> b!1370484 m!1254609))

(declare-fun m!1254611 () Bool)

(assert (=> b!1370483 m!1254611))

(declare-fun m!1254613 () Bool)

(assert (=> start!116026 m!1254613))

(declare-fun m!1254615 () Bool)

(assert (=> b!1370485 m!1254615))

(declare-fun m!1254617 () Bool)

(assert (=> b!1370479 m!1254617))

(declare-fun m!1254619 () Bool)

(assert (=> b!1370482 m!1254619))

(declare-fun m!1254621 () Bool)

(assert (=> b!1370480 m!1254621))

(declare-fun m!1254623 () Bool)

(assert (=> b!1370481 m!1254623))

(check-sat (not b!1370479) (not b!1370481) (not b!1370485) (not b!1370484) (not b!1370482) (not b!1370483) (not b!1370480) (not start!116026))
(check-sat)
