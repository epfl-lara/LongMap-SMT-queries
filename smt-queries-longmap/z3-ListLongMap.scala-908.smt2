; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20548 () Bool)

(assert start!20548)

(declare-fun b_free!5203 () Bool)

(declare-fun b_next!5203 () Bool)

(assert (=> start!20548 (= b_free!5203 (not b_next!5203))))

(declare-fun tp!18641 () Bool)

(declare-fun b_and!11923 () Bool)

(assert (=> start!20548 (= tp!18641 b_and!11923)))

(declare-fun mapIsEmpty!8657 () Bool)

(declare-fun mapRes!8657 () Bool)

(assert (=> mapIsEmpty!8657 mapRes!8657))

(declare-fun b!204144 () Bool)

(declare-fun res!98302 () Bool)

(declare-fun e!133579 () Bool)

(assert (=> b!204144 (=> (not res!98302) (not e!133579))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9323 0))(
  ( (array!9324 (arr!4411 (Array (_ BitVec 32) (_ BitVec 64))) (size!4737 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9323)

(assert (=> b!204144 (= res!98302 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4737 _keys!825))))))

(declare-fun b!204145 () Bool)

(declare-fun res!98299 () Bool)

(assert (=> b!204145 (=> (not res!98299) (not e!133579))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9323 (_ BitVec 32)) Bool)

