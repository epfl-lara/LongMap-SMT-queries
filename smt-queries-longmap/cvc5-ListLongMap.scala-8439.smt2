; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102770 () Bool)

(assert start!102770)

(declare-fun b!1234927 () Bool)

(declare-fun res!823125 () Bool)

(declare-fun e!700285 () Bool)

(assert (=> b!1234927 (=> res!823125 e!700285)))

(declare-datatypes ((List!27251 0))(
  ( (Nil!27248) (Cons!27247 (h!28456 (_ BitVec 64)) (t!40705 List!27251)) )
))
(declare-fun lt!559916 () List!27251)

(declare-fun contains!7223 (List!27251 (_ BitVec 64)) Bool)

(assert (=> b!1234927 (= res!823125 (contains!7223 lt!559916 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234928 () Bool)

(declare-fun res!823134 () Bool)

(assert (=> b!1234928 (=> res!823134 e!700285)))

(assert (=> b!1234928 (= res!823134 (contains!7223 lt!559916 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234929 () Bool)

(declare-fun res!823126 () Bool)

(declare-fun e!700286 () Bool)

(assert (=> b!1234929 (=> (not res!823126) (not e!700286))))

(declare-datatypes ((array!79538 0))(
  ( (array!79539 (arr!38377 (Array (_ BitVec 32) (_ BitVec 64))) (size!38915 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79538)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234929 (= res!823126 (validKeyInArray!0 (select (arr!38377 a!3835) from!3213)))))

(declare-fun b!1234930 () Bool)

(declare-fun res!823129 () Bool)

(assert (=> b!1234930 (=> (not res!823129) (not e!700286))))

(declare-fun acc!846 () List!27251)

(assert (=> b!1234930 (= res!823129 (not (contains!7223 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234931 () Bool)

(declare-fun res!823131 () Bool)

(assert (=> b!1234931 (=> (not res!823131) (not e!700286))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234931 (= res!823131 (contains!7223 acc!846 k!2925))))

(declare-fun b!1234932 () Bool)

(declare-fun res!823132 () Bool)

(assert (=> b!1234932 (=> res!823132 e!700285)))

(declare-fun noDuplicate!1866 (List!27251) Bool)

(assert (=> b!1234932 (= res!823132 (not (noDuplicate!1866 lt!559916)))))

(declare-fun b!1234933 () Bool)

(assert (=> b!1234933 (= e!700285 true)))

(declare-fun lt!559915 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79538 (_ BitVec 32) List!27251) Bool)

(assert (=> b!1234933 (= lt!559915 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559916))))

(declare-datatypes ((Unit!40749 0))(
  ( (Unit!40750) )
))
(declare-fun lt!559913 () Unit!40749)

(declare-fun noDuplicateSubseq!70 (List!27251 List!27251) Unit!40749)

(assert (=> b!1234933 (= lt!559913 (noDuplicateSubseq!70 acc!846 lt!559916))))

(declare-fun res!823135 () Bool)

(assert (=> start!102770 (=> (not res!823135) (not e!700286))))

(assert (=> start!102770 (= res!823135 (and (bvslt (size!38915 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38915 a!3835))))))

(assert (=> start!102770 e!700286))

(declare-fun array_inv!29360 (array!79538) Bool)

(assert (=> start!102770 (array_inv!29360 a!3835)))

(assert (=> start!102770 true))

(declare-fun b!1234934 () Bool)

(assert (=> b!1234934 (= e!700286 (not e!700285))))

(declare-fun res!823127 () Bool)

(assert (=> b!1234934 (=> res!823127 e!700285)))

(assert (=> b!1234934 (= res!823127 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!523 (List!27251 List!27251) Bool)

(assert (=> b!1234934 (subseq!523 acc!846 lt!559916)))

(declare-fun lt!559914 () Unit!40749)

(declare-fun subseqTail!16 (List!27251 List!27251) Unit!40749)

(assert (=> b!1234934 (= lt!559914 (subseqTail!16 lt!559916 lt!559916))))

(assert (=> b!1234934 (subseq!523 lt!559916 lt!559916)))

(declare-fun lt!559912 () Unit!40749)

(declare-fun lemmaListSubSeqRefl!0 (List!27251) Unit!40749)

(assert (=> b!1234934 (= lt!559912 (lemmaListSubSeqRefl!0 lt!559916))))

(assert (=> b!1234934 (= lt!559916 (Cons!27247 (select (arr!38377 a!3835) from!3213) acc!846))))

(declare-fun b!1234935 () Bool)

(declare-fun res!823128 () Bool)

(assert (=> b!1234935 (=> (not res!823128) (not e!700286))))

(assert (=> b!1234935 (= res!823128 (not (= from!3213 (bvsub (size!38915 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234936 () Bool)

(declare-fun res!823136 () Bool)

(assert (=> b!1234936 (=> (not res!823136) (not e!700286))))

(assert (=> b!1234936 (= res!823136 (noDuplicate!1866 acc!846))))

(declare-fun b!1234937 () Bool)

(declare-fun res!823130 () Bool)

(assert (=> b!1234937 (=> (not res!823130) (not e!700286))))

(assert (=> b!1234937 (= res!823130 (not (contains!7223 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234938 () Bool)

(declare-fun res!823133 () Bool)

(assert (=> b!1234938 (=> (not res!823133) (not e!700286))))

(assert (=> b!1234938 (= res!823133 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102770 res!823135) b!1234936))

(assert (= (and b!1234936 res!823136) b!1234937))

(assert (= (and b!1234937 res!823130) b!1234930))

(assert (= (and b!1234930 res!823129) b!1234938))

(assert (= (and b!1234938 res!823133) b!1234931))

(assert (= (and b!1234931 res!823131) b!1234935))

(assert (= (and b!1234935 res!823128) b!1234929))

(assert (= (and b!1234929 res!823126) b!1234934))

(assert (= (and b!1234934 (not res!823127)) b!1234932))

(assert (= (and b!1234932 (not res!823132)) b!1234928))

(assert (= (and b!1234928 (not res!823134)) b!1234927))

(assert (= (and b!1234927 (not res!823125)) b!1234933))

(declare-fun m!1138403 () Bool)

(assert (=> b!1234927 m!1138403))

(declare-fun m!1138405 () Bool)

(assert (=> b!1234930 m!1138405))

(declare-fun m!1138407 () Bool)

(assert (=> b!1234934 m!1138407))

(declare-fun m!1138409 () Bool)

(assert (=> b!1234934 m!1138409))

(declare-fun m!1138411 () Bool)

(assert (=> b!1234934 m!1138411))

(declare-fun m!1138413 () Bool)

(assert (=> b!1234934 m!1138413))

(declare-fun m!1138415 () Bool)

(assert (=> b!1234934 m!1138415))

(declare-fun m!1138417 () Bool)

(assert (=> b!1234933 m!1138417))

(declare-fun m!1138419 () Bool)

(assert (=> b!1234933 m!1138419))

(declare-fun m!1138421 () Bool)

(assert (=> b!1234931 m!1138421))

(declare-fun m!1138423 () Bool)

(assert (=> b!1234928 m!1138423))

(declare-fun m!1138425 () Bool)

(assert (=> b!1234937 m!1138425))

(assert (=> b!1234929 m!1138415))

(assert (=> b!1234929 m!1138415))

(declare-fun m!1138427 () Bool)

(assert (=> b!1234929 m!1138427))

(declare-fun m!1138429 () Bool)

(assert (=> b!1234938 m!1138429))

(declare-fun m!1138431 () Bool)

(assert (=> start!102770 m!1138431))

(declare-fun m!1138433 () Bool)

(assert (=> b!1234932 m!1138433))

(declare-fun m!1138435 () Bool)

(assert (=> b!1234936 m!1138435))

(push 1)

(assert (not b!1234932))

(assert (not b!1234938))

(assert (not b!1234937))

(assert (not b!1234931))

(assert (not b!1234934))

(assert (not b!1234927))

(assert (not b!1234928))

(assert (not b!1234929))

(assert (not b!1234933))

(assert (not start!102770))

(assert (not b!1234930))

(assert (not b!1234936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

