; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7890 () Bool)

(assert start!7890)

(declare-fun res!28756 () Bool)

(declare-fun e!32010 () Bool)

(assert (=> start!7890 (=> (not res!28756) (not e!32010))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7890 (= res!28756 (validMask!0 mask!2234))))

(assert (=> start!7890 e!32010))

(assert (=> start!7890 true))

(declare-datatypes ((array!3241 0))(
  ( (array!3242 (arr!1553 (Array (_ BitVec 32) (_ BitVec 64))) (size!1775 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3241)

(declare-fun array_inv!949 (array!3241) Bool)

(assert (=> start!7890 (array_inv!949 _keys!1794)))

(declare-fun b!49699 () Bool)

(declare-fun res!28757 () Bool)

(assert (=> b!49699 (=> (not res!28757) (not e!32010))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49699 (= res!28757 (and (= (size!1775 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3242 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1775 _keys!1794)) (bvslt i!836 (size!1775 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49700 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3241 (_ BitVec 32)) Bool)

(assert (=> b!49700 (= e!32010 (not (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234)))))

(assert (=> b!49700 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1409 0))(
  ( (Unit!1410) )
))
(declare-fun lt!20864 () Unit!1409)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3241 (_ BitVec 32) (_ BitVec 32)) Unit!1409)

(assert (=> b!49700 (= lt!20864 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7890 res!28756) b!49699))

(assert (= (and b!49699 res!28757) b!49700))

(declare-fun m!43091 () Bool)

(assert (=> start!7890 m!43091))

(declare-fun m!43093 () Bool)

(assert (=> start!7890 m!43093))

(declare-fun m!43095 () Bool)

(assert (=> b!49700 m!43095))

(declare-fun m!43097 () Bool)

(assert (=> b!49700 m!43097))

(declare-fun m!43099 () Bool)

(assert (=> b!49700 m!43099))

(push 1)

(assert (not start!7890))

(assert (not b!49700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9971 () Bool)

(assert (=> d!9971 (= (validMask!0 mask!2234) (and (or (= mask!2234 #b00000000000000000000000000000111) (= mask!2234 #b00000000000000000000000000001111) (= mask!2234 #b00000000000000000000000000011111) (= mask!2234 #b00000000000000000000000000111111) (= mask!2234 #b00000000000000000000000001111111) (= mask!2234 #b00000000000000000000000011111111) (= mask!2234 #b00000000000000000000000111111111) (= mask!2234 #b00000000000000000000001111111111) (= mask!2234 #b00000000000000000000011111111111) (= mask!2234 #b00000000000000000000111111111111) (= mask!2234 #b00000000000000000001111111111111) (= mask!2234 #b00000000000000000011111111111111) (= mask!2234 #b00000000000000000111111111111111) (= mask!2234 #b00000000000000001111111111111111) (= mask!2234 #b00000000000000011111111111111111) (= mask!2234 #b00000000000000111111111111111111) (= mask!2234 #b00000000000001111111111111111111) (= mask!2234 #b00000000000011111111111111111111) (= mask!2234 #b00000000000111111111111111111111) (= mask!2234 #b00000000001111111111111111111111) (= mask!2234 #b00000000011111111111111111111111) (= mask!2234 #b00000000111111111111111111111111) (= mask!2234 #b00000001111111111111111111111111) (= mask!2234 #b00000011111111111111111111111111) (= mask!2234 #b00000111111111111111111111111111) (= mask!2234 #b00001111111111111111111111111111) (= mask!2234 #b00011111111111111111111111111111) (= mask!2234 #b00111111111111111111111111111111)) (bvsle mask!2234 #b00111111111111111111111111111111)))))

(assert (=> start!7890 d!9971))

(declare-fun d!9981 () Bool)

(assert (=> d!9981 (= (array_inv!949 _keys!1794) (bvsge (size!1775 _keys!1794) #b00000000000000000000000000000000))))

(assert (=> start!7890 d!9981))

(declare-fun b!49741 () Bool)

(declare-fun e!32043 () Bool)

(declare-fun call!3855 () Bool)

(assert (=> b!49741 (= e!32043 call!3855)))

(declare-fun bm!3852 () Bool)

(assert (=> bm!3852 (= call!3855 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49743 () Bool)

(declare-fun e!32042 () Bool)

(assert (=> b!49743 (= e!32042 call!3855)))

(declare-fun b!49744 () Bool)

(assert (=> b!49744 (= e!32043 e!32042)))

(declare-fun lt!20895 () (_ BitVec 64))

(assert (=> b!49744 (= lt!20895 (select (arr!1553 _keys!1794) i!836))))

(declare-fun lt!20897 () Unit!1409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3241 (_ BitVec 64) (_ BitVec 32)) Unit!1409)

(assert (=> b!49744 (= lt!20897 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20895 i!836))))

(declare-fun arrayContainsKey!0 (array!3241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!49744 (arrayContainsKey!0 _keys!1794 lt!20895 #b00000000000000000000000000000000)))

(declare-fun lt!20896 () Unit!1409)

(assert (=> b!49744 (= lt!20896 lt!20897)))

(declare-fun res!28778 () Bool)

(declare-datatypes ((SeekEntryResult!214 0))(
  ( (MissingZero!214 (index!2978 (_ BitVec 32))) (Found!214 (index!2979 (_ BitVec 32))) (Intermediate!214 (undefined!1026 Bool) (index!2980 (_ BitVec 32)) (x!9104 (_ BitVec 32))) (Undefined!214) (MissingVacant!214 (index!2981 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3241 (_ BitVec 32)) SeekEntryResult!214)

(assert (=> b!49744 (= res!28778 (= (seekEntryOrOpen!0 (select (arr!1553 _keys!1794) i!836) _keys!1794 mask!2234) (Found!214 i!836)))))

(assert (=> b!49744 (=> (not res!28778) (not e!32042))))

(declare-fun b!49742 () Bool)

(declare-fun e!32044 () Bool)

(assert (=> b!49742 (= e!32044 e!32043)))

(declare-fun c!6707 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!49742 (= c!6707 (validKeyInArray!0 (select (arr!1553 _keys!1794) i!836)))))

(declare-fun d!9983 () Bool)

(declare-fun res!28779 () Bool)

(assert (=> d!9983 (=> res!28779 e!32044)))

(assert (=> d!9983 (= res!28779 (bvsge i!836 (size!1775 _keys!1794)))))

(assert (=> d!9983 (= (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234) e!32044)))

(assert (= (and d!9983 (not res!28779)) b!49742))

(assert (= (and b!49742 c!6707) b!49744))

(assert (= (and b!49742 (not c!6707)) b!49741))

(assert (= (and b!49744 res!28778) b!49743))

(assert (= (or b!49743 b!49741) bm!3852))

(declare-fun m!43149 () Bool)

(assert (=> bm!3852 m!43149))

(declare-fun m!43151 () Bool)

(assert (=> b!49744 m!43151))

(declare-fun m!43153 () Bool)

(assert (=> b!49744 m!43153))

(declare-fun m!43155 () Bool)

(assert (=> b!49744 m!43155))

(assert (=> b!49744 m!43151))

(declare-fun m!43157 () Bool)

(assert (=> b!49744 m!43157))

(assert (=> b!49742 m!43151))

(assert (=> b!49742 m!43151))

(declare-fun m!43159 () Bool)

(assert (=> b!49742 m!43159))

(assert (=> b!49700 d!9983))

(declare-fun b!49745 () Bool)

(declare-fun e!32046 () Bool)

(declare-fun call!3856 () Bool)

(assert (=> b!49745 (= e!32046 call!3856)))

(declare-fun bm!3853 () Bool)

(assert (=> bm!3853 (= call!3856 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49747 () Bool)

(declare-fun e!32045 () Bool)

(assert (=> b!49747 (= e!32045 call!3856)))

(declare-fun b!49748 () Bool)

(assert (=> b!49748 (= e!32046 e!32045)))

(declare-fun lt!20901 () (_ BitVec 64))

(assert (=> b!49748 (= lt!20901 (select (arr!1553 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)))))

(declare-fun lt!20903 () Unit!1409)

(assert (=> b!49748 (= lt!20903 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20901 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> b!49748 (arrayContainsKey!0 _keys!1794 lt!20901 #b00000000000000000000000000000000)))

(declare-fun lt!20902 () Unit!1409)

(assert (=> b!49748 (= lt!20902 lt!20903)))

(declare-fun res!28780 () Bool)

(assert (=> b!49748 (= res!28780 (= (seekEntryOrOpen!0 (select (arr!1553 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234) (Found!214 (bvadd #b00000000000000000000000000000001 i!836))))))

(assert (=> b!49748 (=> (not res!28780) (not e!32045))))

(declare-fun b!49746 () Bool)

(declare-fun e!32047 () Bool)

(assert (=> b!49746 (= e!32047 e!32046)))

(declare-fun c!6708 () Bool)

(assert (=> b!49746 (= c!6708 (validKeyInArray!0 (select (arr!1553 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))))))

(declare-fun d!9993 () Bool)

(declare-fun res!28781 () Bool)

(assert (=> d!9993 (=> res!28781 e!32047)))

(assert (=> d!9993 (= res!28781 (bvsge (bvadd #b00000000000000000000000000000001 i!836) (size!1775 _keys!1794)))))

(assert (=> d!9993 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234) e!32047)))

(assert (= (and d!9993 (not res!28781)) b!49746))

(assert (= (and b!49746 c!6708) b!49748))

(assert (= (and b!49746 (not c!6708)) b!49745))

(assert (= (and b!49748 res!28780) b!49747))

(assert (= (or b!49747 b!49745) bm!3853))

(declare-fun m!43163 () Bool)

(assert (=> bm!3853 m!43163))

(declare-fun m!43165 () Bool)

(assert (=> b!49748 m!43165))

(declare-fun m!43167 () Bool)

(assert (=> b!49748 m!43167))

(declare-fun m!43169 () Bool)

(assert (=> b!49748 m!43169))

(assert (=> b!49748 m!43165))

(declare-fun m!43171 () Bool)

(assert (=> b!49748 m!43171))

(assert (=> b!49746 m!43165))

(assert (=> b!49746 m!43165))

(declare-fun m!43173 () Bool)

(assert (=> b!49746 m!43173))

(assert (=> b!49700 d!9993))

(declare-fun d!9995 () Bool)

(assert (=> d!9995 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-fun lt!20909 () Unit!1409)

(declare-fun choose!34 (array!3241 (_ BitVec 32) (_ BitVec 32)) Unit!1409)

(assert (=> d!9995 (= lt!20909 (choose!34 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> d!9995 (validMask!0 mask!2234)))

(assert (=> d!9995 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)) lt!20909)))

(declare-fun bs!2334 () Bool)

(assert (= bs!2334 d!9995))

(assert (=> bs!2334 m!43097))

(declare-fun m!43177 () Bool)

(assert (=> bs!2334 m!43177))

(assert (=> bs!2334 m!43091))

(assert (=> b!49700 d!9995))

(push 1)

(assert (not b!49742))

(assert (not b!49744))

(assert (not d!9995))

(assert (not b!49746))

(assert (not bm!3853))

(assert (not b!49748))

(assert (not bm!3852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!10013 () Bool)

(assert (=> d!10013 (arrayContainsKey!0 _keys!1794 lt!20901 #b00000000000000000000000000000000)))

(declare-fun lt!20927 () Unit!1409)

(declare-fun choose!13 (array!3241 (_ BitVec 64) (_ BitVec 32)) Unit!1409)

(assert (=> d!10013 (= lt!20927 (choose!13 _keys!1794 lt!20901 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> d!10013 (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))

(assert (=> d!10013 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20901 (bvadd #b00000000000000000000000000000001 i!836)) lt!20927)))

(declare-fun bs!2337 () Bool)

(assert (= bs!2337 d!10013))

(assert (=> bs!2337 m!43169))

(declare-fun m!43203 () Bool)

(assert (=> bs!2337 m!43203))

(assert (=> b!49748 d!10013))

(declare-fun d!10015 () Bool)

(declare-fun res!28800 () Bool)

(declare-fun e!32079 () Bool)

(assert (=> d!10015 (=> res!28800 e!32079)))

(assert (=> d!10015 (= res!28800 (= (select (arr!1553 _keys!1794) #b00000000000000000000000000000000) lt!20901))))

(assert (=> d!10015 (= (arrayContainsKey!0 _keys!1794 lt!20901 #b00000000000000000000000000000000) e!32079)))

(declare-fun b!49793 () Bool)

(declare-fun e!32080 () Bool)

(assert (=> b!49793 (= e!32079 e!32080)))

(declare-fun res!28801 () Bool)

(assert (=> b!49793 (=> (not res!28801) (not e!32080))))

(assert (=> b!49793 (= res!28801 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1775 _keys!1794)))))

(declare-fun b!49794 () Bool)

(assert (=> b!49794 (= e!32080 (arrayContainsKey!0 _keys!1794 lt!20901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10015 (not res!28800)) b!49793))

(assert (= (and b!49793 res!28801) b!49794))

(declare-fun m!43205 () Bool)

(assert (=> d!10015 m!43205))

(declare-fun m!43207 () Bool)

(assert (=> b!49794 m!43207))

(assert (=> b!49748 d!10015))

(declare-fun b!49847 () Bool)

(declare-fun c!6744 () Bool)

(declare-fun lt!20965 () (_ BitVec 64))

(assert (=> b!49847 (= c!6744 (= lt!20965 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32112 () SeekEntryResult!214)

(declare-fun e!32114 () SeekEntryResult!214)

(assert (=> b!49847 (= e!32112 e!32114)))

(declare-fun b!49848 () Bool)

(declare-fun lt!20963 () SeekEntryResult!214)

(assert (=> b!49848 (= e!32114 (MissingZero!214 (index!2980 lt!20963)))))

(declare-fun b!49849 () Bool)

(declare-fun e!32113 () SeekEntryResult!214)

(assert (=> b!49849 (= e!32113 e!32112)))

(assert (=> b!49849 (= lt!20965 (select (arr!1553 _keys!1794) (index!2980 lt!20963)))))

(declare-fun c!6745 () Bool)

(assert (=> b!49849 (= c!6745 (= lt!20965 (select (arr!1553 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))))))

(declare-fun b!49850 () Bool)

(assert (=> b!49850 (= e!32112 (Found!214 (index!2980 lt!20963)))))

(declare-fun d!10017 () Bool)

(declare-fun lt!20964 () SeekEntryResult!214)

(assert (=> d!10017 (and (or (is-Undefined!214 lt!20964) (not (is-Found!214 lt!20964)) (and (bvsge (index!2979 lt!20964) #b00000000000000000000000000000000) (bvslt (index!2979 lt!20964) (size!1775 _keys!1794)))) (or (is-Undefined!214 lt!20964) (is-Found!214 lt!20964) (not (is-MissingZero!214 lt!20964)) (and (bvsge (index!2978 lt!20964) #b00000000000000000000000000000000) (bvslt (index!2978 lt!20964) (size!1775 _keys!1794)))) (or (is-Undefined!214 lt!20964) (is-Found!214 lt!20964) (is-MissingZero!214 lt!20964) (not (is-MissingVacant!214 lt!20964)) (and (bvsge (index!2981 lt!20964) #b00000000000000000000000000000000) (bvslt (index!2981 lt!20964) (size!1775 _keys!1794)))) (or (is-Undefined!214 lt!20964) (ite (is-Found!214 lt!20964) (= (select (arr!1553 _keys!1794) (index!2979 lt!20964)) (select (arr!1553 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))) (ite (is-MissingZero!214 lt!20964) (= (select (arr!1553 _keys!1794) (index!2978 lt!20964)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!214 lt!20964) (= (select (arr!1553 _keys!1794) (index!2981 lt!20964)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

