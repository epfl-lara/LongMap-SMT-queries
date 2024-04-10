; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115702 () Bool)

(assert start!115702)

(declare-fun b!1368114 () Bool)

(declare-fun res!911622 () Bool)

(declare-fun e!775244 () Bool)

(assert (=> b!1368114 (=> (not res!911622) (not e!775244))))

(declare-datatypes ((List!31939 0))(
  ( (Nil!31936) (Cons!31935 (h!33144 (_ BitVec 64)) (t!46633 List!31939)) )
))
(declare-fun newAcc!98 () List!31939)

(declare-fun acc!866 () List!31939)

(declare-fun subseq!1023 (List!31939 List!31939) Bool)

(assert (=> b!1368114 (= res!911622 (subseq!1023 newAcc!98 acc!866))))

(declare-fun b!1368115 () Bool)

(declare-fun e!775245 () Bool)

(assert (=> b!1368115 (= e!775245 false)))

(declare-datatypes ((array!92894 0))(
  ( (array!92895 (arr!44871 (Array (_ BitVec 32) (_ BitVec 64))) (size!45421 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92894)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602008 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92894 (_ BitVec 32) List!31939) Bool)

(assert (=> b!1368115 (= lt!602008 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun res!911629 () Bool)

(assert (=> start!115702 (=> (not res!911629) (not e!775244))))

(assert (=> start!115702 (= res!911629 (and (bvslt (size!45421 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45421 a!3861))))))

(assert (=> start!115702 e!775244))

(declare-fun array_inv!33899 (array!92894) Bool)

(assert (=> start!115702 (array_inv!33899 a!3861)))

(assert (=> start!115702 true))

(declare-fun b!1368116 () Bool)

(declare-fun res!911630 () Bool)

(assert (=> b!1368116 (=> (not res!911630) (not e!775244))))

(declare-fun contains!9621 (List!31939 (_ BitVec 64)) Bool)

(assert (=> b!1368116 (= res!911630 (not (contains!9621 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368117 () Bool)

(declare-fun res!911624 () Bool)

(assert (=> b!1368117 (=> (not res!911624) (not e!775244))))

(declare-fun noDuplicate!2478 (List!31939) Bool)

(assert (=> b!1368117 (= res!911624 (noDuplicate!2478 acc!866))))

(declare-fun b!1368118 () Bool)

(declare-fun res!911626 () Bool)

(assert (=> b!1368118 (=> (not res!911626) (not e!775245))))

(assert (=> b!1368118 (= res!911626 (bvslt from!3239 (size!45421 a!3861)))))

(declare-fun b!1368119 () Bool)

(declare-fun res!911628 () Bool)

(assert (=> b!1368119 (=> (not res!911628) (not e!775244))))

(assert (=> b!1368119 (= res!911628 (not (contains!9621 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368120 () Bool)

(declare-fun res!911632 () Bool)

(assert (=> b!1368120 (=> (not res!911632) (not e!775244))))

(assert (=> b!1368120 (= res!911632 (not (contains!9621 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368121 () Bool)

(declare-fun res!911625 () Bool)

(assert (=> b!1368121 (=> (not res!911625) (not e!775245))))

(assert (=> b!1368121 (= res!911625 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368122 () Bool)

(assert (=> b!1368122 (= e!775244 e!775245)))

(declare-fun res!911631 () Bool)

(assert (=> b!1368122 (=> (not res!911631) (not e!775245))))

(assert (=> b!1368122 (= res!911631 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45179 0))(
  ( (Unit!45180) )
))
(declare-fun lt!602007 () Unit!45179)

(declare-fun noDuplicateSubseq!210 (List!31939 List!31939) Unit!45179)

(assert (=> b!1368122 (= lt!602007 (noDuplicateSubseq!210 newAcc!98 acc!866))))

(declare-fun b!1368123 () Bool)

(declare-fun res!911627 () Bool)

(assert (=> b!1368123 (=> (not res!911627) (not e!775245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368123 (= res!911627 (not (validKeyInArray!0 (select (arr!44871 a!3861) from!3239))))))

(declare-fun b!1368124 () Bool)

(declare-fun res!911623 () Bool)

(assert (=> b!1368124 (=> (not res!911623) (not e!775244))))

(assert (=> b!1368124 (= res!911623 (not (contains!9621 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115702 res!911629) b!1368117))

(assert (= (and b!1368117 res!911624) b!1368120))

(assert (= (and b!1368120 res!911632) b!1368124))

(assert (= (and b!1368124 res!911623) b!1368116))

(assert (= (and b!1368116 res!911630) b!1368119))

(assert (= (and b!1368119 res!911628) b!1368114))

(assert (= (and b!1368114 res!911622) b!1368122))

(assert (= (and b!1368122 res!911631) b!1368118))

(assert (= (and b!1368118 res!911626) b!1368123))

(assert (= (and b!1368123 res!911627) b!1368121))

(assert (= (and b!1368121 res!911625) b!1368115))

(declare-fun m!1252171 () Bool)

(assert (=> b!1368120 m!1252171))

(declare-fun m!1252173 () Bool)

(assert (=> b!1368117 m!1252173))

(declare-fun m!1252175 () Bool)

(assert (=> b!1368122 m!1252175))

(declare-fun m!1252177 () Bool)

(assert (=> b!1368122 m!1252177))

(declare-fun m!1252179 () Bool)

(assert (=> b!1368116 m!1252179))

(declare-fun m!1252181 () Bool)

(assert (=> start!115702 m!1252181))

(declare-fun m!1252183 () Bool)

(assert (=> b!1368114 m!1252183))

(declare-fun m!1252185 () Bool)

(assert (=> b!1368123 m!1252185))

(assert (=> b!1368123 m!1252185))

(declare-fun m!1252187 () Bool)

(assert (=> b!1368123 m!1252187))

(declare-fun m!1252189 () Bool)

(assert (=> b!1368124 m!1252189))

(declare-fun m!1252191 () Bool)

(assert (=> b!1368115 m!1252191))

(declare-fun m!1252193 () Bool)

(assert (=> b!1368119 m!1252193))

(check-sat (not b!1368115) (not b!1368117) (not b!1368116) (not b!1368122) (not b!1368119) (not b!1368120) (not b!1368114) (not start!115702) (not b!1368123) (not b!1368124))
(check-sat)
