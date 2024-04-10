; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107126 () Bool)

(assert start!107126)

(declare-fun b_free!27631 () Bool)

(declare-fun b_next!27631 () Bool)

(assert (=> start!107126 (= b_free!27631 (not b_next!27631))))

(declare-fun tp!97119 () Bool)

(declare-fun b_and!45663 () Bool)

(assert (=> start!107126 (= tp!97119 b_and!45663)))

(declare-fun b!1270107 () Bool)

(declare-fun e!723947 () Bool)

(assert (=> b!1270107 (= e!723947 (not true))))

(declare-datatypes ((V!48947 0))(
  ( (V!48948 (val!16482 Int)) )
))
(declare-datatypes ((ValueCell!15554 0))(
  ( (ValueCellFull!15554 (v!19119 V!48947)) (EmptyCell!15554) )
))
(declare-datatypes ((array!82892 0))(
  ( (array!82893 (arr!39983 (Array (_ BitVec 32) ValueCell!15554)) (size!40519 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82892)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82894 0))(
  ( (array!82895 (arr!39984 (Array (_ BitVec 32) (_ BitVec 64))) (size!40520 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82894)

(declare-fun minValueAfter!52 () V!48947)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48947)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48947)

(declare-fun zeroValueBefore!52 () V!48947)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21352 0))(
  ( (tuple2!21353 (_1!10687 (_ BitVec 64)) (_2!10687 V!48947)) )
))
(declare-datatypes ((List!28468 0))(
  ( (Nil!28465) (Cons!28464 (h!29673 tuple2!21352) (t!41997 List!28468)) )
))
(declare-datatypes ((ListLongMap!19081 0))(
  ( (ListLongMap!19082 (toList!9556 List!28468)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5888 (array!82894 array!82892 (_ BitVec 32) (_ BitVec 32) V!48947 V!48947 (_ BitVec 32) Int) ListLongMap!19081)

(assert (=> b!1270107 (= (getCurrentListMapNoExtraKeys!5888 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5888 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42298 0))(
  ( (Unit!42299) )
))
(declare-fun lt!574659 () Unit!42298)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1230 (array!82894 array!82892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48947 V!48947 V!48947 V!48947 (_ BitVec 32) Int) Unit!42298)

(assert (=> b!1270107 (= lt!574659 (lemmaNoChangeToArrayThenSameMapNoExtras!1230 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50803 () Bool)

(declare-fun mapRes!50803 () Bool)

(assert (=> mapIsEmpty!50803 mapRes!50803))

(declare-fun b!1270108 () Bool)

(declare-fun res!845223 () Bool)

(assert (=> b!1270108 (=> (not res!845223) (not e!723947))))

(declare-datatypes ((List!28469 0))(
  ( (Nil!28466) (Cons!28465 (h!29674 (_ BitVec 64)) (t!41998 List!28469)) )
))
(declare-fun arrayNoDuplicates!0 (array!82894 (_ BitVec 32) List!28469) Bool)

(assert (=> b!1270108 (= res!845223 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28466))))

(declare-fun b!1270109 () Bool)

(declare-fun e!723944 () Bool)

(declare-fun tp_is_empty!32815 () Bool)

(assert (=> b!1270109 (= e!723944 tp_is_empty!32815)))

(declare-fun b!1270110 () Bool)

(declare-fun res!845222 () Bool)

(assert (=> b!1270110 (=> (not res!845222) (not e!723947))))

(assert (=> b!1270110 (= res!845222 (and (= (size!40519 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40520 _keys!1364) (size!40519 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270111 () Bool)

(declare-fun e!723946 () Bool)

(assert (=> b!1270111 (= e!723946 tp_is_empty!32815)))

(declare-fun mapNonEmpty!50803 () Bool)

(declare-fun tp!97120 () Bool)

(assert (=> mapNonEmpty!50803 (= mapRes!50803 (and tp!97120 e!723944))))

(declare-fun mapRest!50803 () (Array (_ BitVec 32) ValueCell!15554))

(declare-fun mapValue!50803 () ValueCell!15554)

(declare-fun mapKey!50803 () (_ BitVec 32))

(assert (=> mapNonEmpty!50803 (= (arr!39983 _values!1134) (store mapRest!50803 mapKey!50803 mapValue!50803))))

(declare-fun b!1270112 () Bool)

(declare-fun res!845224 () Bool)

(assert (=> b!1270112 (=> (not res!845224) (not e!723947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82894 (_ BitVec 32)) Bool)

(assert (=> b!1270112 (= res!845224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!845225 () Bool)

(assert (=> start!107126 (=> (not res!845225) (not e!723947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107126 (= res!845225 (validMask!0 mask!1730))))

(assert (=> start!107126 e!723947))

(declare-fun e!723948 () Bool)

(declare-fun array_inv!30413 (array!82892) Bool)

(assert (=> start!107126 (and (array_inv!30413 _values!1134) e!723948)))

(assert (=> start!107126 true))

(declare-fun array_inv!30414 (array!82894) Bool)

(assert (=> start!107126 (array_inv!30414 _keys!1364)))

(assert (=> start!107126 tp_is_empty!32815))

(assert (=> start!107126 tp!97119))

(declare-fun b!1270113 () Bool)

(declare-fun res!845221 () Bool)

(assert (=> b!1270113 (=> (not res!845221) (not e!723947))))

(assert (=> b!1270113 (= res!845221 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40520 _keys!1364)) (bvslt from!1698 (size!40520 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270114 () Bool)

(assert (=> b!1270114 (= e!723948 (and e!723946 mapRes!50803))))

(declare-fun condMapEmpty!50803 () Bool)

(declare-fun mapDefault!50803 () ValueCell!15554)

