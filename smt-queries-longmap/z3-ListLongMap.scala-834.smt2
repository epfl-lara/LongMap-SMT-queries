; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20102 () Bool)

(assert start!20102)

(declare-fun b_free!4761 () Bool)

(declare-fun b_next!4761 () Bool)

(assert (=> start!20102 (= b_free!4761 (not b_next!4761))))

(declare-fun tp!17314 () Bool)

(declare-fun b_and!11507 () Bool)

(assert (=> start!20102 (= tp!17314 b_and!11507)))

(declare-fun b!196964 () Bool)

(declare-fun res!93059 () Bool)

(declare-fun e!129687 () Bool)

(assert (=> b!196964 (=> (not res!93059) (not e!129687))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196964 (= res!93059 (validKeyInArray!0 k0!843))))

(declare-fun res!93060 () Bool)

(assert (=> start!20102 (=> (not res!93060) (not e!129687))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20102 (= res!93060 (validMask!0 mask!1149))))

(assert (=> start!20102 e!129687))

(declare-datatypes ((V!5803 0))(
  ( (V!5804 (val!2353 Int)) )
))
(declare-datatypes ((ValueCell!1965 0))(
  ( (ValueCellFull!1965 (v!4323 V!5803)) (EmptyCell!1965) )
))
(declare-datatypes ((array!8489 0))(
  ( (array!8490 (arr!3995 (Array (_ BitVec 32) ValueCell!1965)) (size!4320 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8489)

(declare-fun e!129688 () Bool)

(declare-fun array_inv!2607 (array!8489) Bool)

(assert (=> start!20102 (and (array_inv!2607 _values!649) e!129688)))

(assert (=> start!20102 true))

(declare-fun tp_is_empty!4617 () Bool)

(assert (=> start!20102 tp_is_empty!4617))

(declare-datatypes ((array!8491 0))(
  ( (array!8492 (arr!3996 (Array (_ BitVec 32) (_ BitVec 64))) (size!4321 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8491)

(declare-fun array_inv!2608 (array!8491) Bool)

(assert (=> start!20102 (array_inv!2608 _keys!825)))

(assert (=> start!20102 tp!17314))

(declare-fun b!196965 () Bool)

(declare-fun res!93061 () Bool)

(assert (=> b!196965 (=> (not res!93061) (not e!129687))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196965 (= res!93061 (= (select (arr!3996 _keys!825) i!601) k0!843))))

(declare-fun b!196966 () Bool)

(assert (=> b!196966 (= e!129687 false)))

(declare-datatypes ((tuple2!3584 0))(
  ( (tuple2!3585 (_1!1803 (_ BitVec 64)) (_2!1803 V!5803)) )
))
(declare-datatypes ((List!2496 0))(
  ( (Nil!2493) (Cons!2492 (h!3134 tuple2!3584) (t!7427 List!2496)) )
))
(declare-datatypes ((ListLongMap!2497 0))(
  ( (ListLongMap!2498 (toList!1264 List!2496)) )
))
(declare-fun lt!97671 () ListLongMap!2497)

(declare-fun zeroValue!615 () V!5803)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5803)

(declare-fun getCurrentListMapNoExtraKeys!229 (array!8491 array!8489 (_ BitVec 32) (_ BitVec 32) V!5803 V!5803 (_ BitVec 32) Int) ListLongMap!2497)

(assert (=> b!196966 (= lt!97671 (getCurrentListMapNoExtraKeys!229 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196967 () Bool)

(declare-fun e!129686 () Bool)

(assert (=> b!196967 (= e!129686 tp_is_empty!4617)))

(declare-fun b!196968 () Bool)

(declare-fun res!93056 () Bool)

(assert (=> b!196968 (=> (not res!93056) (not e!129687))))

(declare-datatypes ((List!2497 0))(
  ( (Nil!2494) (Cons!2493 (h!3135 (_ BitVec 64)) (t!7428 List!2497)) )
))
(declare-fun arrayNoDuplicates!0 (array!8491 (_ BitVec 32) List!2497) Bool)

(assert (=> b!196968 (= res!93056 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2494))))

(declare-fun mapIsEmpty!7994 () Bool)

(declare-fun mapRes!7994 () Bool)

(assert (=> mapIsEmpty!7994 mapRes!7994))

(declare-fun b!196969 () Bool)

(declare-fun res!93058 () Bool)

(assert (=> b!196969 (=> (not res!93058) (not e!129687))))

(assert (=> b!196969 (= res!93058 (and (= (size!4320 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4321 _keys!825) (size!4320 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196970 () Bool)

(declare-fun e!129685 () Bool)

(assert (=> b!196970 (= e!129688 (and e!129685 mapRes!7994))))

(declare-fun condMapEmpty!7994 () Bool)

(declare-fun mapDefault!7994 () ValueCell!1965)

(assert (=> b!196970 (= condMapEmpty!7994 (= (arr!3995 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1965)) mapDefault!7994)))))

(declare-fun b!196971 () Bool)

(declare-fun res!93055 () Bool)

(assert (=> b!196971 (=> (not res!93055) (not e!129687))))

(assert (=> b!196971 (= res!93055 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4321 _keys!825))))))

(declare-fun b!196972 () Bool)

(assert (=> b!196972 (= e!129685 tp_is_empty!4617)))

(declare-fun b!196973 () Bool)

(declare-fun res!93057 () Bool)

(assert (=> b!196973 (=> (not res!93057) (not e!129687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8491 (_ BitVec 32)) Bool)

(assert (=> b!196973 (= res!93057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!7994 () Bool)

(declare-fun tp!17315 () Bool)

(assert (=> mapNonEmpty!7994 (= mapRes!7994 (and tp!17315 e!129686))))

(declare-fun mapValue!7994 () ValueCell!1965)

(declare-fun mapKey!7994 () (_ BitVec 32))

(declare-fun mapRest!7994 () (Array (_ BitVec 32) ValueCell!1965))

(assert (=> mapNonEmpty!7994 (= (arr!3995 _values!649) (store mapRest!7994 mapKey!7994 mapValue!7994))))

(assert (= (and start!20102 res!93060) b!196969))

(assert (= (and b!196969 res!93058) b!196973))

(assert (= (and b!196973 res!93057) b!196968))

(assert (= (and b!196968 res!93056) b!196971))

(assert (= (and b!196971 res!93055) b!196964))

(assert (= (and b!196964 res!93059) b!196965))

(assert (= (and b!196965 res!93061) b!196966))

(assert (= (and b!196970 condMapEmpty!7994) mapIsEmpty!7994))

(assert (= (and b!196970 (not condMapEmpty!7994)) mapNonEmpty!7994))

(get-info :version)

(assert (= (and mapNonEmpty!7994 ((_ is ValueCellFull!1965) mapValue!7994)) b!196967))

(assert (= (and b!196970 ((_ is ValueCellFull!1965) mapDefault!7994)) b!196972))

(assert (= start!20102 b!196970))

(declare-fun m!224035 () Bool)

(assert (=> b!196966 m!224035))

(declare-fun m!224037 () Bool)

(assert (=> b!196965 m!224037))

(declare-fun m!224039 () Bool)

(assert (=> b!196968 m!224039))

(declare-fun m!224041 () Bool)

(assert (=> mapNonEmpty!7994 m!224041))

(declare-fun m!224043 () Bool)

(assert (=> b!196964 m!224043))

(declare-fun m!224045 () Bool)

(assert (=> start!20102 m!224045))

(declare-fun m!224047 () Bool)

(assert (=> start!20102 m!224047))

(declare-fun m!224049 () Bool)

(assert (=> start!20102 m!224049))

(declare-fun m!224051 () Bool)

(assert (=> b!196973 m!224051))

(check-sat (not b!196966) (not b!196973) b_and!11507 (not b!196968) tp_is_empty!4617 (not b_next!4761) (not start!20102) (not b!196964) (not mapNonEmpty!7994))
(check-sat b_and!11507 (not b_next!4761))
