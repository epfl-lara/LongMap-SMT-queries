; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20122 () Bool)

(assert start!20122)

(declare-fun b_free!4777 () Bool)

(declare-fun b_next!4777 () Bool)

(assert (=> start!20122 (= b_free!4777 (not b_next!4777))))

(declare-fun tp!17362 () Bool)

(declare-fun b_and!11537 () Bool)

(assert (=> start!20122 (= tp!17362 b_and!11537)))

(declare-fun b!197251 () Bool)

(declare-fun e!129832 () Bool)

(assert (=> b!197251 (= e!129832 false)))

(declare-datatypes ((V!5825 0))(
  ( (V!5826 (val!2361 Int)) )
))
(declare-datatypes ((ValueCell!1973 0))(
  ( (ValueCellFull!1973 (v!4332 V!5825)) (EmptyCell!1973) )
))
(declare-datatypes ((array!8511 0))(
  ( (array!8512 (arr!4006 (Array (_ BitVec 32) ValueCell!1973)) (size!4331 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8511)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5825)

(declare-datatypes ((tuple2!3540 0))(
  ( (tuple2!3541 (_1!1781 (_ BitVec 64)) (_2!1781 V!5825)) )
))
(declare-datatypes ((List!2458 0))(
  ( (Nil!2455) (Cons!2454 (h!3096 tuple2!3540) (t!7381 List!2458)) )
))
(declare-datatypes ((ListLongMap!2455 0))(
  ( (ListLongMap!2456 (toList!1243 List!2458)) )
))
(declare-fun lt!97754 () ListLongMap!2455)

(declare-datatypes ((array!8513 0))(
  ( (array!8514 (arr!4007 (Array (_ BitVec 32) (_ BitVec 64))) (size!4332 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8513)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5825)

(declare-fun getCurrentListMapNoExtraKeys!233 (array!8513 array!8511 (_ BitVec 32) (_ BitVec 32) V!5825 V!5825 (_ BitVec 32) Int) ListLongMap!2455)

(assert (=> b!197251 (= lt!97754 (getCurrentListMapNoExtraKeys!233 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197252 () Bool)

(declare-fun res!93245 () Bool)

(assert (=> b!197252 (=> (not res!93245) (not e!129832))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197252 (= res!93245 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4332 _keys!825))))))

(declare-fun b!197254 () Bool)

(declare-fun res!93248 () Bool)

(assert (=> b!197254 (=> (not res!93248) (not e!129832))))

(declare-datatypes ((List!2459 0))(
  ( (Nil!2456) (Cons!2455 (h!3097 (_ BitVec 64)) (t!7382 List!2459)) )
))
(declare-fun arrayNoDuplicates!0 (array!8513 (_ BitVec 32) List!2459) Bool)

(assert (=> b!197254 (= res!93248 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2456))))

(declare-fun b!197255 () Bool)

(declare-fun res!93247 () Bool)

(assert (=> b!197255 (=> (not res!93247) (not e!129832))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197255 (= res!93247 (validKeyInArray!0 k0!843))))

(declare-fun b!197256 () Bool)

(declare-fun e!129831 () Bool)

(declare-fun tp_is_empty!4633 () Bool)

(assert (=> b!197256 (= e!129831 tp_is_empty!4633)))

(declare-fun b!197257 () Bool)

(declare-fun res!93250 () Bool)

(assert (=> b!197257 (=> (not res!93250) (not e!129832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8513 (_ BitVec 32)) Bool)

(assert (=> b!197257 (= res!93250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8018 () Bool)

(declare-fun mapRes!8018 () Bool)

(declare-fun tp!17363 () Bool)

(declare-fun e!129833 () Bool)

(assert (=> mapNonEmpty!8018 (= mapRes!8018 (and tp!17363 e!129833))))

(declare-fun mapKey!8018 () (_ BitVec 32))

(declare-fun mapValue!8018 () ValueCell!1973)

(declare-fun mapRest!8018 () (Array (_ BitVec 32) ValueCell!1973))

(assert (=> mapNonEmpty!8018 (= (arr!4006 _values!649) (store mapRest!8018 mapKey!8018 mapValue!8018))))

(declare-fun b!197258 () Bool)

(declare-fun res!93249 () Bool)

(assert (=> b!197258 (=> (not res!93249) (not e!129832))))

(assert (=> b!197258 (= res!93249 (and (= (size!4331 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4332 _keys!825) (size!4331 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8018 () Bool)

(assert (=> mapIsEmpty!8018 mapRes!8018))

(declare-fun b!197259 () Bool)

(assert (=> b!197259 (= e!129833 tp_is_empty!4633)))

(declare-fun b!197260 () Bool)

(declare-fun e!129830 () Bool)

(assert (=> b!197260 (= e!129830 (and e!129831 mapRes!8018))))

(declare-fun condMapEmpty!8018 () Bool)

(declare-fun mapDefault!8018 () ValueCell!1973)

(assert (=> b!197260 (= condMapEmpty!8018 (= (arr!4006 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1973)) mapDefault!8018)))))

(declare-fun b!197253 () Bool)

(declare-fun res!93246 () Bool)

(assert (=> b!197253 (=> (not res!93246) (not e!129832))))

(assert (=> b!197253 (= res!93246 (= (select (arr!4007 _keys!825) i!601) k0!843))))

(declare-fun res!93244 () Bool)

(assert (=> start!20122 (=> (not res!93244) (not e!129832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20122 (= res!93244 (validMask!0 mask!1149))))

(assert (=> start!20122 e!129832))

(declare-fun array_inv!2605 (array!8511) Bool)

(assert (=> start!20122 (and (array_inv!2605 _values!649) e!129830)))

(assert (=> start!20122 true))

(assert (=> start!20122 tp_is_empty!4633))

(declare-fun array_inv!2606 (array!8513) Bool)

(assert (=> start!20122 (array_inv!2606 _keys!825)))

(assert (=> start!20122 tp!17362))

(assert (= (and start!20122 res!93244) b!197258))

(assert (= (and b!197258 res!93249) b!197257))

(assert (= (and b!197257 res!93250) b!197254))

(assert (= (and b!197254 res!93248) b!197252))

(assert (= (and b!197252 res!93245) b!197255))

(assert (= (and b!197255 res!93247) b!197253))

(assert (= (and b!197253 res!93246) b!197251))

(assert (= (and b!197260 condMapEmpty!8018) mapIsEmpty!8018))

(assert (= (and b!197260 (not condMapEmpty!8018)) mapNonEmpty!8018))

(get-info :version)

(assert (= (and mapNonEmpty!8018 ((_ is ValueCellFull!1973) mapValue!8018)) b!197259))

(assert (= (and b!197260 ((_ is ValueCellFull!1973) mapDefault!8018)) b!197256))

(assert (= start!20122 b!197260))

(declare-fun m!224361 () Bool)

(assert (=> mapNonEmpty!8018 m!224361))

(declare-fun m!224363 () Bool)

(assert (=> b!197254 m!224363))

(declare-fun m!224365 () Bool)

(assert (=> b!197257 m!224365))

(declare-fun m!224367 () Bool)

(assert (=> b!197251 m!224367))

(declare-fun m!224369 () Bool)

(assert (=> b!197255 m!224369))

(declare-fun m!224371 () Bool)

(assert (=> start!20122 m!224371))

(declare-fun m!224373 () Bool)

(assert (=> start!20122 m!224373))

(declare-fun m!224375 () Bool)

(assert (=> start!20122 m!224375))

(declare-fun m!224377 () Bool)

(assert (=> b!197253 m!224377))

(check-sat (not mapNonEmpty!8018) (not b!197255) (not b_next!4777) (not b!197254) b_and!11537 tp_is_empty!4633 (not start!20122) (not b!197251) (not b!197257))
(check-sat b_and!11537 (not b_next!4777))
