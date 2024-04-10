; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102804 () Bool)

(assert start!102804)

(declare-fun b!1235531 () Bool)

(declare-fun res!823655 () Bool)

(declare-fun e!700483 () Bool)

(assert (=> b!1235531 (=> (not res!823655) (not e!700483))))

(declare-datatypes ((List!27205 0))(
  ( (Nil!27202) (Cons!27201 (h!28410 (_ BitVec 64)) (t!40668 List!27205)) )
))
(declare-fun acc!846 () List!27205)

(declare-fun noDuplicate!1864 (List!27205) Bool)

(assert (=> b!1235531 (= res!823655 (noDuplicate!1864 acc!846))))

(declare-fun b!1235532 () Bool)

(declare-fun e!700484 () Bool)

(assert (=> b!1235532 (= e!700484 false)))

(declare-fun lt!560351 () Bool)

(declare-datatypes ((array!79649 0))(
  ( (array!79650 (arr!38432 (Array (_ BitVec 32) (_ BitVec 64))) (size!38968 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79649)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79649 (_ BitVec 32) List!27205) Bool)

(assert (=> b!1235532 (= lt!560351 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235533 () Bool)

(declare-fun res!823657 () Bool)

(assert (=> b!1235533 (=> (not res!823657) (not e!700483))))

(declare-fun contains!7267 (List!27205 (_ BitVec 64)) Bool)

(assert (=> b!1235533 (= res!823657 (not (contains!7267 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235534 () Bool)

(declare-datatypes ((Unit!40940 0))(
  ( (Unit!40941) )
))
(declare-fun e!700482 () Unit!40940)

(declare-fun Unit!40942 () Unit!40940)

(assert (=> b!1235534 (= e!700482 Unit!40942)))

(declare-fun b!1235535 () Bool)

(declare-fun res!823654 () Bool)

(assert (=> b!1235535 (=> (not res!823654) (not e!700483))))

(assert (=> b!1235535 (= res!823654 (not (= from!3213 (bvsub (size!38968 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235536 () Bool)

(assert (=> b!1235536 (= e!700483 e!700484)))

(declare-fun res!823653 () Bool)

(assert (=> b!1235536 (=> (not res!823653) (not e!700484))))

(assert (=> b!1235536 (= res!823653 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38968 a!3835))))))

(declare-fun lt!560347 () Unit!40940)

(assert (=> b!1235536 (= lt!560347 e!700482)))

(declare-fun c!120799 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235536 (= c!120799 (validKeyInArray!0 (select (arr!38432 a!3835) from!3213)))))

(declare-fun b!1235537 () Bool)

(declare-fun res!823656 () Bool)

(assert (=> b!1235537 (=> (not res!823656) (not e!700483))))

(assert (=> b!1235537 (= res!823656 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!823660 () Bool)

(assert (=> start!102804 (=> (not res!823660) (not e!700483))))

(assert (=> start!102804 (= res!823660 (and (bvslt (size!38968 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38968 a!3835))))))

(assert (=> start!102804 e!700483))

(declare-fun array_inv!29280 (array!79649) Bool)

(assert (=> start!102804 (array_inv!29280 a!3835)))

(assert (=> start!102804 true))

(declare-fun b!1235538 () Bool)

(declare-fun res!823658 () Bool)

(assert (=> b!1235538 (=> (not res!823658) (not e!700483))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235538 (= res!823658 (contains!7267 acc!846 k!2925))))

(declare-fun b!1235539 () Bool)

(declare-fun lt!560348 () Unit!40940)

(assert (=> b!1235539 (= e!700482 lt!560348)))

(declare-fun lt!560349 () List!27205)

(assert (=> b!1235539 (= lt!560349 (Cons!27201 (select (arr!38432 a!3835) from!3213) acc!846))))

(declare-fun lt!560346 () Unit!40940)

(declare-fun lemmaListSubSeqRefl!0 (List!27205) Unit!40940)

(assert (=> b!1235539 (= lt!560346 (lemmaListSubSeqRefl!0 lt!560349))))

(declare-fun subseq!539 (List!27205 List!27205) Bool)

(assert (=> b!1235539 (subseq!539 lt!560349 lt!560349)))

(declare-fun lt!560350 () Unit!40940)

(declare-fun subseqTail!32 (List!27205 List!27205) Unit!40940)

(assert (=> b!1235539 (= lt!560350 (subseqTail!32 lt!560349 lt!560349))))

(assert (=> b!1235539 (subseq!539 acc!846 lt!560349)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79649 List!27205 List!27205 (_ BitVec 32)) Unit!40940)

(assert (=> b!1235539 (= lt!560348 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560349 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235539 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235540 () Bool)

(declare-fun res!823659 () Bool)

(assert (=> b!1235540 (=> (not res!823659) (not e!700483))))

(assert (=> b!1235540 (= res!823659 (not (contains!7267 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102804 res!823660) b!1235531))

(assert (= (and b!1235531 res!823655) b!1235533))

(assert (= (and b!1235533 res!823657) b!1235540))

(assert (= (and b!1235540 res!823659) b!1235537))

(assert (= (and b!1235537 res!823656) b!1235538))

(assert (= (and b!1235538 res!823658) b!1235535))

(assert (= (and b!1235535 res!823654) b!1235536))

(assert (= (and b!1235536 c!120799) b!1235539))

(assert (= (and b!1235536 (not c!120799)) b!1235534))

(assert (= (and b!1235536 res!823653) b!1235532))

(declare-fun m!1139407 () Bool)

(assert (=> b!1235537 m!1139407))

(declare-fun m!1139409 () Bool)

(assert (=> b!1235532 m!1139409))

(declare-fun m!1139411 () Bool)

(assert (=> b!1235540 m!1139411))

(declare-fun m!1139413 () Bool)

(assert (=> start!102804 m!1139413))

(declare-fun m!1139415 () Bool)

(assert (=> b!1235538 m!1139415))

(declare-fun m!1139417 () Bool)

(assert (=> b!1235539 m!1139417))

(declare-fun m!1139419 () Bool)

(assert (=> b!1235539 m!1139419))

(declare-fun m!1139421 () Bool)

(assert (=> b!1235539 m!1139421))

(declare-fun m!1139423 () Bool)

(assert (=> b!1235539 m!1139423))

(assert (=> b!1235539 m!1139409))

(declare-fun m!1139425 () Bool)

(assert (=> b!1235539 m!1139425))

(declare-fun m!1139427 () Bool)

(assert (=> b!1235539 m!1139427))

(assert (=> b!1235536 m!1139427))

(assert (=> b!1235536 m!1139427))

(declare-fun m!1139429 () Bool)

(assert (=> b!1235536 m!1139429))

(declare-fun m!1139431 () Bool)

(assert (=> b!1235533 m!1139431))

(declare-fun m!1139433 () Bool)

(assert (=> b!1235531 m!1139433))

(push 1)

