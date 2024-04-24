; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103048 () Bool)

(assert start!103048)

(declare-fun b!1236945 () Bool)

(declare-fun res!824259 () Bool)

(declare-fun e!701384 () Bool)

(assert (=> b!1236945 (=> (not res!824259) (not e!701384))))

(declare-datatypes ((List!27233 0))(
  ( (Nil!27230) (Cons!27229 (h!28447 (_ BitVec 64)) (t!40688 List!27233)) )
))
(declare-fun acc!846 () List!27233)

(declare-fun noDuplicate!1885 (List!27233) Bool)

(assert (=> b!1236945 (= res!824259 (noDuplicate!1885 acc!846))))

(declare-fun b!1236946 () Bool)

(declare-fun res!824258 () Bool)

(assert (=> b!1236946 (=> (not res!824258) (not e!701384))))

(declare-fun contains!7304 (List!27233 (_ BitVec 64)) Bool)

(assert (=> b!1236946 (= res!824258 (not (contains!7304 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236947 () Bool)

(declare-fun res!824260 () Bool)

(assert (=> b!1236947 (=> (not res!824260) (not e!701384))))

(assert (=> b!1236947 (= res!824260 (not (contains!7304 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236948 () Bool)

(declare-fun res!824262 () Bool)

(assert (=> b!1236948 (=> (not res!824262) (not e!701384))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236948 (= res!824262 (contains!7304 acc!846 k0!2925))))

(declare-fun res!824261 () Bool)

(assert (=> start!103048 (=> (not res!824261) (not e!701384))))

(declare-datatypes ((array!79691 0))(
  ( (array!79692 (arr!38447 (Array (_ BitVec 32) (_ BitVec 64))) (size!38984 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79691)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103048 (= res!824261 (and (bvslt (size!38984 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38984 a!3835))))))

(assert (=> start!103048 e!701384))

(declare-fun array_inv!29385 (array!79691) Bool)

(assert (=> start!103048 (array_inv!29385 a!3835)))

(assert (=> start!103048 true))

(declare-fun b!1236949 () Bool)

(declare-datatypes ((Unit!40922 0))(
  ( (Unit!40923) )
))
(declare-fun e!701382 () Unit!40922)

(declare-fun Unit!40924 () Unit!40922)

(assert (=> b!1236949 (= e!701382 Unit!40924)))

(declare-fun b!1236950 () Bool)

(declare-fun res!824264 () Bool)

(assert (=> b!1236950 (=> (not res!824264) (not e!701384))))

(assert (=> b!1236950 (= res!824264 (not (= from!3213 (bvsub (size!38984 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236951 () Bool)

(declare-fun lt!560890 () Unit!40922)

(assert (=> b!1236951 (= e!701382 lt!560890)))

(declare-fun lt!560887 () List!27233)

(assert (=> b!1236951 (= lt!560887 (Cons!27229 (select (arr!38447 a!3835) from!3213) acc!846))))

(declare-fun lt!560889 () Unit!40922)

(declare-fun lemmaListSubSeqRefl!0 (List!27233) Unit!40922)

(assert (=> b!1236951 (= lt!560889 (lemmaListSubSeqRefl!0 lt!560887))))

(declare-fun subseq!542 (List!27233 List!27233) Bool)

(assert (=> b!1236951 (subseq!542 lt!560887 lt!560887)))

(declare-fun lt!560886 () Unit!40922)

(declare-fun subseqTail!35 (List!27233 List!27233) Unit!40922)

(assert (=> b!1236951 (= lt!560886 (subseqTail!35 lt!560887 lt!560887))))

(assert (=> b!1236951 (subseq!542 acc!846 lt!560887)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79691 List!27233 List!27233 (_ BitVec 32)) Unit!40922)

(assert (=> b!1236951 (= lt!560890 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560887 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79691 (_ BitVec 32) List!27233) Bool)

(assert (=> b!1236951 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236952 () Bool)

(declare-fun e!701381 () Bool)

(assert (=> b!1236952 (= e!701384 e!701381)))

(declare-fun res!824263 () Bool)

(assert (=> b!1236952 (=> (not res!824263) (not e!701381))))

(assert (=> b!1236952 (= res!824263 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38984 a!3835))))))

(declare-fun lt!560888 () Unit!40922)

(assert (=> b!1236952 (= lt!560888 e!701382)))

(declare-fun c!121211 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236952 (= c!121211 (validKeyInArray!0 (select (arr!38447 a!3835) from!3213)))))

(declare-fun b!1236953 () Bool)

(assert (=> b!1236953 (= e!701381 false)))

(declare-fun lt!560891 () Bool)

(assert (=> b!1236953 (= lt!560891 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236954 () Bool)

(declare-fun res!824265 () Bool)

(assert (=> b!1236954 (=> (not res!824265) (not e!701384))))

(assert (=> b!1236954 (= res!824265 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!103048 res!824261) b!1236945))

(assert (= (and b!1236945 res!824259) b!1236946))

(assert (= (and b!1236946 res!824258) b!1236947))

(assert (= (and b!1236947 res!824260) b!1236954))

(assert (= (and b!1236954 res!824265) b!1236948))

(assert (= (and b!1236948 res!824262) b!1236950))

(assert (= (and b!1236950 res!824264) b!1236952))

(assert (= (and b!1236952 c!121211) b!1236951))

(assert (= (and b!1236952 (not c!121211)) b!1236949))

(assert (= (and b!1236952 res!824263) b!1236953))

(declare-fun m!1141139 () Bool)

(assert (=> b!1236954 m!1141139))

(declare-fun m!1141141 () Bool)

(assert (=> start!103048 m!1141141))

(declare-fun m!1141143 () Bool)

(assert (=> b!1236952 m!1141143))

(assert (=> b!1236952 m!1141143))

(declare-fun m!1141145 () Bool)

(assert (=> b!1236952 m!1141145))

(declare-fun m!1141147 () Bool)

(assert (=> b!1236947 m!1141147))

(declare-fun m!1141149 () Bool)

(assert (=> b!1236948 m!1141149))

(declare-fun m!1141151 () Bool)

(assert (=> b!1236945 m!1141151))

(declare-fun m!1141153 () Bool)

(assert (=> b!1236951 m!1141153))

(declare-fun m!1141155 () Bool)

(assert (=> b!1236951 m!1141155))

(declare-fun m!1141157 () Bool)

(assert (=> b!1236951 m!1141157))

(declare-fun m!1141159 () Bool)

(assert (=> b!1236951 m!1141159))

(declare-fun m!1141161 () Bool)

(assert (=> b!1236951 m!1141161))

(declare-fun m!1141163 () Bool)

(assert (=> b!1236951 m!1141163))

(assert (=> b!1236951 m!1141143))

(assert (=> b!1236953 m!1141163))

(declare-fun m!1141165 () Bool)

(assert (=> b!1236946 m!1141165))

(check-sat (not b!1236952) (not b!1236954) (not b!1236953) (not b!1236948) (not b!1236947) (not b!1236945) (not start!103048) (not b!1236951) (not b!1236946))
(check-sat)
