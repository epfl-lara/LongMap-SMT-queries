; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83006 () Bool)

(assert start!83006)

(declare-fun mapIsEmpty!34891 () Bool)

(declare-fun mapRes!34891 () Bool)

(assert (=> mapIsEmpty!34891 mapRes!34891))

(declare-fun res!648433 () Bool)

(declare-fun e!545941 () Bool)

(assert (=> start!83006 (=> (not res!648433) (not e!545941))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83006 (= res!648433 (validMask!0 mask!2147))))

(assert (=> start!83006 e!545941))

(assert (=> start!83006 true))

(declare-datatypes ((V!34219 0))(
  ( (V!34220 (val!11014 Int)) )
))
(declare-datatypes ((ValueCell!10482 0))(
  ( (ValueCellFull!10482 (v!13572 V!34219)) (EmptyCell!10482) )
))
(declare-datatypes ((array!59927 0))(
  ( (array!59928 (arr!28830 (Array (_ BitVec 32) ValueCell!10482)) (size!29309 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59927)

(declare-fun e!545942 () Bool)

(declare-fun array_inv!22319 (array!59927) Bool)

(assert (=> start!83006 (and (array_inv!22319 _values!1425) e!545942)))

(declare-datatypes ((array!59929 0))(
  ( (array!59930 (arr!28831 (Array (_ BitVec 32) (_ BitVec 64))) (size!29310 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59929)

(declare-fun array_inv!22320 (array!59929) Bool)

(assert (=> start!83006 (array_inv!22320 _keys!1717)))

(declare-fun b!968652 () Bool)

(declare-fun e!545944 () Bool)

(declare-fun tp_is_empty!21927 () Bool)

(assert (=> b!968652 (= e!545944 tp_is_empty!21927)))

(declare-fun b!968653 () Bool)

(assert (=> b!968653 (= e!545941 (and (bvsle #b00000000000000000000000000000000 (size!29310 _keys!1717)) (bvsge (size!29310 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun b!968654 () Bool)

(declare-fun e!545943 () Bool)

(assert (=> b!968654 (= e!545943 tp_is_empty!21927)))

(declare-fun b!968655 () Bool)

(declare-fun res!648432 () Bool)

(assert (=> b!968655 (=> (not res!648432) (not e!545941))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968655 (= res!648432 (and (= (size!29309 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29310 _keys!1717) (size!29309 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968656 () Bool)

(declare-fun res!648431 () Bool)

(assert (=> b!968656 (=> (not res!648431) (not e!545941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59929 (_ BitVec 32)) Bool)

(assert (=> b!968656 (= res!648431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!34891 () Bool)

(declare-fun tp!66459 () Bool)

(assert (=> mapNonEmpty!34891 (= mapRes!34891 (and tp!66459 e!545944))))

(declare-fun mapRest!34891 () (Array (_ BitVec 32) ValueCell!10482))

(declare-fun mapKey!34891 () (_ BitVec 32))

(declare-fun mapValue!34891 () ValueCell!10482)

(assert (=> mapNonEmpty!34891 (= (arr!28830 _values!1425) (store mapRest!34891 mapKey!34891 mapValue!34891))))

(declare-fun b!968657 () Bool)

(assert (=> b!968657 (= e!545942 (and e!545943 mapRes!34891))))

(declare-fun condMapEmpty!34891 () Bool)

(declare-fun mapDefault!34891 () ValueCell!10482)

(assert (=> b!968657 (= condMapEmpty!34891 (= (arr!28830 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10482)) mapDefault!34891)))))

(assert (= (and start!83006 res!648433) b!968655))

(assert (= (and b!968655 res!648432) b!968656))

(assert (= (and b!968656 res!648431) b!968653))

(assert (= (and b!968657 condMapEmpty!34891) mapIsEmpty!34891))

(assert (= (and b!968657 (not condMapEmpty!34891)) mapNonEmpty!34891))

(get-info :version)

(assert (= (and mapNonEmpty!34891 ((_ is ValueCellFull!10482) mapValue!34891)) b!968652))

(assert (= (and b!968657 ((_ is ValueCellFull!10482) mapDefault!34891)) b!968654))

(assert (= start!83006 b!968657))

(declare-fun m!896927 () Bool)

(assert (=> start!83006 m!896927))

(declare-fun m!896929 () Bool)

(assert (=> start!83006 m!896929))

(declare-fun m!896931 () Bool)

(assert (=> start!83006 m!896931))

(declare-fun m!896933 () Bool)

(assert (=> b!968656 m!896933))

(declare-fun m!896935 () Bool)

(assert (=> mapNonEmpty!34891 m!896935))

(check-sat (not b!968656) (not start!83006) (not mapNonEmpty!34891) tp_is_empty!21927)
(check-sat)
(get-model)

(declare-fun b!968684 () Bool)

(declare-fun e!545968 () Bool)

(declare-fun e!545969 () Bool)

(assert (=> b!968684 (= e!545968 e!545969)))

(declare-fun c!99923 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968684 (= c!99923 (validKeyInArray!0 (select (arr!28831 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!968685 () Bool)

(declare-fun e!545967 () Bool)

(assert (=> b!968685 (= e!545969 e!545967)))

(declare-fun lt!431539 () (_ BitVec 64))

(assert (=> b!968685 (= lt!431539 (select (arr!28831 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32363 0))(
  ( (Unit!32364) )
))
(declare-fun lt!431538 () Unit!32363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59929 (_ BitVec 64) (_ BitVec 32)) Unit!32363)

(assert (=> b!968685 (= lt!431538 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431539 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!968685 (arrayContainsKey!0 _keys!1717 lt!431539 #b00000000000000000000000000000000)))

(declare-fun lt!431537 () Unit!32363)

(assert (=> b!968685 (= lt!431537 lt!431538)))

(declare-fun res!648447 () Bool)

(declare-datatypes ((SeekEntryResult!9198 0))(
  ( (MissingZero!9198 (index!39163 (_ BitVec 32))) (Found!9198 (index!39164 (_ BitVec 32))) (Intermediate!9198 (undefined!10010 Bool) (index!39165 (_ BitVec 32)) (x!83628 (_ BitVec 32))) (Undefined!9198) (MissingVacant!9198 (index!39166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59929 (_ BitVec 32)) SeekEntryResult!9198)

(assert (=> b!968685 (= res!648447 (= (seekEntryOrOpen!0 (select (arr!28831 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9198 #b00000000000000000000000000000000)))))

(assert (=> b!968685 (=> (not res!648447) (not e!545967))))

(declare-fun bm!41732 () Bool)

(declare-fun call!41735 () Bool)

(assert (=> bm!41732 (= call!41735 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun b!968686 () Bool)

(assert (=> b!968686 (= e!545969 call!41735)))

(declare-fun d!116251 () Bool)

(declare-fun res!648448 () Bool)

(assert (=> d!116251 (=> res!648448 e!545968)))

(assert (=> d!116251 (= res!648448 (bvsge #b00000000000000000000000000000000 (size!29310 _keys!1717)))))

(assert (=> d!116251 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!545968)))

(declare-fun b!968687 () Bool)

(assert (=> b!968687 (= e!545967 call!41735)))

(assert (= (and d!116251 (not res!648448)) b!968684))

(assert (= (and b!968684 c!99923) b!968685))

(assert (= (and b!968684 (not c!99923)) b!968686))

(assert (= (and b!968685 res!648447) b!968687))

(assert (= (or b!968687 b!968686) bm!41732))

(declare-fun m!896947 () Bool)

(assert (=> b!968684 m!896947))

(assert (=> b!968684 m!896947))

(declare-fun m!896949 () Bool)

(assert (=> b!968684 m!896949))

(assert (=> b!968685 m!896947))

(declare-fun m!896951 () Bool)

(assert (=> b!968685 m!896951))

(declare-fun m!896953 () Bool)

(assert (=> b!968685 m!896953))

(assert (=> b!968685 m!896947))

(declare-fun m!896955 () Bool)

(assert (=> b!968685 m!896955))

(declare-fun m!896957 () Bool)

(assert (=> bm!41732 m!896957))

(assert (=> b!968656 d!116251))

(declare-fun d!116253 () Bool)

(assert (=> d!116253 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83006 d!116253))

(declare-fun d!116255 () Bool)

(assert (=> d!116255 (= (array_inv!22319 _values!1425) (bvsge (size!29309 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83006 d!116255))

(declare-fun d!116257 () Bool)

(assert (=> d!116257 (= (array_inv!22320 _keys!1717) (bvsge (size!29310 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83006 d!116257))

(declare-fun b!968694 () Bool)

(declare-fun e!545974 () Bool)

(assert (=> b!968694 (= e!545974 tp_is_empty!21927)))

(declare-fun condMapEmpty!34897 () Bool)

(declare-fun mapDefault!34897 () ValueCell!10482)

(assert (=> mapNonEmpty!34891 (= condMapEmpty!34897 (= mapRest!34891 ((as const (Array (_ BitVec 32) ValueCell!10482)) mapDefault!34897)))))

(declare-fun e!545975 () Bool)

(declare-fun mapRes!34897 () Bool)

(assert (=> mapNonEmpty!34891 (= tp!66459 (and e!545975 mapRes!34897))))

(declare-fun mapNonEmpty!34897 () Bool)

(declare-fun tp!66465 () Bool)

(assert (=> mapNonEmpty!34897 (= mapRes!34897 (and tp!66465 e!545974))))

(declare-fun mapRest!34897 () (Array (_ BitVec 32) ValueCell!10482))

(declare-fun mapKey!34897 () (_ BitVec 32))

(declare-fun mapValue!34897 () ValueCell!10482)

(assert (=> mapNonEmpty!34897 (= mapRest!34891 (store mapRest!34897 mapKey!34897 mapValue!34897))))

(declare-fun b!968695 () Bool)

(assert (=> b!968695 (= e!545975 tp_is_empty!21927)))

(declare-fun mapIsEmpty!34897 () Bool)

(assert (=> mapIsEmpty!34897 mapRes!34897))

(assert (= (and mapNonEmpty!34891 condMapEmpty!34897) mapIsEmpty!34897))

(assert (= (and mapNonEmpty!34891 (not condMapEmpty!34897)) mapNonEmpty!34897))

(assert (= (and mapNonEmpty!34897 ((_ is ValueCellFull!10482) mapValue!34897)) b!968694))

(assert (= (and mapNonEmpty!34891 ((_ is ValueCellFull!10482) mapDefault!34897)) b!968695))

(declare-fun m!896959 () Bool)

(assert (=> mapNonEmpty!34897 m!896959))

(check-sat (not b!968685) (not mapNonEmpty!34897) tp_is_empty!21927 (not bm!41732) (not b!968684))
(check-sat)
