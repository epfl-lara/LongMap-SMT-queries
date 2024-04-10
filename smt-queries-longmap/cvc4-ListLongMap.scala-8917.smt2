; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108174 () Bool)

(assert start!108174)

(declare-fun b_free!27869 () Bool)

(declare-fun b_next!27869 () Bool)

(assert (=> start!108174 (= b_free!27869 (not b_next!27869))))

(declare-fun tp!98564 () Bool)

(declare-fun b_and!45927 () Bool)

(assert (=> start!108174 (= tp!98564 b_and!45927)))

(declare-fun b!1277424 () Bool)

(declare-fun res!848822 () Bool)

(declare-fun e!729532 () Bool)

(assert (=> b!1277424 (=> (not res!848822) (not e!729532))))

(declare-datatypes ((array!83932 0))(
  ( (array!83933 (arr!40476 (Array (_ BitVec 32) (_ BitVec 64))) (size!41026 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83932)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83932 (_ BitVec 32)) Bool)

(assert (=> b!1277424 (= res!848822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun res!848823 () Bool)

(assert (=> start!108174 (=> (not res!848823) (not e!729532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108174 (= res!848823 (validMask!0 mask!1805))))

(assert (=> start!108174 e!729532))

(assert (=> start!108174 true))

(assert (=> start!108174 tp!98564))

(declare-fun tp_is_empty!33419 () Bool)

(assert (=> start!108174 tp_is_empty!33419))

(declare-datatypes ((V!49661 0))(
  ( (V!49662 (val!16784 Int)) )
))
(declare-datatypes ((ValueCell!15811 0))(
  ( (ValueCellFull!15811 (v!19382 V!49661)) (EmptyCell!15811) )
))
(declare-datatypes ((array!83934 0))(
  ( (array!83935 (arr!40477 (Array (_ BitVec 32) ValueCell!15811)) (size!41027 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83934)

(declare-fun e!729531 () Bool)

(declare-fun array_inv!30753 (array!83934) Bool)

(assert (=> start!108174 (and (array_inv!30753 _values!1187) e!729531)))

(declare-fun array_inv!30754 (array!83932) Bool)

(assert (=> start!108174 (array_inv!30754 _keys!1427)))

(declare-fun b!1277425 () Bool)

(assert (=> b!1277425 (= e!729532 false)))

(declare-fun lt!575695 () Bool)

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49661)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49661)

(declare-datatypes ((tuple2!21528 0))(
  ( (tuple2!21529 (_1!10775 (_ BitVec 64)) (_2!10775 V!49661)) )
))
(declare-datatypes ((List!28705 0))(
  ( (Nil!28702) (Cons!28701 (h!29910 tuple2!21528) (t!42243 List!28705)) )
))
(declare-datatypes ((ListLongMap!19185 0))(
  ( (ListLongMap!19186 (toList!9608 List!28705)) )
))
(declare-fun contains!7718 (ListLongMap!19185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4692 (array!83932 array!83934 (_ BitVec 32) (_ BitVec 32) V!49661 V!49661 (_ BitVec 32) Int) ListLongMap!19185)

(assert (=> b!1277425 (= lt!575695 (contains!7718 (getCurrentListMap!4692 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1277426 () Bool)

(declare-fun e!729530 () Bool)

(assert (=> b!1277426 (= e!729530 tp_is_empty!33419)))

(declare-fun b!1277427 () Bool)

(declare-fun e!729534 () Bool)

(assert (=> b!1277427 (= e!729534 tp_is_empty!33419)))

(declare-fun mapIsEmpty!51662 () Bool)

(declare-fun mapRes!51662 () Bool)

(assert (=> mapIsEmpty!51662 mapRes!51662))

(declare-fun b!1277428 () Bool)

(declare-fun res!848820 () Bool)

(assert (=> b!1277428 (=> (not res!848820) (not e!729532))))

(declare-datatypes ((List!28706 0))(
  ( (Nil!28703) (Cons!28702 (h!29911 (_ BitVec 64)) (t!42244 List!28706)) )
))
(declare-fun arrayNoDuplicates!0 (array!83932 (_ BitVec 32) List!28706) Bool)

(assert (=> b!1277428 (= res!848820 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28703))))

(declare-fun b!1277429 () Bool)

(assert (=> b!1277429 (= e!729531 (and e!729530 mapRes!51662))))

(declare-fun condMapEmpty!51662 () Bool)

(declare-fun mapDefault!51662 () ValueCell!15811)

