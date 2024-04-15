; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33870 () Bool)

(assert start!33870)

(declare-fun b_free!7063 () Bool)

(declare-fun b_next!7063 () Bool)

(assert (=> start!33870 (= b_free!7063 (not b_next!7063))))

(declare-fun tp!24701 () Bool)

(declare-fun b_and!14223 () Bool)

(assert (=> start!33870 (= tp!24701 b_and!14223)))

(declare-fun b!337085 () Bool)

(declare-fun res!186215 () Bool)

(declare-fun e!206847 () Bool)

(assert (=> b!337085 (=> (not res!186215) (not e!206847))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337085 (= res!186215 (validKeyInArray!0 k0!1348))))

(declare-fun b!337086 () Bool)

(declare-fun e!206844 () Bool)

(declare-fun tp_is_empty!7015 () Bool)

(assert (=> b!337086 (= e!206844 tp_is_empty!7015)))

(declare-fun mapIsEmpty!11928 () Bool)

(declare-fun mapRes!11928 () Bool)

(assert (=> mapIsEmpty!11928 mapRes!11928))

(declare-fun b!337087 () Bool)

(declare-fun res!186214 () Bool)

(declare-fun e!206843 () Bool)

(assert (=> b!337087 (=> (not res!186214) (not e!206843))))

