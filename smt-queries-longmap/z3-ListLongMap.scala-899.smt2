; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20494 () Bool)

(assert start!20494)

(declare-fun b_free!5149 () Bool)

(declare-fun b_next!5149 () Bool)

(assert (=> start!20494 (= b_free!5149 (not b_next!5149))))

(declare-fun tp!18479 () Bool)

(declare-fun b_and!11869 () Bool)

(assert (=> start!20494 (= tp!18479 b_and!11869)))

(declare-fun b!203172 () Bool)

(declare-fun res!97572 () Bool)

(declare-fun e!133014 () Bool)

(assert (=> b!203172 (=> (not res!97572) (not e!133014))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203172 (= res!97572 (validKeyInArray!0 k0!843))))

(declare-fun b!203173 () Bool)

(declare-fun e!133013 () Bool)

(declare-fun e!133016 () Bool)

(declare-fun mapRes!8576 () Bool)

(assert (=> b!203173 (= e!133013 (and e!133016 mapRes!8576))))

(declare-fun condMapEmpty!8576 () Bool)

(declare-datatypes ((V!6321 0))(
  ( (V!6322 (val!2547 Int)) )
))
(declare-datatypes ((ValueCell!2159 0))(
  ( (ValueCellFull!2159 (v!4511 V!6321)) (EmptyCell!2159) )
))
(declare-datatypes ((array!9219 0))(
  ( (array!9220 (arr!4359 (Array (_ BitVec 32) ValueCell!2159)) (size!4685 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9219)

(declare-fun mapDefault!8576 () ValueCell!2159)

(assert (=> b!203173 (= condMapEmpty!8576 (= (arr!4359 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2159)) mapDefault!8576)))))

(declare-fun b!203174 () Bool)

(declare-fun res!97571 () Bool)

(assert (=> b!203174 (=> (not res!97571) (not e!133014))))

(declare-datatypes ((array!9221 0))(
  ( (array!9222 (arr!4360 (Array (_ BitVec 32) (_ BitVec 64))) (size!4686 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9221)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203174 (= res!97571 (and (= (size!4685 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4686 _keys!825) (size!4685 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203175 () Bool)

(declare-fun res!97570 () Bool)

(assert (=> b!203175 (=> (not res!97570) (not e!133014))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203175 (= res!97570 (= (select (arr!4360 _keys!825) i!601) k0!843))))

(declare-fun b!203176 () Bool)

(declare-fun e!133017 () Bool)

(assert (=> b!203176 (= e!133014 (not e!133017))))

(declare-fun res!97574 () Bool)

(assert (=> b!203176 (=> res!97574 e!133017)))

(assert (=> b!203176 (= res!97574 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6321)

(declare-datatypes ((tuple2!3840 0))(
  ( (tuple2!3841 (_1!1931 (_ BitVec 64)) (_2!1931 V!6321)) )
))
(declare-datatypes ((List!2751 0))(
  ( (Nil!2748) (Cons!2747 (h!3389 tuple2!3840) (t!7673 List!2751)) )
))
(declare-datatypes ((ListLongMap!2743 0))(
  ( (ListLongMap!2744 (toList!1387 List!2751)) )
))
(declare-fun lt!102319 () ListLongMap!2743)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6321)

(declare-fun getCurrentListMap!939 (array!9221 array!9219 (_ BitVec 32) (_ BitVec 32) V!6321 V!6321 (_ BitVec 32) Int) ListLongMap!2743)

(assert (=> b!203176 (= lt!102319 (getCurrentListMap!939 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102318 () ListLongMap!2743)

(declare-fun lt!102321 () array!9219)

(assert (=> b!203176 (= lt!102318 (getCurrentListMap!939 _keys!825 lt!102321 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102317 () ListLongMap!2743)

(declare-fun lt!102320 () ListLongMap!2743)

(assert (=> b!203176 (and (= lt!102317 lt!102320) (= lt!102320 lt!102317))))

(declare-fun lt!102323 () ListLongMap!2743)

(declare-fun lt!102325 () tuple2!3840)

(declare-fun +!436 (ListLongMap!2743 tuple2!3840) ListLongMap!2743)

(assert (=> b!203176 (= lt!102320 (+!436 lt!102323 lt!102325))))

(declare-fun v!520 () V!6321)

(assert (=> b!203176 (= lt!102325 (tuple2!3841 k0!843 v!520))))

(declare-datatypes ((Unit!6120 0))(
  ( (Unit!6121) )
))
(declare-fun lt!102315 () Unit!6120)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!98 (array!9221 array!9219 (_ BitVec 32) (_ BitVec 32) V!6321 V!6321 (_ BitVec 32) (_ BitVec 64) V!6321 (_ BitVec 32) Int) Unit!6120)

(assert (=> b!203176 (= lt!102315 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!98 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!349 (array!9221 array!9219 (_ BitVec 32) (_ BitVec 32) V!6321 V!6321 (_ BitVec 32) Int) ListLongMap!2743)

(assert (=> b!203176 (= lt!102317 (getCurrentListMapNoExtraKeys!349 _keys!825 lt!102321 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203176 (= lt!102321 (array!9220 (store (arr!4359 _values!649) i!601 (ValueCellFull!2159 v!520)) (size!4685 _values!649)))))

(assert (=> b!203176 (= lt!102323 (getCurrentListMapNoExtraKeys!349 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!97575 () Bool)

(assert (=> start!20494 (=> (not res!97575) (not e!133014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20494 (= res!97575 (validMask!0 mask!1149))))

(assert (=> start!20494 e!133014))

(declare-fun array_inv!2859 (array!9219) Bool)

(assert (=> start!20494 (and (array_inv!2859 _values!649) e!133013)))

(assert (=> start!20494 true))

(declare-fun tp_is_empty!5005 () Bool)

(assert (=> start!20494 tp_is_empty!5005))

(declare-fun array_inv!2860 (array!9221) Bool)

(assert (=> start!20494 (array_inv!2860 _keys!825)))

(assert (=> start!20494 tp!18479))

(declare-fun b!203177 () Bool)

(declare-fun e!133011 () Bool)

(assert (=> b!203177 (= e!133011 tp_is_empty!5005)))

(declare-fun mapNonEmpty!8576 () Bool)

(declare-fun tp!18478 () Bool)

(assert (=> mapNonEmpty!8576 (= mapRes!8576 (and tp!18478 e!133011))))

(declare-fun mapRest!8576 () (Array (_ BitVec 32) ValueCell!2159))

(declare-fun mapValue!8576 () ValueCell!2159)

(declare-fun mapKey!8576 () (_ BitVec 32))

(assert (=> mapNonEmpty!8576 (= (arr!4359 _values!649) (store mapRest!8576 mapKey!8576 mapValue!8576))))

(declare-fun mapIsEmpty!8576 () Bool)

(assert (=> mapIsEmpty!8576 mapRes!8576))

(declare-fun b!203178 () Bool)

(declare-fun res!97573 () Bool)

(assert (=> b!203178 (=> (not res!97573) (not e!133014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9221 (_ BitVec 32)) Bool)

(assert (=> b!203178 (= res!97573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203179 () Bool)

(declare-fun res!97577 () Bool)

(assert (=> b!203179 (=> (not res!97577) (not e!133014))))

(declare-datatypes ((List!2752 0))(
  ( (Nil!2749) (Cons!2748 (h!3390 (_ BitVec 64)) (t!7674 List!2752)) )
))
(declare-fun arrayNoDuplicates!0 (array!9221 (_ BitVec 32) List!2752) Bool)

(assert (=> b!203179 (= res!97577 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2749))))

(declare-fun b!203180 () Bool)

(declare-fun e!133015 () Bool)

(assert (=> b!203180 (= e!133015 (bvsle #b00000000000000000000000000000000 (size!4686 _keys!825)))))

(declare-fun lt!102324 () ListLongMap!2743)

(declare-fun lt!102326 () ListLongMap!2743)

(assert (=> b!203180 (= lt!102324 (+!436 lt!102326 lt!102325))))

(declare-fun lt!102322 () Unit!6120)

(declare-fun addCommutativeForDiffKeys!135 (ListLongMap!2743 (_ BitVec 64) V!6321 (_ BitVec 64) V!6321) Unit!6120)

(assert (=> b!203180 (= lt!102322 (addCommutativeForDiffKeys!135 lt!102323 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203181 () Bool)

(declare-fun res!97569 () Bool)

(assert (=> b!203181 (=> (not res!97569) (not e!133014))))

(assert (=> b!203181 (= res!97569 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4686 _keys!825))))))

(declare-fun b!203182 () Bool)

(assert (=> b!203182 (= e!133017 e!133015)))

(declare-fun res!97576 () Bool)

(assert (=> b!203182 (=> res!97576 e!133015)))

(assert (=> b!203182 (= res!97576 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!203182 (= lt!102318 lt!102324)))

(declare-fun lt!102316 () tuple2!3840)

(assert (=> b!203182 (= lt!102324 (+!436 lt!102320 lt!102316))))

(assert (=> b!203182 (= lt!102319 lt!102326)))

(assert (=> b!203182 (= lt!102326 (+!436 lt!102323 lt!102316))))

(assert (=> b!203182 (= lt!102318 (+!436 lt!102317 lt!102316))))

(assert (=> b!203182 (= lt!102316 (tuple2!3841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203183 () Bool)

(assert (=> b!203183 (= e!133016 tp_is_empty!5005)))

(assert (= (and start!20494 res!97575) b!203174))

(assert (= (and b!203174 res!97571) b!203178))

(assert (= (and b!203178 res!97573) b!203179))

(assert (= (and b!203179 res!97577) b!203181))

(assert (= (and b!203181 res!97569) b!203172))

(assert (= (and b!203172 res!97572) b!203175))

(assert (= (and b!203175 res!97570) b!203176))

(assert (= (and b!203176 (not res!97574)) b!203182))

(assert (= (and b!203182 (not res!97576)) b!203180))

(assert (= (and b!203173 condMapEmpty!8576) mapIsEmpty!8576))

(assert (= (and b!203173 (not condMapEmpty!8576)) mapNonEmpty!8576))

(get-info :version)

(assert (= (and mapNonEmpty!8576 ((_ is ValueCellFull!2159) mapValue!8576)) b!203177))

(assert (= (and b!203173 ((_ is ValueCellFull!2159) mapDefault!8576)) b!203183))

(assert (= start!20494 b!203173))

(declare-fun m!230115 () Bool)

(assert (=> b!203172 m!230115))

(declare-fun m!230117 () Bool)

(assert (=> b!203178 m!230117))

(declare-fun m!230119 () Bool)

(assert (=> b!203180 m!230119))

(declare-fun m!230121 () Bool)

(assert (=> b!203180 m!230121))

(declare-fun m!230123 () Bool)

(assert (=> b!203182 m!230123))

(declare-fun m!230125 () Bool)

(assert (=> b!203182 m!230125))

(declare-fun m!230127 () Bool)

(assert (=> b!203182 m!230127))

(declare-fun m!230129 () Bool)

(assert (=> b!203179 m!230129))

(declare-fun m!230131 () Bool)

(assert (=> b!203175 m!230131))

(declare-fun m!230133 () Bool)

(assert (=> mapNonEmpty!8576 m!230133))

(declare-fun m!230135 () Bool)

(assert (=> start!20494 m!230135))

(declare-fun m!230137 () Bool)

(assert (=> start!20494 m!230137))

(declare-fun m!230139 () Bool)

(assert (=> start!20494 m!230139))

(declare-fun m!230141 () Bool)

(assert (=> b!203176 m!230141))

(declare-fun m!230143 () Bool)

(assert (=> b!203176 m!230143))

(declare-fun m!230145 () Bool)

(assert (=> b!203176 m!230145))

(declare-fun m!230147 () Bool)

(assert (=> b!203176 m!230147))

(declare-fun m!230149 () Bool)

(assert (=> b!203176 m!230149))

(declare-fun m!230151 () Bool)

(assert (=> b!203176 m!230151))

(declare-fun m!230153 () Bool)

(assert (=> b!203176 m!230153))

(check-sat (not b!203180) (not b!203179) (not b!203172) b_and!11869 tp_is_empty!5005 (not mapNonEmpty!8576) (not b!203178) (not b!203182) (not b!203176) (not b_next!5149) (not start!20494))
(check-sat b_and!11869 (not b_next!5149))
