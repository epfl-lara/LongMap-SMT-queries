; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108096 () Bool)

(assert start!108096)

(declare-fun b_free!27809 () Bool)

(declare-fun b_next!27809 () Bool)

(assert (=> start!108096 (= b_free!27809 (not b_next!27809))))

(declare-fun tp!98381 () Bool)

(declare-fun b_and!45865 () Bool)

(assert (=> start!108096 (= tp!98381 b_and!45865)))

(declare-fun res!848357 () Bool)

(declare-fun e!728973 () Bool)

(assert (=> start!108096 (=> (not res!848357) (not e!728973))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108096 (= res!848357 (validMask!0 mask!1805))))

(assert (=> start!108096 e!728973))

(assert (=> start!108096 true))

(assert (=> start!108096 tp!98381))

(declare-fun tp_is_empty!33359 () Bool)

(assert (=> start!108096 tp_is_empty!33359))

(declare-datatypes ((V!49581 0))(
  ( (V!49582 (val!16754 Int)) )
))
(declare-datatypes ((ValueCell!15781 0))(
  ( (ValueCellFull!15781 (v!19351 V!49581)) (EmptyCell!15781) )
))
(declare-datatypes ((array!83812 0))(
  ( (array!83813 (arr!40417 (Array (_ BitVec 32) ValueCell!15781)) (size!40967 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83812)

(declare-fun e!728972 () Bool)

(declare-fun array_inv!30717 (array!83812) Bool)

(assert (=> start!108096 (and (array_inv!30717 _values!1187) e!728972)))

(declare-datatypes ((array!83814 0))(
  ( (array!83815 (arr!40418 (Array (_ BitVec 32) (_ BitVec 64))) (size!40968 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83814)

(declare-fun array_inv!30718 (array!83814) Bool)

(assert (=> start!108096 (array_inv!30718 _keys!1427)))

(declare-fun b!1276565 () Bool)

(declare-fun res!848355 () Bool)

(assert (=> b!1276565 (=> (not res!848355) (not e!728973))))

(declare-datatypes ((List!28664 0))(
  ( (Nil!28661) (Cons!28660 (h!29869 (_ BitVec 64)) (t!42200 List!28664)) )
))
(declare-fun arrayNoDuplicates!0 (array!83814 (_ BitVec 32) List!28664) Bool)

(assert (=> b!1276565 (= res!848355 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28661))))

(declare-fun mapIsEmpty!51569 () Bool)

(declare-fun mapRes!51569 () Bool)

(assert (=> mapIsEmpty!51569 mapRes!51569))

(declare-fun b!1276566 () Bool)

(declare-fun e!728976 () Bool)

(assert (=> b!1276566 (= e!728976 tp_is_empty!33359)))

(declare-fun b!1276567 () Bool)

(declare-fun res!848358 () Bool)

(assert (=> b!1276567 (=> (not res!848358) (not e!728973))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276567 (= res!848358 (and (= (size!40967 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40968 _keys!1427) (size!40967 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276568 () Bool)

(assert (=> b!1276568 (= e!728973 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49581)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49581)

(declare-fun lt!575506 () Bool)

(declare-datatypes ((tuple2!21490 0))(
  ( (tuple2!21491 (_1!10756 (_ BitVec 64)) (_2!10756 V!49581)) )
))
(declare-datatypes ((List!28665 0))(
  ( (Nil!28662) (Cons!28661 (h!29870 tuple2!21490) (t!42201 List!28665)) )
))
(declare-datatypes ((ListLongMap!19147 0))(
  ( (ListLongMap!19148 (toList!9589 List!28665)) )
))
(declare-fun contains!7698 (ListLongMap!19147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4673 (array!83814 array!83812 (_ BitVec 32) (_ BitVec 32) V!49581 V!49581 (_ BitVec 32) Int) ListLongMap!19147)

(assert (=> b!1276568 (= lt!575506 (contains!7698 (getCurrentListMap!4673 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1276569 () Bool)

(declare-fun e!728975 () Bool)

(assert (=> b!1276569 (= e!728975 tp_is_empty!33359)))

(declare-fun b!1276570 () Bool)

(declare-fun res!848356 () Bool)

(assert (=> b!1276570 (=> (not res!848356) (not e!728973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83814 (_ BitVec 32)) Bool)

(assert (=> b!1276570 (= res!848356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276571 () Bool)

(assert (=> b!1276571 (= e!728972 (and e!728976 mapRes!51569))))

(declare-fun condMapEmpty!51569 () Bool)

(declare-fun mapDefault!51569 () ValueCell!15781)

