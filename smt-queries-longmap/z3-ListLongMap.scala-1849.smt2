; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33448 () Bool)

(assert start!33448)

(declare-fun b!332092 () Bool)

(declare-fun e!203865 () Bool)

(declare-fun tp_is_empty!6715 () Bool)

(assert (=> b!332092 (= e!203865 tp_is_empty!6715)))

(declare-fun mapNonEmpty!11457 () Bool)

(declare-fun mapRes!11457 () Bool)

(declare-fun tp!23832 () Bool)

(declare-fun e!203866 () Bool)

(assert (=> mapNonEmpty!11457 (= mapRes!11457 (and tp!23832 e!203866))))

(declare-datatypes ((V!9931 0))(
  ( (V!9932 (val!3402 Int)) )
))
(declare-datatypes ((ValueCell!3014 0))(
  ( (ValueCellFull!3014 (v!5562 V!9931)) (EmptyCell!3014) )
))
(declare-fun mapRest!11457 () (Array (_ BitVec 32) ValueCell!3014))

(declare-datatypes ((array!17026 0))(
  ( (array!17027 (arr!8047 (Array (_ BitVec 32) ValueCell!3014)) (size!8399 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17026)

(declare-fun mapKey!11457 () (_ BitVec 32))

(declare-fun mapValue!11457 () ValueCell!3014)

(assert (=> mapNonEmpty!11457 (= (arr!8047 _values!1525) (store mapRest!11457 mapKey!11457 mapValue!11457))))

(declare-fun b!332093 () Bool)

(declare-fun e!203867 () Bool)

(assert (=> b!332093 (= e!203867 (and e!203865 mapRes!11457))))

(declare-fun condMapEmpty!11457 () Bool)

(declare-fun mapDefault!11457 () ValueCell!3014)

(assert (=> b!332093 (= condMapEmpty!11457 (= (arr!8047 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3014)) mapDefault!11457)))))

(declare-fun b!332094 () Bool)

(declare-fun res!182982 () Bool)

(declare-fun e!203863 () Bool)

(assert (=> b!332094 (=> (not res!182982) (not e!203863))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((array!17028 0))(
  ( (array!17029 (arr!8048 (Array (_ BitVec 32) (_ BitVec 64))) (size!8400 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17028)

(assert (=> b!332094 (= res!182982 (and (= (size!8399 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8400 _keys!1895) (size!8399 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!182984 () Bool)

(assert (=> start!33448 (=> (not res!182984) (not e!203863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33448 (= res!182984 (validMask!0 mask!2385))))

(assert (=> start!33448 e!203863))

(assert (=> start!33448 true))

(declare-fun array_inv!5984 (array!17026) Bool)

(assert (=> start!33448 (and (array_inv!5984 _values!1525) e!203867)))

(declare-fun array_inv!5985 (array!17028) Bool)

(assert (=> start!33448 (array_inv!5985 _keys!1895)))

(declare-fun b!332095 () Bool)

(declare-fun res!182983 () Bool)

(assert (=> b!332095 (=> (not res!182983) (not e!203863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17028 (_ BitVec 32)) Bool)

(assert (=> b!332095 (= res!182983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332096 () Bool)

(assert (=> b!332096 (= e!203863 false)))

(declare-fun lt!158986 () Bool)

(declare-datatypes ((List!4497 0))(
  ( (Nil!4494) (Cons!4493 (h!5349 (_ BitVec 64)) (t!9571 List!4497)) )
))
(declare-fun arrayNoDuplicates!0 (array!17028 (_ BitVec 32) List!4497) Bool)

(assert (=> b!332096 (= lt!158986 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4494))))

(declare-fun mapIsEmpty!11457 () Bool)

(assert (=> mapIsEmpty!11457 mapRes!11457))

(declare-fun b!332097 () Bool)

(assert (=> b!332097 (= e!203866 tp_is_empty!6715)))

(assert (= (and start!33448 res!182984) b!332094))

(assert (= (and b!332094 res!182982) b!332095))

(assert (= (and b!332095 res!182983) b!332096))

(assert (= (and b!332093 condMapEmpty!11457) mapIsEmpty!11457))

(assert (= (and b!332093 (not condMapEmpty!11457)) mapNonEmpty!11457))

(get-info :version)

(assert (= (and mapNonEmpty!11457 ((_ is ValueCellFull!3014) mapValue!11457)) b!332097))

(assert (= (and b!332093 ((_ is ValueCellFull!3014) mapDefault!11457)) b!332092))

(assert (= start!33448 b!332093))

(declare-fun m!336989 () Bool)

(assert (=> mapNonEmpty!11457 m!336989))

(declare-fun m!336991 () Bool)

(assert (=> start!33448 m!336991))

(declare-fun m!336993 () Bool)

(assert (=> start!33448 m!336993))

(declare-fun m!336995 () Bool)

(assert (=> start!33448 m!336995))

(declare-fun m!336997 () Bool)

(assert (=> b!332095 m!336997))

(declare-fun m!336999 () Bool)

(assert (=> b!332096 m!336999))

(check-sat (not start!33448) (not mapNonEmpty!11457) (not b!332095) tp_is_empty!6715 (not b!332096))
(check-sat)
