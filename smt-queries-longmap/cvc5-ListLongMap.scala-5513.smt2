; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72862 () Bool)

(assert start!72862)

(declare-fun b_free!13777 () Bool)

(declare-fun b_next!13777 () Bool)

(assert (=> start!72862 (= b_free!13777 (not b_next!13777))))

(declare-fun tp!48835 () Bool)

(declare-fun b_and!22863 () Bool)

(assert (=> start!72862 (= tp!48835 b_and!22863)))

(declare-fun b!845704 () Bool)

(declare-fun res!574540 () Bool)

(declare-fun e!472084 () Bool)

(assert (=> b!845704 (=> (not res!574540) (not e!472084))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48044 0))(
  ( (array!48045 (arr!23053 (Array (_ BitVec 32) (_ BitVec 64))) (size!23493 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48044)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!845704 (= res!574540 (and (= (select (arr!23053 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!845706 () Bool)

(declare-fun e!472087 () Bool)

(declare-fun tp_is_empty!15913 () Bool)

(assert (=> b!845706 (= e!472087 tp_is_empty!15913)))

(declare-fun b!845707 () Bool)

(declare-fun res!574541 () Bool)

(assert (=> b!845707 (=> (not res!574541) (not e!472084))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48044 (_ BitVec 32)) Bool)

(assert (=> b!845707 (= res!574541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845708 () Bool)

(declare-fun e!472086 () Bool)

(assert (=> b!845708 (= e!472086 tp_is_empty!15913)))

(declare-fun b!845709 () Bool)

(assert (=> b!845709 (= e!472084 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26265 0))(
  ( (V!26266 (val!8004 Int)) )
))
(declare-datatypes ((ValueCell!7517 0))(
  ( (ValueCellFull!7517 (v!10429 V!26265)) (EmptyCell!7517) )
))
(declare-datatypes ((array!48046 0))(
  ( (array!48047 (arr!23054 (Array (_ BitVec 32) ValueCell!7517)) (size!23494 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48046)

(declare-fun minValue!654 () V!26265)

(declare-fun zeroValue!654 () V!26265)

(declare-datatypes ((tuple2!10452 0))(
  ( (tuple2!10453 (_1!5237 (_ BitVec 64)) (_2!5237 V!26265)) )
))
(declare-datatypes ((List!16314 0))(
  ( (Nil!16311) (Cons!16310 (h!17441 tuple2!10452) (t!22685 List!16314)) )
))
(declare-datatypes ((ListLongMap!9221 0))(
  ( (ListLongMap!9222 (toList!4626 List!16314)) )
))
(declare-fun lt!381436 () ListLongMap!9221)

(declare-fun getCurrentListMapNoExtraKeys!2611 (array!48044 array!48046 (_ BitVec 32) (_ BitVec 32) V!26265 V!26265 (_ BitVec 32) Int) ListLongMap!9221)

(assert (=> b!845709 (= lt!381436 (getCurrentListMapNoExtraKeys!2611 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845710 () Bool)

(declare-fun res!574537 () Bool)

(assert (=> b!845710 (=> (not res!574537) (not e!472084))))

(assert (=> b!845710 (= res!574537 (and (= (size!23494 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23493 _keys!868) (size!23494 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25469 () Bool)

(declare-fun mapRes!25469 () Bool)

(declare-fun tp!48834 () Bool)

(assert (=> mapNonEmpty!25469 (= mapRes!25469 (and tp!48834 e!472086))))

(declare-fun mapValue!25469 () ValueCell!7517)

(declare-fun mapKey!25469 () (_ BitVec 32))

(declare-fun mapRest!25469 () (Array (_ BitVec 32) ValueCell!7517))

(assert (=> mapNonEmpty!25469 (= (arr!23054 _values!688) (store mapRest!25469 mapKey!25469 mapValue!25469))))

(declare-fun b!845711 () Bool)

(declare-fun res!574534 () Bool)

(assert (=> b!845711 (=> (not res!574534) (not e!472084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845711 (= res!574534 (validMask!0 mask!1196))))

(declare-fun b!845712 () Bool)

(declare-fun res!574539 () Bool)

(assert (=> b!845712 (=> (not res!574539) (not e!472084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845712 (= res!574539 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!25469 () Bool)

(assert (=> mapIsEmpty!25469 mapRes!25469))

(declare-fun b!845713 () Bool)

(declare-fun res!574536 () Bool)

(assert (=> b!845713 (=> (not res!574536) (not e!472084))))

(declare-datatypes ((List!16315 0))(
  ( (Nil!16312) (Cons!16311 (h!17442 (_ BitVec 64)) (t!22686 List!16315)) )
))
(declare-fun arrayNoDuplicates!0 (array!48044 (_ BitVec 32) List!16315) Bool)

(assert (=> b!845713 (= res!574536 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16312))))

(declare-fun b!845714 () Bool)

(declare-fun res!574535 () Bool)

(assert (=> b!845714 (=> (not res!574535) (not e!472084))))

(assert (=> b!845714 (= res!574535 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23493 _keys!868))))))

(declare-fun b!845705 () Bool)

(declare-fun e!472083 () Bool)

(assert (=> b!845705 (= e!472083 (and e!472087 mapRes!25469))))

(declare-fun condMapEmpty!25469 () Bool)

(declare-fun mapDefault!25469 () ValueCell!7517)

