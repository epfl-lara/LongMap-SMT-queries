; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107052 () Bool)

(assert start!107052)

(declare-fun b_free!27557 () Bool)

(declare-fun b_next!27557 () Bool)

(assert (=> start!107052 (= b_free!27557 (not b_next!27557))))

(declare-fun tp!96898 () Bool)

(declare-fun b_and!45589 () Bool)

(assert (=> start!107052 (= tp!96898 b_and!45589)))

(declare-fun b!1269219 () Bool)

(declare-fun res!844666 () Bool)

(declare-fun e!723392 () Bool)

(assert (=> b!1269219 (=> (not res!844666) (not e!723392))))

(declare-datatypes ((array!82746 0))(
  ( (array!82747 (arr!39910 (Array (_ BitVec 32) (_ BitVec 64))) (size!40446 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82746)

(declare-datatypes ((List!28416 0))(
  ( (Nil!28413) (Cons!28412 (h!29621 (_ BitVec 64)) (t!41945 List!28416)) )
))
(declare-fun arrayNoDuplicates!0 (array!82746 (_ BitVec 32) List!28416) Bool)

(assert (=> b!1269219 (= res!844666 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28413))))

(declare-fun mapIsEmpty!50692 () Bool)

(declare-fun mapRes!50692 () Bool)

(assert (=> mapIsEmpty!50692 mapRes!50692))

(declare-fun b!1269220 () Bool)

(declare-fun e!723393 () Bool)

(declare-fun tp_is_empty!32741 () Bool)

(assert (=> b!1269220 (= e!723393 tp_is_empty!32741)))

(declare-fun res!844669 () Bool)

(assert (=> start!107052 (=> (not res!844669) (not e!723392))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107052 (= res!844669 (validMask!0 mask!1730))))

(assert (=> start!107052 e!723392))

(declare-datatypes ((V!48847 0))(
  ( (V!48848 (val!16445 Int)) )
))
(declare-datatypes ((ValueCell!15517 0))(
  ( (ValueCellFull!15517 (v!19082 V!48847)) (EmptyCell!15517) )
))
(declare-datatypes ((array!82748 0))(
  ( (array!82749 (arr!39911 (Array (_ BitVec 32) ValueCell!15517)) (size!40447 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82748)

(declare-fun e!723390 () Bool)

(declare-fun array_inv!30365 (array!82748) Bool)

(assert (=> start!107052 (and (array_inv!30365 _values!1134) e!723390)))

(assert (=> start!107052 true))

(declare-fun array_inv!30366 (array!82746) Bool)

(assert (=> start!107052 (array_inv!30366 _keys!1364)))

(assert (=> start!107052 tp_is_empty!32741))

(assert (=> start!107052 tp!96898))

(declare-fun b!1269221 () Bool)

(declare-fun res!844670 () Bool)

(assert (=> b!1269221 (=> (not res!844670) (not e!723392))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269221 (= res!844670 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40446 _keys!1364)) (bvslt from!1698 (size!40446 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269222 () Bool)

(declare-fun res!844668 () Bool)

(assert (=> b!1269222 (=> (not res!844668) (not e!723392))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269222 (= res!844668 (and (= (size!40447 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40446 _keys!1364) (size!40447 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50692 () Bool)

(declare-fun tp!96897 () Bool)

(declare-fun e!723391 () Bool)

(assert (=> mapNonEmpty!50692 (= mapRes!50692 (and tp!96897 e!723391))))

(declare-fun mapRest!50692 () (Array (_ BitVec 32) ValueCell!15517))

(declare-fun mapValue!50692 () ValueCell!15517)

(declare-fun mapKey!50692 () (_ BitVec 32))

(assert (=> mapNonEmpty!50692 (= (arr!39911 _values!1134) (store mapRest!50692 mapKey!50692 mapValue!50692))))

(declare-fun b!1269223 () Bool)

(assert (=> b!1269223 (= e!723391 tp_is_empty!32741)))

(declare-fun b!1269224 () Bool)

(assert (=> b!1269224 (= e!723390 (and e!723393 mapRes!50692))))

(declare-fun condMapEmpty!50692 () Bool)

(declare-fun mapDefault!50692 () ValueCell!15517)

