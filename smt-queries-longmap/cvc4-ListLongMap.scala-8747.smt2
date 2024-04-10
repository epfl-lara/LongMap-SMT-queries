; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106146 () Bool)

(assert start!106146)

(declare-fun b_free!27521 () Bool)

(declare-fun b_next!27521 () Bool)

(assert (=> start!106146 (= b_free!27521 (not b_next!27521))))

(declare-fun tp!96122 () Bool)

(declare-fun b_and!45529 () Bool)

(assert (=> start!106146 (= tp!96122 b_and!45529)))

(declare-fun b!1263843 () Bool)

(declare-fun e!719594 () Bool)

(declare-fun e!719593 () Bool)

(assert (=> b!1263843 (= e!719594 e!719593)))

(declare-fun res!841771 () Bool)

(assert (=> b!1263843 (=> res!841771 e!719593)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263843 (= res!841771 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263844 () Bool)

(declare-fun e!719591 () Bool)

(declare-fun tp_is_empty!32423 () Bool)

(assert (=> b!1263844 (= e!719591 tp_is_empty!32423)))

(declare-fun b!1263845 () Bool)

(declare-fun res!841772 () Bool)

(declare-fun e!719590 () Bool)

(assert (=> b!1263845 (=> (not res!841772) (not e!719590))))

(declare-datatypes ((array!82472 0))(
  ( (array!82473 (arr!39780 (Array (_ BitVec 32) (_ BitVec 64))) (size!40316 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82472)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82472 (_ BitVec 32)) Bool)

(assert (=> b!1263845 (= res!841772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48595 0))(
  ( (V!48596 (val!16274 Int)) )
))
(declare-datatypes ((tuple2!21072 0))(
  ( (tuple2!21073 (_1!10547 (_ BitVec 64)) (_2!10547 V!48595)) )
))
(declare-datatypes ((List!28263 0))(
  ( (Nil!28260) (Cons!28259 (h!29468 tuple2!21072) (t!41780 List!28263)) )
))
(declare-datatypes ((ListLongMap!18945 0))(
  ( (ListLongMap!18946 (toList!9488 List!28263)) )
))
(declare-fun lt!573260 () ListLongMap!18945)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15448 0))(
  ( (ValueCellFull!15448 (v!18986 V!48595)) (EmptyCell!15448) )
))
(declare-datatypes ((array!82474 0))(
  ( (array!82475 (arr!39781 (Array (_ BitVec 32) ValueCell!15448)) (size!40317 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82474)

(declare-fun minValueAfter!43 () V!48595)

(declare-fun b!1263846 () Bool)

(declare-fun zeroValue!871 () V!48595)

(declare-fun e!719589 () Bool)

(declare-fun getCurrentListMap!4655 (array!82472 array!82474 (_ BitVec 32) (_ BitVec 32) V!48595 V!48595 (_ BitVec 32) Int) ListLongMap!18945)

(declare-fun +!4258 (ListLongMap!18945 tuple2!21072) ListLongMap!18945)

(assert (=> b!1263846 (= e!719589 (= (getCurrentListMap!4655 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4258 lt!573260 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun b!1263847 () Bool)

(declare-fun e!719592 () Bool)

(assert (=> b!1263847 (= e!719592 tp_is_empty!32423)))

(declare-fun b!1263848 () Bool)

(declare-fun minValueBefore!43 () V!48595)

(declare-fun lt!573261 () ListLongMap!18945)

(assert (=> b!1263848 (= e!719593 (= (getCurrentListMap!4655 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4258 (+!4258 lt!573261 (tuple2!21073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21073 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun mapIsEmpty!50464 () Bool)

(declare-fun mapRes!50464 () Bool)

(assert (=> mapIsEmpty!50464 mapRes!50464))

(declare-fun mapNonEmpty!50464 () Bool)

(declare-fun tp!96121 () Bool)

(assert (=> mapNonEmpty!50464 (= mapRes!50464 (and tp!96121 e!719592))))

(declare-fun mapValue!50464 () ValueCell!15448)

(declare-fun mapRest!50464 () (Array (_ BitVec 32) ValueCell!15448))

(declare-fun mapKey!50464 () (_ BitVec 32))

(assert (=> mapNonEmpty!50464 (= (arr!39781 _values!914) (store mapRest!50464 mapKey!50464 mapValue!50464))))

(declare-fun res!841768 () Bool)

(assert (=> start!106146 (=> (not res!841768) (not e!719590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106146 (= res!841768 (validMask!0 mask!1466))))

(assert (=> start!106146 e!719590))

(assert (=> start!106146 true))

(assert (=> start!106146 tp!96122))

(assert (=> start!106146 tp_is_empty!32423))

(declare-fun array_inv!30275 (array!82472) Bool)

(assert (=> start!106146 (array_inv!30275 _keys!1118)))

(declare-fun e!719595 () Bool)

(declare-fun array_inv!30276 (array!82474) Bool)

(assert (=> start!106146 (and (array_inv!30276 _values!914) e!719595)))

(declare-fun b!1263849 () Bool)

(assert (=> b!1263849 (= e!719595 (and e!719591 mapRes!50464))))

(declare-fun condMapEmpty!50464 () Bool)

(declare-fun mapDefault!50464 () ValueCell!15448)

