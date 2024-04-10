; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105820 () Bool)

(assert start!105820)

(declare-fun b_free!27383 () Bool)

(declare-fun b_next!27383 () Bool)

(assert (=> start!105820 (= b_free!27383 (not b_next!27383))))

(declare-fun tp!95677 () Bool)

(declare-fun b_and!45279 () Bool)

(assert (=> start!105820 (= tp!95677 b_and!45279)))

(declare-fun b!1260587 () Bool)

(declare-fun res!840115 () Bool)

(declare-fun e!717353 () Bool)

(assert (=> b!1260587 (=> (not res!840115) (not e!717353))))

(declare-datatypes ((array!82188 0))(
  ( (array!82189 (arr!39648 (Array (_ BitVec 32) (_ BitVec 64))) (size!40184 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82188)

(declare-datatypes ((List!28166 0))(
  ( (Nil!28163) (Cons!28162 (h!29371 (_ BitVec 64)) (t!41663 List!28166)) )
))
(declare-fun arrayNoDuplicates!0 (array!82188 (_ BitVec 32) List!28166) Bool)

(assert (=> b!1260587 (= res!840115 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28163))))

(declare-fun mapNonEmpty!50227 () Bool)

(declare-fun mapRes!50227 () Bool)

(declare-fun tp!95678 () Bool)

(declare-fun e!717357 () Bool)

(assert (=> mapNonEmpty!50227 (= mapRes!50227 (and tp!95678 e!717357))))

(declare-datatypes ((V!48411 0))(
  ( (V!48412 (val!16205 Int)) )
))
(declare-datatypes ((ValueCell!15379 0))(
  ( (ValueCellFull!15379 (v!18908 V!48411)) (EmptyCell!15379) )
))
(declare-fun mapValue!50227 () ValueCell!15379)

(declare-datatypes ((array!82190 0))(
  ( (array!82191 (arr!39649 (Array (_ BitVec 32) ValueCell!15379)) (size!40185 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82190)

(declare-fun mapKey!50227 () (_ BitVec 32))

(declare-fun mapRest!50227 () (Array (_ BitVec 32) ValueCell!15379))

(assert (=> mapNonEmpty!50227 (= (arr!39649 _values!914) (store mapRest!50227 mapKey!50227 mapValue!50227))))

(declare-fun res!840113 () Bool)

(assert (=> start!105820 (=> (not res!840113) (not e!717353))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105820 (= res!840113 (validMask!0 mask!1466))))

(assert (=> start!105820 e!717353))

(assert (=> start!105820 true))

(assert (=> start!105820 tp!95677))

(declare-fun tp_is_empty!32285 () Bool)

(assert (=> start!105820 tp_is_empty!32285))

(declare-fun array_inv!30183 (array!82188) Bool)

(assert (=> start!105820 (array_inv!30183 _keys!1118)))

(declare-fun e!717352 () Bool)

(declare-fun array_inv!30184 (array!82190) Bool)

(assert (=> start!105820 (and (array_inv!30184 _values!914) e!717352)))

(declare-datatypes ((tuple2!20968 0))(
  ( (tuple2!20969 (_1!10495 (_ BitVec 64)) (_2!10495 V!48411)) )
))
(declare-fun lt!571273 () tuple2!20968)

(declare-datatypes ((List!28167 0))(
  ( (Nil!28164) (Cons!28163 (h!29372 tuple2!20968) (t!41664 List!28167)) )
))
(declare-datatypes ((ListLongMap!18841 0))(
  ( (ListLongMap!18842 (toList!9436 List!28167)) )
))
(declare-fun lt!571268 () ListLongMap!18841)

(declare-fun b!1260588 () Bool)

(declare-fun lt!571272 () ListLongMap!18841)

(declare-fun e!717356 () Bool)

(declare-fun +!4239 (ListLongMap!18841 tuple2!20968) ListLongMap!18841)

(assert (=> b!1260588 (= e!717356 (= lt!571268 (+!4239 lt!571272 lt!571273)))))

(declare-fun b!1260589 () Bool)

(assert (=> b!1260589 (= e!717357 tp_is_empty!32285)))

(declare-fun b!1260590 () Bool)

(declare-fun res!840111 () Bool)

(assert (=> b!1260590 (=> (not res!840111) (not e!717353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82188 (_ BitVec 32)) Bool)

(assert (=> b!1260590 (= res!840111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260591 () Bool)

(declare-fun e!717355 () Bool)

(assert (=> b!1260591 (= e!717355 (bvsle #b00000000000000000000000000000000 (size!40184 _keys!1118)))))

(declare-fun b!1260592 () Bool)

(declare-fun e!717358 () Bool)

(assert (=> b!1260592 (= e!717358 e!717355)))

(declare-fun res!840110 () Bool)

(assert (=> b!1260592 (=> res!840110 e!717355)))

(declare-fun lt!571269 () ListLongMap!18841)

(declare-fun -!2139 (ListLongMap!18841 (_ BitVec 64)) ListLongMap!18841)

(assert (=> b!1260592 (= res!840110 (not (= (-!2139 lt!571269 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571268)))))

(declare-fun lt!571267 () ListLongMap!18841)

(declare-fun lt!571271 () ListLongMap!18841)

(assert (=> b!1260592 (= (-!2139 lt!571267 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571271)))

(declare-datatypes ((Unit!42053 0))(
  ( (Unit!42054) )
))
(declare-fun lt!571266 () Unit!42053)

(declare-fun minValueBefore!43 () V!48411)

(declare-fun addThenRemoveForNewKeyIsSame!376 (ListLongMap!18841 (_ BitVec 64) V!48411) Unit!42053)

(assert (=> b!1260592 (= lt!571266 (addThenRemoveForNewKeyIsSame!376 lt!571271 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1260592 e!717356))

(declare-fun res!840116 () Bool)

(assert (=> b!1260592 (=> (not res!840116) (not e!717356))))

(assert (=> b!1260592 (= res!840116 (= lt!571269 lt!571267))))

(assert (=> b!1260592 (= lt!571267 (+!4239 lt!571271 (tuple2!20969 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571270 () ListLongMap!18841)

(assert (=> b!1260592 (= lt!571271 (+!4239 lt!571270 lt!571273))))

(declare-fun zeroValue!871 () V!48411)

(assert (=> b!1260592 (= lt!571273 (tuple2!20969 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48411)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4630 (array!82188 array!82190 (_ BitVec 32) (_ BitVec 32) V!48411 V!48411 (_ BitVec 32) Int) ListLongMap!18841)

(assert (=> b!1260592 (= lt!571268 (getCurrentListMap!4630 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260592 (= lt!571269 (getCurrentListMap!4630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260593 () Bool)

(declare-fun res!840112 () Bool)

(assert (=> b!1260593 (=> (not res!840112) (not e!717353))))

(assert (=> b!1260593 (= res!840112 (and (= (size!40185 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40184 _keys!1118) (size!40185 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260594 () Bool)

(declare-fun e!717354 () Bool)

(assert (=> b!1260594 (= e!717352 (and e!717354 mapRes!50227))))

(declare-fun condMapEmpty!50227 () Bool)

(declare-fun mapDefault!50227 () ValueCell!15379)

