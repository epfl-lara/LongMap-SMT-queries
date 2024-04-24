; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103036 () Bool)

(assert start!103036)

(declare-fun b!1236765 () Bool)

(declare-fun e!701311 () Bool)

(declare-fun e!701310 () Bool)

(assert (=> b!1236765 (= e!701311 e!701310)))

(declare-fun res!824114 () Bool)

(assert (=> b!1236765 (=> (not res!824114) (not e!701310))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79679 0))(
  ( (array!79680 (arr!38441 (Array (_ BitVec 32) (_ BitVec 64))) (size!38978 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79679)

(assert (=> b!1236765 (= res!824114 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38978 a!3835))))))

(declare-datatypes ((Unit!40904 0))(
  ( (Unit!40905) )
))
(declare-fun lt!560783 () Unit!40904)

(declare-fun e!701309 () Unit!40904)

(assert (=> b!1236765 (= lt!560783 e!701309)))

(declare-fun c!121193 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236765 (= c!121193 (validKeyInArray!0 (select (arr!38441 a!3835) from!3213)))))

(declare-fun b!1236766 () Bool)

(declare-fun res!824115 () Bool)

(assert (=> b!1236766 (=> (not res!824115) (not e!701311))))

(declare-datatypes ((List!27227 0))(
  ( (Nil!27224) (Cons!27223 (h!28441 (_ BitVec 64)) (t!40682 List!27227)) )
))
(declare-fun acc!846 () List!27227)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7298 (List!27227 (_ BitVec 64)) Bool)

(assert (=> b!1236766 (= res!824115 (contains!7298 acc!846 k0!2925))))

(declare-fun b!1236767 () Bool)

(declare-fun lt!560779 () Unit!40904)

(assert (=> b!1236767 (= e!701309 lt!560779)))

(declare-fun lt!560781 () List!27227)

(assert (=> b!1236767 (= lt!560781 (Cons!27223 (select (arr!38441 a!3835) from!3213) acc!846))))

(declare-fun lt!560780 () Unit!40904)

(declare-fun lemmaListSubSeqRefl!0 (List!27227) Unit!40904)

(assert (=> b!1236767 (= lt!560780 (lemmaListSubSeqRefl!0 lt!560781))))

(declare-fun subseq!536 (List!27227 List!27227) Bool)

(assert (=> b!1236767 (subseq!536 lt!560781 lt!560781)))

(declare-fun lt!560782 () Unit!40904)

(declare-fun subseqTail!29 (List!27227 List!27227) Unit!40904)

(assert (=> b!1236767 (= lt!560782 (subseqTail!29 lt!560781 lt!560781))))

(assert (=> b!1236767 (subseq!536 acc!846 lt!560781)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79679 List!27227 List!27227 (_ BitVec 32)) Unit!40904)

(assert (=> b!1236767 (= lt!560779 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560781 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79679 (_ BitVec 32) List!27227) Bool)

(assert (=> b!1236767 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236769 () Bool)

(declare-fun res!824117 () Bool)

(assert (=> b!1236769 (=> (not res!824117) (not e!701311))))

(assert (=> b!1236769 (= res!824117 (not (contains!7298 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236770 () Bool)

(declare-fun res!824120 () Bool)

(assert (=> b!1236770 (=> (not res!824120) (not e!701311))))

(declare-fun noDuplicate!1879 (List!27227) Bool)

(assert (=> b!1236770 (= res!824120 (noDuplicate!1879 acc!846))))

(declare-fun b!1236771 () Bool)

(assert (=> b!1236771 (= e!701310 false)))

(declare-fun lt!560778 () Bool)

(assert (=> b!1236771 (= lt!560778 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236772 () Bool)

(declare-fun res!824116 () Bool)

(assert (=> b!1236772 (=> (not res!824116) (not e!701311))))

(assert (=> b!1236772 (= res!824116 (not (contains!7298 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236773 () Bool)

(declare-fun res!824121 () Bool)

(assert (=> b!1236773 (=> (not res!824121) (not e!701311))))

(assert (=> b!1236773 (= res!824121 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236774 () Bool)

(declare-fun res!824119 () Bool)

(assert (=> b!1236774 (=> (not res!824119) (not e!701311))))

(assert (=> b!1236774 (= res!824119 (not (= from!3213 (bvsub (size!38978 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236768 () Bool)

(declare-fun Unit!40906 () Unit!40904)

(assert (=> b!1236768 (= e!701309 Unit!40906)))

(declare-fun res!824118 () Bool)

(assert (=> start!103036 (=> (not res!824118) (not e!701311))))

(assert (=> start!103036 (= res!824118 (and (bvslt (size!38978 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38978 a!3835))))))

(assert (=> start!103036 e!701311))

(declare-fun array_inv!29379 (array!79679) Bool)

(assert (=> start!103036 (array_inv!29379 a!3835)))

(assert (=> start!103036 true))

(assert (= (and start!103036 res!824118) b!1236770))

(assert (= (and b!1236770 res!824120) b!1236769))

(assert (= (and b!1236769 res!824117) b!1236772))

(assert (= (and b!1236772 res!824116) b!1236773))

(assert (= (and b!1236773 res!824121) b!1236766))

(assert (= (and b!1236766 res!824115) b!1236774))

(assert (= (and b!1236774 res!824119) b!1236765))

(assert (= (and b!1236765 c!121193) b!1236767))

(assert (= (and b!1236765 (not c!121193)) b!1236768))

(assert (= (and b!1236765 res!824114) b!1236771))

(declare-fun m!1140971 () Bool)

(assert (=> b!1236765 m!1140971))

(assert (=> b!1236765 m!1140971))

(declare-fun m!1140973 () Bool)

(assert (=> b!1236765 m!1140973))

(declare-fun m!1140975 () Bool)

(assert (=> b!1236771 m!1140975))

(declare-fun m!1140977 () Bool)

(assert (=> b!1236770 m!1140977))

(declare-fun m!1140979 () Bool)

(assert (=> b!1236766 m!1140979))

(declare-fun m!1140981 () Bool)

(assert (=> b!1236772 m!1140981))

(declare-fun m!1140983 () Bool)

(assert (=> b!1236773 m!1140983))

(declare-fun m!1140985 () Bool)

(assert (=> start!103036 m!1140985))

(declare-fun m!1140987 () Bool)

(assert (=> b!1236769 m!1140987))

(declare-fun m!1140989 () Bool)

(assert (=> b!1236767 m!1140989))

(declare-fun m!1140991 () Bool)

(assert (=> b!1236767 m!1140991))

(declare-fun m!1140993 () Bool)

(assert (=> b!1236767 m!1140993))

(declare-fun m!1140995 () Bool)

(assert (=> b!1236767 m!1140995))

(declare-fun m!1140997 () Bool)

(assert (=> b!1236767 m!1140997))

(assert (=> b!1236767 m!1140975))

(assert (=> b!1236767 m!1140971))

(check-sat (not b!1236765) (not b!1236766) (not b!1236769) (not b!1236767) (not b!1236771) (not b!1236772) (not b!1236773) (not start!103036) (not b!1236770))
(check-sat)
