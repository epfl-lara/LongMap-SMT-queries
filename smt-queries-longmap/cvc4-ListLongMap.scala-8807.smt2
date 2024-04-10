; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107070 () Bool)

(assert start!107070)

(declare-fun b_free!27575 () Bool)

(declare-fun b_next!27575 () Bool)

(assert (=> start!107070 (= b_free!27575 (not b_next!27575))))

(declare-fun tp!96952 () Bool)

(declare-fun b_and!45607 () Bool)

(assert (=> start!107070 (= tp!96952 b_and!45607)))

(declare-fun b!1269435 () Bool)

(declare-fun res!844801 () Bool)

(declare-fun e!723526 () Bool)

(assert (=> b!1269435 (=> (not res!844801) (not e!723526))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82780 0))(
  ( (array!82781 (arr!39927 (Array (_ BitVec 32) (_ BitVec 64))) (size!40463 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82780)

(assert (=> b!1269435 (= res!844801 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40463 _keys!1364)) (bvslt from!1698 (size!40463 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50719 () Bool)

(declare-fun mapRes!50719 () Bool)

(declare-fun tp!96951 () Bool)

(declare-fun e!723527 () Bool)

(assert (=> mapNonEmpty!50719 (= mapRes!50719 (and tp!96951 e!723527))))

(declare-datatypes ((V!48871 0))(
  ( (V!48872 (val!16454 Int)) )
))
(declare-datatypes ((ValueCell!15526 0))(
  ( (ValueCellFull!15526 (v!19091 V!48871)) (EmptyCell!15526) )
))
(declare-datatypes ((array!82782 0))(
  ( (array!82783 (arr!39928 (Array (_ BitVec 32) ValueCell!15526)) (size!40464 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82782)

(declare-fun mapValue!50719 () ValueCell!15526)

(declare-fun mapKey!50719 () (_ BitVec 32))

(declare-fun mapRest!50719 () (Array (_ BitVec 32) ValueCell!15526))

(assert (=> mapNonEmpty!50719 (= (arr!39928 _values!1134) (store mapRest!50719 mapKey!50719 mapValue!50719))))

(declare-fun b!1269436 () Bool)

(declare-fun tp_is_empty!32759 () Bool)

(assert (=> b!1269436 (= e!723527 tp_is_empty!32759)))

(declare-fun b!1269437 () Bool)

(declare-fun res!844804 () Bool)

(assert (=> b!1269437 (=> (not res!844804) (not e!723526))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82780 (_ BitVec 32)) Bool)

(assert (=> b!1269437 (= res!844804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50719 () Bool)

(assert (=> mapIsEmpty!50719 mapRes!50719))

(declare-fun b!1269438 () Bool)

(declare-fun res!844805 () Bool)

(assert (=> b!1269438 (=> (not res!844805) (not e!723526))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269438 (= res!844805 (and (= (size!40464 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40463 _keys!1364) (size!40464 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269439 () Bool)

(declare-fun res!844802 () Bool)

(assert (=> b!1269439 (=> (not res!844802) (not e!723526))))

(declare-datatypes ((List!28425 0))(
  ( (Nil!28422) (Cons!28421 (h!29630 (_ BitVec 64)) (t!41954 List!28425)) )
))
(declare-fun arrayNoDuplicates!0 (array!82780 (_ BitVec 32) List!28425) Bool)

(assert (=> b!1269439 (= res!844802 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28422))))

(declare-fun b!1269440 () Bool)

(declare-fun e!723528 () Bool)

(declare-fun e!723525 () Bool)

(assert (=> b!1269440 (= e!723528 (and e!723525 mapRes!50719))))

(declare-fun condMapEmpty!50719 () Bool)

(declare-fun mapDefault!50719 () ValueCell!15526)

