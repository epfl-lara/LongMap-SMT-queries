; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107058 () Bool)

(assert start!107058)

(declare-fun b_free!27563 () Bool)

(declare-fun b_next!27563 () Bool)

(assert (=> start!107058 (= b_free!27563 (not b_next!27563))))

(declare-fun tp!96915 () Bool)

(declare-fun b_and!45595 () Bool)

(assert (=> start!107058 (= tp!96915 b_and!45595)))

(declare-fun b!1269291 () Bool)

(declare-fun e!723434 () Bool)

(assert (=> b!1269291 (= e!723434 (not true))))

(declare-datatypes ((V!48855 0))(
  ( (V!48856 (val!16448 Int)) )
))
(declare-datatypes ((ValueCell!15520 0))(
  ( (ValueCellFull!15520 (v!19085 V!48855)) (EmptyCell!15520) )
))
(declare-datatypes ((array!82758 0))(
  ( (array!82759 (arr!39916 (Array (_ BitVec 32) ValueCell!15520)) (size!40452 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82758)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82760 0))(
  ( (array!82761 (arr!39917 (Array (_ BitVec 32) (_ BitVec 64))) (size!40453 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82760)

(declare-fun minValueAfter!52 () V!48855)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48855)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48855)

(declare-fun zeroValueBefore!52 () V!48855)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21306 0))(
  ( (tuple2!21307 (_1!10664 (_ BitVec 64)) (_2!10664 V!48855)) )
))
(declare-datatypes ((List!28420 0))(
  ( (Nil!28417) (Cons!28416 (h!29625 tuple2!21306) (t!41949 List!28420)) )
))
(declare-datatypes ((ListLongMap!19035 0))(
  ( (ListLongMap!19036 (toList!9533 List!28420)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5865 (array!82760 array!82758 (_ BitVec 32) (_ BitVec 32) V!48855 V!48855 (_ BitVec 32) Int) ListLongMap!19035)

(assert (=> b!1269291 (= (getCurrentListMapNoExtraKeys!5865 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5865 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42252 0))(
  ( (Unit!42253) )
))
(declare-fun lt!574557 () Unit!42252)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1207 (array!82760 array!82758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48855 V!48855 V!48855 V!48855 (_ BitVec 32) Int) Unit!42252)

(assert (=> b!1269291 (= lt!574557 (lemmaNoChangeToArrayThenSameMapNoExtras!1207 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269292 () Bool)

(declare-fun res!844712 () Bool)

(assert (=> b!1269292 (=> (not res!844712) (not e!723434))))

(assert (=> b!1269292 (= res!844712 (and (= (size!40452 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40453 _keys!1364) (size!40452 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269293 () Bool)

(declare-fun res!844711 () Bool)

(assert (=> b!1269293 (=> (not res!844711) (not e!723434))))

(assert (=> b!1269293 (= res!844711 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40453 _keys!1364)) (bvslt from!1698 (size!40453 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269294 () Bool)

(declare-fun e!723438 () Bool)

(declare-fun tp_is_empty!32747 () Bool)

(assert (=> b!1269294 (= e!723438 tp_is_empty!32747)))

(declare-fun mapIsEmpty!50701 () Bool)

(declare-fun mapRes!50701 () Bool)

(assert (=> mapIsEmpty!50701 mapRes!50701))

(declare-fun b!1269295 () Bool)

(declare-fun e!723436 () Bool)

(assert (=> b!1269295 (= e!723436 tp_is_empty!32747)))

(declare-fun b!1269296 () Bool)

(declare-fun res!844713 () Bool)

(assert (=> b!1269296 (=> (not res!844713) (not e!723434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82760 (_ BitVec 32)) Bool)

(assert (=> b!1269296 (= res!844713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269297 () Bool)

(declare-fun e!723437 () Bool)

(assert (=> b!1269297 (= e!723437 (and e!723436 mapRes!50701))))

(declare-fun condMapEmpty!50701 () Bool)

(declare-fun mapDefault!50701 () ValueCell!15520)

