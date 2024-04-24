; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7950 () Bool)

(assert start!7950)

(declare-fun res!28797 () Bool)

(declare-fun e!32093 () Bool)

(assert (=> start!7950 (=> (not res!28797) (not e!32093))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7950 (= res!28797 (validMask!0 mask!2234))))

(assert (=> start!7950 e!32093))

(assert (=> start!7950 true))

(declare-datatypes ((array!3232 0))(
  ( (array!3233 (arr!1547 (Array (_ BitVec 32) (_ BitVec 64))) (size!1769 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3232)

(declare-fun array_inv!932 (array!3232) Bool)

(assert (=> start!7950 (array_inv!932 _keys!1794)))

(declare-fun b!49816 () Bool)

(declare-fun res!28798 () Bool)

(assert (=> b!49816 (=> (not res!28798) (not e!32093))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49816 (= res!28798 (and (= (size!1769 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3233 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1769 _keys!1794)) (bvsge i!836 (size!1769 _keys!1794))))))

(declare-fun b!49817 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3232 (_ BitVec 32)) Bool)

(assert (=> b!49817 (= e!32093 (not (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234)))))

(assert (= (and start!7950 res!28797) b!49816))

(assert (= (and b!49816 res!28798) b!49817))

(declare-fun m!43241 () Bool)

(assert (=> start!7950 m!43241))

(declare-fun m!43243 () Bool)

(assert (=> start!7950 m!43243))

(declare-fun m!43245 () Bool)

(assert (=> b!49817 m!43245))

(check-sat (not start!7950) (not b!49817))
(check-sat)
(get-model)

(declare-fun d!10051 () Bool)

(assert (=> d!10051 (= (validMask!0 mask!2234) (and (or (= mask!2234 #b00000000000000000000000000000111) (= mask!2234 #b00000000000000000000000000001111) (= mask!2234 #b00000000000000000000000000011111) (= mask!2234 #b00000000000000000000000000111111) (= mask!2234 #b00000000000000000000000001111111) (= mask!2234 #b00000000000000000000000011111111) (= mask!2234 #b00000000000000000000000111111111) (= mask!2234 #b00000000000000000000001111111111) (= mask!2234 #b00000000000000000000011111111111) (= mask!2234 #b00000000000000000000111111111111) (= mask!2234 #b00000000000000000001111111111111) (= mask!2234 #b00000000000000000011111111111111) (= mask!2234 #b00000000000000000111111111111111) (= mask!2234 #b00000000000000001111111111111111) (= mask!2234 #b00000000000000011111111111111111) (= mask!2234 #b00000000000000111111111111111111) (= mask!2234 #b00000000000001111111111111111111) (= mask!2234 #b00000000000011111111111111111111) (= mask!2234 #b00000000000111111111111111111111) (= mask!2234 #b00000000001111111111111111111111) (= mask!2234 #b00000000011111111111111111111111) (= mask!2234 #b00000000111111111111111111111111) (= mask!2234 #b00000001111111111111111111111111) (= mask!2234 #b00000011111111111111111111111111) (= mask!2234 #b00000111111111111111111111111111) (= mask!2234 #b00001111111111111111111111111111) (= mask!2234 #b00011111111111111111111111111111) (= mask!2234 #b00111111111111111111111111111111)) (bvsle mask!2234 #b00111111111111111111111111111111)))))

(assert (=> start!7950 d!10051))

(declare-fun d!10057 () Bool)

(assert (=> d!10057 (= (array_inv!932 _keys!1794) (bvsge (size!1769 _keys!1794) #b00000000000000000000000000000000))))

(assert (=> start!7950 d!10057))

(declare-fun b!49850 () Bool)

(declare-fun e!32123 () Bool)

(declare-fun call!3854 () Bool)

(assert (=> b!49850 (= e!32123 call!3854)))

(declare-fun b!49851 () Bool)

(declare-fun e!32124 () Bool)

(assert (=> b!49851 (= e!32124 e!32123)))

(declare-fun c!6740 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!49851 (= c!6740 (validKeyInArray!0 (select (arr!1547 _keys!1794) i!836)))))

(declare-fun b!49852 () Bool)

(declare-fun e!32122 () Bool)

(assert (=> b!49852 (= e!32123 e!32122)))

(declare-fun lt!20949 () (_ BitVec 64))

(assert (=> b!49852 (= lt!20949 (select (arr!1547 _keys!1794) i!836))))

(declare-datatypes ((Unit!1422 0))(
  ( (Unit!1423) )
))
(declare-fun lt!20950 () Unit!1422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3232 (_ BitVec 64) (_ BitVec 32)) Unit!1422)

(assert (=> b!49852 (= lt!20950 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20949 i!836))))

(declare-fun arrayContainsKey!0 (array!3232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!49852 (arrayContainsKey!0 _keys!1794 lt!20949 #b00000000000000000000000000000000)))

(declare-fun lt!20948 () Unit!1422)

(assert (=> b!49852 (= lt!20948 lt!20950)))

(declare-fun res!28822 () Bool)

(declare-datatypes ((SeekEntryResult!209 0))(
  ( (MissingZero!209 (index!2958 (_ BitVec 32))) (Found!209 (index!2959 (_ BitVec 32))) (Intermediate!209 (undefined!1021 Bool) (index!2960 (_ BitVec 32)) (x!9107 (_ BitVec 32))) (Undefined!209) (MissingVacant!209 (index!2961 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3232 (_ BitVec 32)) SeekEntryResult!209)

(assert (=> b!49852 (= res!28822 (= (seekEntryOrOpen!0 (select (arr!1547 _keys!1794) i!836) _keys!1794 mask!2234) (Found!209 i!836)))))

(assert (=> b!49852 (=> (not res!28822) (not e!32122))))

(declare-fun d!10059 () Bool)

(declare-fun res!28821 () Bool)

(assert (=> d!10059 (=> res!28821 e!32124)))

(assert (=> d!10059 (= res!28821 (bvsge i!836 (size!1769 _keys!1794)))))

(assert (=> d!10059 (= (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234) e!32124)))

(declare-fun bm!3851 () Bool)

(assert (=> bm!3851 (= call!3854 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49853 () Bool)

(assert (=> b!49853 (= e!32122 call!3854)))

(assert (= (and d!10059 (not res!28821)) b!49851))

(assert (= (and b!49851 c!6740) b!49852))

(assert (= (and b!49851 (not c!6740)) b!49850))

(assert (= (and b!49852 res!28822) b!49853))

(assert (= (or b!49853 b!49850) bm!3851))

(declare-fun m!43271 () Bool)

(assert (=> b!49851 m!43271))

(assert (=> b!49851 m!43271))

(declare-fun m!43273 () Bool)

(assert (=> b!49851 m!43273))

(assert (=> b!49852 m!43271))

(declare-fun m!43275 () Bool)

(assert (=> b!49852 m!43275))

(declare-fun m!43277 () Bool)

(assert (=> b!49852 m!43277))

(assert (=> b!49852 m!43271))

(declare-fun m!43279 () Bool)

(assert (=> b!49852 m!43279))

(declare-fun m!43281 () Bool)

(assert (=> bm!3851 m!43281))

(assert (=> b!49817 d!10059))

(check-sat (not b!49852) (not b!49851) (not bm!3851))
(check-sat)
