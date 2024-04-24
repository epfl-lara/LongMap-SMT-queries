; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33858 () Bool)

(assert start!33858)

(declare-fun b_free!7051 () Bool)

(declare-fun b_next!7051 () Bool)

(assert (=> start!33858 (= b_free!7051 (not b_next!7051))))

(declare-fun tp!24665 () Bool)

(declare-fun b_and!14251 () Bool)

(assert (=> start!33858 (= tp!24665 b_and!14251)))

(declare-fun b!337108 () Bool)

(declare-fun res!186196 () Bool)

(declare-fun e!206881 () Bool)

(assert (=> b!337108 (=> (not res!186196) (not e!206881))))

(declare-datatypes ((array!17586 0))(
  ( (array!17587 (arr!8320 (Array (_ BitVec 32) (_ BitVec 64))) (size!8672 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17586)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337108 (= res!186196 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337109 () Bool)

(assert (=> b!337109 (= e!206881 false)))

(declare-fun lt!160401 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17586 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337109 (= lt!160401 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337110 () Bool)

(declare-fun e!206877 () Bool)

(assert (=> b!337110 (= e!206877 e!206881)))

(declare-fun res!186195 () Bool)

(assert (=> b!337110 (=> (not res!186195) (not e!206881))))

(declare-datatypes ((SeekEntryResult!3177 0))(
  ( (MissingZero!3177 (index!14887 (_ BitVec 32))) (Found!3177 (index!14888 (_ BitVec 32))) (Intermediate!3177 (undefined!3989 Bool) (index!14889 (_ BitVec 32)) (x!33562 (_ BitVec 32))) (Undefined!3177) (MissingVacant!3177 (index!14890 (_ BitVec 32))) )
))
(declare-fun lt!160402 () SeekEntryResult!3177)

(get-info :version)

(assert (=> b!337110 (= res!186195 (and (not ((_ is Found!3177) lt!160402)) ((_ is MissingZero!3177) lt!160402)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17586 (_ BitVec 32)) SeekEntryResult!3177)

(assert (=> b!337110 (= lt!160402 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337111 () Bool)

(declare-fun res!186192 () Bool)

(assert (=> b!337111 (=> (not res!186192) (not e!206877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337111 (= res!186192 (validKeyInArray!0 k0!1348))))

(declare-fun b!337112 () Bool)

(declare-fun res!186193 () Bool)

(assert (=> b!337112 (=> (not res!186193) (not e!206877))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((V!10315 0))(
  ( (V!10316 (val!3546 Int)) )
))
(declare-datatypes ((ValueCell!3158 0))(
  ( (ValueCellFull!3158 (v!5712 V!10315)) (EmptyCell!3158) )
))
(declare-datatypes ((array!17588 0))(
  ( (array!17589 (arr!8321 (Array (_ BitVec 32) ValueCell!3158)) (size!8673 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17588)

(assert (=> b!337112 (= res!186193 (and (= (size!8673 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8672 _keys!1895) (size!8673 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337113 () Bool)

(declare-fun e!206878 () Bool)

(declare-fun tp_is_empty!7003 () Bool)

(assert (=> b!337113 (= e!206878 tp_is_empty!7003)))

(declare-fun mapNonEmpty!11910 () Bool)

(declare-fun mapRes!11910 () Bool)

(declare-fun tp!24666 () Bool)

(declare-fun e!206879 () Bool)

(assert (=> mapNonEmpty!11910 (= mapRes!11910 (and tp!24666 e!206879))))

(declare-fun mapRest!11910 () (Array (_ BitVec 32) ValueCell!3158))

(declare-fun mapKey!11910 () (_ BitVec 32))

(declare-fun mapValue!11910 () ValueCell!3158)

(assert (=> mapNonEmpty!11910 (= (arr!8321 _values!1525) (store mapRest!11910 mapKey!11910 mapValue!11910))))

(declare-fun res!186194 () Bool)

(assert (=> start!33858 (=> (not res!186194) (not e!206877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33858 (= res!186194 (validMask!0 mask!2385))))

(assert (=> start!33858 e!206877))

(assert (=> start!33858 true))

(assert (=> start!33858 tp_is_empty!7003))

(assert (=> start!33858 tp!24665))

(declare-fun e!206880 () Bool)

(declare-fun array_inv!6184 (array!17588) Bool)

(assert (=> start!33858 (and (array_inv!6184 _values!1525) e!206880)))

(declare-fun array_inv!6185 (array!17586) Bool)

(assert (=> start!33858 (array_inv!6185 _keys!1895)))

(declare-fun b!337114 () Bool)

(declare-fun res!186197 () Bool)

(assert (=> b!337114 (=> (not res!186197) (not e!206877))))

(declare-datatypes ((List!4677 0))(
  ( (Nil!4674) (Cons!4673 (h!5529 (_ BitVec 64)) (t!9763 List!4677)) )
))
(declare-fun arrayNoDuplicates!0 (array!17586 (_ BitVec 32) List!4677) Bool)

(assert (=> b!337114 (= res!186197 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4674))))

(declare-fun b!337115 () Bool)

(assert (=> b!337115 (= e!206880 (and e!206878 mapRes!11910))))

(declare-fun condMapEmpty!11910 () Bool)

(declare-fun mapDefault!11910 () ValueCell!3158)

(assert (=> b!337115 (= condMapEmpty!11910 (= (arr!8321 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3158)) mapDefault!11910)))))

(declare-fun b!337116 () Bool)

(assert (=> b!337116 (= e!206879 tp_is_empty!7003)))

(declare-fun mapIsEmpty!11910 () Bool)

(assert (=> mapIsEmpty!11910 mapRes!11910))

(declare-fun b!337117 () Bool)

(declare-fun res!186190 () Bool)

(assert (=> b!337117 (=> (not res!186190) (not e!206877))))

(declare-fun zeroValue!1467 () V!10315)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10315)

(declare-datatypes ((tuple2!5064 0))(
  ( (tuple2!5065 (_1!2543 (_ BitVec 64)) (_2!2543 V!10315)) )
))
(declare-datatypes ((List!4678 0))(
  ( (Nil!4675) (Cons!4674 (h!5530 tuple2!5064) (t!9764 List!4678)) )
))
(declare-datatypes ((ListLongMap!3979 0))(
  ( (ListLongMap!3980 (toList!2005 List!4678)) )
))
(declare-fun contains!2071 (ListLongMap!3979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1534 (array!17586 array!17588 (_ BitVec 32) (_ BitVec 32) V!10315 V!10315 (_ BitVec 32) Int) ListLongMap!3979)

(assert (=> b!337117 (= res!186190 (not (contains!2071 (getCurrentListMap!1534 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337118 () Bool)

(declare-fun res!186191 () Bool)

(assert (=> b!337118 (=> (not res!186191) (not e!206877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17586 (_ BitVec 32)) Bool)

(assert (=> b!337118 (= res!186191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33858 res!186194) b!337112))

(assert (= (and b!337112 res!186193) b!337118))

(assert (= (and b!337118 res!186191) b!337114))

(assert (= (and b!337114 res!186197) b!337111))

(assert (= (and b!337111 res!186192) b!337117))

(assert (= (and b!337117 res!186190) b!337110))

(assert (= (and b!337110 res!186195) b!337108))

(assert (= (and b!337108 res!186196) b!337109))

(assert (= (and b!337115 condMapEmpty!11910) mapIsEmpty!11910))

(assert (= (and b!337115 (not condMapEmpty!11910)) mapNonEmpty!11910))

(assert (= (and mapNonEmpty!11910 ((_ is ValueCellFull!3158) mapValue!11910)) b!337116))

(assert (= (and b!337115 ((_ is ValueCellFull!3158) mapDefault!11910)) b!337113))

(assert (= start!33858 b!337115))

(declare-fun m!340987 () Bool)

(assert (=> start!33858 m!340987))

(declare-fun m!340989 () Bool)

(assert (=> start!33858 m!340989))

(declare-fun m!340991 () Bool)

(assert (=> start!33858 m!340991))

(declare-fun m!340993 () Bool)

(assert (=> b!337114 m!340993))

(declare-fun m!340995 () Bool)

(assert (=> b!337108 m!340995))

(declare-fun m!340997 () Bool)

(assert (=> b!337109 m!340997))

(declare-fun m!340999 () Bool)

(assert (=> b!337110 m!340999))

(declare-fun m!341001 () Bool)

(assert (=> b!337118 m!341001))

(declare-fun m!341003 () Bool)

(assert (=> b!337117 m!341003))

(assert (=> b!337117 m!341003))

(declare-fun m!341005 () Bool)

(assert (=> b!337117 m!341005))

(declare-fun m!341007 () Bool)

(assert (=> mapNonEmpty!11910 m!341007))

(declare-fun m!341009 () Bool)

(assert (=> b!337111 m!341009))

(check-sat (not mapNonEmpty!11910) tp_is_empty!7003 (not b!337109) (not b_next!7051) (not b!337111) (not b!337117) b_and!14251 (not b!337108) (not b!337114) (not b!337110) (not b!337118) (not start!33858))
(check-sat b_and!14251 (not b_next!7051))
