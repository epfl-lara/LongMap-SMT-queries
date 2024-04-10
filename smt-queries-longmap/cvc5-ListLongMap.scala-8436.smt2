; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102750 () Bool)

(assert start!102750)

(declare-fun res!822769 () Bool)

(declare-fun e!700220 () Bool)

(assert (=> start!102750 (=> (not res!822769) (not e!700220))))

(declare-datatypes ((array!79595 0))(
  ( (array!79596 (arr!38405 (Array (_ BitVec 32) (_ BitVec 64))) (size!38941 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79595)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102750 (= res!822769 (and (bvslt (size!38941 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38941 a!3835))))))

(assert (=> start!102750 e!700220))

(declare-fun array_inv!29253 (array!79595) Bool)

(assert (=> start!102750 (array_inv!29253 a!3835)))

(assert (=> start!102750 true))

(declare-fun b!1234599 () Bool)

(declare-fun res!822767 () Bool)

(assert (=> b!1234599 (=> (not res!822767) (not e!700220))))

(assert (=> b!1234599 (= res!822767 (not (= from!3213 (bvsub (size!38941 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234600 () Bool)

(declare-fun res!822762 () Bool)

(assert (=> b!1234600 (=> (not res!822762) (not e!700220))))

(declare-datatypes ((List!27178 0))(
  ( (Nil!27175) (Cons!27174 (h!28383 (_ BitVec 64)) (t!40641 List!27178)) )
))
(declare-fun acc!846 () List!27178)

(declare-fun contains!7240 (List!27178 (_ BitVec 64)) Bool)

(assert (=> b!1234600 (= res!822762 (not (contains!7240 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234601 () Bool)

(declare-fun res!822772 () Bool)

(declare-fun e!700221 () Bool)

(assert (=> b!1234601 (=> res!822772 e!700221)))

(declare-fun lt!559925 () List!27178)

(assert (=> b!1234601 (= res!822772 (contains!7240 lt!559925 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234602 () Bool)

(assert (=> b!1234602 (= e!700221 true)))

(declare-fun lt!559923 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79595 (_ BitVec 32) List!27178) Bool)

(assert (=> b!1234602 (= lt!559923 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559925))))

(declare-datatypes ((Unit!40880 0))(
  ( (Unit!40881) )
))
(declare-fun lt!559924 () Unit!40880)

(declare-fun noDuplicateSubseq!59 (List!27178 List!27178) Unit!40880)

(assert (=> b!1234602 (= lt!559924 (noDuplicateSubseq!59 acc!846 lt!559925))))

(declare-fun b!1234603 () Bool)

(declare-fun res!822765 () Bool)

(assert (=> b!1234603 (=> res!822765 e!700221)))

(assert (=> b!1234603 (= res!822765 (contains!7240 lt!559925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234604 () Bool)

(declare-fun res!822761 () Bool)

(assert (=> b!1234604 (=> (not res!822761) (not e!700220))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234604 (= res!822761 (contains!7240 acc!846 k!2925))))

(declare-fun b!1234605 () Bool)

(declare-fun res!822771 () Bool)

(assert (=> b!1234605 (=> (not res!822771) (not e!700220))))

(assert (=> b!1234605 (= res!822771 (not (contains!7240 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234606 () Bool)

(declare-fun res!822766 () Bool)

(assert (=> b!1234606 (=> res!822766 e!700221)))

(declare-fun noDuplicate!1837 (List!27178) Bool)

(assert (=> b!1234606 (= res!822766 (not (noDuplicate!1837 lt!559925)))))

(declare-fun b!1234607 () Bool)

(assert (=> b!1234607 (= e!700220 (not e!700221))))

(declare-fun res!822768 () Bool)

(assert (=> b!1234607 (=> res!822768 e!700221)))

(assert (=> b!1234607 (= res!822768 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!512 (List!27178 List!27178) Bool)

(assert (=> b!1234607 (subseq!512 acc!846 lt!559925)))

(declare-fun lt!559922 () Unit!40880)

(declare-fun subseqTail!5 (List!27178 List!27178) Unit!40880)

(assert (=> b!1234607 (= lt!559922 (subseqTail!5 lt!559925 lt!559925))))

(assert (=> b!1234607 (subseq!512 lt!559925 lt!559925)))

(declare-fun lt!559921 () Unit!40880)

(declare-fun lemmaListSubSeqRefl!0 (List!27178) Unit!40880)

(assert (=> b!1234607 (= lt!559921 (lemmaListSubSeqRefl!0 lt!559925))))

(assert (=> b!1234607 (= lt!559925 (Cons!27174 (select (arr!38405 a!3835) from!3213) acc!846))))

(declare-fun b!1234608 () Bool)

(declare-fun res!822763 () Bool)

(assert (=> b!1234608 (=> (not res!822763) (not e!700220))))

(assert (=> b!1234608 (= res!822763 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234609 () Bool)

(declare-fun res!822770 () Bool)

(assert (=> b!1234609 (=> (not res!822770) (not e!700220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234609 (= res!822770 (validKeyInArray!0 (select (arr!38405 a!3835) from!3213)))))

(declare-fun b!1234610 () Bool)

(declare-fun res!822764 () Bool)

(assert (=> b!1234610 (=> (not res!822764) (not e!700220))))

(assert (=> b!1234610 (= res!822764 (noDuplicate!1837 acc!846))))

(assert (= (and start!102750 res!822769) b!1234610))

(assert (= (and b!1234610 res!822764) b!1234600))

(assert (= (and b!1234600 res!822762) b!1234605))

(assert (= (and b!1234605 res!822771) b!1234608))

(assert (= (and b!1234608 res!822763) b!1234604))

(assert (= (and b!1234604 res!822761) b!1234599))

(assert (= (and b!1234599 res!822767) b!1234609))

(assert (= (and b!1234609 res!822770) b!1234607))

(assert (= (and b!1234607 (not res!822768)) b!1234606))

(assert (= (and b!1234606 (not res!822766)) b!1234603))

(assert (= (and b!1234603 (not res!822765)) b!1234601))

(assert (= (and b!1234601 (not res!822772)) b!1234602))

(declare-fun m!1138525 () Bool)

(assert (=> b!1234600 m!1138525))

(declare-fun m!1138527 () Bool)

(assert (=> b!1234609 m!1138527))

(assert (=> b!1234609 m!1138527))

(declare-fun m!1138529 () Bool)

(assert (=> b!1234609 m!1138529))

(declare-fun m!1138531 () Bool)

(assert (=> b!1234606 m!1138531))

(declare-fun m!1138533 () Bool)

(assert (=> b!1234604 m!1138533))

(declare-fun m!1138535 () Bool)

(assert (=> b!1234601 m!1138535))

(declare-fun m!1138537 () Bool)

(assert (=> b!1234608 m!1138537))

(declare-fun m!1138539 () Bool)

(assert (=> b!1234610 m!1138539))

(declare-fun m!1138541 () Bool)

(assert (=> start!102750 m!1138541))

(declare-fun m!1138543 () Bool)

(assert (=> b!1234605 m!1138543))

(declare-fun m!1138545 () Bool)

(assert (=> b!1234607 m!1138545))

(declare-fun m!1138547 () Bool)

(assert (=> b!1234607 m!1138547))

(declare-fun m!1138549 () Bool)

(assert (=> b!1234607 m!1138549))

(declare-fun m!1138551 () Bool)

(assert (=> b!1234607 m!1138551))

(assert (=> b!1234607 m!1138527))

(declare-fun m!1138553 () Bool)

(assert (=> b!1234602 m!1138553))

(declare-fun m!1138555 () Bool)

(assert (=> b!1234602 m!1138555))

(declare-fun m!1138557 () Bool)

(assert (=> b!1234603 m!1138557))

(push 1)

(assert (not b!1234601))

(assert (not b!1234610))

(assert (not b!1234600))

(assert (not start!102750))

(assert (not b!1234604))

(assert (not b!1234609))

(assert (not b!1234603))

(assert (not b!1234602))

(assert (not b!1234606))

(assert (not b!1234608))

(assert (not b!1234607))

(assert (not b!1234605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

