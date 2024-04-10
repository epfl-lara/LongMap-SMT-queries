; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74414 () Bool)

(assert start!74414)

(declare-fun b_free!15157 () Bool)

(declare-fun b_next!15157 () Bool)

(assert (=> start!74414 (= b_free!15157 (not b_next!15157))))

(declare-fun tp!53148 () Bool)

(declare-fun b_and!24967 () Bool)

(assert (=> start!74414 (= tp!53148 b_and!24967)))

(declare-fun b!876200 () Bool)

(declare-fun res!595402 () Bool)

(declare-fun e!487772 () Bool)

(assert (=> b!876200 (=> (not res!595402) (not e!487772))))

(declare-datatypes ((array!50928 0))(
  ( (array!50929 (arr!24491 (Array (_ BitVec 32) (_ BitVec 64))) (size!24931 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50928)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50928 (_ BitVec 32)) Bool)

(assert (=> b!876200 (= res!595402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876201 () Bool)

(declare-fun e!487767 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((V!28249 0))(
  ( (V!28250 (val!8748 Int)) )
))
(declare-datatypes ((ValueCell!8261 0))(
  ( (ValueCellFull!8261 (v!11181 V!28249)) (EmptyCell!8261) )
))
(declare-datatypes ((array!50930 0))(
  ( (array!50931 (arr!24492 (Array (_ BitVec 32) ValueCell!8261)) (size!24932 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50930)

(assert (=> b!876201 (= e!487767 (bvslt from!1053 (size!24932 _values!688)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11564 0))(
  ( (tuple2!11565 (_1!5793 (_ BitVec 64)) (_2!5793 V!28249)) )
))
(declare-datatypes ((List!17383 0))(
  ( (Nil!17380) (Cons!17379 (h!18510 tuple2!11564) (t!24444 List!17383)) )
))
(declare-datatypes ((ListLongMap!10333 0))(
  ( (ListLongMap!10334 (toList!5182 List!17383)) )
))
(declare-fun lt!396423 () ListLongMap!10333)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28249)

(declare-fun zeroValue!654 () V!28249)

(declare-fun lt!396422 () array!50930)

(declare-fun +!2483 (ListLongMap!10333 tuple2!11564) ListLongMap!10333)

(declare-fun getCurrentListMapNoExtraKeys!3149 (array!50928 array!50930 (_ BitVec 32) (_ BitVec 32) V!28249 V!28249 (_ BitVec 32) Int) ListLongMap!10333)

(declare-fun get!12879 (ValueCell!8261 V!28249) V!28249)

(declare-fun dynLambda!1211 (Int (_ BitVec 64)) V!28249)

(assert (=> b!876201 (= lt!396423 (+!2483 (getCurrentListMapNoExtraKeys!3149 _keys!868 lt!396422 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11565 (select (arr!24491 _keys!868) from!1053) (get!12879 (select (arr!24492 lt!396422) from!1053) (dynLambda!1211 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876202 () Bool)

(declare-fun e!487766 () Bool)

(declare-fun tp_is_empty!17401 () Bool)

(assert (=> b!876202 (= e!487766 tp_is_empty!17401)))

(declare-fun b!876203 () Bool)

(declare-fun res!595400 () Bool)

(assert (=> b!876203 (=> (not res!595400) (not e!487772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876203 (= res!595400 (validMask!0 mask!1196))))

(declare-fun b!876204 () Bool)

(declare-fun e!487771 () Bool)

(assert (=> b!876204 (= e!487771 tp_is_empty!17401)))

(declare-fun b!876205 () Bool)

(declare-fun res!595405 () Bool)

(assert (=> b!876205 (=> (not res!595405) (not e!487772))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!876205 (= res!595405 (and (= (select (arr!24491 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27713 () Bool)

(declare-fun mapRes!27713 () Bool)

(assert (=> mapIsEmpty!27713 mapRes!27713))

(declare-fun b!876206 () Bool)

(declare-fun res!595406 () Bool)

(assert (=> b!876206 (=> (not res!595406) (not e!487772))))

(assert (=> b!876206 (= res!595406 (and (= (size!24932 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24931 _keys!868) (size!24932 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!595409 () Bool)

(assert (=> start!74414 (=> (not res!595409) (not e!487772))))

(assert (=> start!74414 (= res!595409 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24931 _keys!868))))))

(assert (=> start!74414 e!487772))

(assert (=> start!74414 tp_is_empty!17401))

(assert (=> start!74414 true))

(assert (=> start!74414 tp!53148))

(declare-fun array_inv!19308 (array!50928) Bool)

(assert (=> start!74414 (array_inv!19308 _keys!868)))

(declare-fun e!487770 () Bool)

(declare-fun array_inv!19309 (array!50930) Bool)

(assert (=> start!74414 (and (array_inv!19309 _values!688) e!487770)))

(declare-fun b!876207 () Bool)

(assert (=> b!876207 (= e!487770 (and e!487766 mapRes!27713))))

(declare-fun condMapEmpty!27713 () Bool)

(declare-fun mapDefault!27713 () ValueCell!8261)

