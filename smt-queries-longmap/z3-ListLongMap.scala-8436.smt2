; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102748 () Bool)

(assert start!102748)

(declare-fun res!822734 () Bool)

(declare-fun e!700186 () Bool)

(assert (=> start!102748 (=> (not res!822734) (not e!700186))))

(declare-datatypes ((array!79516 0))(
  ( (array!79517 (arr!38366 (Array (_ BitVec 32) (_ BitVec 64))) (size!38904 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79516)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102748 (= res!822734 (and (bvslt (size!38904 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38904 a!3835))))))

(assert (=> start!102748 e!700186))

(declare-fun array_inv!29349 (array!79516) Bool)

(assert (=> start!102748 (array_inv!29349 a!3835)))

(assert (=> start!102748 true))

(declare-fun b!1234531 () Bool)

(declare-fun res!822740 () Bool)

(assert (=> b!1234531 (=> (not res!822740) (not e!700186))))

(declare-datatypes ((List!27240 0))(
  ( (Nil!27237) (Cons!27236 (h!28445 (_ BitVec 64)) (t!40694 List!27240)) )
))
(declare-fun acc!846 () List!27240)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7212 (List!27240 (_ BitVec 64)) Bool)

(assert (=> b!1234531 (= res!822740 (contains!7212 acc!846 k0!2925))))

(declare-fun b!1234532 () Bool)

(declare-fun res!822729 () Bool)

(assert (=> b!1234532 (=> (not res!822729) (not e!700186))))

(declare-fun noDuplicate!1855 (List!27240) Bool)

(assert (=> b!1234532 (= res!822729 (noDuplicate!1855 acc!846))))

(declare-fun b!1234533 () Bool)

(declare-fun res!822738 () Bool)

(assert (=> b!1234533 (=> (not res!822738) (not e!700186))))

(assert (=> b!1234533 (= res!822738 (not (= from!3213 (bvsub (size!38904 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234534 () Bool)

(declare-fun res!822730 () Bool)

(assert (=> b!1234534 (=> (not res!822730) (not e!700186))))

(assert (=> b!1234534 (= res!822730 (not (contains!7212 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234535 () Bool)

(declare-fun e!700185 () Bool)

(assert (=> b!1234535 (= e!700186 (not e!700185))))

(declare-fun res!822739 () Bool)

(assert (=> b!1234535 (=> res!822739 e!700185)))

(assert (=> b!1234535 (= res!822739 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!559751 () List!27240)

(declare-fun subseq!512 (List!27240 List!27240) Bool)

(assert (=> b!1234535 (subseq!512 acc!846 lt!559751)))

(declare-datatypes ((Unit!40727 0))(
  ( (Unit!40728) )
))
(declare-fun lt!559750 () Unit!40727)

(declare-fun subseqTail!5 (List!27240 List!27240) Unit!40727)

(assert (=> b!1234535 (= lt!559750 (subseqTail!5 lt!559751 lt!559751))))

(assert (=> b!1234535 (subseq!512 lt!559751 lt!559751)))

(declare-fun lt!559747 () Unit!40727)

(declare-fun lemmaListSubSeqRefl!0 (List!27240) Unit!40727)

(assert (=> b!1234535 (= lt!559747 (lemmaListSubSeqRefl!0 lt!559751))))

(assert (=> b!1234535 (= lt!559751 (Cons!27236 (select (arr!38366 a!3835) from!3213) acc!846))))

(declare-fun b!1234536 () Bool)

(declare-fun res!822737 () Bool)

(assert (=> b!1234536 (=> res!822737 e!700185)))

(assert (=> b!1234536 (= res!822737 (contains!7212 lt!559751 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234537 () Bool)

(assert (=> b!1234537 (= e!700185 true)))

(declare-fun lt!559748 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79516 (_ BitVec 32) List!27240) Bool)

(assert (=> b!1234537 (= lt!559748 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559751))))

(declare-fun lt!559749 () Unit!40727)

(declare-fun noDuplicateSubseq!59 (List!27240 List!27240) Unit!40727)

(assert (=> b!1234537 (= lt!559749 (noDuplicateSubseq!59 acc!846 lt!559751))))

(declare-fun b!1234538 () Bool)

(declare-fun res!822736 () Bool)

(assert (=> b!1234538 (=> (not res!822736) (not e!700186))))

(assert (=> b!1234538 (= res!822736 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234539 () Bool)

(declare-fun res!822733 () Bool)

(assert (=> b!1234539 (=> res!822733 e!700185)))

(assert (=> b!1234539 (= res!822733 (not (noDuplicate!1855 lt!559751)))))

(declare-fun b!1234540 () Bool)

(declare-fun res!822735 () Bool)

(assert (=> b!1234540 (=> (not res!822735) (not e!700186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234540 (= res!822735 (validKeyInArray!0 (select (arr!38366 a!3835) from!3213)))))

(declare-fun b!1234541 () Bool)

(declare-fun res!822731 () Bool)

(assert (=> b!1234541 (=> (not res!822731) (not e!700186))))

(assert (=> b!1234541 (= res!822731 (not (contains!7212 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234542 () Bool)

(declare-fun res!822732 () Bool)

(assert (=> b!1234542 (=> res!822732 e!700185)))

(assert (=> b!1234542 (= res!822732 (contains!7212 lt!559751 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102748 res!822734) b!1234532))

(assert (= (and b!1234532 res!822729) b!1234534))

(assert (= (and b!1234534 res!822730) b!1234541))

(assert (= (and b!1234541 res!822731) b!1234538))

(assert (= (and b!1234538 res!822736) b!1234531))

(assert (= (and b!1234531 res!822740) b!1234533))

(assert (= (and b!1234533 res!822738) b!1234540))

(assert (= (and b!1234540 res!822735) b!1234535))

(assert (= (and b!1234535 (not res!822739)) b!1234539))

(assert (= (and b!1234539 (not res!822733)) b!1234536))

(assert (= (and b!1234536 (not res!822737)) b!1234542))

(assert (= (and b!1234542 (not res!822732)) b!1234537))

(declare-fun m!1138029 () Bool)

(assert (=> b!1234539 m!1138029))

(declare-fun m!1138031 () Bool)

(assert (=> b!1234540 m!1138031))

(assert (=> b!1234540 m!1138031))

(declare-fun m!1138033 () Bool)

(assert (=> b!1234540 m!1138033))

(declare-fun m!1138035 () Bool)

(assert (=> b!1234534 m!1138035))

(declare-fun m!1138037 () Bool)

(assert (=> b!1234541 m!1138037))

(declare-fun m!1138039 () Bool)

(assert (=> b!1234542 m!1138039))

(declare-fun m!1138041 () Bool)

(assert (=> b!1234532 m!1138041))

(declare-fun m!1138043 () Bool)

(assert (=> b!1234537 m!1138043))

(declare-fun m!1138045 () Bool)

(assert (=> b!1234537 m!1138045))

(declare-fun m!1138047 () Bool)

(assert (=> b!1234531 m!1138047))

(declare-fun m!1138049 () Bool)

(assert (=> b!1234535 m!1138049))

(declare-fun m!1138051 () Bool)

(assert (=> b!1234535 m!1138051))

(declare-fun m!1138053 () Bool)

(assert (=> b!1234535 m!1138053))

(assert (=> b!1234535 m!1138031))

(declare-fun m!1138055 () Bool)

(assert (=> b!1234535 m!1138055))

(declare-fun m!1138057 () Bool)

(assert (=> start!102748 m!1138057))

(declare-fun m!1138059 () Bool)

(assert (=> b!1234536 m!1138059))

(declare-fun m!1138061 () Bool)

(assert (=> b!1234538 m!1138061))

(check-sat (not b!1234536) (not b!1234541) (not b!1234537) (not b!1234538) (not b!1234542) (not b!1234532) (not b!1234535) (not b!1234539) (not b!1234540) (not b!1234531) (not start!102748) (not b!1234534))
(check-sat)
