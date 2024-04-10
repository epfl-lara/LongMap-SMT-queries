; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38276 () Bool)

(assert start!38276)

(declare-fun b!394872 () Bool)

(declare-fun e!239062 () Bool)

(declare-datatypes ((List!6498 0))(
  ( (Nil!6495) (Cons!6494 (h!7350 (_ BitVec 64)) (t!11672 List!6498)) )
))
(declare-fun noDuplicate!194 (List!6498) Bool)

(assert (=> b!394872 (= e!239062 (not (noDuplicate!194 Nil!6495)))))

(declare-fun mapNonEmpty!16269 () Bool)

(declare-fun mapRes!16269 () Bool)

(declare-fun tp!32064 () Bool)

(declare-fun e!239066 () Bool)

(assert (=> mapNonEmpty!16269 (= mapRes!16269 (and tp!32064 e!239066))))

(declare-fun mapKey!16269 () (_ BitVec 32))

(declare-datatypes ((V!14141 0))(
  ( (V!14142 (val!4933 Int)) )
))
(declare-datatypes ((ValueCell!4545 0))(
  ( (ValueCellFull!4545 (v!7178 V!14141)) (EmptyCell!4545) )
))
(declare-datatypes ((array!23459 0))(
  ( (array!23460 (arr!11185 (Array (_ BitVec 32) ValueCell!4545)) (size!11537 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23459)

(declare-fun mapRest!16269 () (Array (_ BitVec 32) ValueCell!4545))

(declare-fun mapValue!16269 () ValueCell!4545)

(assert (=> mapNonEmpty!16269 (= (arr!11185 _values!549) (store mapRest!16269 mapKey!16269 mapValue!16269))))

(declare-fun b!394873 () Bool)

(declare-fun res!226341 () Bool)

(assert (=> b!394873 (=> (not res!226341) (not e!239062))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394873 (= res!226341 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16269 () Bool)

(assert (=> mapIsEmpty!16269 mapRes!16269))

(declare-fun b!394874 () Bool)

(declare-fun res!226342 () Bool)

(assert (=> b!394874 (=> (not res!226342) (not e!239062))))

(declare-datatypes ((array!23461 0))(
  ( (array!23462 (arr!11186 (Array (_ BitVec 32) (_ BitVec 64))) (size!11538 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23461)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23461 (_ BitVec 32)) Bool)

(assert (=> b!394874 (= res!226342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394875 () Bool)

(declare-fun res!226343 () Bool)

(assert (=> b!394875 (=> (not res!226343) (not e!239062))))

(assert (=> b!394875 (= res!226343 (and (bvsle #b00000000000000000000000000000000 (size!11538 _keys!709)) (bvslt (size!11538 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!394876 () Bool)

(declare-fun tp_is_empty!9777 () Bool)

(assert (=> b!394876 (= e!239066 tp_is_empty!9777)))

(declare-fun b!394877 () Bool)

(declare-fun res!226340 () Bool)

(assert (=> b!394877 (=> (not res!226340) (not e!239062))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!394877 (= res!226340 (and (= (size!11537 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11538 _keys!709) (size!11537 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394878 () Bool)

(declare-fun e!239065 () Bool)

(declare-fun e!239063 () Bool)

(assert (=> b!394878 (= e!239065 (and e!239063 mapRes!16269))))

(declare-fun condMapEmpty!16269 () Bool)

(declare-fun mapDefault!16269 () ValueCell!4545)

(assert (=> b!394878 (= condMapEmpty!16269 (= (arr!11185 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4545)) mapDefault!16269)))))

(declare-fun res!226339 () Bool)

(assert (=> start!38276 (=> (not res!226339) (not e!239062))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38276 (= res!226339 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11538 _keys!709))))))

(assert (=> start!38276 e!239062))

(assert (=> start!38276 true))

(declare-fun array_inv!8208 (array!23459) Bool)

(assert (=> start!38276 (and (array_inv!8208 _values!549) e!239065)))

(declare-fun array_inv!8209 (array!23461) Bool)

(assert (=> start!38276 (array_inv!8209 _keys!709)))

(declare-fun b!394879 () Bool)

(assert (=> b!394879 (= e!239063 tp_is_empty!9777)))

(assert (= (and start!38276 res!226339) b!394873))

(assert (= (and b!394873 res!226341) b!394877))

(assert (= (and b!394877 res!226340) b!394874))

(assert (= (and b!394874 res!226342) b!394875))

(assert (= (and b!394875 res!226343) b!394872))

(assert (= (and b!394878 condMapEmpty!16269) mapIsEmpty!16269))

(assert (= (and b!394878 (not condMapEmpty!16269)) mapNonEmpty!16269))

(get-info :version)

(assert (= (and mapNonEmpty!16269 ((_ is ValueCellFull!4545) mapValue!16269)) b!394876))

(assert (= (and b!394878 ((_ is ValueCellFull!4545) mapDefault!16269)) b!394879))

(assert (= start!38276 b!394878))

(declare-fun m!391173 () Bool)

(assert (=> start!38276 m!391173))

(declare-fun m!391175 () Bool)

(assert (=> start!38276 m!391175))

(declare-fun m!391177 () Bool)

(assert (=> b!394874 m!391177))

(declare-fun m!391179 () Bool)

(assert (=> mapNonEmpty!16269 m!391179))

(declare-fun m!391181 () Bool)

(assert (=> b!394872 m!391181))

(declare-fun m!391183 () Bool)

(assert (=> b!394873 m!391183))

(check-sat (not start!38276) tp_is_empty!9777 (not mapNonEmpty!16269) (not b!394874) (not b!394872) (not b!394873))
(check-sat)
(get-model)

(declare-fun d!73301 () Bool)

(assert (=> d!73301 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!394873 d!73301))

(declare-fun d!73303 () Bool)

(assert (=> d!73303 (= (array_inv!8208 _values!549) (bvsge (size!11537 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38276 d!73303))

(declare-fun d!73305 () Bool)

(assert (=> d!73305 (= (array_inv!8209 _keys!709) (bvsge (size!11538 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38276 d!73305))

(declare-fun d!73307 () Bool)

(declare-fun res!226363 () Bool)

(declare-fun e!239086 () Bool)

(assert (=> d!73307 (=> res!226363 e!239086)))

(assert (=> d!73307 (= res!226363 ((_ is Nil!6495) Nil!6495))))

(assert (=> d!73307 (= (noDuplicate!194 Nil!6495) e!239086)))

(declare-fun b!394908 () Bool)

(declare-fun e!239087 () Bool)

(assert (=> b!394908 (= e!239086 e!239087)))

(declare-fun res!226364 () Bool)

(assert (=> b!394908 (=> (not res!226364) (not e!239087))))

(declare-fun contains!2476 (List!6498 (_ BitVec 64)) Bool)

(assert (=> b!394908 (= res!226364 (not (contains!2476 (t!11672 Nil!6495) (h!7350 Nil!6495))))))

(declare-fun b!394909 () Bool)

(assert (=> b!394909 (= e!239087 (noDuplicate!194 (t!11672 Nil!6495)))))

(assert (= (and d!73307 (not res!226363)) b!394908))

(assert (= (and b!394908 res!226364) b!394909))

(declare-fun m!391197 () Bool)

(assert (=> b!394908 m!391197))

(declare-fun m!391199 () Bool)

(assert (=> b!394909 m!391199))

(assert (=> b!394872 d!73307))

(declare-fun d!73309 () Bool)

(declare-fun res!226369 () Bool)

(declare-fun e!239096 () Bool)

(assert (=> d!73309 (=> res!226369 e!239096)))

(assert (=> d!73309 (= res!226369 (bvsge #b00000000000000000000000000000000 (size!11538 _keys!709)))))

(assert (=> d!73309 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239096)))

(declare-fun bm!27863 () Bool)

(declare-fun call!27866 () Bool)

(assert (=> bm!27863 (= call!27866 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!394918 () Bool)

(declare-fun e!239094 () Bool)

(assert (=> b!394918 (= e!239094 call!27866)))

(declare-fun b!394919 () Bool)

(declare-fun e!239095 () Bool)

(assert (=> b!394919 (= e!239095 call!27866)))

(declare-fun b!394920 () Bool)

(assert (=> b!394920 (= e!239094 e!239095)))

(declare-fun lt!187044 () (_ BitVec 64))

(assert (=> b!394920 (= lt!187044 (select (arr!11186 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12066 0))(
  ( (Unit!12067) )
))
(declare-fun lt!187042 () Unit!12066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23461 (_ BitVec 64) (_ BitVec 32)) Unit!12066)

(assert (=> b!394920 (= lt!187042 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187044 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394920 (arrayContainsKey!0 _keys!709 lt!187044 #b00000000000000000000000000000000)))

(declare-fun lt!187043 () Unit!12066)

(assert (=> b!394920 (= lt!187043 lt!187042)))

(declare-fun res!226370 () Bool)

(declare-datatypes ((SeekEntryResult!3521 0))(
  ( (MissingZero!3521 (index!16263 (_ BitVec 32))) (Found!3521 (index!16264 (_ BitVec 32))) (Intermediate!3521 (undefined!4333 Bool) (index!16265 (_ BitVec 32)) (x!38583 (_ BitVec 32))) (Undefined!3521) (MissingVacant!3521 (index!16266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23461 (_ BitVec 32)) SeekEntryResult!3521)

(assert (=> b!394920 (= res!226370 (= (seekEntryOrOpen!0 (select (arr!11186 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3521 #b00000000000000000000000000000000)))))

(assert (=> b!394920 (=> (not res!226370) (not e!239095))))

(declare-fun b!394921 () Bool)

(assert (=> b!394921 (= e!239096 e!239094)))

(declare-fun c!54542 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394921 (= c!54542 (validKeyInArray!0 (select (arr!11186 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!73309 (not res!226369)) b!394921))

(assert (= (and b!394921 c!54542) b!394920))

(assert (= (and b!394921 (not c!54542)) b!394918))

(assert (= (and b!394920 res!226370) b!394919))

(assert (= (or b!394919 b!394918) bm!27863))

(declare-fun m!391201 () Bool)

(assert (=> bm!27863 m!391201))

(declare-fun m!391203 () Bool)

(assert (=> b!394920 m!391203))

(declare-fun m!391205 () Bool)

(assert (=> b!394920 m!391205))

(declare-fun m!391207 () Bool)

(assert (=> b!394920 m!391207))

(assert (=> b!394920 m!391203))

(declare-fun m!391209 () Bool)

(assert (=> b!394920 m!391209))

(assert (=> b!394921 m!391203))

(assert (=> b!394921 m!391203))

(declare-fun m!391211 () Bool)

(assert (=> b!394921 m!391211))

(assert (=> b!394874 d!73309))

(declare-fun mapNonEmpty!16275 () Bool)

(declare-fun mapRes!16275 () Bool)

(declare-fun tp!32070 () Bool)

(declare-fun e!239102 () Bool)

(assert (=> mapNonEmpty!16275 (= mapRes!16275 (and tp!32070 e!239102))))

(declare-fun mapValue!16275 () ValueCell!4545)

(declare-fun mapRest!16275 () (Array (_ BitVec 32) ValueCell!4545))

(declare-fun mapKey!16275 () (_ BitVec 32))

(assert (=> mapNonEmpty!16275 (= mapRest!16269 (store mapRest!16275 mapKey!16275 mapValue!16275))))

(declare-fun condMapEmpty!16275 () Bool)

(declare-fun mapDefault!16275 () ValueCell!4545)

(assert (=> mapNonEmpty!16269 (= condMapEmpty!16275 (= mapRest!16269 ((as const (Array (_ BitVec 32) ValueCell!4545)) mapDefault!16275)))))

(declare-fun e!239101 () Bool)

(assert (=> mapNonEmpty!16269 (= tp!32064 (and e!239101 mapRes!16275))))

(declare-fun b!394928 () Bool)

(assert (=> b!394928 (= e!239102 tp_is_empty!9777)))

(declare-fun b!394929 () Bool)

(assert (=> b!394929 (= e!239101 tp_is_empty!9777)))

(declare-fun mapIsEmpty!16275 () Bool)

(assert (=> mapIsEmpty!16275 mapRes!16275))

(assert (= (and mapNonEmpty!16269 condMapEmpty!16275) mapIsEmpty!16275))

(assert (= (and mapNonEmpty!16269 (not condMapEmpty!16275)) mapNonEmpty!16275))

(assert (= (and mapNonEmpty!16275 ((_ is ValueCellFull!4545) mapValue!16275)) b!394928))

(assert (= (and mapNonEmpty!16269 ((_ is ValueCellFull!4545) mapDefault!16275)) b!394929))

(declare-fun m!391213 () Bool)

(assert (=> mapNonEmpty!16275 m!391213))

(check-sat (not b!394908) (not b!394909) (not bm!27863) (not b!394921) (not mapNonEmpty!16275) tp_is_empty!9777 (not b!394920))
(check-sat)
