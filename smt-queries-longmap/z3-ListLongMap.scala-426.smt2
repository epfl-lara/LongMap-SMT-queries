; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7948 () Bool)

(assert start!7948)

(declare-fun res!28828 () Bool)

(declare-fun e!32136 () Bool)

(assert (=> start!7948 (=> (not res!28828) (not e!32136))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7948 (= res!28828 (validMask!0 mask!2234))))

(assert (=> start!7948 e!32136))

(assert (=> start!7948 true))

(declare-datatypes ((array!3248 0))(
  ( (array!3249 (arr!1555 (Array (_ BitVec 32) (_ BitVec 64))) (size!1777 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3248)

(declare-fun array_inv!951 (array!3248) Bool)

(assert (=> start!7948 (array_inv!951 _keys!1794)))

(declare-fun b!49879 () Bool)

(declare-fun res!28829 () Bool)

(assert (=> b!49879 (=> (not res!28829) (not e!32136))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49879 (= res!28829 (and (= (size!1777 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3249 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1777 _keys!1794)) (bvsge i!836 (size!1777 _keys!1794))))))

(declare-fun b!49880 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3248 (_ BitVec 32)) Bool)

(assert (=> b!49880 (= e!32136 (not (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234)))))

(assert (= (and start!7948 res!28828) b!49879))

(assert (= (and b!49879 res!28829) b!49880))

(declare-fun m!43371 () Bool)

(assert (=> start!7948 m!43371))

(declare-fun m!43373 () Bool)

(assert (=> start!7948 m!43373))

(declare-fun m!43375 () Bool)

(assert (=> b!49880 m!43375))

(check-sat (not b!49880) (not start!7948))
(check-sat)
(get-model)

(declare-fun b!49897 () Bool)

(declare-fun e!32152 () Bool)

(declare-fun e!32153 () Bool)

(assert (=> b!49897 (= e!32152 e!32153)))

(declare-fun c!6753 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!49897 (= c!6753 (validKeyInArray!0 (select (arr!1555 _keys!1794) i!836)))))

(declare-fun b!49898 () Bool)

(declare-fun e!32154 () Bool)

(declare-fun call!3865 () Bool)

(assert (=> b!49898 (= e!32154 call!3865)))

(declare-fun b!49899 () Bool)

(assert (=> b!49899 (= e!32153 e!32154)))

(declare-fun lt!20982 () (_ BitVec 64))

(assert (=> b!49899 (= lt!20982 (select (arr!1555 _keys!1794) i!836))))

(declare-datatypes ((Unit!1411 0))(
  ( (Unit!1412) )
))
(declare-fun lt!20984 () Unit!1411)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3248 (_ BitVec 64) (_ BitVec 32)) Unit!1411)

(assert (=> b!49899 (= lt!20984 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20982 i!836))))

(declare-fun arrayContainsKey!0 (array!3248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!49899 (arrayContainsKey!0 _keys!1794 lt!20982 #b00000000000000000000000000000000)))

(declare-fun lt!20983 () Unit!1411)

(assert (=> b!49899 (= lt!20983 lt!20984)))

(declare-fun res!28843 () Bool)

(declare-datatypes ((SeekEntryResult!215 0))(
  ( (MissingZero!215 (index!2982 (_ BitVec 32))) (Found!215 (index!2983 (_ BitVec 32))) (Intermediate!215 (undefined!1027 Bool) (index!2984 (_ BitVec 32)) (x!9113 (_ BitVec 32))) (Undefined!215) (MissingVacant!215 (index!2985 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3248 (_ BitVec 32)) SeekEntryResult!215)

(assert (=> b!49899 (= res!28843 (= (seekEntryOrOpen!0 (select (arr!1555 _keys!1794) i!836) _keys!1794 mask!2234) (Found!215 i!836)))))

(assert (=> b!49899 (=> (not res!28843) (not e!32154))))

(declare-fun d!10065 () Bool)

(declare-fun res!28842 () Bool)

(assert (=> d!10065 (=> res!28842 e!32152)))

(assert (=> d!10065 (= res!28842 (bvsge i!836 (size!1777 _keys!1794)))))

(assert (=> d!10065 (= (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234) e!32152)))

(declare-fun bm!3862 () Bool)

(assert (=> bm!3862 (= call!3865 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49900 () Bool)

(assert (=> b!49900 (= e!32153 call!3865)))

(assert (= (and d!10065 (not res!28842)) b!49897))

(assert (= (and b!49897 c!6753) b!49899))

(assert (= (and b!49897 (not c!6753)) b!49900))

(assert (= (and b!49899 res!28843) b!49898))

(assert (= (or b!49898 b!49900) bm!3862))

(declare-fun m!43383 () Bool)

(assert (=> b!49897 m!43383))

(assert (=> b!49897 m!43383))

(declare-fun m!43385 () Bool)

(assert (=> b!49897 m!43385))

(assert (=> b!49899 m!43383))

(declare-fun m!43387 () Bool)

(assert (=> b!49899 m!43387))

(declare-fun m!43389 () Bool)

(assert (=> b!49899 m!43389))

(assert (=> b!49899 m!43383))

(declare-fun m!43391 () Bool)

(assert (=> b!49899 m!43391))

(declare-fun m!43393 () Bool)

(assert (=> bm!3862 m!43393))

(assert (=> b!49880 d!10065))

(declare-fun d!10071 () Bool)

(assert (=> d!10071 (= (validMask!0 mask!2234) (and (or (= mask!2234 #b00000000000000000000000000000111) (= mask!2234 #b00000000000000000000000000001111) (= mask!2234 #b00000000000000000000000000011111) (= mask!2234 #b00000000000000000000000000111111) (= mask!2234 #b00000000000000000000000001111111) (= mask!2234 #b00000000000000000000000011111111) (= mask!2234 #b00000000000000000000000111111111) (= mask!2234 #b00000000000000000000001111111111) (= mask!2234 #b00000000000000000000011111111111) (= mask!2234 #b00000000000000000000111111111111) (= mask!2234 #b00000000000000000001111111111111) (= mask!2234 #b00000000000000000011111111111111) (= mask!2234 #b00000000000000000111111111111111) (= mask!2234 #b00000000000000001111111111111111) (= mask!2234 #b00000000000000011111111111111111) (= mask!2234 #b00000000000000111111111111111111) (= mask!2234 #b00000000000001111111111111111111) (= mask!2234 #b00000000000011111111111111111111) (= mask!2234 #b00000000000111111111111111111111) (= mask!2234 #b00000000001111111111111111111111) (= mask!2234 #b00000000011111111111111111111111) (= mask!2234 #b00000000111111111111111111111111) (= mask!2234 #b00000001111111111111111111111111) (= mask!2234 #b00000011111111111111111111111111) (= mask!2234 #b00000111111111111111111111111111) (= mask!2234 #b00001111111111111111111111111111) (= mask!2234 #b00011111111111111111111111111111) (= mask!2234 #b00111111111111111111111111111111)) (bvsle mask!2234 #b00111111111111111111111111111111)))))

(assert (=> start!7948 d!10071))

(declare-fun d!10077 () Bool)

(assert (=> d!10077 (= (array_inv!951 _keys!1794) (bvsge (size!1777 _keys!1794) #b00000000000000000000000000000000))))

(assert (=> start!7948 d!10077))

(check-sat (not b!49899) (not b!49897) (not bm!3862))
(check-sat)
