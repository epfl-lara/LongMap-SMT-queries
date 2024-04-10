; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107094 () Bool)

(assert start!107094)

(declare-fun b_free!27599 () Bool)

(declare-fun b_next!27599 () Bool)

(assert (=> start!107094 (= b_free!27599 (not b_next!27599))))

(declare-fun tp!97023 () Bool)

(declare-fun b_and!45631 () Bool)

(assert (=> start!107094 (= tp!97023 b_and!45631)))

(declare-fun res!844985 () Bool)

(declare-fun e!723706 () Bool)

(assert (=> start!107094 (=> (not res!844985) (not e!723706))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107094 (= res!844985 (validMask!0 mask!1730))))

(assert (=> start!107094 e!723706))

(declare-datatypes ((V!48903 0))(
  ( (V!48904 (val!16466 Int)) )
))
(declare-datatypes ((ValueCell!15538 0))(
  ( (ValueCellFull!15538 (v!19103 V!48903)) (EmptyCell!15538) )
))
(declare-datatypes ((array!82828 0))(
  ( (array!82829 (arr!39951 (Array (_ BitVec 32) ValueCell!15538)) (size!40487 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82828)

(declare-fun e!723708 () Bool)

(declare-fun array_inv!30389 (array!82828) Bool)

(assert (=> start!107094 (and (array_inv!30389 _values!1134) e!723708)))

(assert (=> start!107094 true))

(declare-datatypes ((array!82830 0))(
  ( (array!82831 (arr!39952 (Array (_ BitVec 32) (_ BitVec 64))) (size!40488 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82830)

(declare-fun array_inv!30390 (array!82830) Bool)

(assert (=> start!107094 (array_inv!30390 _keys!1364)))

(declare-fun tp_is_empty!32783 () Bool)

(assert (=> start!107094 tp_is_empty!32783))

(assert (=> start!107094 tp!97023))

(declare-fun b!1269723 () Bool)

(declare-fun res!844982 () Bool)

(assert (=> b!1269723 (=> (not res!844982) (not e!723706))))

(declare-datatypes ((List!28444 0))(
  ( (Nil!28441) (Cons!28440 (h!29649 (_ BitVec 64)) (t!41973 List!28444)) )
))
(declare-fun arrayNoDuplicates!0 (array!82830 (_ BitVec 32) List!28444) Bool)

(assert (=> b!1269723 (= res!844982 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28441))))

(declare-fun b!1269724 () Bool)

(assert (=> b!1269724 (= e!723706 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48903)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48903)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48903)

(declare-fun zeroValueBefore!52 () V!48903)

(declare-datatypes ((tuple2!21330 0))(
  ( (tuple2!21331 (_1!10676 (_ BitVec 64)) (_2!10676 V!48903)) )
))
(declare-datatypes ((List!28445 0))(
  ( (Nil!28442) (Cons!28441 (h!29650 tuple2!21330) (t!41974 List!28445)) )
))
(declare-datatypes ((ListLongMap!19059 0))(
  ( (ListLongMap!19060 (toList!9545 List!28445)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5877 (array!82830 array!82828 (_ BitVec 32) (_ BitVec 32) V!48903 V!48903 (_ BitVec 32) Int) ListLongMap!19059)

(assert (=> b!1269724 (= (getCurrentListMapNoExtraKeys!5877 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5877 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42276 0))(
  ( (Unit!42277) )
))
(declare-fun lt!574611 () Unit!42276)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1219 (array!82830 array!82828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48903 V!48903 V!48903 V!48903 (_ BitVec 32) Int) Unit!42276)

(assert (=> b!1269724 (= lt!574611 (lemmaNoChangeToArrayThenSameMapNoExtras!1219 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269725 () Bool)

(declare-fun res!844983 () Bool)

(assert (=> b!1269725 (=> (not res!844983) (not e!723706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82830 (_ BitVec 32)) Bool)

(assert (=> b!1269725 (= res!844983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269726 () Bool)

(declare-fun e!723707 () Bool)

(assert (=> b!1269726 (= e!723707 tp_is_empty!32783)))

(declare-fun mapNonEmpty!50755 () Bool)

(declare-fun mapRes!50755 () Bool)

(declare-fun tp!97024 () Bool)

(declare-fun e!723705 () Bool)

(assert (=> mapNonEmpty!50755 (= mapRes!50755 (and tp!97024 e!723705))))

(declare-fun mapKey!50755 () (_ BitVec 32))

(declare-fun mapRest!50755 () (Array (_ BitVec 32) ValueCell!15538))

(declare-fun mapValue!50755 () ValueCell!15538)

(assert (=> mapNonEmpty!50755 (= (arr!39951 _values!1134) (store mapRest!50755 mapKey!50755 mapValue!50755))))

(declare-fun b!1269727 () Bool)

(assert (=> b!1269727 (= e!723705 tp_is_empty!32783)))

(declare-fun b!1269728 () Bool)

(declare-fun res!844981 () Bool)

(assert (=> b!1269728 (=> (not res!844981) (not e!723706))))

(assert (=> b!1269728 (= res!844981 (and (= (size!40487 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40488 _keys!1364) (size!40487 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269729 () Bool)

(assert (=> b!1269729 (= e!723708 (and e!723707 mapRes!50755))))

(declare-fun condMapEmpty!50755 () Bool)

(declare-fun mapDefault!50755 () ValueCell!15538)

