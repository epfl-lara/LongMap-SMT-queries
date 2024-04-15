; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20140 () Bool)

(assert start!20140)

(declare-fun b_free!4795 () Bool)

(declare-fun b_next!4795 () Bool)

(assert (=> start!20140 (= b_free!4795 (not b_next!4795))))

(declare-fun tp!17417 () Bool)

(declare-fun b_and!11515 () Bool)

(assert (=> start!20140 (= tp!17417 b_and!11515)))

(declare-fun b!197327 () Bool)

(declare-fun e!129840 () Bool)

(declare-fun tp_is_empty!4651 () Bool)

(assert (=> b!197327 (= e!129840 tp_is_empty!4651)))

(declare-fun b!197328 () Bool)

(declare-fun e!129843 () Bool)

(assert (=> b!197328 (= e!129843 tp_is_empty!4651)))

(declare-fun b!197329 () Bool)

(declare-fun e!129839 () Bool)

(assert (=> b!197329 (= e!129839 false)))

(declare-datatypes ((V!5849 0))(
  ( (V!5850 (val!2370 Int)) )
))
(declare-datatypes ((tuple2!3566 0))(
  ( (tuple2!3567 (_1!1794 (_ BitVec 64)) (_2!1794 V!5849)) )
))
(declare-datatypes ((List!2498 0))(
  ( (Nil!2495) (Cons!2494 (h!3136 tuple2!3566) (t!7420 List!2498)) )
))
(declare-datatypes ((ListLongMap!2469 0))(
  ( (ListLongMap!2470 (toList!1250 List!2498)) )
))
(declare-fun lt!97543 () ListLongMap!2469)

