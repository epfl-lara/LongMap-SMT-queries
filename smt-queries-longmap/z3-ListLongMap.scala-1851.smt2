; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33460 () Bool)

(assert start!33460)

(declare-fun res!182912 () Bool)

(declare-fun e!203811 () Bool)

(assert (=> start!33460 (=> (not res!182912) (not e!203811))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33460 (= res!182912 (validMask!0 mask!2385))))

(assert (=> start!33460 e!203811))

(assert (=> start!33460 true))

(declare-datatypes ((V!9947 0))(
  ( (V!9948 (val!3408 Int)) )
))
(declare-datatypes ((ValueCell!3020 0))(
  ( (ValueCellFull!3020 (v!5561 V!9947)) (EmptyCell!3020) )
))
(declare-datatypes ((array!17035 0))(
  ( (array!17036 (arr!8052 (Array (_ BitVec 32) ValueCell!3020)) (size!8405 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17035)

(declare-fun e!203813 () Bool)

(declare-fun array_inv!6010 (array!17035) Bool)

(assert (=> start!33460 (and (array_inv!6010 _values!1525) e!203813)))

(declare-datatypes ((array!17037 0))(
  ( (array!17038 (arr!8053 (Array (_ BitVec 32) (_ BitVec 64))) (size!8406 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17037)

(declare-fun array_inv!6011 (array!17037) Bool)

(assert (=> start!33460 (array_inv!6011 _keys!1895)))

(declare-fun mapIsEmpty!11475 () Bool)

(declare-fun mapRes!11475 () Bool)

(assert (=> mapIsEmpty!11475 mapRes!11475))

(declare-fun b!331978 () Bool)

(declare-fun e!203814 () Bool)

(declare-fun tp_is_empty!6727 () Bool)

(assert (=> b!331978 (= e!203814 tp_is_empty!6727)))

(declare-fun mapNonEmpty!11475 () Bool)

(declare-fun tp!23850 () Bool)

(declare-fun e!203815 () Bool)

(assert (=> mapNonEmpty!11475 (= mapRes!11475 (and tp!23850 e!203815))))

(declare-fun mapValue!11475 () ValueCell!3020)

(declare-fun mapRest!11475 () (Array (_ BitVec 32) ValueCell!3020))

(declare-fun mapKey!11475 () (_ BitVec 32))

(assert (=> mapNonEmpty!11475 (= (arr!8052 _values!1525) (store mapRest!11475 mapKey!11475 mapValue!11475))))

(declare-fun b!331979 () Bool)

(declare-fun res!182911 () Bool)

(assert (=> b!331979 (=> (not res!182911) (not e!203811))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331979 (= res!182911 (and (= (size!8405 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8406 _keys!1895) (size!8405 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331980 () Bool)

(assert (=> b!331980 (= e!203811 false)))

(declare-fun lt!158751 () Bool)

(declare-datatypes ((List!4554 0))(
  ( (Nil!4551) (Cons!4550 (h!5406 (_ BitVec 64)) (t!9627 List!4554)) )
))
(declare-fun arrayNoDuplicates!0 (array!17037 (_ BitVec 32) List!4554) Bool)

(assert (=> b!331980 (= lt!158751 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4551))))

(declare-fun b!331981 () Bool)

(assert (=> b!331981 (= e!203815 tp_is_empty!6727)))

(declare-fun b!331982 () Bool)

(declare-fun res!182910 () Bool)

(assert (=> b!331982 (=> (not res!182910) (not e!203811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17037 (_ BitVec 32)) Bool)

(assert (=> b!331982 (= res!182910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331983 () Bool)

(assert (=> b!331983 (= e!203813 (and e!203814 mapRes!11475))))

(declare-fun condMapEmpty!11475 () Bool)

(declare-fun mapDefault!11475 () ValueCell!3020)

(assert (=> b!331983 (= condMapEmpty!11475 (= (arr!8052 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3020)) mapDefault!11475)))))

(assert (= (and start!33460 res!182912) b!331979))

(assert (= (and b!331979 res!182911) b!331982))

(assert (= (and b!331982 res!182910) b!331980))

(assert (= (and b!331983 condMapEmpty!11475) mapIsEmpty!11475))

(assert (= (and b!331983 (not condMapEmpty!11475)) mapNonEmpty!11475))

(get-info :version)

(assert (= (and mapNonEmpty!11475 ((_ is ValueCellFull!3020) mapValue!11475)) b!331981))

(assert (= (and b!331983 ((_ is ValueCellFull!3020) mapDefault!11475)) b!331978))

(assert (= start!33460 b!331983))

(declare-fun m!336107 () Bool)

(assert (=> start!33460 m!336107))

(declare-fun m!336109 () Bool)

(assert (=> start!33460 m!336109))

(declare-fun m!336111 () Bool)

(assert (=> start!33460 m!336111))

(declare-fun m!336113 () Bool)

(assert (=> mapNonEmpty!11475 m!336113))

(declare-fun m!336115 () Bool)

(assert (=> b!331980 m!336115))

(declare-fun m!336117 () Bool)

(assert (=> b!331982 m!336117))

(check-sat (not start!33460) (not b!331982) (not b!331980) tp_is_empty!6727 (not mapNonEmpty!11475))
(check-sat)
