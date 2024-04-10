; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105848 () Bool)

(assert start!105848)

(declare-fun b_free!27389 () Bool)

(declare-fun b_next!27389 () Bool)

(assert (=> start!105848 (= b_free!27389 (not b_next!27389))))

(declare-fun tp!95699 () Bool)

(declare-fun b_and!45297 () Bool)

(assert (=> start!105848 (= tp!95699 b_and!45297)))

(declare-fun res!840228 () Bool)

(declare-fun e!717513 () Bool)

(assert (=> start!105848 (=> (not res!840228) (not e!717513))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105848 (= res!840228 (validMask!0 mask!1466))))

(assert (=> start!105848 e!717513))

(assert (=> start!105848 true))

(assert (=> start!105848 tp!95699))

(declare-fun tp_is_empty!32291 () Bool)

(assert (=> start!105848 tp_is_empty!32291))

(declare-datatypes ((array!82200 0))(
  ( (array!82201 (arr!39653 (Array (_ BitVec 32) (_ BitVec 64))) (size!40189 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82200)

(declare-fun array_inv!30187 (array!82200) Bool)

(assert (=> start!105848 (array_inv!30187 _keys!1118)))

(declare-datatypes ((V!48419 0))(
  ( (V!48420 (val!16208 Int)) )
))
(declare-datatypes ((ValueCell!15382 0))(
  ( (ValueCellFull!15382 (v!18912 V!48419)) (EmptyCell!15382) )
))
(declare-datatypes ((array!82202 0))(
  ( (array!82203 (arr!39654 (Array (_ BitVec 32) ValueCell!15382)) (size!40190 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82202)

(declare-fun e!717515 () Bool)

(declare-fun array_inv!30188 (array!82202) Bool)

(assert (=> start!105848 (and (array_inv!30188 _values!914) e!717515)))

(declare-fun b!1260832 () Bool)

(declare-fun e!717511 () Bool)

(assert (=> b!1260832 (= e!717511 tp_is_empty!32291)))

(declare-fun b!1260833 () Bool)

(assert (=> b!1260833 (= e!717513 (not true))))

(declare-datatypes ((tuple2!20972 0))(
  ( (tuple2!20973 (_1!10497 (_ BitVec 64)) (_2!10497 V!48419)) )
))
(declare-datatypes ((List!28170 0))(
  ( (Nil!28167) (Cons!28166 (h!29375 tuple2!20972) (t!41669 List!28170)) )
))
(declare-datatypes ((ListLongMap!18845 0))(
  ( (ListLongMap!18846 (toList!9438 List!28170)) )
))
(declare-fun lt!571455 () ListLongMap!18845)

(declare-fun lt!571454 () ListLongMap!18845)

(assert (=> b!1260833 (= lt!571455 lt!571454)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48419)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48419)

(declare-fun minValueBefore!43 () V!48419)

(declare-datatypes ((Unit!42059 0))(
  ( (Unit!42060) )
))
(declare-fun lt!571453 () Unit!42059)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1170 (array!82200 array!82202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48419 V!48419 V!48419 V!48419 (_ BitVec 32) Int) Unit!42059)

(assert (=> b!1260833 (= lt!571453 (lemmaNoChangeToArrayThenSameMapNoExtras!1170 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5806 (array!82200 array!82202 (_ BitVec 32) (_ BitVec 32) V!48419 V!48419 (_ BitVec 32) Int) ListLongMap!18845)

(assert (=> b!1260833 (= lt!571454 (getCurrentListMapNoExtraKeys!5806 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260833 (= lt!571455 (getCurrentListMapNoExtraKeys!5806 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260834 () Bool)

(declare-fun res!840227 () Bool)

(assert (=> b!1260834 (=> (not res!840227) (not e!717513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82200 (_ BitVec 32)) Bool)

(assert (=> b!1260834 (= res!840227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260835 () Bool)

(declare-fun mapRes!50239 () Bool)

(assert (=> b!1260835 (= e!717515 (and e!717511 mapRes!50239))))

(declare-fun condMapEmpty!50239 () Bool)

(declare-fun mapDefault!50239 () ValueCell!15382)

