; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108078 () Bool)

(assert start!108078)

(declare-fun b_free!27791 () Bool)

(declare-fun b_next!27791 () Bool)

(assert (=> start!108078 (= b_free!27791 (not b_next!27791))))

(declare-fun tp!98326 () Bool)

(declare-fun b_and!45847 () Bool)

(assert (=> start!108078 (= tp!98326 b_and!45847)))

(declare-fun b!1276376 () Bool)

(declare-fun e!728839 () Bool)

(declare-fun tp_is_empty!33341 () Bool)

(assert (=> b!1276376 (= e!728839 tp_is_empty!33341)))

(declare-fun res!848247 () Bool)

(declare-fun e!728840 () Bool)

(assert (=> start!108078 (=> (not res!848247) (not e!728840))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108078 (= res!848247 (validMask!0 mask!1805))))

(assert (=> start!108078 e!728840))

(assert (=> start!108078 true))

(assert (=> start!108078 tp!98326))

(assert (=> start!108078 tp_is_empty!33341))

(declare-datatypes ((V!49557 0))(
  ( (V!49558 (val!16745 Int)) )
))
(declare-datatypes ((ValueCell!15772 0))(
  ( (ValueCellFull!15772 (v!19342 V!49557)) (EmptyCell!15772) )
))
(declare-datatypes ((array!83776 0))(
  ( (array!83777 (arr!40399 (Array (_ BitVec 32) ValueCell!15772)) (size!40949 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83776)

(declare-fun e!728837 () Bool)

(declare-fun array_inv!30703 (array!83776) Bool)

(assert (=> start!108078 (and (array_inv!30703 _values!1187) e!728837)))

(declare-datatypes ((array!83778 0))(
  ( (array!83779 (arr!40400 (Array (_ BitVec 32) (_ BitVec 64))) (size!40950 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83778)

(declare-fun array_inv!30704 (array!83778) Bool)

(assert (=> start!108078 (array_inv!30704 _keys!1427)))

(declare-fun b!1276377 () Bool)

(declare-fun e!728838 () Bool)

(assert (=> b!1276377 (= e!728838 tp_is_empty!33341)))

(declare-fun b!1276378 () Bool)

(declare-fun res!848250 () Bool)

(assert (=> b!1276378 (=> (not res!848250) (not e!728840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83778 (_ BitVec 32)) Bool)

(assert (=> b!1276378 (= res!848250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276379 () Bool)

(declare-fun res!848248 () Bool)

(assert (=> b!1276379 (=> (not res!848248) (not e!728840))))

(declare-datatypes ((List!28651 0))(
  ( (Nil!28648) (Cons!28647 (h!29856 (_ BitVec 64)) (t!42187 List!28651)) )
))
(declare-fun arrayNoDuplicates!0 (array!83778 (_ BitVec 32) List!28651) Bool)

(assert (=> b!1276379 (= res!848248 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28648))))

(declare-fun mapIsEmpty!51542 () Bool)

(declare-fun mapRes!51542 () Bool)

(assert (=> mapIsEmpty!51542 mapRes!51542))

(declare-fun b!1276380 () Bool)

(assert (=> b!1276380 (= e!728837 (and e!728838 mapRes!51542))))

(declare-fun condMapEmpty!51542 () Bool)

(declare-fun mapDefault!51542 () ValueCell!15772)

