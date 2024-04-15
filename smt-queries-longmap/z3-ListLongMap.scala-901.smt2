; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20506 () Bool)

(assert start!20506)

(declare-fun b_free!5161 () Bool)

(declare-fun b_next!5161 () Bool)

(assert (=> start!20506 (= b_free!5161 (not b_next!5161))))

(declare-fun tp!18514 () Bool)

(declare-fun b_and!11881 () Bool)

(assert (=> start!20506 (= tp!18514 b_and!11881)))

(declare-fun b!203388 () Bool)

(declare-fun e!133143 () Bool)

(declare-fun e!133137 () Bool)

(assert (=> b!203388 (= e!133143 e!133137)))

(declare-fun res!97738 () Bool)

(assert (=> b!203388 (=> res!97738 e!133137)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203388 (= res!97738 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6337 0))(
  ( (V!6338 (val!2553 Int)) )
))
(declare-datatypes ((tuple2!3850 0))(
  ( (tuple2!3851 (_1!1936 (_ BitVec 64)) (_2!1936 V!6337)) )
))
(declare-datatypes ((List!2760 0))(
  ( (Nil!2757) (Cons!2756 (h!3398 tuple2!3850) (t!7682 List!2760)) )
))
(declare-datatypes ((ListLongMap!2753 0))(
  ( (ListLongMap!2754 (toList!1392 List!2760)) )
))
(declare-fun lt!102534 () ListLongMap!2753)

(declare-fun lt!102540 () ListLongMap!2753)

(assert (=> b!203388 (= lt!102534 lt!102540)))

(declare-fun lt!102538 () ListLongMap!2753)

(declare-fun lt!102535 () tuple2!3850)

(declare-fun +!441 (ListLongMap!2753 tuple2!3850) ListLongMap!2753)

(assert (=> b!203388 (= lt!102540 (+!441 lt!102538 lt!102535))))

(declare-fun lt!102542 () ListLongMap!2753)

(declare-fun lt!102532 () ListLongMap!2753)

(assert (=> b!203388 (= lt!102542 lt!102532)))

(declare-fun lt!102533 () ListLongMap!2753)

(assert (=> b!203388 (= lt!102532 (+!441 lt!102533 lt!102535))))

(declare-fun lt!102531 () ListLongMap!2753)

(assert (=> b!203388 (= lt!102534 (+!441 lt!102531 lt!102535))))

(declare-fun zeroValue!615 () V!6337)

