; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20554 () Bool)

(assert start!20554)

(declare-fun b_free!5209 () Bool)

(declare-fun b_next!5209 () Bool)

(assert (=> start!20554 (= b_free!5209 (not b_next!5209))))

(declare-fun tp!18658 () Bool)

(declare-fun b_and!11929 () Bool)

(assert (=> start!20554 (= tp!18658 b_and!11929)))

(declare-fun b!204254 () Bool)

(declare-fun res!98388 () Bool)

(declare-fun e!133646 () Bool)

(assert (=> b!204254 (=> (not res!98388) (not e!133646))))

(declare-datatypes ((array!9335 0))(
  ( (array!9336 (arr!4417 (Array (_ BitVec 32) (_ BitVec 64))) (size!4743 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9335)

(declare-datatypes ((V!6401 0))(
  ( (V!6402 (val!2577 Int)) )
))
(declare-datatypes ((ValueCell!2189 0))(
  ( (ValueCellFull!2189 (v!4541 V!6401)) (EmptyCell!2189) )
))
(declare-datatypes ((array!9337 0))(
  ( (array!9338 (arr!4418 (Array (_ BitVec 32) ValueCell!2189)) (size!4744 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9337)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204254 (= res!98388 (and (= (size!4744 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4743 _keys!825) (size!4744 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204255 () Bool)

(declare-fun res!98381 () Bool)

(assert (=> b!204255 (=> (not res!98381) (not e!133646))))

(declare-datatypes ((List!2797 0))(
  ( (Nil!2794) (Cons!2793 (h!3435 (_ BitVec 64)) (t!7719 List!2797)) )
))
(declare-fun arrayNoDuplicates!0 (array!9335 (_ BitVec 32) List!2797) Bool)

(assert (=> b!204255 (= res!98381 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2794))))

(declare-fun mapNonEmpty!8666 () Bool)

(declare-fun mapRes!8666 () Bool)

(declare-fun tp!18659 () Bool)

(declare-fun e!133642 () Bool)

(assert (=> mapNonEmpty!8666 (= mapRes!8666 (and tp!18659 e!133642))))

(declare-fun mapKey!8666 () (_ BitVec 32))

(declare-fun mapValue!8666 () ValueCell!2189)

(declare-fun mapRest!8666 () (Array (_ BitVec 32) ValueCell!2189))

(assert (=> mapNonEmpty!8666 (= (arr!4418 _values!649) (store mapRest!8666 mapKey!8666 mapValue!8666))))

(declare-fun b!204256 () Bool)

(declare-fun res!98382 () Bool)

(assert (=> b!204256 (=> (not res!98382) (not e!133646))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204256 (= res!98382 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4743 _keys!825))))))

(declare-fun b!204257 () Bool)

(declare-fun tp_is_empty!5065 () Bool)

(assert (=> b!204257 (= e!133642 tp_is_empty!5065)))

(declare-fun b!204258 () Bool)

(declare-fun res!98389 () Bool)

(declare-fun e!133643 () Bool)

(assert (=> b!204258 (=> (not res!98389) (not e!133643))))

(declare-datatypes ((tuple2!3892 0))(
  ( (tuple2!3893 (_1!1957 (_ BitVec 64)) (_2!1957 V!6401)) )
))
(declare-datatypes ((List!2798 0))(
  ( (Nil!2795) (Cons!2794 (h!3436 tuple2!3892) (t!7720 List!2798)) )
))
(declare-datatypes ((ListLongMap!2795 0))(
  ( (ListLongMap!2796 (toList!1413 List!2798)) )
))
(declare-fun lt!103390 () ListLongMap!2795)

(declare-fun lt!103388 () tuple2!3892)

(declare-fun lt!103394 () ListLongMap!2795)

(declare-fun +!462 (ListLongMap!2795 tuple2!3892) ListLongMap!2795)

(assert (=> b!204258 (= res!98389 (= lt!103394 (+!462 lt!103390 lt!103388)))))

(declare-fun b!204259 () Bool)

(declare-fun e!133641 () Bool)

(declare-fun e!133644 () Bool)

(assert (=> b!204259 (= e!133641 (and e!133644 mapRes!8666))))

(declare-fun condMapEmpty!8666 () Bool)

(declare-fun mapDefault!8666 () ValueCell!2189)

(assert (=> b!204259 (= condMapEmpty!8666 (= (arr!4418 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2189)) mapDefault!8666)))))

(declare-fun mapIsEmpty!8666 () Bool)

(assert (=> mapIsEmpty!8666 mapRes!8666))

(declare-fun res!98384 () Bool)

(assert (=> start!20554 (=> (not res!98384) (not e!133646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20554 (= res!98384 (validMask!0 mask!1149))))

(assert (=> start!20554 e!133646))

(declare-fun array_inv!2901 (array!9337) Bool)

(assert (=> start!20554 (and (array_inv!2901 _values!649) e!133641)))

(assert (=> start!20554 true))

(assert (=> start!20554 tp_is_empty!5065))

(declare-fun array_inv!2902 (array!9335) Bool)

(assert (=> start!20554 (array_inv!2902 _keys!825)))

(assert (=> start!20554 tp!18658))

(declare-fun b!204260 () Bool)

(declare-fun res!98385 () Bool)

(assert (=> b!204260 (=> (not res!98385) (not e!133646))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204260 (= res!98385 (validKeyInArray!0 k0!843))))

(declare-fun b!204261 () Bool)

(declare-fun e!133647 () Bool)

(assert (=> b!204261 (= e!133646 (not e!133647))))

(declare-fun res!98387 () Bool)

(assert (=> b!204261 (=> res!98387 e!133647)))

(assert (=> b!204261 (= res!98387 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!103393 () ListLongMap!2795)

(declare-fun zeroValue!615 () V!6401)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6401)

(declare-fun getCurrentListMap!961 (array!9335 array!9337 (_ BitVec 32) (_ BitVec 32) V!6401 V!6401 (_ BitVec 32) Int) ListLongMap!2795)

(assert (=> b!204261 (= lt!103393 (getCurrentListMap!961 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103387 () array!9337)

(assert (=> b!204261 (= lt!103394 (getCurrentListMap!961 _keys!825 lt!103387 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103389 () ListLongMap!2795)

(assert (=> b!204261 (and (= lt!103389 lt!103390) (= lt!103390 lt!103389))))

(declare-fun v!520 () V!6401)

(declare-fun lt!103392 () ListLongMap!2795)

(assert (=> b!204261 (= lt!103390 (+!462 lt!103392 (tuple2!3893 k0!843 v!520)))))

(declare-datatypes ((Unit!6168 0))(
  ( (Unit!6169) )
))
(declare-fun lt!103391 () Unit!6168)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!120 (array!9335 array!9337 (_ BitVec 32) (_ BitVec 32) V!6401 V!6401 (_ BitVec 32) (_ BitVec 64) V!6401 (_ BitVec 32) Int) Unit!6168)

(assert (=> b!204261 (= lt!103391 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!120 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!371 (array!9335 array!9337 (_ BitVec 32) (_ BitVec 32) V!6401 V!6401 (_ BitVec 32) Int) ListLongMap!2795)

(assert (=> b!204261 (= lt!103389 (getCurrentListMapNoExtraKeys!371 _keys!825 lt!103387 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204261 (= lt!103387 (array!9338 (store (arr!4418 _values!649) i!601 (ValueCellFull!2189 v!520)) (size!4744 _values!649)))))

(assert (=> b!204261 (= lt!103392 (getCurrentListMapNoExtraKeys!371 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204262 () Bool)

(declare-fun res!98386 () Bool)

(assert (=> b!204262 (=> (not res!98386) (not e!133646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9335 (_ BitVec 32)) Bool)

(assert (=> b!204262 (= res!98386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204263 () Bool)

(assert (=> b!204263 (= e!133643 (= lt!103393 (+!462 lt!103392 lt!103388)))))

(declare-fun b!204264 () Bool)

(declare-fun res!98390 () Bool)

(assert (=> b!204264 (=> (not res!98390) (not e!133646))))

(assert (=> b!204264 (= res!98390 (= (select (arr!4417 _keys!825) i!601) k0!843))))

(declare-fun b!204265 () Bool)

(assert (=> b!204265 (= e!133644 tp_is_empty!5065)))

(declare-fun b!204266 () Bool)

(assert (=> b!204266 (= e!133647 true)))

(assert (=> b!204266 e!133643))

(declare-fun res!98383 () Bool)

(assert (=> b!204266 (=> (not res!98383) (not e!133643))))

(assert (=> b!204266 (= res!98383 (= lt!103394 (+!462 lt!103389 lt!103388)))))

(assert (=> b!204266 (= lt!103388 (tuple2!3893 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20554 res!98384) b!204254))

(assert (= (and b!204254 res!98388) b!204262))

(assert (= (and b!204262 res!98386) b!204255))

(assert (= (and b!204255 res!98381) b!204256))

(assert (= (and b!204256 res!98382) b!204260))

(assert (= (and b!204260 res!98385) b!204264))

(assert (= (and b!204264 res!98390) b!204261))

(assert (= (and b!204261 (not res!98387)) b!204266))

(assert (= (and b!204266 res!98383) b!204258))

(assert (= (and b!204258 res!98389) b!204263))

(assert (= (and b!204259 condMapEmpty!8666) mapIsEmpty!8666))

(assert (= (and b!204259 (not condMapEmpty!8666)) mapNonEmpty!8666))

(get-info :version)

(assert (= (and mapNonEmpty!8666 ((_ is ValueCellFull!2189) mapValue!8666)) b!204257))

(assert (= (and b!204259 ((_ is ValueCellFull!2189) mapDefault!8666)) b!204265))

(assert (= start!20554 b!204259))

(declare-fun m!231315 () Bool)

(assert (=> b!204260 m!231315))

(declare-fun m!231317 () Bool)

(assert (=> mapNonEmpty!8666 m!231317))

(declare-fun m!231319 () Bool)

(assert (=> b!204262 m!231319))

(declare-fun m!231321 () Bool)

(assert (=> b!204258 m!231321))

(declare-fun m!231323 () Bool)

(assert (=> b!204264 m!231323))

(declare-fun m!231325 () Bool)

(assert (=> b!204266 m!231325))

(declare-fun m!231327 () Bool)

(assert (=> b!204263 m!231327))

(declare-fun m!231329 () Bool)

(assert (=> start!20554 m!231329))

(declare-fun m!231331 () Bool)

(assert (=> start!20554 m!231331))

(declare-fun m!231333 () Bool)

(assert (=> start!20554 m!231333))

(declare-fun m!231335 () Bool)

(assert (=> b!204255 m!231335))

(declare-fun m!231337 () Bool)

(assert (=> b!204261 m!231337))

(declare-fun m!231339 () Bool)

(assert (=> b!204261 m!231339))

(declare-fun m!231341 () Bool)

(assert (=> b!204261 m!231341))

(declare-fun m!231343 () Bool)

(assert (=> b!204261 m!231343))

(declare-fun m!231345 () Bool)

(assert (=> b!204261 m!231345))

(declare-fun m!231347 () Bool)

(assert (=> b!204261 m!231347))

(declare-fun m!231349 () Bool)

(assert (=> b!204261 m!231349))

(check-sat (not start!20554) tp_is_empty!5065 (not b!204266) (not b!204258) (not b_next!5209) b_and!11929 (not mapNonEmpty!8666) (not b!204261) (not b!204255) (not b!204262) (not b!204260) (not b!204263))
(check-sat b_and!11929 (not b_next!5209))
