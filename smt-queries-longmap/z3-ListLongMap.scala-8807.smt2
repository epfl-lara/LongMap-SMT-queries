; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107290 () Bool)

(assert start!107290)

(declare-fun b_free!27571 () Bool)

(declare-fun b_next!27571 () Bool)

(assert (=> start!107290 (= b_free!27571 (not b_next!27571))))

(declare-fun tp!96940 () Bool)

(declare-fun b_and!45605 () Bool)

(assert (=> start!107290 (= tp!96940 b_and!45605)))

(declare-fun mapIsEmpty!50713 () Bool)

(declare-fun mapRes!50713 () Bool)

(assert (=> mapIsEmpty!50713 mapRes!50713))

(declare-fun b!1270692 () Bool)

(declare-fun res!845291 () Bool)

(declare-fun e!724344 () Bool)

(assert (=> b!1270692 (=> (not res!845291) (not e!724344))))

(declare-datatypes ((array!82811 0))(
  ( (array!82812 (arr!39938 (Array (_ BitVec 32) (_ BitVec 64))) (size!40475 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82811)

(declare-datatypes ((List!28458 0))(
  ( (Nil!28455) (Cons!28454 (h!29672 (_ BitVec 64)) (t!41979 List!28458)) )
))
(declare-fun arrayNoDuplicates!0 (array!82811 (_ BitVec 32) List!28458) Bool)

(assert (=> b!1270692 (= res!845291 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28455))))

(declare-fun res!845292 () Bool)

(assert (=> start!107290 (=> (not res!845292) (not e!724344))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107290 (= res!845292 (validMask!0 mask!1730))))

(assert (=> start!107290 e!724344))

(declare-datatypes ((V!48867 0))(
  ( (V!48868 (val!16452 Int)) )
))
(declare-datatypes ((ValueCell!15524 0))(
  ( (ValueCellFull!15524 (v!19084 V!48867)) (EmptyCell!15524) )
))
(declare-datatypes ((array!82813 0))(
  ( (array!82814 (arr!39939 (Array (_ BitVec 32) ValueCell!15524)) (size!40476 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82813)

(declare-fun e!724343 () Bool)

(declare-fun array_inv!30553 (array!82813) Bool)

(assert (=> start!107290 (and (array_inv!30553 _values!1134) e!724343)))

(assert (=> start!107290 true))

(declare-fun array_inv!30554 (array!82811) Bool)

(assert (=> start!107290 (array_inv!30554 _keys!1364)))

(declare-fun tp_is_empty!32755 () Bool)

(assert (=> start!107290 tp_is_empty!32755))

(assert (=> start!107290 tp!96940))

(declare-fun b!1270693 () Bool)

(assert (=> b!1270693 (= e!724344 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48867)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48867)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48867)

(declare-fun zeroValueBefore!52 () V!48867)

(declare-datatypes ((tuple2!21314 0))(
  ( (tuple2!21315 (_1!10668 (_ BitVec 64)) (_2!10668 V!48867)) )
))
(declare-datatypes ((List!28459 0))(
  ( (Nil!28456) (Cons!28455 (h!29673 tuple2!21314) (t!41980 List!28459)) )
))
(declare-datatypes ((ListLongMap!19051 0))(
  ( (ListLongMap!19052 (toList!9541 List!28459)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5913 (array!82811 array!82813 (_ BitVec 32) (_ BitVec 32) V!48867 V!48867 (_ BitVec 32) Int) ListLongMap!19051)

(assert (=> b!1270693 (= (getCurrentListMapNoExtraKeys!5913 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5913 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42223 0))(
  ( (Unit!42224) )
))
(declare-fun lt!575053 () Unit!42223)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1203 (array!82811 array!82813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48867 V!48867 V!48867 V!48867 (_ BitVec 32) Int) Unit!42223)

(assert (=> b!1270693 (= lt!575053 (lemmaNoChangeToArrayThenSameMapNoExtras!1203 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270694 () Bool)

(declare-fun e!724341 () Bool)

(assert (=> b!1270694 (= e!724341 tp_is_empty!32755)))

(declare-fun b!1270695 () Bool)

(declare-fun res!845294 () Bool)

(assert (=> b!1270695 (=> (not res!845294) (not e!724344))))

(assert (=> b!1270695 (= res!845294 (and (= (size!40476 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40475 _keys!1364) (size!40476 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270696 () Bool)

(declare-fun res!845295 () Bool)

(assert (=> b!1270696 (=> (not res!845295) (not e!724344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82811 (_ BitVec 32)) Bool)

(assert (=> b!1270696 (= res!845295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270697 () Bool)

(declare-fun res!845293 () Bool)

(assert (=> b!1270697 (=> (not res!845293) (not e!724344))))

(assert (=> b!1270697 (= res!845293 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40475 _keys!1364)) (bvslt from!1698 (size!40475 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270698 () Bool)

(declare-fun e!724342 () Bool)

(assert (=> b!1270698 (= e!724343 (and e!724342 mapRes!50713))))

(declare-fun condMapEmpty!50713 () Bool)

(declare-fun mapDefault!50713 () ValueCell!15524)

(assert (=> b!1270698 (= condMapEmpty!50713 (= (arr!39939 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15524)) mapDefault!50713)))))

(declare-fun mapNonEmpty!50713 () Bool)

(declare-fun tp!96939 () Bool)

(assert (=> mapNonEmpty!50713 (= mapRes!50713 (and tp!96939 e!724341))))

(declare-fun mapRest!50713 () (Array (_ BitVec 32) ValueCell!15524))

(declare-fun mapKey!50713 () (_ BitVec 32))

(declare-fun mapValue!50713 () ValueCell!15524)

(assert (=> mapNonEmpty!50713 (= (arr!39939 _values!1134) (store mapRest!50713 mapKey!50713 mapValue!50713))))

(declare-fun b!1270699 () Bool)

(assert (=> b!1270699 (= e!724342 tp_is_empty!32755)))

(assert (= (and start!107290 res!845292) b!1270695))

(assert (= (and b!1270695 res!845294) b!1270696))

(assert (= (and b!1270696 res!845295) b!1270692))

(assert (= (and b!1270692 res!845291) b!1270697))

(assert (= (and b!1270697 res!845293) b!1270693))

(assert (= (and b!1270698 condMapEmpty!50713) mapIsEmpty!50713))

(assert (= (and b!1270698 (not condMapEmpty!50713)) mapNonEmpty!50713))

(get-info :version)

(assert (= (and mapNonEmpty!50713 ((_ is ValueCellFull!15524) mapValue!50713)) b!1270694))

(assert (= (and b!1270698 ((_ is ValueCellFull!15524) mapDefault!50713)) b!1270699))

(assert (= start!107290 b!1270698))

(declare-fun m!1169553 () Bool)

(assert (=> b!1270692 m!1169553))

(declare-fun m!1169555 () Bool)

(assert (=> mapNonEmpty!50713 m!1169555))

(declare-fun m!1169557 () Bool)

(assert (=> b!1270696 m!1169557))

(declare-fun m!1169559 () Bool)

(assert (=> b!1270693 m!1169559))

(declare-fun m!1169561 () Bool)

(assert (=> b!1270693 m!1169561))

(declare-fun m!1169563 () Bool)

(assert (=> b!1270693 m!1169563))

(declare-fun m!1169565 () Bool)

(assert (=> start!107290 m!1169565))

(declare-fun m!1169567 () Bool)

(assert (=> start!107290 m!1169567))

(declare-fun m!1169569 () Bool)

(assert (=> start!107290 m!1169569))

(check-sat (not b!1270693) (not mapNonEmpty!50713) b_and!45605 tp_is_empty!32755 (not b!1270696) (not b!1270692) (not b_next!27571) (not start!107290))
(check-sat b_and!45605 (not b_next!27571))
