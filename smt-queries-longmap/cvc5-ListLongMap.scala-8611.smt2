; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104910 () Bool)

(assert start!104910)

(declare-fun b_free!26701 () Bool)

(declare-fun b_next!26701 () Bool)

(assert (=> start!104910 (= b_free!26701 (not b_next!26701))))

(declare-fun tp!93596 () Bool)

(declare-fun b_and!44477 () Bool)

(assert (=> start!104910 (= tp!93596 b_and!44477)))

(declare-fun b!1250456 () Bool)

(declare-fun e!709889 () Bool)

(declare-fun tp_is_empty!31603 () Bool)

(assert (=> b!1250456 (= e!709889 tp_is_empty!31603)))

(declare-fun b!1250457 () Bool)

(declare-fun e!709895 () Bool)

(declare-fun e!709892 () Bool)

(assert (=> b!1250457 (= e!709895 (not e!709892))))

(declare-fun res!834081 () Bool)

(assert (=> b!1250457 (=> res!834081 e!709892)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250457 (= res!834081 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47503 0))(
  ( (V!47504 (val!15864 Int)) )
))
(declare-datatypes ((tuple2!20440 0))(
  ( (tuple2!20441 (_1!10231 (_ BitVec 64)) (_2!10231 V!47503)) )
))
(declare-datatypes ((List!27681 0))(
  ( (Nil!27678) (Cons!27677 (h!28886 tuple2!20440) (t!41154 List!27681)) )
))
(declare-datatypes ((ListLongMap!18313 0))(
  ( (ListLongMap!18314 (toList!9172 List!27681)) )
))
(declare-fun lt!564240 () ListLongMap!18313)

(declare-fun lt!564241 () ListLongMap!18313)

(assert (=> b!1250457 (= lt!564240 lt!564241)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47503)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47503)

(declare-datatypes ((ValueCell!15038 0))(
  ( (ValueCellFull!15038 (v!18560 V!47503)) (EmptyCell!15038) )
))
(declare-datatypes ((array!80874 0))(
  ( (array!80875 (arr!39003 (Array (_ BitVec 32) ValueCell!15038)) (size!39539 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80874)

(declare-fun minValueBefore!43 () V!47503)

(declare-datatypes ((array!80876 0))(
  ( (array!80877 (arr!39004 (Array (_ BitVec 32) (_ BitVec 64))) (size!39540 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80876)

(declare-datatypes ((Unit!41535 0))(
  ( (Unit!41536) )
))
(declare-fun lt!564238 () Unit!41535)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!939 (array!80876 array!80874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47503 V!47503 V!47503 V!47503 (_ BitVec 32) Int) Unit!41535)

(assert (=> b!1250457 (= lt!564238 (lemmaNoChangeToArrayThenSameMapNoExtras!939 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5575 (array!80876 array!80874 (_ BitVec 32) (_ BitVec 32) V!47503 V!47503 (_ BitVec 32) Int) ListLongMap!18313)

(assert (=> b!1250457 (= lt!564241 (getCurrentListMapNoExtraKeys!5575 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250457 (= lt!564240 (getCurrentListMapNoExtraKeys!5575 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49168 () Bool)

(declare-fun mapRes!49168 () Bool)

(declare-fun tp!93595 () Bool)

(assert (=> mapNonEmpty!49168 (= mapRes!49168 (and tp!93595 e!709889))))

(declare-fun mapRest!49168 () (Array (_ BitVec 32) ValueCell!15038))

(declare-fun mapKey!49168 () (_ BitVec 32))

(declare-fun mapValue!49168 () ValueCell!15038)

(assert (=> mapNonEmpty!49168 (= (arr!39003 _values!914) (store mapRest!49168 mapKey!49168 mapValue!49168))))

(declare-fun b!1250458 () Bool)

(declare-fun e!709891 () Bool)

(declare-fun e!709894 () Bool)

(assert (=> b!1250458 (= e!709891 (and e!709894 mapRes!49168))))

(declare-fun condMapEmpty!49168 () Bool)

(declare-fun mapDefault!49168 () ValueCell!15038)

