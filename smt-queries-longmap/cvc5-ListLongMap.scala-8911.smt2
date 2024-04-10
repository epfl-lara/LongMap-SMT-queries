; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108116 () Bool)

(assert start!108116)

(declare-fun b_free!27829 () Bool)

(declare-fun b_next!27829 () Bool)

(assert (=> start!108116 (= b_free!27829 (not b_next!27829))))

(declare-fun tp!98441 () Bool)

(declare-fun b_and!45885 () Bool)

(assert (=> start!108116 (= tp!98441 b_and!45885)))

(declare-fun b!1276775 () Bool)

(declare-fun e!729126 () Bool)

(assert (=> b!1276775 (= e!729126 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun lt!575536 () Bool)

(declare-datatypes ((V!49609 0))(
  ( (V!49610 (val!16764 Int)) )
))
(declare-fun minValue!1129 () V!49609)

(declare-fun k!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15791 0))(
  ( (ValueCellFull!15791 (v!19361 V!49609)) (EmptyCell!15791) )
))
(declare-datatypes ((array!83850 0))(
  ( (array!83851 (arr!40436 (Array (_ BitVec 32) ValueCell!15791)) (size!40986 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83850)

(declare-fun zeroValue!1129 () V!49609)

(declare-datatypes ((array!83852 0))(
  ( (array!83853 (arr!40437 (Array (_ BitVec 32) (_ BitVec 64))) (size!40987 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83852)

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((tuple2!21498 0))(
  ( (tuple2!21499 (_1!10760 (_ BitVec 64)) (_2!10760 V!49609)) )
))
(declare-datatypes ((List!28674 0))(
  ( (Nil!28671) (Cons!28670 (h!29879 tuple2!21498) (t!42210 List!28674)) )
))
(declare-datatypes ((ListLongMap!19155 0))(
  ( (ListLongMap!19156 (toList!9593 List!28674)) )
))
(declare-fun contains!7702 (ListLongMap!19155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4677 (array!83852 array!83850 (_ BitVec 32) (_ BitVec 32) V!49609 V!49609 (_ BitVec 32) Int) ListLongMap!19155)

(assert (=> b!1276775 (= lt!575536 (contains!7702 (getCurrentListMap!4677 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1276776 () Bool)

(declare-fun res!848478 () Bool)

(assert (=> b!1276776 (=> (not res!848478) (not e!729126))))

(declare-datatypes ((List!28675 0))(
  ( (Nil!28672) (Cons!28671 (h!29880 (_ BitVec 64)) (t!42211 List!28675)) )
))
(declare-fun arrayNoDuplicates!0 (array!83852 (_ BitVec 32) List!28675) Bool)

(assert (=> b!1276776 (= res!848478 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28672))))

(declare-fun b!1276777 () Bool)

(declare-fun e!729124 () Bool)

(declare-fun tp_is_empty!33379 () Bool)

(assert (=> b!1276777 (= e!729124 tp_is_empty!33379)))

(declare-fun mapIsEmpty!51599 () Bool)

(declare-fun mapRes!51599 () Bool)

(assert (=> mapIsEmpty!51599 mapRes!51599))

(declare-fun b!1276778 () Bool)

(declare-fun e!729123 () Bool)

(assert (=> b!1276778 (= e!729123 (and e!729124 mapRes!51599))))

(declare-fun condMapEmpty!51599 () Bool)

(declare-fun mapDefault!51599 () ValueCell!15791)

