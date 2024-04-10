; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107076 () Bool)

(assert start!107076)

(declare-fun b_free!27581 () Bool)

(declare-fun b_next!27581 () Bool)

(assert (=> start!107076 (= b_free!27581 (not b_next!27581))))

(declare-fun tp!96970 () Bool)

(declare-fun b_and!45613 () Bool)

(assert (=> start!107076 (= tp!96970 b_and!45613)))

(declare-fun b!1269507 () Bool)

(declare-fun e!723571 () Bool)

(assert (=> b!1269507 (= e!723571 (not true))))

(declare-datatypes ((V!48879 0))(
  ( (V!48880 (val!16457 Int)) )
))
(declare-datatypes ((ValueCell!15529 0))(
  ( (ValueCellFull!15529 (v!19094 V!48879)) (EmptyCell!15529) )
))
(declare-datatypes ((array!82792 0))(
  ( (array!82793 (arr!39933 (Array (_ BitVec 32) ValueCell!15529)) (size!40469 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82792)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82794 0))(
  ( (array!82795 (arr!39934 (Array (_ BitVec 32) (_ BitVec 64))) (size!40470 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82794)

(declare-fun minValueAfter!52 () V!48879)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48879)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48879)

(declare-fun zeroValueBefore!52 () V!48879)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21316 0))(
  ( (tuple2!21317 (_1!10669 (_ BitVec 64)) (_2!10669 V!48879)) )
))
(declare-datatypes ((List!28429 0))(
  ( (Nil!28426) (Cons!28425 (h!29634 tuple2!21316) (t!41958 List!28429)) )
))
(declare-datatypes ((ListLongMap!19045 0))(
  ( (ListLongMap!19046 (toList!9538 List!28429)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5870 (array!82794 array!82792 (_ BitVec 32) (_ BitVec 32) V!48879 V!48879 (_ BitVec 32) Int) ListLongMap!19045)

(assert (=> b!1269507 (= (getCurrentListMapNoExtraKeys!5870 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5870 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42262 0))(
  ( (Unit!42263) )
))
(declare-fun lt!574584 () Unit!42262)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1212 (array!82794 array!82792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48879 V!48879 V!48879 V!48879 (_ BitVec 32) Int) Unit!42262)

(assert (=> b!1269507 (= lt!574584 (lemmaNoChangeToArrayThenSameMapNoExtras!1212 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269508 () Bool)

(declare-fun res!844847 () Bool)

(assert (=> b!1269508 (=> (not res!844847) (not e!723571))))

(assert (=> b!1269508 (= res!844847 (and (= (size!40469 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40470 _keys!1364) (size!40469 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269509 () Bool)

(declare-fun res!844850 () Bool)

(assert (=> b!1269509 (=> (not res!844850) (not e!723571))))

(assert (=> b!1269509 (= res!844850 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40470 _keys!1364)) (bvslt from!1698 (size!40470 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun res!844848 () Bool)

(assert (=> start!107076 (=> (not res!844848) (not e!723571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107076 (= res!844848 (validMask!0 mask!1730))))

(assert (=> start!107076 e!723571))

(declare-fun e!723569 () Bool)

(declare-fun array_inv!30377 (array!82792) Bool)

(assert (=> start!107076 (and (array_inv!30377 _values!1134) e!723569)))

(assert (=> start!107076 true))

(declare-fun array_inv!30378 (array!82794) Bool)

(assert (=> start!107076 (array_inv!30378 _keys!1364)))

(declare-fun tp_is_empty!32765 () Bool)

(assert (=> start!107076 tp_is_empty!32765))

(assert (=> start!107076 tp!96970))

(declare-fun b!1269510 () Bool)

(declare-fun res!844849 () Bool)

(assert (=> b!1269510 (=> (not res!844849) (not e!723571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82794 (_ BitVec 32)) Bool)

(assert (=> b!1269510 (= res!844849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269511 () Bool)

(declare-fun e!723572 () Bool)

(assert (=> b!1269511 (= e!723572 tp_is_empty!32765)))

(declare-fun b!1269512 () Bool)

(declare-fun res!844846 () Bool)

(assert (=> b!1269512 (=> (not res!844846) (not e!723571))))

(declare-datatypes ((List!28430 0))(
  ( (Nil!28427) (Cons!28426 (h!29635 (_ BitVec 64)) (t!41959 List!28430)) )
))
(declare-fun arrayNoDuplicates!0 (array!82794 (_ BitVec 32) List!28430) Bool)

(assert (=> b!1269512 (= res!844846 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28427))))

(declare-fun mapNonEmpty!50728 () Bool)

(declare-fun mapRes!50728 () Bool)

(declare-fun tp!96969 () Bool)

(assert (=> mapNonEmpty!50728 (= mapRes!50728 (and tp!96969 e!723572))))

(declare-fun mapValue!50728 () ValueCell!15529)

(declare-fun mapRest!50728 () (Array (_ BitVec 32) ValueCell!15529))

(declare-fun mapKey!50728 () (_ BitVec 32))

(assert (=> mapNonEmpty!50728 (= (arr!39933 _values!1134) (store mapRest!50728 mapKey!50728 mapValue!50728))))

(declare-fun b!1269513 () Bool)

(declare-fun e!723573 () Bool)

(assert (=> b!1269513 (= e!723569 (and e!723573 mapRes!50728))))

(declare-fun condMapEmpty!50728 () Bool)

(declare-fun mapDefault!50728 () ValueCell!15529)

