; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108192 () Bool)

(assert start!108192)

(declare-fun b_free!27887 () Bool)

(declare-fun b_next!27887 () Bool)

(assert (=> start!108192 (= b_free!27887 (not b_next!27887))))

(declare-fun tp!98618 () Bool)

(declare-fun b_and!45945 () Bool)

(assert (=> start!108192 (= tp!98618 b_and!45945)))

(declare-fun b!1277613 () Bool)

(declare-fun e!729668 () Bool)

(assert (=> b!1277613 (= e!729668 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun lt!575722 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49685 0))(
  ( (V!49686 (val!16793 Int)) )
))
(declare-fun minValue!1129 () V!49685)

(declare-fun k!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15820 0))(
  ( (ValueCellFull!15820 (v!19391 V!49685)) (EmptyCell!15820) )
))
(declare-datatypes ((array!83968 0))(
  ( (array!83969 (arr!40494 (Array (_ BitVec 32) ValueCell!15820)) (size!41044 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83968)

(declare-fun zeroValue!1129 () V!49685)

(declare-datatypes ((array!83970 0))(
  ( (array!83971 (arr!40495 (Array (_ BitVec 32) (_ BitVec 64))) (size!41045 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83970)

(declare-datatypes ((tuple2!21540 0))(
  ( (tuple2!21541 (_1!10781 (_ BitVec 64)) (_2!10781 V!49685)) )
))
(declare-datatypes ((List!28717 0))(
  ( (Nil!28714) (Cons!28713 (h!29922 tuple2!21540) (t!42255 List!28717)) )
))
(declare-datatypes ((ListLongMap!19197 0))(
  ( (ListLongMap!19198 (toList!9614 List!28717)) )
))
(declare-fun contains!7724 (ListLongMap!19197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4698 (array!83970 array!83968 (_ BitVec 32) (_ BitVec 32) V!49685 V!49685 (_ BitVec 32) Int) ListLongMap!19197)

(assert (=> b!1277613 (= lt!575722 (contains!7724 (getCurrentListMap!4698 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun mapNonEmpty!51689 () Bool)

(declare-fun mapRes!51689 () Bool)

(declare-fun tp!98617 () Bool)

(declare-fun e!729669 () Bool)

(assert (=> mapNonEmpty!51689 (= mapRes!51689 (and tp!98617 e!729669))))

(declare-fun mapValue!51689 () ValueCell!15820)

(declare-fun mapKey!51689 () (_ BitVec 32))

(declare-fun mapRest!51689 () (Array (_ BitVec 32) ValueCell!15820))

(assert (=> mapNonEmpty!51689 (= (arr!40494 _values!1187) (store mapRest!51689 mapKey!51689 mapValue!51689))))

(declare-fun res!848928 () Bool)

(assert (=> start!108192 (=> (not res!848928) (not e!729668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108192 (= res!848928 (validMask!0 mask!1805))))

(assert (=> start!108192 e!729668))

(assert (=> start!108192 true))

(assert (=> start!108192 tp!98618))

(declare-fun tp_is_empty!33437 () Bool)

(assert (=> start!108192 tp_is_empty!33437))

(declare-fun e!729667 () Bool)

(declare-fun array_inv!30765 (array!83968) Bool)

(assert (=> start!108192 (and (array_inv!30765 _values!1187) e!729667)))

(declare-fun array_inv!30766 (array!83970) Bool)

(assert (=> start!108192 (array_inv!30766 _keys!1427)))

(declare-fun b!1277614 () Bool)

(declare-fun e!729666 () Bool)

(assert (=> b!1277614 (= e!729667 (and e!729666 mapRes!51689))))

(declare-fun condMapEmpty!51689 () Bool)

(declare-fun mapDefault!51689 () ValueCell!15820)

