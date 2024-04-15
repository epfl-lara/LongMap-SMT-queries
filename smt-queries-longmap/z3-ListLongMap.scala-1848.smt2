; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33442 () Bool)

(assert start!33442)

(declare-fun b!331816 () Bool)

(declare-fun e!203676 () Bool)

(assert (=> b!331816 (= e!203676 false)))

(declare-fun lt!158724 () Bool)

(declare-datatypes ((array!17003 0))(
  ( (array!17004 (arr!8036 (Array (_ BitVec 32) (_ BitVec 64))) (size!8389 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17003)

(declare-datatypes ((List!4548 0))(
  ( (Nil!4545) (Cons!4544 (h!5400 (_ BitVec 64)) (t!9621 List!4548)) )
))
(declare-fun arrayNoDuplicates!0 (array!17003 (_ BitVec 32) List!4548) Bool)

(assert (=> b!331816 (= lt!158724 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4545))))

(declare-fun b!331817 () Bool)

(declare-fun res!182831 () Bool)

(assert (=> b!331817 (=> (not res!182831) (not e!203676))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17003 (_ BitVec 32)) Bool)

(assert (=> b!331817 (= res!182831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331818 () Bool)

(declare-fun e!203677 () Bool)

(declare-fun tp_is_empty!6709 () Bool)

(assert (=> b!331818 (= e!203677 tp_is_empty!6709)))

(declare-fun mapIsEmpty!11448 () Bool)

(declare-fun mapRes!11448 () Bool)

(assert (=> mapIsEmpty!11448 mapRes!11448))

(declare-fun mapNonEmpty!11448 () Bool)

(declare-fun tp!23823 () Bool)

(assert (=> mapNonEmpty!11448 (= mapRes!11448 (and tp!23823 e!203677))))

(declare-datatypes ((V!9923 0))(
  ( (V!9924 (val!3399 Int)) )
))
(declare-datatypes ((ValueCell!3011 0))(
  ( (ValueCellFull!3011 (v!5552 V!9923)) (EmptyCell!3011) )
))
(declare-fun mapRest!11448 () (Array (_ BitVec 32) ValueCell!3011))

(declare-datatypes ((array!17005 0))(
  ( (array!17006 (arr!8037 (Array (_ BitVec 32) ValueCell!3011)) (size!8390 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17005)

(declare-fun mapKey!11448 () (_ BitVec 32))

(declare-fun mapValue!11448 () ValueCell!3011)

(assert (=> mapNonEmpty!11448 (= (arr!8037 _values!1525) (store mapRest!11448 mapKey!11448 mapValue!11448))))

(declare-fun res!182829 () Bool)

(assert (=> start!33442 (=> (not res!182829) (not e!203676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33442 (= res!182829 (validMask!0 mask!2385))))

(assert (=> start!33442 e!203676))

(assert (=> start!33442 true))

(declare-fun e!203680 () Bool)

(declare-fun array_inv!6000 (array!17005) Bool)

(assert (=> start!33442 (and (array_inv!6000 _values!1525) e!203680)))

(declare-fun array_inv!6001 (array!17003) Bool)

(assert (=> start!33442 (array_inv!6001 _keys!1895)))

(declare-fun b!331819 () Bool)

(declare-fun e!203678 () Bool)

(assert (=> b!331819 (= e!203680 (and e!203678 mapRes!11448))))

(declare-fun condMapEmpty!11448 () Bool)

(declare-fun mapDefault!11448 () ValueCell!3011)

(assert (=> b!331819 (= condMapEmpty!11448 (= (arr!8037 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3011)) mapDefault!11448)))))

(declare-fun b!331820 () Bool)

(assert (=> b!331820 (= e!203678 tp_is_empty!6709)))

(declare-fun b!331821 () Bool)

(declare-fun res!182830 () Bool)

(assert (=> b!331821 (=> (not res!182830) (not e!203676))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331821 (= res!182830 (and (= (size!8390 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8389 _keys!1895) (size!8390 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!33442 res!182829) b!331821))

(assert (= (and b!331821 res!182830) b!331817))

(assert (= (and b!331817 res!182831) b!331816))

(assert (= (and b!331819 condMapEmpty!11448) mapIsEmpty!11448))

(assert (= (and b!331819 (not condMapEmpty!11448)) mapNonEmpty!11448))

(get-info :version)

(assert (= (and mapNonEmpty!11448 ((_ is ValueCellFull!3011) mapValue!11448)) b!331818))

(assert (= (and b!331819 ((_ is ValueCellFull!3011) mapDefault!11448)) b!331820))

(assert (= start!33442 b!331819))

(declare-fun m!335999 () Bool)

(assert (=> b!331816 m!335999))

(declare-fun m!336001 () Bool)

(assert (=> b!331817 m!336001))

(declare-fun m!336003 () Bool)

(assert (=> mapNonEmpty!11448 m!336003))

(declare-fun m!336005 () Bool)

(assert (=> start!33442 m!336005))

(declare-fun m!336007 () Bool)

(assert (=> start!33442 m!336007))

(declare-fun m!336009 () Bool)

(assert (=> start!33442 m!336009))

(check-sat (not b!331816) (not b!331817) tp_is_empty!6709 (not start!33442) (not mapNonEmpty!11448))
(check-sat)
