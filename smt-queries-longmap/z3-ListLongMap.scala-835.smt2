; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20110 () Bool)

(assert start!20110)

(declare-fun b_free!4765 () Bool)

(declare-fun b_next!4765 () Bool)

(assert (=> start!20110 (= b_free!4765 (not b_next!4765))))

(declare-fun tp!17327 () Bool)

(declare-fun b_and!11485 () Bool)

(assert (=> start!20110 (= tp!17327 b_and!11485)))

(declare-fun b!196877 () Bool)

(declare-fun res!93003 () Bool)

(declare-fun e!129616 () Bool)

(assert (=> b!196877 (=> (not res!93003) (not e!129616))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8473 0))(
  ( (array!8474 (arr!3986 (Array (_ BitVec 32) (_ BitVec 64))) (size!4312 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8473)

(assert (=> b!196877 (= res!93003 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4312 _keys!825))))))

(declare-fun b!196878 () Bool)

(assert (=> b!196878 (= e!129616 false)))

(declare-datatypes ((V!5809 0))(
  ( (V!5810 (val!2355 Int)) )
))
(declare-datatypes ((tuple2!3542 0))(
  ( (tuple2!3543 (_1!1782 (_ BitVec 64)) (_2!1782 V!5809)) )
))
(declare-datatypes ((List!2474 0))(
  ( (Nil!2471) (Cons!2470 (h!3112 tuple2!3542) (t!7396 List!2474)) )
))
(declare-datatypes ((ListLongMap!2445 0))(
  ( (ListLongMap!2446 (toList!1238 List!2474)) )
))
(declare-fun lt!97496 () ListLongMap!2445)

