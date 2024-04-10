; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74186 () Bool)

(assert start!74186)

(declare-fun b!872656 () Bool)

(declare-fun e!485991 () Bool)

(declare-fun tp_is_empty!17225 () Bool)

(assert (=> b!872656 (= e!485991 tp_is_empty!17225)))

(declare-fun b!872657 () Bool)

(declare-fun e!485994 () Bool)

(assert (=> b!872657 (= e!485994 tp_is_empty!17225)))

(declare-fun mapNonEmpty!27440 () Bool)

(declare-fun mapRes!27440 () Bool)

(declare-fun tp!52639 () Bool)

(assert (=> mapNonEmpty!27440 (= mapRes!27440 (and tp!52639 e!485994))))

(declare-datatypes ((V!28013 0))(
  ( (V!28014 (val!8660 Int)) )
))
(declare-datatypes ((ValueCell!8173 0))(
  ( (ValueCellFull!8173 (v!11085 V!28013)) (EmptyCell!8173) )
))
(declare-fun mapRest!27440 () (Array (_ BitVec 32) ValueCell!8173))

(declare-fun mapValue!27440 () ValueCell!8173)

(declare-fun mapKey!27440 () (_ BitVec 32))

(declare-datatypes ((array!50580 0))(
  ( (array!50581 (arr!24320 (Array (_ BitVec 32) ValueCell!8173)) (size!24760 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50580)

(assert (=> mapNonEmpty!27440 (= (arr!24320 _values!688) (store mapRest!27440 mapKey!27440 mapValue!27440))))

(declare-fun b!872658 () Bool)

(declare-fun res!593081 () Bool)

(declare-fun e!485992 () Bool)

(assert (=> b!872658 (=> (not res!593081) (not e!485992))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50582 0))(
  ( (array!50583 (arr!24321 (Array (_ BitVec 32) (_ BitVec 64))) (size!24761 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50582)

(assert (=> b!872658 (= res!593081 (and (= (size!24760 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24761 _keys!868) (size!24760 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872659 () Bool)

(declare-fun e!485993 () Bool)

(assert (=> b!872659 (= e!485993 (and e!485991 mapRes!27440))))

(declare-fun condMapEmpty!27440 () Bool)

(declare-fun mapDefault!27440 () ValueCell!8173)

