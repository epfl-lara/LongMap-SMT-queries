; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102994 () Bool)

(assert start!102994)

(declare-fun b!1237271 () Bool)

(declare-fun res!825177 () Bool)

(declare-fun e!701245 () Bool)

(assert (=> b!1237271 (=> (not res!825177) (not e!701245))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79693 0))(
  ( (array!79694 (arr!38453 (Array (_ BitVec 32) (_ BitVec 64))) (size!38991 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79693)

(assert (=> b!1237271 (= res!825177 (not (= from!3213 (bvsub (size!38991 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!825178 () Bool)

(assert (=> start!102994 (=> (not res!825178) (not e!701245))))

(assert (=> start!102994 (= res!825178 (and (bvslt (size!38991 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38991 a!3835))))))

(assert (=> start!102994 e!701245))

(declare-fun array_inv!29436 (array!79693) Bool)

(assert (=> start!102994 (array_inv!29436 a!3835)))

(assert (=> start!102994 true))

(declare-fun b!1237272 () Bool)

(declare-fun res!825182 () Bool)

(assert (=> b!1237272 (=> (not res!825182) (not e!701245))))

(declare-datatypes ((List!27327 0))(
  ( (Nil!27324) (Cons!27323 (h!28532 (_ BitVec 64)) (t!40781 List!27327)) )
))
(declare-fun acc!846 () List!27327)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7299 (List!27327 (_ BitVec 64)) Bool)

(assert (=> b!1237272 (= res!825182 (contains!7299 acc!846 k0!2925))))

(declare-fun b!1237273 () Bool)

(declare-fun res!825179 () Bool)

(assert (=> b!1237273 (=> (not res!825179) (not e!701245))))

(declare-fun arrayNoDuplicates!0 (array!79693 (_ BitVec 32) List!27327) Bool)

(assert (=> b!1237273 (= res!825179 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237274 () Bool)

(declare-fun res!825176 () Bool)

(assert (=> b!1237274 (=> (not res!825176) (not e!701245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237274 (= res!825176 (validKeyInArray!0 (select (arr!38453 a!3835) from!3213)))))

(declare-fun b!1237275 () Bool)

(declare-fun res!825175 () Bool)

(assert (=> b!1237275 (=> (not res!825175) (not e!701245))))

(declare-fun noDuplicate!1942 (List!27327) Bool)

(assert (=> b!1237275 (= res!825175 (noDuplicate!1942 acc!846))))

(declare-fun b!1237276 () Bool)

(assert (=> b!1237276 (= e!701245 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000)))))

(declare-fun lt!560840 () List!27327)

(declare-fun subseq!581 (List!27327 List!27327) Bool)

(assert (=> b!1237276 (subseq!581 acc!846 lt!560840)))

(declare-datatypes ((Unit!40905 0))(
  ( (Unit!40906) )
))
(declare-fun lt!560839 () Unit!40905)

(declare-fun subseqTail!68 (List!27327 List!27327) Unit!40905)

(assert (=> b!1237276 (= lt!560839 (subseqTail!68 lt!560840 lt!560840))))

(assert (=> b!1237276 (subseq!581 lt!560840 lt!560840)))

(declare-fun lt!560838 () Unit!40905)

(declare-fun lemmaListSubSeqRefl!0 (List!27327) Unit!40905)

(assert (=> b!1237276 (= lt!560838 (lemmaListSubSeqRefl!0 lt!560840))))

(assert (=> b!1237276 (= lt!560840 (Cons!27323 (select (arr!38453 a!3835) from!3213) acc!846))))

(declare-fun b!1237277 () Bool)

(declare-fun res!825181 () Bool)

(assert (=> b!1237277 (=> (not res!825181) (not e!701245))))

(assert (=> b!1237277 (= res!825181 (not (contains!7299 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237278 () Bool)

(declare-fun res!825180 () Bool)

(assert (=> b!1237278 (=> (not res!825180) (not e!701245))))

(assert (=> b!1237278 (= res!825180 (not (contains!7299 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102994 res!825178) b!1237275))

(assert (= (and b!1237275 res!825175) b!1237278))

(assert (= (and b!1237278 res!825180) b!1237277))

(assert (= (and b!1237277 res!825181) b!1237273))

(assert (= (and b!1237273 res!825179) b!1237272))

(assert (= (and b!1237272 res!825182) b!1237271))

(assert (= (and b!1237271 res!825177) b!1237274))

(assert (= (and b!1237274 res!825176) b!1237276))

(declare-fun m!1140561 () Bool)

(assert (=> b!1237272 m!1140561))

(declare-fun m!1140563 () Bool)

(assert (=> b!1237277 m!1140563))

(declare-fun m!1140565 () Bool)

(assert (=> b!1237273 m!1140565))

(declare-fun m!1140567 () Bool)

(assert (=> b!1237278 m!1140567))

(declare-fun m!1140569 () Bool)

(assert (=> b!1237276 m!1140569))

(declare-fun m!1140571 () Bool)

(assert (=> b!1237276 m!1140571))

(declare-fun m!1140573 () Bool)

(assert (=> b!1237276 m!1140573))

(declare-fun m!1140575 () Bool)

(assert (=> b!1237276 m!1140575))

(declare-fun m!1140577 () Bool)

(assert (=> b!1237276 m!1140577))

(assert (=> b!1237274 m!1140577))

(assert (=> b!1237274 m!1140577))

(declare-fun m!1140579 () Bool)

(assert (=> b!1237274 m!1140579))

(declare-fun m!1140581 () Bool)

(assert (=> b!1237275 m!1140581))

(declare-fun m!1140583 () Bool)

(assert (=> start!102994 m!1140583))

(check-sat (not start!102994) (not b!1237272) (not b!1237274) (not b!1237275) (not b!1237278) (not b!1237273) (not b!1237277) (not b!1237276))
(check-sat)
