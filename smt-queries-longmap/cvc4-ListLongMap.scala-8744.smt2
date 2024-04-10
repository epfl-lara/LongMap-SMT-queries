; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106070 () Bool)

(assert start!106070)

(declare-fun b_free!27503 () Bool)

(declare-fun b_next!27503 () Bool)

(assert (=> start!106070 (= b_free!27503 (not b_next!27503))))

(declare-fun tp!96058 () Bool)

(declare-fun b_and!45477 () Bool)

(assert (=> start!106070 (= tp!96058 b_and!45477)))

(declare-fun b!1263091 () Bool)

(declare-fun res!841401 () Bool)

(declare-fun e!719080 () Bool)

(assert (=> b!1263091 (=> (not res!841401) (not e!719080))))

(declare-datatypes ((array!82430 0))(
  ( (array!82431 (arr!39762 (Array (_ BitVec 32) (_ BitVec 64))) (size!40298 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82430)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82430 (_ BitVec 32)) Bool)

(assert (=> b!1263091 (= res!841401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263092 () Bool)

(declare-fun res!841402 () Bool)

(assert (=> b!1263092 (=> (not res!841402) (not e!719080))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48571 0))(
  ( (V!48572 (val!16265 Int)) )
))
(declare-datatypes ((ValueCell!15439 0))(
  ( (ValueCellFull!15439 (v!18974 V!48571)) (EmptyCell!15439) )
))
(declare-datatypes ((array!82432 0))(
  ( (array!82433 (arr!39763 (Array (_ BitVec 32) ValueCell!15439)) (size!40299 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82432)

(assert (=> b!1263092 (= res!841402 (and (= (size!40299 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40298 _keys!1118) (size!40299 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263093 () Bool)

(declare-fun res!841403 () Bool)

(assert (=> b!1263093 (=> (not res!841403) (not e!719080))))

(declare-datatypes ((List!28247 0))(
  ( (Nil!28244) (Cons!28243 (h!29452 (_ BitVec 64)) (t!41758 List!28247)) )
))
(declare-fun arrayNoDuplicates!0 (array!82430 (_ BitVec 32) List!28247) Bool)

(assert (=> b!1263093 (= res!841403 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28244))))

(declare-fun b!1263094 () Bool)

(declare-fun e!719077 () Bool)

(declare-fun tp_is_empty!32405 () Bool)

(assert (=> b!1263094 (= e!719077 tp_is_empty!32405)))

(declare-fun mapNonEmpty!50428 () Bool)

(declare-fun mapRes!50428 () Bool)

(declare-fun tp!96059 () Bool)

(assert (=> mapNonEmpty!50428 (= mapRes!50428 (and tp!96059 e!719077))))

(declare-fun mapValue!50428 () ValueCell!15439)

(declare-fun mapRest!50428 () (Array (_ BitVec 32) ValueCell!15439))

(declare-fun mapKey!50428 () (_ BitVec 32))

(assert (=> mapNonEmpty!50428 (= (arr!39763 _values!914) (store mapRest!50428 mapKey!50428 mapValue!50428))))

(declare-fun defaultEntry!922 () Int)

(declare-fun e!719081 () Bool)

(declare-fun b!1263095 () Bool)

(declare-fun zeroValue!871 () V!48571)

(declare-fun minValueBefore!43 () V!48571)

(declare-datatypes ((tuple2!21056 0))(
  ( (tuple2!21057 (_1!10539 (_ BitVec 64)) (_2!10539 V!48571)) )
))
(declare-datatypes ((List!28248 0))(
  ( (Nil!28245) (Cons!28244 (h!29453 tuple2!21056) (t!41759 List!28248)) )
))
(declare-datatypes ((ListLongMap!18929 0))(
  ( (ListLongMap!18930 (toList!9480 List!28248)) )
))
(declare-fun contains!7600 (ListLongMap!18929 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4647 (array!82430 array!82432 (_ BitVec 32) (_ BitVec 32) V!48571 V!48571 (_ BitVec 32) Int) ListLongMap!18929)

(assert (=> b!1263095 (= e!719081 (not (contains!7600 (getCurrentListMap!4647 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50428 () Bool)

(assert (=> mapIsEmpty!50428 mapRes!50428))

(declare-fun b!1263090 () Bool)

(declare-fun e!719078 () Bool)

(declare-fun e!719079 () Bool)

(assert (=> b!1263090 (= e!719078 (and e!719079 mapRes!50428))))

(declare-fun condMapEmpty!50428 () Bool)

(declare-fun mapDefault!50428 () ValueCell!15439)

