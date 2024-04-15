; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21182 () Bool)

(assert start!21182)

(declare-fun b_free!5629 () Bool)

(declare-fun b_next!5629 () Bool)

(assert (=> start!21182 (= b_free!5629 (not b_next!5629))))

(declare-fun tp!19958 () Bool)

(declare-fun b_and!12469 () Bool)

(assert (=> start!21182 (= tp!19958 b_and!12469)))

(declare-fun b!213149 () Bool)

(declare-fun e!138633 () Bool)

(declare-fun e!138635 () Bool)

(declare-fun mapRes!9335 () Bool)

(assert (=> b!213149 (= e!138633 (and e!138635 mapRes!9335))))

(declare-fun condMapEmpty!9335 () Bool)

(declare-datatypes ((V!6969 0))(
  ( (V!6970 (val!2790 Int)) )
))
(declare-datatypes ((ValueCell!2402 0))(
  ( (ValueCellFull!2402 (v!4794 V!6969)) (EmptyCell!2402) )
))
(declare-datatypes ((array!10175 0))(
  ( (array!10176 (arr!4827 (Array (_ BitVec 32) ValueCell!2402)) (size!5153 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10175)

(declare-fun mapDefault!9335 () ValueCell!2402)

(assert (=> b!213149 (= condMapEmpty!9335 (= (arr!4827 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2402)) mapDefault!9335)))))

(declare-fun b!213150 () Bool)

(declare-fun res!104280 () Bool)

(declare-fun e!138636 () Bool)

(assert (=> b!213150 (=> (not res!104280) (not e!138636))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!10177 0))(
  ( (array!10178 (arr!4828 (Array (_ BitVec 32) (_ BitVec 64))) (size!5154 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10177)

(assert (=> b!213150 (= res!104280 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5154 _keys!825))))))

(declare-fun b!213151 () Bool)

(declare-fun res!104285 () Bool)

(assert (=> b!213151 (=> (not res!104285) (not e!138636))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!213151 (= res!104285 (= (select (arr!4828 _keys!825) i!601) k0!843))))

(declare-fun b!213152 () Bool)

(declare-fun res!104281 () Bool)

(assert (=> b!213152 (=> (not res!104281) (not e!138636))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!213152 (= res!104281 (and (= (size!5153 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5154 _keys!825) (size!5153 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!213153 () Bool)

(declare-fun res!104284 () Bool)

(assert (=> b!213153 (=> (not res!104284) (not e!138636))))

(declare-datatypes ((List!3096 0))(
  ( (Nil!3093) (Cons!3092 (h!3734 (_ BitVec 64)) (t!8038 List!3096)) )
))
(declare-fun arrayNoDuplicates!0 (array!10177 (_ BitVec 32) List!3096) Bool)

(assert (=> b!213153 (= res!104284 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3093))))

(declare-fun b!213154 () Bool)

(declare-fun e!138631 () Bool)

(declare-fun e!138632 () Bool)

(assert (=> b!213154 (= e!138631 e!138632)))

(declare-fun res!104283 () Bool)

(assert (=> b!213154 (=> res!104283 e!138632)))

(assert (=> b!213154 (= res!104283 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4188 0))(
  ( (tuple2!4189 (_1!2105 (_ BitVec 64)) (_2!2105 V!6969)) )
))
(declare-datatypes ((List!3097 0))(
  ( (Nil!3094) (Cons!3093 (h!3735 tuple2!4188) (t!8039 List!3097)) )
))
(declare-datatypes ((ListLongMap!3091 0))(
  ( (ListLongMap!3092 (toList!1561 List!3097)) )
))
(declare-fun lt!109995 () ListLongMap!3091)

(declare-fun lt!110002 () ListLongMap!3091)

(assert (=> b!213154 (= lt!109995 lt!110002)))

(declare-fun lt!109996 () ListLongMap!3091)

(declare-fun lt!109998 () tuple2!4188)

(declare-fun +!585 (ListLongMap!3091 tuple2!4188) ListLongMap!3091)

(assert (=> b!213154 (= lt!110002 (+!585 lt!109996 lt!109998))))

(declare-fun lt!109993 () ListLongMap!3091)

(declare-fun lt!110004 () ListLongMap!3091)

(assert (=> b!213154 (= lt!109993 lt!110004)))

(declare-fun lt!110000 () ListLongMap!3091)

(assert (=> b!213154 (= lt!110004 (+!585 lt!110000 lt!109998))))

(declare-fun lt!109994 () ListLongMap!3091)

(assert (=> b!213154 (= lt!109993 (+!585 lt!109994 lt!109998))))

(declare-fun minValue!615 () V!6969)

(assert (=> b!213154 (= lt!109998 (tuple2!4189 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!9335 () Bool)

(assert (=> mapIsEmpty!9335 mapRes!9335))

(declare-fun b!213155 () Bool)

(declare-fun lt!110001 () tuple2!4188)

(assert (=> b!213155 (= e!138632 (= (+!585 lt!109995 lt!110001) lt!109993))))

(assert (=> b!213155 (= lt!110004 (+!585 lt!110002 lt!110001))))

(declare-datatypes ((Unit!6422 0))(
  ( (Unit!6423) )
))
(declare-fun lt!110003 () Unit!6422)

(declare-fun v!520 () V!6969)

(declare-fun addCommutativeForDiffKeys!206 (ListLongMap!3091 (_ BitVec 64) V!6969 (_ BitVec 64) V!6969) Unit!6422)

(assert (=> b!213155 (= lt!110003 (addCommutativeForDiffKeys!206 lt!109996 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213156 () Bool)

(assert (=> b!213156 (= e!138636 (not e!138631))))

(declare-fun res!104287 () Bool)

(assert (=> b!213156 (=> res!104287 e!138631)))

(assert (=> b!213156 (= res!104287 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6969)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1071 (array!10177 array!10175 (_ BitVec 32) (_ BitVec 32) V!6969 V!6969 (_ BitVec 32) Int) ListLongMap!3091)

(assert (=> b!213156 (= lt!109995 (getCurrentListMap!1071 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109997 () array!10175)

(assert (=> b!213156 (= lt!109993 (getCurrentListMap!1071 _keys!825 lt!109997 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213156 (and (= lt!109994 lt!110000) (= lt!110000 lt!109994))))

(assert (=> b!213156 (= lt!110000 (+!585 lt!109996 lt!110001))))

(assert (=> b!213156 (= lt!110001 (tuple2!4189 k0!843 v!520))))

(declare-fun lt!109999 () Unit!6422)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!232 (array!10177 array!10175 (_ BitVec 32) (_ BitVec 32) V!6969 V!6969 (_ BitVec 32) (_ BitVec 64) V!6969 (_ BitVec 32) Int) Unit!6422)

(assert (=> b!213156 (= lt!109999 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!232 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!508 (array!10177 array!10175 (_ BitVec 32) (_ BitVec 32) V!6969 V!6969 (_ BitVec 32) Int) ListLongMap!3091)

(assert (=> b!213156 (= lt!109994 (getCurrentListMapNoExtraKeys!508 _keys!825 lt!109997 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213156 (= lt!109997 (array!10176 (store (arr!4827 _values!649) i!601 (ValueCellFull!2402 v!520)) (size!5153 _values!649)))))

(assert (=> b!213156 (= lt!109996 (getCurrentListMapNoExtraKeys!508 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213157 () Bool)

(declare-fun e!138634 () Bool)

(declare-fun tp_is_empty!5491 () Bool)

(assert (=> b!213157 (= e!138634 tp_is_empty!5491)))

(declare-fun res!104282 () Bool)

(assert (=> start!21182 (=> (not res!104282) (not e!138636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21182 (= res!104282 (validMask!0 mask!1149))))

(assert (=> start!21182 e!138636))

(declare-fun array_inv!3171 (array!10175) Bool)

(assert (=> start!21182 (and (array_inv!3171 _values!649) e!138633)))

(assert (=> start!21182 true))

(assert (=> start!21182 tp_is_empty!5491))

(declare-fun array_inv!3172 (array!10177) Bool)

(assert (=> start!21182 (array_inv!3172 _keys!825)))

(assert (=> start!21182 tp!19958))

(declare-fun b!213158 () Bool)

(declare-fun res!104279 () Bool)

(assert (=> b!213158 (=> (not res!104279) (not e!138636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10177 (_ BitVec 32)) Bool)

(assert (=> b!213158 (= res!104279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213159 () Bool)

(declare-fun res!104286 () Bool)

(assert (=> b!213159 (=> (not res!104286) (not e!138636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213159 (= res!104286 (validKeyInArray!0 k0!843))))

(declare-fun b!213160 () Bool)

(assert (=> b!213160 (= e!138635 tp_is_empty!5491)))

(declare-fun mapNonEmpty!9335 () Bool)

(declare-fun tp!19957 () Bool)

(assert (=> mapNonEmpty!9335 (= mapRes!9335 (and tp!19957 e!138634))))

(declare-fun mapValue!9335 () ValueCell!2402)

(declare-fun mapRest!9335 () (Array (_ BitVec 32) ValueCell!2402))

(declare-fun mapKey!9335 () (_ BitVec 32))

(assert (=> mapNonEmpty!9335 (= (arr!4827 _values!649) (store mapRest!9335 mapKey!9335 mapValue!9335))))

(assert (= (and start!21182 res!104282) b!213152))

(assert (= (and b!213152 res!104281) b!213158))

(assert (= (and b!213158 res!104279) b!213153))

(assert (= (and b!213153 res!104284) b!213150))

(assert (= (and b!213150 res!104280) b!213159))

(assert (= (and b!213159 res!104286) b!213151))

(assert (= (and b!213151 res!104285) b!213156))

(assert (= (and b!213156 (not res!104287)) b!213154))

(assert (= (and b!213154 (not res!104283)) b!213155))

(assert (= (and b!213149 condMapEmpty!9335) mapIsEmpty!9335))

(assert (= (and b!213149 (not condMapEmpty!9335)) mapNonEmpty!9335))

(get-info :version)

(assert (= (and mapNonEmpty!9335 ((_ is ValueCellFull!2402) mapValue!9335)) b!213157))

(assert (= (and b!213149 ((_ is ValueCellFull!2402) mapDefault!9335)) b!213160))

(assert (= start!21182 b!213149))

(declare-fun m!240533 () Bool)

(assert (=> b!213151 m!240533))

(declare-fun m!240535 () Bool)

(assert (=> b!213159 m!240535))

(declare-fun m!240537 () Bool)

(assert (=> mapNonEmpty!9335 m!240537))

(declare-fun m!240539 () Bool)

(assert (=> b!213154 m!240539))

(declare-fun m!240541 () Bool)

(assert (=> b!213154 m!240541))

(declare-fun m!240543 () Bool)

(assert (=> b!213154 m!240543))

(declare-fun m!240545 () Bool)

(assert (=> b!213158 m!240545))

(declare-fun m!240547 () Bool)

(assert (=> b!213153 m!240547))

(declare-fun m!240549 () Bool)

(assert (=> b!213155 m!240549))

(declare-fun m!240551 () Bool)

(assert (=> b!213155 m!240551))

(declare-fun m!240553 () Bool)

(assert (=> b!213155 m!240553))

(declare-fun m!240555 () Bool)

(assert (=> start!21182 m!240555))

(declare-fun m!240557 () Bool)

(assert (=> start!21182 m!240557))

(declare-fun m!240559 () Bool)

(assert (=> start!21182 m!240559))

(declare-fun m!240561 () Bool)

(assert (=> b!213156 m!240561))

(declare-fun m!240563 () Bool)

(assert (=> b!213156 m!240563))

(declare-fun m!240565 () Bool)

(assert (=> b!213156 m!240565))

(declare-fun m!240567 () Bool)

(assert (=> b!213156 m!240567))

(declare-fun m!240569 () Bool)

(assert (=> b!213156 m!240569))

(declare-fun m!240571 () Bool)

(assert (=> b!213156 m!240571))

(declare-fun m!240573 () Bool)

(assert (=> b!213156 m!240573))

(check-sat (not b!213153) (not start!21182) (not b!213154) (not mapNonEmpty!9335) tp_is_empty!5491 (not b!213155) (not b!213156) (not b!213158) (not b!213159) b_and!12469 (not b_next!5629))
(check-sat b_and!12469 (not b_next!5629))
