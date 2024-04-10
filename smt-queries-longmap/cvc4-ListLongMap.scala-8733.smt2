; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105896 () Bool)

(assert start!105896)

(declare-fun b_free!27437 () Bool)

(declare-fun b_next!27437 () Bool)

(assert (=> start!105896 (= b_free!27437 (not b_next!27437))))

(declare-fun tp!95842 () Bool)

(declare-fun b_and!45345 () Bool)

(assert (=> start!105896 (= tp!95842 b_and!45345)))

(declare-fun mapNonEmpty!50311 () Bool)

(declare-fun mapRes!50311 () Bool)

(declare-fun tp!95843 () Bool)

(declare-fun e!717872 () Bool)

(assert (=> mapNonEmpty!50311 (= mapRes!50311 (and tp!95843 e!717872))))

(declare-datatypes ((V!48483 0))(
  ( (V!48484 (val!16232 Int)) )
))
(declare-datatypes ((ValueCell!15406 0))(
  ( (ValueCellFull!15406 (v!18936 V!48483)) (EmptyCell!15406) )
))
(declare-fun mapValue!50311 () ValueCell!15406)

(declare-fun mapRest!50311 () (Array (_ BitVec 32) ValueCell!15406))

(declare-datatypes ((array!82292 0))(
  ( (array!82293 (arr!39699 (Array (_ BitVec 32) ValueCell!15406)) (size!40235 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82292)

(declare-fun mapKey!50311 () (_ BitVec 32))

(assert (=> mapNonEmpty!50311 (= (arr!39699 _values!914) (store mapRest!50311 mapKey!50311 mapValue!50311))))

(declare-fun mapIsEmpty!50311 () Bool)

(assert (=> mapIsEmpty!50311 mapRes!50311))

(declare-fun res!840515 () Bool)

(declare-fun e!717873 () Bool)

(assert (=> start!105896 (=> (not res!840515) (not e!717873))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105896 (= res!840515 (validMask!0 mask!1466))))

(assert (=> start!105896 e!717873))

(assert (=> start!105896 true))

(assert (=> start!105896 tp!95842))

(declare-fun tp_is_empty!32339 () Bool)

(assert (=> start!105896 tp_is_empty!32339))

(declare-datatypes ((array!82294 0))(
  ( (array!82295 (arr!39700 (Array (_ BitVec 32) (_ BitVec 64))) (size!40236 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82294)

(declare-fun array_inv!30225 (array!82294) Bool)

(assert (=> start!105896 (array_inv!30225 _keys!1118)))

(declare-fun e!717874 () Bool)

(declare-fun array_inv!30226 (array!82292) Bool)

(assert (=> start!105896 (and (array_inv!30226 _values!914) e!717874)))

(declare-fun b!1261336 () Bool)

(assert (=> b!1261336 (= e!717873 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48483)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48483)

(declare-datatypes ((tuple2!21006 0))(
  ( (tuple2!21007 (_1!10514 (_ BitVec 64)) (_2!10514 V!48483)) )
))
(declare-datatypes ((List!28204 0))(
  ( (Nil!28201) (Cons!28200 (h!29409 tuple2!21006) (t!41703 List!28204)) )
))
(declare-datatypes ((ListLongMap!18879 0))(
  ( (ListLongMap!18880 (toList!9455 List!28204)) )
))
(declare-fun lt!571599 () ListLongMap!18879)

(declare-fun getCurrentListMapNoExtraKeys!5823 (array!82294 array!82292 (_ BitVec 32) (_ BitVec 32) V!48483 V!48483 (_ BitVec 32) Int) ListLongMap!18879)

(assert (=> b!1261336 (= lt!571599 (getCurrentListMapNoExtraKeys!5823 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571598 () ListLongMap!18879)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48483)

(assert (=> b!1261336 (= lt!571598 (getCurrentListMapNoExtraKeys!5823 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261337 () Bool)

(assert (=> b!1261337 (= e!717872 tp_is_empty!32339)))

(declare-fun b!1261338 () Bool)

(declare-fun e!717871 () Bool)

(assert (=> b!1261338 (= e!717871 tp_is_empty!32339)))

(declare-fun b!1261339 () Bool)

(declare-fun res!840514 () Bool)

(assert (=> b!1261339 (=> (not res!840514) (not e!717873))))

(assert (=> b!1261339 (= res!840514 (and (= (size!40235 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40236 _keys!1118) (size!40235 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261340 () Bool)

(declare-fun res!840517 () Bool)

(assert (=> b!1261340 (=> (not res!840517) (not e!717873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82294 (_ BitVec 32)) Bool)

(assert (=> b!1261340 (= res!840517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261341 () Bool)

(assert (=> b!1261341 (= e!717874 (and e!717871 mapRes!50311))))

(declare-fun condMapEmpty!50311 () Bool)

(declare-fun mapDefault!50311 () ValueCell!15406)

