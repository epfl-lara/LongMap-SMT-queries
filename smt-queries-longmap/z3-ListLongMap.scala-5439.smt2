; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72586 () Bool)

(assert start!72586)

(declare-fun b_free!13603 () Bool)

(declare-fun b_next!13603 () Bool)

(assert (=> start!72586 (= b_free!13603 (not b_next!13603))))

(declare-fun tp!47909 () Bool)

(declare-fun b_and!22699 () Bool)

(assert (=> start!72586 (= tp!47909 b_and!22699)))

(declare-fun b!840473 () Bool)

(declare-fun res!571172 () Bool)

(declare-fun e!469125 () Bool)

(assert (=> b!840473 (=> (not res!571172) (not e!469125))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47233 0))(
  ( (array!47234 (arr!22643 (Array (_ BitVec 32) (_ BitVec 64))) (size!23084 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47233)

(declare-datatypes ((V!25673 0))(
  ( (V!25674 (val!7782 Int)) )
))
(declare-datatypes ((ValueCell!7295 0))(
  ( (ValueCellFull!7295 (v!10207 V!25673)) (EmptyCell!7295) )
))
(declare-datatypes ((array!47235 0))(
  ( (array!47236 (arr!22644 (Array (_ BitVec 32) ValueCell!7295)) (size!23085 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47235)

(assert (=> b!840473 (= res!571172 (and (= (size!23085 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23084 _keys!868) (size!23085 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24803 () Bool)

(declare-fun mapRes!24803 () Bool)

(declare-fun tp!47908 () Bool)

(declare-fun e!469121 () Bool)

(assert (=> mapNonEmpty!24803 (= mapRes!24803 (and tp!47908 e!469121))))

(declare-fun mapKey!24803 () (_ BitVec 32))

(declare-fun mapRest!24803 () (Array (_ BitVec 32) ValueCell!7295))

(declare-fun mapValue!24803 () ValueCell!7295)

(assert (=> mapNonEmpty!24803 (= (arr!22644 _values!688) (store mapRest!24803 mapKey!24803 mapValue!24803))))

(declare-fun res!571170 () Bool)

(assert (=> start!72586 (=> (not res!571170) (not e!469125))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72586 (= res!571170 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23084 _keys!868))))))

(assert (=> start!72586 e!469125))

(declare-fun tp_is_empty!15469 () Bool)

(assert (=> start!72586 tp_is_empty!15469))

(assert (=> start!72586 true))

(assert (=> start!72586 tp!47909))

(declare-fun array_inv!18072 (array!47233) Bool)

(assert (=> start!72586 (array_inv!18072 _keys!868)))

(declare-fun e!469126 () Bool)

(declare-fun array_inv!18073 (array!47235) Bool)

(assert (=> start!72586 (and (array_inv!18073 _values!688) e!469126)))

(declare-fun v!557 () V!25673)

(declare-fun b!840474 () Bool)

(declare-datatypes ((tuple2!10234 0))(
  ( (tuple2!10235 (_1!5128 (_ BitVec 64)) (_2!5128 V!25673)) )
))
(declare-datatypes ((List!16011 0))(
  ( (Nil!16008) (Cons!16007 (h!17144 tuple2!10234) (t!22374 List!16011)) )
))
(declare-datatypes ((ListLongMap!9005 0))(
  ( (ListLongMap!9006 (toList!4518 List!16011)) )
))
(declare-fun call!37087 () ListLongMap!9005)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!37088 () ListLongMap!9005)

(declare-fun e!469124 () Bool)

(declare-fun +!2030 (ListLongMap!9005 tuple2!10234) ListLongMap!9005)

(assert (=> b!840474 (= e!469124 (= call!37087 (+!2030 call!37088 (tuple2!10235 k0!854 v!557))))))

(declare-fun b!840475 () Bool)

(declare-fun res!571175 () Bool)

(assert (=> b!840475 (=> (not res!571175) (not e!469125))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840475 (= res!571175 (and (= (select (arr!22643 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23084 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840476 () Bool)

(declare-fun res!571176 () Bool)

(assert (=> b!840476 (=> (not res!571176) (not e!469125))))

(assert (=> b!840476 (= res!571176 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23084 _keys!868))))))

(declare-fun b!840477 () Bool)

(declare-fun e!469122 () Bool)

(assert (=> b!840477 (= e!469126 (and e!469122 mapRes!24803))))

(declare-fun condMapEmpty!24803 () Bool)

(declare-fun mapDefault!24803 () ValueCell!7295)

(assert (=> b!840477 (= condMapEmpty!24803 (= (arr!22644 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7295)) mapDefault!24803)))))

(declare-fun b!840478 () Bool)

(declare-fun res!571171 () Bool)

(assert (=> b!840478 (=> (not res!571171) (not e!469125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840478 (= res!571171 (validMask!0 mask!1196))))

(declare-fun bm!37084 () Bool)

(declare-fun minValue!654 () V!25673)

(declare-fun zeroValue!654 () V!25673)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2580 (array!47233 array!47235 (_ BitVec 32) (_ BitVec 32) V!25673 V!25673 (_ BitVec 32) Int) ListLongMap!9005)

(assert (=> bm!37084 (= call!37088 (getCurrentListMapNoExtraKeys!2580 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24803 () Bool)

(assert (=> mapIsEmpty!24803 mapRes!24803))

(declare-fun b!840479 () Bool)

(declare-fun res!571177 () Bool)

(assert (=> b!840479 (=> (not res!571177) (not e!469125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840479 (= res!571177 (validKeyInArray!0 k0!854))))

(declare-fun b!840480 () Bool)

(declare-fun res!571173 () Bool)

(assert (=> b!840480 (=> (not res!571173) (not e!469125))))

(declare-datatypes ((List!16012 0))(
  ( (Nil!16009) (Cons!16008 (h!17145 (_ BitVec 64)) (t!22375 List!16012)) )
))
(declare-fun arrayNoDuplicates!0 (array!47233 (_ BitVec 32) List!16012) Bool)

(assert (=> b!840480 (= res!571173 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16009))))

(declare-fun b!840481 () Bool)

(assert (=> b!840481 (= e!469124 (= call!37087 call!37088))))

(declare-fun b!840482 () Bool)

(assert (=> b!840482 (= e!469121 tp_is_empty!15469)))

(declare-fun bm!37085 () Bool)

(assert (=> bm!37085 (= call!37087 (getCurrentListMapNoExtraKeys!2580 _keys!868 (array!47236 (store (arr!22644 _values!688) i!612 (ValueCellFull!7295 v!557)) (size!23085 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840483 () Bool)

(declare-fun res!571174 () Bool)

(assert (=> b!840483 (=> (not res!571174) (not e!469125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47233 (_ BitVec 32)) Bool)

(assert (=> b!840483 (= res!571174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840484 () Bool)

(assert (=> b!840484 (= e!469122 tp_is_empty!15469)))

(declare-fun b!840485 () Bool)

(assert (=> b!840485 (= e!469125 (not true))))

(assert (=> b!840485 e!469124))

(declare-fun c!91546 () Bool)

(assert (=> b!840485 (= c!91546 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28846 0))(
  ( (Unit!28847) )
))
(declare-fun lt!381131 () Unit!28846)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!259 (array!47233 array!47235 (_ BitVec 32) (_ BitVec 32) V!25673 V!25673 (_ BitVec 32) (_ BitVec 64) V!25673 (_ BitVec 32) Int) Unit!28846)

(assert (=> b!840485 (= lt!381131 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!259 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72586 res!571170) b!840478))

(assert (= (and b!840478 res!571171) b!840473))

(assert (= (and b!840473 res!571172) b!840483))

(assert (= (and b!840483 res!571174) b!840480))

(assert (= (and b!840480 res!571173) b!840476))

(assert (= (and b!840476 res!571176) b!840479))

(assert (= (and b!840479 res!571177) b!840475))

(assert (= (and b!840475 res!571175) b!840485))

(assert (= (and b!840485 c!91546) b!840474))

(assert (= (and b!840485 (not c!91546)) b!840481))

(assert (= (or b!840474 b!840481) bm!37085))

(assert (= (or b!840474 b!840481) bm!37084))

(assert (= (and b!840477 condMapEmpty!24803) mapIsEmpty!24803))

(assert (= (and b!840477 (not condMapEmpty!24803)) mapNonEmpty!24803))

(get-info :version)

(assert (= (and mapNonEmpty!24803 ((_ is ValueCellFull!7295) mapValue!24803)) b!840482))

(assert (= (and b!840477 ((_ is ValueCellFull!7295) mapDefault!24803)) b!840484))

(assert (= start!72586 b!840477))

(declare-fun m!784925 () Bool)

(assert (=> bm!37084 m!784925))

(declare-fun m!784927 () Bool)

(assert (=> b!840480 m!784927))

(declare-fun m!784929 () Bool)

(assert (=> b!840479 m!784929))

(declare-fun m!784931 () Bool)

(assert (=> b!840474 m!784931))

(declare-fun m!784933 () Bool)

(assert (=> b!840483 m!784933))

(declare-fun m!784935 () Bool)

(assert (=> mapNonEmpty!24803 m!784935))

(declare-fun m!784937 () Bool)

(assert (=> b!840475 m!784937))

(declare-fun m!784939 () Bool)

(assert (=> b!840485 m!784939))

(declare-fun m!784941 () Bool)

(assert (=> bm!37085 m!784941))

(declare-fun m!784943 () Bool)

(assert (=> bm!37085 m!784943))

(declare-fun m!784945 () Bool)

(assert (=> start!72586 m!784945))

(declare-fun m!784947 () Bool)

(assert (=> start!72586 m!784947))

(declare-fun m!784949 () Bool)

(assert (=> b!840478 m!784949))

(check-sat (not b!840479) b_and!22699 (not b!840478) (not b!840480) (not b!840483) (not bm!37084) (not b_next!13603) (not start!72586) (not mapNonEmpty!24803) tp_is_empty!15469 (not b!840485) (not b!840474) (not bm!37085))
(check-sat b_and!22699 (not b_next!13603))
