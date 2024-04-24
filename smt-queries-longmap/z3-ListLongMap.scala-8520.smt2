; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104152 () Bool)

(assert start!104152)

(declare-fun b!1245176 () Bool)

(declare-fun e!705909 () Bool)

(declare-fun e!705910 () Bool)

(assert (=> b!1245176 (= e!705909 e!705910)))

(declare-fun res!830170 () Bool)

(assert (=> b!1245176 (=> (not res!830170) (not e!705910))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1245176 (= res!830170 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27425 0))(
  ( (Nil!27422) (Cons!27421 (h!28639 (_ BitVec 64)) (t!40886 List!27425)) )
))
(declare-fun lt!562988 () List!27425)

(declare-datatypes ((array!80043 0))(
  ( (array!80044 (arr!38609 (Array (_ BitVec 32) (_ BitVec 64))) (size!39146 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80043)

(assert (=> b!1245176 (= lt!562988 (Cons!27421 (select (arr!38609 a!3892) from!3270) Nil!27422))))

(declare-fun b!1245177 () Bool)

(assert (=> b!1245177 (= e!705910 false)))

(declare-fun lt!562986 () Bool)

(declare-fun arrayNoDuplicates!0 (array!80043 (_ BitVec 32) List!27425) Bool)

(assert (=> b!1245177 (= lt!562986 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562988))))

(declare-datatypes ((Unit!41276 0))(
  ( (Unit!41277) )
))
(declare-fun lt!562987 () Unit!41276)

(declare-fun noDuplicateSubseq!101 (List!27425 List!27425) Unit!41276)

(assert (=> b!1245177 (= lt!562987 (noDuplicateSubseq!101 Nil!27422 lt!562988))))

(declare-fun b!1245178 () Bool)

(declare-fun res!830163 () Bool)

(assert (=> b!1245178 (=> (not res!830163) (not e!705910))))

(declare-fun noDuplicate!2017 (List!27425) Bool)

(assert (=> b!1245178 (= res!830163 (noDuplicate!2017 lt!562988))))

(declare-fun res!830162 () Bool)

(assert (=> start!104152 (=> (not res!830162) (not e!705909))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104152 (= res!830162 (and (bvslt (size!39146 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39146 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39146 a!3892))))))

(assert (=> start!104152 e!705909))

(declare-fun array_inv!29547 (array!80043) Bool)

(assert (=> start!104152 (array_inv!29547 a!3892)))

(assert (=> start!104152 true))

(declare-fun b!1245179 () Bool)

(declare-fun res!830164 () Bool)

(assert (=> b!1245179 (=> (not res!830164) (not e!705909))))

(assert (=> b!1245179 (= res!830164 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27422))))

(declare-fun b!1245180 () Bool)

(declare-fun res!830165 () Bool)

(assert (=> b!1245180 (=> (not res!830165) (not e!705910))))

(declare-fun contains!7455 (List!27425 (_ BitVec 64)) Bool)

(assert (=> b!1245180 (= res!830165 (not (contains!7455 Nil!27422 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245181 () Bool)

(declare-fun res!830166 () Bool)

(assert (=> b!1245181 (=> (not res!830166) (not e!705909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245181 (= res!830166 (validKeyInArray!0 (select (arr!38609 a!3892) from!3270)))))

(declare-fun b!1245182 () Bool)

(declare-fun res!830167 () Bool)

(assert (=> b!1245182 (=> (not res!830167) (not e!705910))))

(declare-fun subseq!647 (List!27425 List!27425) Bool)

(assert (=> b!1245182 (= res!830167 (subseq!647 Nil!27422 lt!562988))))

(declare-fun b!1245183 () Bool)

(declare-fun res!830171 () Bool)

(assert (=> b!1245183 (=> (not res!830171) (not e!705909))))

(assert (=> b!1245183 (= res!830171 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39146 a!3892)) (not (= newFrom!287 (size!39146 a!3892)))))))

(declare-fun b!1245184 () Bool)

(declare-fun res!830168 () Bool)

(assert (=> b!1245184 (=> (not res!830168) (not e!705910))))

(assert (=> b!1245184 (= res!830168 (not (contains!7455 lt!562988 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245185 () Bool)

(declare-fun res!830169 () Bool)

(assert (=> b!1245185 (=> (not res!830169) (not e!705910))))

(assert (=> b!1245185 (= res!830169 (not (contains!7455 Nil!27422 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245186 () Bool)

(declare-fun res!830172 () Bool)

(assert (=> b!1245186 (=> (not res!830172) (not e!705910))))

(assert (=> b!1245186 (= res!830172 (not (contains!7455 lt!562988 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!104152 res!830162) b!1245179))

(assert (= (and b!1245179 res!830164) b!1245183))

(assert (= (and b!1245183 res!830171) b!1245181))

(assert (= (and b!1245181 res!830166) b!1245176))

(assert (= (and b!1245176 res!830170) b!1245178))

(assert (= (and b!1245178 res!830163) b!1245184))

(assert (= (and b!1245184 res!830168) b!1245186))

(assert (= (and b!1245186 res!830172) b!1245180))

(assert (= (and b!1245180 res!830165) b!1245185))

(assert (= (and b!1245185 res!830169) b!1245182))

(assert (= (and b!1245182 res!830167) b!1245177))

(declare-fun m!1147939 () Bool)

(assert (=> b!1245181 m!1147939))

(assert (=> b!1245181 m!1147939))

(declare-fun m!1147941 () Bool)

(assert (=> b!1245181 m!1147941))

(declare-fun m!1147943 () Bool)

(assert (=> b!1245182 m!1147943))

(declare-fun m!1147945 () Bool)

(assert (=> b!1245178 m!1147945))

(declare-fun m!1147947 () Bool)

(assert (=> start!104152 m!1147947))

(declare-fun m!1147949 () Bool)

(assert (=> b!1245180 m!1147949))

(declare-fun m!1147951 () Bool)

(assert (=> b!1245185 m!1147951))

(declare-fun m!1147953 () Bool)

(assert (=> b!1245177 m!1147953))

(declare-fun m!1147955 () Bool)

(assert (=> b!1245177 m!1147955))

(declare-fun m!1147957 () Bool)

(assert (=> b!1245179 m!1147957))

(declare-fun m!1147959 () Bool)

(assert (=> b!1245184 m!1147959))

(assert (=> b!1245176 m!1147939))

(declare-fun m!1147961 () Bool)

(assert (=> b!1245186 m!1147961))

(check-sat (not b!1245179) (not b!1245177) (not b!1245184) (not b!1245181) (not b!1245186) (not b!1245182) (not b!1245178) (not b!1245185) (not b!1245180) (not start!104152))
(check-sat)
