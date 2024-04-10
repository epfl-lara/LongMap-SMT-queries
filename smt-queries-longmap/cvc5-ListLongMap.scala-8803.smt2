; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107042 () Bool)

(assert start!107042)

(declare-fun b_free!27547 () Bool)

(declare-fun b_next!27547 () Bool)

(assert (=> start!107042 (= b_free!27547 (not b_next!27547))))

(declare-fun tp!96867 () Bool)

(declare-fun b_and!45579 () Bool)

(assert (=> start!107042 (= tp!96867 b_and!45579)))

(declare-fun b!1269099 () Bool)

(declare-fun res!844594 () Bool)

(declare-fun e!723314 () Bool)

(assert (=> b!1269099 (=> (not res!844594) (not e!723314))))

(declare-datatypes ((V!48835 0))(
  ( (V!48836 (val!16440 Int)) )
))
(declare-datatypes ((ValueCell!15512 0))(
  ( (ValueCellFull!15512 (v!19077 V!48835)) (EmptyCell!15512) )
))
(declare-datatypes ((array!82726 0))(
  ( (array!82727 (arr!39900 (Array (_ BitVec 32) ValueCell!15512)) (size!40436 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82726)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82728 0))(
  ( (array!82729 (arr!39901 (Array (_ BitVec 32) (_ BitVec 64))) (size!40437 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82728)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269099 (= res!844594 (and (= (size!40436 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40437 _keys!1364) (size!40436 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269100 () Bool)

(assert (=> b!1269100 (= e!723314 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48835)

(declare-fun minValueBefore!52 () V!48835)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48835)

(declare-fun zeroValueBefore!52 () V!48835)

(declare-datatypes ((tuple2!21294 0))(
  ( (tuple2!21295 (_1!10658 (_ BitVec 64)) (_2!10658 V!48835)) )
))
(declare-datatypes ((List!28407 0))(
  ( (Nil!28404) (Cons!28403 (h!29612 tuple2!21294) (t!41936 List!28407)) )
))
(declare-datatypes ((ListLongMap!19023 0))(
  ( (ListLongMap!19024 (toList!9527 List!28407)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5859 (array!82728 array!82726 (_ BitVec 32) (_ BitVec 32) V!48835 V!48835 (_ BitVec 32) Int) ListLongMap!19023)

(assert (=> b!1269100 (= (getCurrentListMapNoExtraKeys!5859 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5859 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42240 0))(
  ( (Unit!42241) )
))
(declare-fun lt!574533 () Unit!42240)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1201 (array!82728 array!82726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48835 V!48835 V!48835 V!48835 (_ BitVec 32) Int) Unit!42240)

(assert (=> b!1269100 (= lt!574533 (lemmaNoChangeToArrayThenSameMapNoExtras!1201 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun res!844595 () Bool)

(assert (=> start!107042 (=> (not res!844595) (not e!723314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107042 (= res!844595 (validMask!0 mask!1730))))

(assert (=> start!107042 e!723314))

(declare-fun e!723316 () Bool)

(declare-fun array_inv!30357 (array!82726) Bool)

(assert (=> start!107042 (and (array_inv!30357 _values!1134) e!723316)))

(assert (=> start!107042 true))

(declare-fun array_inv!30358 (array!82728) Bool)

(assert (=> start!107042 (array_inv!30358 _keys!1364)))

(declare-fun tp_is_empty!32731 () Bool)

(assert (=> start!107042 tp_is_empty!32731))

(assert (=> start!107042 tp!96867))

(declare-fun mapIsEmpty!50677 () Bool)

(declare-fun mapRes!50677 () Bool)

(assert (=> mapIsEmpty!50677 mapRes!50677))

(declare-fun b!1269101 () Bool)

(declare-fun e!723315 () Bool)

(assert (=> b!1269101 (= e!723315 tp_is_empty!32731)))

(declare-fun b!1269102 () Bool)

(declare-fun res!844592 () Bool)

(assert (=> b!1269102 (=> (not res!844592) (not e!723314))))

(declare-datatypes ((List!28408 0))(
  ( (Nil!28405) (Cons!28404 (h!29613 (_ BitVec 64)) (t!41937 List!28408)) )
))
(declare-fun arrayNoDuplicates!0 (array!82728 (_ BitVec 32) List!28408) Bool)

(assert (=> b!1269102 (= res!844592 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28405))))

(declare-fun mapNonEmpty!50677 () Bool)

(declare-fun tp!96868 () Bool)

(declare-fun e!723318 () Bool)

(assert (=> mapNonEmpty!50677 (= mapRes!50677 (and tp!96868 e!723318))))

(declare-fun mapRest!50677 () (Array (_ BitVec 32) ValueCell!15512))

(declare-fun mapKey!50677 () (_ BitVec 32))

(declare-fun mapValue!50677 () ValueCell!15512)

(assert (=> mapNonEmpty!50677 (= (arr!39900 _values!1134) (store mapRest!50677 mapKey!50677 mapValue!50677))))

(declare-fun b!1269103 () Bool)

(declare-fun res!844593 () Bool)

(assert (=> b!1269103 (=> (not res!844593) (not e!723314))))

(assert (=> b!1269103 (= res!844593 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40437 _keys!1364)) (bvslt from!1698 (size!40437 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269104 () Bool)

(assert (=> b!1269104 (= e!723316 (and e!723315 mapRes!50677))))

(declare-fun condMapEmpty!50677 () Bool)

(declare-fun mapDefault!50677 () ValueCell!15512)

