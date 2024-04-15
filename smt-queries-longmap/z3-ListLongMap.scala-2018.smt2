; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35170 () Bool)

(assert start!35170)

(declare-fun b_free!7777 () Bool)

(declare-fun b_next!7777 () Bool)

(assert (=> start!35170 (= b_free!7777 (not b_next!7777))))

(declare-fun tp!26922 () Bool)

(declare-fun b_and!14989 () Bool)

(assert (=> start!35170 (= tp!26922 b_and!14989)))

(declare-fun b!352424 () Bool)

(declare-fun e!215804 () Bool)

(declare-fun tp_is_empty!7729 () Bool)

(assert (=> b!352424 (= e!215804 tp_is_empty!7729)))

(declare-fun b!352425 () Bool)

(declare-fun e!215806 () Bool)

(assert (=> b!352425 (= e!215806 false)))

(declare-datatypes ((SeekEntryResult!3471 0))(
  ( (MissingZero!3471 (index!16063 (_ BitVec 32))) (Found!3471 (index!16064 (_ BitVec 32))) (Intermediate!3471 (undefined!4283 Bool) (index!16065 (_ BitVec 32)) (x!35082 (_ BitVec 32))) (Undefined!3471) (MissingVacant!3471 (index!16066 (_ BitVec 32))) )
))
(declare-fun lt!165096 () SeekEntryResult!3471)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!19027 0))(
  ( (array!19028 (arr!9015 (Array (_ BitVec 32) (_ BitVec 64))) (size!9368 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19027)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19027 (_ BitVec 32)) SeekEntryResult!3471)

(assert (=> b!352425 (= lt!165096 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352426 () Bool)

(declare-fun res!195444 () Bool)

(assert (=> b!352426 (=> (not res!195444) (not e!215806))))

(declare-datatypes ((V!11283 0))(
  ( (V!11284 (val!3909 Int)) )
))
(declare-fun zeroValue!1467 () V!11283)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3521 0))(
  ( (ValueCellFull!3521 (v!6094 V!11283)) (EmptyCell!3521) )
))
(declare-datatypes ((array!19029 0))(
  ( (array!19030 (arr!9016 (Array (_ BitVec 32) ValueCell!3521)) (size!9369 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19029)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11283)

(declare-datatypes ((tuple2!5610 0))(
  ( (tuple2!5611 (_1!2816 (_ BitVec 64)) (_2!2816 V!11283)) )
))
(declare-datatypes ((List!5225 0))(
  ( (Nil!5222) (Cons!5221 (h!6077 tuple2!5610) (t!10362 List!5225)) )
))
(declare-datatypes ((ListLongMap!4513 0))(
  ( (ListLongMap!4514 (toList!2272 List!5225)) )
))
(declare-fun contains!2356 (ListLongMap!4513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1777 (array!19027 array!19029 (_ BitVec 32) (_ BitVec 32) V!11283 V!11283 (_ BitVec 32) Int) ListLongMap!4513)

(assert (=> b!352426 (= res!195444 (not (contains!2356 (getCurrentListMap!1777 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!13077 () Bool)

(declare-fun mapRes!13077 () Bool)

(declare-fun tp!26921 () Bool)

(assert (=> mapNonEmpty!13077 (= mapRes!13077 (and tp!26921 e!215804))))

(declare-fun mapKey!13077 () (_ BitVec 32))

(declare-fun mapValue!13077 () ValueCell!3521)

(declare-fun mapRest!13077 () (Array (_ BitVec 32) ValueCell!3521))

(assert (=> mapNonEmpty!13077 (= (arr!9016 _values!1525) (store mapRest!13077 mapKey!13077 mapValue!13077))))

(declare-fun b!352427 () Bool)

(declare-fun res!195446 () Bool)

(assert (=> b!352427 (=> (not res!195446) (not e!215806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19027 (_ BitVec 32)) Bool)

(assert (=> b!352427 (= res!195446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!13077 () Bool)

(assert (=> mapIsEmpty!13077 mapRes!13077))

(declare-fun b!352428 () Bool)

(declare-fun res!195445 () Bool)

(assert (=> b!352428 (=> (not res!195445) (not e!215806))))

(assert (=> b!352428 (= res!195445 (and (= (size!9369 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9368 _keys!1895) (size!9369 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352429 () Bool)

(declare-fun e!215802 () Bool)

(assert (=> b!352429 (= e!215802 tp_is_empty!7729)))

(declare-fun b!352430 () Bool)

(declare-fun res!195443 () Bool)

(assert (=> b!352430 (=> (not res!195443) (not e!215806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352430 (= res!195443 (validKeyInArray!0 k0!1348))))

(declare-fun res!195442 () Bool)

(assert (=> start!35170 (=> (not res!195442) (not e!215806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35170 (= res!195442 (validMask!0 mask!2385))))

(assert (=> start!35170 e!215806))

(assert (=> start!35170 true))

(assert (=> start!35170 tp_is_empty!7729))

(assert (=> start!35170 tp!26922))

(declare-fun e!215805 () Bool)

(declare-fun array_inv!6676 (array!19029) Bool)

(assert (=> start!35170 (and (array_inv!6676 _values!1525) e!215805)))

(declare-fun array_inv!6677 (array!19027) Bool)

(assert (=> start!35170 (array_inv!6677 _keys!1895)))

(declare-fun b!352431 () Bool)

(declare-fun res!195441 () Bool)

(assert (=> b!352431 (=> (not res!195441) (not e!215806))))

(declare-datatypes ((List!5226 0))(
  ( (Nil!5223) (Cons!5222 (h!6078 (_ BitVec 64)) (t!10363 List!5226)) )
))
(declare-fun arrayNoDuplicates!0 (array!19027 (_ BitVec 32) List!5226) Bool)

(assert (=> b!352431 (= res!195441 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5223))))

(declare-fun b!352432 () Bool)

(assert (=> b!352432 (= e!215805 (and e!215802 mapRes!13077))))

(declare-fun condMapEmpty!13077 () Bool)

(declare-fun mapDefault!13077 () ValueCell!3521)

(assert (=> b!352432 (= condMapEmpty!13077 (= (arr!9016 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3521)) mapDefault!13077)))))

(assert (= (and start!35170 res!195442) b!352428))

(assert (= (and b!352428 res!195445) b!352427))

(assert (= (and b!352427 res!195446) b!352431))

(assert (= (and b!352431 res!195441) b!352430))

(assert (= (and b!352430 res!195443) b!352426))

(assert (= (and b!352426 res!195444) b!352425))

(assert (= (and b!352432 condMapEmpty!13077) mapIsEmpty!13077))

(assert (= (and b!352432 (not condMapEmpty!13077)) mapNonEmpty!13077))

(get-info :version)

(assert (= (and mapNonEmpty!13077 ((_ is ValueCellFull!3521) mapValue!13077)) b!352424))

(assert (= (and b!352432 ((_ is ValueCellFull!3521) mapDefault!13077)) b!352429))

(assert (= start!35170 b!352432))

(declare-fun m!351537 () Bool)

(assert (=> mapNonEmpty!13077 m!351537))

(declare-fun m!351539 () Bool)

(assert (=> b!352430 m!351539))

(declare-fun m!351541 () Bool)

(assert (=> b!352431 m!351541))

(declare-fun m!351543 () Bool)

(assert (=> b!352427 m!351543))

(declare-fun m!351545 () Bool)

(assert (=> start!35170 m!351545))

(declare-fun m!351547 () Bool)

(assert (=> start!35170 m!351547))

(declare-fun m!351549 () Bool)

(assert (=> start!35170 m!351549))

(declare-fun m!351551 () Bool)

(assert (=> b!352426 m!351551))

(assert (=> b!352426 m!351551))

(declare-fun m!351553 () Bool)

(assert (=> b!352426 m!351553))

(declare-fun m!351555 () Bool)

(assert (=> b!352425 m!351555))

(check-sat (not b!352431) (not b!352425) (not b!352430) b_and!14989 (not b!352426) (not b_next!7777) (not start!35170) tp_is_empty!7729 (not b!352427) (not mapNonEmpty!13077))
(check-sat b_and!14989 (not b_next!7777))
