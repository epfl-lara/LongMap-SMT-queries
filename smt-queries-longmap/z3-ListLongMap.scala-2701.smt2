; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40026 () Bool)

(assert start!40026)

(declare-fun b_free!10293 () Bool)

(declare-fun b_next!10293 () Bool)

(assert (=> start!40026 (= b_free!10293 (not b_next!10293))))

(declare-fun tp!36407 () Bool)

(declare-fun b_and!18245 () Bool)

(assert (=> start!40026 (= tp!36407 b_and!18245)))

(declare-fun mapIsEmpty!18789 () Bool)

(declare-fun mapRes!18789 () Bool)

(assert (=> mapIsEmpty!18789 mapRes!18789))

(declare-fun b!436284 () Bool)

(declare-fun res!257166 () Bool)

(declare-fun e!257653 () Bool)

(assert (=> b!436284 (=> (not res!257166) (not e!257653))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26715 0))(
  ( (array!26716 (arr!12807 (Array (_ BitVec 32) (_ BitVec 64))) (size!13159 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26715)

(assert (=> b!436284 (= res!257166 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13159 _keys!709))))))

(declare-fun b!436285 () Bool)

(declare-fun res!257167 () Bool)

(assert (=> b!436285 (=> (not res!257167) (not e!257653))))

