; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33608 () Bool)

(assert start!33608)

(declare-fun b_free!6843 () Bool)

(declare-fun b_next!6843 () Bool)

(assert (=> start!33608 (= b_free!6843 (not b_next!6843))))

(declare-fun tp!24032 () Bool)

(declare-fun b_and!14023 () Bool)

(assert (=> start!33608 (= tp!24032 b_and!14023)))

(declare-fun b!333476 () Bool)

(declare-fun e!204767 () Bool)

(declare-fun e!204770 () Bool)

(declare-fun mapRes!11589 () Bool)

(assert (=> b!333476 (= e!204767 (and e!204770 mapRes!11589))))

(declare-fun condMapEmpty!11589 () Bool)

(declare-datatypes ((V!10037 0))(
  ( (V!10038 (val!3442 Int)) )
))
(declare-datatypes ((ValueCell!3054 0))(
  ( (ValueCellFull!3054 (v!5604 V!10037)) (EmptyCell!3054) )
))
(declare-datatypes ((array!17187 0))(
  ( (array!17188 (arr!8124 (Array (_ BitVec 32) ValueCell!3054)) (size!8476 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17187)

(declare-fun mapDefault!11589 () ValueCell!3054)

(assert (=> b!333476 (= condMapEmpty!11589 (= (arr!8124 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3054)) mapDefault!11589)))))

(declare-fun res!183693 () Bool)

(declare-fun e!204771 () Bool)

(assert (=> start!33608 (=> (not res!183693) (not e!204771))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33608 (= res!183693 (validMask!0 mask!2385))))

(assert (=> start!33608 e!204771))

(assert (=> start!33608 true))

(declare-fun tp_is_empty!6795 () Bool)

(assert (=> start!33608 tp_is_empty!6795))

(assert (=> start!33608 tp!24032))

(declare-fun array_inv!6042 (array!17187) Bool)

(assert (=> start!33608 (and (array_inv!6042 _values!1525) e!204767)))

(declare-datatypes ((array!17189 0))(
  ( (array!17190 (arr!8125 (Array (_ BitVec 32) (_ BitVec 64))) (size!8477 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17189)

(declare-fun array_inv!6043 (array!17189) Bool)

(assert (=> start!33608 (array_inv!6043 _keys!1895)))

(declare-fun b!333477 () Bool)

(declare-fun res!183692 () Bool)

(assert (=> b!333477 (=> (not res!183692) (not e!204771))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10037)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10037)

(declare-datatypes ((tuple2!5006 0))(
  ( (tuple2!5007 (_1!2514 (_ BitVec 64)) (_2!2514 V!10037)) )
))
(declare-datatypes ((List!4623 0))(
  ( (Nil!4620) (Cons!4619 (h!5475 tuple2!5006) (t!9711 List!4623)) )
))
(declare-datatypes ((ListLongMap!3919 0))(
  ( (ListLongMap!3920 (toList!1975 List!4623)) )
))
(declare-fun contains!2019 (ListLongMap!3919 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1503 (array!17189 array!17187 (_ BitVec 32) (_ BitVec 32) V!10037 V!10037 (_ BitVec 32) Int) ListLongMap!3919)

(assert (=> b!333477 (= res!183692 (not (contains!2019 (getCurrentListMap!1503 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333478 () Bool)

(assert (=> b!333478 (= e!204771 false)))

(declare-datatypes ((SeekEntryResult!3138 0))(
  ( (MissingZero!3138 (index!14731 (_ BitVec 32))) (Found!3138 (index!14732 (_ BitVec 32))) (Intermediate!3138 (undefined!3950 Bool) (index!14733 (_ BitVec 32)) (x!33216 (_ BitVec 32))) (Undefined!3138) (MissingVacant!3138 (index!14734 (_ BitVec 32))) )
))
(declare-fun lt!159367 () SeekEntryResult!3138)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17189 (_ BitVec 32)) SeekEntryResult!3138)

(assert (=> b!333478 (= lt!159367 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333479 () Bool)

(declare-fun res!183691 () Bool)

(assert (=> b!333479 (=> (not res!183691) (not e!204771))))

(assert (=> b!333479 (= res!183691 (and (= (size!8476 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8477 _keys!1895) (size!8476 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333480 () Bool)

(declare-fun res!183695 () Bool)

(assert (=> b!333480 (=> (not res!183695) (not e!204771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333480 (= res!183695 (validKeyInArray!0 k0!1348))))

(declare-fun b!333481 () Bool)

(assert (=> b!333481 (= e!204770 tp_is_empty!6795)))

(declare-fun mapNonEmpty!11589 () Bool)

(declare-fun tp!24033 () Bool)

(declare-fun e!204768 () Bool)

(assert (=> mapNonEmpty!11589 (= mapRes!11589 (and tp!24033 e!204768))))

(declare-fun mapKey!11589 () (_ BitVec 32))

(declare-fun mapValue!11589 () ValueCell!3054)

(declare-fun mapRest!11589 () (Array (_ BitVec 32) ValueCell!3054))

(assert (=> mapNonEmpty!11589 (= (arr!8124 _values!1525) (store mapRest!11589 mapKey!11589 mapValue!11589))))

(declare-fun b!333482 () Bool)

(assert (=> b!333482 (= e!204768 tp_is_empty!6795)))

(declare-fun b!333483 () Bool)

(declare-fun res!183690 () Bool)

(assert (=> b!333483 (=> (not res!183690) (not e!204771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17189 (_ BitVec 32)) Bool)

(assert (=> b!333483 (= res!183690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333484 () Bool)

(declare-fun res!183694 () Bool)

(assert (=> b!333484 (=> (not res!183694) (not e!204771))))

(declare-datatypes ((List!4624 0))(
  ( (Nil!4621) (Cons!4620 (h!5476 (_ BitVec 64)) (t!9712 List!4624)) )
))
(declare-fun arrayNoDuplicates!0 (array!17189 (_ BitVec 32) List!4624) Bool)

(assert (=> b!333484 (= res!183694 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4621))))

(declare-fun mapIsEmpty!11589 () Bool)

(assert (=> mapIsEmpty!11589 mapRes!11589))

(assert (= (and start!33608 res!183693) b!333479))

(assert (= (and b!333479 res!183691) b!333483))

(assert (= (and b!333483 res!183690) b!333484))

(assert (= (and b!333484 res!183694) b!333480))

(assert (= (and b!333480 res!183695) b!333477))

(assert (= (and b!333477 res!183692) b!333478))

(assert (= (and b!333476 condMapEmpty!11589) mapIsEmpty!11589))

(assert (= (and b!333476 (not condMapEmpty!11589)) mapNonEmpty!11589))

(get-info :version)

(assert (= (and mapNonEmpty!11589 ((_ is ValueCellFull!3054) mapValue!11589)) b!333482))

(assert (= (and b!333476 ((_ is ValueCellFull!3054) mapDefault!11589)) b!333481))

(assert (= start!33608 b!333476))

(declare-fun m!337721 () Bool)

(assert (=> b!333480 m!337721))

(declare-fun m!337723 () Bool)

(assert (=> mapNonEmpty!11589 m!337723))

(declare-fun m!337725 () Bool)

(assert (=> start!33608 m!337725))

(declare-fun m!337727 () Bool)

(assert (=> start!33608 m!337727))

(declare-fun m!337729 () Bool)

(assert (=> start!33608 m!337729))

(declare-fun m!337731 () Bool)

(assert (=> b!333484 m!337731))

(declare-fun m!337733 () Bool)

(assert (=> b!333477 m!337733))

(assert (=> b!333477 m!337733))

(declare-fun m!337735 () Bool)

(assert (=> b!333477 m!337735))

(declare-fun m!337737 () Bool)

(assert (=> b!333478 m!337737))

(declare-fun m!337739 () Bool)

(assert (=> b!333483 m!337739))

(check-sat (not b!333484) (not b!333480) (not start!33608) (not b_next!6843) (not b!333478) (not b!333477) (not b!333483) b_and!14023 (not mapNonEmpty!11589) tp_is_empty!6795)
(check-sat b_and!14023 (not b_next!6843))
