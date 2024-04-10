; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74262 () Bool)

(assert start!74262)

(declare-fun b_free!15025 () Bool)

(declare-fun b_next!15025 () Bool)

(assert (=> start!74262 (= b_free!15025 (not b_next!15025))))

(declare-fun tp!52750 () Bool)

(declare-fun b_and!24801 () Bool)

(assert (=> start!74262 (= tp!52750 b_and!24801)))

(declare-fun b!873587 () Bool)

(declare-fun res!593631 () Bool)

(declare-fun e!486484 () Bool)

(assert (=> b!873587 (=> (not res!593631) (not e!486484))))

(declare-datatypes ((array!50666 0))(
  ( (array!50667 (arr!24361 (Array (_ BitVec 32) (_ BitVec 64))) (size!24801 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50666)

(declare-datatypes ((List!17293 0))(
  ( (Nil!17290) (Cons!17289 (h!18420 (_ BitVec 64)) (t!24334 List!17293)) )
))
(declare-fun arrayNoDuplicates!0 (array!50666 (_ BitVec 32) List!17293) Bool)

(assert (=> b!873587 (= res!593631 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17290))))

(declare-fun b!873588 () Bool)

(declare-fun res!593630 () Bool)

(assert (=> b!873588 (=> (not res!593630) (not e!486484))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!873588 (= res!593630 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24801 _keys!868))))))

(declare-fun b!873589 () Bool)

(declare-datatypes ((V!28073 0))(
  ( (V!28074 (val!8682 Int)) )
))
(declare-datatypes ((ValueCell!8195 0))(
  ( (ValueCellFull!8195 (v!11111 V!28073)) (EmptyCell!8195) )
))
(declare-datatypes ((array!50668 0))(
  ( (array!50669 (arr!24362 (Array (_ BitVec 32) ValueCell!8195)) (size!24802 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50668)

(assert (=> b!873589 (= e!486484 (bvsge i!612 (size!24802 _values!688)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11476 0))(
  ( (tuple2!11477 (_1!5749 (_ BitVec 64)) (_2!5749 V!28073)) )
))
(declare-datatypes ((List!17294 0))(
  ( (Nil!17291) (Cons!17290 (h!18421 tuple2!11476) (t!24335 List!17294)) )
))
(declare-datatypes ((ListLongMap!10245 0))(
  ( (ListLongMap!10246 (toList!5138 List!17294)) )
))
(declare-fun lt!395795 () ListLongMap!10245)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28073)

(declare-fun zeroValue!654 () V!28073)

(declare-fun getCurrentListMapNoExtraKeys!3105 (array!50666 array!50668 (_ BitVec 32) (_ BitVec 32) V!28073 V!28073 (_ BitVec 32) Int) ListLongMap!10245)

(assert (=> b!873589 (= lt!395795 (getCurrentListMapNoExtraKeys!3105 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27512 () Bool)

(declare-fun mapRes!27512 () Bool)

(assert (=> mapIsEmpty!27512 mapRes!27512))

(declare-fun res!593627 () Bool)

(assert (=> start!74262 (=> (not res!593627) (not e!486484))))

(assert (=> start!74262 (= res!593627 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24801 _keys!868))))))

(assert (=> start!74262 e!486484))

(assert (=> start!74262 true))

(assert (=> start!74262 tp!52750))

(declare-fun array_inv!19218 (array!50666) Bool)

(assert (=> start!74262 (array_inv!19218 _keys!868)))

(declare-fun e!486483 () Bool)

(declare-fun array_inv!19219 (array!50668) Bool)

(assert (=> start!74262 (and (array_inv!19219 _values!688) e!486483)))

(declare-fun tp_is_empty!17269 () Bool)

(assert (=> start!74262 tp_is_empty!17269))

(declare-fun b!873590 () Bool)

(declare-fun res!593629 () Bool)

(assert (=> b!873590 (=> (not res!593629) (not e!486484))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!873590 (= res!593629 (and (= (select (arr!24361 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!873591 () Bool)

(declare-fun res!593632 () Bool)

(assert (=> b!873591 (=> (not res!593632) (not e!486484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873591 (= res!593632 (validMask!0 mask!1196))))

(declare-fun b!873592 () Bool)

(declare-fun res!593633 () Bool)

(assert (=> b!873592 (=> (not res!593633) (not e!486484))))

(assert (=> b!873592 (= res!593633 (and (= (size!24802 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24801 _keys!868) (size!24802 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873593 () Bool)

(declare-fun e!486482 () Bool)

(assert (=> b!873593 (= e!486483 (and e!486482 mapRes!27512))))

(declare-fun condMapEmpty!27512 () Bool)

(declare-fun mapDefault!27512 () ValueCell!8195)

