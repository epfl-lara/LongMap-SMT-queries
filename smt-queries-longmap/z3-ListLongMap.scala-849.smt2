; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20192 () Bool)

(assert start!20192)

(declare-fun b_free!4851 () Bool)

(declare-fun b_next!4851 () Bool)

(assert (=> start!20192 (= b_free!4851 (not b_next!4851))))

(declare-fun tp!17584 () Bool)

(declare-fun b_and!11597 () Bool)

(assert (=> start!20192 (= tp!17584 b_and!11597)))

(declare-fun res!94000 () Bool)

(declare-fun e!130362 () Bool)

(assert (=> start!20192 (=> (not res!94000) (not e!130362))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20192 (= res!94000 (validMask!0 mask!1149))))

(assert (=> start!20192 e!130362))

(declare-datatypes ((V!5923 0))(
  ( (V!5924 (val!2398 Int)) )
))
(declare-datatypes ((ValueCell!2010 0))(
  ( (ValueCellFull!2010 (v!4368 V!5923)) (EmptyCell!2010) )
))
(declare-datatypes ((array!8663 0))(
  ( (array!8664 (arr!4082 (Array (_ BitVec 32) ValueCell!2010)) (size!4407 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8663)

(declare-fun e!130360 () Bool)

(declare-fun array_inv!2671 (array!8663) Bool)

(assert (=> start!20192 (and (array_inv!2671 _values!649) e!130360)))

(assert (=> start!20192 true))

(declare-fun tp_is_empty!4707 () Bool)

(assert (=> start!20192 tp_is_empty!4707))

(declare-datatypes ((array!8665 0))(
  ( (array!8666 (arr!4083 (Array (_ BitVec 32) (_ BitVec 64))) (size!4408 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8665)

(declare-fun array_inv!2672 (array!8665) Bool)

(assert (=> start!20192 (array_inv!2672 _keys!825)))

(assert (=> start!20192 tp!17584))

(declare-fun b!198314 () Bool)

(declare-fun res!94002 () Bool)

(assert (=> b!198314 (=> (not res!94002) (not e!130362))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198314 (= res!94002 (and (= (size!4407 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4408 _keys!825) (size!4407 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198315 () Bool)

(declare-fun res!94005 () Bool)

(assert (=> b!198315 (=> (not res!94005) (not e!130362))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198315 (= res!94005 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4408 _keys!825))))))

(declare-fun b!198316 () Bool)

(declare-fun res!94003 () Bool)

(assert (=> b!198316 (=> (not res!94003) (not e!130362))))

(declare-datatypes ((List!2552 0))(
  ( (Nil!2549) (Cons!2548 (h!3190 (_ BitVec 64)) (t!7483 List!2552)) )
))
(declare-fun arrayNoDuplicates!0 (array!8665 (_ BitVec 32) List!2552) Bool)

(assert (=> b!198316 (= res!94003 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2549))))

(declare-fun b!198317 () Bool)

(declare-fun e!130363 () Bool)

(declare-fun mapRes!8129 () Bool)

(assert (=> b!198317 (= e!130360 (and e!130363 mapRes!8129))))

(declare-fun condMapEmpty!8129 () Bool)

(declare-fun mapDefault!8129 () ValueCell!2010)

(assert (=> b!198317 (= condMapEmpty!8129 (= (arr!4082 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2010)) mapDefault!8129)))))

(declare-fun b!198318 () Bool)

(declare-fun res!94001 () Bool)

(assert (=> b!198318 (=> (not res!94001) (not e!130362))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!198318 (= res!94001 (= (select (arr!4083 _keys!825) i!601) k0!843))))

(declare-fun b!198319 () Bool)

(declare-fun res!94006 () Bool)

(assert (=> b!198319 (=> (not res!94006) (not e!130362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8665 (_ BitVec 32)) Bool)

(assert (=> b!198319 (= res!94006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8129 () Bool)

(declare-fun tp!17585 () Bool)

(declare-fun e!130364 () Bool)

(assert (=> mapNonEmpty!8129 (= mapRes!8129 (and tp!17585 e!130364))))

(declare-fun mapKey!8129 () (_ BitVec 32))

(declare-fun mapValue!8129 () ValueCell!2010)

(declare-fun mapRest!8129 () (Array (_ BitVec 32) ValueCell!2010))

(assert (=> mapNonEmpty!8129 (= (arr!4082 _values!649) (store mapRest!8129 mapKey!8129 mapValue!8129))))

(declare-fun b!198320 () Bool)

(assert (=> b!198320 (= e!130362 false)))

(declare-fun v!520 () V!5923)

(declare-fun zeroValue!615 () V!5923)

(declare-datatypes ((tuple2!3638 0))(
  ( (tuple2!3639 (_1!1830 (_ BitVec 64)) (_2!1830 V!5923)) )
))
(declare-datatypes ((List!2553 0))(
  ( (Nil!2550) (Cons!2549 (h!3191 tuple2!3638) (t!7484 List!2553)) )
))
(declare-datatypes ((ListLongMap!2551 0))(
  ( (ListLongMap!2552 (toList!1291 List!2553)) )
))
(declare-fun lt!97893 () ListLongMap!2551)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5923)

(declare-fun getCurrentListMapNoExtraKeys!256 (array!8665 array!8663 (_ BitVec 32) (_ BitVec 32) V!5923 V!5923 (_ BitVec 32) Int) ListLongMap!2551)

(assert (=> b!198320 (= lt!97893 (getCurrentListMapNoExtraKeys!256 _keys!825 (array!8664 (store (arr!4082 _values!649) i!601 (ValueCellFull!2010 v!520)) (size!4407 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97892 () ListLongMap!2551)

(assert (=> b!198320 (= lt!97892 (getCurrentListMapNoExtraKeys!256 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198321 () Bool)

(assert (=> b!198321 (= e!130363 tp_is_empty!4707)))

(declare-fun mapIsEmpty!8129 () Bool)

(assert (=> mapIsEmpty!8129 mapRes!8129))

(declare-fun b!198322 () Bool)

(declare-fun res!94004 () Bool)

(assert (=> b!198322 (=> (not res!94004) (not e!130362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198322 (= res!94004 (validKeyInArray!0 k0!843))))

(declare-fun b!198323 () Bool)

(assert (=> b!198323 (= e!130364 tp_is_empty!4707)))

(assert (= (and start!20192 res!94000) b!198314))

(assert (= (and b!198314 res!94002) b!198319))

(assert (= (and b!198319 res!94006) b!198316))

(assert (= (and b!198316 res!94003) b!198315))

(assert (= (and b!198315 res!94005) b!198322))

(assert (= (and b!198322 res!94004) b!198318))

(assert (= (and b!198318 res!94001) b!198320))

(assert (= (and b!198317 condMapEmpty!8129) mapIsEmpty!8129))

(assert (= (and b!198317 (not condMapEmpty!8129)) mapNonEmpty!8129))

(get-info :version)

(assert (= (and mapNonEmpty!8129 ((_ is ValueCellFull!2010) mapValue!8129)) b!198323))

(assert (= (and b!198317 ((_ is ValueCellFull!2010) mapDefault!8129)) b!198321))

(assert (= start!20192 b!198317))

(declare-fun m!224957 () Bool)

(assert (=> b!198316 m!224957))

(declare-fun m!224959 () Bool)

(assert (=> mapNonEmpty!8129 m!224959))

(declare-fun m!224961 () Bool)

(assert (=> start!20192 m!224961))

(declare-fun m!224963 () Bool)

(assert (=> start!20192 m!224963))

(declare-fun m!224965 () Bool)

(assert (=> start!20192 m!224965))

(declare-fun m!224967 () Bool)

(assert (=> b!198318 m!224967))

(declare-fun m!224969 () Bool)

(assert (=> b!198320 m!224969))

(declare-fun m!224971 () Bool)

(assert (=> b!198320 m!224971))

(declare-fun m!224973 () Bool)

(assert (=> b!198320 m!224973))

(declare-fun m!224975 () Bool)

(assert (=> b!198322 m!224975))

(declare-fun m!224977 () Bool)

(assert (=> b!198319 m!224977))

(check-sat (not b!198319) b_and!11597 (not start!20192) (not mapNonEmpty!8129) (not b!198322) (not b!198320) (not b_next!4851) (not b!198316) tp_is_empty!4707)
(check-sat b_and!11597 (not b_next!4851))
