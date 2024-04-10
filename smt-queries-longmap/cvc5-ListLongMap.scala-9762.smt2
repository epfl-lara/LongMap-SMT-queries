; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115694 () Bool)

(assert start!115694)

(declare-fun b!1367982 () Bool)

(declare-fun res!911495 () Bool)

(declare-fun e!775209 () Bool)

(assert (=> b!1367982 (=> (not res!911495) (not e!775209))))

(declare-datatypes ((List!31935 0))(
  ( (Nil!31932) (Cons!31931 (h!33140 (_ BitVec 64)) (t!46629 List!31935)) )
))
(declare-fun acc!866 () List!31935)

(declare-fun noDuplicate!2474 (List!31935) Bool)

(assert (=> b!1367982 (= res!911495 (noDuplicate!2474 acc!866))))

(declare-fun b!1367983 () Bool)

(declare-fun res!911497 () Bool)

(assert (=> b!1367983 (=> (not res!911497) (not e!775209))))

(declare-fun newAcc!98 () List!31935)

(declare-fun contains!9617 (List!31935 (_ BitVec 64)) Bool)

(assert (=> b!1367983 (= res!911497 (not (contains!9617 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367984 () Bool)

(declare-fun res!911494 () Bool)

(assert (=> b!1367984 (=> (not res!911494) (not e!775209))))

(assert (=> b!1367984 (= res!911494 (not (contains!9617 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367985 () Bool)

(declare-fun res!911490 () Bool)

(declare-fun e!775210 () Bool)

(assert (=> b!1367985 (=> (not res!911490) (not e!775210))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1367985 (= res!911490 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1367986 () Bool)

(declare-fun res!911498 () Bool)

(assert (=> b!1367986 (=> (not res!911498) (not e!775209))))

(assert (=> b!1367986 (= res!911498 (not (contains!9617 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911493 () Bool)

(assert (=> start!115694 (=> (not res!911493) (not e!775209))))

(declare-datatypes ((array!92886 0))(
  ( (array!92887 (arr!44867 (Array (_ BitVec 32) (_ BitVec 64))) (size!45417 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92886)

(assert (=> start!115694 (= res!911493 (and (bvslt (size!45417 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45417 a!3861))))))

(assert (=> start!115694 e!775209))

(declare-fun array_inv!33895 (array!92886) Bool)

(assert (=> start!115694 (array_inv!33895 a!3861)))

(assert (=> start!115694 true))

(declare-fun b!1367987 () Bool)

(assert (=> b!1367987 (= e!775209 e!775210)))

(declare-fun res!911500 () Bool)

(assert (=> b!1367987 (=> (not res!911500) (not e!775210))))

(declare-fun arrayNoDuplicates!0 (array!92886 (_ BitVec 32) List!31935) Bool)

(assert (=> b!1367987 (= res!911500 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45171 0))(
  ( (Unit!45172) )
))
(declare-fun lt!601984 () Unit!45171)

(declare-fun noDuplicateSubseq!206 (List!31935 List!31935) Unit!45171)

(assert (=> b!1367987 (= lt!601984 (noDuplicateSubseq!206 newAcc!98 acc!866))))

(declare-fun b!1367988 () Bool)

(assert (=> b!1367988 (= e!775210 false)))

(declare-fun lt!601983 () Bool)

(assert (=> b!1367988 (= lt!601983 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1367989 () Bool)

(declare-fun res!911499 () Bool)

(assert (=> b!1367989 (=> (not res!911499) (not e!775210))))

(assert (=> b!1367989 (= res!911499 (bvslt from!3239 (size!45417 a!3861)))))

(declare-fun b!1367990 () Bool)

(declare-fun res!911496 () Bool)

(assert (=> b!1367990 (=> (not res!911496) (not e!775209))))

(declare-fun subseq!1019 (List!31935 List!31935) Bool)

(assert (=> b!1367990 (= res!911496 (subseq!1019 newAcc!98 acc!866))))

(declare-fun b!1367991 () Bool)

(declare-fun res!911491 () Bool)

(assert (=> b!1367991 (=> (not res!911491) (not e!775209))))

(assert (=> b!1367991 (= res!911491 (not (contains!9617 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367992 () Bool)

(declare-fun res!911492 () Bool)

(assert (=> b!1367992 (=> (not res!911492) (not e!775210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367992 (= res!911492 (not (validKeyInArray!0 (select (arr!44867 a!3861) from!3239))))))

(assert (= (and start!115694 res!911493) b!1367982))

(assert (= (and b!1367982 res!911495) b!1367984))

(assert (= (and b!1367984 res!911494) b!1367986))

(assert (= (and b!1367986 res!911498) b!1367983))

(assert (= (and b!1367983 res!911497) b!1367991))

(assert (= (and b!1367991 res!911491) b!1367990))

(assert (= (and b!1367990 res!911496) b!1367987))

(assert (= (and b!1367987 res!911500) b!1367989))

(assert (= (and b!1367989 res!911499) b!1367992))

(assert (= (and b!1367992 res!911492) b!1367985))

(assert (= (and b!1367985 res!911490) b!1367988))

(declare-fun m!1252075 () Bool)

(assert (=> b!1367988 m!1252075))

(declare-fun m!1252077 () Bool)

(assert (=> start!115694 m!1252077))

(declare-fun m!1252079 () Bool)

(assert (=> b!1367987 m!1252079))

(declare-fun m!1252081 () Bool)

(assert (=> b!1367987 m!1252081))

(declare-fun m!1252083 () Bool)

(assert (=> b!1367990 m!1252083))

(declare-fun m!1252085 () Bool)

(assert (=> b!1367986 m!1252085))

(declare-fun m!1252087 () Bool)

(assert (=> b!1367992 m!1252087))

(assert (=> b!1367992 m!1252087))

(declare-fun m!1252089 () Bool)

(assert (=> b!1367992 m!1252089))

(declare-fun m!1252091 () Bool)

(assert (=> b!1367984 m!1252091))

(declare-fun m!1252093 () Bool)

(assert (=> b!1367991 m!1252093))

(declare-fun m!1252095 () Bool)

(assert (=> b!1367982 m!1252095))

(declare-fun m!1252097 () Bool)

(assert (=> b!1367983 m!1252097))

(push 1)

