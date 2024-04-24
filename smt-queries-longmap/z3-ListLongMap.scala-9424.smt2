; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112376 () Bool)

(assert start!112376)

(declare-fun b_free!30547 () Bool)

(declare-fun b_next!30547 () Bool)

(assert (=> start!112376 (= b_free!30547 (not b_next!30547))))

(declare-fun tp!107278 () Bool)

(declare-fun b_and!49199 () Bool)

(assert (=> start!112376 (= tp!107278 b_and!49199)))

(declare-fun b!1329555 () Bool)

(declare-fun e!758149 () Bool)

(assert (=> b!1329555 (= e!758149 false)))

(declare-datatypes ((V!53713 0))(
  ( (V!53714 (val!18303 Int)) )
))
(declare-datatypes ((ValueCell!17330 0))(
  ( (ValueCellFull!17330 (v!20935 V!53713)) (EmptyCell!17330) )
))
(declare-datatypes ((array!89917 0))(
  ( (array!89918 (arr!43420 (Array (_ BitVec 32) ValueCell!17330)) (size!43971 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89917)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89919 0))(
  ( (array!89920 (arr!43421 (Array (_ BitVec 32) (_ BitVec 64))) (size!43972 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89919)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun zeroValue!1262 () V!53713)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591294 () Bool)

(declare-fun minValue!1262 () V!53713)

(declare-datatypes ((tuple2!23584 0))(
  ( (tuple2!23585 (_1!11803 (_ BitVec 64)) (_2!11803 V!53713)) )
))
(declare-datatypes ((List!30760 0))(
  ( (Nil!30757) (Cons!30756 (h!31974 tuple2!23584) (t!44758 List!30760)) )
))
(declare-datatypes ((ListLongMap!21249 0))(
  ( (ListLongMap!21250 (toList!10640 List!30760)) )
))
(declare-fun contains!8816 (ListLongMap!21249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5617 (array!89919 array!89917 (_ BitVec 32) (_ BitVec 32) V!53713 V!53713 (_ BitVec 32) Int) ListLongMap!21249)

(assert (=> b!1329555 (= lt!591294 (contains!8816 (getCurrentListMap!5617 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!881813 () Bool)

(assert (=> start!112376 (=> (not res!881813) (not e!758149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112376 (= res!881813 (validMask!0 mask!1998))))

(assert (=> start!112376 e!758149))

(declare-fun e!758146 () Bool)

(declare-fun array_inv!33041 (array!89917) Bool)

(assert (=> start!112376 (and (array_inv!33041 _values!1320) e!758146)))

(assert (=> start!112376 true))

(declare-fun array_inv!33042 (array!89919) Bool)

(assert (=> start!112376 (array_inv!33042 _keys!1590)))

(assert (=> start!112376 tp!107278))

(declare-fun tp_is_empty!36457 () Bool)

(assert (=> start!112376 tp_is_empty!36457))

(declare-fun b!1329556 () Bool)

(declare-fun res!881812 () Bool)

(assert (=> b!1329556 (=> (not res!881812) (not e!758149))))

(assert (=> b!1329556 (= res!881812 (and (= (size!43971 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43972 _keys!1590) (size!43971 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329557 () Bool)

(declare-fun e!758147 () Bool)

(assert (=> b!1329557 (= e!758147 tp_is_empty!36457)))

(declare-fun mapNonEmpty!56359 () Bool)

(declare-fun mapRes!56359 () Bool)

(declare-fun tp!107277 () Bool)

(declare-fun e!758148 () Bool)

(assert (=> mapNonEmpty!56359 (= mapRes!56359 (and tp!107277 e!758148))))

(declare-fun mapKey!56359 () (_ BitVec 32))

(declare-fun mapRest!56359 () (Array (_ BitVec 32) ValueCell!17330))

(declare-fun mapValue!56359 () ValueCell!17330)

(assert (=> mapNonEmpty!56359 (= (arr!43420 _values!1320) (store mapRest!56359 mapKey!56359 mapValue!56359))))

(declare-fun b!1329558 () Bool)

(assert (=> b!1329558 (= e!758146 (and e!758147 mapRes!56359))))

(declare-fun condMapEmpty!56359 () Bool)

(declare-fun mapDefault!56359 () ValueCell!17330)

(assert (=> b!1329558 (= condMapEmpty!56359 (= (arr!43420 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17330)) mapDefault!56359)))))

(declare-fun b!1329559 () Bool)

(declare-fun res!881816 () Bool)

(assert (=> b!1329559 (=> (not res!881816) (not e!758149))))

(assert (=> b!1329559 (= res!881816 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43972 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56359 () Bool)

(assert (=> mapIsEmpty!56359 mapRes!56359))

(declare-fun b!1329560 () Bool)

(declare-fun res!881815 () Bool)

(assert (=> b!1329560 (=> (not res!881815) (not e!758149))))

(declare-datatypes ((List!30761 0))(
  ( (Nil!30758) (Cons!30757 (h!31975 (_ BitVec 64)) (t!44759 List!30761)) )
))
(declare-fun arrayNoDuplicates!0 (array!89919 (_ BitVec 32) List!30761) Bool)

(assert (=> b!1329560 (= res!881815 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30758))))

(declare-fun b!1329561 () Bool)

(declare-fun res!881814 () Bool)

(assert (=> b!1329561 (=> (not res!881814) (not e!758149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89919 (_ BitVec 32)) Bool)

(assert (=> b!1329561 (= res!881814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329562 () Bool)

(assert (=> b!1329562 (= e!758148 tp_is_empty!36457)))

(assert (= (and start!112376 res!881813) b!1329556))

(assert (= (and b!1329556 res!881812) b!1329561))

(assert (= (and b!1329561 res!881814) b!1329560))

(assert (= (and b!1329560 res!881815) b!1329559))

(assert (= (and b!1329559 res!881816) b!1329555))

(assert (= (and b!1329558 condMapEmpty!56359) mapIsEmpty!56359))

(assert (= (and b!1329558 (not condMapEmpty!56359)) mapNonEmpty!56359))

(get-info :version)

(assert (= (and mapNonEmpty!56359 ((_ is ValueCellFull!17330) mapValue!56359)) b!1329562))

(assert (= (and b!1329558 ((_ is ValueCellFull!17330) mapDefault!56359)) b!1329557))

(assert (= start!112376 b!1329558))

(declare-fun m!1218887 () Bool)

(assert (=> b!1329560 m!1218887))

(declare-fun m!1218889 () Bool)

(assert (=> b!1329561 m!1218889))

(declare-fun m!1218891 () Bool)

(assert (=> b!1329555 m!1218891))

(assert (=> b!1329555 m!1218891))

(declare-fun m!1218893 () Bool)

(assert (=> b!1329555 m!1218893))

(declare-fun m!1218895 () Bool)

(assert (=> mapNonEmpty!56359 m!1218895))

(declare-fun m!1218897 () Bool)

(assert (=> start!112376 m!1218897))

(declare-fun m!1218899 () Bool)

(assert (=> start!112376 m!1218899))

(declare-fun m!1218901 () Bool)

(assert (=> start!112376 m!1218901))

(check-sat tp_is_empty!36457 (not b!1329560) (not start!112376) (not mapNonEmpty!56359) (not b!1329555) (not b!1329561) b_and!49199 (not b_next!30547))
(check-sat b_and!49199 (not b_next!30547))
