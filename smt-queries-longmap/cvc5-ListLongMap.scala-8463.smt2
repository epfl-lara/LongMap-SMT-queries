; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102986 () Bool)

(assert start!102986)

(declare-fun b!1237175 () Bool)

(declare-fun res!825080 () Bool)

(declare-fun e!701221 () Bool)

(assert (=> b!1237175 (=> (not res!825080) (not e!701221))))

(declare-datatypes ((array!79685 0))(
  ( (array!79686 (arr!38449 (Array (_ BitVec 32) (_ BitVec 64))) (size!38987 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79685)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237175 (= res!825080 (validKeyInArray!0 (select (arr!38449 a!3835) from!3213)))))

(declare-fun b!1237176 () Bool)

(declare-fun res!825081 () Bool)

(assert (=> b!1237176 (=> (not res!825081) (not e!701221))))

(declare-datatypes ((List!27323 0))(
  ( (Nil!27320) (Cons!27319 (h!28528 (_ BitVec 64)) (t!40777 List!27323)) )
))
(declare-fun acc!846 () List!27323)

(declare-fun noDuplicate!1938 (List!27323) Bool)

(assert (=> b!1237176 (= res!825081 (noDuplicate!1938 acc!846))))

(declare-fun b!1237177 () Bool)

(assert (=> b!1237177 (= e!701221 (not true))))

(declare-fun lt!560804 () List!27323)

(declare-fun subseq!577 (List!27323 List!27323) Bool)

(assert (=> b!1237177 (subseq!577 acc!846 lt!560804)))

(declare-datatypes ((Unit!40897 0))(
  ( (Unit!40898) )
))
(declare-fun lt!560803 () Unit!40897)

(declare-fun subseqTail!64 (List!27323 List!27323) Unit!40897)

(assert (=> b!1237177 (= lt!560803 (subseqTail!64 lt!560804 lt!560804))))

(assert (=> b!1237177 (subseq!577 lt!560804 lt!560804)))

(declare-fun lt!560802 () Unit!40897)

(declare-fun lemmaListSubSeqRefl!0 (List!27323) Unit!40897)

(assert (=> b!1237177 (= lt!560802 (lemmaListSubSeqRefl!0 lt!560804))))

(assert (=> b!1237177 (= lt!560804 (Cons!27319 (select (arr!38449 a!3835) from!3213) acc!846))))

(declare-fun b!1237178 () Bool)

(declare-fun res!825086 () Bool)

(assert (=> b!1237178 (=> (not res!825086) (not e!701221))))

(assert (=> b!1237178 (= res!825086 (not (= from!3213 (bvsub (size!38987 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237179 () Bool)

(declare-fun res!825085 () Bool)

(assert (=> b!1237179 (=> (not res!825085) (not e!701221))))

(declare-fun contains!7295 (List!27323 (_ BitVec 64)) Bool)

(assert (=> b!1237179 (= res!825085 (not (contains!7295 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237180 () Bool)

(declare-fun res!825079 () Bool)

(assert (=> b!1237180 (=> (not res!825079) (not e!701221))))

(declare-fun arrayNoDuplicates!0 (array!79685 (_ BitVec 32) List!27323) Bool)

(assert (=> b!1237180 (= res!825079 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237181 () Bool)

(declare-fun res!825083 () Bool)

(assert (=> b!1237181 (=> (not res!825083) (not e!701221))))

(assert (=> b!1237181 (= res!825083 (not (contains!7295 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!825084 () Bool)

(assert (=> start!102986 (=> (not res!825084) (not e!701221))))

(assert (=> start!102986 (= res!825084 (and (bvslt (size!38987 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38987 a!3835))))))

(assert (=> start!102986 e!701221))

(declare-fun array_inv!29432 (array!79685) Bool)

(assert (=> start!102986 (array_inv!29432 a!3835)))

(assert (=> start!102986 true))

(declare-fun b!1237182 () Bool)

(declare-fun res!825082 () Bool)

(assert (=> b!1237182 (=> (not res!825082) (not e!701221))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1237182 (= res!825082 (contains!7295 acc!846 k!2925))))

(assert (= (and start!102986 res!825084) b!1237176))

(assert (= (and b!1237176 res!825081) b!1237179))

(assert (= (and b!1237179 res!825085) b!1237181))

(assert (= (and b!1237181 res!825083) b!1237180))

(assert (= (and b!1237180 res!825079) b!1237182))

(assert (= (and b!1237182 res!825082) b!1237178))

(assert (= (and b!1237178 res!825086) b!1237175))

(assert (= (and b!1237175 res!825080) b!1237177))

(declare-fun m!1140465 () Bool)

(assert (=> b!1237182 m!1140465))

(declare-fun m!1140467 () Bool)

(assert (=> start!102986 m!1140467))

(declare-fun m!1140469 () Bool)

(assert (=> b!1237175 m!1140469))

(assert (=> b!1237175 m!1140469))

(declare-fun m!1140471 () Bool)

(assert (=> b!1237175 m!1140471))

(declare-fun m!1140473 () Bool)

(assert (=> b!1237176 m!1140473))

(declare-fun m!1140475 () Bool)

(assert (=> b!1237180 m!1140475))

(declare-fun m!1140477 () Bool)

(assert (=> b!1237179 m!1140477))

(declare-fun m!1140479 () Bool)

(assert (=> b!1237181 m!1140479))

(declare-fun m!1140481 () Bool)

(assert (=> b!1237177 m!1140481))

(declare-fun m!1140483 () Bool)

(assert (=> b!1237177 m!1140483))

(declare-fun m!1140485 () Bool)

(assert (=> b!1237177 m!1140485))

(declare-fun m!1140487 () Bool)

(assert (=> b!1237177 m!1140487))

(assert (=> b!1237177 m!1140469))

(push 1)

(assert (not b!1237181))

(assert (not b!1237176))

(assert (not start!102986))

(assert (not b!1237175))

(assert (not b!1237177))

(assert (not b!1237180))

(assert (not b!1237182))

(assert (not b!1237179))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

