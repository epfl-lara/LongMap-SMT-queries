; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72412 () Bool)

(assert start!72412)

(declare-fun b_free!13615 () Bool)

(declare-fun b_next!13615 () Bool)

(assert (=> start!72412 (= b_free!13615 (not b_next!13615))))

(declare-fun tp!47945 () Bool)

(declare-fun b_and!22675 () Bool)

(assert (=> start!72412 (= tp!47945 b_and!22675)))

(declare-fun b!839565 () Bool)

(declare-fun e!468504 () Bool)

(declare-fun e!468501 () Bool)

(declare-fun mapRes!24821 () Bool)

(assert (=> b!839565 (= e!468504 (and e!468501 mapRes!24821))))

(declare-fun condMapEmpty!24821 () Bool)

(declare-datatypes ((V!25689 0))(
  ( (V!25690 (val!7788 Int)) )
))
(declare-datatypes ((ValueCell!7301 0))(
  ( (ValueCellFull!7301 (v!10207 V!25689)) (EmptyCell!7301) )
))
(declare-datatypes ((array!47221 0))(
  ( (array!47222 (arr!22642 (Array (_ BitVec 32) ValueCell!7301)) (size!23084 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47221)

(declare-fun mapDefault!24821 () ValueCell!7301)

(assert (=> b!839565 (= condMapEmpty!24821 (= (arr!22642 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7301)) mapDefault!24821)))))

(declare-fun b!839566 () Bool)

(declare-fun e!468500 () Bool)

(declare-fun tp_is_empty!15481 () Bool)

(assert (=> b!839566 (= e!468500 tp_is_empty!15481)))

(declare-fun v!557 () V!25689)

(declare-fun e!468502 () Bool)

(declare-datatypes ((tuple2!10330 0))(
  ( (tuple2!10331 (_1!5176 (_ BitVec 64)) (_2!5176 V!25689)) )
))
(declare-datatypes ((List!16114 0))(
  ( (Nil!16111) (Cons!16110 (h!17241 tuple2!10330) (t!22476 List!16114)) )
))
(declare-datatypes ((ListLongMap!9089 0))(
  ( (ListLongMap!9090 (toList!4560 List!16114)) )
))
(declare-fun call!37053 () ListLongMap!9089)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!839567 () Bool)

(declare-fun call!37052 () ListLongMap!9089)

(declare-fun +!2053 (ListLongMap!9089 tuple2!10330) ListLongMap!9089)

(assert (=> b!839567 (= e!468502 (= call!37052 (+!2053 call!37053 (tuple2!10331 k0!854 v!557))))))

(declare-fun res!570863 () Bool)

(declare-fun e!468499 () Bool)

(assert (=> start!72412 (=> (not res!570863) (not e!468499))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47223 0))(
  ( (array!47224 (arr!22643 (Array (_ BitVec 32) (_ BitVec 64))) (size!23085 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47223)

(assert (=> start!72412 (= res!570863 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23085 _keys!868))))))

(assert (=> start!72412 e!468499))

(assert (=> start!72412 tp_is_empty!15481))

(assert (=> start!72412 true))

(assert (=> start!72412 tp!47945))

(declare-fun array_inv!18104 (array!47223) Bool)

(assert (=> start!72412 (array_inv!18104 _keys!868)))

(declare-fun array_inv!18105 (array!47221) Bool)

(assert (=> start!72412 (and (array_inv!18105 _values!688) e!468504)))

(declare-fun b!839568 () Bool)

(declare-fun res!570866 () Bool)

(assert (=> b!839568 (=> (not res!570866) (not e!468499))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839568 (= res!570866 (and (= (select (arr!22643 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23085 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839569 () Bool)

(assert (=> b!839569 (= e!468499 (not true))))

(assert (=> b!839569 e!468502))

(declare-fun c!91217 () Bool)

(assert (=> b!839569 (= c!91217 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((Unit!28785 0))(
  ( (Unit!28786) )
))
(declare-fun lt!380552 () Unit!28785)

(declare-fun minValue!654 () V!25689)

(declare-fun zeroValue!654 () V!25689)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!267 (array!47223 array!47221 (_ BitVec 32) (_ BitVec 32) V!25689 V!25689 (_ BitVec 32) (_ BitVec 64) V!25689 (_ BitVec 32) Int) Unit!28785)

(assert (=> b!839569 (= lt!380552 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!267 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37049 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2580 (array!47223 array!47221 (_ BitVec 32) (_ BitVec 32) V!25689 V!25689 (_ BitVec 32) Int) ListLongMap!9089)

(assert (=> bm!37049 (= call!37052 (getCurrentListMapNoExtraKeys!2580 _keys!868 (array!47222 (store (arr!22642 _values!688) i!612 (ValueCellFull!7301 v!557)) (size!23084 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839570 () Bool)

(declare-fun res!570865 () Bool)

(assert (=> b!839570 (=> (not res!570865) (not e!468499))))

(declare-datatypes ((List!16115 0))(
  ( (Nil!16112) (Cons!16111 (h!17242 (_ BitVec 64)) (t!22477 List!16115)) )
))
(declare-fun arrayNoDuplicates!0 (array!47223 (_ BitVec 32) List!16115) Bool)

(assert (=> b!839570 (= res!570865 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16112))))

(declare-fun bm!37050 () Bool)

(assert (=> bm!37050 (= call!37053 (getCurrentListMapNoExtraKeys!2580 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839571 () Bool)

(declare-fun res!570867 () Bool)

(assert (=> b!839571 (=> (not res!570867) (not e!468499))))

(assert (=> b!839571 (= res!570867 (and (= (size!23084 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23085 _keys!868) (size!23084 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839572 () Bool)

(declare-fun res!570862 () Bool)

(assert (=> b!839572 (=> (not res!570862) (not e!468499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839572 (= res!570862 (validMask!0 mask!1196))))

(declare-fun b!839573 () Bool)

(declare-fun res!570860 () Bool)

(assert (=> b!839573 (=> (not res!570860) (not e!468499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839573 (= res!570860 (validKeyInArray!0 k0!854))))

(declare-fun b!839574 () Bool)

(assert (=> b!839574 (= e!468501 tp_is_empty!15481)))

(declare-fun b!839575 () Bool)

(declare-fun res!570861 () Bool)

(assert (=> b!839575 (=> (not res!570861) (not e!468499))))

(assert (=> b!839575 (= res!570861 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23085 _keys!868))))))

(declare-fun b!839576 () Bool)

(assert (=> b!839576 (= e!468502 (= call!37052 call!37053))))

(declare-fun mapNonEmpty!24821 () Bool)

(declare-fun tp!47944 () Bool)

(assert (=> mapNonEmpty!24821 (= mapRes!24821 (and tp!47944 e!468500))))

(declare-fun mapKey!24821 () (_ BitVec 32))

(declare-fun mapRest!24821 () (Array (_ BitVec 32) ValueCell!7301))

(declare-fun mapValue!24821 () ValueCell!7301)

(assert (=> mapNonEmpty!24821 (= (arr!22642 _values!688) (store mapRest!24821 mapKey!24821 mapValue!24821))))

(declare-fun mapIsEmpty!24821 () Bool)

(assert (=> mapIsEmpty!24821 mapRes!24821))

(declare-fun b!839577 () Bool)

(declare-fun res!570864 () Bool)

(assert (=> b!839577 (=> (not res!570864) (not e!468499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47223 (_ BitVec 32)) Bool)

(assert (=> b!839577 (= res!570864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72412 res!570863) b!839572))

(assert (= (and b!839572 res!570862) b!839571))

(assert (= (and b!839571 res!570867) b!839577))

(assert (= (and b!839577 res!570864) b!839570))

(assert (= (and b!839570 res!570865) b!839575))

(assert (= (and b!839575 res!570861) b!839573))

(assert (= (and b!839573 res!570860) b!839568))

(assert (= (and b!839568 res!570866) b!839569))

(assert (= (and b!839569 c!91217) b!839567))

(assert (= (and b!839569 (not c!91217)) b!839576))

(assert (= (or b!839567 b!839576) bm!37049))

(assert (= (or b!839567 b!839576) bm!37050))

(assert (= (and b!839565 condMapEmpty!24821) mapIsEmpty!24821))

(assert (= (and b!839565 (not condMapEmpty!24821)) mapNonEmpty!24821))

(get-info :version)

(assert (= (and mapNonEmpty!24821 ((_ is ValueCellFull!7301) mapValue!24821)) b!839566))

(assert (= (and b!839565 ((_ is ValueCellFull!7301) mapDefault!24821)) b!839574))

(assert (= start!72412 b!839565))

(declare-fun m!783035 () Bool)

(assert (=> b!839572 m!783035))

(declare-fun m!783037 () Bool)

(assert (=> b!839568 m!783037))

(declare-fun m!783039 () Bool)

(assert (=> start!72412 m!783039))

(declare-fun m!783041 () Bool)

(assert (=> start!72412 m!783041))

(declare-fun m!783043 () Bool)

(assert (=> b!839577 m!783043))

(declare-fun m!783045 () Bool)

(assert (=> b!839569 m!783045))

(declare-fun m!783047 () Bool)

(assert (=> bm!37050 m!783047))

(declare-fun m!783049 () Bool)

(assert (=> mapNonEmpty!24821 m!783049))

(declare-fun m!783051 () Bool)

(assert (=> bm!37049 m!783051))

(declare-fun m!783053 () Bool)

(assert (=> bm!37049 m!783053))

(declare-fun m!783055 () Bool)

(assert (=> b!839570 m!783055))

(declare-fun m!783057 () Bool)

(assert (=> b!839573 m!783057))

(declare-fun m!783059 () Bool)

(assert (=> b!839567 m!783059))

(check-sat tp_is_empty!15481 (not b!839572) (not bm!37050) b_and!22675 (not b!839570) (not b!839573) (not mapNonEmpty!24821) (not b_next!13615) (not b!839567) (not start!72412) (not b!839577) (not bm!37049) (not b!839569))
(check-sat b_and!22675 (not b_next!13615))
