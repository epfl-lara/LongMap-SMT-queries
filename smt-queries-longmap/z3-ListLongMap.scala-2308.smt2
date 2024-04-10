; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37312 () Bool)

(assert start!37312)

(declare-fun b_free!8439 () Bool)

(declare-fun b_next!8439 () Bool)

(assert (=> start!37312 (= b_free!8439 (not b_next!8439))))

(declare-fun tp!30033 () Bool)

(declare-fun b_and!15681 () Bool)

(assert (=> start!37312 (= tp!30033 b_and!15681)))

(declare-fun b!378326 () Bool)

(declare-fun res!214268 () Bool)

(declare-fun e!230269 () Bool)

(assert (=> b!378326 (=> (not res!214268) (not e!230269))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378326 (= res!214268 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15195 () Bool)

(declare-fun mapRes!15195 () Bool)

(assert (=> mapIsEmpty!15195 mapRes!15195))

(declare-fun b!378327 () Bool)

(declare-fun res!214259 () Bool)

(declare-fun e!230267 () Bool)

(assert (=> b!378327 (=> (not res!214259) (not e!230267))))

(declare-datatypes ((V!13221 0))(
  ( (V!13222 (val!4588 Int)) )
))
(declare-datatypes ((tuple2!6126 0))(
  ( (tuple2!6127 (_1!3074 (_ BitVec 64)) (_2!3074 V!13221)) )
))
(declare-fun lt!176247 () tuple2!6126)

(declare-datatypes ((List!5964 0))(
  ( (Nil!5961) (Cons!5960 (h!6816 tuple2!6126) (t!11114 List!5964)) )
))
(declare-datatypes ((ListLongMap!5039 0))(
  ( (ListLongMap!5040 (toList!2535 List!5964)) )
))
(declare-fun lt!176242 () ListLongMap!5039)

(declare-fun lt!176246 () ListLongMap!5039)

(declare-fun +!881 (ListLongMap!5039 tuple2!6126) ListLongMap!5039)

(assert (=> b!378327 (= res!214259 (= lt!176246 (+!881 lt!176242 lt!176247)))))

(declare-fun b!378328 () Bool)

(declare-fun res!214256 () Bool)

(assert (=> b!378328 (=> (not res!214256) (not e!230269))))

(declare-datatypes ((array!22099 0))(
  ( (array!22100 (arr!10518 (Array (_ BitVec 32) (_ BitVec 64))) (size!10870 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22099)

(declare-datatypes ((List!5965 0))(
  ( (Nil!5962) (Cons!5961 (h!6817 (_ BitVec 64)) (t!11115 List!5965)) )
))
(declare-fun arrayNoDuplicates!0 (array!22099 (_ BitVec 32) List!5965) Bool)

(assert (=> b!378328 (= res!214256 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5962))))

(declare-fun mapNonEmpty!15195 () Bool)

(declare-fun tp!30032 () Bool)

(declare-fun e!230268 () Bool)

(assert (=> mapNonEmpty!15195 (= mapRes!15195 (and tp!30032 e!230268))))

(declare-datatypes ((ValueCell!4200 0))(
  ( (ValueCellFull!4200 (v!6785 V!13221)) (EmptyCell!4200) )
))
(declare-datatypes ((array!22101 0))(
  ( (array!22102 (arr!10519 (Array (_ BitVec 32) ValueCell!4200)) (size!10871 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22101)

(declare-fun mapRest!15195 () (Array (_ BitVec 32) ValueCell!4200))

(declare-fun mapKey!15195 () (_ BitVec 32))

(declare-fun mapValue!15195 () ValueCell!4200)

(assert (=> mapNonEmpty!15195 (= (arr!10519 _values!506) (store mapRest!15195 mapKey!15195 mapValue!15195))))

(declare-fun b!378329 () Bool)

(declare-fun res!214262 () Bool)

(declare-fun e!230266 () Bool)

(assert (=> b!378329 (=> (not res!214262) (not e!230266))))

(declare-fun lt!176239 () array!22099)

(assert (=> b!378329 (= res!214262 (arrayNoDuplicates!0 lt!176239 #b00000000000000000000000000000000 Nil!5962))))

(declare-fun b!378330 () Bool)

(declare-fun e!230263 () Bool)

(assert (=> b!378330 (= e!230263 true)))

(assert (=> b!378330 e!230267))

(declare-fun res!214265 () Bool)

(assert (=> b!378330 (=> (not res!214265) (not e!230267))))

(declare-fun lt!176244 () ListLongMap!5039)

(assert (=> b!378330 (= res!214265 (= lt!176246 (+!881 lt!176244 lt!176247)))))

(declare-fun minValue!472 () V!13221)

(assert (=> b!378330 (= lt!176247 (tuple2!6127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378331 () Bool)

(declare-fun res!214267 () Bool)

(assert (=> b!378331 (=> (not res!214267) (not e!230269))))

(declare-fun arrayContainsKey!0 (array!22099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378331 (= res!214267 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378332 () Bool)

(declare-fun e!230265 () Bool)

(declare-fun e!230264 () Bool)

(assert (=> b!378332 (= e!230265 (and e!230264 mapRes!15195))))

(declare-fun condMapEmpty!15195 () Bool)

(declare-fun mapDefault!15195 () ValueCell!4200)

(assert (=> b!378332 (= condMapEmpty!15195 (= (arr!10519 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4200)) mapDefault!15195)))))

(declare-fun b!378334 () Bool)

(assert (=> b!378334 (= e!230269 e!230266)))

(declare-fun res!214257 () Bool)

(assert (=> b!378334 (=> (not res!214257) (not e!230266))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22099 (_ BitVec 32)) Bool)

(assert (=> b!378334 (= res!214257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176239 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378334 (= lt!176239 (array!22100 (store (arr!10518 _keys!658) i!548 k0!778) (size!10870 _keys!658)))))

(declare-fun b!378335 () Bool)

(declare-fun res!214261 () Bool)

(assert (=> b!378335 (=> (not res!214261) (not e!230269))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378335 (= res!214261 (and (= (size!10871 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10870 _keys!658) (size!10871 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378336 () Bool)

(declare-fun tp_is_empty!9087 () Bool)

(assert (=> b!378336 (= e!230264 tp_is_empty!9087)))

(declare-fun lt!176245 () ListLongMap!5039)

(declare-fun b!378337 () Bool)

(declare-fun lt!176241 () ListLongMap!5039)

(assert (=> b!378337 (= e!230267 (= lt!176245 (+!881 lt!176241 lt!176247)))))

(declare-fun b!378338 () Bool)

(assert (=> b!378338 (= e!230266 (not e!230263))))

(declare-fun res!214266 () Bool)

(assert (=> b!378338 (=> res!214266 e!230263)))

(assert (=> b!378338 (= res!214266 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13221)

(declare-fun getCurrentListMap!1961 (array!22099 array!22101 (_ BitVec 32) (_ BitVec 32) V!13221 V!13221 (_ BitVec 32) Int) ListLongMap!5039)

(assert (=> b!378338 (= lt!176245 (getCurrentListMap!1961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176240 () array!22101)

(assert (=> b!378338 (= lt!176246 (getCurrentListMap!1961 lt!176239 lt!176240 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378338 (and (= lt!176244 lt!176242) (= lt!176242 lt!176244))))

(declare-fun v!373 () V!13221)

(assert (=> b!378338 (= lt!176242 (+!881 lt!176241 (tuple2!6127 k0!778 v!373)))))

(declare-datatypes ((Unit!11662 0))(
  ( (Unit!11663) )
))
(declare-fun lt!176243 () Unit!11662)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!119 (array!22099 array!22101 (_ BitVec 32) (_ BitVec 32) V!13221 V!13221 (_ BitVec 32) (_ BitVec 64) V!13221 (_ BitVec 32) Int) Unit!11662)

(assert (=> b!378338 (= lt!176243 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!119 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!795 (array!22099 array!22101 (_ BitVec 32) (_ BitVec 32) V!13221 V!13221 (_ BitVec 32) Int) ListLongMap!5039)

(assert (=> b!378338 (= lt!176244 (getCurrentListMapNoExtraKeys!795 lt!176239 lt!176240 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378338 (= lt!176240 (array!22102 (store (arr!10519 _values!506) i!548 (ValueCellFull!4200 v!373)) (size!10871 _values!506)))))

(assert (=> b!378338 (= lt!176241 (getCurrentListMapNoExtraKeys!795 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378339 () Bool)

(declare-fun res!214260 () Bool)

(assert (=> b!378339 (=> (not res!214260) (not e!230269))))

(assert (=> b!378339 (= res!214260 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10870 _keys!658))))))

(declare-fun b!378340 () Bool)

(declare-fun res!214263 () Bool)

(assert (=> b!378340 (=> (not res!214263) (not e!230269))))

(assert (=> b!378340 (= res!214263 (or (= (select (arr!10518 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10518 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378341 () Bool)

(declare-fun res!214258 () Bool)

(assert (=> b!378341 (=> (not res!214258) (not e!230269))))

(assert (=> b!378341 (= res!214258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!214264 () Bool)

(assert (=> start!37312 (=> (not res!214264) (not e!230269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37312 (= res!214264 (validMask!0 mask!970))))

(assert (=> start!37312 e!230269))

(declare-fun array_inv!7746 (array!22101) Bool)

(assert (=> start!37312 (and (array_inv!7746 _values!506) e!230265)))

(assert (=> start!37312 tp!30033))

(assert (=> start!37312 true))

(assert (=> start!37312 tp_is_empty!9087))

(declare-fun array_inv!7747 (array!22099) Bool)

(assert (=> start!37312 (array_inv!7747 _keys!658)))

(declare-fun b!378333 () Bool)

(assert (=> b!378333 (= e!230268 tp_is_empty!9087)))

(assert (= (and start!37312 res!214264) b!378335))

(assert (= (and b!378335 res!214261) b!378341))

(assert (= (and b!378341 res!214258) b!378328))

(assert (= (and b!378328 res!214256) b!378339))

(assert (= (and b!378339 res!214260) b!378326))

(assert (= (and b!378326 res!214268) b!378340))

(assert (= (and b!378340 res!214263) b!378331))

(assert (= (and b!378331 res!214267) b!378334))

(assert (= (and b!378334 res!214257) b!378329))

(assert (= (and b!378329 res!214262) b!378338))

(assert (= (and b!378338 (not res!214266)) b!378330))

(assert (= (and b!378330 res!214265) b!378327))

(assert (= (and b!378327 res!214259) b!378337))

(assert (= (and b!378332 condMapEmpty!15195) mapIsEmpty!15195))

(assert (= (and b!378332 (not condMapEmpty!15195)) mapNonEmpty!15195))

(get-info :version)

(assert (= (and mapNonEmpty!15195 ((_ is ValueCellFull!4200) mapValue!15195)) b!378333))

(assert (= (and b!378332 ((_ is ValueCellFull!4200) mapDefault!15195)) b!378336))

(assert (= start!37312 b!378332))

(declare-fun m!375143 () Bool)

(assert (=> b!378340 m!375143))

(declare-fun m!375145 () Bool)

(assert (=> b!378341 m!375145))

(declare-fun m!375147 () Bool)

(assert (=> b!378327 m!375147))

(declare-fun m!375149 () Bool)

(assert (=> b!378337 m!375149))

(declare-fun m!375151 () Bool)

(assert (=> b!378338 m!375151))

(declare-fun m!375153 () Bool)

(assert (=> b!378338 m!375153))

(declare-fun m!375155 () Bool)

(assert (=> b!378338 m!375155))

(declare-fun m!375157 () Bool)

(assert (=> b!378338 m!375157))

(declare-fun m!375159 () Bool)

(assert (=> b!378338 m!375159))

(declare-fun m!375161 () Bool)

(assert (=> b!378338 m!375161))

(declare-fun m!375163 () Bool)

(assert (=> b!378338 m!375163))

(declare-fun m!375165 () Bool)

(assert (=> mapNonEmpty!15195 m!375165))

(declare-fun m!375167 () Bool)

(assert (=> b!378329 m!375167))

(declare-fun m!375169 () Bool)

(assert (=> b!378326 m!375169))

(declare-fun m!375171 () Bool)

(assert (=> b!378328 m!375171))

(declare-fun m!375173 () Bool)

(assert (=> b!378331 m!375173))

(declare-fun m!375175 () Bool)

(assert (=> b!378334 m!375175))

(declare-fun m!375177 () Bool)

(assert (=> b!378334 m!375177))

(declare-fun m!375179 () Bool)

(assert (=> b!378330 m!375179))

(declare-fun m!375181 () Bool)

(assert (=> start!37312 m!375181))

(declare-fun m!375183 () Bool)

(assert (=> start!37312 m!375183))

(declare-fun m!375185 () Bool)

(assert (=> start!37312 m!375185))

(check-sat (not b!378326) (not b_next!8439) (not b!378331) (not b!378334) (not b!378328) (not start!37312) (not b!378341) (not b!378327) (not b!378329) tp_is_empty!9087 b_and!15681 (not b!378338) (not mapNonEmpty!15195) (not b!378330) (not b!378337))
(check-sat b_and!15681 (not b_next!8439))
