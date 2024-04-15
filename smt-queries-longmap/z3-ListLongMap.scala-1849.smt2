; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33448 () Bool)

(assert start!33448)

(declare-fun b!331870 () Bool)

(declare-fun e!203723 () Bool)

(declare-fun tp_is_empty!6715 () Bool)

(assert (=> b!331870 (= e!203723 tp_is_empty!6715)))

(declare-fun mapIsEmpty!11457 () Bool)

(declare-fun mapRes!11457 () Bool)

(assert (=> mapIsEmpty!11457 mapRes!11457))

(declare-fun b!331871 () Bool)

(declare-fun res!182858 () Bool)

(declare-fun e!203722 () Bool)

(assert (=> b!331871 (=> (not res!182858) (not e!203722))))

(declare-datatypes ((array!17013 0))(
  ( (array!17014 (arr!8041 (Array (_ BitVec 32) (_ BitVec 64))) (size!8394 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17013)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17013 (_ BitVec 32)) Bool)

(assert (=> b!331871 (= res!182858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331872 () Bool)

(assert (=> b!331872 (= e!203722 false)))

(declare-fun lt!158733 () Bool)

(declare-datatypes ((List!4550 0))(
  ( (Nil!4547) (Cons!4546 (h!5402 (_ BitVec 64)) (t!9623 List!4550)) )
))
(declare-fun arrayNoDuplicates!0 (array!17013 (_ BitVec 32) List!4550) Bool)

(assert (=> b!331872 (= lt!158733 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4547))))

(declare-fun res!182857 () Bool)

(assert (=> start!33448 (=> (not res!182857) (not e!203722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33448 (= res!182857 (validMask!0 mask!2385))))

(assert (=> start!33448 e!203722))

(assert (=> start!33448 true))

(declare-datatypes ((V!9931 0))(
  ( (V!9932 (val!3402 Int)) )
))
(declare-datatypes ((ValueCell!3014 0))(
  ( (ValueCellFull!3014 (v!5555 V!9931)) (EmptyCell!3014) )
))
(declare-datatypes ((array!17015 0))(
  ( (array!17016 (arr!8042 (Array (_ BitVec 32) ValueCell!3014)) (size!8395 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17015)

(declare-fun e!203725 () Bool)

(declare-fun array_inv!6004 (array!17015) Bool)

(assert (=> start!33448 (and (array_inv!6004 _values!1525) e!203725)))

(declare-fun array_inv!6005 (array!17013) Bool)

(assert (=> start!33448 (array_inv!6005 _keys!1895)))

(declare-fun mapNonEmpty!11457 () Bool)

(declare-fun tp!23832 () Bool)

(assert (=> mapNonEmpty!11457 (= mapRes!11457 (and tp!23832 e!203723))))

(declare-fun mapValue!11457 () ValueCell!3014)

(declare-fun mapRest!11457 () (Array (_ BitVec 32) ValueCell!3014))

(declare-fun mapKey!11457 () (_ BitVec 32))

(assert (=> mapNonEmpty!11457 (= (arr!8042 _values!1525) (store mapRest!11457 mapKey!11457 mapValue!11457))))

(declare-fun b!331873 () Bool)

(declare-fun e!203721 () Bool)

(assert (=> b!331873 (= e!203721 tp_is_empty!6715)))

(declare-fun b!331874 () Bool)

(declare-fun res!182856 () Bool)

(assert (=> b!331874 (=> (not res!182856) (not e!203722))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331874 (= res!182856 (and (= (size!8395 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8394 _keys!1895) (size!8395 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331875 () Bool)

(assert (=> b!331875 (= e!203725 (and e!203721 mapRes!11457))))

(declare-fun condMapEmpty!11457 () Bool)

(declare-fun mapDefault!11457 () ValueCell!3014)

(assert (=> b!331875 (= condMapEmpty!11457 (= (arr!8042 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3014)) mapDefault!11457)))))

(assert (= (and start!33448 res!182857) b!331874))

(assert (= (and b!331874 res!182856) b!331871))

(assert (= (and b!331871 res!182858) b!331872))

(assert (= (and b!331875 condMapEmpty!11457) mapIsEmpty!11457))

(assert (= (and b!331875 (not condMapEmpty!11457)) mapNonEmpty!11457))

(get-info :version)

(assert (= (and mapNonEmpty!11457 ((_ is ValueCellFull!3014) mapValue!11457)) b!331870))

(assert (= (and b!331875 ((_ is ValueCellFull!3014) mapDefault!11457)) b!331873))

(assert (= start!33448 b!331875))

(declare-fun m!336035 () Bool)

(assert (=> b!331871 m!336035))

(declare-fun m!336037 () Bool)

(assert (=> b!331872 m!336037))

(declare-fun m!336039 () Bool)

(assert (=> start!33448 m!336039))

(declare-fun m!336041 () Bool)

(assert (=> start!33448 m!336041))

(declare-fun m!336043 () Bool)

(assert (=> start!33448 m!336043))

(declare-fun m!336045 () Bool)

(assert (=> mapNonEmpty!11457 m!336045))

(check-sat tp_is_empty!6715 (not mapNonEmpty!11457) (not b!331871) (not b!331872) (not start!33448))
(check-sat)
