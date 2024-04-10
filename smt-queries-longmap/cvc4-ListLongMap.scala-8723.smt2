; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105814 () Bool)

(assert start!105814)

(declare-fun b_free!27377 () Bool)

(declare-fun b_next!27377 () Bool)

(assert (=> start!105814 (= b_free!27377 (not b_next!27377))))

(declare-fun tp!95660 () Bool)

(declare-fun b_and!45273 () Bool)

(assert (=> start!105814 (= tp!95660 b_and!45273)))

(declare-fun b!1260498 () Bool)

(declare-fun e!717282 () Bool)

(declare-fun e!717286 () Bool)

(assert (=> b!1260498 (= e!717282 (not e!717286))))

(declare-fun res!840051 () Bool)

(assert (=> b!1260498 (=> res!840051 e!717286)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260498 (= res!840051 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48403 0))(
  ( (V!48404 (val!16202 Int)) )
))
(declare-datatypes ((tuple2!20962 0))(
  ( (tuple2!20963 (_1!10492 (_ BitVec 64)) (_2!10492 V!48403)) )
))
(declare-datatypes ((List!28160 0))(
  ( (Nil!28157) (Cons!28156 (h!29365 tuple2!20962) (t!41657 List!28160)) )
))
(declare-datatypes ((ListLongMap!18835 0))(
  ( (ListLongMap!18836 (toList!9433 List!28160)) )
))
(declare-fun lt!571192 () ListLongMap!18835)

(declare-fun lt!571191 () ListLongMap!18835)

(assert (=> b!1260498 (= lt!571192 lt!571191)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!42049 0))(
  ( (Unit!42050) )
))
(declare-fun lt!571190 () Unit!42049)

(declare-fun minValueAfter!43 () V!48403)

(declare-fun zeroValue!871 () V!48403)

