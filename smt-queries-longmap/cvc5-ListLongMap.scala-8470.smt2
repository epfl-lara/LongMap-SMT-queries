; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103122 () Bool)

(assert start!103122)

(declare-fun b!1238200 () Bool)

(declare-fun res!825934 () Bool)

(declare-fun e!701767 () Bool)

(assert (=> b!1238200 (=> (not res!825934) (not e!701767))))

(declare-datatypes ((List!27280 0))(
  ( (Nil!27277) (Cons!27276 (h!28485 (_ BitVec 64)) (t!40743 List!27280)) )
))
(declare-fun acc!846 () List!27280)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7342 (List!27280 (_ BitVec 64)) Bool)

(assert (=> b!1238200 (= res!825934 (contains!7342 acc!846 k!2925))))

(declare-fun b!1238201 () Bool)

(declare-fun res!825926 () Bool)

(assert (=> b!1238201 (=> (not res!825926) (not e!701767))))

(declare-datatypes ((array!79808 0))(
  ( (array!79809 (arr!38507 (Array (_ BitVec 32) (_ BitVec 64))) (size!39043 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79808)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238201 (= res!825926 (validKeyInArray!0 (select (arr!38507 a!3835) from!3213)))))

(declare-fun b!1238202 () Bool)

(declare-fun e!701768 () Bool)

(assert (=> b!1238202 (= e!701767 (not e!701768))))

(declare-fun res!825924 () Bool)

(assert (=> b!1238202 (=> res!825924 e!701768)))

(assert (=> b!1238202 (= res!825924 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!561232 () List!27280)

(declare-fun subseq!596 (List!27280 List!27280) Bool)

(assert (=> b!1238202 (subseq!596 acc!846 lt!561232)))

(declare-datatypes ((Unit!41100 0))(
  ( (Unit!41101) )
))
(declare-fun lt!561233 () Unit!41100)

(declare-fun subseqTail!83 (List!27280 List!27280) Unit!41100)

(assert (=> b!1238202 (= lt!561233 (subseqTail!83 lt!561232 lt!561232))))

(assert (=> b!1238202 (subseq!596 lt!561232 lt!561232)))

(declare-fun lt!561230 () Unit!41100)

(declare-fun lemmaListSubSeqRefl!0 (List!27280) Unit!41100)

(assert (=> b!1238202 (= lt!561230 (lemmaListSubSeqRefl!0 lt!561232))))

(assert (=> b!1238202 (= lt!561232 (Cons!27276 (select (arr!38507 a!3835) from!3213) acc!846))))

(declare-fun b!1238203 () Bool)

(declare-fun res!825932 () Bool)

(assert (=> b!1238203 (=> res!825932 e!701768)))

(assert (=> b!1238203 (= res!825932 (contains!7342 lt!561232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238204 () Bool)

(declare-fun res!825929 () Bool)

(assert (=> b!1238204 (=> (not res!825929) (not e!701767))))

(assert (=> b!1238204 (= res!825929 (not (= from!3213 (bvsub (size!39043 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!825928 () Bool)

(assert (=> start!103122 (=> (not res!825928) (not e!701767))))

(assert (=> start!103122 (= res!825928 (and (bvslt (size!39043 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39043 a!3835))))))

(assert (=> start!103122 e!701767))

(declare-fun array_inv!29355 (array!79808) Bool)

(assert (=> start!103122 (array_inv!29355 a!3835)))

(assert (=> start!103122 true))

(declare-fun b!1238205 () Bool)

(assert (=> b!1238205 (= e!701768 true)))

(declare-fun lt!561231 () Bool)

(assert (=> b!1238205 (= lt!561231 (contains!7342 lt!561232 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238206 () Bool)

(declare-fun res!825927 () Bool)

(assert (=> b!1238206 (=> res!825927 e!701768)))

(declare-fun noDuplicate!1939 (List!27280) Bool)

(assert (=> b!1238206 (= res!825927 (not (noDuplicate!1939 lt!561232)))))

(declare-fun b!1238207 () Bool)

(declare-fun res!825931 () Bool)

(assert (=> b!1238207 (=> (not res!825931) (not e!701767))))

(assert (=> b!1238207 (= res!825931 (not (contains!7342 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238208 () Bool)

(declare-fun res!825933 () Bool)

(assert (=> b!1238208 (=> (not res!825933) (not e!701767))))

(assert (=> b!1238208 (= res!825933 (not (contains!7342 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238209 () Bool)

(declare-fun res!825930 () Bool)

(assert (=> b!1238209 (=> (not res!825930) (not e!701767))))

(declare-fun arrayNoDuplicates!0 (array!79808 (_ BitVec 32) List!27280) Bool)

(assert (=> b!1238209 (= res!825930 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238210 () Bool)

(declare-fun res!825925 () Bool)

(assert (=> b!1238210 (=> (not res!825925) (not e!701767))))

(assert (=> b!1238210 (= res!825925 (noDuplicate!1939 acc!846))))

(assert (= (and start!103122 res!825928) b!1238210))

(assert (= (and b!1238210 res!825925) b!1238208))

(assert (= (and b!1238208 res!825933) b!1238207))

(assert (= (and b!1238207 res!825931) b!1238209))

(assert (= (and b!1238209 res!825930) b!1238200))

(assert (= (and b!1238200 res!825934) b!1238204))

(assert (= (and b!1238204 res!825929) b!1238201))

(assert (= (and b!1238201 res!825926) b!1238202))

(assert (= (and b!1238202 (not res!825924)) b!1238206))

(assert (= (and b!1238206 (not res!825927)) b!1238203))

(assert (= (and b!1238203 (not res!825932)) b!1238205))

(declare-fun m!1141765 () Bool)

(assert (=> b!1238206 m!1141765))

(declare-fun m!1141767 () Bool)

(assert (=> b!1238209 m!1141767))

(declare-fun m!1141769 () Bool)

(assert (=> b!1238207 m!1141769))

(declare-fun m!1141771 () Bool)

(assert (=> start!103122 m!1141771))

(declare-fun m!1141773 () Bool)

(assert (=> b!1238202 m!1141773))

(declare-fun m!1141775 () Bool)

(assert (=> b!1238202 m!1141775))

(declare-fun m!1141777 () Bool)

(assert (=> b!1238202 m!1141777))

(declare-fun m!1141779 () Bool)

(assert (=> b!1238202 m!1141779))

(declare-fun m!1141781 () Bool)

(assert (=> b!1238202 m!1141781))

(declare-fun m!1141783 () Bool)

(assert (=> b!1238208 m!1141783))

(declare-fun m!1141785 () Bool)

(assert (=> b!1238210 m!1141785))

(assert (=> b!1238201 m!1141781))

(assert (=> b!1238201 m!1141781))

(declare-fun m!1141787 () Bool)

(assert (=> b!1238201 m!1141787))

(declare-fun m!1141789 () Bool)

(assert (=> b!1238200 m!1141789))

(declare-fun m!1141791 () Bool)

(assert (=> b!1238203 m!1141791))

(declare-fun m!1141793 () Bool)

(assert (=> b!1238205 m!1141793))

(push 1)

(assert (not b!1238207))

(assert (not b!1238203))

(assert (not b!1238206))

(assert (not b!1238202))

(assert (not b!1238208))

(assert (not b!1238205))

(assert (not b!1238201))

(assert (not b!1238209))

(assert (not b!1238210))

(assert (not b!1238200))

(assert (not start!103122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

