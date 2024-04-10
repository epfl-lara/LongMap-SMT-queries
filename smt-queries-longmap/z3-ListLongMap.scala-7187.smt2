; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92126 () Bool)

(assert start!92126)

(declare-fun b!1047992 () Bool)

(declare-fun b_free!21177 () Bool)

(declare-fun b_next!21177 () Bool)

(assert (=> b!1047992 (= b_free!21177 (not b_next!21177))))

(declare-fun tp!74797 () Bool)

(declare-fun b_and!33887 () Bool)

(assert (=> b!1047992 (= tp!74797 b_and!33887)))

(declare-fun b!1047986 () Bool)

(declare-fun e!594276 () Bool)

(declare-fun e!594274 () Bool)

(declare-fun mapRes!38995 () Bool)

(assert (=> b!1047986 (= e!594276 (and e!594274 mapRes!38995))))

(declare-fun condMapEmpty!38995 () Bool)

(declare-datatypes ((V!38069 0))(
  ( (V!38070 (val!12499 Int)) )
))
(declare-datatypes ((ValueCell!11745 0))(
  ( (ValueCellFull!11745 (v!15099 V!38069)) (EmptyCell!11745) )
))
(declare-datatypes ((array!65974 0))(
  ( (array!65975 (arr!31731 (Array (_ BitVec 32) (_ BitVec 64))) (size!32267 (_ BitVec 32))) )
))
(declare-datatypes ((array!65976 0))(
  ( (array!65977 (arr!31732 (Array (_ BitVec 32) ValueCell!11745)) (size!32268 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6084 0))(
  ( (LongMapFixedSize!6085 (defaultEntry!6446 Int) (mask!30603 (_ BitVec 32)) (extraKeys!6174 (_ BitVec 32)) (zeroValue!6280 V!38069) (minValue!6280 V!38069) (_size!3097 (_ BitVec 32)) (_keys!11725 array!65974) (_values!6469 array!65976) (_vacant!3097 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6084)

(declare-fun mapDefault!38995 () ValueCell!11745)

(assert (=> b!1047986 (= condMapEmpty!38995 (= (arr!31732 (_values!6469 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11745)) mapDefault!38995)))))

(declare-fun b!1047987 () Bool)

(declare-fun res!697165 () Bool)

(declare-fun e!594277 () Bool)

(assert (=> b!1047987 (=> (not res!697165) (not e!594277))))

(declare-fun key!909 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9863 0))(
  ( (MissingZero!9863 (index!41823 (_ BitVec 32))) (Found!9863 (index!41824 (_ BitVec 32))) (Intermediate!9863 (undefined!10675 Bool) (index!41825 (_ BitVec 32)) (x!93544 (_ BitVec 32))) (Undefined!9863) (MissingVacant!9863 (index!41826 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!65974 (_ BitVec 32)) SeekEntryResult!9863)

(assert (=> b!1047987 (= res!697165 (not ((_ is Found!9863) (seekEntry!0 key!909 (_keys!11725 thiss!1427) (mask!30603 thiss!1427)))))))

(declare-fun b!1047988 () Bool)

(declare-fun res!697164 () Bool)

(assert (=> b!1047988 (=> (not res!697164) (not e!594277))))

(assert (=> b!1047988 (= res!697164 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1047989 () Bool)

(declare-fun tp_is_empty!24897 () Bool)

(assert (=> b!1047989 (= e!594274 tp_is_empty!24897)))

(declare-fun mapIsEmpty!38995 () Bool)

(assert (=> mapIsEmpty!38995 mapRes!38995))

(declare-fun res!697166 () Bool)

(assert (=> start!92126 (=> (not res!697166) (not e!594277))))

(declare-fun valid!2284 (LongMapFixedSize!6084) Bool)

(assert (=> start!92126 (= res!697166 (valid!2284 thiss!1427))))

(assert (=> start!92126 e!594277))

(declare-fun e!594272 () Bool)

(assert (=> start!92126 e!594272))

(assert (=> start!92126 true))

(declare-fun b!1047990 () Bool)

(assert (=> b!1047990 (= e!594277 false)))

(declare-datatypes ((tuple2!15854 0))(
  ( (tuple2!15855 (_1!7938 (_ BitVec 64)) (_2!7938 V!38069)) )
))
(declare-datatypes ((List!22048 0))(
  ( (Nil!22045) (Cons!22044 (h!23253 tuple2!15854) (t!31355 List!22048)) )
))
(declare-datatypes ((ListLongMap!13823 0))(
  ( (ListLongMap!13824 (toList!6927 List!22048)) )
))
(declare-fun lt!463095 () ListLongMap!13823)

(declare-fun map!14833 (LongMapFixedSize!6084) ListLongMap!13823)

(assert (=> b!1047990 (= lt!463095 (map!14833 thiss!1427))))

(declare-fun b!1047991 () Bool)

(declare-fun e!594275 () Bool)

(assert (=> b!1047991 (= e!594275 tp_is_empty!24897)))

(declare-fun array_inv!24511 (array!65974) Bool)

(declare-fun array_inv!24512 (array!65976) Bool)

(assert (=> b!1047992 (= e!594272 (and tp!74797 tp_is_empty!24897 (array_inv!24511 (_keys!11725 thiss!1427)) (array_inv!24512 (_values!6469 thiss!1427)) e!594276))))

(declare-fun mapNonEmpty!38995 () Bool)

(declare-fun tp!74798 () Bool)

(assert (=> mapNonEmpty!38995 (= mapRes!38995 (and tp!74798 e!594275))))

(declare-fun mapValue!38995 () ValueCell!11745)

(declare-fun mapKey!38995 () (_ BitVec 32))

(declare-fun mapRest!38995 () (Array (_ BitVec 32) ValueCell!11745))

(assert (=> mapNonEmpty!38995 (= (arr!31732 (_values!6469 thiss!1427)) (store mapRest!38995 mapKey!38995 mapValue!38995))))

(assert (= (and start!92126 res!697166) b!1047988))

(assert (= (and b!1047988 res!697164) b!1047987))

(assert (= (and b!1047987 res!697165) b!1047990))

(assert (= (and b!1047986 condMapEmpty!38995) mapIsEmpty!38995))

(assert (= (and b!1047986 (not condMapEmpty!38995)) mapNonEmpty!38995))

(assert (= (and mapNonEmpty!38995 ((_ is ValueCellFull!11745) mapValue!38995)) b!1047991))

(assert (= (and b!1047986 ((_ is ValueCellFull!11745) mapDefault!38995)) b!1047989))

(assert (= b!1047992 b!1047986))

(assert (= start!92126 b!1047992))

(declare-fun m!969027 () Bool)

(assert (=> b!1047990 m!969027))

(declare-fun m!969029 () Bool)

(assert (=> b!1047992 m!969029))

(declare-fun m!969031 () Bool)

(assert (=> b!1047992 m!969031))

(declare-fun m!969033 () Bool)

(assert (=> mapNonEmpty!38995 m!969033))

(declare-fun m!969035 () Bool)

(assert (=> b!1047987 m!969035))

(declare-fun m!969037 () Bool)

(assert (=> start!92126 m!969037))

(check-sat (not mapNonEmpty!38995) (not b!1047987) (not b!1047992) (not b!1047990) (not b_next!21177) tp_is_empty!24897 (not start!92126) b_and!33887)
(check-sat b_and!33887 (not b_next!21177))