(assert (=> b!436285 (= res!257167 (or (= (select (arr!12807 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12807 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436286 () Bool)

(declare-fun e!257655 () Bool)

(assert (=> b!436286 (= e!257653 e!257655)))

(declare-fun res!257175 () Bool)

(assert (=> b!436286 (=> (not res!257175) (not e!257655))))

(declare-fun lt!201108 () array!26715)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26715 (_ BitVec 32)) Bool)

(assert (=> b!436286 (= res!257175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201108 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!436286 (= lt!201108 (array!26716 (store (arr!12807 _keys!709) i!563 k0!794) (size!13159 _keys!709)))))

(declare-fun b!436287 () Bool)

(declare-fun res!257161 () Bool)

(assert (=> b!436287 (=> (not res!257161) (not e!257653))))

(assert (=> b!436287 (= res!257161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436288 () Bool)

(declare-fun e!257654 () Bool)

(assert (=> b!436288 (= e!257654 true)))

(declare-datatypes ((V!16365 0))(
  ( (V!16366 (val!5767 Int)) )
))
(declare-datatypes ((tuple2!7640 0))(
  ( (tuple2!7641 (_1!3831 (_ BitVec 64)) (_2!3831 V!16365)) )
))
(declare-datatypes ((List!7641 0))(
  ( (Nil!7638) (Cons!7637 (h!8493 tuple2!7640) (t!13383 List!7641)) )
))
(declare-datatypes ((ListLongMap!6553 0))(
  ( (ListLongMap!6554 (toList!3292 List!7641)) )
))
(declare-fun lt!201097 () ListLongMap!6553)

(declare-fun lt!201096 () tuple2!7640)

(declare-fun lt!201103 () ListLongMap!6553)

(declare-fun lt!201104 () tuple2!7640)

(declare-fun +!1440 (ListLongMap!6553 tuple2!7640) ListLongMap!6553)

(assert (=> b!436288 (= lt!201097 (+!1440 (+!1440 lt!201103 lt!201104) lt!201096))))

(declare-fun lt!201098 () V!16365)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun v!412 () V!16365)

(declare-datatypes ((Unit!12972 0))(
  ( (Unit!12973) )
))
(declare-fun lt!201107 () Unit!12972)

(declare-fun addCommutativeForDiffKeys!422 (ListLongMap!6553 (_ BitVec 64) V!16365 (_ BitVec 64) V!16365) Unit!12972)

(assert (=> b!436288 (= lt!201107 (addCommutativeForDiffKeys!422 lt!201103 k0!794 v!412 (select (arr!12807 _keys!709) from!863) lt!201098))))

(declare-fun b!436290 () Bool)

(declare-fun e!257657 () Bool)

(declare-fun tp_is_empty!11445 () Bool)

(assert (=> b!436290 (= e!257657 tp_is_empty!11445)))

(declare-fun b!436291 () Bool)

(declare-fun res!257172 () Bool)

(assert (=> b!436291 (=> (not res!257172) (not e!257653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436291 (= res!257172 (validMask!0 mask!1025))))

(declare-fun b!436292 () Bool)

(declare-fun e!257660 () Unit!12972)

(declare-fun Unit!12974 () Unit!12972)

(assert (=> b!436292 (= e!257660 Unit!12974)))

(declare-fun mapNonEmpty!18789 () Bool)

(declare-fun tp!36408 () Bool)

(declare-fun e!257661 () Bool)

(assert (=> mapNonEmpty!18789 (= mapRes!18789 (and tp!36408 e!257661))))

(declare-datatypes ((ValueCell!5379 0))(
  ( (ValueCellFull!5379 (v!8014 V!16365)) (EmptyCell!5379) )
))
(declare-fun mapValue!18789 () ValueCell!5379)

(declare-fun mapRest!18789 () (Array (_ BitVec 32) ValueCell!5379))

(declare-datatypes ((array!26717 0))(
  ( (array!26718 (arr!12808 (Array (_ BitVec 32) ValueCell!5379)) (size!13160 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26717)

(declare-fun mapKey!18789 () (_ BitVec 32))

(assert (=> mapNonEmpty!18789 (= (arr!12808 _values!549) (store mapRest!18789 mapKey!18789 mapValue!18789))))

(declare-fun b!436293 () Bool)

(declare-fun e!257652 () Bool)

(assert (=> b!436293 (= e!257655 e!257652)))

(declare-fun res!257169 () Bool)

(assert (=> b!436293 (=> (not res!257169) (not e!257652))))

(assert (=> b!436293 (= res!257169 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16365)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16365)

(declare-fun lt!201099 () ListLongMap!6553)

(declare-fun lt!201101 () array!26717)

(declare-fun getCurrentListMapNoExtraKeys!1482 (array!26715 array!26717 (_ BitVec 32) (_ BitVec 32) V!16365 V!16365 (_ BitVec 32) Int) ListLongMap!6553)

(assert (=> b!436293 (= lt!201099 (getCurrentListMapNoExtraKeys!1482 lt!201108 lt!201101 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436293 (= lt!201101 (array!26718 (store (arr!12808 _values!549) i!563 (ValueCellFull!5379 v!412)) (size!13160 _values!549)))))

(declare-fun lt!201110 () ListLongMap!6553)

(assert (=> b!436293 (= lt!201110 (getCurrentListMapNoExtraKeys!1482 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436294 () Bool)

(declare-fun e!257659 () Bool)

(assert (=> b!436294 (= e!257652 (not e!257659))))

(declare-fun res!257174 () Bool)

(assert (=> b!436294 (=> res!257174 e!257659)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436294 (= res!257174 (not (validKeyInArray!0 (select (arr!12807 _keys!709) from!863))))))

(declare-fun lt!201105 () ListLongMap!6553)

(declare-fun lt!201106 () ListLongMap!6553)

(assert (=> b!436294 (= lt!201105 lt!201106)))

(assert (=> b!436294 (= lt!201106 (+!1440 lt!201103 lt!201096))))

(assert (=> b!436294 (= lt!201105 (getCurrentListMapNoExtraKeys!1482 lt!201108 lt!201101 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!436294 (= lt!201096 (tuple2!7641 k0!794 v!412))))

(assert (=> b!436294 (= lt!201103 (getCurrentListMapNoExtraKeys!1482 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!201109 () Unit!12972)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!611 (array!26715 array!26717 (_ BitVec 32) (_ BitVec 32) V!16365 V!16365 (_ BitVec 32) (_ BitVec 64) V!16365 (_ BitVec 32) Int) Unit!12972)

(assert (=> b!436294 (= lt!201109 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!611 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436295 () Bool)

(declare-fun res!257164 () Bool)

(assert (=> b!436295 (=> (not res!257164) (not e!257653))))

(assert (=> b!436295 (= res!257164 (and (= (size!13160 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13159 _keys!709) (size!13160 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436296 () Bool)

(declare-fun res!257173 () Bool)

(assert (=> b!436296 (=> (not res!257173) (not e!257653))))

(declare-fun arrayContainsKey!0 (array!26715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436296 (= res!257173 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436297 () Bool)

(assert (=> b!436297 (= e!257659 e!257654)))

(declare-fun res!257165 () Bool)

(assert (=> b!436297 (=> res!257165 e!257654)))

(assert (=> b!436297 (= res!257165 (= k0!794 (select (arr!12807 _keys!709) from!863)))))

(assert (=> b!436297 (not (= (select (arr!12807 _keys!709) from!863) k0!794))))

(declare-fun lt!201100 () Unit!12972)

(assert (=> b!436297 (= lt!201100 e!257660)))

(declare-fun c!55775 () Bool)

(assert (=> b!436297 (= c!55775 (= (select (arr!12807 _keys!709) from!863) k0!794))))

(assert (=> b!436297 (= lt!201099 lt!201097)))

(assert (=> b!436297 (= lt!201097 (+!1440 lt!201106 lt!201104))))

(assert (=> b!436297 (= lt!201104 (tuple2!7641 (select (arr!12807 _keys!709) from!863) lt!201098))))

(declare-fun get!6390 (ValueCell!5379 V!16365) V!16365)

(declare-fun dynLambda!845 (Int (_ BitVec 64)) V!16365)

(assert (=> b!436297 (= lt!201098 (get!6390 (select (arr!12808 _values!549) from!863) (dynLambda!845 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436298 () Bool)

(declare-fun res!257163 () Bool)

(assert (=> b!436298 (=> (not res!257163) (not e!257655))))

(assert (=> b!436298 (= res!257163 (bvsle from!863 i!563))))

(declare-fun b!436299 () Bool)

(declare-fun res!257171 () Bool)

(assert (=> b!436299 (=> (not res!257171) (not e!257653))))

(assert (=> b!436299 (= res!257171 (validKeyInArray!0 k0!794))))

(declare-fun res!257168 () Bool)

(assert (=> start!40026 (=> (not res!257168) (not e!257653))))

(assert (=> start!40026 (= res!257168 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13159 _keys!709))))))

(assert (=> start!40026 e!257653))

(assert (=> start!40026 tp_is_empty!11445))

(assert (=> start!40026 tp!36407))

(assert (=> start!40026 true))

(declare-fun e!257658 () Bool)

(declare-fun array_inv!9308 (array!26717) Bool)

(assert (=> start!40026 (and (array_inv!9308 _values!549) e!257658)))

(declare-fun array_inv!9309 (array!26715) Bool)

(assert (=> start!40026 (array_inv!9309 _keys!709)))

(declare-fun b!436289 () Bool)

(declare-fun res!257170 () Bool)

(assert (=> b!436289 (=> (not res!257170) (not e!257653))))

(declare-datatypes ((List!7642 0))(
  ( (Nil!7639) (Cons!7638 (h!8494 (_ BitVec 64)) (t!13384 List!7642)) )
))
(declare-fun arrayNoDuplicates!0 (array!26715 (_ BitVec 32) List!7642) Bool)

(assert (=> b!436289 (= res!257170 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7639))))

(declare-fun b!436300 () Bool)

(assert (=> b!436300 (= e!257658 (and e!257657 mapRes!18789))))

(declare-fun condMapEmpty!18789 () Bool)

(declare-fun mapDefault!18789 () ValueCell!5379)

(assert (=> b!436300 (= condMapEmpty!18789 (= (arr!12808 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5379)) mapDefault!18789)))))

(declare-fun b!436301 () Bool)

(declare-fun res!257162 () Bool)

(assert (=> b!436301 (=> (not res!257162) (not e!257655))))

(assert (=> b!436301 (= res!257162 (arrayNoDuplicates!0 lt!201108 #b00000000000000000000000000000000 Nil!7639))))

(declare-fun b!436302 () Bool)

(assert (=> b!436302 (= e!257661 tp_is_empty!11445)))

(declare-fun b!436303 () Bool)

(declare-fun Unit!12975 () Unit!12972)

(assert (=> b!436303 (= e!257660 Unit!12975)))

(declare-fun lt!201102 () Unit!12972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26715 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12972)

(assert (=> b!436303 (= lt!201102 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436303 false))

(assert (= (and start!40026 res!257168) b!436291))

(assert (= (and b!436291 res!257172) b!436295))

(assert (= (and b!436295 res!257164) b!436287))

(assert (= (and b!436287 res!257161) b!436289))

(assert (= (and b!436289 res!257170) b!436284))

(assert (= (and b!436284 res!257166) b!436299))

(assert (= (and b!436299 res!257171) b!436285))

(assert (= (and b!436285 res!257167) b!436296))

(assert (= (and b!436296 res!257173) b!436286))

(assert (= (and b!436286 res!257175) b!436301))

(assert (= (and b!436301 res!257162) b!436298))

(assert (= (and b!436298 res!257163) b!436293))

(assert (= (and b!436293 res!257169) b!436294))

(assert (= (and b!436294 (not res!257174)) b!436297))

(assert (= (and b!436297 c!55775) b!436303))

(assert (= (and b!436297 (not c!55775)) b!436292))

(assert (= (and b!436297 (not res!257165)) b!436288))

(assert (= (and b!436300 condMapEmpty!18789) mapIsEmpty!18789))

(assert (= (and b!436300 (not condMapEmpty!18789)) mapNonEmpty!18789))

(get-info :version)

(assert (= (and mapNonEmpty!18789 ((_ is ValueCellFull!5379) mapValue!18789)) b!436302))

(assert (= (and b!436300 ((_ is ValueCellFull!5379) mapDefault!18789)) b!436290))

(assert (= start!40026 b!436300))

(declare-fun b_lambda!9381 () Bool)

(assert (=> (not b_lambda!9381) (not b!436297)))

(declare-fun t!13382 () Bool)

(declare-fun tb!3699 () Bool)

(assert (=> (and start!40026 (= defaultEntry!557 defaultEntry!557) t!13382) tb!3699))

(declare-fun result!6925 () Bool)

(assert (=> tb!3699 (= result!6925 tp_is_empty!11445)))

(assert (=> b!436297 t!13382))

(declare-fun b_and!18247 () Bool)

(assert (= b_and!18245 (and (=> t!13382 result!6925) b_and!18247)))

(declare-fun m!424117 () Bool)

(assert (=> b!436288 m!424117))

(assert (=> b!436288 m!424117))

(declare-fun m!424119 () Bool)

(assert (=> b!436288 m!424119))

(declare-fun m!424121 () Bool)

(assert (=> b!436288 m!424121))

(assert (=> b!436288 m!424121))

(declare-fun m!424123 () Bool)

(assert (=> b!436288 m!424123))

(declare-fun m!424125 () Bool)

(assert (=> b!436299 m!424125))

(declare-fun m!424127 () Bool)

(assert (=> b!436285 m!424127))

(assert (=> b!436294 m!424121))

(declare-fun m!424129 () Bool)

(assert (=> b!436294 m!424129))

(declare-fun m!424131 () Bool)

(assert (=> b!436294 m!424131))

(assert (=> b!436294 m!424121))

(declare-fun m!424133 () Bool)

(assert (=> b!436294 m!424133))

(declare-fun m!424135 () Bool)

(assert (=> b!436294 m!424135))

(declare-fun m!424137 () Bool)

(assert (=> b!436294 m!424137))

(declare-fun m!424139 () Bool)

(assert (=> b!436291 m!424139))

(declare-fun m!424141 () Bool)

(assert (=> b!436303 m!424141))

(declare-fun m!424143 () Bool)

(assert (=> b!436301 m!424143))

(declare-fun m!424145 () Bool)

(assert (=> b!436296 m!424145))

(declare-fun m!424147 () Bool)

(assert (=> b!436286 m!424147))

(declare-fun m!424149 () Bool)

(assert (=> b!436286 m!424149))

(assert (=> b!436297 m!424121))

(declare-fun m!424151 () Bool)

(assert (=> b!436297 m!424151))

(declare-fun m!424153 () Bool)

(assert (=> b!436297 m!424153))

(declare-fun m!424155 () Bool)

(assert (=> b!436297 m!424155))

(assert (=> b!436297 m!424155))

(assert (=> b!436297 m!424151))

(declare-fun m!424157 () Bool)

(assert (=> b!436297 m!424157))

(declare-fun m!424159 () Bool)

(assert (=> start!40026 m!424159))

(declare-fun m!424161 () Bool)

(assert (=> start!40026 m!424161))

(declare-fun m!424163 () Bool)

(assert (=> mapNonEmpty!18789 m!424163))

(declare-fun m!424165 () Bool)

(assert (=> b!436287 m!424165))

(declare-fun m!424167 () Bool)

(assert (=> b!436289 m!424167))

(declare-fun m!424169 () Bool)

(assert (=> b!436293 m!424169))

(declare-fun m!424171 () Bool)

(assert (=> b!436293 m!424171))

(declare-fun m!424173 () Bool)

(assert (=> b!436293 m!424173))

(check-sat (not b!436289) (not b_next!10293) (not b!436296) tp_is_empty!11445 (not b!436299) (not b!436288) (not b_lambda!9381) (not b!436297) (not b!436287) b_and!18247 (not b!436303) (not start!40026) (not b!436286) (not b!436301) (not mapNonEmpty!18789) (not b!436291) (not b!436294) (not b!436293))
(check-sat b_and!18247 (not b_next!10293))
