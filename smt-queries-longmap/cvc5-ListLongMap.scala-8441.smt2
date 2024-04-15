; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102782 () Bool)

(assert start!102782)

(declare-fun b!1235143 () Bool)

(declare-fun res!823344 () Bool)

(declare-fun e!700338 () Bool)

(assert (=> b!1235143 (=> (not res!823344) (not e!700338))))

(declare-datatypes ((List!27257 0))(
  ( (Nil!27254) (Cons!27253 (h!28462 (_ BitVec 64)) (t!40711 List!27257)) )
))
(declare-fun acc!846 () List!27257)

(declare-fun contains!7229 (List!27257 (_ BitVec 64)) Bool)

(assert (=> b!1235143 (= res!823344 (not (contains!7229 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235144 () Bool)

(declare-fun res!823346 () Bool)

(declare-fun e!700340 () Bool)

(assert (=> b!1235144 (=> res!823346 e!700340)))

(declare-fun lt!560004 () List!27257)

(assert (=> b!1235144 (= res!823346 (contains!7229 lt!560004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235145 () Bool)

(declare-fun res!823343 () Bool)

(assert (=> b!1235145 (=> (not res!823343) (not e!700338))))

(declare-datatypes ((array!79550 0))(
  ( (array!79551 (arr!38383 (Array (_ BitVec 32) (_ BitVec 64))) (size!38921 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79550)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235145 (= res!823343 (validKeyInArray!0 (select (arr!38383 a!3835) from!3213)))))

(declare-fun b!1235146 () Bool)

(declare-fun res!823345 () Bool)

(assert (=> b!1235146 (=> (not res!823345) (not e!700338))))

(declare-fun arrayNoDuplicates!0 (array!79550 (_ BitVec 32) List!27257) Bool)

(assert (=> b!1235146 (= res!823345 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235147 () Bool)

(declare-fun res!823348 () Bool)

(assert (=> b!1235147 (=> (not res!823348) (not e!700338))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235147 (= res!823348 (contains!7229 acc!846 k!2925))))

(declare-fun b!1235148 () Bool)

(declare-fun res!823350 () Bool)

(assert (=> b!1235148 (=> (not res!823350) (not e!700338))))

(assert (=> b!1235148 (= res!823350 (not (= from!3213 (bvsub (size!38921 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235149 () Bool)

(declare-fun res!823342 () Bool)

(assert (=> b!1235149 (=> res!823342 e!700340)))

(declare-fun noDuplicate!1872 (List!27257) Bool)

(assert (=> b!1235149 (= res!823342 (not (noDuplicate!1872 lt!560004)))))

(declare-fun b!1235150 () Bool)

(declare-fun res!823347 () Bool)

(assert (=> b!1235150 (=> (not res!823347) (not e!700338))))

(assert (=> b!1235150 (= res!823347 (not (contains!7229 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235151 () Bool)

(declare-fun res!823351 () Bool)

(assert (=> b!1235151 (=> (not res!823351) (not e!700338))))

(assert (=> b!1235151 (= res!823351 (noDuplicate!1872 acc!846))))

(declare-fun b!1235152 () Bool)

(assert (=> b!1235152 (= e!700340 true)))

(declare-fun lt!560005 () Bool)

(assert (=> b!1235152 (= lt!560005 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560004))))

(declare-datatypes ((Unit!40761 0))(
  ( (Unit!40762) )
))
(declare-fun lt!560006 () Unit!40761)

(declare-fun noDuplicateSubseq!76 (List!27257 List!27257) Unit!40761)

(assert (=> b!1235152 (= lt!560006 (noDuplicateSubseq!76 acc!846 lt!560004))))

(declare-fun res!823341 () Bool)

(assert (=> start!102782 (=> (not res!823341) (not e!700338))))

(assert (=> start!102782 (= res!823341 (and (bvslt (size!38921 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38921 a!3835))))))

(assert (=> start!102782 e!700338))

(declare-fun array_inv!29366 (array!79550) Bool)

(assert (=> start!102782 (array_inv!29366 a!3835)))

(assert (=> start!102782 true))

(declare-fun b!1235153 () Bool)

(declare-fun res!823349 () Bool)

(assert (=> b!1235153 (=> res!823349 e!700340)))

(assert (=> b!1235153 (= res!823349 (contains!7229 lt!560004 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235154 () Bool)

(assert (=> b!1235154 (= e!700338 (not e!700340))))

(declare-fun res!823352 () Bool)

(assert (=> b!1235154 (=> res!823352 e!700340)))

(assert (=> b!1235154 (= res!823352 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!529 (List!27257 List!27257) Bool)

(assert (=> b!1235154 (subseq!529 acc!846 lt!560004)))

(declare-fun lt!560003 () Unit!40761)

(declare-fun subseqTail!22 (List!27257 List!27257) Unit!40761)

(assert (=> b!1235154 (= lt!560003 (subseqTail!22 lt!560004 lt!560004))))

(assert (=> b!1235154 (subseq!529 lt!560004 lt!560004)))

(declare-fun lt!560002 () Unit!40761)

(declare-fun lemmaListSubSeqRefl!0 (List!27257) Unit!40761)

(assert (=> b!1235154 (= lt!560002 (lemmaListSubSeqRefl!0 lt!560004))))

(assert (=> b!1235154 (= lt!560004 (Cons!27253 (select (arr!38383 a!3835) from!3213) acc!846))))

(assert (= (and start!102782 res!823341) b!1235151))

(assert (= (and b!1235151 res!823351) b!1235150))

(assert (= (and b!1235150 res!823347) b!1235143))

(assert (= (and b!1235143 res!823344) b!1235146))

(assert (= (and b!1235146 res!823345) b!1235147))

(assert (= (and b!1235147 res!823348) b!1235148))

(assert (= (and b!1235148 res!823350) b!1235145))

(assert (= (and b!1235145 res!823343) b!1235154))

(assert (= (and b!1235154 (not res!823352)) b!1235149))

(assert (= (and b!1235149 (not res!823342)) b!1235144))

(assert (= (and b!1235144 (not res!823346)) b!1235153))

(assert (= (and b!1235153 (not res!823349)) b!1235152))

(declare-fun m!1138607 () Bool)

(assert (=> b!1235154 m!1138607))

(declare-fun m!1138609 () Bool)

(assert (=> b!1235154 m!1138609))

(declare-fun m!1138611 () Bool)

(assert (=> b!1235154 m!1138611))

(declare-fun m!1138613 () Bool)

(assert (=> b!1235154 m!1138613))

(declare-fun m!1138615 () Bool)

(assert (=> b!1235154 m!1138615))

(declare-fun m!1138617 () Bool)

(assert (=> b!1235151 m!1138617))

(declare-fun m!1138619 () Bool)

(assert (=> b!1235150 m!1138619))

(declare-fun m!1138621 () Bool)

(assert (=> b!1235146 m!1138621))

(declare-fun m!1138623 () Bool)

(assert (=> b!1235147 m!1138623))

(assert (=> b!1235145 m!1138615))

(assert (=> b!1235145 m!1138615))

(declare-fun m!1138625 () Bool)

(assert (=> b!1235145 m!1138625))

(declare-fun m!1138627 () Bool)

(assert (=> b!1235144 m!1138627))

(declare-fun m!1138629 () Bool)

(assert (=> start!102782 m!1138629))

(declare-fun m!1138631 () Bool)

(assert (=> b!1235149 m!1138631))

(declare-fun m!1138633 () Bool)

(assert (=> b!1235143 m!1138633))

(declare-fun m!1138635 () Bool)

(assert (=> b!1235152 m!1138635))

(declare-fun m!1138637 () Bool)

(assert (=> b!1235152 m!1138637))

(declare-fun m!1138639 () Bool)

(assert (=> b!1235153 m!1138639))

(push 1)

(assert (not b!1235147))

(assert (not b!1235150))

(assert (not b!1235153))

(assert (not b!1235146))

(assert (not b!1235152))

(assert (not b!1235144))

(assert (not b!1235151))

(assert (not b!1235143))

(assert (not b!1235149))

(assert (not start!102782))

(assert (not b!1235154))

(assert (not b!1235145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

