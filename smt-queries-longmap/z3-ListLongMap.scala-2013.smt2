; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35104 () Bool)

(assert start!35104)

(declare-fun b_free!7749 () Bool)

(declare-fun b_next!7749 () Bool)

(assert (=> start!35104 (= b_free!7749 (not b_next!7749))))

(declare-fun tp!26832 () Bool)

(declare-fun b_and!14983 () Bool)

(assert (=> start!35104 (= tp!26832 b_and!14983)))

(declare-fun mapNonEmpty!13029 () Bool)

(declare-fun mapRes!13029 () Bool)

(declare-fun tp!26831 () Bool)

(declare-fun e!215491 () Bool)

(assert (=> mapNonEmpty!13029 (= mapRes!13029 (and tp!26831 e!215491))))

(declare-datatypes ((V!11245 0))(
  ( (V!11246 (val!3895 Int)) )
))
(declare-datatypes ((ValueCell!3507 0))(
  ( (ValueCellFull!3507 (v!6084 V!11245)) (EmptyCell!3507) )
))
(declare-fun mapRest!13029 () (Array (_ BitVec 32) ValueCell!3507))

(declare-fun mapKey!13029 () (_ BitVec 32))

(declare-datatypes ((array!18991 0))(
  ( (array!18992 (arr!8999 (Array (_ BitVec 32) ValueCell!3507)) (size!9351 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18991)

(declare-fun mapValue!13029 () ValueCell!3507)

(assert (=> mapNonEmpty!13029 (= (arr!8999 _values!1525) (store mapRest!13029 mapKey!13029 mapValue!13029))))

(declare-fun b!351896 () Bool)

(declare-fun res!195150 () Bool)

(declare-fun e!215496 () Bool)

(assert (=> b!351896 (=> (not res!195150) (not e!215496))))

(declare-datatypes ((array!18993 0))(
  ( (array!18994 (arr!9000 (Array (_ BitVec 32) (_ BitVec 64))) (size!9352 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18993)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18993 (_ BitVec 32)) Bool)

(assert (=> b!351896 (= res!195150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351897 () Bool)

(declare-datatypes ((Unit!10876 0))(
  ( (Unit!10877) )
))
(declare-fun e!215495 () Unit!10876)

(declare-fun Unit!10878 () Unit!10876)

(assert (=> b!351897 (= e!215495 Unit!10878)))

(declare-fun mapIsEmpty!13029 () Bool)

(assert (=> mapIsEmpty!13029 mapRes!13029))

(declare-fun b!351899 () Bool)

(declare-fun e!215490 () Bool)

(assert (=> b!351899 (= e!215496 e!215490)))

(declare-fun res!195154 () Bool)

(assert (=> b!351899 (=> (not res!195154) (not e!215490))))

(declare-datatypes ((SeekEntryResult!3463 0))(
  ( (MissingZero!3463 (index!16031 (_ BitVec 32))) (Found!3463 (index!16032 (_ BitVec 32))) (Intermediate!3463 (undefined!4275 Bool) (index!16033 (_ BitVec 32)) (x!35019 (_ BitVec 32))) (Undefined!3463) (MissingVacant!3463 (index!16034 (_ BitVec 32))) )
))
(declare-fun lt!165001 () SeekEntryResult!3463)

(get-info :version)

(assert (=> b!351899 (= res!195154 (and (not ((_ is Found!3463) lt!165001)) (not ((_ is MissingZero!3463) lt!165001)) ((_ is MissingVacant!3463) lt!165001)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18993 (_ BitVec 32)) SeekEntryResult!3463)

(assert (=> b!351899 (= lt!165001 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351900 () Bool)

(declare-fun res!195153 () Bool)

(assert (=> b!351900 (=> (not res!195153) (not e!215496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351900 (= res!195153 (validKeyInArray!0 k0!1348))))

(declare-fun b!351901 () Bool)

(declare-fun e!215492 () Bool)

(declare-fun tp_is_empty!7701 () Bool)

(assert (=> b!351901 (= e!215492 tp_is_empty!7701)))

(declare-fun b!351898 () Bool)

(assert (=> b!351898 (= e!215491 tp_is_empty!7701)))

(declare-fun res!195149 () Bool)

(assert (=> start!35104 (=> (not res!195149) (not e!215496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35104 (= res!195149 (validMask!0 mask!2385))))

(assert (=> start!35104 e!215496))

(assert (=> start!35104 true))

(assert (=> start!35104 tp_is_empty!7701))

(assert (=> start!35104 tp!26832))

(declare-fun e!215493 () Bool)

(declare-fun array_inv!6638 (array!18991) Bool)

(assert (=> start!35104 (and (array_inv!6638 _values!1525) e!215493)))

(declare-fun array_inv!6639 (array!18993) Bool)

(assert (=> start!35104 (array_inv!6639 _keys!1895)))

(declare-fun b!351902 () Bool)

(declare-fun res!195155 () Bool)

(assert (=> b!351902 (=> (not res!195155) (not e!215496))))

(declare-datatypes ((List!5237 0))(
  ( (Nil!5234) (Cons!5233 (h!6089 (_ BitVec 64)) (t!10379 List!5237)) )
))
(declare-fun arrayNoDuplicates!0 (array!18993 (_ BitVec 32) List!5237) Bool)

(assert (=> b!351902 (= res!195155 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5234))))

(declare-fun b!351903 () Bool)

(declare-fun lt!165003 () Bool)

(assert (=> b!351903 (= e!215490 lt!165003)))

(declare-fun lt!165002 () Unit!10876)

(assert (=> b!351903 (= lt!165002 e!215495)))

(declare-fun c!53502 () Bool)

(assert (=> b!351903 (= c!53502 lt!165003)))

(declare-fun arrayContainsKey!0 (array!18993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351903 (= lt!165003 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351904 () Bool)

(declare-fun Unit!10879 () Unit!10876)

(assert (=> b!351904 (= e!215495 Unit!10879)))

(declare-fun lt!165004 () Unit!10876)

(declare-fun zeroValue!1467 () V!11245)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11245)

(declare-fun lemmaArrayContainsKeyThenInListMap!330 (array!18993 array!18991 (_ BitVec 32) (_ BitVec 32) V!11245 V!11245 (_ BitVec 64) (_ BitVec 32) Int) Unit!10876)

(declare-fun arrayScanForKey!0 (array!18993 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351904 (= lt!165004 (lemmaArrayContainsKeyThenInListMap!330 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!351904 false))

(declare-fun b!351905 () Bool)

(declare-fun res!195151 () Bool)

(assert (=> b!351905 (=> (not res!195151) (not e!215496))))

(assert (=> b!351905 (= res!195151 (and (= (size!9351 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9352 _keys!1895) (size!9351 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351906 () Bool)

(assert (=> b!351906 (= e!215493 (and e!215492 mapRes!13029))))

(declare-fun condMapEmpty!13029 () Bool)

(declare-fun mapDefault!13029 () ValueCell!3507)

(assert (=> b!351906 (= condMapEmpty!13029 (= (arr!8999 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3507)) mapDefault!13029)))))

(declare-fun b!351907 () Bool)

(declare-fun res!195152 () Bool)

(assert (=> b!351907 (=> (not res!195152) (not e!215496))))

(declare-datatypes ((tuple2!5616 0))(
  ( (tuple2!5617 (_1!2819 (_ BitVec 64)) (_2!2819 V!11245)) )
))
(declare-datatypes ((List!5238 0))(
  ( (Nil!5235) (Cons!5234 (h!6090 tuple2!5616) (t!10380 List!5238)) )
))
(declare-datatypes ((ListLongMap!4529 0))(
  ( (ListLongMap!4530 (toList!2280 List!5238)) )
))
(declare-fun contains!2351 (ListLongMap!4529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1801 (array!18993 array!18991 (_ BitVec 32) (_ BitVec 32) V!11245 V!11245 (_ BitVec 32) Int) ListLongMap!4529)

(assert (=> b!351907 (= res!195152 (not (contains!2351 (getCurrentListMap!1801 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!35104 res!195149) b!351905))

(assert (= (and b!351905 res!195151) b!351896))

(assert (= (and b!351896 res!195150) b!351902))

(assert (= (and b!351902 res!195155) b!351900))

(assert (= (and b!351900 res!195153) b!351907))

(assert (= (and b!351907 res!195152) b!351899))

(assert (= (and b!351899 res!195154) b!351903))

(assert (= (and b!351903 c!53502) b!351904))

(assert (= (and b!351903 (not c!53502)) b!351897))

(assert (= (and b!351906 condMapEmpty!13029) mapIsEmpty!13029))

(assert (= (and b!351906 (not condMapEmpty!13029)) mapNonEmpty!13029))

(assert (= (and mapNonEmpty!13029 ((_ is ValueCellFull!3507) mapValue!13029)) b!351898))

(assert (= (and b!351906 ((_ is ValueCellFull!3507) mapDefault!13029)) b!351901))

(assert (= start!35104 b!351906))

(declare-fun m!351699 () Bool)

(assert (=> b!351900 m!351699))

(declare-fun m!351701 () Bool)

(assert (=> start!35104 m!351701))

(declare-fun m!351703 () Bool)

(assert (=> start!35104 m!351703))

(declare-fun m!351705 () Bool)

(assert (=> start!35104 m!351705))

(declare-fun m!351707 () Bool)

(assert (=> mapNonEmpty!13029 m!351707))

(declare-fun m!351709 () Bool)

(assert (=> b!351903 m!351709))

(declare-fun m!351711 () Bool)

(assert (=> b!351899 m!351711))

(declare-fun m!351713 () Bool)

(assert (=> b!351907 m!351713))

(assert (=> b!351907 m!351713))

(declare-fun m!351715 () Bool)

(assert (=> b!351907 m!351715))

(declare-fun m!351717 () Bool)

(assert (=> b!351896 m!351717))

(declare-fun m!351719 () Bool)

(assert (=> b!351902 m!351719))

(declare-fun m!351721 () Bool)

(assert (=> b!351904 m!351721))

(assert (=> b!351904 m!351721))

(declare-fun m!351723 () Bool)

(assert (=> b!351904 m!351723))

(check-sat (not b!351904) (not b!351899) (not b!351907) (not start!35104) tp_is_empty!7701 (not b_next!7749) (not b!351896) (not mapNonEmpty!13029) b_and!14983 (not b!351903) (not b!351900) (not b!351902))
(check-sat b_and!14983 (not b_next!7749))
