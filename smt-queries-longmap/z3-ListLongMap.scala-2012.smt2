; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35082 () Bool)

(assert start!35082)

(declare-fun b_free!7741 () Bool)

(declare-fun b_next!7741 () Bool)

(assert (=> start!35082 (= b_free!7741 (not b_next!7741))))

(declare-fun tp!26807 () Bool)

(declare-fun b_and!14989 () Bool)

(assert (=> start!35082 (= tp!26807 b_and!14989)))

(declare-fun b!351706 () Bool)

(declare-fun res!195060 () Bool)

(declare-fun e!215382 () Bool)

(assert (=> b!351706 (=> (not res!195060) (not e!215382))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351706 (= res!195060 (validKeyInArray!0 k0!1348))))

(declare-fun b!351707 () Bool)

(declare-fun res!195061 () Bool)

(assert (=> b!351707 (=> (not res!195061) (not e!215382))))

(declare-datatypes ((array!18964 0))(
  ( (array!18965 (arr!8985 (Array (_ BitVec 32) (_ BitVec 64))) (size!9337 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18964)

(declare-datatypes ((List!5134 0))(
  ( (Nil!5131) (Cons!5130 (h!5986 (_ BitVec 64)) (t!10268 List!5134)) )
))
(declare-fun arrayNoDuplicates!0 (array!18964 (_ BitVec 32) List!5134) Bool)

(assert (=> b!351707 (= res!195061 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5131))))

(declare-fun b!351708 () Bool)

(declare-fun res!195055 () Bool)

(assert (=> b!351708 (=> (not res!195055) (not e!215382))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18964 (_ BitVec 32)) Bool)

(assert (=> b!351708 (= res!195055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351709 () Bool)

(declare-fun e!215384 () Bool)

(assert (=> b!351709 (= e!215382 e!215384)))

(declare-fun res!195056 () Bool)

(assert (=> b!351709 (=> (not res!195056) (not e!215384))))

(declare-datatypes ((SeekEntryResult!3412 0))(
  ( (MissingZero!3412 (index!15827 (_ BitVec 32))) (Found!3412 (index!15828 (_ BitVec 32))) (Intermediate!3412 (undefined!4224 Bool) (index!15829 (_ BitVec 32)) (x!34957 (_ BitVec 32))) (Undefined!3412) (MissingVacant!3412 (index!15830 (_ BitVec 32))) )
))
(declare-fun lt!164986 () SeekEntryResult!3412)

(get-info :version)

(assert (=> b!351709 (= res!195056 (and (not ((_ is Found!3412) lt!164986)) (not ((_ is MissingZero!3412) lt!164986)) ((_ is MissingVacant!3412) lt!164986)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18964 (_ BitVec 32)) SeekEntryResult!3412)

(assert (=> b!351709 (= lt!164986 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351710 () Bool)

(assert (=> b!351710 (= e!215384 (not true))))

(assert (=> b!351710 false))

(declare-datatypes ((V!11235 0))(
  ( (V!11236 (val!3891 Int)) )
))
(declare-fun zeroValue!1467 () V!11235)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3503 0))(
  ( (ValueCellFull!3503 (v!6081 V!11235)) (EmptyCell!3503) )
))
(declare-datatypes ((array!18966 0))(
  ( (array!18967 (arr!8986 (Array (_ BitVec 32) ValueCell!3503)) (size!9338 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18966)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((Unit!10838 0))(
  ( (Unit!10839) )
))
(declare-fun lt!164985 () Unit!10838)

(declare-fun minValue!1467 () V!11235)

(declare-fun lemmaArrayContainsKeyThenInListMap!334 (array!18964 array!18966 (_ BitVec 32) (_ BitVec 32) V!11235 V!11235 (_ BitVec 64) (_ BitVec 32) Int) Unit!10838)

(declare-fun arrayScanForKey!0 (array!18964 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351710 (= lt!164985 (lemmaArrayContainsKeyThenInListMap!334 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(declare-fun mapIsEmpty!13017 () Bool)

(declare-fun mapRes!13017 () Bool)

(assert (=> mapIsEmpty!13017 mapRes!13017))

(declare-fun b!351711 () Bool)

(declare-fun e!215383 () Bool)

(declare-fun tp_is_empty!7693 () Bool)

(assert (=> b!351711 (= e!215383 tp_is_empty!7693)))

(declare-fun b!351712 () Bool)

(declare-fun res!195062 () Bool)

(assert (=> b!351712 (=> (not res!195062) (not e!215384))))

(declare-fun arrayContainsKey!0 (array!18964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351712 (= res!195062 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351713 () Bool)

(declare-fun res!195058 () Bool)

(assert (=> b!351713 (=> (not res!195058) (not e!215382))))

(declare-datatypes ((tuple2!5530 0))(
  ( (tuple2!5531 (_1!2776 (_ BitVec 64)) (_2!2776 V!11235)) )
))
(declare-datatypes ((List!5135 0))(
  ( (Nil!5132) (Cons!5131 (h!5987 tuple2!5530) (t!10269 List!5135)) )
))
(declare-datatypes ((ListLongMap!4445 0))(
  ( (ListLongMap!4446 (toList!2238 List!5135)) )
))
(declare-fun contains!2328 (ListLongMap!4445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1766 (array!18964 array!18966 (_ BitVec 32) (_ BitVec 32) V!11235 V!11235 (_ BitVec 32) Int) ListLongMap!4445)

(assert (=> b!351713 (= res!195058 (not (contains!2328 (getCurrentListMap!1766 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351714 () Bool)

(declare-fun res!195057 () Bool)

(assert (=> b!351714 (=> (not res!195057) (not e!215382))))

(assert (=> b!351714 (= res!195057 (and (= (size!9338 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9337 _keys!1895) (size!9338 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351715 () Bool)

(declare-fun e!215381 () Bool)

(assert (=> b!351715 (= e!215381 tp_is_empty!7693)))

(declare-fun b!351716 () Bool)

(declare-fun e!215379 () Bool)

(assert (=> b!351716 (= e!215379 (and e!215381 mapRes!13017))))

(declare-fun condMapEmpty!13017 () Bool)

(declare-fun mapDefault!13017 () ValueCell!3503)

(assert (=> b!351716 (= condMapEmpty!13017 (= (arr!8986 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3503)) mapDefault!13017)))))

(declare-fun res!195059 () Bool)

(assert (=> start!35082 (=> (not res!195059) (not e!215382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35082 (= res!195059 (validMask!0 mask!2385))))

(assert (=> start!35082 e!215382))

(assert (=> start!35082 true))

(assert (=> start!35082 tp_is_empty!7693))

(assert (=> start!35082 tp!26807))

(declare-fun array_inv!6638 (array!18966) Bool)

(assert (=> start!35082 (and (array_inv!6638 _values!1525) e!215379)))

(declare-fun array_inv!6639 (array!18964) Bool)

(assert (=> start!35082 (array_inv!6639 _keys!1895)))

(declare-fun mapNonEmpty!13017 () Bool)

(declare-fun tp!26808 () Bool)

(assert (=> mapNonEmpty!13017 (= mapRes!13017 (and tp!26808 e!215383))))

(declare-fun mapValue!13017 () ValueCell!3503)

(declare-fun mapRest!13017 () (Array (_ BitVec 32) ValueCell!3503))

(declare-fun mapKey!13017 () (_ BitVec 32))

(assert (=> mapNonEmpty!13017 (= (arr!8986 _values!1525) (store mapRest!13017 mapKey!13017 mapValue!13017))))

(assert (= (and start!35082 res!195059) b!351714))

(assert (= (and b!351714 res!195057) b!351708))

(assert (= (and b!351708 res!195055) b!351707))

(assert (= (and b!351707 res!195061) b!351706))

(assert (= (and b!351706 res!195060) b!351713))

(assert (= (and b!351713 res!195058) b!351709))

(assert (= (and b!351709 res!195056) b!351712))

(assert (= (and b!351712 res!195062) b!351710))

(assert (= (and b!351716 condMapEmpty!13017) mapIsEmpty!13017))

(assert (= (and b!351716 (not condMapEmpty!13017)) mapNonEmpty!13017))

(assert (= (and mapNonEmpty!13017 ((_ is ValueCellFull!3503) mapValue!13017)) b!351711))

(assert (= (and b!351716 ((_ is ValueCellFull!3503) mapDefault!13017)) b!351715))

(assert (= start!35082 b!351716))

(declare-fun m!351819 () Bool)

(assert (=> b!351713 m!351819))

(assert (=> b!351713 m!351819))

(declare-fun m!351821 () Bool)

(assert (=> b!351713 m!351821))

(declare-fun m!351823 () Bool)

(assert (=> start!35082 m!351823))

(declare-fun m!351825 () Bool)

(assert (=> start!35082 m!351825))

(declare-fun m!351827 () Bool)

(assert (=> start!35082 m!351827))

(declare-fun m!351829 () Bool)

(assert (=> b!351708 m!351829))

(declare-fun m!351831 () Bool)

(assert (=> mapNonEmpty!13017 m!351831))

(declare-fun m!351833 () Bool)

(assert (=> b!351709 m!351833))

(declare-fun m!351835 () Bool)

(assert (=> b!351706 m!351835))

(declare-fun m!351837 () Bool)

(assert (=> b!351712 m!351837))

(declare-fun m!351839 () Bool)

(assert (=> b!351707 m!351839))

(declare-fun m!351841 () Bool)

(assert (=> b!351710 m!351841))

(assert (=> b!351710 m!351841))

(declare-fun m!351843 () Bool)

(assert (=> b!351710 m!351843))

(check-sat (not start!35082) (not b!351712) (not b!351708) b_and!14989 tp_is_empty!7693 (not b!351706) (not mapNonEmpty!13017) (not b!351709) (not b!351710) (not b!351707) (not b!351713) (not b_next!7741))
(check-sat b_and!14989 (not b_next!7741))
