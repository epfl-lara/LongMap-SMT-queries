; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33954 () Bool)

(assert start!33954)

(declare-fun b_free!7099 () Bool)

(declare-fun b_next!7099 () Bool)

(assert (=> start!33954 (= b_free!7099 (not b_next!7099))))

(declare-fun tp!24816 () Bool)

(declare-fun b_and!14303 () Bool)

(assert (=> start!33954 (= tp!24816 b_and!14303)))

(declare-fun mapNonEmpty!11988 () Bool)

(declare-fun mapRes!11988 () Bool)

(declare-fun tp!24815 () Bool)

(declare-fun e!207522 () Bool)

(assert (=> mapNonEmpty!11988 (= mapRes!11988 (and tp!24815 e!207522))))

(declare-datatypes ((V!10379 0))(
  ( (V!10380 (val!3570 Int)) )
))
(declare-datatypes ((ValueCell!3182 0))(
  ( (ValueCellFull!3182 (v!5738 V!10379)) (EmptyCell!3182) )
))
(declare-fun mapValue!11988 () ValueCell!3182)

(declare-fun mapKey!11988 () (_ BitVec 32))

(declare-fun mapRest!11988 () (Array (_ BitVec 32) ValueCell!3182))

(declare-datatypes ((array!17682 0))(
  ( (array!17683 (arr!8366 (Array (_ BitVec 32) ValueCell!3182)) (size!8718 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17682)

(assert (=> mapNonEmpty!11988 (= (arr!8366 _values!1525) (store mapRest!11988 mapKey!11988 mapValue!11988))))

(declare-fun b!338207 () Bool)

(declare-fun e!207520 () Bool)

(declare-fun e!207518 () Bool)

(assert (=> b!338207 (= e!207520 e!207518)))

(declare-fun res!186839 () Bool)

(assert (=> b!338207 (=> (not res!186839) (not e!207518))))

(declare-datatypes ((SeekEntryResult!3191 0))(
  ( (MissingZero!3191 (index!14943 (_ BitVec 32))) (Found!3191 (index!14944 (_ BitVec 32))) (Intermediate!3191 (undefined!4003 Bool) (index!14945 (_ BitVec 32)) (x!33660 (_ BitVec 32))) (Undefined!3191) (MissingVacant!3191 (index!14946 (_ BitVec 32))) )
))
(declare-fun lt!160779 () SeekEntryResult!3191)

(get-info :version)

(assert (=> b!338207 (= res!186839 (and (not ((_ is Found!3191) lt!160779)) ((_ is MissingZero!3191) lt!160779)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17684 0))(
  ( (array!17685 (arr!8367 (Array (_ BitVec 32) (_ BitVec 64))) (size!8719 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17684)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17684 (_ BitVec 32)) SeekEntryResult!3191)

(assert (=> b!338207 (= lt!160779 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338208 () Bool)

(assert (=> b!338208 (= e!207518 false)))

(declare-datatypes ((Unit!10466 0))(
  ( (Unit!10467) )
))
(declare-fun lt!160778 () Unit!10466)

(declare-fun e!207519 () Unit!10466)

(assert (=> b!338208 (= lt!160778 e!207519)))

(declare-fun c!52385 () Bool)

(declare-fun arrayContainsKey!0 (array!17684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338208 (= c!52385 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!186843 () Bool)

(assert (=> start!33954 (=> (not res!186843) (not e!207520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33954 (= res!186843 (validMask!0 mask!2385))))

(assert (=> start!33954 e!207520))

(assert (=> start!33954 true))

(declare-fun tp_is_empty!7051 () Bool)

(assert (=> start!33954 tp_is_empty!7051))

(assert (=> start!33954 tp!24816))

(declare-fun e!207524 () Bool)

(declare-fun array_inv!6216 (array!17682) Bool)

(assert (=> start!33954 (and (array_inv!6216 _values!1525) e!207524)))

(declare-fun array_inv!6217 (array!17684) Bool)

(assert (=> start!33954 (array_inv!6217 _keys!1895)))

(declare-fun b!338209 () Bool)

(declare-fun res!186840 () Bool)

(assert (=> b!338209 (=> (not res!186840) (not e!207520))))

(declare-datatypes ((List!4707 0))(
  ( (Nil!4704) (Cons!4703 (h!5559 (_ BitVec 64)) (t!9797 List!4707)) )
))
(declare-fun arrayNoDuplicates!0 (array!17684 (_ BitVec 32) List!4707) Bool)

(assert (=> b!338209 (= res!186840 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4704))))

(declare-fun b!338210 () Bool)

(declare-fun e!207523 () Bool)

(assert (=> b!338210 (= e!207523 tp_is_empty!7051)))

(declare-fun b!338211 () Bool)

(assert (=> b!338211 (= e!207522 tp_is_empty!7051)))

(declare-fun mapIsEmpty!11988 () Bool)

(assert (=> mapIsEmpty!11988 mapRes!11988))

(declare-fun b!338212 () Bool)

(declare-fun res!186842 () Bool)

(assert (=> b!338212 (=> (not res!186842) (not e!207520))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!338212 (= res!186842 (and (= (size!8718 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8719 _keys!1895) (size!8718 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338213 () Bool)

(declare-fun res!186841 () Bool)

(assert (=> b!338213 (=> (not res!186841) (not e!207520))))

(declare-fun zeroValue!1467 () V!10379)

(declare-fun minValue!1467 () V!10379)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5098 0))(
  ( (tuple2!5099 (_1!2560 (_ BitVec 64)) (_2!2560 V!10379)) )
))
(declare-datatypes ((List!4708 0))(
  ( (Nil!4705) (Cons!4704 (h!5560 tuple2!5098) (t!9798 List!4708)) )
))
(declare-datatypes ((ListLongMap!4013 0))(
  ( (ListLongMap!4014 (toList!2022 List!4708)) )
))
(declare-fun contains!2090 (ListLongMap!4013 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1551 (array!17684 array!17682 (_ BitVec 32) (_ BitVec 32) V!10379 V!10379 (_ BitVec 32) Int) ListLongMap!4013)

(assert (=> b!338213 (= res!186841 (not (contains!2090 (getCurrentListMap!1551 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338214 () Bool)

(declare-fun Unit!10468 () Unit!10466)

(assert (=> b!338214 (= e!207519 Unit!10468)))

(declare-fun lt!160780 () Unit!10466)

(declare-fun lemmaArrayContainsKeyThenInListMap!278 (array!17684 array!17682 (_ BitVec 32) (_ BitVec 32) V!10379 V!10379 (_ BitVec 64) (_ BitVec 32) Int) Unit!10466)

(declare-fun arrayScanForKey!0 (array!17684 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338214 (= lt!160780 (lemmaArrayContainsKeyThenInListMap!278 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338214 false))

(declare-fun b!338215 () Bool)

(declare-fun Unit!10469 () Unit!10466)

(assert (=> b!338215 (= e!207519 Unit!10469)))

(declare-fun b!338216 () Bool)

(assert (=> b!338216 (= e!207524 (and e!207523 mapRes!11988))))

(declare-fun condMapEmpty!11988 () Bool)

(declare-fun mapDefault!11988 () ValueCell!3182)

(assert (=> b!338216 (= condMapEmpty!11988 (= (arr!8366 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3182)) mapDefault!11988)))))

(declare-fun b!338217 () Bool)

(declare-fun res!186845 () Bool)

(assert (=> b!338217 (=> (not res!186845) (not e!207520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17684 (_ BitVec 32)) Bool)

(assert (=> b!338217 (= res!186845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338218 () Bool)

(declare-fun res!186844 () Bool)

(assert (=> b!338218 (=> (not res!186844) (not e!207520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338218 (= res!186844 (validKeyInArray!0 k0!1348))))

(assert (= (and start!33954 res!186843) b!338212))

(assert (= (and b!338212 res!186842) b!338217))

(assert (= (and b!338217 res!186845) b!338209))

(assert (= (and b!338209 res!186840) b!338218))

(assert (= (and b!338218 res!186844) b!338213))

(assert (= (and b!338213 res!186841) b!338207))

(assert (= (and b!338207 res!186839) b!338208))

(assert (= (and b!338208 c!52385) b!338214))

(assert (= (and b!338208 (not c!52385)) b!338215))

(assert (= (and b!338216 condMapEmpty!11988) mapIsEmpty!11988))

(assert (= (and b!338216 (not condMapEmpty!11988)) mapNonEmpty!11988))

(assert (= (and mapNonEmpty!11988 ((_ is ValueCellFull!3182) mapValue!11988)) b!338211))

(assert (= (and b!338216 ((_ is ValueCellFull!3182) mapDefault!11988)) b!338210))

(assert (= start!33954 b!338216))

(declare-fun m!341785 () Bool)

(assert (=> b!338208 m!341785))

(declare-fun m!341787 () Bool)

(assert (=> b!338218 m!341787))

(declare-fun m!341789 () Bool)

(assert (=> b!338217 m!341789))

(declare-fun m!341791 () Bool)

(assert (=> b!338207 m!341791))

(declare-fun m!341793 () Bool)

(assert (=> mapNonEmpty!11988 m!341793))

(declare-fun m!341795 () Bool)

(assert (=> start!33954 m!341795))

(declare-fun m!341797 () Bool)

(assert (=> start!33954 m!341797))

(declare-fun m!341799 () Bool)

(assert (=> start!33954 m!341799))

(declare-fun m!341801 () Bool)

(assert (=> b!338209 m!341801))

(declare-fun m!341803 () Bool)

(assert (=> b!338213 m!341803))

(assert (=> b!338213 m!341803))

(declare-fun m!341805 () Bool)

(assert (=> b!338213 m!341805))

(declare-fun m!341807 () Bool)

(assert (=> b!338214 m!341807))

(assert (=> b!338214 m!341807))

(declare-fun m!341809 () Bool)

(assert (=> b!338214 m!341809))

(check-sat (not start!33954) tp_is_empty!7051 (not b!338214) (not b!338218) (not b!338217) (not b!338207) (not b!338208) (not mapNonEmpty!11988) b_and!14303 (not b!338213) (not b!338209) (not b_next!7099))
(check-sat b_and!14303 (not b_next!7099))
