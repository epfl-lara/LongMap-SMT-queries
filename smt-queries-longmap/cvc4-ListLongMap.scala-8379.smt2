; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101918 () Bool)

(assert start!101918)

(declare-fun b!1227164 () Bool)

(declare-fun res!815799 () Bool)

(declare-fun e!696836 () Bool)

(assert (=> b!1227164 (=> (not res!815799) (not e!696836))))

(declare-datatypes ((array!79224 0))(
  ( (array!79225 (arr!38236 (Array (_ BitVec 32) (_ BitVec 64))) (size!38772 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79224)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227164 (= res!815799 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227165 () Bool)

(declare-fun e!696834 () Bool)

(declare-fun e!696833 () Bool)

(assert (=> b!1227165 (= e!696834 e!696833)))

(declare-fun res!815794 () Bool)

(assert (=> b!1227165 (=> res!815794 e!696833)))

(declare-datatypes ((List!27009 0))(
  ( (Nil!27006) (Cons!27005 (h!28214 (_ BitVec 64)) (t!40472 List!27009)) )
))
(declare-fun lt!558885 () List!27009)

(declare-fun contains!7071 (List!27009 (_ BitVec 64)) Bool)

(assert (=> b!1227165 (= res!815794 (contains!7071 lt!558885 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227166 () Bool)

(declare-fun res!815804 () Bool)

(assert (=> b!1227166 (=> (not res!815804) (not e!696836))))

(declare-fun acc!823 () List!27009)

(declare-fun arrayNoDuplicates!0 (array!79224 (_ BitVec 32) List!27009) Bool)

(assert (=> b!1227166 (= res!815804 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227167 () Bool)

(assert (=> b!1227167 (= e!696833 (contains!7071 lt!558885 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227169 () Bool)

(declare-fun res!815798 () Bool)

(assert (=> b!1227169 (=> (not res!815798) (not e!696836))))

(assert (=> b!1227169 (= res!815798 (not (contains!7071 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227170 () Bool)

(declare-fun res!815796 () Bool)

(assert (=> b!1227170 (=> (not res!815796) (not e!696836))))

(assert (=> b!1227170 (= res!815796 (not (contains!7071 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227171 () Bool)

(declare-fun res!815800 () Bool)

(assert (=> b!1227171 (=> (not res!815800) (not e!696836))))

(assert (=> b!1227171 (= res!815800 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38772 a!3806)) (bvslt from!3184 (size!38772 a!3806))))))

(declare-fun res!815795 () Bool)

(assert (=> start!101918 (=> (not res!815795) (not e!696836))))

(assert (=> start!101918 (= res!815795 (bvslt (size!38772 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101918 e!696836))

(declare-fun array_inv!29084 (array!79224) Bool)

(assert (=> start!101918 (array_inv!29084 a!3806)))

(assert (=> start!101918 true))

(declare-fun b!1227168 () Bool)

(declare-fun res!815805 () Bool)

(assert (=> b!1227168 (=> (not res!815805) (not e!696834))))

(declare-fun noDuplicate!1668 (List!27009) Bool)

(assert (=> b!1227168 (= res!815805 (noDuplicate!1668 lt!558885))))

(declare-fun b!1227172 () Bool)

(declare-fun res!815802 () Bool)

(assert (=> b!1227172 (=> (not res!815802) (not e!696836))))

(assert (=> b!1227172 (= res!815802 (noDuplicate!1668 acc!823))))

(declare-fun b!1227173 () Bool)

(declare-fun res!815803 () Bool)

(assert (=> b!1227173 (=> (not res!815803) (not e!696836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227173 (= res!815803 (validKeyInArray!0 (select (arr!38236 a!3806) from!3184)))))

(declare-fun b!1227174 () Bool)

(declare-fun res!815797 () Bool)

(assert (=> b!1227174 (=> (not res!815797) (not e!696836))))

(assert (=> b!1227174 (= res!815797 (validKeyInArray!0 k!2913))))

(declare-fun b!1227175 () Bool)

(assert (=> b!1227175 (= e!696836 e!696834)))

(declare-fun res!815801 () Bool)

(assert (=> b!1227175 (=> (not res!815801) (not e!696834))))

(assert (=> b!1227175 (= res!815801 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1227175 (= lt!558885 (Cons!27005 (select (arr!38236 a!3806) from!3184) acc!823))))

(assert (= (and start!101918 res!815795) b!1227174))

(assert (= (and b!1227174 res!815797) b!1227171))

(assert (= (and b!1227171 res!815800) b!1227172))

(assert (= (and b!1227172 res!815802) b!1227169))

(assert (= (and b!1227169 res!815798) b!1227170))

(assert (= (and b!1227170 res!815796) b!1227164))

(assert (= (and b!1227164 res!815799) b!1227166))

(assert (= (and b!1227166 res!815804) b!1227173))

(assert (= (and b!1227173 res!815803) b!1227175))

(assert (= (and b!1227175 res!815801) b!1227168))

(assert (= (and b!1227168 res!815805) b!1227165))

(assert (= (and b!1227165 (not res!815794)) b!1227167))

(declare-fun m!1132011 () Bool)

(assert (=> b!1227174 m!1132011))

(declare-fun m!1132013 () Bool)

(assert (=> b!1227169 m!1132013))

(declare-fun m!1132015 () Bool)

(assert (=> b!1227175 m!1132015))

(assert (=> b!1227173 m!1132015))

(assert (=> b!1227173 m!1132015))

(declare-fun m!1132017 () Bool)

(assert (=> b!1227173 m!1132017))

(declare-fun m!1132019 () Bool)

(assert (=> b!1227168 m!1132019))

(declare-fun m!1132021 () Bool)

(assert (=> start!101918 m!1132021))

(declare-fun m!1132023 () Bool)

(assert (=> b!1227172 m!1132023))

(declare-fun m!1132025 () Bool)

(assert (=> b!1227167 m!1132025))

(declare-fun m!1132027 () Bool)

(assert (=> b!1227164 m!1132027))

(declare-fun m!1132029 () Bool)

(assert (=> b!1227166 m!1132029))

(declare-fun m!1132031 () Bool)

(assert (=> b!1227165 m!1132031))

(declare-fun m!1132033 () Bool)

(assert (=> b!1227170 m!1132033))

(push 1)

(assert (not b!1227172))

(assert (not b!1227173))

(assert (not b!1227164))

(assert (not b!1227166))

(assert (not b!1227174))

(assert (not b!1227170))

(assert (not b!1227165))

(assert (not b!1227168))

(assert (not b!1227169))

(assert (not start!101918))

(assert (not b!1227167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1227206 () Bool)

(declare-fun e!696867 () Bool)

(declare-fun e!696866 () Bool)

(assert (=> b!1227206 (= e!696867 e!696866)))

(declare-fun res!815832 () Bool)

(assert (=> b!1227206 (=> (not res!815832) (not e!696866))))

(declare-fun e!696868 () Bool)

(assert (=> b!1227206 (= res!815832 (not e!696868))))

(declare-fun res!815834 () Bool)

(assert (=> b!1227206 (=> (not res!815834) (not e!696868))))

(assert (=> b!1227206 (= res!815834 (validKeyInArray!0 (select (arr!38236 a!3806) from!3184)))))

(declare-fun b!1227207 () Bool)

(assert (=> b!1227207 (= e!696868 (contains!7071 acc!823 (select (arr!38236 a!3806) from!3184)))))

(declare-fun b!1227208 () Bool)

(declare-fun e!696865 () Bool)

(declare-fun call!60802 () Bool)

(assert (=> b!1227208 (= e!696865 call!60802)))

(declare-fun b!1227209 () Bool)

(assert (=> b!1227209 (= e!696865 call!60802)))

(declare-fun d!134121 () Bool)

(declare-fun res!815833 () Bool)

(assert (=> d!134121 (=> res!815833 e!696867)))

(assert (=> d!134121 (= res!815833 (bvsge from!3184 (size!38772 a!3806)))))

(assert (=> d!134121 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!696867)))

(declare-fun b!1227210 () Bool)

(assert (=> b!1227210 (= e!696866 e!696865)))

(declare-fun c!120547 () Bool)

(assert (=> b!1227210 (= c!120547 (validKeyInArray!0 (select (arr!38236 a!3806) from!3184)))))

(declare-fun bm!60799 () Bool)

(assert (=> bm!60799 (= call!60802 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120547 (Cons!27005 (select (arr!38236 a!3806) from!3184) acc!823) acc!823)))))

(assert (= (and d!134121 (not res!815833)) b!1227206))

(assert (= (and b!1227206 res!815834) b!1227207))

(assert (= (and b!1227206 res!815832) b!1227210))

(assert (= (and b!1227210 c!120547) b!1227208))

(assert (= (and b!1227210 (not c!120547)) b!1227209))

(assert (= (or b!1227208 b!1227209) bm!60799))

(assert (=> b!1227206 m!1132015))

(assert (=> b!1227206 m!1132015))

(assert (=> b!1227206 m!1132017))

(assert (=> b!1227207 m!1132015))

(assert (=> b!1227207 m!1132015))

(declare-fun m!1132063 () Bool)

(assert (=> b!1227207 m!1132063))

(assert (=> b!1227210 m!1132015))

(assert (=> b!1227210 m!1132015))

(assert (=> b!1227210 m!1132017))

(assert (=> bm!60799 m!1132015))

(declare-fun m!1132065 () Bool)

(assert (=> bm!60799 m!1132065))

(assert (=> b!1227166 d!134121))

(declare-fun d!134139 () Bool)

(declare-fun res!815851 () Bool)

(declare-fun e!696889 () Bool)

(assert (=> d!134139 (=> res!815851 e!696889)))

(assert (=> d!134139 (= res!815851 (= (select (arr!38236 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134139 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!696889)))

(declare-fun b!1227235 () Bool)

(declare-fun e!696890 () Bool)

(assert (=> b!1227235 (= e!696889 e!696890)))

(declare-fun res!815852 () Bool)

(assert (=> b!1227235 (=> (not res!815852) (not e!696890))))

(assert (=> b!1227235 (= res!815852 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38772 a!3806)))))

(declare-fun b!1227236 () Bool)

(assert (=> b!1227236 (= e!696890 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134139 (not res!815851)) b!1227235))

(assert (= (and b!1227235 res!815852) b!1227236))

(declare-fun m!1132067 () Bool)

(assert (=> d!134139 m!1132067))

(declare-fun m!1132069 () Bool)

(assert (=> b!1227236 m!1132069))

(assert (=> b!1227164 d!134139))

(declare-fun d!134141 () Bool)

(declare-fun lt!558894 () Bool)

(declare-fun content!551 (List!27009) (Set (_ BitVec 64)))

(assert (=> d!134141 (= lt!558894 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!551 lt!558885)))))

(declare-fun e!696904 () Bool)

(assert (=> d!134141 (= lt!558894 e!696904)))

(declare-fun res!815863 () Bool)

(assert (=> d!134141 (=> (not res!815863) (not e!696904))))

(assert (=> d!134141 (= res!815863 (is-Cons!27005 lt!558885))))

(assert (=> d!134141 (= (contains!7071 lt!558885 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558894)))

(declare-fun b!1227251 () Bool)

(declare-fun e!696903 () Bool)

(assert (=> b!1227251 (= e!696904 e!696903)))

(declare-fun res!815864 () Bool)

(assert (=> b!1227251 (=> res!815864 e!696903)))

(assert (=> b!1227251 (= res!815864 (= (h!28214 lt!558885) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227252 () Bool)

(assert (=> b!1227252 (= e!696903 (contains!7071 (t!40472 lt!558885) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134141 res!815863) b!1227251))

(assert (= (and b!1227251 (not res!815864)) b!1227252))

(declare-fun m!1132079 () Bool)

(assert (=> d!134141 m!1132079))

(declare-fun m!1132081 () Bool)

(assert (=> d!134141 m!1132081))

(declare-fun m!1132083 () Bool)

(assert (=> b!1227252 m!1132083))

(assert (=> b!1227165 d!134141))

(declare-fun d!134147 () Bool)

(declare-fun lt!558895 () Bool)

(assert (=> d!134147 (= lt!558895 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!551 acc!823)))))

(declare-fun e!696906 () Bool)

(assert (=> d!134147 (= lt!558895 e!696906)))

(declare-fun res!815865 () Bool)

(assert (=> d!134147 (=> (not res!815865) (not e!696906))))

(assert (=> d!134147 (= res!815865 (is-Cons!27005 acc!823))))

(assert (=> d!134147 (= (contains!7071 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558895)))

(declare-fun b!1227253 () Bool)

(declare-fun e!696905 () Bool)

(assert (=> b!1227253 (= e!696906 e!696905)))

(declare-fun res!815866 () Bool)

(assert (=> b!1227253 (=> res!815866 e!696905)))

(assert (=> b!1227253 (= res!815866 (= (h!28214 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227254 () Bool)

(assert (=> b!1227254 (= e!696905 (contains!7071 (t!40472 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134147 res!815865) b!1227253))

(assert (= (and b!1227253 (not res!815866)) b!1227254))

(declare-fun m!1132085 () Bool)

(assert (=> d!134147 m!1132085))

(declare-fun m!1132087 () Bool)

(assert (=> d!134147 m!1132087))

(declare-fun m!1132089 () Bool)

(assert (=> b!1227254 m!1132089))

(assert (=> b!1227170 d!134147))

(declare-fun d!134149 () Bool)

(assert (=> d!134149 (= (array_inv!29084 a!3806) (bvsge (size!38772 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!101918 d!134149))

(declare-fun d!134153 () Bool)

(declare-fun res!815881 () Bool)

(declare-fun e!696921 () Bool)

(assert (=> d!134153 (=> res!815881 e!696921)))

(assert (=> d!134153 (= res!815881 (is-Nil!27006 lt!558885))))

(assert (=> d!134153 (= (noDuplicate!1668 lt!558885) e!696921)))

(declare-fun b!1227269 () Bool)

(declare-fun e!696922 () Bool)

(assert (=> b!1227269 (= e!696921 e!696922)))

(declare-fun res!815882 () Bool)

(assert (=> b!1227269 (=> (not res!815882) (not e!696922))))

(assert (=> b!1227269 (= res!815882 (not (contains!7071 (t!40472 lt!558885) (h!28214 lt!558885))))))

(declare-fun b!1227270 () Bool)

(assert (=> b!1227270 (= e!696922 (noDuplicate!1668 (t!40472 lt!558885)))))

(assert (= (and d!134153 (not res!815881)) b!1227269))

(assert (= (and b!1227269 res!815882) b!1227270))

(declare-fun m!1132095 () Bool)

(assert (=> b!1227269 m!1132095))

(declare-fun m!1132097 () Bool)

(assert (=> b!1227270 m!1132097))

(assert (=> b!1227168 d!134153))

(declare-fun d!134155 () Bool)

(declare-fun lt!558898 () Bool)

(assert (=> d!134155 (= lt!558898 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!551 acc!823)))))

(declare-fun e!696924 () Bool)

(assert (=> d!134155 (= lt!558898 e!696924)))

