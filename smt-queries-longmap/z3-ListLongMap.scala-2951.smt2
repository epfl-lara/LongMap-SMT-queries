; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41928 () Bool)

(assert start!41928)

(declare-fun b_free!11517 () Bool)

(declare-fun b_next!11517 () Bool)

(assert (=> start!41928 (= b_free!11517 (not b_next!11517))))

(declare-fun tp!40563 () Bool)

(declare-fun b_and!19905 () Bool)

(assert (=> start!41928 (= tp!40563 b_and!19905)))

(declare-fun b!468110 () Bool)

(declare-fun e!273925 () Bool)

(declare-fun tp_is_empty!12945 () Bool)

(assert (=> b!468110 (= e!273925 tp_is_empty!12945)))

(declare-fun res!279764 () Bool)

(declare-fun e!273923 () Bool)

(assert (=> start!41928 (=> (not res!279764) (not e!273923))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41928 (= res!279764 (validMask!0 mask!1365))))

(assert (=> start!41928 e!273923))

(assert (=> start!41928 tp_is_empty!12945))

(assert (=> start!41928 tp!40563))

(assert (=> start!41928 true))

(declare-datatypes ((array!29667 0))(
  ( (array!29668 (arr!14260 (Array (_ BitVec 32) (_ BitVec 64))) (size!14612 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29667)

(declare-fun array_inv!10296 (array!29667) Bool)

(assert (=> start!41928 (array_inv!10296 _keys!1025)))

(declare-datatypes ((V!18365 0))(
  ( (V!18366 (val!6517 Int)) )
))
(declare-datatypes ((ValueCell!6129 0))(
  ( (ValueCellFull!6129 (v!8806 V!18365)) (EmptyCell!6129) )
))
(declare-datatypes ((array!29669 0))(
  ( (array!29670 (arr!14261 (Array (_ BitVec 32) ValueCell!6129)) (size!14613 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29669)

(declare-fun e!273922 () Bool)

(declare-fun array_inv!10297 (array!29669) Bool)

(assert (=> start!41928 (and (array_inv!10297 _values!833) e!273922)))

(declare-fun b!468111 () Bool)

(declare-fun e!273920 () Bool)

(assert (=> b!468111 (= e!273920 tp_is_empty!12945)))

(declare-fun mapIsEmpty!21109 () Bool)

(declare-fun mapRes!21109 () Bool)

(assert (=> mapIsEmpty!21109 mapRes!21109))

(declare-fun b!468112 () Bool)

(declare-fun e!273921 () Bool)

(assert (=> b!468112 (= e!273923 (not e!273921))))

(declare-fun res!279765 () Bool)

(assert (=> b!468112 (=> res!279765 e!273921)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468112 (= res!279765 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8560 0))(
  ( (tuple2!8561 (_1!4291 (_ BitVec 64)) (_2!4291 V!18365)) )
))
(declare-datatypes ((List!8649 0))(
  ( (Nil!8646) (Cons!8645 (h!9501 tuple2!8560) (t!14605 List!8649)) )
))
(declare-datatypes ((ListLongMap!7473 0))(
  ( (ListLongMap!7474 (toList!3752 List!8649)) )
))
(declare-fun lt!211669 () ListLongMap!7473)

(declare-fun lt!211670 () ListLongMap!7473)

(assert (=> b!468112 (= lt!211669 lt!211670)))

(declare-fun minValueBefore!38 () V!18365)

(declare-fun zeroValue!794 () V!18365)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13662 0))(
  ( (Unit!13663) )
))
(declare-fun lt!211671 () Unit!13662)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18365)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!105 (array!29667 array!29669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18365 V!18365 V!18365 V!18365 (_ BitVec 32) Int) Unit!13662)

(assert (=> b!468112 (= lt!211671 (lemmaNoChangeToArrayThenSameMapNoExtras!105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1925 (array!29667 array!29669 (_ BitVec 32) (_ BitVec 32) V!18365 V!18365 (_ BitVec 32) Int) ListLongMap!7473)

(assert (=> b!468112 (= lt!211670 (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468112 (= lt!211669 (getCurrentListMapNoExtraKeys!1925 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468113 () Bool)

(assert (=> b!468113 (= e!273921 true)))

(declare-fun lt!211668 () ListLongMap!7473)

(declare-fun getCurrentListMap!2181 (array!29667 array!29669 (_ BitVec 32) (_ BitVec 32) V!18365 V!18365 (_ BitVec 32) Int) ListLongMap!7473)

(assert (=> b!468113 (= lt!211668 (getCurrentListMap!2181 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21109 () Bool)

(declare-fun tp!40564 () Bool)

(assert (=> mapNonEmpty!21109 (= mapRes!21109 (and tp!40564 e!273925))))

(declare-fun mapValue!21109 () ValueCell!6129)

(declare-fun mapRest!21109 () (Array (_ BitVec 32) ValueCell!6129))

(declare-fun mapKey!21109 () (_ BitVec 32))

(assert (=> mapNonEmpty!21109 (= (arr!14261 _values!833) (store mapRest!21109 mapKey!21109 mapValue!21109))))

(declare-fun b!468114 () Bool)

(declare-fun res!279766 () Bool)

(assert (=> b!468114 (=> (not res!279766) (not e!273923))))

(declare-datatypes ((List!8650 0))(
  ( (Nil!8647) (Cons!8646 (h!9502 (_ BitVec 64)) (t!14606 List!8650)) )
))
(declare-fun arrayNoDuplicates!0 (array!29667 (_ BitVec 32) List!8650) Bool)

(assert (=> b!468114 (= res!279766 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8647))))

(declare-fun b!468115 () Bool)

(declare-fun res!279763 () Bool)

(assert (=> b!468115 (=> (not res!279763) (not e!273923))))

(assert (=> b!468115 (= res!279763 (and (= (size!14613 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14612 _keys!1025) (size!14613 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468116 () Bool)

(declare-fun res!279762 () Bool)

(assert (=> b!468116 (=> (not res!279762) (not e!273923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29667 (_ BitVec 32)) Bool)

(assert (=> b!468116 (= res!279762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468117 () Bool)

(assert (=> b!468117 (= e!273922 (and e!273920 mapRes!21109))))

(declare-fun condMapEmpty!21109 () Bool)

(declare-fun mapDefault!21109 () ValueCell!6129)

(assert (=> b!468117 (= condMapEmpty!21109 (= (arr!14261 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6129)) mapDefault!21109)))))

(assert (= (and start!41928 res!279764) b!468115))

(assert (= (and b!468115 res!279763) b!468116))

(assert (= (and b!468116 res!279762) b!468114))

(assert (= (and b!468114 res!279766) b!468112))

(assert (= (and b!468112 (not res!279765)) b!468113))

(assert (= (and b!468117 condMapEmpty!21109) mapIsEmpty!21109))

(assert (= (and b!468117 (not condMapEmpty!21109)) mapNonEmpty!21109))

(get-info :version)

(assert (= (and mapNonEmpty!21109 ((_ is ValueCellFull!6129) mapValue!21109)) b!468110))

(assert (= (and b!468117 ((_ is ValueCellFull!6129) mapDefault!21109)) b!468111))

(assert (= start!41928 b!468117))

(declare-fun m!450149 () Bool)

(assert (=> mapNonEmpty!21109 m!450149))

(declare-fun m!450151 () Bool)

(assert (=> b!468114 m!450151))

(declare-fun m!450153 () Bool)

(assert (=> start!41928 m!450153))

(declare-fun m!450155 () Bool)

(assert (=> start!41928 m!450155))

(declare-fun m!450157 () Bool)

(assert (=> start!41928 m!450157))

(declare-fun m!450159 () Bool)

(assert (=> b!468116 m!450159))

(declare-fun m!450161 () Bool)

(assert (=> b!468113 m!450161))

(declare-fun m!450163 () Bool)

(assert (=> b!468112 m!450163))

(declare-fun m!450165 () Bool)

(assert (=> b!468112 m!450165))

(declare-fun m!450167 () Bool)

(assert (=> b!468112 m!450167))

(check-sat tp_is_empty!12945 (not b!468116) (not b!468112) (not b_next!11517) (not b!468114) (not mapNonEmpty!21109) b_and!19905 (not start!41928) (not b!468113))
(check-sat b_and!19905 (not b_next!11517))
