; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105280 () Bool)

(assert start!105280)

(declare-fun b_free!26803 () Bool)

(declare-fun b_next!26803 () Bool)

(assert (=> start!105280 (= b_free!26803 (not b_next!26803))))

(declare-fun tp!93907 () Bool)

(declare-fun b_and!44601 () Bool)

(assert (=> start!105280 (= tp!93907 b_and!44601)))

(declare-fun mapNonEmpty!49327 () Bool)

(declare-fun mapRes!49327 () Bool)

(declare-fun tp!93908 () Bool)

(declare-fun e!711914 () Bool)

(assert (=> mapNonEmpty!49327 (= mapRes!49327 (and tp!93908 e!711914))))

(declare-datatypes ((V!47639 0))(
  ( (V!47640 (val!15915 Int)) )
))
(declare-datatypes ((ValueCell!15089 0))(
  ( (ValueCellFull!15089 (v!18609 V!47639)) (EmptyCell!15089) )
))
(declare-fun mapRest!49327 () (Array (_ BitVec 32) ValueCell!15089))

(declare-fun mapValue!49327 () ValueCell!15089)

(declare-fun mapKey!49327 () (_ BitVec 32))

(declare-datatypes ((array!81119 0))(
  ( (array!81120 (arr!39119 (Array (_ BitVec 32) ValueCell!15089)) (size!39656 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81119)

(assert (=> mapNonEmpty!49327 (= (arr!39119 _values!914) (store mapRest!49327 mapKey!49327 mapValue!49327))))

(declare-fun b!1253358 () Bool)

(declare-fun res!835547 () Bool)

(declare-fun e!711915 () Bool)

(assert (=> b!1253358 (=> (not res!835547) (not e!711915))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81121 0))(
  ( (array!81122 (arr!39120 (Array (_ BitVec 32) (_ BitVec 64))) (size!39657 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81121)

(assert (=> b!1253358 (= res!835547 (and (= (size!39656 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39657 _keys!1118) (size!39656 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253359 () Bool)

(declare-fun res!835549 () Bool)

(assert (=> b!1253359 (=> (not res!835549) (not e!711915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81121 (_ BitVec 32)) Bool)

(assert (=> b!1253359 (= res!835549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253360 () Bool)

(assert (=> b!1253360 (= e!711915 (not true))))

(declare-datatypes ((tuple2!20550 0))(
  ( (tuple2!20551 (_1!10286 (_ BitVec 64)) (_2!10286 V!47639)) )
))
(declare-datatypes ((List!27794 0))(
  ( (Nil!27791) (Cons!27790 (h!29008 tuple2!20550) (t!41263 List!27794)) )
))
(declare-datatypes ((ListLongMap!18431 0))(
  ( (ListLongMap!18432 (toList!9231 List!27794)) )
))
(declare-fun lt!565643 () ListLongMap!18431)

(declare-fun lt!565641 () ListLongMap!18431)

(assert (=> b!1253360 (= lt!565643 lt!565641)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41600 0))(
  ( (Unit!41601) )
))
(declare-fun lt!565642 () Unit!41600)

(declare-fun minValueAfter!43 () V!47639)

(declare-fun zeroValue!871 () V!47639)

(declare-fun minValueBefore!43 () V!47639)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!972 (array!81121 array!81119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47639 V!47639 V!47639 V!47639 (_ BitVec 32) Int) Unit!41600)

(assert (=> b!1253360 (= lt!565642 (lemmaNoChangeToArrayThenSameMapNoExtras!972 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5658 (array!81121 array!81119 (_ BitVec 32) (_ BitVec 32) V!47639 V!47639 (_ BitVec 32) Int) ListLongMap!18431)

(assert (=> b!1253360 (= lt!565641 (getCurrentListMapNoExtraKeys!5658 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253360 (= lt!565643 (getCurrentListMapNoExtraKeys!5658 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835546 () Bool)

(assert (=> start!105280 (=> (not res!835546) (not e!711915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105280 (= res!835546 (validMask!0 mask!1466))))

(assert (=> start!105280 e!711915))

(assert (=> start!105280 true))

(assert (=> start!105280 tp!93907))

(declare-fun tp_is_empty!31705 () Bool)

(assert (=> start!105280 tp_is_empty!31705))

(declare-fun array_inv!29949 (array!81121) Bool)

(assert (=> start!105280 (array_inv!29949 _keys!1118)))

(declare-fun e!711913 () Bool)

(declare-fun array_inv!29950 (array!81119) Bool)

(assert (=> start!105280 (and (array_inv!29950 _values!914) e!711913)))

(declare-fun mapIsEmpty!49327 () Bool)

(assert (=> mapIsEmpty!49327 mapRes!49327))

(declare-fun b!1253361 () Bool)

(declare-fun e!711917 () Bool)

(assert (=> b!1253361 (= e!711913 (and e!711917 mapRes!49327))))

(declare-fun condMapEmpty!49327 () Bool)

(declare-fun mapDefault!49327 () ValueCell!15089)

(assert (=> b!1253361 (= condMapEmpty!49327 (= (arr!39119 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15089)) mapDefault!49327)))))

(declare-fun b!1253362 () Bool)

(declare-fun res!835548 () Bool)

(assert (=> b!1253362 (=> (not res!835548) (not e!711915))))

(declare-datatypes ((List!27795 0))(
  ( (Nil!27792) (Cons!27791 (h!29009 (_ BitVec 64)) (t!41264 List!27795)) )
))
(declare-fun arrayNoDuplicates!0 (array!81121 (_ BitVec 32) List!27795) Bool)

(assert (=> b!1253362 (= res!835548 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27792))))

(declare-fun b!1253363 () Bool)

(assert (=> b!1253363 (= e!711914 tp_is_empty!31705)))

(declare-fun b!1253364 () Bool)

(assert (=> b!1253364 (= e!711917 tp_is_empty!31705)))

(assert (= (and start!105280 res!835546) b!1253358))

(assert (= (and b!1253358 res!835547) b!1253359))

(assert (= (and b!1253359 res!835549) b!1253362))

(assert (= (and b!1253362 res!835548) b!1253360))

(assert (= (and b!1253361 condMapEmpty!49327) mapIsEmpty!49327))

(assert (= (and b!1253361 (not condMapEmpty!49327)) mapNonEmpty!49327))

(get-info :version)

(assert (= (and mapNonEmpty!49327 ((_ is ValueCellFull!15089) mapValue!49327)) b!1253363))

(assert (= (and b!1253361 ((_ is ValueCellFull!15089) mapDefault!49327)) b!1253364))

(assert (= start!105280 b!1253361))

(declare-fun m!1154355 () Bool)

(assert (=> start!105280 m!1154355))

(declare-fun m!1154357 () Bool)

(assert (=> start!105280 m!1154357))

(declare-fun m!1154359 () Bool)

(assert (=> start!105280 m!1154359))

(declare-fun m!1154361 () Bool)

(assert (=> b!1253360 m!1154361))

(declare-fun m!1154363 () Bool)

(assert (=> b!1253360 m!1154363))

(declare-fun m!1154365 () Bool)

(assert (=> b!1253360 m!1154365))

(declare-fun m!1154367 () Bool)

(assert (=> mapNonEmpty!49327 m!1154367))

(declare-fun m!1154369 () Bool)

(assert (=> b!1253362 m!1154369))

(declare-fun m!1154371 () Bool)

(assert (=> b!1253359 m!1154371))

(check-sat b_and!44601 tp_is_empty!31705 (not b!1253362) (not b_next!26803) (not start!105280) (not b!1253360) (not mapNonEmpty!49327) (not b!1253359))
(check-sat b_and!44601 (not b_next!26803))