(declare-datatypes ((ValueCell!1982 0))(
  ( (ValueCellFull!1982 (v!4334 V!5849)) (EmptyCell!1982) )
))
(declare-datatypes ((array!8533 0))(
  ( (array!8534 (arr!4016 (Array (_ BitVec 32) ValueCell!1982)) (size!4342 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8533)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!5849)

(declare-fun zeroValue!615 () V!5849)

(declare-datatypes ((array!8535 0))(
  ( (array!8536 (arr!4017 (Array (_ BitVec 32) (_ BitVec 64))) (size!4343 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8535)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5849)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!230 (array!8535 array!8533 (_ BitVec 32) (_ BitVec 32) V!5849 V!5849 (_ BitVec 32) Int) ListLongMap!2469)

(assert (=> b!197329 (= lt!97543 (getCurrentListMapNoExtraKeys!230 _keys!825 (array!8534 (store (arr!4016 _values!649) i!601 (ValueCellFull!1982 v!520)) (size!4342 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97544 () ListLongMap!2469)

(assert (=> b!197329 (= lt!97544 (getCurrentListMapNoExtraKeys!230 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197330 () Bool)

(declare-fun res!93319 () Bool)

(assert (=> b!197330 (=> (not res!93319) (not e!129839))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!197330 (= res!93319 (= (select (arr!4017 _keys!825) i!601) k0!843))))

(declare-fun res!93317 () Bool)

(assert (=> start!20140 (=> (not res!93317) (not e!129839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20140 (= res!93317 (validMask!0 mask!1149))))

(assert (=> start!20140 e!129839))

(declare-fun e!129842 () Bool)

(declare-fun array_inv!2613 (array!8533) Bool)

(assert (=> start!20140 (and (array_inv!2613 _values!649) e!129842)))

(assert (=> start!20140 true))

(assert (=> start!20140 tp_is_empty!4651))

(declare-fun array_inv!2614 (array!8535) Bool)

(assert (=> start!20140 (array_inv!2614 _keys!825)))

(assert (=> start!20140 tp!17417))

(declare-fun b!197331 () Bool)

(declare-fun res!93321 () Bool)

(assert (=> b!197331 (=> (not res!93321) (not e!129839))))

(assert (=> b!197331 (= res!93321 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4343 _keys!825))))))

(declare-fun b!197332 () Bool)

(declare-fun res!93320 () Bool)

(assert (=> b!197332 (=> (not res!93320) (not e!129839))))

(assert (=> b!197332 (= res!93320 (and (= (size!4342 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4343 _keys!825) (size!4342 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197333 () Bool)

(declare-fun res!93322 () Bool)

(assert (=> b!197333 (=> (not res!93322) (not e!129839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8535 (_ BitVec 32)) Bool)

(assert (=> b!197333 (= res!93322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8045 () Bool)

(declare-fun mapRes!8045 () Bool)

(assert (=> mapIsEmpty!8045 mapRes!8045))

(declare-fun b!197334 () Bool)

(declare-fun res!93318 () Bool)

(assert (=> b!197334 (=> (not res!93318) (not e!129839))))

(declare-datatypes ((List!2499 0))(
  ( (Nil!2496) (Cons!2495 (h!3137 (_ BitVec 64)) (t!7421 List!2499)) )
))
(declare-fun arrayNoDuplicates!0 (array!8535 (_ BitVec 32) List!2499) Bool)

(assert (=> b!197334 (= res!93318 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2496))))

(declare-fun b!197335 () Bool)

(assert (=> b!197335 (= e!129842 (and e!129840 mapRes!8045))))

(declare-fun condMapEmpty!8045 () Bool)

(declare-fun mapDefault!8045 () ValueCell!1982)

(assert (=> b!197335 (= condMapEmpty!8045 (= (arr!4016 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1982)) mapDefault!8045)))))

(declare-fun mapNonEmpty!8045 () Bool)

(declare-fun tp!17416 () Bool)

(assert (=> mapNonEmpty!8045 (= mapRes!8045 (and tp!17416 e!129843))))

(declare-fun mapRest!8045 () (Array (_ BitVec 32) ValueCell!1982))

(declare-fun mapValue!8045 () ValueCell!1982)

(declare-fun mapKey!8045 () (_ BitVec 32))

(assert (=> mapNonEmpty!8045 (= (arr!4016 _values!649) (store mapRest!8045 mapKey!8045 mapValue!8045))))

(declare-fun b!197336 () Bool)

(declare-fun res!93323 () Bool)

(assert (=> b!197336 (=> (not res!93323) (not e!129839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197336 (= res!93323 (validKeyInArray!0 k0!843))))

(assert (= (and start!20140 res!93317) b!197332))

(assert (= (and b!197332 res!93320) b!197333))

(assert (= (and b!197333 res!93322) b!197334))

(assert (= (and b!197334 res!93318) b!197331))

(assert (= (and b!197331 res!93321) b!197336))

(assert (= (and b!197336 res!93323) b!197330))

(assert (= (and b!197330 res!93319) b!197329))

(assert (= (and b!197335 condMapEmpty!8045) mapIsEmpty!8045))

(assert (= (and b!197335 (not condMapEmpty!8045)) mapNonEmpty!8045))

(get-info :version)

(assert (= (and mapNonEmpty!8045 ((_ is ValueCellFull!1982) mapValue!8045)) b!197328))

(assert (= (and b!197335 ((_ is ValueCellFull!1982) mapDefault!8045)) b!197327))

(assert (= start!20140 b!197335))

(declare-fun m!223725 () Bool)

(assert (=> start!20140 m!223725))

(declare-fun m!223727 () Bool)

(assert (=> start!20140 m!223727))

(declare-fun m!223729 () Bool)

(assert (=> start!20140 m!223729))

(declare-fun m!223731 () Bool)

(assert (=> b!197333 m!223731))

(declare-fun m!223733 () Bool)

(assert (=> b!197329 m!223733))

(declare-fun m!223735 () Bool)

(assert (=> b!197329 m!223735))

(declare-fun m!223737 () Bool)

(assert (=> b!197329 m!223737))

(declare-fun m!223739 () Bool)

(assert (=> mapNonEmpty!8045 m!223739))

(declare-fun m!223741 () Bool)

(assert (=> b!197330 m!223741))

(declare-fun m!223743 () Bool)

(assert (=> b!197336 m!223743))

(declare-fun m!223745 () Bool)

(assert (=> b!197334 m!223745))

(check-sat (not b!197329) (not b_next!4795) b_and!11515 (not b!197336) (not b!197333) tp_is_empty!4651 (not b!197334) (not mapNonEmpty!8045) (not start!20140))
(check-sat b_and!11515 (not b_next!4795))
