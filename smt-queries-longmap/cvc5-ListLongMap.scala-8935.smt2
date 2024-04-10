; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108336 () Bool)

(assert start!108336)

(declare-fun mapNonEmpty!51836 () Bool)

(declare-fun mapRes!51836 () Bool)

(declare-fun tp!98810 () Bool)

(declare-fun e!730487 () Bool)

(assert (=> mapNonEmpty!51836 (= mapRes!51836 (and tp!98810 e!730487))))

(declare-datatypes ((V!49801 0))(
  ( (V!49802 (val!16836 Int)) )
))
(declare-datatypes ((ValueCell!15863 0))(
  ( (ValueCellFull!15863 (v!19436 V!49801)) (EmptyCell!15863) )
))
(declare-fun mapValue!51836 () ValueCell!15863)

(declare-datatypes ((array!84138 0))(
  ( (array!84139 (arr!40573 (Array (_ BitVec 32) ValueCell!15863)) (size!41123 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84138)

(declare-fun mapKey!51836 () (_ BitVec 32))

(declare-fun mapRest!51836 () (Array (_ BitVec 32) ValueCell!15863))

(assert (=> mapNonEmpty!51836 (= (arr!40573 _values!1445) (store mapRest!51836 mapKey!51836 mapValue!51836))))

(declare-fun b!1278695 () Bool)

(declare-fun e!730490 () Bool)

(declare-fun tp_is_empty!33523 () Bool)

(assert (=> b!1278695 (= e!730490 tp_is_empty!33523)))

(declare-fun res!849478 () Bool)

(declare-fun e!730486 () Bool)

(assert (=> start!108336 (=> (not res!849478) (not e!730486))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108336 (= res!849478 (validMask!0 mask!2175))))

(assert (=> start!108336 e!730486))

(assert (=> start!108336 true))

(declare-fun e!730489 () Bool)

(declare-fun array_inv!30815 (array!84138) Bool)

(assert (=> start!108336 (and (array_inv!30815 _values!1445) e!730489)))

(declare-datatypes ((array!84140 0))(
  ( (array!84141 (arr!40574 (Array (_ BitVec 32) (_ BitVec 64))) (size!41124 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84140)

(declare-fun array_inv!30816 (array!84140) Bool)

(assert (=> start!108336 (array_inv!30816 _keys!1741)))

(declare-fun b!1278696 () Bool)

(assert (=> b!1278696 (= e!730486 false)))

(declare-fun lt!575915 () Bool)

(declare-datatypes ((List!28746 0))(
  ( (Nil!28743) (Cons!28742 (h!29951 (_ BitVec 64)) (t!42286 List!28746)) )
))
(declare-fun arrayNoDuplicates!0 (array!84140 (_ BitVec 32) List!28746) Bool)

(assert (=> b!1278696 (= lt!575915 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28743))))

(declare-fun b!1278697 () Bool)

(assert (=> b!1278697 (= e!730489 (and e!730490 mapRes!51836))))

(declare-fun condMapEmpty!51836 () Bool)

(declare-fun mapDefault!51836 () ValueCell!15863)

