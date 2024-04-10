; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20144 () Bool)

(assert start!20144)

(declare-fun b_free!4803 () Bool)

(declare-fun b_next!4803 () Bool)

(assert (=> start!20144 (= b_free!4803 (not b_next!4803))))

(declare-fun tp!17441 () Bool)

(declare-fun b_and!11549 () Bool)

(assert (=> start!20144 (= tp!17441 b_and!11549)))

(declare-fun mapNonEmpty!8057 () Bool)

(declare-fun mapRes!8057 () Bool)

(declare-fun tp!17440 () Bool)

(declare-fun e!130002 () Bool)

(assert (=> mapNonEmpty!8057 (= mapRes!8057 (and tp!17440 e!130002))))

(declare-fun mapKey!8057 () (_ BitVec 32))

(declare-datatypes ((V!5859 0))(
  ( (V!5860 (val!2374 Int)) )
))
(declare-datatypes ((ValueCell!1986 0))(
  ( (ValueCellFull!1986 (v!4344 V!5859)) (EmptyCell!1986) )
))
(declare-datatypes ((array!8571 0))(
  ( (array!8572 (arr!4036 (Array (_ BitVec 32) ValueCell!1986)) (size!4361 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8571)

(declare-fun mapValue!8057 () ValueCell!1986)

(declare-fun mapRest!8057 () (Array (_ BitVec 32) ValueCell!1986))

(assert (=> mapNonEmpty!8057 (= (arr!4036 _values!649) (store mapRest!8057 mapKey!8057 mapValue!8057))))

(declare-fun res!93498 () Bool)

(declare-fun e!130000 () Bool)

(assert (=> start!20144 (=> (not res!93498) (not e!130000))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20144 (= res!93498 (validMask!0 mask!1149))))

(assert (=> start!20144 e!130000))

(declare-fun e!130004 () Bool)

(declare-fun array_inv!2633 (array!8571) Bool)

(assert (=> start!20144 (and (array_inv!2633 _values!649) e!130004)))

(assert (=> start!20144 true))

(declare-fun tp_is_empty!4659 () Bool)

(assert (=> start!20144 tp_is_empty!4659))

(declare-datatypes ((array!8573 0))(
  ( (array!8574 (arr!4037 (Array (_ BitVec 32) (_ BitVec 64))) (size!4362 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8573)

(declare-fun array_inv!2634 (array!8573) Bool)

(assert (=> start!20144 (array_inv!2634 _keys!825)))

(assert (=> start!20144 tp!17441))

(declare-fun b!197594 () Bool)

(declare-fun e!130001 () Bool)

(assert (=> b!197594 (= e!130001 tp_is_empty!4659)))

(declare-fun b!197595 () Bool)

(assert (=> b!197595 (= e!130004 (and e!130001 mapRes!8057))))

(declare-fun condMapEmpty!8057 () Bool)

(declare-fun mapDefault!8057 () ValueCell!1986)

(assert (=> b!197595 (= condMapEmpty!8057 (= (arr!4036 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1986)) mapDefault!8057)))))

(declare-fun b!197596 () Bool)

(declare-fun res!93499 () Bool)

(assert (=> b!197596 (=> (not res!93499) (not e!130000))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197596 (= res!93499 (= (select (arr!4037 _keys!825) i!601) k0!843))))

(declare-fun b!197597 () Bool)

(assert (=> b!197597 (= e!130002 tp_is_empty!4659)))

(declare-fun b!197598 () Bool)

(declare-fun res!93500 () Bool)

(assert (=> b!197598 (=> (not res!93500) (not e!130000))))

(declare-datatypes ((List!2518 0))(
  ( (Nil!2515) (Cons!2514 (h!3156 (_ BitVec 64)) (t!7449 List!2518)) )
))
(declare-fun arrayNoDuplicates!0 (array!8573 (_ BitVec 32) List!2518) Bool)

(assert (=> b!197598 (= res!93500 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2515))))

(declare-fun b!197599 () Bool)

(declare-fun res!93502 () Bool)

(assert (=> b!197599 (=> (not res!93502) (not e!130000))))

(assert (=> b!197599 (= res!93502 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4362 _keys!825))))))

(declare-fun mapIsEmpty!8057 () Bool)

(assert (=> mapIsEmpty!8057 mapRes!8057))

(declare-fun b!197600 () Bool)

(declare-fun res!93501 () Bool)

(assert (=> b!197600 (=> (not res!93501) (not e!130000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197600 (= res!93501 (validKeyInArray!0 k0!843))))

(declare-fun b!197601 () Bool)

(declare-fun res!93496 () Bool)

(assert (=> b!197601 (=> (not res!93496) (not e!130000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8573 (_ BitVec 32)) Bool)

(assert (=> b!197601 (= res!93496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197602 () Bool)

(declare-fun res!93497 () Bool)

(assert (=> b!197602 (=> (not res!93497) (not e!130000))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197602 (= res!93497 (and (= (size!4361 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4362 _keys!825) (size!4361 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197603 () Bool)

(assert (=> b!197603 (= e!130000 false)))

(declare-datatypes ((tuple2!3604 0))(
  ( (tuple2!3605 (_1!1813 (_ BitVec 64)) (_2!1813 V!5859)) )
))
(declare-datatypes ((List!2519 0))(
  ( (Nil!2516) (Cons!2515 (h!3157 tuple2!3604) (t!7450 List!2519)) )
))
(declare-datatypes ((ListLongMap!2517 0))(
  ( (ListLongMap!2518 (toList!1274 List!2519)) )
))
(declare-fun lt!97748 () ListLongMap!2517)

(declare-fun v!520 () V!5859)

(declare-fun zeroValue!615 () V!5859)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5859)

(declare-fun getCurrentListMapNoExtraKeys!239 (array!8573 array!8571 (_ BitVec 32) (_ BitVec 32) V!5859 V!5859 (_ BitVec 32) Int) ListLongMap!2517)

(assert (=> b!197603 (= lt!97748 (getCurrentListMapNoExtraKeys!239 _keys!825 (array!8572 (store (arr!4036 _values!649) i!601 (ValueCellFull!1986 v!520)) (size!4361 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97749 () ListLongMap!2517)

(assert (=> b!197603 (= lt!97749 (getCurrentListMapNoExtraKeys!239 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20144 res!93498) b!197602))

(assert (= (and b!197602 res!93497) b!197601))

(assert (= (and b!197601 res!93496) b!197598))

(assert (= (and b!197598 res!93500) b!197599))

(assert (= (and b!197599 res!93502) b!197600))

(assert (= (and b!197600 res!93501) b!197596))

(assert (= (and b!197596 res!93499) b!197603))

(assert (= (and b!197595 condMapEmpty!8057) mapIsEmpty!8057))

(assert (= (and b!197595 (not condMapEmpty!8057)) mapNonEmpty!8057))

(get-info :version)

(assert (= (and mapNonEmpty!8057 ((_ is ValueCellFull!1986) mapValue!8057)) b!197597))

(assert (= (and b!197595 ((_ is ValueCellFull!1986) mapDefault!8057)) b!197594))

(assert (= start!20144 b!197595))

(declare-fun m!224429 () Bool)

(assert (=> start!20144 m!224429))

(declare-fun m!224431 () Bool)

(assert (=> start!20144 m!224431))

(declare-fun m!224433 () Bool)

(assert (=> start!20144 m!224433))

(declare-fun m!224435 () Bool)

(assert (=> b!197601 m!224435))

(declare-fun m!224437 () Bool)

(assert (=> b!197598 m!224437))

(declare-fun m!224439 () Bool)

(assert (=> b!197596 m!224439))

(declare-fun m!224441 () Bool)

(assert (=> mapNonEmpty!8057 m!224441))

(declare-fun m!224443 () Bool)

(assert (=> b!197603 m!224443))

(declare-fun m!224445 () Bool)

(assert (=> b!197603 m!224445))

(declare-fun m!224447 () Bool)

(assert (=> b!197603 m!224447))

(declare-fun m!224449 () Bool)

(assert (=> b!197600 m!224449))

(check-sat (not start!20144) (not b!197600) (not b!197598) (not b_next!4803) tp_is_empty!4659 (not mapNonEmpty!8057) b_and!11549 (not b!197601) (not b!197603))
(check-sat b_and!11549 (not b_next!4803))
