; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34766 () Bool)

(assert start!34766)

(declare-fun b_free!7551 () Bool)

(declare-fun b_next!7551 () Bool)

(assert (=> start!34766 (= b_free!7551 (not b_next!7551))))

(declare-fun tp!26220 () Bool)

(declare-fun b_and!14773 () Bool)

(assert (=> start!34766 (= tp!26220 b_and!14773)))

(declare-fun b!347647 () Bool)

(declare-fun res!192439 () Bool)

(declare-fun e!213017 () Bool)

(assert (=> b!347647 (=> (not res!192439) (not e!213017))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10981 0))(
  ( (V!10982 (val!3796 Int)) )
))
(declare-datatypes ((ValueCell!3408 0))(
  ( (ValueCellFull!3408 (v!5979 V!10981)) (EmptyCell!3408) )
))
(declare-datatypes ((array!18597 0))(
  ( (array!18598 (arr!8808 (Array (_ BitVec 32) ValueCell!3408)) (size!9160 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18597)

(declare-datatypes ((array!18599 0))(
  ( (array!18600 (arr!8809 (Array (_ BitVec 32) (_ BitVec 64))) (size!9161 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18599)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347647 (= res!192439 (and (= (size!9160 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9161 _keys!1895) (size!9160 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347648 () Bool)

(declare-fun res!192443 () Bool)

(declare-fun e!213011 () Bool)

(assert (=> b!347648 (=> (not res!192443) (not e!213011))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3398 0))(
  ( (MissingZero!3398 (index!15771 (_ BitVec 32))) (Found!3398 (index!15772 (_ BitVec 32))) (Intermediate!3398 (undefined!4210 Bool) (index!15773 (_ BitVec 32)) (x!34630 (_ BitVec 32))) (Undefined!3398) (MissingVacant!3398 (index!15774 (_ BitVec 32))) )
))
(declare-fun lt!163663 () SeekEntryResult!3398)

(declare-fun arrayContainsKey!0 (array!18599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347648 (= res!192443 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15772 lt!163663)))))

(declare-fun b!347649 () Bool)

(declare-fun e!213013 () Bool)

(assert (=> b!347649 (= e!213011 (not e!213013))))

(declare-fun res!192437 () Bool)

(assert (=> b!347649 (=> res!192437 e!213013)))

(assert (=> b!347649 (= res!192437 (or (bvslt (index!15772 lt!163663) #b00000000000000000000000000000000) (bvsge (index!15772 lt!163663) (size!9161 _keys!1895))))))

(assert (=> b!347649 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10791 0))(
  ( (Unit!10792) )
))
(declare-fun lt!163662 () Unit!10791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18599 (_ BitVec 64) (_ BitVec 32)) Unit!10791)

(assert (=> b!347649 (= lt!163662 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15772 lt!163663)))))

(declare-fun b!347650 () Bool)

(declare-fun e!213014 () Bool)

(declare-fun e!213012 () Bool)

(declare-fun mapRes!12714 () Bool)

(assert (=> b!347650 (= e!213014 (and e!213012 mapRes!12714))))

(declare-fun condMapEmpty!12714 () Bool)

(declare-fun mapDefault!12714 () ValueCell!3408)

(assert (=> b!347650 (= condMapEmpty!12714 (= (arr!8808 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3408)) mapDefault!12714)))))

(declare-fun mapNonEmpty!12714 () Bool)

(declare-fun tp!26219 () Bool)

(declare-fun e!213016 () Bool)

(assert (=> mapNonEmpty!12714 (= mapRes!12714 (and tp!26219 e!213016))))

(declare-fun mapValue!12714 () ValueCell!3408)

(declare-fun mapKey!12714 () (_ BitVec 32))

(declare-fun mapRest!12714 () (Array (_ BitVec 32) ValueCell!3408))

(assert (=> mapNonEmpty!12714 (= (arr!8808 _values!1525) (store mapRest!12714 mapKey!12714 mapValue!12714))))

(declare-fun b!347651 () Bool)

(declare-fun tp_is_empty!7503 () Bool)

(assert (=> b!347651 (= e!213016 tp_is_empty!7503)))

(declare-fun b!347652 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347652 (= e!213013 (validKeyInArray!0 (select (arr!8809 _keys!1895) (index!15772 lt!163663))))))

(declare-fun b!347653 () Bool)

(assert (=> b!347653 (= e!213017 e!213011)))

(declare-fun res!192445 () Bool)

(assert (=> b!347653 (=> (not res!192445) (not e!213011))))

(get-info :version)

(assert (=> b!347653 (= res!192445 (and ((_ is Found!3398) lt!163663) (= (select (arr!8809 _keys!1895) (index!15772 lt!163663)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18599 (_ BitVec 32)) SeekEntryResult!3398)

(assert (=> b!347653 (= lt!163663 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!192442 () Bool)

(assert (=> start!34766 (=> (not res!192442) (not e!213017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34766 (= res!192442 (validMask!0 mask!2385))))

(assert (=> start!34766 e!213017))

(assert (=> start!34766 true))

(assert (=> start!34766 tp_is_empty!7503))

(assert (=> start!34766 tp!26220))

(declare-fun array_inv!6522 (array!18597) Bool)

(assert (=> start!34766 (and (array_inv!6522 _values!1525) e!213014)))

(declare-fun array_inv!6523 (array!18599) Bool)

(assert (=> start!34766 (array_inv!6523 _keys!1895)))

(declare-fun b!347654 () Bool)

(declare-fun res!192438 () Bool)

(assert (=> b!347654 (=> (not res!192438) (not e!213017))))

(declare-fun zeroValue!1467 () V!10981)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10981)

(declare-datatypes ((tuple2!5492 0))(
  ( (tuple2!5493 (_1!2757 (_ BitVec 64)) (_2!2757 V!10981)) )
))
(declare-datatypes ((List!5115 0))(
  ( (Nil!5112) (Cons!5111 (h!5967 tuple2!5492) (t!10245 List!5115)) )
))
(declare-datatypes ((ListLongMap!4405 0))(
  ( (ListLongMap!4406 (toList!2218 List!5115)) )
))
(declare-fun contains!2283 (ListLongMap!4405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1739 (array!18599 array!18597 (_ BitVec 32) (_ BitVec 32) V!10981 V!10981 (_ BitVec 32) Int) ListLongMap!4405)

(assert (=> b!347654 (= res!192438 (not (contains!2283 (getCurrentListMap!1739 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347655 () Bool)

(assert (=> b!347655 (= e!213012 tp_is_empty!7503)))

(declare-fun mapIsEmpty!12714 () Bool)

(assert (=> mapIsEmpty!12714 mapRes!12714))

(declare-fun b!347656 () Bool)

(declare-fun res!192441 () Bool)

(assert (=> b!347656 (=> (not res!192441) (not e!213017))))

(assert (=> b!347656 (= res!192441 (validKeyInArray!0 k0!1348))))

(declare-fun b!347657 () Bool)

(declare-fun res!192440 () Bool)

(assert (=> b!347657 (=> (not res!192440) (not e!213017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18599 (_ BitVec 32)) Bool)

(assert (=> b!347657 (= res!192440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347658 () Bool)

(declare-fun res!192444 () Bool)

(assert (=> b!347658 (=> (not res!192444) (not e!213017))))

(declare-datatypes ((List!5116 0))(
  ( (Nil!5113) (Cons!5112 (h!5968 (_ BitVec 64)) (t!10246 List!5116)) )
))
(declare-fun arrayNoDuplicates!0 (array!18599 (_ BitVec 32) List!5116) Bool)

(assert (=> b!347658 (= res!192444 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5113))))

(assert (= (and start!34766 res!192442) b!347647))

(assert (= (and b!347647 res!192439) b!347657))

(assert (= (and b!347657 res!192440) b!347658))

(assert (= (and b!347658 res!192444) b!347656))

(assert (= (and b!347656 res!192441) b!347654))

(assert (= (and b!347654 res!192438) b!347653))

(assert (= (and b!347653 res!192445) b!347648))

(assert (= (and b!347648 res!192443) b!347649))

(assert (= (and b!347649 (not res!192437)) b!347652))

(assert (= (and b!347650 condMapEmpty!12714) mapIsEmpty!12714))

(assert (= (and b!347650 (not condMapEmpty!12714)) mapNonEmpty!12714))

(assert (= (and mapNonEmpty!12714 ((_ is ValueCellFull!3408) mapValue!12714)) b!347651))

(assert (= (and b!347650 ((_ is ValueCellFull!3408) mapDefault!12714)) b!347655))

(assert (= start!34766 b!347650))

(declare-fun m!348529 () Bool)

(assert (=> b!347649 m!348529))

(declare-fun m!348531 () Bool)

(assert (=> b!347649 m!348531))

(declare-fun m!348533 () Bool)

(assert (=> b!347652 m!348533))

(assert (=> b!347652 m!348533))

(declare-fun m!348535 () Bool)

(assert (=> b!347652 m!348535))

(declare-fun m!348537 () Bool)

(assert (=> start!34766 m!348537))

(declare-fun m!348539 () Bool)

(assert (=> start!34766 m!348539))

(declare-fun m!348541 () Bool)

(assert (=> start!34766 m!348541))

(assert (=> b!347653 m!348533))

(declare-fun m!348543 () Bool)

(assert (=> b!347653 m!348543))

(declare-fun m!348545 () Bool)

(assert (=> b!347657 m!348545))

(declare-fun m!348547 () Bool)

(assert (=> b!347648 m!348547))

(declare-fun m!348549 () Bool)

(assert (=> b!347658 m!348549))

(declare-fun m!348551 () Bool)

(assert (=> mapNonEmpty!12714 m!348551))

(declare-fun m!348553 () Bool)

(assert (=> b!347654 m!348553))

(assert (=> b!347654 m!348553))

(declare-fun m!348555 () Bool)

(assert (=> b!347654 m!348555))

(declare-fun m!348557 () Bool)

(assert (=> b!347656 m!348557))

(check-sat (not mapNonEmpty!12714) b_and!14773 (not b!347658) (not b!347652) tp_is_empty!7503 (not b_next!7551) (not b!347656) (not b!347653) (not b!347649) (not start!34766) (not b!347657) (not b!347648) (not b!347654))
(check-sat b_and!14773 (not b_next!7551))
