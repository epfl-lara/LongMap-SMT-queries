; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33752 () Bool)

(assert start!33752)

(declare-fun b_free!6987 () Bool)

(declare-fun b_next!6987 () Bool)

(assert (=> start!33752 (= b_free!6987 (not b_next!6987))))

(declare-fun tp!24465 () Bool)

(declare-fun b_and!14167 () Bool)

(assert (=> start!33752 (= tp!24465 b_and!14167)))

(declare-fun b!335780 () Bool)

(declare-fun e!206120 () Bool)

(assert (=> b!335780 (= e!206120 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3197 0))(
  ( (MissingZero!3197 (index!14967 (_ BitVec 32))) (Found!3197 (index!14968 (_ BitVec 32))) (Intermediate!3197 (undefined!4009 Bool) (index!14969 (_ BitVec 32)) (x!33467 (_ BitVec 32))) (Undefined!3197) (MissingVacant!3197 (index!14970 (_ BitVec 32))) )
))
(declare-fun lt!159943 () SeekEntryResult!3197)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17471 0))(
  ( (array!17472 (arr!8266 (Array (_ BitVec 32) (_ BitVec 64))) (size!8618 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17471)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17471 (_ BitVec 32)) SeekEntryResult!3197)

(assert (=> b!335780 (= lt!159943 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335781 () Bool)

(declare-fun e!206118 () Bool)

(declare-fun tp_is_empty!6939 () Bool)

(assert (=> b!335781 (= e!206118 tp_is_empty!6939)))

(declare-fun b!335782 () Bool)

(declare-fun res!185346 () Bool)

(assert (=> b!335782 (=> (not res!185346) (not e!206120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335782 (= res!185346 (validKeyInArray!0 k0!1348))))

(declare-fun b!335783 () Bool)

(declare-fun res!185350 () Bool)

(assert (=> b!335783 (=> (not res!185350) (not e!206120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17471 (_ BitVec 32)) Bool)

(assert (=> b!335783 (= res!185350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335784 () Bool)

(declare-fun res!185347 () Bool)

(assert (=> b!335784 (=> (not res!185347) (not e!206120))))

(declare-datatypes ((List!4724 0))(
  ( (Nil!4721) (Cons!4720 (h!5576 (_ BitVec 64)) (t!9812 List!4724)) )
))
(declare-fun arrayNoDuplicates!0 (array!17471 (_ BitVec 32) List!4724) Bool)

(assert (=> b!335784 (= res!185347 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4721))))

(declare-fun b!335785 () Bool)

(declare-fun res!185349 () Bool)

(assert (=> b!335785 (=> (not res!185349) (not e!206120))))

(declare-datatypes ((V!10229 0))(
  ( (V!10230 (val!3514 Int)) )
))
(declare-datatypes ((ValueCell!3126 0))(
  ( (ValueCellFull!3126 (v!5676 V!10229)) (EmptyCell!3126) )
))
(declare-datatypes ((array!17473 0))(
  ( (array!17474 (arr!8267 (Array (_ BitVec 32) ValueCell!3126)) (size!8619 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17473)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335785 (= res!185349 (and (= (size!8619 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8618 _keys!1895) (size!8619 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11805 () Bool)

(declare-fun mapRes!11805 () Bool)

(declare-fun tp!24464 () Bool)

(assert (=> mapNonEmpty!11805 (= mapRes!11805 (and tp!24464 e!206118))))

(declare-fun mapRest!11805 () (Array (_ BitVec 32) ValueCell!3126))

(declare-fun mapKey!11805 () (_ BitVec 32))

(declare-fun mapValue!11805 () ValueCell!3126)

(assert (=> mapNonEmpty!11805 (= (arr!8267 _values!1525) (store mapRest!11805 mapKey!11805 mapValue!11805))))

(declare-fun b!335786 () Bool)

(declare-fun res!185348 () Bool)

(assert (=> b!335786 (=> (not res!185348) (not e!206120))))

(declare-fun zeroValue!1467 () V!10229)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10229)

(declare-datatypes ((tuple2!5108 0))(
  ( (tuple2!5109 (_1!2565 (_ BitVec 64)) (_2!2565 V!10229)) )
))
(declare-datatypes ((List!4725 0))(
  ( (Nil!4722) (Cons!4721 (h!5577 tuple2!5108) (t!9813 List!4725)) )
))
(declare-datatypes ((ListLongMap!4021 0))(
  ( (ListLongMap!4022 (toList!2026 List!4725)) )
))
(declare-fun contains!2070 (ListLongMap!4021 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1547 (array!17471 array!17473 (_ BitVec 32) (_ BitVec 32) V!10229 V!10229 (_ BitVec 32) Int) ListLongMap!4021)

(assert (=> b!335786 (= res!185348 (not (contains!2070 (getCurrentListMap!1547 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!185351 () Bool)

(assert (=> start!33752 (=> (not res!185351) (not e!206120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33752 (= res!185351 (validMask!0 mask!2385))))

(assert (=> start!33752 e!206120))

(assert (=> start!33752 true))

(assert (=> start!33752 tp_is_empty!6939))

(assert (=> start!33752 tp!24465))

(declare-fun e!206121 () Bool)

(declare-fun array_inv!6140 (array!17473) Bool)

(assert (=> start!33752 (and (array_inv!6140 _values!1525) e!206121)))

(declare-fun array_inv!6141 (array!17471) Bool)

(assert (=> start!33752 (array_inv!6141 _keys!1895)))

(declare-fun b!335787 () Bool)

(declare-fun e!206119 () Bool)

(assert (=> b!335787 (= e!206121 (and e!206119 mapRes!11805))))

(declare-fun condMapEmpty!11805 () Bool)

(declare-fun mapDefault!11805 () ValueCell!3126)

(assert (=> b!335787 (= condMapEmpty!11805 (= (arr!8267 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3126)) mapDefault!11805)))))

(declare-fun mapIsEmpty!11805 () Bool)

(assert (=> mapIsEmpty!11805 mapRes!11805))

(declare-fun b!335788 () Bool)

(assert (=> b!335788 (= e!206119 tp_is_empty!6939)))

(assert (= (and start!33752 res!185351) b!335785))

(assert (= (and b!335785 res!185349) b!335783))

(assert (= (and b!335783 res!185350) b!335784))

(assert (= (and b!335784 res!185347) b!335782))

(assert (= (and b!335782 res!185346) b!335786))

(assert (= (and b!335786 res!185348) b!335780))

(assert (= (and b!335787 condMapEmpty!11805) mapIsEmpty!11805))

(assert (= (and b!335787 (not condMapEmpty!11805)) mapNonEmpty!11805))

(get-info :version)

(assert (= (and mapNonEmpty!11805 ((_ is ValueCellFull!3126) mapValue!11805)) b!335781))

(assert (= (and b!335787 ((_ is ValueCellFull!3126) mapDefault!11805)) b!335788))

(assert (= start!33752 b!335787))

(declare-fun m!339761 () Bool)

(assert (=> mapNonEmpty!11805 m!339761))

(declare-fun m!339763 () Bool)

(assert (=> b!335784 m!339763))

(declare-fun m!339765 () Bool)

(assert (=> b!335780 m!339765))

(declare-fun m!339767 () Bool)

(assert (=> start!33752 m!339767))

(declare-fun m!339769 () Bool)

(assert (=> start!33752 m!339769))

(declare-fun m!339771 () Bool)

(assert (=> start!33752 m!339771))

(declare-fun m!339773 () Bool)

(assert (=> b!335782 m!339773))

(declare-fun m!339775 () Bool)

(assert (=> b!335783 m!339775))

(declare-fun m!339777 () Bool)

(assert (=> b!335786 m!339777))

(assert (=> b!335786 m!339777))

(declare-fun m!339779 () Bool)

(assert (=> b!335786 m!339779))

(check-sat (not b!335780) (not b!335783) (not b!335784) (not b!335786) (not b_next!6987) (not b!335782) (not start!33752) (not mapNonEmpty!11805) tp_is_empty!6939 b_and!14167)
(check-sat b_and!14167 (not b_next!6987))
