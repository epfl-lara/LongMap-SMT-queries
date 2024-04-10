; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107088 () Bool)

(assert start!107088)

(declare-fun b_free!27593 () Bool)

(declare-fun b_next!27593 () Bool)

(assert (=> start!107088 (= b_free!27593 (not b_next!27593))))

(declare-fun tp!97005 () Bool)

(declare-fun b_and!45625 () Bool)

(assert (=> start!107088 (= tp!97005 b_and!45625)))

(declare-fun b!1269651 () Bool)

(declare-fun res!844939 () Bool)

(declare-fun e!723660 () Bool)

(assert (=> b!1269651 (=> (not res!844939) (not e!723660))))

(declare-datatypes ((array!82816 0))(
  ( (array!82817 (arr!39945 (Array (_ BitVec 32) (_ BitVec 64))) (size!40481 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82816)

(declare-datatypes ((List!28439 0))(
  ( (Nil!28436) (Cons!28435 (h!29644 (_ BitVec 64)) (t!41968 List!28439)) )
))
(declare-fun arrayNoDuplicates!0 (array!82816 (_ BitVec 32) List!28439) Bool)

(assert (=> b!1269651 (= res!844939 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28436))))

(declare-fun b!1269652 () Bool)

(assert (=> b!1269652 (= e!723660 (not true))))

(declare-datatypes ((V!48895 0))(
  ( (V!48896 (val!16463 Int)) )
))
(declare-datatypes ((ValueCell!15535 0))(
  ( (ValueCellFull!15535 (v!19100 V!48895)) (EmptyCell!15535) )
))
(declare-datatypes ((array!82818 0))(
  ( (array!82819 (arr!39946 (Array (_ BitVec 32) ValueCell!15535)) (size!40482 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82818)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48895)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48895)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48895)

(declare-fun zeroValueBefore!52 () V!48895)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21326 0))(
  ( (tuple2!21327 (_1!10674 (_ BitVec 64)) (_2!10674 V!48895)) )
))
(declare-datatypes ((List!28440 0))(
  ( (Nil!28437) (Cons!28436 (h!29645 tuple2!21326) (t!41969 List!28440)) )
))
(declare-datatypes ((ListLongMap!19055 0))(
  ( (ListLongMap!19056 (toList!9543 List!28440)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5875 (array!82816 array!82818 (_ BitVec 32) (_ BitVec 32) V!48895 V!48895 (_ BitVec 32) Int) ListLongMap!19055)

(assert (=> b!1269652 (= (getCurrentListMapNoExtraKeys!5875 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5875 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42272 0))(
  ( (Unit!42273) )
))
(declare-fun lt!574602 () Unit!42272)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1217 (array!82816 array!82818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48895 V!48895 V!48895 V!48895 (_ BitVec 32) Int) Unit!42272)

(assert (=> b!1269652 (= lt!574602 (lemmaNoChangeToArrayThenSameMapNoExtras!1217 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50746 () Bool)

(declare-fun mapRes!50746 () Bool)

(assert (=> mapIsEmpty!50746 mapRes!50746))

(declare-fun b!1269653 () Bool)

(declare-fun res!844940 () Bool)

(assert (=> b!1269653 (=> (not res!844940) (not e!723660))))

(assert (=> b!1269653 (= res!844940 (and (= (size!40482 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40481 _keys!1364) (size!40482 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269654 () Bool)

(declare-fun res!844938 () Bool)

(assert (=> b!1269654 (=> (not res!844938) (not e!723660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82816 (_ BitVec 32)) Bool)

(assert (=> b!1269654 (= res!844938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269655 () Bool)

(declare-fun e!723662 () Bool)

(declare-fun tp_is_empty!32777 () Bool)

(assert (=> b!1269655 (= e!723662 tp_is_empty!32777)))

(declare-fun b!1269656 () Bool)

(declare-fun e!723659 () Bool)

(declare-fun e!723663 () Bool)

(assert (=> b!1269656 (= e!723659 (and e!723663 mapRes!50746))))

(declare-fun condMapEmpty!50746 () Bool)

(declare-fun mapDefault!50746 () ValueCell!15535)

