; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107046 () Bool)

(assert start!107046)

(declare-fun b_free!27551 () Bool)

(declare-fun b_next!27551 () Bool)

(assert (=> start!107046 (= b_free!27551 (not b_next!27551))))

(declare-fun tp!96880 () Bool)

(declare-fun b_and!45583 () Bool)

(assert (=> start!107046 (= tp!96880 b_and!45583)))

(declare-fun b!1269147 () Bool)

(declare-fun res!844621 () Bool)

(declare-fun e!723345 () Bool)

(assert (=> b!1269147 (=> (not res!844621) (not e!723345))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82734 0))(
  ( (array!82735 (arr!39904 (Array (_ BitVec 32) (_ BitVec 64))) (size!40440 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82734)

(assert (=> b!1269147 (= res!844621 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40440 _keys!1364)) (bvslt from!1698 (size!40440 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50683 () Bool)

(declare-fun mapRes!50683 () Bool)

(assert (=> mapIsEmpty!50683 mapRes!50683))

(declare-fun b!1269148 () Bool)

(assert (=> b!1269148 (= e!723345 (not true))))

(declare-datatypes ((V!48839 0))(
  ( (V!48840 (val!16442 Int)) )
))
(declare-datatypes ((ValueCell!15514 0))(
  ( (ValueCellFull!15514 (v!19079 V!48839)) (EmptyCell!15514) )
))
(declare-datatypes ((array!82736 0))(
  ( (array!82737 (arr!39905 (Array (_ BitVec 32) ValueCell!15514)) (size!40441 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82736)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48839)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48839)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48839)

(declare-fun zeroValueBefore!52 () V!48839)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21298 0))(
  ( (tuple2!21299 (_1!10660 (_ BitVec 64)) (_2!10660 V!48839)) )
))
(declare-datatypes ((List!28411 0))(
  ( (Nil!28408) (Cons!28407 (h!29616 tuple2!21298) (t!41940 List!28411)) )
))
(declare-datatypes ((ListLongMap!19027 0))(
  ( (ListLongMap!19028 (toList!9529 List!28411)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5861 (array!82734 array!82736 (_ BitVec 32) (_ BitVec 32) V!48839 V!48839 (_ BitVec 32) Int) ListLongMap!19027)

(assert (=> b!1269148 (= (getCurrentListMapNoExtraKeys!5861 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5861 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42244 0))(
  ( (Unit!42245) )
))
(declare-fun lt!574539 () Unit!42244)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1203 (array!82734 array!82736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48839 V!48839 V!48839 V!48839 (_ BitVec 32) Int) Unit!42244)

(assert (=> b!1269148 (= lt!574539 (lemmaNoChangeToArrayThenSameMapNoExtras!1203 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269149 () Bool)

(declare-fun res!844623 () Bool)

(assert (=> b!1269149 (=> (not res!844623) (not e!723345))))

(assert (=> b!1269149 (= res!844623 (and (= (size!40441 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40440 _keys!1364) (size!40441 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269150 () Bool)

(declare-fun res!844625 () Bool)

(assert (=> b!1269150 (=> (not res!844625) (not e!723345))))

(declare-datatypes ((List!28412 0))(
  ( (Nil!28409) (Cons!28408 (h!29617 (_ BitVec 64)) (t!41941 List!28412)) )
))
(declare-fun arrayNoDuplicates!0 (array!82734 (_ BitVec 32) List!28412) Bool)

(assert (=> b!1269150 (= res!844625 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28409))))

(declare-fun mapNonEmpty!50683 () Bool)

(declare-fun tp!96879 () Bool)

(declare-fun e!723348 () Bool)

(assert (=> mapNonEmpty!50683 (= mapRes!50683 (and tp!96879 e!723348))))

(declare-fun mapKey!50683 () (_ BitVec 32))

(declare-fun mapValue!50683 () ValueCell!15514)

(declare-fun mapRest!50683 () (Array (_ BitVec 32) ValueCell!15514))

(assert (=> mapNonEmpty!50683 (= (arr!39905 _values!1134) (store mapRest!50683 mapKey!50683 mapValue!50683))))

(declare-fun b!1269152 () Bool)

(declare-fun e!723347 () Bool)

(declare-fun tp_is_empty!32735 () Bool)

(assert (=> b!1269152 (= e!723347 tp_is_empty!32735)))

(declare-fun b!1269153 () Bool)

(declare-fun e!723344 () Bool)

(assert (=> b!1269153 (= e!723344 (and e!723347 mapRes!50683))))

(declare-fun condMapEmpty!50683 () Bool)

(declare-fun mapDefault!50683 () ValueCell!15514)

