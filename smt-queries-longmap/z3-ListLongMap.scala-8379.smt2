; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101916 () Bool)

(assert start!101916)

(declare-fun res!815769 () Bool)

(declare-fun e!696823 () Bool)

(assert (=> start!101916 (=> (not res!815769) (not e!696823))))

(declare-datatypes ((array!79222 0))(
  ( (array!79223 (arr!38235 (Array (_ BitVec 32) (_ BitVec 64))) (size!38771 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79222)

(assert (=> start!101916 (= res!815769 (bvslt (size!38771 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101916 e!696823))

(declare-fun array_inv!29083 (array!79222) Bool)

(assert (=> start!101916 (array_inv!29083 a!3806)))

(assert (=> start!101916 true))

(declare-fun b!1227128 () Bool)

(declare-fun e!696824 () Bool)

(declare-datatypes ((List!27008 0))(
  ( (Nil!27005) (Cons!27004 (h!28213 (_ BitVec 64)) (t!40471 List!27008)) )
))
(declare-fun lt!558882 () List!27008)

(declare-fun contains!7070 (List!27008 (_ BitVec 64)) Bool)

(assert (=> b!1227128 (= e!696824 (contains!7070 lt!558882 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227129 () Bool)

(declare-fun res!815766 () Bool)

(assert (=> b!1227129 (=> (not res!815766) (not e!696823))))

(declare-fun acc!823 () List!27008)

(assert (=> b!1227129 (= res!815766 (not (contains!7070 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227130 () Bool)

(declare-fun res!815761 () Bool)

(assert (=> b!1227130 (=> (not res!815761) (not e!696823))))

(assert (=> b!1227130 (= res!815761 (not (contains!7070 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227131 () Bool)

(declare-fun res!815762 () Bool)

(assert (=> b!1227131 (=> (not res!815762) (not e!696823))))

(declare-fun noDuplicate!1667 (List!27008) Bool)

(assert (=> b!1227131 (= res!815762 (noDuplicate!1667 acc!823))))

(declare-fun b!1227132 () Bool)

(declare-fun e!696821 () Bool)

(assert (=> b!1227132 (= e!696823 e!696821)))

(declare-fun res!815765 () Bool)

(assert (=> b!1227132 (=> (not res!815765) (not e!696821))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1227132 (= res!815765 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1227132 (= lt!558882 (Cons!27004 (select (arr!38235 a!3806) from!3184) acc!823))))

(declare-fun b!1227133 () Bool)

(declare-fun res!815763 () Bool)

(assert (=> b!1227133 (=> (not res!815763) (not e!696823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227133 (= res!815763 (validKeyInArray!0 (select (arr!38235 a!3806) from!3184)))))

(declare-fun b!1227134 () Bool)

(declare-fun res!815764 () Bool)

(assert (=> b!1227134 (=> (not res!815764) (not e!696823))))

(declare-fun arrayNoDuplicates!0 (array!79222 (_ BitVec 32) List!27008) Bool)

(assert (=> b!1227134 (= res!815764 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227135 () Bool)

(declare-fun res!815760 () Bool)

(assert (=> b!1227135 (=> (not res!815760) (not e!696823))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1227135 (= res!815760 (validKeyInArray!0 k0!2913))))

(declare-fun b!1227136 () Bool)

(declare-fun res!815758 () Bool)

(assert (=> b!1227136 (=> (not res!815758) (not e!696823))))

(assert (=> b!1227136 (= res!815758 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38771 a!3806)) (bvslt from!3184 (size!38771 a!3806))))))

(declare-fun b!1227137 () Bool)

(assert (=> b!1227137 (= e!696821 e!696824)))

(declare-fun res!815759 () Bool)

(assert (=> b!1227137 (=> res!815759 e!696824)))

(assert (=> b!1227137 (= res!815759 (contains!7070 lt!558882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227138 () Bool)

(declare-fun res!815767 () Bool)

(assert (=> b!1227138 (=> (not res!815767) (not e!696821))))

(assert (=> b!1227138 (= res!815767 (noDuplicate!1667 lt!558882))))

(declare-fun b!1227139 () Bool)

(declare-fun res!815768 () Bool)

(assert (=> b!1227139 (=> (not res!815768) (not e!696823))))

(declare-fun arrayContainsKey!0 (array!79222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227139 (= res!815768 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!101916 res!815769) b!1227135))

(assert (= (and b!1227135 res!815760) b!1227136))

(assert (= (and b!1227136 res!815758) b!1227131))

(assert (= (and b!1227131 res!815762) b!1227130))

(assert (= (and b!1227130 res!815761) b!1227129))

(assert (= (and b!1227129 res!815766) b!1227139))

(assert (= (and b!1227139 res!815768) b!1227134))

(assert (= (and b!1227134 res!815764) b!1227133))

(assert (= (and b!1227133 res!815763) b!1227132))

(assert (= (and b!1227132 res!815765) b!1227138))

(assert (= (and b!1227138 res!815767) b!1227137))

(assert (= (and b!1227137 (not res!815759)) b!1227128))

(declare-fun m!1131987 () Bool)

(assert (=> b!1227131 m!1131987))

(declare-fun m!1131989 () Bool)

(assert (=> b!1227128 m!1131989))

(declare-fun m!1131991 () Bool)

(assert (=> b!1227138 m!1131991))

(declare-fun m!1131993 () Bool)

(assert (=> b!1227135 m!1131993))

(declare-fun m!1131995 () Bool)

(assert (=> b!1227133 m!1131995))

(assert (=> b!1227133 m!1131995))

(declare-fun m!1131997 () Bool)

(assert (=> b!1227133 m!1131997))

(declare-fun m!1131999 () Bool)

(assert (=> start!101916 m!1131999))

(declare-fun m!1132001 () Bool)

(assert (=> b!1227137 m!1132001))

(assert (=> b!1227132 m!1131995))

(declare-fun m!1132003 () Bool)

(assert (=> b!1227129 m!1132003))

(declare-fun m!1132005 () Bool)

(assert (=> b!1227130 m!1132005))

(declare-fun m!1132007 () Bool)

(assert (=> b!1227134 m!1132007))

(declare-fun m!1132009 () Bool)

(assert (=> b!1227139 m!1132009))

(check-sat (not b!1227131) (not b!1227137) (not b!1227134) (not b!1227135) (not b!1227133) (not b!1227138) (not b!1227128) (not b!1227129) (not start!101916) (not b!1227130) (not b!1227139))
(check-sat)
(get-model)

(declare-fun d!134115 () Bool)

(assert (=> d!134115 (= (array_inv!29083 a!3806) (bvsge (size!38771 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!101916 d!134115))

(declare-fun d!134117 () Bool)

(declare-fun lt!558888 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!550 (List!27008) (InoxSet (_ BitVec 64)))

(assert (=> d!134117 (= lt!558888 (select (content!550 lt!558882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696842 () Bool)

(assert (=> d!134117 (= lt!558888 e!696842)))

(declare-fun res!815810 () Bool)

(assert (=> d!134117 (=> (not res!815810) (not e!696842))))

(get-info :version)

(assert (=> d!134117 (= res!815810 ((_ is Cons!27004) lt!558882))))

(assert (=> d!134117 (= (contains!7070 lt!558882 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558888)))

(declare-fun b!1227180 () Bool)

(declare-fun e!696841 () Bool)

(assert (=> b!1227180 (= e!696842 e!696841)))

(declare-fun res!815811 () Bool)

(assert (=> b!1227180 (=> res!815811 e!696841)))

(assert (=> b!1227180 (= res!815811 (= (h!28213 lt!558882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227181 () Bool)

(assert (=> b!1227181 (= e!696841 (contains!7070 (t!40471 lt!558882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134117 res!815810) b!1227180))

(assert (= (and b!1227180 (not res!815811)) b!1227181))

(declare-fun m!1132035 () Bool)

(assert (=> d!134117 m!1132035))

(declare-fun m!1132037 () Bool)

(assert (=> d!134117 m!1132037))

(declare-fun m!1132039 () Bool)

(assert (=> b!1227181 m!1132039))

(assert (=> b!1227137 d!134117))

(declare-fun d!134119 () Bool)

(declare-fun res!815816 () Bool)

(declare-fun e!696847 () Bool)

(assert (=> d!134119 (=> res!815816 e!696847)))

(assert (=> d!134119 (= res!815816 ((_ is Nil!27005) lt!558882))))

(assert (=> d!134119 (= (noDuplicate!1667 lt!558882) e!696847)))

(declare-fun b!1227186 () Bool)

(declare-fun e!696848 () Bool)

(assert (=> b!1227186 (= e!696847 e!696848)))

(declare-fun res!815817 () Bool)

(assert (=> b!1227186 (=> (not res!815817) (not e!696848))))

(assert (=> b!1227186 (= res!815817 (not (contains!7070 (t!40471 lt!558882) (h!28213 lt!558882))))))

(declare-fun b!1227187 () Bool)

(assert (=> b!1227187 (= e!696848 (noDuplicate!1667 (t!40471 lt!558882)))))

(assert (= (and d!134119 (not res!815816)) b!1227186))

(assert (= (and b!1227186 res!815817) b!1227187))

(declare-fun m!1132041 () Bool)

(assert (=> b!1227186 m!1132041))

(declare-fun m!1132043 () Bool)

(assert (=> b!1227187 m!1132043))

(assert (=> b!1227138 d!134119))

(declare-fun d!134123 () Bool)

(declare-fun res!815818 () Bool)

(declare-fun e!696849 () Bool)

(assert (=> d!134123 (=> res!815818 e!696849)))

(assert (=> d!134123 (= res!815818 ((_ is Nil!27005) acc!823))))

(assert (=> d!134123 (= (noDuplicate!1667 acc!823) e!696849)))

(declare-fun b!1227188 () Bool)

(declare-fun e!696850 () Bool)

(assert (=> b!1227188 (= e!696849 e!696850)))

(declare-fun res!815819 () Bool)

(assert (=> b!1227188 (=> (not res!815819) (not e!696850))))

(assert (=> b!1227188 (= res!815819 (not (contains!7070 (t!40471 acc!823) (h!28213 acc!823))))))

(declare-fun b!1227189 () Bool)

(assert (=> b!1227189 (= e!696850 (noDuplicate!1667 (t!40471 acc!823)))))

(assert (= (and d!134123 (not res!815818)) b!1227188))

(assert (= (and b!1227188 res!815819) b!1227189))

(declare-fun m!1132045 () Bool)

(assert (=> b!1227188 m!1132045))

(declare-fun m!1132047 () Bool)

(assert (=> b!1227189 m!1132047))

(assert (=> b!1227131 d!134123))

(declare-fun d!134125 () Bool)

(declare-fun lt!558889 () Bool)

(assert (=> d!134125 (= lt!558889 (select (content!550 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696858 () Bool)

(assert (=> d!134125 (= lt!558889 e!696858)))

(declare-fun res!815826 () Bool)

(assert (=> d!134125 (=> (not res!815826) (not e!696858))))

(assert (=> d!134125 (= res!815826 ((_ is Cons!27004) acc!823))))

(assert (=> d!134125 (= (contains!7070 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558889)))

(declare-fun b!1227198 () Bool)

(declare-fun e!696857 () Bool)

(assert (=> b!1227198 (= e!696858 e!696857)))

(declare-fun res!815827 () Bool)

(assert (=> b!1227198 (=> res!815827 e!696857)))

(assert (=> b!1227198 (= res!815827 (= (h!28213 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227199 () Bool)

(assert (=> b!1227199 (= e!696857 (contains!7070 (t!40471 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134125 res!815826) b!1227198))

(assert (= (and b!1227198 (not res!815827)) b!1227199))

(declare-fun m!1132049 () Bool)

(assert (=> d!134125 m!1132049))

(declare-fun m!1132051 () Bool)

(assert (=> d!134125 m!1132051))

(declare-fun m!1132053 () Bool)

(assert (=> b!1227199 m!1132053))

(assert (=> b!1227129 d!134125))

(declare-fun d!134127 () Bool)

(declare-fun lt!558890 () Bool)

(assert (=> d!134127 (= lt!558890 (select (content!550 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696862 () Bool)

(assert (=> d!134127 (= lt!558890 e!696862)))

(declare-fun res!815828 () Bool)

(assert (=> d!134127 (=> (not res!815828) (not e!696862))))

(assert (=> d!134127 (= res!815828 ((_ is Cons!27004) acc!823))))

(assert (=> d!134127 (= (contains!7070 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558890)))

(declare-fun b!1227202 () Bool)

(declare-fun e!696861 () Bool)

(assert (=> b!1227202 (= e!696862 e!696861)))

(declare-fun res!815829 () Bool)

(assert (=> b!1227202 (=> res!815829 e!696861)))

(assert (=> b!1227202 (= res!815829 (= (h!28213 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227203 () Bool)

(assert (=> b!1227203 (= e!696861 (contains!7070 (t!40471 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134127 res!815828) b!1227202))

(assert (= (and b!1227202 (not res!815829)) b!1227203))

(assert (=> d!134127 m!1132049))

(declare-fun m!1132055 () Bool)

(assert (=> d!134127 m!1132055))

(declare-fun m!1132057 () Bool)

(assert (=> b!1227203 m!1132057))

(assert (=> b!1227130 d!134127))

(declare-fun d!134129 () Bool)

(assert (=> d!134129 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1227135 d!134129))

(declare-fun d!134131 () Bool)

(declare-fun lt!558891 () Bool)

(assert (=> d!134131 (= lt!558891 (select (content!550 lt!558882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696864 () Bool)

(assert (=> d!134131 (= lt!558891 e!696864)))

(declare-fun res!815830 () Bool)

(assert (=> d!134131 (=> (not res!815830) (not e!696864))))

(assert (=> d!134131 (= res!815830 ((_ is Cons!27004) lt!558882))))

(assert (=> d!134131 (= (contains!7070 lt!558882 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558891)))

(declare-fun b!1227204 () Bool)

(declare-fun e!696863 () Bool)

(assert (=> b!1227204 (= e!696864 e!696863)))

(declare-fun res!815831 () Bool)

(assert (=> b!1227204 (=> res!815831 e!696863)))

(assert (=> b!1227204 (= res!815831 (= (h!28213 lt!558882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227205 () Bool)

(assert (=> b!1227205 (= e!696863 (contains!7070 (t!40471 lt!558882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134131 res!815830) b!1227204))

(assert (= (and b!1227204 (not res!815831)) b!1227205))

(assert (=> d!134131 m!1132035))

(declare-fun m!1132059 () Bool)

(assert (=> d!134131 m!1132059))

(declare-fun m!1132061 () Bool)

(assert (=> b!1227205 m!1132061))

(assert (=> b!1227128 d!134131))

(declare-fun d!134135 () Bool)

(assert (=> d!134135 (= (validKeyInArray!0 (select (arr!38235 a!3806) from!3184)) (and (not (= (select (arr!38235 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38235 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1227133 d!134135))

(declare-fun b!1227246 () Bool)

(declare-fun e!696902 () Bool)

(declare-fun e!696901 () Bool)

(assert (=> b!1227246 (= e!696902 e!696901)))

(declare-fun res!815860 () Bool)

(assert (=> b!1227246 (=> (not res!815860) (not e!696901))))

(declare-fun e!696899 () Bool)

(assert (=> b!1227246 (= res!815860 (not e!696899))))

(declare-fun res!815861 () Bool)

(assert (=> b!1227246 (=> (not res!815861) (not e!696899))))

(assert (=> b!1227246 (= res!815861 (validKeyInArray!0 (select (arr!38235 a!3806) from!3184)))))

(declare-fun b!1227247 () Bool)

(declare-fun e!696900 () Bool)

(assert (=> b!1227247 (= e!696901 e!696900)))

(declare-fun c!120553 () Bool)

(assert (=> b!1227247 (= c!120553 (validKeyInArray!0 (select (arr!38235 a!3806) from!3184)))))

(declare-fun b!1227248 () Bool)

(declare-fun call!60808 () Bool)

(assert (=> b!1227248 (= e!696900 call!60808)))

(declare-fun b!1227249 () Bool)

(assert (=> b!1227249 (= e!696899 (contains!7070 acc!823 (select (arr!38235 a!3806) from!3184)))))

(declare-fun b!1227250 () Bool)

(assert (=> b!1227250 (= e!696900 call!60808)))

(declare-fun bm!60805 () Bool)

(assert (=> bm!60805 (= call!60808 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120553 (Cons!27004 (select (arr!38235 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun d!134137 () Bool)

(declare-fun res!815862 () Bool)

(assert (=> d!134137 (=> res!815862 e!696902)))

(assert (=> d!134137 (= res!815862 (bvsge from!3184 (size!38771 a!3806)))))

(assert (=> d!134137 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!696902)))

(assert (= (and d!134137 (not res!815862)) b!1227246))

(assert (= (and b!1227246 res!815861) b!1227249))

(assert (= (and b!1227246 res!815860) b!1227247))

(assert (= (and b!1227247 c!120553) b!1227248))

(assert (= (and b!1227247 (not c!120553)) b!1227250))

(assert (= (or b!1227248 b!1227250) bm!60805))

(assert (=> b!1227246 m!1131995))

(assert (=> b!1227246 m!1131995))

(assert (=> b!1227246 m!1131997))

(assert (=> b!1227247 m!1131995))

(assert (=> b!1227247 m!1131995))

(assert (=> b!1227247 m!1131997))

(assert (=> b!1227249 m!1131995))

(assert (=> b!1227249 m!1131995))

(declare-fun m!1132073 () Bool)

(assert (=> b!1227249 m!1132073))

(assert (=> bm!60805 m!1131995))

(declare-fun m!1132076 () Bool)

(assert (=> bm!60805 m!1132076))

(assert (=> b!1227134 d!134137))

(declare-fun d!134145 () Bool)

(declare-fun res!815875 () Bool)

(declare-fun e!696915 () Bool)

(assert (=> d!134145 (=> res!815875 e!696915)))

(assert (=> d!134145 (= res!815875 (= (select (arr!38235 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134145 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!696915)))

(declare-fun b!1227263 () Bool)

(declare-fun e!696916 () Bool)

(assert (=> b!1227263 (= e!696915 e!696916)))

(declare-fun res!815876 () Bool)

(assert (=> b!1227263 (=> (not res!815876) (not e!696916))))

(assert (=> b!1227263 (= res!815876 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38771 a!3806)))))

(declare-fun b!1227264 () Bool)

(assert (=> b!1227264 (= e!696916 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134145 (not res!815875)) b!1227263))

(assert (= (and b!1227263 res!815876) b!1227264))

(declare-fun m!1132091 () Bool)

(assert (=> d!134145 m!1132091))

(declare-fun m!1132093 () Bool)

(assert (=> b!1227264 m!1132093))

(assert (=> b!1227139 d!134145))

(check-sat (not b!1227205) (not b!1227187) (not d!134131) (not b!1227247) (not d!134127) (not b!1227203) (not bm!60805) (not b!1227189) (not b!1227249) (not b!1227188) (not b!1227199) (not b!1227264) (not b!1227246) (not b!1227181) (not d!134125) (not b!1227186) (not d!134117))
(check-sat)
