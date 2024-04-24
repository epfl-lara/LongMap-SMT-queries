; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116080 () Bool)

(assert start!116080)

(declare-fun b!1370840 () Bool)

(declare-fun res!913526 () Bool)

(declare-fun e!776690 () Bool)

(assert (=> b!1370840 (=> (not res!913526) (not e!776690))))

(declare-datatypes ((List!32014 0))(
  ( (Nil!32011) (Cons!32010 (h!33228 (_ BitVec 64)) (t!46700 List!32014)) )
))
(declare-fun acc!866 () List!32014)

(declare-fun noDuplicate!2530 (List!32014) Bool)

(assert (=> b!1370840 (= res!913526 (noDuplicate!2530 acc!866))))

(declare-fun b!1370841 () Bool)

(declare-fun res!913525 () Bool)

(assert (=> b!1370841 (=> (not res!913525) (not e!776690))))

(declare-fun newAcc!98 () List!32014)

(declare-fun contains!9699 (List!32014 (_ BitVec 64)) Bool)

(assert (=> b!1370841 (= res!913525 (not (contains!9699 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370842 () Bool)

(declare-fun res!913521 () Bool)

(assert (=> b!1370842 (=> (not res!913521) (not e!776690))))

(assert (=> b!1370842 (= res!913521 (not (contains!9699 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370843 () Bool)

(declare-fun e!776692 () Bool)

(assert (=> b!1370843 (= e!776692 false)))

(declare-fun lt!602757 () Bool)

(assert (=> b!1370843 (= lt!602757 (noDuplicate!2530 newAcc!98))))

(declare-fun res!913523 () Bool)

(assert (=> start!116080 (=> (not res!913523) (not e!776690))))

(declare-datatypes ((array!93085 0))(
  ( (array!93086 (arr!44959 (Array (_ BitVec 32) (_ BitVec 64))) (size!45510 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93085)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116080 (= res!913523 (and (bvslt (size!45510 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45510 a!3861))))))

(assert (=> start!116080 e!776690))

(declare-fun array_inv!34240 (array!93085) Bool)

(assert (=> start!116080 (array_inv!34240 a!3861)))

(assert (=> start!116080 true))

(declare-fun b!1370844 () Bool)

(declare-fun res!913519 () Bool)

(assert (=> b!1370844 (=> (not res!913519) (not e!776690))))

(assert (=> b!1370844 (= res!913519 (not (contains!9699 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370845 () Bool)

(declare-fun res!913527 () Bool)

(assert (=> b!1370845 (=> (not res!913527) (not e!776690))))

(declare-fun subseq!1058 (List!32014 List!32014) Bool)

(assert (=> b!1370845 (= res!913527 (subseq!1058 newAcc!98 acc!866))))

(declare-fun b!1370846 () Bool)

(declare-fun res!913520 () Bool)

(assert (=> b!1370846 (=> (not res!913520) (not e!776692))))

(assert (=> b!1370846 (= res!913520 (bvsge from!3239 (size!45510 a!3861)))))

(declare-fun b!1370847 () Bool)

(assert (=> b!1370847 (= e!776690 e!776692)))

(declare-fun res!913524 () Bool)

(assert (=> b!1370847 (=> (not res!913524) (not e!776692))))

(declare-fun arrayNoDuplicates!0 (array!93085 (_ BitVec 32) List!32014) Bool)

(assert (=> b!1370847 (= res!913524 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45188 0))(
  ( (Unit!45189) )
))
(declare-fun lt!602756 () Unit!45188)

(declare-fun noDuplicateSubseq!245 (List!32014 List!32014) Unit!45188)

(assert (=> b!1370847 (= lt!602756 (noDuplicateSubseq!245 newAcc!98 acc!866))))

(declare-fun b!1370848 () Bool)

(declare-fun res!913522 () Bool)

(assert (=> b!1370848 (=> (not res!913522) (not e!776690))))

(assert (=> b!1370848 (= res!913522 (not (contains!9699 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116080 res!913523) b!1370840))

(assert (= (and b!1370840 res!913526) b!1370848))

(assert (= (and b!1370848 res!913522) b!1370842))

(assert (= (and b!1370842 res!913521) b!1370841))

(assert (= (and b!1370841 res!913525) b!1370844))

(assert (= (and b!1370844 res!913519) b!1370845))

(assert (= (and b!1370845 res!913527) b!1370847))

(assert (= (and b!1370847 res!913524) b!1370846))

(assert (= (and b!1370846 res!913520) b!1370843))

(declare-fun m!1254901 () Bool)

(assert (=> b!1370841 m!1254901))

(declare-fun m!1254903 () Bool)

(assert (=> start!116080 m!1254903))

(declare-fun m!1254905 () Bool)

(assert (=> b!1370843 m!1254905))

(declare-fun m!1254907 () Bool)

(assert (=> b!1370840 m!1254907))

(declare-fun m!1254909 () Bool)

(assert (=> b!1370844 m!1254909))

(declare-fun m!1254911 () Bool)

(assert (=> b!1370842 m!1254911))

(declare-fun m!1254913 () Bool)

(assert (=> b!1370845 m!1254913))

(declare-fun m!1254915 () Bool)

(assert (=> b!1370847 m!1254915))

(declare-fun m!1254917 () Bool)

(assert (=> b!1370847 m!1254917))

(declare-fun m!1254919 () Bool)

(assert (=> b!1370848 m!1254919))

(check-sat (not b!1370843) (not b!1370848) (not b!1370842) (not start!116080) (not b!1370840) (not b!1370841) (not b!1370847) (not b!1370845) (not b!1370844))
(check-sat)
