; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103054 () Bool)

(assert start!103054)

(declare-fun res!824336 () Bool)

(declare-fun e!701419 () Bool)

(assert (=> start!103054 (=> (not res!824336) (not e!701419))))

(declare-datatypes ((array!79697 0))(
  ( (array!79698 (arr!38450 (Array (_ BitVec 32) (_ BitVec 64))) (size!38987 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79697)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103054 (= res!824336 (and (bvslt (size!38987 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38987 a!3835))))))

(assert (=> start!103054 e!701419))

(declare-fun array_inv!29388 (array!79697) Bool)

(assert (=> start!103054 (array_inv!29388 a!3835)))

(assert (=> start!103054 true))

(declare-fun b!1237035 () Bool)

(declare-fun e!701420 () Bool)

(assert (=> b!1237035 (= e!701419 e!701420)))

(declare-fun res!824331 () Bool)

(assert (=> b!1237035 (=> (not res!824331) (not e!701420))))

(assert (=> b!1237035 (= res!824331 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38987 a!3835))))))

(declare-datatypes ((Unit!40931 0))(
  ( (Unit!40932) )
))
(declare-fun lt!560943 () Unit!40931)

(declare-fun e!701417 () Unit!40931)

(assert (=> b!1237035 (= lt!560943 e!701417)))

(declare-fun c!121220 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237035 (= c!121220 (validKeyInArray!0 (select (arr!38450 a!3835) from!3213)))))

(declare-fun b!1237036 () Bool)

(declare-fun Unit!40933 () Unit!40931)

(assert (=> b!1237036 (= e!701417 Unit!40933)))

(declare-fun b!1237037 () Bool)

(assert (=> b!1237037 (= e!701420 false)))

(declare-fun lt!560945 () Bool)

(declare-datatypes ((List!27236 0))(
  ( (Nil!27233) (Cons!27232 (h!28450 (_ BitVec 64)) (t!40691 List!27236)) )
))
(declare-fun acc!846 () List!27236)

(declare-fun arrayNoDuplicates!0 (array!79697 (_ BitVec 32) List!27236) Bool)

(assert (=> b!1237037 (= lt!560945 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1237038 () Bool)

(declare-fun res!824333 () Bool)

(assert (=> b!1237038 (=> (not res!824333) (not e!701419))))

(assert (=> b!1237038 (= res!824333 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237039 () Bool)

(declare-fun res!824335 () Bool)

(assert (=> b!1237039 (=> (not res!824335) (not e!701419))))

(assert (=> b!1237039 (= res!824335 (not (= from!3213 (bvsub (size!38987 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237040 () Bool)

(declare-fun res!824334 () Bool)

(assert (=> b!1237040 (=> (not res!824334) (not e!701419))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7307 (List!27236 (_ BitVec 64)) Bool)

(assert (=> b!1237040 (= res!824334 (contains!7307 acc!846 k0!2925))))

(declare-fun b!1237041 () Bool)

(declare-fun lt!560940 () Unit!40931)

(assert (=> b!1237041 (= e!701417 lt!560940)))

(declare-fun lt!560942 () List!27236)

(assert (=> b!1237041 (= lt!560942 (Cons!27232 (select (arr!38450 a!3835) from!3213) acc!846))))

(declare-fun lt!560944 () Unit!40931)

(declare-fun lemmaListSubSeqRefl!0 (List!27236) Unit!40931)

(assert (=> b!1237041 (= lt!560944 (lemmaListSubSeqRefl!0 lt!560942))))

(declare-fun subseq!545 (List!27236 List!27236) Bool)

(assert (=> b!1237041 (subseq!545 lt!560942 lt!560942)))

(declare-fun lt!560941 () Unit!40931)

(declare-fun subseqTail!38 (List!27236 List!27236) Unit!40931)

(assert (=> b!1237041 (= lt!560941 (subseqTail!38 lt!560942 lt!560942))))

(assert (=> b!1237041 (subseq!545 acc!846 lt!560942)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79697 List!27236 List!27236 (_ BitVec 32)) Unit!40931)

(assert (=> b!1237041 (= lt!560940 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560942 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1237041 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1237042 () Bool)

(declare-fun res!824337 () Bool)

(assert (=> b!1237042 (=> (not res!824337) (not e!701419))))

(declare-fun noDuplicate!1888 (List!27236) Bool)

(assert (=> b!1237042 (= res!824337 (noDuplicate!1888 acc!846))))

(declare-fun b!1237043 () Bool)

(declare-fun res!824330 () Bool)

(assert (=> b!1237043 (=> (not res!824330) (not e!701419))))

(assert (=> b!1237043 (= res!824330 (not (contains!7307 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237044 () Bool)

(declare-fun res!824332 () Bool)

(assert (=> b!1237044 (=> (not res!824332) (not e!701419))))

(assert (=> b!1237044 (= res!824332 (not (contains!7307 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103054 res!824336) b!1237042))

(assert (= (and b!1237042 res!824337) b!1237044))

(assert (= (and b!1237044 res!824332) b!1237043))

(assert (= (and b!1237043 res!824330) b!1237038))

(assert (= (and b!1237038 res!824333) b!1237040))

(assert (= (and b!1237040 res!824334) b!1237039))

(assert (= (and b!1237039 res!824335) b!1237035))

(assert (= (and b!1237035 c!121220) b!1237041))

(assert (= (and b!1237035 (not c!121220)) b!1237036))

(assert (= (and b!1237035 res!824331) b!1237037))

(declare-fun m!1141223 () Bool)

(assert (=> start!103054 m!1141223))

(declare-fun m!1141225 () Bool)

(assert (=> b!1237035 m!1141225))

(assert (=> b!1237035 m!1141225))

(declare-fun m!1141227 () Bool)

(assert (=> b!1237035 m!1141227))

(declare-fun m!1141229 () Bool)

(assert (=> b!1237042 m!1141229))

(declare-fun m!1141231 () Bool)

(assert (=> b!1237040 m!1141231))

(declare-fun m!1141233 () Bool)

(assert (=> b!1237044 m!1141233))

(declare-fun m!1141235 () Bool)

(assert (=> b!1237041 m!1141235))

(declare-fun m!1141237 () Bool)

(assert (=> b!1237041 m!1141237))

(declare-fun m!1141239 () Bool)

(assert (=> b!1237041 m!1141239))

(declare-fun m!1141241 () Bool)

(assert (=> b!1237041 m!1141241))

(declare-fun m!1141243 () Bool)

(assert (=> b!1237041 m!1141243))

(declare-fun m!1141245 () Bool)

(assert (=> b!1237041 m!1141245))

(assert (=> b!1237041 m!1141225))

(assert (=> b!1237037 m!1141241))

(declare-fun m!1141247 () Bool)

(assert (=> b!1237043 m!1141247))

(declare-fun m!1141249 () Bool)

(assert (=> b!1237038 m!1141249))

(check-sat (not b!1237040) (not b!1237041) (not start!103054) (not b!1237035) (not b!1237042) (not b!1237043) (not b!1237044) (not b!1237038) (not b!1237037))
(check-sat)