(assert (=> b!204145 (= res!98299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204146 () Bool)

(declare-fun e!133584 () Bool)

(assert (=> b!204146 (= e!133584 (bvsle #b00000000000000000000000000000000 (size!4737 _keys!825)))))

(declare-datatypes ((V!6393 0))(
  ( (V!6394 (val!2574 Int)) )
))
(declare-datatypes ((tuple2!3886 0))(
  ( (tuple2!3887 (_1!1954 (_ BitVec 64)) (_2!1954 V!6393)) )
))
(declare-datatypes ((List!2792 0))(
  ( (Nil!2789) (Cons!2788 (h!3430 tuple2!3886) (t!7714 List!2792)) )
))
(declare-datatypes ((ListLongMap!2789 0))(
  ( (ListLongMap!2790 (toList!1410 List!2792)) )
))
(declare-fun lt!103288 () ListLongMap!2789)

(declare-fun lt!103295 () ListLongMap!2789)

(declare-fun lt!103289 () tuple2!3886)

(declare-fun +!459 (ListLongMap!2789 tuple2!3886) ListLongMap!2789)

(assert (=> b!204146 (= lt!103288 (+!459 lt!103295 lt!103289))))

(declare-fun lt!103291 () ListLongMap!2789)

(declare-datatypes ((Unit!6162 0))(
  ( (Unit!6163) )
))
(declare-fun lt!103292 () Unit!6162)

(declare-fun v!520 () V!6393)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6393)

(declare-fun addCommutativeForDiffKeys!152 (ListLongMap!2789 (_ BitVec 64) V!6393 (_ BitVec 64) V!6393) Unit!6162)

(assert (=> b!204146 (= lt!103292 (addCommutativeForDiffKeys!152 lt!103291 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204147 () Bool)

(declare-fun res!98300 () Bool)

(assert (=> b!204147 (=> (not res!98300) (not e!133579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204147 (= res!98300 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8657 () Bool)

(declare-fun tp!18640 () Bool)

(declare-fun e!133578 () Bool)

(assert (=> mapNonEmpty!8657 (= mapRes!8657 (and tp!18640 e!133578))))

(declare-datatypes ((ValueCell!2186 0))(
  ( (ValueCellFull!2186 (v!4538 V!6393)) (EmptyCell!2186) )
))
(declare-fun mapRest!8657 () (Array (_ BitVec 32) ValueCell!2186))

(declare-fun mapValue!8657 () ValueCell!2186)

(declare-datatypes ((array!9325 0))(
  ( (array!9326 (arr!4412 (Array (_ BitVec 32) ValueCell!2186)) (size!4738 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9325)

(declare-fun mapKey!8657 () (_ BitVec 32))

(assert (=> mapNonEmpty!8657 (= (arr!4412 _values!649) (store mapRest!8657 mapKey!8657 mapValue!8657))))

(declare-fun b!204149 () Bool)

(declare-fun tp_is_empty!5059 () Bool)

(assert (=> b!204149 (= e!133578 tp_is_empty!5059)))

(declare-fun b!204150 () Bool)

(declare-fun res!98304 () Bool)

(assert (=> b!204150 (=> (not res!98304) (not e!133579))))

(assert (=> b!204150 (= res!98304 (= (select (arr!4411 _keys!825) i!601) k0!843))))

(declare-fun b!204151 () Bool)

(declare-fun e!133580 () Bool)

(assert (=> b!204151 (= e!133580 tp_is_empty!5059)))

(declare-fun b!204152 () Bool)

(declare-fun e!133582 () Bool)

(assert (=> b!204152 (= e!133582 e!133584)))

(declare-fun res!98298 () Bool)

(assert (=> b!204152 (=> res!98298 e!133584)))

(assert (=> b!204152 (= res!98298 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103296 () ListLongMap!2789)

(assert (=> b!204152 (= lt!103296 lt!103288)))

(declare-fun lt!103293 () ListLongMap!2789)

(declare-fun lt!103298 () tuple2!3886)

(assert (=> b!204152 (= lt!103288 (+!459 lt!103293 lt!103298))))

(declare-fun lt!103290 () ListLongMap!2789)

(assert (=> b!204152 (= lt!103290 lt!103295)))

(assert (=> b!204152 (= lt!103295 (+!459 lt!103291 lt!103298))))

(declare-fun lt!103297 () ListLongMap!2789)

(assert (=> b!204152 (= lt!103296 (+!459 lt!103297 lt!103298))))

(assert (=> b!204152 (= lt!103298 (tuple2!3887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204153 () Bool)

(assert (=> b!204153 (= e!133579 (not e!133582))))

(declare-fun res!98305 () Bool)

(assert (=> b!204153 (=> res!98305 e!133582)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204153 (= res!98305 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6393)

(declare-fun getCurrentListMap!958 (array!9323 array!9325 (_ BitVec 32) (_ BitVec 32) V!6393 V!6393 (_ BitVec 32) Int) ListLongMap!2789)

(assert (=> b!204153 (= lt!103290 (getCurrentListMap!958 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103294 () array!9325)

(assert (=> b!204153 (= lt!103296 (getCurrentListMap!958 _keys!825 lt!103294 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204153 (and (= lt!103297 lt!103293) (= lt!103293 lt!103297))))

(assert (=> b!204153 (= lt!103293 (+!459 lt!103291 lt!103289))))

(assert (=> b!204153 (= lt!103289 (tuple2!3887 k0!843 v!520))))

(declare-fun lt!103287 () Unit!6162)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!117 (array!9323 array!9325 (_ BitVec 32) (_ BitVec 32) V!6393 V!6393 (_ BitVec 32) (_ BitVec 64) V!6393 (_ BitVec 32) Int) Unit!6162)

(assert (=> b!204153 (= lt!103287 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!117 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!368 (array!9323 array!9325 (_ BitVec 32) (_ BitVec 32) V!6393 V!6393 (_ BitVec 32) Int) ListLongMap!2789)

(assert (=> b!204153 (= lt!103297 (getCurrentListMapNoExtraKeys!368 _keys!825 lt!103294 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204153 (= lt!103294 (array!9326 (store (arr!4412 _values!649) i!601 (ValueCellFull!2186 v!520)) (size!4738 _values!649)))))

(assert (=> b!204153 (= lt!103291 (getCurrentListMapNoExtraKeys!368 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204154 () Bool)

(declare-fun e!133583 () Bool)

(assert (=> b!204154 (= e!133583 (and e!133580 mapRes!8657))))

(declare-fun condMapEmpty!8657 () Bool)

(declare-fun mapDefault!8657 () ValueCell!2186)

(assert (=> b!204154 (= condMapEmpty!8657 (= (arr!4412 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2186)) mapDefault!8657)))))

(declare-fun b!204155 () Bool)

(declare-fun res!98306 () Bool)

(assert (=> b!204155 (=> (not res!98306) (not e!133579))))

(assert (=> b!204155 (= res!98306 (and (= (size!4738 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4737 _keys!825) (size!4738 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!98301 () Bool)

(assert (=> start!20548 (=> (not res!98301) (not e!133579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20548 (= res!98301 (validMask!0 mask!1149))))

(assert (=> start!20548 e!133579))

(declare-fun array_inv!2895 (array!9325) Bool)

(assert (=> start!20548 (and (array_inv!2895 _values!649) e!133583)))

(assert (=> start!20548 true))

(assert (=> start!20548 tp_is_empty!5059))

(declare-fun array_inv!2896 (array!9323) Bool)

(assert (=> start!20548 (array_inv!2896 _keys!825)))

(assert (=> start!20548 tp!18641))

(declare-fun b!204148 () Bool)

(declare-fun res!98303 () Bool)

(assert (=> b!204148 (=> (not res!98303) (not e!133579))))

(declare-datatypes ((List!2793 0))(
  ( (Nil!2790) (Cons!2789 (h!3431 (_ BitVec 64)) (t!7715 List!2793)) )
))
(declare-fun arrayNoDuplicates!0 (array!9323 (_ BitVec 32) List!2793) Bool)

(assert (=> b!204148 (= res!98303 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2790))))

(assert (= (and start!20548 res!98301) b!204155))

(assert (= (and b!204155 res!98306) b!204145))

(assert (= (and b!204145 res!98299) b!204148))

(assert (= (and b!204148 res!98303) b!204144))

(assert (= (and b!204144 res!98302) b!204147))

(assert (= (and b!204147 res!98300) b!204150))

(assert (= (and b!204150 res!98304) b!204153))

(assert (= (and b!204153 (not res!98305)) b!204152))

(assert (= (and b!204152 (not res!98298)) b!204146))

(assert (= (and b!204154 condMapEmpty!8657) mapIsEmpty!8657))

(assert (= (and b!204154 (not condMapEmpty!8657)) mapNonEmpty!8657))

(get-info :version)

(assert (= (and mapNonEmpty!8657 ((_ is ValueCellFull!2186) mapValue!8657)) b!204149))

(assert (= (and b!204154 ((_ is ValueCellFull!2186) mapDefault!8657)) b!204151))

(assert (= start!20548 b!204154))

(declare-fun m!231195 () Bool)

(assert (=> b!204152 m!231195))

(declare-fun m!231197 () Bool)

(assert (=> b!204152 m!231197))

(declare-fun m!231199 () Bool)

(assert (=> b!204152 m!231199))

(declare-fun m!231201 () Bool)

(assert (=> b!204148 m!231201))

(declare-fun m!231203 () Bool)

(assert (=> mapNonEmpty!8657 m!231203))

(declare-fun m!231205 () Bool)

(assert (=> start!20548 m!231205))

(declare-fun m!231207 () Bool)

(assert (=> start!20548 m!231207))

(declare-fun m!231209 () Bool)

(assert (=> start!20548 m!231209))

(declare-fun m!231211 () Bool)

(assert (=> b!204146 m!231211))

(declare-fun m!231213 () Bool)

(assert (=> b!204146 m!231213))

(declare-fun m!231215 () Bool)

(assert (=> b!204150 m!231215))

(declare-fun m!231217 () Bool)

(assert (=> b!204145 m!231217))

(declare-fun m!231219 () Bool)

(assert (=> b!204153 m!231219))

(declare-fun m!231221 () Bool)

(assert (=> b!204153 m!231221))

(declare-fun m!231223 () Bool)

(assert (=> b!204153 m!231223))

(declare-fun m!231225 () Bool)

(assert (=> b!204153 m!231225))

(declare-fun m!231227 () Bool)

(assert (=> b!204153 m!231227))

(declare-fun m!231229 () Bool)

(assert (=> b!204153 m!231229))

(declare-fun m!231231 () Bool)

(assert (=> b!204153 m!231231))

(declare-fun m!231233 () Bool)

(assert (=> b!204147 m!231233))

(check-sat (not mapNonEmpty!8657) (not start!20548) b_and!11923 (not b!204145) (not b!204148) (not b!204146) (not b!204153) (not b!204152) (not b!204147) (not b_next!5203) tp_is_empty!5059)
(check-sat b_and!11923 (not b_next!5203))