(declare-datatypes ((array!17605 0))(
  ( (array!17606 (arr!8330 (Array (_ BitVec 32) (_ BitVec 64))) (size!8683 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17605)

(declare-fun arrayContainsKey!0 (array!17605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337087 (= res!186214 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337088 () Bool)

(declare-fun res!186211 () Bool)

(assert (=> b!337088 (=> (not res!186211) (not e!206847))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17605 (_ BitVec 32)) Bool)

(assert (=> b!337088 (= res!186211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337089 () Bool)

(assert (=> b!337089 (= e!206847 e!206843)))

(declare-fun res!186209 () Bool)

(assert (=> b!337089 (=> (not res!186209) (not e!206843))))

(declare-datatypes ((SeekEntryResult!3219 0))(
  ( (MissingZero!3219 (index!15055 (_ BitVec 32))) (Found!3219 (index!15056 (_ BitVec 32))) (Intermediate!3219 (undefined!4031 Bool) (index!15057 (_ BitVec 32)) (x!33618 (_ BitVec 32))) (Undefined!3219) (MissingVacant!3219 (index!15058 (_ BitVec 32))) )
))
(declare-fun lt!160184 () SeekEntryResult!3219)

(get-info :version)

(assert (=> b!337089 (= res!186209 (and (not ((_ is Found!3219) lt!160184)) ((_ is MissingZero!3219) lt!160184)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17605 (_ BitVec 32)) SeekEntryResult!3219)

(assert (=> b!337089 (= lt!160184 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!186210 () Bool)

(assert (=> start!33870 (=> (not res!186210) (not e!206847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33870 (= res!186210 (validMask!0 mask!2385))))

(assert (=> start!33870 e!206847))

(assert (=> start!33870 true))

(assert (=> start!33870 tp_is_empty!7015))

(assert (=> start!33870 tp!24701))

(declare-datatypes ((V!10331 0))(
  ( (V!10332 (val!3552 Int)) )
))
(declare-datatypes ((ValueCell!3164 0))(
  ( (ValueCellFull!3164 (v!5711 V!10331)) (EmptyCell!3164) )
))
(declare-datatypes ((array!17607 0))(
  ( (array!17608 (arr!8331 (Array (_ BitVec 32) ValueCell!3164)) (size!8684 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17607)

(declare-fun e!206848 () Bool)

(declare-fun array_inv!6214 (array!17607) Bool)

(assert (=> start!33870 (and (array_inv!6214 _values!1525) e!206848)))

(declare-fun array_inv!6215 (array!17605) Bool)

(assert (=> start!33870 (array_inv!6215 _keys!1895)))

(declare-fun b!337084 () Bool)

(declare-fun res!186213 () Bool)

(assert (=> b!337084 (=> (not res!186213) (not e!206847))))

(declare-fun zeroValue!1467 () V!10331)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10331)

(declare-datatypes ((tuple2!5106 0))(
  ( (tuple2!5107 (_1!2564 (_ BitVec 64)) (_2!2564 V!10331)) )
))
(declare-datatypes ((List!4737 0))(
  ( (Nil!4734) (Cons!4733 (h!5589 tuple2!5106) (t!9822 List!4737)) )
))
(declare-datatypes ((ListLongMap!4009 0))(
  ( (ListLongMap!4010 (toList!2020 List!4737)) )
))
(declare-fun contains!2078 (ListLongMap!4009 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1526 (array!17605 array!17607 (_ BitVec 32) (_ BitVec 32) V!10331 V!10331 (_ BitVec 32) Int) ListLongMap!4009)

(assert (=> b!337084 (= res!186213 (not (contains!2078 (getCurrentListMap!1526 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337090 () Bool)

(declare-fun e!206846 () Bool)

(assert (=> b!337090 (= e!206846 tp_is_empty!7015)))

(declare-fun b!337091 () Bool)

(assert (=> b!337091 (= e!206848 (and e!206846 mapRes!11928))))

(declare-fun condMapEmpty!11928 () Bool)

(declare-fun mapDefault!11928 () ValueCell!3164)

(assert (=> b!337091 (= condMapEmpty!11928 (= (arr!8331 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3164)) mapDefault!11928)))))

(declare-fun b!337092 () Bool)

(declare-fun res!186208 () Bool)

(assert (=> b!337092 (=> (not res!186208) (not e!206847))))

(declare-datatypes ((List!4738 0))(
  ( (Nil!4735) (Cons!4734 (h!5590 (_ BitVec 64)) (t!9823 List!4738)) )
))
(declare-fun arrayNoDuplicates!0 (array!17605 (_ BitVec 32) List!4738) Bool)

(assert (=> b!337092 (= res!186208 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4735))))

(declare-fun b!337093 () Bool)

(assert (=> b!337093 (= e!206843 false)))

(declare-fun lt!160185 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17605 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337093 (= lt!160185 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337094 () Bool)

(declare-fun res!186212 () Bool)

(assert (=> b!337094 (=> (not res!186212) (not e!206847))))

(assert (=> b!337094 (= res!186212 (and (= (size!8684 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8683 _keys!1895) (size!8684 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11928 () Bool)

(declare-fun tp!24702 () Bool)

(assert (=> mapNonEmpty!11928 (= mapRes!11928 (and tp!24702 e!206844))))

(declare-fun mapValue!11928 () ValueCell!3164)

(declare-fun mapKey!11928 () (_ BitVec 32))

(declare-fun mapRest!11928 () (Array (_ BitVec 32) ValueCell!3164))

(assert (=> mapNonEmpty!11928 (= (arr!8331 _values!1525) (store mapRest!11928 mapKey!11928 mapValue!11928))))

(assert (= (and start!33870 res!186210) b!337094))

(assert (= (and b!337094 res!186212) b!337088))

(assert (= (and b!337088 res!186211) b!337092))

(assert (= (and b!337092 res!186208) b!337085))

(assert (= (and b!337085 res!186215) b!337084))

(assert (= (and b!337084 res!186213) b!337089))

(assert (= (and b!337089 res!186209) b!337087))

(assert (= (and b!337087 res!186214) b!337093))

(assert (= (and b!337091 condMapEmpty!11928) mapIsEmpty!11928))

(assert (= (and b!337091 (not condMapEmpty!11928)) mapNonEmpty!11928))

(assert (= (and mapNonEmpty!11928 ((_ is ValueCellFull!3164) mapValue!11928)) b!337086))

(assert (= (and b!337091 ((_ is ValueCellFull!3164) mapDefault!11928)) b!337090))

(assert (= start!33870 b!337091))

(declare-fun m!340177 () Bool)

(assert (=> start!33870 m!340177))

(declare-fun m!340179 () Bool)

(assert (=> start!33870 m!340179))

(declare-fun m!340181 () Bool)

(assert (=> start!33870 m!340181))

(declare-fun m!340183 () Bool)

(assert (=> b!337087 m!340183))

(declare-fun m!340185 () Bool)

(assert (=> b!337093 m!340185))

(declare-fun m!340187 () Bool)

(assert (=> b!337092 m!340187))

(declare-fun m!340189 () Bool)

(assert (=> b!337088 m!340189))

(declare-fun m!340191 () Bool)

(assert (=> mapNonEmpty!11928 m!340191))

(declare-fun m!340193 () Bool)

(assert (=> b!337085 m!340193))

(declare-fun m!340195 () Bool)

(assert (=> b!337084 m!340195))

(assert (=> b!337084 m!340195))

(declare-fun m!340197 () Bool)

(assert (=> b!337084 m!340197))

(declare-fun m!340199 () Bool)

(assert (=> b!337089 m!340199))

(check-sat b_and!14223 (not b!337088) (not b!337089) (not b_next!7063) (not b!337092) (not b!337093) (not b!337084) (not b!337085) (not mapNonEmpty!11928) (not b!337087) (not start!33870) tp_is_empty!7015)
(check-sat b_and!14223 (not b_next!7063))