(assert (=> b!203388 (= lt!102535 (tuple2!3851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203389 () Bool)

(declare-fun e!133138 () Bool)

(declare-fun tp_is_empty!5017 () Bool)

(assert (=> b!203389 (= e!133138 tp_is_empty!5017)))

(declare-fun b!203390 () Bool)

(declare-fun e!133140 () Bool)

(declare-fun mapRes!8594 () Bool)

(assert (=> b!203390 (= e!133140 (and e!133138 mapRes!8594))))

(declare-fun condMapEmpty!8594 () Bool)

(declare-datatypes ((ValueCell!2165 0))(
  ( (ValueCellFull!2165 (v!4517 V!6337)) (EmptyCell!2165) )
))
(declare-datatypes ((array!9243 0))(
  ( (array!9244 (arr!4371 (Array (_ BitVec 32) ValueCell!2165)) (size!4697 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9243)

(declare-fun mapDefault!8594 () ValueCell!2165)

(assert (=> b!203390 (= condMapEmpty!8594 (= (arr!4371 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2165)) mapDefault!8594)))))

(declare-fun b!203391 () Bool)

(declare-fun res!97733 () Bool)

(declare-fun e!133141 () Bool)

(assert (=> b!203391 (=> (not res!97733) (not e!133141))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9245 0))(
  ( (array!9246 (arr!4372 (Array (_ BitVec 32) (_ BitVec 64))) (size!4698 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9245)

(assert (=> b!203391 (= res!97733 (= (select (arr!4372 _keys!825) i!601) k0!843))))

(declare-fun b!203392 () Bool)

(declare-fun res!97736 () Bool)

(assert (=> b!203392 (=> (not res!97736) (not e!133141))))

(declare-datatypes ((List!2761 0))(
  ( (Nil!2758) (Cons!2757 (h!3399 (_ BitVec 64)) (t!7683 List!2761)) )
))
(declare-fun arrayNoDuplicates!0 (array!9245 (_ BitVec 32) List!2761) Bool)

(assert (=> b!203392 (= res!97736 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2758))))

(declare-fun b!203393 () Bool)

(declare-fun e!133139 () Bool)

(assert (=> b!203393 (= e!133139 tp_is_empty!5017)))

(declare-fun b!203394 () Bool)

(declare-fun res!97734 () Bool)

(assert (=> b!203394 (=> (not res!97734) (not e!133141))))

(assert (=> b!203394 (= res!97734 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4698 _keys!825))))))

(declare-fun b!203395 () Bool)

(assert (=> b!203395 (= e!133137 true)))

(declare-fun lt!102539 () tuple2!3850)

(assert (=> b!203395 (= lt!102540 (+!441 lt!102532 lt!102539))))

(declare-datatypes ((Unit!6128 0))(
  ( (Unit!6129) )
))
(declare-fun lt!102537 () Unit!6128)

(declare-fun v!520 () V!6337)

(declare-fun addCommutativeForDiffKeys!139 (ListLongMap!2753 (_ BitVec 64) V!6337 (_ BitVec 64) V!6337) Unit!6128)

(assert (=> b!203395 (= lt!102537 (addCommutativeForDiffKeys!139 lt!102533 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203396 () Bool)

(declare-fun res!97735 () Bool)

(assert (=> b!203396 (=> (not res!97735) (not e!133141))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203396 (= res!97735 (and (= (size!4697 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4698 _keys!825) (size!4697 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203397 () Bool)

(declare-fun res!97731 () Bool)

(assert (=> b!203397 (=> (not res!97731) (not e!133141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203397 (= res!97731 (validKeyInArray!0 k0!843))))

(declare-fun b!203398 () Bool)

(assert (=> b!203398 (= e!133141 (not e!133143))))

(declare-fun res!97739 () Bool)

(assert (=> b!203398 (=> res!97739 e!133143)))

(assert (=> b!203398 (= res!97739 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6337)

(declare-fun getCurrentListMap!942 (array!9245 array!9243 (_ BitVec 32) (_ BitVec 32) V!6337 V!6337 (_ BitVec 32) Int) ListLongMap!2753)

(assert (=> b!203398 (= lt!102542 (getCurrentListMap!942 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102541 () array!9243)

(assert (=> b!203398 (= lt!102534 (getCurrentListMap!942 _keys!825 lt!102541 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203398 (and (= lt!102531 lt!102538) (= lt!102538 lt!102531))))

(assert (=> b!203398 (= lt!102538 (+!441 lt!102533 lt!102539))))

(assert (=> b!203398 (= lt!102539 (tuple2!3851 k0!843 v!520))))

(declare-fun lt!102536 () Unit!6128)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!101 (array!9245 array!9243 (_ BitVec 32) (_ BitVec 32) V!6337 V!6337 (_ BitVec 32) (_ BitVec 64) V!6337 (_ BitVec 32) Int) Unit!6128)

(assert (=> b!203398 (= lt!102536 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!101 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!352 (array!9245 array!9243 (_ BitVec 32) (_ BitVec 32) V!6337 V!6337 (_ BitVec 32) Int) ListLongMap!2753)

(assert (=> b!203398 (= lt!102531 (getCurrentListMapNoExtraKeys!352 _keys!825 lt!102541 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203398 (= lt!102541 (array!9244 (store (arr!4371 _values!649) i!601 (ValueCellFull!2165 v!520)) (size!4697 _values!649)))))

(assert (=> b!203398 (= lt!102533 (getCurrentListMapNoExtraKeys!352 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!97732 () Bool)

(assert (=> start!20506 (=> (not res!97732) (not e!133141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20506 (= res!97732 (validMask!0 mask!1149))))

(assert (=> start!20506 e!133141))

(declare-fun array_inv!2865 (array!9243) Bool)

(assert (=> start!20506 (and (array_inv!2865 _values!649) e!133140)))

(assert (=> start!20506 true))

(assert (=> start!20506 tp_is_empty!5017))

(declare-fun array_inv!2866 (array!9245) Bool)

(assert (=> start!20506 (array_inv!2866 _keys!825)))

(assert (=> start!20506 tp!18514))

(declare-fun mapNonEmpty!8594 () Bool)

(declare-fun tp!18515 () Bool)

(assert (=> mapNonEmpty!8594 (= mapRes!8594 (and tp!18515 e!133139))))

(declare-fun mapKey!8594 () (_ BitVec 32))

(declare-fun mapRest!8594 () (Array (_ BitVec 32) ValueCell!2165))

(declare-fun mapValue!8594 () ValueCell!2165)

(assert (=> mapNonEmpty!8594 (= (arr!4371 _values!649) (store mapRest!8594 mapKey!8594 mapValue!8594))))

(declare-fun b!203399 () Bool)

(declare-fun res!97737 () Bool)

(assert (=> b!203399 (=> (not res!97737) (not e!133141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9245 (_ BitVec 32)) Bool)

(assert (=> b!203399 (= res!97737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8594 () Bool)

(assert (=> mapIsEmpty!8594 mapRes!8594))

(assert (= (and start!20506 res!97732) b!203396))

(assert (= (and b!203396 res!97735) b!203399))

(assert (= (and b!203399 res!97737) b!203392))

(assert (= (and b!203392 res!97736) b!203394))

(assert (= (and b!203394 res!97734) b!203397))

(assert (= (and b!203397 res!97731) b!203391))

(assert (= (and b!203391 res!97733) b!203398))

(assert (= (and b!203398 (not res!97739)) b!203388))

(assert (= (and b!203388 (not res!97738)) b!203395))

(assert (= (and b!203390 condMapEmpty!8594) mapIsEmpty!8594))

(assert (= (and b!203390 (not condMapEmpty!8594)) mapNonEmpty!8594))

(get-info :version)

(assert (= (and mapNonEmpty!8594 ((_ is ValueCellFull!2165) mapValue!8594)) b!203393))

(assert (= (and b!203390 ((_ is ValueCellFull!2165) mapDefault!8594)) b!203389))

(assert (= start!20506 b!203390))

(declare-fun m!230355 () Bool)

(assert (=> mapNonEmpty!8594 m!230355))

(declare-fun m!230357 () Bool)

(assert (=> b!203388 m!230357))

(declare-fun m!230359 () Bool)

(assert (=> b!203388 m!230359))

(declare-fun m!230361 () Bool)

(assert (=> b!203388 m!230361))

(declare-fun m!230363 () Bool)

(assert (=> b!203392 m!230363))

(declare-fun m!230365 () Bool)

(assert (=> b!203399 m!230365))

(declare-fun m!230367 () Bool)

(assert (=> start!20506 m!230367))

(declare-fun m!230369 () Bool)

(assert (=> start!20506 m!230369))

(declare-fun m!230371 () Bool)

(assert (=> start!20506 m!230371))

(declare-fun m!230373 () Bool)

(assert (=> b!203395 m!230373))

(declare-fun m!230375 () Bool)

(assert (=> b!203395 m!230375))

(declare-fun m!230377 () Bool)

(assert (=> b!203398 m!230377))

(declare-fun m!230379 () Bool)

(assert (=> b!203398 m!230379))

(declare-fun m!230381 () Bool)

(assert (=> b!203398 m!230381))

(declare-fun m!230383 () Bool)

(assert (=> b!203398 m!230383))

(declare-fun m!230385 () Bool)

(assert (=> b!203398 m!230385))

(declare-fun m!230387 () Bool)

(assert (=> b!203398 m!230387))

(declare-fun m!230389 () Bool)

(assert (=> b!203398 m!230389))

(declare-fun m!230391 () Bool)

(assert (=> b!203397 m!230391))

(declare-fun m!230393 () Bool)

(assert (=> b!203391 m!230393))

(check-sat (not b!203397) (not b!203399) (not start!20506) (not mapNonEmpty!8594) (not b_next!5161) tp_is_empty!5017 (not b!203398) (not b!203395) (not b!203392) (not b!203388) b_and!11881)
(check-sat b_and!11881 (not b_next!5161))
