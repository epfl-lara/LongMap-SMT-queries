; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102998 () Bool)

(assert start!102998)

(declare-fun b!1237363 () Bool)

(declare-fun res!825234 () Bool)

(declare-fun e!701285 () Bool)

(assert (=> b!1237363 (=> (not res!825234) (not e!701285))))

(declare-datatypes ((List!27266 0))(
  ( (Nil!27263) (Cons!27262 (h!28471 (_ BitVec 64)) (t!40729 List!27266)) )
))
(declare-fun acc!846 () List!27266)

(declare-fun noDuplicate!1925 (List!27266) Bool)

(assert (=> b!1237363 (= res!825234 (noDuplicate!1925 acc!846))))

(declare-fun b!1237364 () Bool)

(declare-fun res!825236 () Bool)

(assert (=> b!1237364 (=> (not res!825236) (not e!701285))))

(declare-datatypes ((array!79774 0))(
  ( (array!79775 (arr!38493 (Array (_ BitVec 32) (_ BitVec 64))) (size!39029 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79774)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79774 (_ BitVec 32) List!27266) Bool)

(assert (=> b!1237364 (= res!825236 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!825235 () Bool)

(assert (=> start!102998 (=> (not res!825235) (not e!701285))))

(assert (=> start!102998 (= res!825235 (and (bvslt (size!39029 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39029 a!3835))))))

(assert (=> start!102998 e!701285))

(declare-fun array_inv!29341 (array!79774) Bool)

(assert (=> start!102998 (array_inv!29341 a!3835)))

(assert (=> start!102998 true))

(declare-fun b!1237365 () Bool)

(declare-fun res!825233 () Bool)

(assert (=> b!1237365 (=> (not res!825233) (not e!701285))))

(declare-fun contains!7328 (List!27266 (_ BitVec 64)) Bool)

(assert (=> b!1237365 (= res!825233 (not (contains!7328 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237366 () Bool)

(declare-fun res!825238 () Bool)

(assert (=> b!1237366 (=> (not res!825238) (not e!701285))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237366 (= res!825238 (contains!7328 acc!846 k0!2925))))

(declare-fun b!1237367 () Bool)

(declare-fun res!825237 () Bool)

(assert (=> b!1237367 (=> (not res!825237) (not e!701285))))

(assert (=> b!1237367 (= res!825237 (not (= from!3213 (bvsub (size!39029 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237368 () Bool)

(declare-fun res!825232 () Bool)

(assert (=> b!1237368 (=> (not res!825232) (not e!701285))))

(assert (=> b!1237368 (= res!825232 (not (contains!7328 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237369 () Bool)

(assert (=> b!1237369 (= e!701285 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000)))))

(declare-fun lt!561022 () List!27266)

(declare-fun subseq!582 (List!27266 List!27266) Bool)

(assert (=> b!1237369 (subseq!582 acc!846 lt!561022)))

(declare-datatypes ((Unit!41062 0))(
  ( (Unit!41063) )
))
(declare-fun lt!561023 () Unit!41062)

(declare-fun subseqTail!69 (List!27266 List!27266) Unit!41062)

(assert (=> b!1237369 (= lt!561023 (subseqTail!69 lt!561022 lt!561022))))

(assert (=> b!1237369 (subseq!582 lt!561022 lt!561022)))

(declare-fun lt!561021 () Unit!41062)

(declare-fun lemmaListSubSeqRefl!0 (List!27266) Unit!41062)

(assert (=> b!1237369 (= lt!561021 (lemmaListSubSeqRefl!0 lt!561022))))

(assert (=> b!1237369 (= lt!561022 (Cons!27262 (select (arr!38493 a!3835) from!3213) acc!846))))

(declare-fun b!1237370 () Bool)

(declare-fun res!825231 () Bool)

(assert (=> b!1237370 (=> (not res!825231) (not e!701285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237370 (= res!825231 (validKeyInArray!0 (select (arr!38493 a!3835) from!3213)))))

(assert (= (and start!102998 res!825235) b!1237363))

(assert (= (and b!1237363 res!825234) b!1237365))

(assert (= (and b!1237365 res!825233) b!1237368))

(assert (= (and b!1237368 res!825232) b!1237364))

(assert (= (and b!1237364 res!825236) b!1237366))

(assert (= (and b!1237366 res!825238) b!1237367))

(assert (= (and b!1237367 res!825237) b!1237370))

(assert (= (and b!1237370 res!825231) b!1237369))

(declare-fun m!1141081 () Bool)

(assert (=> b!1237364 m!1141081))

(declare-fun m!1141083 () Bool)

(assert (=> b!1237368 m!1141083))

(declare-fun m!1141085 () Bool)

(assert (=> b!1237365 m!1141085))

(declare-fun m!1141087 () Bool)

(assert (=> start!102998 m!1141087))

(declare-fun m!1141089 () Bool)

(assert (=> b!1237366 m!1141089))

(declare-fun m!1141091 () Bool)

(assert (=> b!1237370 m!1141091))

(assert (=> b!1237370 m!1141091))

(declare-fun m!1141093 () Bool)

(assert (=> b!1237370 m!1141093))

(declare-fun m!1141095 () Bool)

(assert (=> b!1237363 m!1141095))

(declare-fun m!1141097 () Bool)

(assert (=> b!1237369 m!1141097))

(declare-fun m!1141099 () Bool)

(assert (=> b!1237369 m!1141099))

(assert (=> b!1237369 m!1141091))

(declare-fun m!1141101 () Bool)

(assert (=> b!1237369 m!1141101))

(declare-fun m!1141103 () Bool)

(assert (=> b!1237369 m!1141103))

(check-sat (not start!102998) (not b!1237364) (not b!1237365) (not b!1237366) (not b!1237363) (not b!1237369) (not b!1237370) (not b!1237368))
(check-sat)
