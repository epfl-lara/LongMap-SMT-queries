; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7950 () Bool)

(assert start!7950)

(declare-fun res!28802 () Bool)

(declare-fun e!32087 () Bool)

(assert (=> start!7950 (=> (not res!28802) (not e!32087))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7950 (= res!28802 (validMask!0 mask!2234))))

(assert (=> start!7950 e!32087))

(assert (=> start!7950 true))

(declare-datatypes ((array!3226 0))(
  ( (array!3227 (arr!1543 (Array (_ BitVec 32) (_ BitVec 64))) (size!1766 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3226)

(declare-fun array_inv!942 (array!3226) Bool)

(assert (=> start!7950 (array_inv!942 _keys!1794)))

(declare-fun b!49807 () Bool)

(declare-fun res!28803 () Bool)

(assert (=> b!49807 (=> (not res!28803) (not e!32087))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49807 (= res!28803 (and (= (size!1766 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3227 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1766 _keys!1794)) (bvsge i!836 (size!1766 _keys!1794))))))

(declare-fun b!49808 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3226 (_ BitVec 32)) Bool)

(assert (=> b!49808 (= e!32087 (not (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234)))))

(assert (= (and start!7950 res!28802) b!49807))

(assert (= (and b!49807 res!28803) b!49808))

(declare-fun m!43283 () Bool)

(assert (=> start!7950 m!43283))

(declare-fun m!43285 () Bool)

(assert (=> start!7950 m!43285))

(declare-fun m!43287 () Bool)

(assert (=> b!49808 m!43287))

(check-sat (not b!49808) (not start!7950))
(check-sat)
(get-model)

(declare-fun b!49837 () Bool)

(declare-fun e!32113 () Bool)

(declare-fun e!32114 () Bool)

(assert (=> b!49837 (= e!32113 e!32114)))

(declare-fun lt!20973 () (_ BitVec 64))

(assert (=> b!49837 (= lt!20973 (select (arr!1543 _keys!1794) i!836))))

(declare-datatypes ((Unit!1416 0))(
  ( (Unit!1417) )
))
(declare-fun lt!20974 () Unit!1416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3226 (_ BitVec 64) (_ BitVec 32)) Unit!1416)

(assert (=> b!49837 (= lt!20974 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20973 i!836))))

(declare-fun arrayContainsKey!0 (array!3226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!49837 (arrayContainsKey!0 _keys!1794 lt!20973 #b00000000000000000000000000000000)))

(declare-fun lt!20972 () Unit!1416)

(assert (=> b!49837 (= lt!20972 lt!20974)))

(declare-fun res!28825 () Bool)

(declare-datatypes ((SeekEntryResult!218 0))(
  ( (MissingZero!218 (index!2994 (_ BitVec 32))) (Found!218 (index!2995 (_ BitVec 32))) (Intermediate!218 (undefined!1030 Bool) (index!2996 (_ BitVec 32)) (x!9115 (_ BitVec 32))) (Undefined!218) (MissingVacant!218 (index!2997 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3226 (_ BitVec 32)) SeekEntryResult!218)

(assert (=> b!49837 (= res!28825 (= (seekEntryOrOpen!0 (select (arr!1543 _keys!1794) i!836) _keys!1794 mask!2234) (Found!218 i!836)))))

(assert (=> b!49837 (=> (not res!28825) (not e!32114))))

(declare-fun b!49838 () Bool)

(declare-fun call!3864 () Bool)

(assert (=> b!49838 (= e!32114 call!3864)))

(declare-fun d!10041 () Bool)

(declare-fun res!28824 () Bool)

(declare-fun e!32115 () Bool)

(assert (=> d!10041 (=> res!28824 e!32115)))

(assert (=> d!10041 (= res!28824 (bvsge i!836 (size!1766 _keys!1794)))))

(assert (=> d!10041 (= (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234) e!32115)))

(declare-fun b!49839 () Bool)

(assert (=> b!49839 (= e!32113 call!3864)))

(declare-fun bm!3861 () Bool)

(assert (=> bm!3861 (= call!3864 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49840 () Bool)

(assert (=> b!49840 (= e!32115 e!32113)))

(declare-fun c!6732 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!49840 (= c!6732 (validKeyInArray!0 (select (arr!1543 _keys!1794) i!836)))))

(assert (= (and d!10041 (not res!28824)) b!49840))

(assert (= (and b!49840 c!6732) b!49837))

(assert (= (and b!49840 (not c!6732)) b!49839))

(assert (= (and b!49837 res!28825) b!49838))

(assert (= (or b!49838 b!49839) bm!3861))

(declare-fun m!43301 () Bool)

(assert (=> b!49837 m!43301))

(declare-fun m!43303 () Bool)

(assert (=> b!49837 m!43303))

(declare-fun m!43305 () Bool)

(assert (=> b!49837 m!43305))

(assert (=> b!49837 m!43301))

(declare-fun m!43307 () Bool)

(assert (=> b!49837 m!43307))

(declare-fun m!43309 () Bool)

(assert (=> bm!3861 m!43309))

(assert (=> b!49840 m!43301))

(assert (=> b!49840 m!43301))

(declare-fun m!43311 () Bool)

(assert (=> b!49840 m!43311))

(assert (=> b!49808 d!10041))

(declare-fun d!10047 () Bool)

(assert (=> d!10047 (= (validMask!0 mask!2234) (and (or (= mask!2234 #b00000000000000000000000000000111) (= mask!2234 #b00000000000000000000000000001111) (= mask!2234 #b00000000000000000000000000011111) (= mask!2234 #b00000000000000000000000000111111) (= mask!2234 #b00000000000000000000000001111111) (= mask!2234 #b00000000000000000000000011111111) (= mask!2234 #b00000000000000000000000111111111) (= mask!2234 #b00000000000000000000001111111111) (= mask!2234 #b00000000000000000000011111111111) (= mask!2234 #b00000000000000000000111111111111) (= mask!2234 #b00000000000000000001111111111111) (= mask!2234 #b00000000000000000011111111111111) (= mask!2234 #b00000000000000000111111111111111) (= mask!2234 #b00000000000000001111111111111111) (= mask!2234 #b00000000000000011111111111111111) (= mask!2234 #b00000000000000111111111111111111) (= mask!2234 #b00000000000001111111111111111111) (= mask!2234 #b00000000000011111111111111111111) (= mask!2234 #b00000000000111111111111111111111) (= mask!2234 #b00000000001111111111111111111111) (= mask!2234 #b00000000011111111111111111111111) (= mask!2234 #b00000000111111111111111111111111) (= mask!2234 #b00000001111111111111111111111111) (= mask!2234 #b00000011111111111111111111111111) (= mask!2234 #b00000111111111111111111111111111) (= mask!2234 #b00001111111111111111111111111111) (= mask!2234 #b00011111111111111111111111111111) (= mask!2234 #b00111111111111111111111111111111)) (bvsle mask!2234 #b00111111111111111111111111111111)))))

(assert (=> start!7950 d!10047))

(declare-fun d!10053 () Bool)

(assert (=> d!10053 (= (array_inv!942 _keys!1794) (bvsge (size!1766 _keys!1794) #b00000000000000000000000000000000))))

(assert (=> start!7950 d!10053))

(check-sat (not b!49840) (not bm!3861) (not b!49837))
(check-sat)
