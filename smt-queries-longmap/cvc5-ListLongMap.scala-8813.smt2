; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107102 () Bool)

(assert start!107102)

(declare-fun b_free!27607 () Bool)

(declare-fun b_next!27607 () Bool)

(assert (=> start!107102 (= b_free!27607 (not b_next!27607))))

(declare-fun tp!97047 () Bool)

(declare-fun b_and!45639 () Bool)

(assert (=> start!107102 (= tp!97047 b_and!45639)))

(declare-fun mapNonEmpty!50767 () Bool)

(declare-fun mapRes!50767 () Bool)

(declare-fun tp!97048 () Bool)

(declare-fun e!723767 () Bool)

(assert (=> mapNonEmpty!50767 (= mapRes!50767 (and tp!97048 e!723767))))

(declare-datatypes ((V!48915 0))(
  ( (V!48916 (val!16470 Int)) )
))
(declare-datatypes ((ValueCell!15542 0))(
  ( (ValueCellFull!15542 (v!19107 V!48915)) (EmptyCell!15542) )
))
(declare-datatypes ((array!82844 0))(
  ( (array!82845 (arr!39959 (Array (_ BitVec 32) ValueCell!15542)) (size!40495 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82844)

(declare-fun mapValue!50767 () ValueCell!15542)

(declare-fun mapRest!50767 () (Array (_ BitVec 32) ValueCell!15542))

(declare-fun mapKey!50767 () (_ BitVec 32))

(assert (=> mapNonEmpty!50767 (= (arr!39959 _values!1134) (store mapRest!50767 mapKey!50767 mapValue!50767))))

(declare-fun b!1269819 () Bool)

(declare-fun res!845043 () Bool)

(declare-fun e!723764 () Bool)

(assert (=> b!1269819 (=> (not res!845043) (not e!723764))))

(declare-datatypes ((array!82846 0))(
  ( (array!82847 (arr!39960 (Array (_ BitVec 32) (_ BitVec 64))) (size!40496 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82846)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1269819 (= res!845043 (and (= (size!40495 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40496 _keys!1364) (size!40495 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269820 () Bool)

(declare-fun res!845044 () Bool)

(assert (=> b!1269820 (=> (not res!845044) (not e!723764))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269820 (= res!845044 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40496 _keys!1364)) (bvslt from!1698 (size!40496 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269821 () Bool)

(declare-fun e!723768 () Bool)

(declare-fun e!723765 () Bool)

(assert (=> b!1269821 (= e!723768 (and e!723765 mapRes!50767))))

(declare-fun condMapEmpty!50767 () Bool)

(declare-fun mapDefault!50767 () ValueCell!15542)

