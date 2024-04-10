; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33614 () Bool)

(assert start!33614)

(declare-fun b_free!6849 () Bool)

(declare-fun b_next!6849 () Bool)

(assert (=> start!33614 (= b_free!6849 (not b_next!6849))))

(declare-fun tp!24050 () Bool)

(declare-fun b_and!14029 () Bool)

(assert (=> start!33614 (= tp!24050 b_and!14029)))

(declare-fun b!333557 () Bool)

(declare-fun res!183744 () Bool)

(declare-fun e!204816 () Bool)

(assert (=> b!333557 (=> (not res!183744) (not e!204816))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333557 (= res!183744 (validKeyInArray!0 k0!1348))))

(declare-fun b!333558 () Bool)

(assert (=> b!333558 (= e!204816 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3139 0))(
  ( (MissingZero!3139 (index!14735 (_ BitVec 32))) (Found!3139 (index!14736 (_ BitVec 32))) (Intermediate!3139 (undefined!3951 Bool) (index!14737 (_ BitVec 32)) (x!33225 (_ BitVec 32))) (Undefined!3139) (MissingVacant!3139 (index!14738 (_ BitVec 32))) )
))
(declare-fun lt!159376 () SeekEntryResult!3139)

(declare-datatypes ((array!17197 0))(
  ( (array!17198 (arr!8129 (Array (_ BitVec 32) (_ BitVec 64))) (size!8481 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17197)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17197 (_ BitVec 32)) SeekEntryResult!3139)

(assert (=> b!333558 (= lt!159376 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333559 () Bool)

(declare-fun res!183749 () Bool)

(assert (=> b!333559 (=> (not res!183749) (not e!204816))))

(declare-datatypes ((List!4626 0))(
  ( (Nil!4623) (Cons!4622 (h!5478 (_ BitVec 64)) (t!9714 List!4626)) )
))
(declare-fun arrayNoDuplicates!0 (array!17197 (_ BitVec 32) List!4626) Bool)

(assert (=> b!333559 (= res!183749 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4623))))

(declare-fun b!333560 () Bool)

(declare-fun e!204814 () Bool)

(declare-fun tp_is_empty!6801 () Bool)

(assert (=> b!333560 (= e!204814 tp_is_empty!6801)))

(declare-fun mapIsEmpty!11598 () Bool)

(declare-fun mapRes!11598 () Bool)

(assert (=> mapIsEmpty!11598 mapRes!11598))

(declare-fun b!333561 () Bool)

(declare-fun e!204813 () Bool)

(declare-fun e!204812 () Bool)

(assert (=> b!333561 (= e!204813 (and e!204812 mapRes!11598))))

(declare-fun condMapEmpty!11598 () Bool)

(declare-datatypes ((V!10045 0))(
  ( (V!10046 (val!3445 Int)) )
))
(declare-datatypes ((ValueCell!3057 0))(
  ( (ValueCellFull!3057 (v!5607 V!10045)) (EmptyCell!3057) )
))
(declare-datatypes ((array!17199 0))(
  ( (array!17200 (arr!8130 (Array (_ BitVec 32) ValueCell!3057)) (size!8482 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17199)

(declare-fun mapDefault!11598 () ValueCell!3057)

(assert (=> b!333561 (= condMapEmpty!11598 (= (arr!8130 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3057)) mapDefault!11598)))))

(declare-fun res!183747 () Bool)

(assert (=> start!33614 (=> (not res!183747) (not e!204816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33614 (= res!183747 (validMask!0 mask!2385))))

(assert (=> start!33614 e!204816))

(assert (=> start!33614 true))

(assert (=> start!33614 tp_is_empty!6801))

(assert (=> start!33614 tp!24050))

(declare-fun array_inv!6044 (array!17199) Bool)

(assert (=> start!33614 (and (array_inv!6044 _values!1525) e!204813)))

(declare-fun array_inv!6045 (array!17197) Bool)

(assert (=> start!33614 (array_inv!6045 _keys!1895)))

(declare-fun b!333562 () Bool)

(declare-fun res!183745 () Bool)

(assert (=> b!333562 (=> (not res!183745) (not e!204816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17197 (_ BitVec 32)) Bool)

(assert (=> b!333562 (= res!183745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333563 () Bool)

(assert (=> b!333563 (= e!204812 tp_is_empty!6801)))

(declare-fun b!333564 () Bool)

(declare-fun res!183746 () Bool)

(assert (=> b!333564 (=> (not res!183746) (not e!204816))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333564 (= res!183746 (and (= (size!8482 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8481 _keys!1895) (size!8482 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11598 () Bool)

(declare-fun tp!24051 () Bool)

(assert (=> mapNonEmpty!11598 (= mapRes!11598 (and tp!24051 e!204814))))

(declare-fun mapValue!11598 () ValueCell!3057)

(declare-fun mapRest!11598 () (Array (_ BitVec 32) ValueCell!3057))

(declare-fun mapKey!11598 () (_ BitVec 32))

(assert (=> mapNonEmpty!11598 (= (arr!8130 _values!1525) (store mapRest!11598 mapKey!11598 mapValue!11598))))

(declare-fun b!333565 () Bool)

(declare-fun res!183748 () Bool)

(assert (=> b!333565 (=> (not res!183748) (not e!204816))))

(declare-fun zeroValue!1467 () V!10045)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10045)

(declare-datatypes ((tuple2!5008 0))(
  ( (tuple2!5009 (_1!2515 (_ BitVec 64)) (_2!2515 V!10045)) )
))
(declare-datatypes ((List!4627 0))(
  ( (Nil!4624) (Cons!4623 (h!5479 tuple2!5008) (t!9715 List!4627)) )
))
(declare-datatypes ((ListLongMap!3921 0))(
  ( (ListLongMap!3922 (toList!1976 List!4627)) )
))
(declare-fun contains!2020 (ListLongMap!3921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1504 (array!17197 array!17199 (_ BitVec 32) (_ BitVec 32) V!10045 V!10045 (_ BitVec 32) Int) ListLongMap!3921)

(assert (=> b!333565 (= res!183748 (not (contains!2020 (getCurrentListMap!1504 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!33614 res!183747) b!333564))

(assert (= (and b!333564 res!183746) b!333562))

(assert (= (and b!333562 res!183745) b!333559))

(assert (= (and b!333559 res!183749) b!333557))

(assert (= (and b!333557 res!183744) b!333565))

(assert (= (and b!333565 res!183748) b!333558))

(assert (= (and b!333561 condMapEmpty!11598) mapIsEmpty!11598))

(assert (= (and b!333561 (not condMapEmpty!11598)) mapNonEmpty!11598))

(get-info :version)

(assert (= (and mapNonEmpty!11598 ((_ is ValueCellFull!3057) mapValue!11598)) b!333560))

(assert (= (and b!333561 ((_ is ValueCellFull!3057) mapDefault!11598)) b!333563))

(assert (= start!33614 b!333561))

(declare-fun m!337781 () Bool)

(assert (=> mapNonEmpty!11598 m!337781))

(declare-fun m!337783 () Bool)

(assert (=> b!333565 m!337783))

(assert (=> b!333565 m!337783))

(declare-fun m!337785 () Bool)

(assert (=> b!333565 m!337785))

(declare-fun m!337787 () Bool)

(assert (=> start!33614 m!337787))

(declare-fun m!337789 () Bool)

(assert (=> start!33614 m!337789))

(declare-fun m!337791 () Bool)

(assert (=> start!33614 m!337791))

(declare-fun m!337793 () Bool)

(assert (=> b!333562 m!337793))

(declare-fun m!337795 () Bool)

(assert (=> b!333557 m!337795))

(declare-fun m!337797 () Bool)

(assert (=> b!333559 m!337797))

(declare-fun m!337799 () Bool)

(assert (=> b!333558 m!337799))

(check-sat tp_is_empty!6801 (not b!333562) (not b!333559) (not b!333557) (not b!333565) (not b!333558) b_and!14029 (not start!33614) (not mapNonEmpty!11598) (not b_next!6849))
(check-sat b_and!14029 (not b_next!6849))
