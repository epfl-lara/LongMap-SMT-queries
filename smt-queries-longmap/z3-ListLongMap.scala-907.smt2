; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20540 () Bool)

(assert start!20540)

(declare-fun b_free!5199 () Bool)

(declare-fun b_next!5199 () Bool)

(assert (=> start!20540 (= b_free!5199 (not b_next!5199))))

(declare-fun tp!18629 () Bool)

(declare-fun b_and!11945 () Bool)

(assert (=> start!20540 (= tp!18629 b_and!11945)))

(declare-fun res!98340 () Bool)

(declare-fun e!133641 () Bool)

(assert (=> start!20540 (=> (not res!98340) (not e!133641))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20540 (= res!98340 (validMask!0 mask!1149))))

(assert (=> start!20540 e!133641))

(declare-datatypes ((V!6387 0))(
  ( (V!6388 (val!2572 Int)) )
))
(declare-datatypes ((ValueCell!2184 0))(
  ( (ValueCellFull!2184 (v!4542 V!6387)) (EmptyCell!2184) )
))
(declare-datatypes ((array!9329 0))(
  ( (array!9330 (arr!4415 (Array (_ BitVec 32) ValueCell!2184)) (size!4740 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9329)

(declare-fun e!133638 () Bool)

(declare-fun array_inv!2917 (array!9329) Bool)

(assert (=> start!20540 (and (array_inv!2917 _values!649) e!133638)))

(assert (=> start!20540 true))

(declare-fun tp_is_empty!5055 () Bool)

(assert (=> start!20540 tp_is_empty!5055))

(declare-datatypes ((array!9331 0))(
  ( (array!9332 (arr!4416 (Array (_ BitVec 32) (_ BitVec 64))) (size!4741 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9331)

(declare-fun array_inv!2918 (array!9331) Bool)

(assert (=> start!20540 (array_inv!2918 _keys!825)))

(assert (=> start!20540 tp!18629))

(declare-fun b!204219 () Bool)

(declare-fun res!98344 () Bool)

(assert (=> b!204219 (=> (not res!98344) (not e!133641))))

(declare-datatypes ((List!2802 0))(
  ( (Nil!2799) (Cons!2798 (h!3440 (_ BitVec 64)) (t!7733 List!2802)) )
))
(declare-fun arrayNoDuplicates!0 (array!9331 (_ BitVec 32) List!2802) Bool)

(assert (=> b!204219 (= res!98344 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2799))))

(declare-fun b!204220 () Bool)

(declare-fun e!133642 () Bool)

(assert (=> b!204220 (= e!133642 tp_is_empty!5055)))

(declare-fun b!204221 () Bool)

(declare-fun res!98346 () Bool)

(assert (=> b!204221 (=> (not res!98346) (not e!133641))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204221 (= res!98346 (= (select (arr!4416 _keys!825) i!601) k0!843))))

(declare-fun b!204222 () Bool)

(declare-fun res!98341 () Bool)

(assert (=> b!204222 (=> (not res!98341) (not e!133641))))

(assert (=> b!204222 (= res!98341 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4741 _keys!825))))))

(declare-fun b!204223 () Bool)

(declare-fun res!98345 () Bool)

(assert (=> b!204223 (=> (not res!98345) (not e!133641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9331 (_ BitVec 32)) Bool)

(assert (=> b!204223 (= res!98345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204224 () Bool)

(declare-fun res!98339 () Bool)

(assert (=> b!204224 (=> (not res!98339) (not e!133641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204224 (= res!98339 (validKeyInArray!0 k0!843))))

(declare-fun b!204225 () Bool)

(declare-fun e!133639 () Bool)

(assert (=> b!204225 (= e!133639 true)))

(declare-datatypes ((tuple2!3902 0))(
  ( (tuple2!3903 (_1!1962 (_ BitVec 64)) (_2!1962 V!6387)) )
))
(declare-datatypes ((List!2803 0))(
  ( (Nil!2800) (Cons!2799 (h!3441 tuple2!3902) (t!7734 List!2803)) )
))
(declare-datatypes ((ListLongMap!2815 0))(
  ( (ListLongMap!2816 (toList!1423 List!2803)) )
))
(declare-fun lt!103404 () ListLongMap!2815)

(declare-fun lt!103399 () ListLongMap!2815)

(declare-fun lt!103400 () tuple2!3902)

(declare-fun +!450 (ListLongMap!2815 tuple2!3902) ListLongMap!2815)

(assert (=> b!204225 (= lt!103404 (+!450 lt!103399 lt!103400))))

(declare-fun lt!103397 () ListLongMap!2815)

(declare-fun v!520 () V!6387)

(declare-fun zeroValue!615 () V!6387)

(declare-datatypes ((Unit!6194 0))(
  ( (Unit!6195) )
))
(declare-fun lt!103398 () Unit!6194)

(declare-fun addCommutativeForDiffKeys!159 (ListLongMap!2815 (_ BitVec 64) V!6387 (_ BitVec 64) V!6387) Unit!6194)

(assert (=> b!204225 (= lt!103398 (addCommutativeForDiffKeys!159 lt!103397 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204226 () Bool)

(declare-fun mapRes!8651 () Bool)

(assert (=> b!204226 (= e!133638 (and e!133642 mapRes!8651))))

(declare-fun condMapEmpty!8651 () Bool)

(declare-fun mapDefault!8651 () ValueCell!2184)

(assert (=> b!204226 (= condMapEmpty!8651 (= (arr!4415 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2184)) mapDefault!8651)))))

(declare-fun b!204227 () Bool)

(declare-fun e!133640 () Bool)

(assert (=> b!204227 (= e!133640 tp_is_empty!5055)))

(declare-fun b!204228 () Bool)

(declare-fun res!98347 () Bool)

(assert (=> b!204228 (=> (not res!98347) (not e!133641))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204228 (= res!98347 (and (= (size!4740 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4741 _keys!825) (size!4740 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8651 () Bool)

(declare-fun tp!18628 () Bool)

(assert (=> mapNonEmpty!8651 (= mapRes!8651 (and tp!18628 e!133640))))

(declare-fun mapValue!8651 () ValueCell!2184)

(declare-fun mapKey!8651 () (_ BitVec 32))

(declare-fun mapRest!8651 () (Array (_ BitVec 32) ValueCell!2184))

(assert (=> mapNonEmpty!8651 (= (arr!4415 _values!649) (store mapRest!8651 mapKey!8651 mapValue!8651))))

(declare-fun mapIsEmpty!8651 () Bool)

(assert (=> mapIsEmpty!8651 mapRes!8651))

(declare-fun b!204229 () Bool)

(declare-fun e!133637 () Bool)

(assert (=> b!204229 (= e!133641 (not e!133637))))

(declare-fun res!98343 () Bool)

(assert (=> b!204229 (=> res!98343 e!133637)))

(assert (=> b!204229 (= res!98343 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!103407 () ListLongMap!2815)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6387)

(declare-fun getCurrentListMap!997 (array!9331 array!9329 (_ BitVec 32) (_ BitVec 32) V!6387 V!6387 (_ BitVec 32) Int) ListLongMap!2815)

(assert (=> b!204229 (= lt!103407 (getCurrentListMap!997 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103406 () ListLongMap!2815)

(declare-fun lt!103402 () array!9329)

(assert (=> b!204229 (= lt!103406 (getCurrentListMap!997 _keys!825 lt!103402 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103401 () ListLongMap!2815)

(declare-fun lt!103396 () ListLongMap!2815)

(assert (=> b!204229 (and (= lt!103401 lt!103396) (= lt!103396 lt!103401))))

(assert (=> b!204229 (= lt!103396 (+!450 lt!103397 lt!103400))))

(assert (=> b!204229 (= lt!103400 (tuple2!3903 k0!843 v!520))))

(declare-fun lt!103405 () Unit!6194)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!110 (array!9331 array!9329 (_ BitVec 32) (_ BitVec 32) V!6387 V!6387 (_ BitVec 32) (_ BitVec 64) V!6387 (_ BitVec 32) Int) Unit!6194)

(assert (=> b!204229 (= lt!103405 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!110 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!371 (array!9331 array!9329 (_ BitVec 32) (_ BitVec 32) V!6387 V!6387 (_ BitVec 32) Int) ListLongMap!2815)

(assert (=> b!204229 (= lt!103401 (getCurrentListMapNoExtraKeys!371 _keys!825 lt!103402 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204229 (= lt!103402 (array!9330 (store (arr!4415 _values!649) i!601 (ValueCellFull!2184 v!520)) (size!4740 _values!649)))))

(assert (=> b!204229 (= lt!103397 (getCurrentListMapNoExtraKeys!371 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204230 () Bool)

(assert (=> b!204230 (= e!133637 e!133639)))

(declare-fun res!98342 () Bool)

(assert (=> b!204230 (=> res!98342 e!133639)))

(assert (=> b!204230 (= res!98342 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!204230 (= lt!103406 lt!103404)))

(declare-fun lt!103403 () tuple2!3902)

(assert (=> b!204230 (= lt!103404 (+!450 lt!103396 lt!103403))))

(assert (=> b!204230 (= lt!103407 lt!103399)))

(assert (=> b!204230 (= lt!103399 (+!450 lt!103397 lt!103403))))

(assert (=> b!204230 (= lt!103406 (+!450 lt!103401 lt!103403))))

(assert (=> b!204230 (= lt!103403 (tuple2!3903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20540 res!98340) b!204228))

(assert (= (and b!204228 res!98347) b!204223))

(assert (= (and b!204223 res!98345) b!204219))

(assert (= (and b!204219 res!98344) b!204222))

(assert (= (and b!204222 res!98341) b!204224))

(assert (= (and b!204224 res!98339) b!204221))

(assert (= (and b!204221 res!98346) b!204229))

(assert (= (and b!204229 (not res!98343)) b!204230))

(assert (= (and b!204230 (not res!98342)) b!204225))

(assert (= (and b!204226 condMapEmpty!8651) mapIsEmpty!8651))

(assert (= (and b!204226 (not condMapEmpty!8651)) mapNonEmpty!8651))

(get-info :version)

(assert (= (and mapNonEmpty!8651 ((_ is ValueCellFull!2184) mapValue!8651)) b!204227))

(assert (= (and b!204226 ((_ is ValueCellFull!2184) mapDefault!8651)) b!204220))

(assert (= start!20540 b!204226))

(declare-fun m!231731 () Bool)

(assert (=> b!204219 m!231731))

(declare-fun m!231733 () Bool)

(assert (=> b!204224 m!231733))

(declare-fun m!231735 () Bool)

(assert (=> mapNonEmpty!8651 m!231735))

(declare-fun m!231737 () Bool)

(assert (=> start!20540 m!231737))

(declare-fun m!231739 () Bool)

(assert (=> start!20540 m!231739))

(declare-fun m!231741 () Bool)

(assert (=> start!20540 m!231741))

(declare-fun m!231743 () Bool)

(assert (=> b!204225 m!231743))

(declare-fun m!231745 () Bool)

(assert (=> b!204225 m!231745))

(declare-fun m!231747 () Bool)

(assert (=> b!204230 m!231747))

(declare-fun m!231749 () Bool)

(assert (=> b!204230 m!231749))

(declare-fun m!231751 () Bool)

(assert (=> b!204230 m!231751))

(declare-fun m!231753 () Bool)

(assert (=> b!204221 m!231753))

(declare-fun m!231755 () Bool)

(assert (=> b!204223 m!231755))

(declare-fun m!231757 () Bool)

(assert (=> b!204229 m!231757))

(declare-fun m!231759 () Bool)

(assert (=> b!204229 m!231759))

(declare-fun m!231761 () Bool)

(assert (=> b!204229 m!231761))

(declare-fun m!231763 () Bool)

(assert (=> b!204229 m!231763))

(declare-fun m!231765 () Bool)

(assert (=> b!204229 m!231765))

(declare-fun m!231767 () Bool)

(assert (=> b!204229 m!231767))

(declare-fun m!231769 () Bool)

(assert (=> b!204229 m!231769))

(check-sat (not start!20540) (not b!204219) (not mapNonEmpty!8651) (not b!204225) (not b!204223) tp_is_empty!5055 (not b_next!5199) (not b!204229) (not b!204230) (not b!204224) b_and!11945)
(check-sat b_and!11945 (not b_next!5199))