(declare-datatypes ((array!82176 0))(
  ( (array!82177 (arr!39642 (Array (_ BitVec 32) (_ BitVec 64))) (size!40178 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82176)

(declare-datatypes ((ValueCell!15376 0))(
  ( (ValueCellFull!15376 (v!18905 V!48403)) (EmptyCell!15376) )
))
(declare-datatypes ((array!82178 0))(
  ( (array!82179 (arr!39643 (Array (_ BitVec 32) ValueCell!15376)) (size!40179 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82178)

(declare-fun minValueBefore!43 () V!48403)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1167 (array!82176 array!82178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48403 V!48403 V!48403 V!48403 (_ BitVec 32) Int) Unit!42049)

(assert (=> b!1260498 (= lt!571190 (lemmaNoChangeToArrayThenSameMapNoExtras!1167 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5803 (array!82176 array!82178 (_ BitVec 32) (_ BitVec 32) V!48403 V!48403 (_ BitVec 32) Int) ListLongMap!18835)

(assert (=> b!1260498 (= lt!571191 (getCurrentListMapNoExtraKeys!5803 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260498 (= lt!571192 (getCurrentListMapNoExtraKeys!5803 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50218 () Bool)

(declare-fun mapRes!50218 () Bool)

(declare-fun tp!95659 () Bool)

(declare-fun e!717280 () Bool)

(assert (=> mapNonEmpty!50218 (= mapRes!50218 (and tp!95659 e!717280))))

(declare-fun mapRest!50218 () (Array (_ BitVec 32) ValueCell!15376))

(declare-fun mapKey!50218 () (_ BitVec 32))

(declare-fun mapValue!50218 () ValueCell!15376)

(assert (=> mapNonEmpty!50218 (= (arr!39643 _values!914) (store mapRest!50218 mapKey!50218 mapValue!50218))))

(declare-fun b!1260499 () Bool)

(declare-fun e!717285 () Bool)

(declare-fun tp_is_empty!32279 () Bool)

(assert (=> b!1260499 (= e!717285 tp_is_empty!32279)))

(declare-fun b!1260500 () Bool)

(assert (=> b!1260500 (= e!717280 tp_is_empty!32279)))

(declare-fun res!840052 () Bool)

(assert (=> start!105814 (=> (not res!840052) (not e!717282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105814 (= res!840052 (validMask!0 mask!1466))))

(assert (=> start!105814 e!717282))

(assert (=> start!105814 true))

(assert (=> start!105814 tp!95660))

(assert (=> start!105814 tp_is_empty!32279))

(declare-fun array_inv!30179 (array!82176) Bool)

(assert (=> start!105814 (array_inv!30179 _keys!1118)))

(declare-fun e!717284 () Bool)

(declare-fun array_inv!30180 (array!82178) Bool)

(assert (=> start!105814 (and (array_inv!30180 _values!914) e!717284)))

(declare-fun b!1260501 () Bool)

(assert (=> b!1260501 (= e!717286 true)))

(declare-fun lt!571189 () ListLongMap!18835)

(declare-fun lt!571188 () ListLongMap!18835)

(declare-fun -!2137 (ListLongMap!18835 (_ BitVec 64)) ListLongMap!18835)

(assert (=> b!1260501 (= lt!571189 (-!2137 lt!571188 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571187 () ListLongMap!18835)

(declare-fun lt!571183 () ListLongMap!18835)

(assert (=> b!1260501 (= (-!2137 lt!571187 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571183)))

(declare-fun lt!571185 () Unit!42049)

(declare-fun addThenRemoveForNewKeyIsSame!374 (ListLongMap!18835 (_ BitVec 64) V!48403) Unit!42049)

(assert (=> b!1260501 (= lt!571185 (addThenRemoveForNewKeyIsSame!374 lt!571183 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717283 () Bool)

(assert (=> b!1260501 e!717283))

(declare-fun res!840048 () Bool)

(assert (=> b!1260501 (=> (not res!840048) (not e!717283))))

(assert (=> b!1260501 (= res!840048 (= lt!571188 lt!571187))))

(declare-fun +!4236 (ListLongMap!18835 tuple2!20962) ListLongMap!18835)

(assert (=> b!1260501 (= lt!571187 (+!4236 lt!571183 (tuple2!20963 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571186 () tuple2!20962)

(assert (=> b!1260501 (= lt!571183 (+!4236 lt!571192 lt!571186))))

(assert (=> b!1260501 (= lt!571186 (tuple2!20963 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!571184 () ListLongMap!18835)

(declare-fun getCurrentListMap!4628 (array!82176 array!82178 (_ BitVec 32) (_ BitVec 32) V!48403 V!48403 (_ BitVec 32) Int) ListLongMap!18835)

(assert (=> b!1260501 (= lt!571184 (getCurrentListMap!4628 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260501 (= lt!571188 (getCurrentListMap!4628 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50218 () Bool)

(assert (=> mapIsEmpty!50218 mapRes!50218))

(declare-fun b!1260502 () Bool)

(declare-fun res!840050 () Bool)

(assert (=> b!1260502 (=> (not res!840050) (not e!717282))))

(declare-datatypes ((List!28161 0))(
  ( (Nil!28158) (Cons!28157 (h!29366 (_ BitVec 64)) (t!41658 List!28161)) )
))
(declare-fun arrayNoDuplicates!0 (array!82176 (_ BitVec 32) List!28161) Bool)

(assert (=> b!1260502 (= res!840050 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28158))))

(declare-fun b!1260503 () Bool)

(declare-fun res!840049 () Bool)

(assert (=> b!1260503 (=> (not res!840049) (not e!717282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82176 (_ BitVec 32)) Bool)

(assert (=> b!1260503 (= res!840049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260504 () Bool)

(assert (=> b!1260504 (= e!717283 (= lt!571184 (+!4236 lt!571191 lt!571186)))))

(declare-fun b!1260505 () Bool)

(declare-fun res!840053 () Bool)

(assert (=> b!1260505 (=> (not res!840053) (not e!717282))))

(assert (=> b!1260505 (= res!840053 (and (= (size!40179 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40178 _keys!1118) (size!40179 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260506 () Bool)

(assert (=> b!1260506 (= e!717284 (and e!717285 mapRes!50218))))

(declare-fun condMapEmpty!50218 () Bool)

(declare-fun mapDefault!50218 () ValueCell!15376)

