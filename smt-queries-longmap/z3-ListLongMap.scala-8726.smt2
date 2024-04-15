; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105846 () Bool)

(assert start!105846)

(declare-fun b_free!27391 () Bool)

(declare-fun b_next!27391 () Bool)

(assert (=> start!105846 (= b_free!27391 (not b_next!27391))))

(declare-fun tp!95704 () Bool)

(declare-fun b_and!45281 () Bool)

(assert (=> start!105846 (= tp!95704 b_and!45281)))

(declare-fun b!1260771 () Bool)

(declare-fun e!717482 () Bool)

(declare-fun e!717485 () Bool)

(declare-fun mapRes!50242 () Bool)

(assert (=> b!1260771 (= e!717482 (and e!717485 mapRes!50242))))

(declare-fun condMapEmpty!50242 () Bool)

(declare-datatypes ((V!48423 0))(
  ( (V!48424 (val!16209 Int)) )
))
(declare-datatypes ((ValueCell!15383 0))(
  ( (ValueCellFull!15383 (v!18912 V!48423)) (EmptyCell!15383) )
))
(declare-datatypes ((array!82129 0))(
  ( (array!82130 (arr!39618 (Array (_ BitVec 32) ValueCell!15383)) (size!40156 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82129)

(declare-fun mapDefault!50242 () ValueCell!15383)

(assert (=> b!1260771 (= condMapEmpty!50242 (= (arr!39618 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15383)) mapDefault!50242)))))

(declare-fun b!1260772 () Bool)

(declare-fun e!717484 () Bool)

(declare-fun tp_is_empty!32293 () Bool)

(assert (=> b!1260772 (= e!717484 tp_is_empty!32293)))

(declare-fun res!840198 () Bool)

(declare-fun e!717483 () Bool)

(assert (=> start!105846 (=> (not res!840198) (not e!717483))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105846 (= res!840198 (validMask!0 mask!1466))))

(assert (=> start!105846 e!717483))

(assert (=> start!105846 true))

(assert (=> start!105846 tp!95704))

(assert (=> start!105846 tp_is_empty!32293))

(declare-datatypes ((array!82131 0))(
  ( (array!82132 (arr!39619 (Array (_ BitVec 32) (_ BitVec 64))) (size!40157 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82131)

(declare-fun array_inv!30311 (array!82131) Bool)

(assert (=> start!105846 (array_inv!30311 _keys!1118)))

(declare-fun array_inv!30312 (array!82129) Bool)

(assert (=> start!105846 (and (array_inv!30312 _values!914) e!717482)))

(declare-fun mapNonEmpty!50242 () Bool)

(declare-fun tp!95705 () Bool)

(assert (=> mapNonEmpty!50242 (= mapRes!50242 (and tp!95705 e!717484))))

(declare-fun mapValue!50242 () ValueCell!15383)

(declare-fun mapKey!50242 () (_ BitVec 32))

(declare-fun mapRest!50242 () (Array (_ BitVec 32) ValueCell!15383))

(assert (=> mapNonEmpty!50242 (= (arr!39618 _values!914) (store mapRest!50242 mapKey!50242 mapValue!50242))))

(declare-fun b!1260773 () Bool)

(assert (=> b!1260773 (= e!717483 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48423)

(declare-datatypes ((tuple2!21050 0))(
  ( (tuple2!21051 (_1!10536 (_ BitVec 64)) (_2!10536 V!48423)) )
))
(declare-datatypes ((List!28250 0))(
  ( (Nil!28247) (Cons!28246 (h!29455 tuple2!21050) (t!41740 List!28250)) )
))
(declare-datatypes ((ListLongMap!18923 0))(
  ( (ListLongMap!18924 (toList!9477 List!28250)) )
))
(declare-fun lt!571282 () ListLongMap!18923)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48423)

(declare-fun getCurrentListMapNoExtraKeys!5846 (array!82131 array!82129 (_ BitVec 32) (_ BitVec 32) V!48423 V!48423 (_ BitVec 32) Int) ListLongMap!18923)

(assert (=> b!1260773 (= lt!571282 (getCurrentListMapNoExtraKeys!5846 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!571281 () ListLongMap!18923)

(declare-fun minValueBefore!43 () V!48423)

(assert (=> b!1260773 (= lt!571281 (getCurrentListMapNoExtraKeys!5846 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260774 () Bool)

(declare-fun res!840200 () Bool)

(assert (=> b!1260774 (=> (not res!840200) (not e!717483))))

(declare-datatypes ((List!28251 0))(
  ( (Nil!28248) (Cons!28247 (h!29456 (_ BitVec 64)) (t!41741 List!28251)) )
))
(declare-fun arrayNoDuplicates!0 (array!82131 (_ BitVec 32) List!28251) Bool)

(assert (=> b!1260774 (= res!840200 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28248))))

(declare-fun b!1260775 () Bool)

(declare-fun res!840201 () Bool)

(assert (=> b!1260775 (=> (not res!840201) (not e!717483))))

(assert (=> b!1260775 (= res!840201 (and (= (size!40156 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40157 _keys!1118) (size!40156 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50242 () Bool)

(assert (=> mapIsEmpty!50242 mapRes!50242))

(declare-fun b!1260776 () Bool)

(declare-fun res!840199 () Bool)

(assert (=> b!1260776 (=> (not res!840199) (not e!717483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82131 (_ BitVec 32)) Bool)

(assert (=> b!1260776 (= res!840199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260777 () Bool)

(assert (=> b!1260777 (= e!717485 tp_is_empty!32293)))

(assert (= (and start!105846 res!840198) b!1260775))

(assert (= (and b!1260775 res!840201) b!1260776))

(assert (= (and b!1260776 res!840199) b!1260774))

(assert (= (and b!1260774 res!840200) b!1260773))

(assert (= (and b!1260771 condMapEmpty!50242) mapIsEmpty!50242))

(assert (= (and b!1260771 (not condMapEmpty!50242)) mapNonEmpty!50242))

(get-info :version)

(assert (= (and mapNonEmpty!50242 ((_ is ValueCellFull!15383) mapValue!50242)) b!1260772))

(assert (= (and b!1260771 ((_ is ValueCellFull!15383) mapDefault!50242)) b!1260777))

(assert (= start!105846 b!1260771))

(declare-fun m!1161097 () Bool)

(assert (=> mapNonEmpty!50242 m!1161097))

(declare-fun m!1161099 () Bool)

(assert (=> start!105846 m!1161099))

(declare-fun m!1161101 () Bool)

(assert (=> start!105846 m!1161101))

(declare-fun m!1161103 () Bool)

(assert (=> start!105846 m!1161103))

(declare-fun m!1161105 () Bool)

(assert (=> b!1260774 m!1161105))

(declare-fun m!1161107 () Bool)

(assert (=> b!1260773 m!1161107))

(declare-fun m!1161109 () Bool)

(assert (=> b!1260773 m!1161109))

(declare-fun m!1161111 () Bool)

(assert (=> b!1260776 m!1161111))

(check-sat (not b!1260774) (not b!1260776) (not mapNonEmpty!50242) tp_is_empty!32293 (not start!105846) (not b!1260773) b_and!45281 (not b_next!27391))
(check-sat b_and!45281 (not b_next!27391))
