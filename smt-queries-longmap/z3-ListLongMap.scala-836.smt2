; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20116 () Bool)

(assert start!20116)

(declare-fun b_free!4771 () Bool)

(declare-fun b_next!4771 () Bool)

(assert (=> start!20116 (= b_free!4771 (not b_next!4771))))

(declare-fun tp!17344 () Bool)

(declare-fun b_and!11491 () Bool)

(assert (=> start!20116 (= tp!17344 b_and!11491)))

(declare-fun b!196967 () Bool)

(declare-fun res!93070 () Bool)

(declare-fun e!129662 () Bool)

(assert (=> b!196967 (=> (not res!93070) (not e!129662))))

(declare-datatypes ((array!8485 0))(
  ( (array!8486 (arr!3992 (Array (_ BitVec 32) (_ BitVec 64))) (size!4318 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8485)

(declare-datatypes ((List!2478 0))(
  ( (Nil!2475) (Cons!2474 (h!3116 (_ BitVec 64)) (t!7400 List!2478)) )
))
(declare-fun arrayNoDuplicates!0 (array!8485 (_ BitVec 32) List!2478) Bool)

(assert (=> b!196967 (= res!93070 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2475))))

(declare-fun res!93068 () Bool)

(assert (=> start!20116 (=> (not res!93068) (not e!129662))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20116 (= res!93068 (validMask!0 mask!1149))))

(assert (=> start!20116 e!129662))

(declare-datatypes ((V!5817 0))(
  ( (V!5818 (val!2358 Int)) )
))
(declare-datatypes ((ValueCell!1970 0))(
  ( (ValueCellFull!1970 (v!4322 V!5817)) (EmptyCell!1970) )
))
(declare-datatypes ((array!8487 0))(
  ( (array!8488 (arr!3993 (Array (_ BitVec 32) ValueCell!1970)) (size!4319 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8487)

(declare-fun e!129661 () Bool)

(declare-fun array_inv!2593 (array!8487) Bool)

(assert (=> start!20116 (and (array_inv!2593 _values!649) e!129661)))

(assert (=> start!20116 true))

(declare-fun tp_is_empty!4627 () Bool)

(assert (=> start!20116 tp_is_empty!4627))

(declare-fun array_inv!2594 (array!8485) Bool)

(assert (=> start!20116 (array_inv!2594 _keys!825)))

(assert (=> start!20116 tp!17344))

(declare-fun b!196968 () Bool)

(declare-fun res!93071 () Bool)

(assert (=> b!196968 (=> (not res!93071) (not e!129662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8485 (_ BitVec 32)) Bool)

(assert (=> b!196968 (= res!93071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196969 () Bool)

(declare-fun res!93069 () Bool)

(assert (=> b!196969 (=> (not res!93069) (not e!129662))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196969 (= res!93069 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4318 _keys!825))))))

(declare-fun b!196970 () Bool)

(assert (=> b!196970 (= e!129662 false)))

(declare-datatypes ((tuple2!3546 0))(
  ( (tuple2!3547 (_1!1784 (_ BitVec 64)) (_2!1784 V!5817)) )
))
(declare-datatypes ((List!2479 0))(
  ( (Nil!2476) (Cons!2475 (h!3117 tuple2!3546) (t!7401 List!2479)) )
))
(declare-datatypes ((ListLongMap!2449 0))(
  ( (ListLongMap!2450 (toList!1240 List!2479)) )
))
(declare-fun lt!97505 () ListLongMap!2449)

(declare-fun zeroValue!615 () V!5817)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5817)

(declare-fun getCurrentListMapNoExtraKeys!220 (array!8485 array!8487 (_ BitVec 32) (_ BitVec 32) V!5817 V!5817 (_ BitVec 32) Int) ListLongMap!2449)

(assert (=> b!196970 (= lt!97505 (getCurrentListMapNoExtraKeys!220 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196971 () Bool)

(declare-fun res!93065 () Bool)

(assert (=> b!196971 (=> (not res!93065) (not e!129662))))

(assert (=> b!196971 (= res!93065 (and (= (size!4319 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4318 _keys!825) (size!4319 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196972 () Bool)

(declare-fun res!93066 () Bool)

(assert (=> b!196972 (=> (not res!93066) (not e!129662))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!196972 (= res!93066 (= (select (arr!3992 _keys!825) i!601) k0!843))))

(declare-fun b!196973 () Bool)

(declare-fun e!129660 () Bool)

(assert (=> b!196973 (= e!129660 tp_is_empty!4627)))

(declare-fun b!196974 () Bool)

(declare-fun mapRes!8009 () Bool)

(assert (=> b!196974 (= e!129661 (and e!129660 mapRes!8009))))

(declare-fun condMapEmpty!8009 () Bool)

(declare-fun mapDefault!8009 () ValueCell!1970)

(assert (=> b!196974 (= condMapEmpty!8009 (= (arr!3993 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1970)) mapDefault!8009)))))

(declare-fun b!196975 () Bool)

(declare-fun res!93067 () Bool)

(assert (=> b!196975 (=> (not res!93067) (not e!129662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196975 (= res!93067 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8009 () Bool)

(declare-fun tp!17345 () Bool)

(declare-fun e!129663 () Bool)

(assert (=> mapNonEmpty!8009 (= mapRes!8009 (and tp!17345 e!129663))))

(declare-fun mapRest!8009 () (Array (_ BitVec 32) ValueCell!1970))

(declare-fun mapKey!8009 () (_ BitVec 32))

(declare-fun mapValue!8009 () ValueCell!1970)

(assert (=> mapNonEmpty!8009 (= (arr!3993 _values!649) (store mapRest!8009 mapKey!8009 mapValue!8009))))

(declare-fun mapIsEmpty!8009 () Bool)

(assert (=> mapIsEmpty!8009 mapRes!8009))

(declare-fun b!196976 () Bool)

(assert (=> b!196976 (= e!129663 tp_is_empty!4627)))

(assert (= (and start!20116 res!93068) b!196971))

(assert (= (and b!196971 res!93065) b!196968))

(assert (= (and b!196968 res!93071) b!196967))

(assert (= (and b!196967 res!93070) b!196969))

(assert (= (and b!196969 res!93069) b!196975))

(assert (= (and b!196975 res!93067) b!196972))

(assert (= (and b!196972 res!93066) b!196970))

(assert (= (and b!196974 condMapEmpty!8009) mapIsEmpty!8009))

(assert (= (and b!196974 (not condMapEmpty!8009)) mapNonEmpty!8009))

(get-info :version)

(assert (= (and mapNonEmpty!8009 ((_ is ValueCellFull!1970) mapValue!8009)) b!196976))

(assert (= (and b!196974 ((_ is ValueCellFull!1970) mapDefault!8009)) b!196973))

(assert (= start!20116 b!196974))

(declare-fun m!223509 () Bool)

(assert (=> b!196975 m!223509))

(declare-fun m!223511 () Bool)

(assert (=> b!196970 m!223511))

(declare-fun m!223513 () Bool)

(assert (=> start!20116 m!223513))

(declare-fun m!223515 () Bool)

(assert (=> start!20116 m!223515))

(declare-fun m!223517 () Bool)

(assert (=> start!20116 m!223517))

(declare-fun m!223519 () Bool)

(assert (=> mapNonEmpty!8009 m!223519))

(declare-fun m!223521 () Bool)

(assert (=> b!196972 m!223521))

(declare-fun m!223523 () Bool)

(assert (=> b!196968 m!223523))

(declare-fun m!223525 () Bool)

(assert (=> b!196967 m!223525))

(check-sat (not mapNonEmpty!8009) (not b!196967) (not b!196968) (not b_next!4771) tp_is_empty!4627 (not start!20116) (not b!196970) (not b!196975) b_and!11491)
(check-sat b_and!11491 (not b_next!4771))
