; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102990 () Bool)

(assert start!102990)

(declare-fun b!1237267 () Bool)

(declare-fun res!825139 () Bool)

(declare-fun e!701262 () Bool)

(assert (=> b!1237267 (=> (not res!825139) (not e!701262))))

(declare-datatypes ((List!27262 0))(
  ( (Nil!27259) (Cons!27258 (h!28467 (_ BitVec 64)) (t!40725 List!27262)) )
))
(declare-fun acc!846 () List!27262)

(declare-fun contains!7324 (List!27262 (_ BitVec 64)) Bool)

(assert (=> b!1237267 (= res!825139 (not (contains!7324 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237268 () Bool)

(declare-fun res!825141 () Bool)

(assert (=> b!1237268 (=> (not res!825141) (not e!701262))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79766 0))(
  ( (array!79767 (arr!38489 (Array (_ BitVec 32) (_ BitVec 64))) (size!39025 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79766)

(assert (=> b!1237268 (= res!825141 (not (= from!3213 (bvsub (size!39025 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237269 () Bool)

(assert (=> b!1237269 (= e!701262 (not true))))

(declare-fun lt!560987 () List!27262)

(declare-fun subseq!578 (List!27262 List!27262) Bool)

(assert (=> b!1237269 (subseq!578 acc!846 lt!560987)))

(declare-datatypes ((Unit!41054 0))(
  ( (Unit!41055) )
))
(declare-fun lt!560986 () Unit!41054)

(declare-fun subseqTail!65 (List!27262 List!27262) Unit!41054)

(assert (=> b!1237269 (= lt!560986 (subseqTail!65 lt!560987 lt!560987))))

(assert (=> b!1237269 (subseq!578 lt!560987 lt!560987)))

(declare-fun lt!560985 () Unit!41054)

(declare-fun lemmaListSubSeqRefl!0 (List!27262) Unit!41054)

(assert (=> b!1237269 (= lt!560985 (lemmaListSubSeqRefl!0 lt!560987))))

(assert (=> b!1237269 (= lt!560987 (Cons!27258 (select (arr!38489 a!3835) from!3213) acc!846))))

(declare-fun b!1237270 () Bool)

(declare-fun res!825137 () Bool)

(assert (=> b!1237270 (=> (not res!825137) (not e!701262))))

(declare-fun noDuplicate!1921 (List!27262) Bool)

(assert (=> b!1237270 (= res!825137 (noDuplicate!1921 acc!846))))

(declare-fun b!1237271 () Bool)

(declare-fun res!825140 () Bool)

(assert (=> b!1237271 (=> (not res!825140) (not e!701262))))

(declare-fun arrayNoDuplicates!0 (array!79766 (_ BitVec 32) List!27262) Bool)

(assert (=> b!1237271 (= res!825140 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237272 () Bool)

(declare-fun res!825142 () Bool)

(assert (=> b!1237272 (=> (not res!825142) (not e!701262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237272 (= res!825142 (validKeyInArray!0 (select (arr!38489 a!3835) from!3213)))))

(declare-fun b!1237273 () Bool)

(declare-fun res!825136 () Bool)

(assert (=> b!1237273 (=> (not res!825136) (not e!701262))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1237273 (= res!825136 (contains!7324 acc!846 k!2925))))

(declare-fun res!825138 () Bool)

(assert (=> start!102990 (=> (not res!825138) (not e!701262))))

(assert (=> start!102990 (= res!825138 (and (bvslt (size!39025 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39025 a!3835))))))

(assert (=> start!102990 e!701262))

(declare-fun array_inv!29337 (array!79766) Bool)

(assert (=> start!102990 (array_inv!29337 a!3835)))

(assert (=> start!102990 true))

(declare-fun b!1237274 () Bool)

(declare-fun res!825135 () Bool)

(assert (=> b!1237274 (=> (not res!825135) (not e!701262))))

(assert (=> b!1237274 (= res!825135 (not (contains!7324 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102990 res!825138) b!1237270))

(assert (= (and b!1237270 res!825137) b!1237274))

(assert (= (and b!1237274 res!825135) b!1237267))

(assert (= (and b!1237267 res!825139) b!1237271))

(assert (= (and b!1237271 res!825140) b!1237273))

(assert (= (and b!1237273 res!825136) b!1237268))

(assert (= (and b!1237268 res!825141) b!1237272))

(assert (= (and b!1237272 res!825142) b!1237269))

(declare-fun m!1140985 () Bool)

(assert (=> b!1237267 m!1140985))

(declare-fun m!1140987 () Bool)

(assert (=> b!1237273 m!1140987))

(declare-fun m!1140989 () Bool)

(assert (=> b!1237269 m!1140989))

(declare-fun m!1140991 () Bool)

(assert (=> b!1237269 m!1140991))

(declare-fun m!1140993 () Bool)

(assert (=> b!1237269 m!1140993))

(declare-fun m!1140995 () Bool)

(assert (=> b!1237269 m!1140995))

(declare-fun m!1140997 () Bool)

(assert (=> b!1237269 m!1140997))

(assert (=> b!1237272 m!1140993))

(assert (=> b!1237272 m!1140993))

(declare-fun m!1140999 () Bool)

(assert (=> b!1237272 m!1140999))

(declare-fun m!1141001 () Bool)

(assert (=> b!1237270 m!1141001))

(declare-fun m!1141003 () Bool)

(assert (=> b!1237271 m!1141003))

(declare-fun m!1141005 () Bool)

(assert (=> start!102990 m!1141005))

(declare-fun m!1141007 () Bool)

(assert (=> b!1237274 m!1141007))

(push 1)

(assert (not b!1237273))

(assert (not b!1237271))

(assert (not b!1237272))

(assert (not b!1237267))

(assert (not b!1237269))

(assert (not b!1237270))

(assert (not start!102990))

(assert (not b!1237274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

