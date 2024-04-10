; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107100 () Bool)

(assert start!107100)

(declare-fun b_free!27605 () Bool)

(declare-fun b_next!27605 () Bool)

(assert (=> start!107100 (= b_free!27605 (not b_next!27605))))

(declare-fun tp!97042 () Bool)

(declare-fun b_and!45637 () Bool)

(assert (=> start!107100 (= tp!97042 b_and!45637)))

(declare-fun b!1269795 () Bool)

(declare-fun e!723749 () Bool)

(assert (=> b!1269795 (= e!723749 (not true))))

(declare-datatypes ((V!48911 0))(
  ( (V!48912 (val!16469 Int)) )
))
(declare-datatypes ((ValueCell!15541 0))(
  ( (ValueCellFull!15541 (v!19106 V!48911)) (EmptyCell!15541) )
))
(declare-datatypes ((array!82840 0))(
  ( (array!82841 (arr!39957 (Array (_ BitVec 32) ValueCell!15541)) (size!40493 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82840)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82842 0))(
  ( (array!82843 (arr!39958 (Array (_ BitVec 32) (_ BitVec 64))) (size!40494 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82842)

(declare-fun minValueAfter!52 () V!48911)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48911)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48911)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun zeroValueBefore!52 () V!48911)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21334 0))(
  ( (tuple2!21335 (_1!10678 (_ BitVec 64)) (_2!10678 V!48911)) )
))
(declare-datatypes ((List!28449 0))(
  ( (Nil!28446) (Cons!28445 (h!29654 tuple2!21334) (t!41978 List!28449)) )
))
(declare-datatypes ((ListLongMap!19063 0))(
  ( (ListLongMap!19064 (toList!9547 List!28449)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5879 (array!82842 array!82840 (_ BitVec 32) (_ BitVec 32) V!48911 V!48911 (_ BitVec 32) Int) ListLongMap!19063)

(assert (=> b!1269795 (= (getCurrentListMapNoExtraKeys!5879 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5879 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42280 0))(
  ( (Unit!42281) )
))
(declare-fun lt!574620 () Unit!42280)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1221 (array!82842 array!82840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48911 V!48911 V!48911 V!48911 (_ BitVec 32) Int) Unit!42280)

(assert (=> b!1269795 (= lt!574620 (lemmaNoChangeToArrayThenSameMapNoExtras!1221 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50764 () Bool)

(declare-fun mapRes!50764 () Bool)

(declare-fun tp!97041 () Bool)

(declare-fun e!723753 () Bool)

(assert (=> mapNonEmpty!50764 (= mapRes!50764 (and tp!97041 e!723753))))

(declare-fun mapValue!50764 () ValueCell!15541)

(declare-fun mapRest!50764 () (Array (_ BitVec 32) ValueCell!15541))

(declare-fun mapKey!50764 () (_ BitVec 32))

(assert (=> mapNonEmpty!50764 (= (arr!39957 _values!1134) (store mapRest!50764 mapKey!50764 mapValue!50764))))

(declare-fun b!1269797 () Bool)

(declare-fun e!723751 () Bool)

(declare-fun tp_is_empty!32789 () Bool)

(assert (=> b!1269797 (= e!723751 tp_is_empty!32789)))

(declare-fun b!1269798 () Bool)

(declare-fun res!845030 () Bool)

(assert (=> b!1269798 (=> (not res!845030) (not e!723749))))

(declare-datatypes ((List!28450 0))(
  ( (Nil!28447) (Cons!28446 (h!29655 (_ BitVec 64)) (t!41979 List!28450)) )
))
(declare-fun arrayNoDuplicates!0 (array!82842 (_ BitVec 32) List!28450) Bool)

(assert (=> b!1269798 (= res!845030 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28447))))

(declare-fun mapIsEmpty!50764 () Bool)

(assert (=> mapIsEmpty!50764 mapRes!50764))

(declare-fun b!1269796 () Bool)

(declare-fun res!845026 () Bool)

(assert (=> b!1269796 (=> (not res!845026) (not e!723749))))

(assert (=> b!1269796 (= res!845026 (and (= (size!40493 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40494 _keys!1364) (size!40493 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845029 () Bool)

(assert (=> start!107100 (=> (not res!845029) (not e!723749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107100 (= res!845029 (validMask!0 mask!1730))))

(assert (=> start!107100 e!723749))

(declare-fun e!723750 () Bool)

(declare-fun array_inv!30395 (array!82840) Bool)

(assert (=> start!107100 (and (array_inv!30395 _values!1134) e!723750)))

(assert (=> start!107100 true))

(declare-fun array_inv!30396 (array!82842) Bool)

(assert (=> start!107100 (array_inv!30396 _keys!1364)))

(assert (=> start!107100 tp_is_empty!32789))

(assert (=> start!107100 tp!97042))

(declare-fun b!1269799 () Bool)

(declare-fun res!845027 () Bool)

(assert (=> b!1269799 (=> (not res!845027) (not e!723749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82842 (_ BitVec 32)) Bool)

(assert (=> b!1269799 (= res!845027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269800 () Bool)

(assert (=> b!1269800 (= e!723753 tp_is_empty!32789)))

(declare-fun b!1269801 () Bool)

(assert (=> b!1269801 (= e!723750 (and e!723751 mapRes!50764))))

(declare-fun condMapEmpty!50764 () Bool)

(declare-fun mapDefault!50764 () ValueCell!15541)

