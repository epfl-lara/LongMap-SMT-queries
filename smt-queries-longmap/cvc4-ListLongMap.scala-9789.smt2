; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116262 () Bool)

(assert start!116262)

(declare-fun b!1372558 () Bool)

(declare-fun e!777624 () Bool)

(assert (=> b!1372558 (= e!777624 false)))

(declare-datatypes ((array!93079 0))(
  ( (array!93080 (arr!44950 (Array (_ BitVec 32) (_ BitVec 64))) (size!45500 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93079)

(declare-fun lt!602890 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!32018 0))(
  ( (Nil!32015) (Cons!32014 (h!33223 (_ BitVec 64)) (t!46712 List!32018)) )
))
(declare-fun acc!866 () List!32018)

(declare-fun arrayNoDuplicates!0 (array!93079 (_ BitVec 32) List!32018) Bool)

(assert (=> b!1372558 (= lt!602890 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45337 0))(
  ( (Unit!45338) )
))
(declare-fun lt!602889 () Unit!45337)

(declare-fun newAcc!98 () List!32018)

(declare-fun noDuplicateSubseq!289 (List!32018 List!32018) Unit!45337)

(assert (=> b!1372558 (= lt!602889 (noDuplicateSubseq!289 newAcc!98 acc!866))))

(declare-fun res!915830 () Bool)

(assert (=> start!116262 (=> (not res!915830) (not e!777624))))

(assert (=> start!116262 (= res!915830 (and (bvslt (size!45500 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45500 a!3861))))))

(assert (=> start!116262 e!777624))

(declare-fun array_inv!33978 (array!93079) Bool)

(assert (=> start!116262 (array_inv!33978 a!3861)))

(assert (=> start!116262 true))

(declare-fun b!1372559 () Bool)

(declare-fun res!915828 () Bool)

(assert (=> b!1372559 (=> (not res!915828) (not e!777624))))

(declare-fun contains!9700 (List!32018 (_ BitVec 64)) Bool)

(assert (=> b!1372559 (= res!915828 (not (contains!9700 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372560 () Bool)

(declare-fun res!915831 () Bool)

(assert (=> b!1372560 (=> (not res!915831) (not e!777624))))

(assert (=> b!1372560 (= res!915831 (not (contains!9700 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372561 () Bool)

(declare-fun res!915829 () Bool)

(assert (=> b!1372561 (=> (not res!915829) (not e!777624))))

(assert (=> b!1372561 (= res!915829 (not (contains!9700 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372562 () Bool)

(declare-fun res!915826 () Bool)

(assert (=> b!1372562 (=> (not res!915826) (not e!777624))))

(assert (=> b!1372562 (= res!915826 (not (contains!9700 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372563 () Bool)

(declare-fun res!915832 () Bool)

(assert (=> b!1372563 (=> (not res!915832) (not e!777624))))

(declare-fun noDuplicate!2557 (List!32018) Bool)

(assert (=> b!1372563 (= res!915832 (noDuplicate!2557 acc!866))))

(declare-fun b!1372564 () Bool)

(declare-fun res!915827 () Bool)

(assert (=> b!1372564 (=> (not res!915827) (not e!777624))))

(declare-fun subseq!1102 (List!32018 List!32018) Bool)

(assert (=> b!1372564 (= res!915827 (subseq!1102 newAcc!98 acc!866))))

(assert (= (and start!116262 res!915830) b!1372563))

(assert (= (and b!1372563 res!915832) b!1372562))

(assert (= (and b!1372562 res!915826) b!1372561))

(assert (= (and b!1372561 res!915829) b!1372560))

(assert (= (and b!1372560 res!915831) b!1372559))

(assert (= (and b!1372559 res!915828) b!1372564))

(assert (= (and b!1372564 res!915827) b!1372558))

(declare-fun m!1255987 () Bool)

(assert (=> b!1372563 m!1255987))

(declare-fun m!1255989 () Bool)

(assert (=> b!1372560 m!1255989))

(declare-fun m!1255991 () Bool)

(assert (=> start!116262 m!1255991))

(declare-fun m!1255993 () Bool)

(assert (=> b!1372558 m!1255993))

(declare-fun m!1255995 () Bool)

(assert (=> b!1372558 m!1255995))

(declare-fun m!1255997 () Bool)

(assert (=> b!1372561 m!1255997))

(declare-fun m!1255999 () Bool)

(assert (=> b!1372559 m!1255999))

(declare-fun m!1256001 () Bool)

(assert (=> b!1372564 m!1256001))

(declare-fun m!1256003 () Bool)

(assert (=> b!1372562 m!1256003))

(push 1)

(assert (not b!1372563))

(assert (not b!1372559))

(assert (not b!1372560))

(assert (not b!1372561))

(assert (not b!1372558))

(assert (not b!1372562))

(assert (not b!1372564))

(assert (not start!116262))

(check-sat)

(pop 1)

