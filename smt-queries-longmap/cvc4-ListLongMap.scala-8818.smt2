; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107136 () Bool)

(assert start!107136)

(declare-fun b_free!27641 () Bool)

(declare-fun b_next!27641 () Bool)

(assert (=> start!107136 (= b_free!27641 (not b_next!27641))))

(declare-fun tp!97150 () Bool)

(declare-fun b_and!45673 () Bool)

(assert (=> start!107136 (= tp!97150 b_and!45673)))

(declare-fun b!1270227 () Bool)

(declare-fun res!845299 () Bool)

(declare-fun e!724020 () Bool)

(assert (=> b!1270227 (=> (not res!845299) (not e!724020))))

(declare-datatypes ((array!82912 0))(
  ( (array!82913 (arr!39993 (Array (_ BitVec 32) (_ BitVec 64))) (size!40529 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82912)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82912 (_ BitVec 32)) Bool)

(assert (=> b!1270227 (= res!845299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270228 () Bool)

(declare-fun res!845296 () Bool)

(assert (=> b!1270228 (=> (not res!845296) (not e!724020))))

(declare-datatypes ((V!48959 0))(
  ( (V!48960 (val!16487 Int)) )
))
(declare-datatypes ((ValueCell!15559 0))(
  ( (ValueCellFull!15559 (v!19124 V!48959)) (EmptyCell!15559) )
))
(declare-datatypes ((array!82914 0))(
  ( (array!82915 (arr!39994 (Array (_ BitVec 32) ValueCell!15559)) (size!40530 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82914)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270228 (= res!845296 (and (= (size!40530 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40529 _keys!1364) (size!40530 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270229 () Bool)

(declare-fun res!845298 () Bool)

(assert (=> b!1270229 (=> (not res!845298) (not e!724020))))

(declare-datatypes ((List!28476 0))(
  ( (Nil!28473) (Cons!28472 (h!29681 (_ BitVec 64)) (t!42005 List!28476)) )
))
(declare-fun arrayNoDuplicates!0 (array!82912 (_ BitVec 32) List!28476) Bool)

(assert (=> b!1270229 (= res!845298 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28473))))

(declare-fun b!1270230 () Bool)

(declare-fun e!724019 () Bool)

(declare-fun tp_is_empty!32825 () Bool)

(assert (=> b!1270230 (= e!724019 tp_is_empty!32825)))

(declare-fun b!1270231 () Bool)

(assert (=> b!1270231 (= e!724020 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48959)

(declare-fun minValueBefore!52 () V!48959)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48959)

(declare-fun zeroValueBefore!52 () V!48959)

(declare-datatypes ((tuple2!21360 0))(
  ( (tuple2!21361 (_1!10691 (_ BitVec 64)) (_2!10691 V!48959)) )
))
(declare-datatypes ((List!28477 0))(
  ( (Nil!28474) (Cons!28473 (h!29682 tuple2!21360) (t!42006 List!28477)) )
))
(declare-datatypes ((ListLongMap!19089 0))(
  ( (ListLongMap!19090 (toList!9560 List!28477)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5892 (array!82912 array!82914 (_ BitVec 32) (_ BitVec 32) V!48959 V!48959 (_ BitVec 32) Int) ListLongMap!19089)

(assert (=> b!1270231 (= (getCurrentListMapNoExtraKeys!5892 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5892 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42306 0))(
  ( (Unit!42307) )
))
(declare-fun lt!574674 () Unit!42306)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1234 (array!82912 array!82914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48959 V!48959 V!48959 V!48959 (_ BitVec 32) Int) Unit!42306)

(assert (=> b!1270231 (= lt!574674 (lemmaNoChangeToArrayThenSameMapNoExtras!1234 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50818 () Bool)

(declare-fun mapRes!50818 () Bool)

(assert (=> mapIsEmpty!50818 mapRes!50818))

(declare-fun mapNonEmpty!50818 () Bool)

(declare-fun tp!97149 () Bool)

(assert (=> mapNonEmpty!50818 (= mapRes!50818 (and tp!97149 e!724019))))

(declare-fun mapRest!50818 () (Array (_ BitVec 32) ValueCell!15559))

(declare-fun mapKey!50818 () (_ BitVec 32))

(declare-fun mapValue!50818 () ValueCell!15559)

(assert (=> mapNonEmpty!50818 (= (arr!39994 _values!1134) (store mapRest!50818 mapKey!50818 mapValue!50818))))

(declare-fun b!1270232 () Bool)

(declare-fun e!724023 () Bool)

(assert (=> b!1270232 (= e!724023 tp_is_empty!32825)))

(declare-fun b!1270233 () Bool)

(declare-fun e!724022 () Bool)

(assert (=> b!1270233 (= e!724022 (and e!724023 mapRes!50818))))

(declare-fun condMapEmpty!50818 () Bool)

(declare-fun mapDefault!50818 () ValueCell!15559)

