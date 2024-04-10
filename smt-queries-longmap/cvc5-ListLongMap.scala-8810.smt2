; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107084 () Bool)

(assert start!107084)

(declare-fun b_free!27589 () Bool)

(declare-fun b_next!27589 () Bool)

(assert (=> start!107084 (= b_free!27589 (not b_next!27589))))

(declare-fun tp!96994 () Bool)

(declare-fun b_and!45621 () Bool)

(assert (=> start!107084 (= tp!96994 b_and!45621)))

(declare-fun b!1269603 () Bool)

(declare-fun res!844908 () Bool)

(declare-fun e!723629 () Bool)

(assert (=> b!1269603 (=> (not res!844908) (not e!723629))))

(declare-datatypes ((array!82808 0))(
  ( (array!82809 (arr!39941 (Array (_ BitVec 32) (_ BitVec 64))) (size!40477 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82808)

(declare-datatypes ((List!28436 0))(
  ( (Nil!28433) (Cons!28432 (h!29641 (_ BitVec 64)) (t!41965 List!28436)) )
))
(declare-fun arrayNoDuplicates!0 (array!82808 (_ BitVec 32) List!28436) Bool)

(assert (=> b!1269603 (= res!844908 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28433))))

(declare-fun b!1269604 () Bool)

(declare-fun res!844907 () Bool)

(assert (=> b!1269604 (=> (not res!844907) (not e!723629))))

(declare-datatypes ((V!48891 0))(
  ( (V!48892 (val!16461 Int)) )
))
(declare-datatypes ((ValueCell!15533 0))(
  ( (ValueCellFull!15533 (v!19098 V!48891)) (EmptyCell!15533) )
))
(declare-datatypes ((array!82810 0))(
  ( (array!82811 (arr!39942 (Array (_ BitVec 32) ValueCell!15533)) (size!40478 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82810)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269604 (= res!844907 (and (= (size!40478 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40477 _keys!1364) (size!40478 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269605 () Bool)

(declare-fun res!844910 () Bool)

(assert (=> b!1269605 (=> (not res!844910) (not e!723629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82808 (_ BitVec 32)) Bool)

(assert (=> b!1269605 (= res!844910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269606 () Bool)

(declare-fun res!844906 () Bool)

(assert (=> b!1269606 (=> (not res!844906) (not e!723629))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269606 (= res!844906 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40477 _keys!1364)) (bvslt from!1698 (size!40477 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun res!844909 () Bool)

(assert (=> start!107084 (=> (not res!844909) (not e!723629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107084 (= res!844909 (validMask!0 mask!1730))))

(assert (=> start!107084 e!723629))

(declare-fun e!723630 () Bool)

(declare-fun array_inv!30383 (array!82810) Bool)

(assert (=> start!107084 (and (array_inv!30383 _values!1134) e!723630)))

(assert (=> start!107084 true))

(declare-fun array_inv!30384 (array!82808) Bool)

(assert (=> start!107084 (array_inv!30384 _keys!1364)))

(declare-fun tp_is_empty!32773 () Bool)

(assert (=> start!107084 tp_is_empty!32773))

(assert (=> start!107084 tp!96994))

(declare-fun b!1269607 () Bool)

(declare-fun e!723633 () Bool)

(assert (=> b!1269607 (= e!723633 tp_is_empty!32773)))

(declare-fun mapIsEmpty!50740 () Bool)

(declare-fun mapRes!50740 () Bool)

(assert (=> mapIsEmpty!50740 mapRes!50740))

(declare-fun mapNonEmpty!50740 () Bool)

(declare-fun tp!96993 () Bool)

(declare-fun e!723632 () Bool)

(assert (=> mapNonEmpty!50740 (= mapRes!50740 (and tp!96993 e!723632))))

(declare-fun mapRest!50740 () (Array (_ BitVec 32) ValueCell!15533))

(declare-fun mapValue!50740 () ValueCell!15533)

(declare-fun mapKey!50740 () (_ BitVec 32))

(assert (=> mapNonEmpty!50740 (= (arr!39942 _values!1134) (store mapRest!50740 mapKey!50740 mapValue!50740))))

(declare-fun b!1269608 () Bool)

(assert (=> b!1269608 (= e!723630 (and e!723633 mapRes!50740))))

(declare-fun condMapEmpty!50740 () Bool)

(declare-fun mapDefault!50740 () ValueCell!15533)

