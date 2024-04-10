; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103120 () Bool)

(assert start!103120)

(declare-fun b!1238167 () Bool)

(declare-fun res!825901 () Bool)

(declare-fun e!701758 () Bool)

(assert (=> b!1238167 (=> (not res!825901) (not e!701758))))

(declare-datatypes ((array!79806 0))(
  ( (array!79807 (arr!38506 (Array (_ BitVec 32) (_ BitVec 64))) (size!39042 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79806)

(declare-datatypes ((List!27279 0))(
  ( (Nil!27276) (Cons!27275 (h!28484 (_ BitVec 64)) (t!40742 List!27279)) )
))
(declare-fun acc!846 () List!27279)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79806 (_ BitVec 32) List!27279) Bool)

(assert (=> b!1238167 (= res!825901 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238168 () Bool)

(declare-fun res!825899 () Bool)

(assert (=> b!1238168 (=> (not res!825899) (not e!701758))))

(declare-fun noDuplicate!1938 (List!27279) Bool)

(assert (=> b!1238168 (= res!825899 (noDuplicate!1938 acc!846))))

(declare-fun b!1238169 () Bool)

(declare-fun res!825891 () Bool)

(assert (=> b!1238169 (=> (not res!825891) (not e!701758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238169 (= res!825891 (validKeyInArray!0 (select (arr!38506 a!3835) from!3213)))))

(declare-fun b!1238170 () Bool)

(declare-fun e!701760 () Bool)

(assert (=> b!1238170 (= e!701760 true)))

(declare-fun lt!561219 () Bool)

(declare-fun lt!561221 () List!27279)

(declare-fun contains!7341 (List!27279 (_ BitVec 64)) Bool)

(assert (=> b!1238170 (= lt!561219 (contains!7341 lt!561221 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238171 () Bool)

(declare-fun res!825895 () Bool)

(assert (=> b!1238171 (=> (not res!825895) (not e!701758))))

(assert (=> b!1238171 (= res!825895 (not (contains!7341 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!825898 () Bool)

(assert (=> start!103120 (=> (not res!825898) (not e!701758))))

(assert (=> start!103120 (= res!825898 (and (bvslt (size!39042 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39042 a!3835))))))

(assert (=> start!103120 e!701758))

(declare-fun array_inv!29354 (array!79806) Bool)

(assert (=> start!103120 (array_inv!29354 a!3835)))

(assert (=> start!103120 true))

(declare-fun b!1238172 () Bool)

(assert (=> b!1238172 (= e!701758 (not e!701760))))

(declare-fun res!825900 () Bool)

(assert (=> b!1238172 (=> res!825900 e!701760)))

(assert (=> b!1238172 (= res!825900 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!595 (List!27279 List!27279) Bool)

(assert (=> b!1238172 (subseq!595 acc!846 lt!561221)))

(declare-datatypes ((Unit!41098 0))(
  ( (Unit!41099) )
))
(declare-fun lt!561218 () Unit!41098)

(declare-fun subseqTail!82 (List!27279 List!27279) Unit!41098)

(assert (=> b!1238172 (= lt!561218 (subseqTail!82 lt!561221 lt!561221))))

(assert (=> b!1238172 (subseq!595 lt!561221 lt!561221)))

(declare-fun lt!561220 () Unit!41098)

(declare-fun lemmaListSubSeqRefl!0 (List!27279) Unit!41098)

(assert (=> b!1238172 (= lt!561220 (lemmaListSubSeqRefl!0 lt!561221))))

(assert (=> b!1238172 (= lt!561221 (Cons!27275 (select (arr!38506 a!3835) from!3213) acc!846))))

(declare-fun b!1238173 () Bool)

(declare-fun res!825893 () Bool)

(assert (=> b!1238173 (=> (not res!825893) (not e!701758))))

(assert (=> b!1238173 (= res!825893 (not (= from!3213 (bvsub (size!39042 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238174 () Bool)

(declare-fun res!825892 () Bool)

(assert (=> b!1238174 (=> res!825892 e!701760)))

(assert (=> b!1238174 (= res!825892 (not (noDuplicate!1938 lt!561221)))))

(declare-fun b!1238175 () Bool)

(declare-fun res!825894 () Bool)

(assert (=> b!1238175 (=> (not res!825894) (not e!701758))))

(assert (=> b!1238175 (= res!825894 (not (contains!7341 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238176 () Bool)

(declare-fun res!825897 () Bool)

(assert (=> b!1238176 (=> res!825897 e!701760)))

(assert (=> b!1238176 (= res!825897 (contains!7341 lt!561221 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238177 () Bool)

(declare-fun res!825896 () Bool)

(assert (=> b!1238177 (=> (not res!825896) (not e!701758))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238177 (= res!825896 (contains!7341 acc!846 k!2925))))

(assert (= (and start!103120 res!825898) b!1238168))

(assert (= (and b!1238168 res!825899) b!1238175))

(assert (= (and b!1238175 res!825894) b!1238171))

(assert (= (and b!1238171 res!825895) b!1238167))

(assert (= (and b!1238167 res!825901) b!1238177))

(assert (= (and b!1238177 res!825896) b!1238173))

(assert (= (and b!1238173 res!825893) b!1238169))

(assert (= (and b!1238169 res!825891) b!1238172))

(assert (= (and b!1238172 (not res!825900)) b!1238174))

(assert (= (and b!1238174 (not res!825892)) b!1238176))

(assert (= (and b!1238176 (not res!825897)) b!1238170))

(declare-fun m!1141735 () Bool)

(assert (=> b!1238174 m!1141735))

(declare-fun m!1141737 () Bool)

(assert (=> b!1238175 m!1141737))

(declare-fun m!1141739 () Bool)

(assert (=> b!1238171 m!1141739))

(declare-fun m!1141741 () Bool)

(assert (=> b!1238176 m!1141741))

(declare-fun m!1141743 () Bool)

(assert (=> start!103120 m!1141743))

(declare-fun m!1141745 () Bool)

(assert (=> b!1238167 m!1141745))

(declare-fun m!1141747 () Bool)

(assert (=> b!1238170 m!1141747))

(declare-fun m!1141749 () Bool)

(assert (=> b!1238169 m!1141749))

(assert (=> b!1238169 m!1141749))

(declare-fun m!1141751 () Bool)

(assert (=> b!1238169 m!1141751))

(declare-fun m!1141753 () Bool)

(assert (=> b!1238172 m!1141753))

(declare-fun m!1141755 () Bool)

(assert (=> b!1238172 m!1141755))

(declare-fun m!1141757 () Bool)

(assert (=> b!1238172 m!1141757))

(declare-fun m!1141759 () Bool)

(assert (=> b!1238172 m!1141759))

(assert (=> b!1238172 m!1141749))

(declare-fun m!1141761 () Bool)

(assert (=> b!1238177 m!1141761))

(declare-fun m!1141763 () Bool)

(assert (=> b!1238168 m!1141763))

(push 1)

(assert (not b!1238174))

(assert (not b!1238175))

(assert (not b!1238170))

(assert (not b!1238168))

(assert (not b!1238167))

(assert (not b!1238177))

(assert (not b!1238176))

(assert (not b!1238172))

(assert (not b!1238169))

(assert (not b!1238171))

(assert (not start!103120))

(check-sat)

(pop 1)

