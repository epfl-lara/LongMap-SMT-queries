; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115704 () Bool)

(assert start!115704)

(declare-fun b!1368147 () Bool)

(declare-fun res!911659 () Bool)

(declare-fun e!775253 () Bool)

(assert (=> b!1368147 (=> (not res!911659) (not e!775253))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1368147 (= res!911659 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368148 () Bool)

(declare-fun res!911660 () Bool)

(declare-fun e!775254 () Bool)

(assert (=> b!1368148 (=> (not res!911660) (not e!775254))))

(declare-datatypes ((List!31940 0))(
  ( (Nil!31937) (Cons!31936 (h!33145 (_ BitVec 64)) (t!46634 List!31940)) )
))
(declare-fun acc!866 () List!31940)

(declare-fun noDuplicate!2479 (List!31940) Bool)

(assert (=> b!1368148 (= res!911660 (noDuplicate!2479 acc!866))))

(declare-fun b!1368149 () Bool)

(declare-fun res!911656 () Bool)

(assert (=> b!1368149 (=> (not res!911656) (not e!775253))))

(declare-datatypes ((array!92896 0))(
  ( (array!92897 (arr!44872 (Array (_ BitVec 32) (_ BitVec 64))) (size!45422 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92896)

(assert (=> b!1368149 (= res!911656 (bvslt from!3239 (size!45422 a!3861)))))

(declare-fun b!1368150 () Bool)

(declare-fun res!911658 () Bool)

(assert (=> b!1368150 (=> (not res!911658) (not e!775254))))

(declare-fun newAcc!98 () List!31940)

(declare-fun contains!9622 (List!31940 (_ BitVec 64)) Bool)

(assert (=> b!1368150 (= res!911658 (not (contains!9622 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368151 () Bool)

(declare-fun res!911657 () Bool)

(assert (=> b!1368151 (=> (not res!911657) (not e!775254))))

(declare-fun subseq!1024 (List!31940 List!31940) Bool)

(assert (=> b!1368151 (= res!911657 (subseq!1024 newAcc!98 acc!866))))

(declare-fun b!1368152 () Bool)

(declare-fun res!911662 () Bool)

(assert (=> b!1368152 (=> (not res!911662) (not e!775254))))

(assert (=> b!1368152 (= res!911662 (not (contains!9622 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911665 () Bool)

(assert (=> start!115704 (=> (not res!911665) (not e!775254))))

(assert (=> start!115704 (= res!911665 (and (bvslt (size!45422 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45422 a!3861))))))

(assert (=> start!115704 e!775254))

(declare-fun array_inv!33900 (array!92896) Bool)

(assert (=> start!115704 (array_inv!33900 a!3861)))

(assert (=> start!115704 true))

(declare-fun b!1368153 () Bool)

(declare-fun res!911663 () Bool)

(assert (=> b!1368153 (=> (not res!911663) (not e!775254))))

(assert (=> b!1368153 (= res!911663 (not (contains!9622 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368154 () Bool)

(assert (=> b!1368154 (= e!775254 e!775253)))

(declare-fun res!911664 () Bool)

(assert (=> b!1368154 (=> (not res!911664) (not e!775253))))

(declare-fun arrayNoDuplicates!0 (array!92896 (_ BitVec 32) List!31940) Bool)

(assert (=> b!1368154 (= res!911664 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45181 0))(
  ( (Unit!45182) )
))
(declare-fun lt!602013 () Unit!45181)

(declare-fun noDuplicateSubseq!211 (List!31940 List!31940) Unit!45181)

(assert (=> b!1368154 (= lt!602013 (noDuplicateSubseq!211 newAcc!98 acc!866))))

(declare-fun b!1368155 () Bool)

(assert (=> b!1368155 (= e!775253 false)))

(declare-fun lt!602014 () Bool)

(assert (=> b!1368155 (= lt!602014 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368156 () Bool)

(declare-fun res!911661 () Bool)

(assert (=> b!1368156 (=> (not res!911661) (not e!775253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368156 (= res!911661 (not (validKeyInArray!0 (select (arr!44872 a!3861) from!3239))))))

(declare-fun b!1368157 () Bool)

(declare-fun res!911655 () Bool)

(assert (=> b!1368157 (=> (not res!911655) (not e!775254))))

(assert (=> b!1368157 (= res!911655 (not (contains!9622 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115704 res!911665) b!1368148))

(assert (= (and b!1368148 res!911660) b!1368153))

(assert (= (and b!1368153 res!911663) b!1368157))

(assert (= (and b!1368157 res!911655) b!1368150))

(assert (= (and b!1368150 res!911658) b!1368152))

(assert (= (and b!1368152 res!911662) b!1368151))

(assert (= (and b!1368151 res!911657) b!1368154))

(assert (= (and b!1368154 res!911664) b!1368149))

(assert (= (and b!1368149 res!911656) b!1368156))

(assert (= (and b!1368156 res!911661) b!1368147))

(assert (= (and b!1368147 res!911659) b!1368155))

(declare-fun m!1252195 () Bool)

(assert (=> b!1368148 m!1252195))

(declare-fun m!1252197 () Bool)

(assert (=> b!1368153 m!1252197))

(declare-fun m!1252199 () Bool)

(assert (=> b!1368150 m!1252199))

(declare-fun m!1252201 () Bool)

(assert (=> b!1368157 m!1252201))

(declare-fun m!1252203 () Bool)

(assert (=> b!1368154 m!1252203))

(declare-fun m!1252205 () Bool)

(assert (=> b!1368154 m!1252205))

(declare-fun m!1252207 () Bool)

(assert (=> start!115704 m!1252207))

(declare-fun m!1252209 () Bool)

(assert (=> b!1368152 m!1252209))

(declare-fun m!1252211 () Bool)

(assert (=> b!1368151 m!1252211))

(declare-fun m!1252213 () Bool)

(assert (=> b!1368156 m!1252213))

(assert (=> b!1368156 m!1252213))

(declare-fun m!1252215 () Bool)

(assert (=> b!1368156 m!1252215))

(declare-fun m!1252217 () Bool)

(assert (=> b!1368155 m!1252217))

(push 1)

(assert (not b!1368151))

(assert (not b!1368155))

