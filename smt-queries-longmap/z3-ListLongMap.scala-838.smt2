; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20128 () Bool)

(assert start!20128)

(declare-fun b_free!4783 () Bool)

(declare-fun b_next!4783 () Bool)

(assert (=> start!20128 (= b_free!4783 (not b_next!4783))))

(declare-fun tp!17380 () Bool)

(declare-fun b_and!11503 () Bool)

(assert (=> start!20128 (= tp!17380 b_and!11503)))

(declare-fun b!197147 () Bool)

(declare-fun res!93195 () Bool)

(declare-fun e!129752 () Bool)

(assert (=> b!197147 (=> (not res!93195) (not e!129752))))

(declare-datatypes ((array!8509 0))(
  ( (array!8510 (arr!4004 (Array (_ BitVec 32) (_ BitVec 64))) (size!4330 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8509)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8509 (_ BitVec 32)) Bool)

(assert (=> b!197147 (= res!93195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197148 () Bool)

(declare-fun res!93193 () Bool)

(assert (=> b!197148 (=> (not res!93193) (not e!129752))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197148 (= res!93193 (validKeyInArray!0 k0!843))))

(declare-fun b!197149 () Bool)

(declare-fun e!129751 () Bool)

(declare-fun e!129750 () Bool)

(declare-fun mapRes!8027 () Bool)

(assert (=> b!197149 (= e!129751 (and e!129750 mapRes!8027))))

(declare-fun condMapEmpty!8027 () Bool)

(declare-datatypes ((V!5833 0))(
  ( (V!5834 (val!2364 Int)) )
))
(declare-datatypes ((ValueCell!1976 0))(
  ( (ValueCellFull!1976 (v!4328 V!5833)) (EmptyCell!1976) )
))
(declare-datatypes ((array!8511 0))(
  ( (array!8512 (arr!4005 (Array (_ BitVec 32) ValueCell!1976)) (size!4331 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8511)

(declare-fun mapDefault!8027 () ValueCell!1976)

(assert (=> b!197149 (= condMapEmpty!8027 (= (arr!4005 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1976)) mapDefault!8027)))))

(declare-fun res!93192 () Bool)

(assert (=> start!20128 (=> (not res!93192) (not e!129752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20128 (= res!93192 (validMask!0 mask!1149))))

(assert (=> start!20128 e!129752))

(declare-fun array_inv!2601 (array!8511) Bool)

(assert (=> start!20128 (and (array_inv!2601 _values!649) e!129751)))

(assert (=> start!20128 true))

(declare-fun tp_is_empty!4639 () Bool)

(assert (=> start!20128 tp_is_empty!4639))

(declare-fun array_inv!2602 (array!8509) Bool)

(assert (=> start!20128 (array_inv!2602 _keys!825)))

(assert (=> start!20128 tp!17380))

(declare-fun b!197150 () Bool)

(declare-fun res!93197 () Bool)

(assert (=> b!197150 (=> (not res!93197) (not e!129752))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197150 (= res!93197 (and (= (size!4331 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4330 _keys!825) (size!4331 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197151 () Bool)

(declare-fun res!93191 () Bool)

(assert (=> b!197151 (=> (not res!93191) (not e!129752))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197151 (= res!93191 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4330 _keys!825))))))

(declare-fun b!197152 () Bool)

(assert (=> b!197152 (= e!129750 tp_is_empty!4639)))

(declare-fun b!197153 () Bool)

(declare-fun res!93194 () Bool)

(assert (=> b!197153 (=> (not res!93194) (not e!129752))))

(assert (=> b!197153 (= res!93194 (= (select (arr!4004 _keys!825) i!601) k0!843))))

(declare-fun b!197154 () Bool)

(declare-fun res!93196 () Bool)

(assert (=> b!197154 (=> (not res!93196) (not e!129752))))

(declare-datatypes ((List!2487 0))(
  ( (Nil!2484) (Cons!2483 (h!3125 (_ BitVec 64)) (t!7409 List!2487)) )
))
(declare-fun arrayNoDuplicates!0 (array!8509 (_ BitVec 32) List!2487) Bool)

(assert (=> b!197154 (= res!93196 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2484))))

(declare-fun mapIsEmpty!8027 () Bool)

(assert (=> mapIsEmpty!8027 mapRes!8027))

(declare-fun b!197155 () Bool)

(assert (=> b!197155 (= e!129752 false)))

(declare-fun zeroValue!615 () V!5833)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5833)

(declare-datatypes ((tuple2!3554 0))(
  ( (tuple2!3555 (_1!1788 (_ BitVec 64)) (_2!1788 V!5833)) )
))
(declare-datatypes ((List!2488 0))(
  ( (Nil!2485) (Cons!2484 (h!3126 tuple2!3554) (t!7410 List!2488)) )
))
(declare-datatypes ((ListLongMap!2457 0))(
  ( (ListLongMap!2458 (toList!1244 List!2488)) )
))
(declare-fun lt!97523 () ListLongMap!2457)

(declare-fun getCurrentListMapNoExtraKeys!224 (array!8509 array!8511 (_ BitVec 32) (_ BitVec 32) V!5833 V!5833 (_ BitVec 32) Int) ListLongMap!2457)

(assert (=> b!197155 (= lt!97523 (getCurrentListMapNoExtraKeys!224 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8027 () Bool)

(declare-fun tp!17381 () Bool)

(declare-fun e!129749 () Bool)

(assert (=> mapNonEmpty!8027 (= mapRes!8027 (and tp!17381 e!129749))))

(declare-fun mapKey!8027 () (_ BitVec 32))

(declare-fun mapRest!8027 () (Array (_ BitVec 32) ValueCell!1976))

(declare-fun mapValue!8027 () ValueCell!1976)

(assert (=> mapNonEmpty!8027 (= (arr!4005 _values!649) (store mapRest!8027 mapKey!8027 mapValue!8027))))

(declare-fun b!197156 () Bool)

(assert (=> b!197156 (= e!129749 tp_is_empty!4639)))

(assert (= (and start!20128 res!93192) b!197150))

(assert (= (and b!197150 res!93197) b!197147))

(assert (= (and b!197147 res!93195) b!197154))

(assert (= (and b!197154 res!93196) b!197151))

(assert (= (and b!197151 res!93191) b!197148))

(assert (= (and b!197148 res!93193) b!197153))

(assert (= (and b!197153 res!93194) b!197155))

(assert (= (and b!197149 condMapEmpty!8027) mapIsEmpty!8027))

(assert (= (and b!197149 (not condMapEmpty!8027)) mapNonEmpty!8027))

(get-info :version)

(assert (= (and mapNonEmpty!8027 ((_ is ValueCellFull!1976) mapValue!8027)) b!197156))

(assert (= (and b!197149 ((_ is ValueCellFull!1976) mapDefault!8027)) b!197152))

(assert (= start!20128 b!197149))

(declare-fun m!223617 () Bool)

(assert (=> b!197148 m!223617))

(declare-fun m!223619 () Bool)

(assert (=> b!197155 m!223619))

(declare-fun m!223621 () Bool)

(assert (=> b!197147 m!223621))

(declare-fun m!223623 () Bool)

(assert (=> b!197153 m!223623))

(declare-fun m!223625 () Bool)

(assert (=> start!20128 m!223625))

(declare-fun m!223627 () Bool)

(assert (=> start!20128 m!223627))

(declare-fun m!223629 () Bool)

(assert (=> start!20128 m!223629))

(declare-fun m!223631 () Bool)

(assert (=> b!197154 m!223631))

(declare-fun m!223633 () Bool)

(assert (=> mapNonEmpty!8027 m!223633))

(check-sat tp_is_empty!4639 b_and!11503 (not b_next!4783) (not mapNonEmpty!8027) (not start!20128) (not b!197147) (not b!197148) (not b!197154) (not b!197155))
(check-sat b_and!11503 (not b_next!4783))
