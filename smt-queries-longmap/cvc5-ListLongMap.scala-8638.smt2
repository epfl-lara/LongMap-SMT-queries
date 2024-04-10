; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105130 () Bool)

(assert start!105130)

(declare-fun b_free!26863 () Bool)

(declare-fun b_next!26863 () Bool)

(assert (=> start!105130 (= b_free!26863 (not b_next!26863))))

(declare-fun tp!94091 () Bool)

(declare-fun b_and!44667 () Bool)

(assert (=> start!105130 (= tp!94091 b_and!44667)))

(declare-fun res!835475 () Bool)

(declare-fun e!711628 () Bool)

(assert (=> start!105130 (=> (not res!835475) (not e!711628))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105130 (= res!835475 (validMask!0 mask!1466))))

(assert (=> start!105130 e!711628))

(assert (=> start!105130 true))

(assert (=> start!105130 tp!94091))

(declare-fun tp_is_empty!31765 () Bool)

(assert (=> start!105130 tp_is_empty!31765))

(declare-datatypes ((array!81192 0))(
  ( (array!81193 (arr!39159 (Array (_ BitVec 32) (_ BitVec 64))) (size!39695 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81192)

(declare-fun array_inv!29863 (array!81192) Bool)

(assert (=> start!105130 (array_inv!29863 _keys!1118)))

(declare-datatypes ((V!47719 0))(
  ( (V!47720 (val!15945 Int)) )
))
(declare-datatypes ((ValueCell!15119 0))(
  ( (ValueCellFull!15119 (v!18643 V!47719)) (EmptyCell!15119) )
))
(declare-datatypes ((array!81194 0))(
  ( (array!81195 (arr!39160 (Array (_ BitVec 32) ValueCell!15119)) (size!39696 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81194)

(declare-fun e!711630 () Bool)

(declare-fun array_inv!29864 (array!81194) Bool)

(assert (=> start!105130 (and (array_inv!29864 _values!914) e!711630)))

(declare-fun b!1252824 () Bool)

(declare-fun res!835476 () Bool)

(assert (=> b!1252824 (=> (not res!835476) (not e!711628))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252824 (= res!835476 (and (= (size!39696 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39695 _keys!1118) (size!39696 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49420 () Bool)

(declare-fun mapRes!49420 () Bool)

(assert (=> mapIsEmpty!49420 mapRes!49420))

(declare-fun b!1252825 () Bool)

(declare-fun res!835477 () Bool)

(assert (=> b!1252825 (=> (not res!835477) (not e!711628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81192 (_ BitVec 32)) Bool)

(assert (=> b!1252825 (= res!835477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252826 () Bool)

(declare-fun res!835474 () Bool)

(assert (=> b!1252826 (=> (not res!835474) (not e!711628))))

(declare-datatypes ((List!27804 0))(
  ( (Nil!27801) (Cons!27800 (h!29009 (_ BitVec 64)) (t!41283 List!27804)) )
))
(declare-fun arrayNoDuplicates!0 (array!81192 (_ BitVec 32) List!27804) Bool)

(assert (=> b!1252826 (= res!835474 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27801))))

(declare-fun mapNonEmpty!49420 () Bool)

(declare-fun tp!94090 () Bool)

(declare-fun e!711632 () Bool)

(assert (=> mapNonEmpty!49420 (= mapRes!49420 (and tp!94090 e!711632))))

(declare-fun mapRest!49420 () (Array (_ BitVec 32) ValueCell!15119))

(declare-fun mapKey!49420 () (_ BitVec 32))

(declare-fun mapValue!49420 () ValueCell!15119)

(assert (=> mapNonEmpty!49420 (= (arr!39160 _values!914) (store mapRest!49420 mapKey!49420 mapValue!49420))))

(declare-fun b!1252827 () Bool)

(declare-fun e!711627 () Bool)

(assert (=> b!1252827 (= e!711627 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47719)

(declare-fun minValueBefore!43 () V!47719)

(declare-datatypes ((tuple2!20572 0))(
  ( (tuple2!20573 (_1!10297 (_ BitVec 64)) (_2!10297 V!47719)) )
))
(declare-datatypes ((List!27805 0))(
  ( (Nil!27802) (Cons!27801 (h!29010 tuple2!20572) (t!41284 List!27805)) )
))
(declare-datatypes ((ListLongMap!18445 0))(
  ( (ListLongMap!18446 (toList!9238 List!27805)) )
))
(declare-fun lt!565526 () ListLongMap!18445)

(declare-fun getCurrentListMap!4485 (array!81192 array!81194 (_ BitVec 32) (_ BitVec 32) V!47719 V!47719 (_ BitVec 32) Int) ListLongMap!18445)

(assert (=> b!1252827 (= lt!565526 (getCurrentListMap!4485 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252828 () Bool)

(assert (=> b!1252828 (= e!711632 tp_is_empty!31765)))

(declare-fun b!1252829 () Bool)

(declare-fun e!711631 () Bool)

(assert (=> b!1252829 (= e!711631 tp_is_empty!31765)))

(declare-fun b!1252830 () Bool)

(assert (=> b!1252830 (= e!711630 (and e!711631 mapRes!49420))))

(declare-fun condMapEmpty!49420 () Bool)

(declare-fun mapDefault!49420 () ValueCell!15119)

