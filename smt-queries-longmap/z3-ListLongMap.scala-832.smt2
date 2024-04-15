; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20092 () Bool)

(assert start!20092)

(declare-fun b_free!4747 () Bool)

(declare-fun b_next!4747 () Bool)

(assert (=> start!20092 (= b_free!4747 (not b_next!4747))))

(declare-fun tp!17273 () Bool)

(declare-fun b_and!11467 () Bool)

(assert (=> start!20092 (= tp!17273 b_and!11467)))

(declare-fun b!196607 () Bool)

(declare-fun res!92813 () Bool)

(declare-fun e!129481 () Bool)

(assert (=> b!196607 (=> (not res!92813) (not e!129481))))

(declare-datatypes ((array!8437 0))(
  ( (array!8438 (arr!3968 (Array (_ BitVec 32) (_ BitVec 64))) (size!4294 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8437)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5785 0))(
  ( (V!5786 (val!2346 Int)) )
))
(declare-datatypes ((ValueCell!1958 0))(
  ( (ValueCellFull!1958 (v!4310 V!5785)) (EmptyCell!1958) )
))
(declare-datatypes ((array!8439 0))(
  ( (array!8440 (arr!3969 (Array (_ BitVec 32) ValueCell!1958)) (size!4295 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8439)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196607 (= res!92813 (and (= (size!4295 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4294 _keys!825) (size!4295 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92819 () Bool)

(assert (=> start!20092 (=> (not res!92819) (not e!129481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20092 (= res!92819 (validMask!0 mask!1149))))

(assert (=> start!20092 e!129481))

(declare-fun e!129483 () Bool)

(declare-fun array_inv!2575 (array!8439) Bool)

(assert (=> start!20092 (and (array_inv!2575 _values!649) e!129483)))

(assert (=> start!20092 true))

(declare-fun tp_is_empty!4603 () Bool)

(assert (=> start!20092 tp_is_empty!4603))

(declare-fun array_inv!2576 (array!8437) Bool)

(assert (=> start!20092 (array_inv!2576 _keys!825)))

(assert (=> start!20092 tp!17273))

(declare-fun b!196608 () Bool)

(declare-fun e!129479 () Bool)

(assert (=> b!196608 (= e!129479 tp_is_empty!4603)))

(declare-fun b!196609 () Bool)

(assert (=> b!196609 (= e!129481 false)))

(declare-datatypes ((tuple2!3532 0))(
  ( (tuple2!3533 (_1!1777 (_ BitVec 64)) (_2!1777 V!5785)) )
))
(declare-datatypes ((List!2463 0))(
  ( (Nil!2460) (Cons!2459 (h!3101 tuple2!3532) (t!7385 List!2463)) )
))
(declare-datatypes ((ListLongMap!2435 0))(
  ( (ListLongMap!2436 (toList!1233 List!2463)) )
))
(declare-fun lt!97469 () ListLongMap!2435)

(declare-fun zeroValue!615 () V!5785)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5785)

(declare-fun getCurrentListMapNoExtraKeys!213 (array!8437 array!8439 (_ BitVec 32) (_ BitVec 32) V!5785 V!5785 (_ BitVec 32) Int) ListLongMap!2435)

(assert (=> b!196609 (= lt!97469 (getCurrentListMapNoExtraKeys!213 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196610 () Bool)

(declare-fun res!92818 () Bool)

(assert (=> b!196610 (=> (not res!92818) (not e!129481))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196610 (= res!92818 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4294 _keys!825))))))

(declare-fun mapNonEmpty!7973 () Bool)

(declare-fun mapRes!7973 () Bool)

(declare-fun tp!17272 () Bool)

(assert (=> mapNonEmpty!7973 (= mapRes!7973 (and tp!17272 e!129479))))

(declare-fun mapRest!7973 () (Array (_ BitVec 32) ValueCell!1958))

(declare-fun mapValue!7973 () ValueCell!1958)

(declare-fun mapKey!7973 () (_ BitVec 32))

(assert (=> mapNonEmpty!7973 (= (arr!3969 _values!649) (store mapRest!7973 mapKey!7973 mapValue!7973))))

(declare-fun b!196611 () Bool)

(declare-fun e!129480 () Bool)

(assert (=> b!196611 (= e!129483 (and e!129480 mapRes!7973))))

(declare-fun condMapEmpty!7973 () Bool)

(declare-fun mapDefault!7973 () ValueCell!1958)

(assert (=> b!196611 (= condMapEmpty!7973 (= (arr!3969 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1958)) mapDefault!7973)))))

(declare-fun b!196612 () Bool)

(declare-fun res!92815 () Bool)

(assert (=> b!196612 (=> (not res!92815) (not e!129481))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196612 (= res!92815 (validKeyInArray!0 k0!843))))

(declare-fun b!196613 () Bool)

(declare-fun res!92817 () Bool)

(assert (=> b!196613 (=> (not res!92817) (not e!129481))))

(declare-datatypes ((List!2464 0))(
  ( (Nil!2461) (Cons!2460 (h!3102 (_ BitVec 64)) (t!7386 List!2464)) )
))
(declare-fun arrayNoDuplicates!0 (array!8437 (_ BitVec 32) List!2464) Bool)

(assert (=> b!196613 (= res!92817 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2461))))

(declare-fun mapIsEmpty!7973 () Bool)

(assert (=> mapIsEmpty!7973 mapRes!7973))

(declare-fun b!196614 () Bool)

(declare-fun res!92816 () Bool)

(assert (=> b!196614 (=> (not res!92816) (not e!129481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8437 (_ BitVec 32)) Bool)

(assert (=> b!196614 (= res!92816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196615 () Bool)

(assert (=> b!196615 (= e!129480 tp_is_empty!4603)))

(declare-fun b!196616 () Bool)

(declare-fun res!92814 () Bool)

(assert (=> b!196616 (=> (not res!92814) (not e!129481))))

(assert (=> b!196616 (= res!92814 (= (select (arr!3968 _keys!825) i!601) k0!843))))

(assert (= (and start!20092 res!92819) b!196607))

(assert (= (and b!196607 res!92813) b!196614))

(assert (= (and b!196614 res!92816) b!196613))

(assert (= (and b!196613 res!92817) b!196610))

(assert (= (and b!196610 res!92818) b!196612))

(assert (= (and b!196612 res!92815) b!196616))

(assert (= (and b!196616 res!92814) b!196609))

(assert (= (and b!196611 condMapEmpty!7973) mapIsEmpty!7973))

(assert (= (and b!196611 (not condMapEmpty!7973)) mapNonEmpty!7973))

(get-info :version)

(assert (= (and mapNonEmpty!7973 ((_ is ValueCellFull!1958) mapValue!7973)) b!196608))

(assert (= (and b!196611 ((_ is ValueCellFull!1958) mapDefault!7973)) b!196615))

(assert (= start!20092 b!196611))

(declare-fun m!223293 () Bool)

(assert (=> b!196616 m!223293))

(declare-fun m!223295 () Bool)

(assert (=> b!196612 m!223295))

(declare-fun m!223297 () Bool)

(assert (=> b!196614 m!223297))

(declare-fun m!223299 () Bool)

(assert (=> start!20092 m!223299))

(declare-fun m!223301 () Bool)

(assert (=> start!20092 m!223301))

(declare-fun m!223303 () Bool)

(assert (=> start!20092 m!223303))

(declare-fun m!223305 () Bool)

(assert (=> mapNonEmpty!7973 m!223305))

(declare-fun m!223307 () Bool)

(assert (=> b!196609 m!223307))

(declare-fun m!223309 () Bool)

(assert (=> b!196613 m!223309))

(check-sat b_and!11467 (not b!196614) (not start!20092) (not mapNonEmpty!7973) (not b_next!4747) (not b!196609) (not b!196612) (not b!196613) tp_is_empty!4603)
(check-sat b_and!11467 (not b_next!4747))