(declare-datatypes ((ValueCell!1967 0))(
  ( (ValueCellFull!1967 (v!4319 V!5809)) (EmptyCell!1967) )
))
(declare-datatypes ((array!8475 0))(
  ( (array!8476 (arr!3987 (Array (_ BitVec 32) ValueCell!1967)) (size!4313 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8475)

(declare-fun zeroValue!615 () V!5809)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5809)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!218 (array!8473 array!8475 (_ BitVec 32) (_ BitVec 32) V!5809 V!5809 (_ BitVec 32) Int) ListLongMap!2445)

(assert (=> b!196878 (= lt!97496 (getCurrentListMapNoExtraKeys!218 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8000 () Bool)

(declare-fun mapRes!8000 () Bool)

(declare-fun tp!17326 () Bool)

(declare-fun e!129617 () Bool)

(assert (=> mapNonEmpty!8000 (= mapRes!8000 (and tp!17326 e!129617))))

(declare-fun mapKey!8000 () (_ BitVec 32))

(declare-fun mapRest!8000 () (Array (_ BitVec 32) ValueCell!1967))

(declare-fun mapValue!8000 () ValueCell!1967)

(assert (=> mapNonEmpty!8000 (= (arr!3987 _values!649) (store mapRest!8000 mapKey!8000 mapValue!8000))))

(declare-fun mapIsEmpty!8000 () Bool)

(assert (=> mapIsEmpty!8000 mapRes!8000))

(declare-fun b!196880 () Bool)

(declare-fun e!129615 () Bool)

(declare-fun tp_is_empty!4621 () Bool)

(assert (=> b!196880 (= e!129615 tp_is_empty!4621)))

(declare-fun b!196881 () Bool)

(declare-fun e!129614 () Bool)

(assert (=> b!196881 (= e!129614 (and e!129615 mapRes!8000))))

(declare-fun condMapEmpty!8000 () Bool)

(declare-fun mapDefault!8000 () ValueCell!1967)

(assert (=> b!196881 (= condMapEmpty!8000 (= (arr!3987 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1967)) mapDefault!8000)))))

(declare-fun b!196882 () Bool)

(declare-fun res!93005 () Bool)

(assert (=> b!196882 (=> (not res!93005) (not e!129616))))

(assert (=> b!196882 (= res!93005 (and (= (size!4313 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4312 _keys!825) (size!4313 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196883 () Bool)

(assert (=> b!196883 (= e!129617 tp_is_empty!4621)))

(declare-fun b!196884 () Bool)

(declare-fun res!93002 () Bool)

(assert (=> b!196884 (=> (not res!93002) (not e!129616))))

(declare-datatypes ((List!2475 0))(
  ( (Nil!2472) (Cons!2471 (h!3113 (_ BitVec 64)) (t!7397 List!2475)) )
))
(declare-fun arrayNoDuplicates!0 (array!8473 (_ BitVec 32) List!2475) Bool)

(assert (=> b!196884 (= res!93002 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2472))))

(declare-fun res!93007 () Bool)

(assert (=> start!20110 (=> (not res!93007) (not e!129616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20110 (= res!93007 (validMask!0 mask!1149))))

(assert (=> start!20110 e!129616))

(declare-fun array_inv!2589 (array!8475) Bool)

(assert (=> start!20110 (and (array_inv!2589 _values!649) e!129614)))

(assert (=> start!20110 true))

(assert (=> start!20110 tp_is_empty!4621))

(declare-fun array_inv!2590 (array!8473) Bool)

(assert (=> start!20110 (array_inv!2590 _keys!825)))

(assert (=> start!20110 tp!17327))

(declare-fun b!196879 () Bool)

(declare-fun res!93008 () Bool)

(assert (=> b!196879 (=> (not res!93008) (not e!129616))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!196879 (= res!93008 (= (select (arr!3986 _keys!825) i!601) k0!843))))

(declare-fun b!196885 () Bool)

(declare-fun res!93004 () Bool)

(assert (=> b!196885 (=> (not res!93004) (not e!129616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8473 (_ BitVec 32)) Bool)

(assert (=> b!196885 (= res!93004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196886 () Bool)

(declare-fun res!93006 () Bool)

(assert (=> b!196886 (=> (not res!93006) (not e!129616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196886 (= res!93006 (validKeyInArray!0 k0!843))))

(assert (= (and start!20110 res!93007) b!196882))

(assert (= (and b!196882 res!93005) b!196885))

(assert (= (and b!196885 res!93004) b!196884))

(assert (= (and b!196884 res!93002) b!196877))

(assert (= (and b!196877 res!93003) b!196886))

(assert (= (and b!196886 res!93006) b!196879))

(assert (= (and b!196879 res!93008) b!196878))

(assert (= (and b!196881 condMapEmpty!8000) mapIsEmpty!8000))

(assert (= (and b!196881 (not condMapEmpty!8000)) mapNonEmpty!8000))

(get-info :version)

(assert (= (and mapNonEmpty!8000 ((_ is ValueCellFull!1967) mapValue!8000)) b!196883))

(assert (= (and b!196881 ((_ is ValueCellFull!1967) mapDefault!8000)) b!196880))

(assert (= start!20110 b!196881))

(declare-fun m!223455 () Bool)

(assert (=> start!20110 m!223455))

(declare-fun m!223457 () Bool)

(assert (=> start!20110 m!223457))

(declare-fun m!223459 () Bool)

(assert (=> start!20110 m!223459))

(declare-fun m!223461 () Bool)

(assert (=> b!196879 m!223461))

(declare-fun m!223463 () Bool)

(assert (=> b!196878 m!223463))

(declare-fun m!223465 () Bool)

(assert (=> mapNonEmpty!8000 m!223465))

(declare-fun m!223467 () Bool)

(assert (=> b!196885 m!223467))

(declare-fun m!223469 () Bool)

(assert (=> b!196884 m!223469))

(declare-fun m!223471 () Bool)

(assert (=> b!196886 m!223471))

(check-sat (not start!20110) b_and!11485 (not mapNonEmpty!8000) tp_is_empty!4621 (not b!196886) (not b!196884) (not b_next!4765) (not b!196885) (not b!196878))
(check-sat b_and!11485 (not b_next!4765))
