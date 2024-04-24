; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20128 () Bool)

(assert start!20128)

(declare-fun b_free!4783 () Bool)

(declare-fun b_next!4783 () Bool)

(assert (=> start!20128 (= b_free!4783 (not b_next!4783))))

(declare-fun tp!17381 () Bool)

(declare-fun b_and!11543 () Bool)

(assert (=> start!20128 (= tp!17381 b_and!11543)))

(declare-fun b!197341 () Bool)

(declare-fun e!129875 () Bool)

(declare-fun tp_is_empty!4639 () Bool)

(assert (=> b!197341 (= e!129875 tp_is_empty!4639)))

(declare-fun b!197342 () Bool)

(declare-fun res!93313 () Bool)

(declare-fun e!129877 () Bool)

(assert (=> b!197342 (=> (not res!93313) (not e!129877))))

(declare-datatypes ((array!8523 0))(
  ( (array!8524 (arr!4012 (Array (_ BitVec 32) (_ BitVec 64))) (size!4337 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8523)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197342 (= res!93313 (= (select (arr!4012 _keys!825) i!601) k0!843))))

(declare-fun b!197343 () Bool)

(declare-fun res!93311 () Bool)

(assert (=> b!197343 (=> (not res!93311) (not e!129877))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5833 0))(
  ( (V!5834 (val!2364 Int)) )
))
(declare-datatypes ((ValueCell!1976 0))(
  ( (ValueCellFull!1976 (v!4335 V!5833)) (EmptyCell!1976) )
))
(declare-datatypes ((array!8525 0))(
  ( (array!8526 (arr!4013 (Array (_ BitVec 32) ValueCell!1976)) (size!4338 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8525)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!197343 (= res!93311 (and (= (size!4338 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4337 _keys!825) (size!4338 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197344 () Bool)

(assert (=> b!197344 (= e!129877 false)))

(declare-datatypes ((tuple2!3544 0))(
  ( (tuple2!3545 (_1!1783 (_ BitVec 64)) (_2!1783 V!5833)) )
))
(declare-datatypes ((List!2461 0))(
  ( (Nil!2458) (Cons!2457 (h!3099 tuple2!3544) (t!7384 List!2461)) )
))
(declare-datatypes ((ListLongMap!2459 0))(
  ( (ListLongMap!2460 (toList!1245 List!2461)) )
))
(declare-fun lt!97763 () ListLongMap!2459)

(declare-fun zeroValue!615 () V!5833)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5833)

(declare-fun getCurrentListMapNoExtraKeys!235 (array!8523 array!8525 (_ BitVec 32) (_ BitVec 32) V!5833 V!5833 (_ BitVec 32) Int) ListLongMap!2459)

(assert (=> b!197344 (= lt!97763 (getCurrentListMapNoExtraKeys!235 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197345 () Bool)

(declare-fun res!93310 () Bool)

(assert (=> b!197345 (=> (not res!93310) (not e!129877))))

(declare-datatypes ((List!2462 0))(
  ( (Nil!2459) (Cons!2458 (h!3100 (_ BitVec 64)) (t!7385 List!2462)) )
))
(declare-fun arrayNoDuplicates!0 (array!8523 (_ BitVec 32) List!2462) Bool)

(assert (=> b!197345 (= res!93310 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2459))))

(declare-fun b!197346 () Bool)

(declare-fun e!129874 () Bool)

(declare-fun e!129878 () Bool)

(declare-fun mapRes!8027 () Bool)

(assert (=> b!197346 (= e!129874 (and e!129878 mapRes!8027))))

(declare-fun condMapEmpty!8027 () Bool)

(declare-fun mapDefault!8027 () ValueCell!1976)

(assert (=> b!197346 (= condMapEmpty!8027 (= (arr!4013 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1976)) mapDefault!8027)))))

(declare-fun b!197347 () Bool)

(declare-fun res!93309 () Bool)

(assert (=> b!197347 (=> (not res!93309) (not e!129877))))

(assert (=> b!197347 (= res!93309 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4337 _keys!825))))))

(declare-fun b!197348 () Bool)

(declare-fun res!93308 () Bool)

(assert (=> b!197348 (=> (not res!93308) (not e!129877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197348 (= res!93308 (validKeyInArray!0 k0!843))))

(declare-fun b!197349 () Bool)

(assert (=> b!197349 (= e!129878 tp_is_empty!4639)))

(declare-fun b!197350 () Bool)

(declare-fun res!93307 () Bool)

(assert (=> b!197350 (=> (not res!93307) (not e!129877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8523 (_ BitVec 32)) Bool)

(assert (=> b!197350 (= res!93307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8027 () Bool)

(assert (=> mapIsEmpty!8027 mapRes!8027))

(declare-fun res!93312 () Bool)

(assert (=> start!20128 (=> (not res!93312) (not e!129877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20128 (= res!93312 (validMask!0 mask!1149))))

(assert (=> start!20128 e!129877))

(declare-fun array_inv!2609 (array!8525) Bool)

(assert (=> start!20128 (and (array_inv!2609 _values!649) e!129874)))

(assert (=> start!20128 true))

(assert (=> start!20128 tp_is_empty!4639))

(declare-fun array_inv!2610 (array!8523) Bool)

(assert (=> start!20128 (array_inv!2610 _keys!825)))

(assert (=> start!20128 tp!17381))

(declare-fun mapNonEmpty!8027 () Bool)

(declare-fun tp!17380 () Bool)

(assert (=> mapNonEmpty!8027 (= mapRes!8027 (and tp!17380 e!129875))))

(declare-fun mapKey!8027 () (_ BitVec 32))

(declare-fun mapRest!8027 () (Array (_ BitVec 32) ValueCell!1976))

(declare-fun mapValue!8027 () ValueCell!1976)

(assert (=> mapNonEmpty!8027 (= (arr!4013 _values!649) (store mapRest!8027 mapKey!8027 mapValue!8027))))

(assert (= (and start!20128 res!93312) b!197343))

(assert (= (and b!197343 res!93311) b!197350))

(assert (= (and b!197350 res!93307) b!197345))

(assert (= (and b!197345 res!93310) b!197347))

(assert (= (and b!197347 res!93309) b!197348))

(assert (= (and b!197348 res!93308) b!197342))

(assert (= (and b!197342 res!93313) b!197344))

(assert (= (and b!197346 condMapEmpty!8027) mapIsEmpty!8027))

(assert (= (and b!197346 (not condMapEmpty!8027)) mapNonEmpty!8027))

(get-info :version)

(assert (= (and mapNonEmpty!8027 ((_ is ValueCellFull!1976) mapValue!8027)) b!197341))

(assert (= (and b!197346 ((_ is ValueCellFull!1976) mapDefault!8027)) b!197349))

(assert (= start!20128 b!197346))

(declare-fun m!224415 () Bool)

(assert (=> b!197350 m!224415))

(declare-fun m!224417 () Bool)

(assert (=> b!197348 m!224417))

(declare-fun m!224419 () Bool)

(assert (=> start!20128 m!224419))

(declare-fun m!224421 () Bool)

(assert (=> start!20128 m!224421))

(declare-fun m!224423 () Bool)

(assert (=> start!20128 m!224423))

(declare-fun m!224425 () Bool)

(assert (=> b!197342 m!224425))

(declare-fun m!224427 () Bool)

(assert (=> b!197344 m!224427))

(declare-fun m!224429 () Bool)

(assert (=> b!197345 m!224429))

(declare-fun m!224431 () Bool)

(assert (=> mapNonEmpty!8027 m!224431))

(check-sat (not b!197348) (not b!197345) (not b!197350) (not start!20128) b_and!11543 (not b!197344) tp_is_empty!4639 (not mapNonEmpty!8027) (not b_next!4783))
(check-sat b_and!11543 (not b_next!4783))
