; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33858 () Bool)

(assert start!33858)

(declare-fun b_free!7051 () Bool)

(declare-fun b_next!7051 () Bool)

(assert (=> start!33858 (= b_free!7051 (not b_next!7051))))

(declare-fun tp!24666 () Bool)

(declare-fun b_and!14211 () Bool)

(assert (=> start!33858 (= tp!24666 b_and!14211)))

(declare-fun b!336886 () Bool)

(declare-fun res!186069 () Bool)

(declare-fun e!206737 () Bool)

(assert (=> b!336886 (=> (not res!186069) (not e!206737))))

(declare-datatypes ((array!17581 0))(
  ( (array!17582 (arr!8318 (Array (_ BitVec 32) (_ BitVec 64))) (size!8671 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17581)

(declare-datatypes ((List!4731 0))(
  ( (Nil!4728) (Cons!4727 (h!5583 (_ BitVec 64)) (t!9816 List!4731)) )
))
(declare-fun arrayNoDuplicates!0 (array!17581 (_ BitVec 32) List!4731) Bool)

(assert (=> b!336886 (= res!186069 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4728))))

(declare-fun b!336887 () Bool)

(declare-fun res!186071 () Bool)

(assert (=> b!336887 (=> (not res!186071) (not e!206737))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10315 0))(
  ( (V!10316 (val!3546 Int)) )
))
(declare-fun zeroValue!1467 () V!10315)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3158 0))(
  ( (ValueCellFull!3158 (v!5705 V!10315)) (EmptyCell!3158) )
))
(declare-datatypes ((array!17583 0))(
  ( (array!17584 (arr!8319 (Array (_ BitVec 32) ValueCell!3158)) (size!8672 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17583)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10315)

(declare-datatypes ((tuple2!5098 0))(
  ( (tuple2!5099 (_1!2560 (_ BitVec 64)) (_2!2560 V!10315)) )
))
(declare-datatypes ((List!4732 0))(
  ( (Nil!4729) (Cons!4728 (h!5584 tuple2!5098) (t!9817 List!4732)) )
))
(declare-datatypes ((ListLongMap!4001 0))(
  ( (ListLongMap!4002 (toList!2016 List!4732)) )
))
(declare-fun contains!2074 (ListLongMap!4001 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1522 (array!17581 array!17583 (_ BitVec 32) (_ BitVec 32) V!10315 V!10315 (_ BitVec 32) Int) ListLongMap!4001)

(assert (=> b!336887 (= res!186071 (not (contains!2074 (getCurrentListMap!1522 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336888 () Bool)

(declare-fun e!206736 () Bool)

(declare-fun tp_is_empty!7003 () Bool)

(assert (=> b!336888 (= e!206736 tp_is_empty!7003)))

(declare-fun b!336889 () Bool)

(declare-fun e!206738 () Bool)

(assert (=> b!336889 (= e!206737 e!206738)))

(declare-fun res!186068 () Bool)

(assert (=> b!336889 (=> (not res!186068) (not e!206738))))

(declare-datatypes ((SeekEntryResult!3215 0))(
  ( (MissingZero!3215 (index!15039 (_ BitVec 32))) (Found!3215 (index!15040 (_ BitVec 32))) (Intermediate!3215 (undefined!4027 Bool) (index!15041 (_ BitVec 32)) (x!33598 (_ BitVec 32))) (Undefined!3215) (MissingVacant!3215 (index!15042 (_ BitVec 32))) )
))
(declare-fun lt!160149 () SeekEntryResult!3215)

(get-info :version)

(assert (=> b!336889 (= res!186068 (and (not ((_ is Found!3215) lt!160149)) ((_ is MissingZero!3215) lt!160149)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17581 (_ BitVec 32)) SeekEntryResult!3215)

(assert (=> b!336889 (= lt!160149 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336890 () Bool)

(declare-fun res!186064 () Bool)

(assert (=> b!336890 (=> (not res!186064) (not e!206738))))

(declare-fun arrayContainsKey!0 (array!17581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336890 (= res!186064 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336891 () Bool)

(assert (=> b!336891 (= e!206738 false)))

(declare-fun lt!160148 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17581 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336891 (= lt!160148 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336892 () Bool)

(declare-fun res!186065 () Bool)

(assert (=> b!336892 (=> (not res!186065) (not e!206737))))

(assert (=> b!336892 (= res!186065 (and (= (size!8672 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8671 _keys!1895) (size!8672 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336893 () Bool)

(declare-fun e!206740 () Bool)

(assert (=> b!336893 (= e!206740 tp_is_empty!7003)))

(declare-fun res!186070 () Bool)

(assert (=> start!33858 (=> (not res!186070) (not e!206737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33858 (= res!186070 (validMask!0 mask!2385))))

(assert (=> start!33858 e!206737))

(assert (=> start!33858 true))

(assert (=> start!33858 tp_is_empty!7003))

(assert (=> start!33858 tp!24666))

(declare-fun e!206735 () Bool)

(declare-fun array_inv!6208 (array!17583) Bool)

(assert (=> start!33858 (and (array_inv!6208 _values!1525) e!206735)))

(declare-fun array_inv!6209 (array!17581) Bool)

(assert (=> start!33858 (array_inv!6209 _keys!1895)))

(declare-fun b!336894 () Bool)

(declare-fun res!186066 () Bool)

(assert (=> b!336894 (=> (not res!186066) (not e!206737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336894 (= res!186066 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11910 () Bool)

(declare-fun mapRes!11910 () Bool)

(assert (=> mapIsEmpty!11910 mapRes!11910))

(declare-fun b!336895 () Bool)

(declare-fun res!186067 () Bool)

(assert (=> b!336895 (=> (not res!186067) (not e!206737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17581 (_ BitVec 32)) Bool)

(assert (=> b!336895 (= res!186067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11910 () Bool)

(declare-fun tp!24665 () Bool)

(assert (=> mapNonEmpty!11910 (= mapRes!11910 (and tp!24665 e!206736))))

(declare-fun mapValue!11910 () ValueCell!3158)

(declare-fun mapRest!11910 () (Array (_ BitVec 32) ValueCell!3158))

(declare-fun mapKey!11910 () (_ BitVec 32))

(assert (=> mapNonEmpty!11910 (= (arr!8319 _values!1525) (store mapRest!11910 mapKey!11910 mapValue!11910))))

(declare-fun b!336896 () Bool)

(assert (=> b!336896 (= e!206735 (and e!206740 mapRes!11910))))

(declare-fun condMapEmpty!11910 () Bool)

(declare-fun mapDefault!11910 () ValueCell!3158)

(assert (=> b!336896 (= condMapEmpty!11910 (= (arr!8319 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3158)) mapDefault!11910)))))

(assert (= (and start!33858 res!186070) b!336892))

(assert (= (and b!336892 res!186065) b!336895))

(assert (= (and b!336895 res!186067) b!336886))

(assert (= (and b!336886 res!186069) b!336894))

(assert (= (and b!336894 res!186066) b!336887))

(assert (= (and b!336887 res!186071) b!336889))

(assert (= (and b!336889 res!186068) b!336890))

(assert (= (and b!336890 res!186064) b!336891))

(assert (= (and b!336896 condMapEmpty!11910) mapIsEmpty!11910))

(assert (= (and b!336896 (not condMapEmpty!11910)) mapNonEmpty!11910))

(assert (= (and mapNonEmpty!11910 ((_ is ValueCellFull!3158) mapValue!11910)) b!336888))

(assert (= (and b!336896 ((_ is ValueCellFull!3158) mapDefault!11910)) b!336893))

(assert (= start!33858 b!336896))

(declare-fun m!340033 () Bool)

(assert (=> mapNonEmpty!11910 m!340033))

(declare-fun m!340035 () Bool)

(assert (=> b!336891 m!340035))

(declare-fun m!340037 () Bool)

(assert (=> b!336887 m!340037))

(assert (=> b!336887 m!340037))

(declare-fun m!340039 () Bool)

(assert (=> b!336887 m!340039))

(declare-fun m!340041 () Bool)

(assert (=> start!33858 m!340041))

(declare-fun m!340043 () Bool)

(assert (=> start!33858 m!340043))

(declare-fun m!340045 () Bool)

(assert (=> start!33858 m!340045))

(declare-fun m!340047 () Bool)

(assert (=> b!336890 m!340047))

(declare-fun m!340049 () Bool)

(assert (=> b!336886 m!340049))

(declare-fun m!340051 () Bool)

(assert (=> b!336895 m!340051))

(declare-fun m!340053 () Bool)

(assert (=> b!336894 m!340053))

(declare-fun m!340055 () Bool)

(assert (=> b!336889 m!340055))

(check-sat (not b!336894) (not b!336889) (not b!336895) (not start!33858) (not b!336891) (not b!336890) tp_is_empty!7003 (not b!336886) (not b!336887) (not b_next!7051) (not mapNonEmpty!11910) b_and!14211)
(check-sat b_and!14211 (not b_next!7051))
