; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107090 () Bool)

(assert start!107090)

(declare-fun b_free!27595 () Bool)

(declare-fun b_next!27595 () Bool)

(assert (=> start!107090 (= b_free!27595 (not b_next!27595))))

(declare-fun tp!97011 () Bool)

(declare-fun b_and!45627 () Bool)

(assert (=> start!107090 (= tp!97011 b_and!45627)))

(declare-fun mapIsEmpty!50749 () Bool)

(declare-fun mapRes!50749 () Bool)

(assert (=> mapIsEmpty!50749 mapRes!50749))

(declare-fun mapNonEmpty!50749 () Bool)

(declare-fun tp!97012 () Bool)

(declare-fun e!723675 () Bool)

(assert (=> mapNonEmpty!50749 (= mapRes!50749 (and tp!97012 e!723675))))

(declare-datatypes ((V!48899 0))(
  ( (V!48900 (val!16464 Int)) )
))
(declare-datatypes ((ValueCell!15536 0))(
  ( (ValueCellFull!15536 (v!19101 V!48899)) (EmptyCell!15536) )
))
(declare-datatypes ((array!82820 0))(
  ( (array!82821 (arr!39947 (Array (_ BitVec 32) ValueCell!15536)) (size!40483 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82820)

(declare-fun mapValue!50749 () ValueCell!15536)

(declare-fun mapRest!50749 () (Array (_ BitVec 32) ValueCell!15536))

(declare-fun mapKey!50749 () (_ BitVec 32))

(assert (=> mapNonEmpty!50749 (= (arr!39947 _values!1134) (store mapRest!50749 mapKey!50749 mapValue!50749))))

(declare-fun b!1269675 () Bool)

(declare-fun res!844955 () Bool)

(declare-fun e!723676 () Bool)

(assert (=> b!1269675 (=> (not res!844955) (not e!723676))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82822 0))(
  ( (array!82823 (arr!39948 (Array (_ BitVec 32) (_ BitVec 64))) (size!40484 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82822)

(assert (=> b!1269675 (= res!844955 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40484 _keys!1364)) (bvslt from!1698 (size!40484 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269676 () Bool)

(declare-fun res!844952 () Bool)

(assert (=> b!1269676 (=> (not res!844952) (not e!723676))))

(declare-datatypes ((List!28441 0))(
  ( (Nil!28438) (Cons!28437 (h!29646 (_ BitVec 64)) (t!41970 List!28441)) )
))
(declare-fun arrayNoDuplicates!0 (array!82822 (_ BitVec 32) List!28441) Bool)

(assert (=> b!1269676 (= res!844952 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28438))))

(declare-fun b!1269677 () Bool)

(declare-fun res!844951 () Bool)

(assert (=> b!1269677 (=> (not res!844951) (not e!723676))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269677 (= res!844951 (and (= (size!40483 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40484 _keys!1364) (size!40483 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269678 () Bool)

(declare-fun tp_is_empty!32779 () Bool)

(assert (=> b!1269678 (= e!723675 tp_is_empty!32779)))

(declare-fun b!1269679 () Bool)

(declare-fun e!723674 () Bool)

(declare-fun e!723678 () Bool)

(assert (=> b!1269679 (= e!723674 (and e!723678 mapRes!50749))))

(declare-fun condMapEmpty!50749 () Bool)

(declare-fun mapDefault!50749 () ValueCell!15536)

