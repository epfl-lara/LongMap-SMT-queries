; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34212 () Bool)

(assert start!34212)

(declare-fun b_free!7249 () Bool)

(declare-fun b_next!7249 () Bool)

(assert (=> start!34212 (= b_free!7249 (not b_next!7249))))

(declare-fun tp!25280 () Bool)

(declare-fun b_and!14423 () Bool)

(assert (=> start!34212 (= tp!25280 b_and!14423)))

(declare-fun mapNonEmpty!12228 () Bool)

(declare-fun mapRes!12228 () Bool)

(declare-fun tp!25281 () Bool)

(declare-fun e!209228 () Bool)

(assert (=> mapNonEmpty!12228 (= mapRes!12228 (and tp!25281 e!209228))))

(declare-datatypes ((V!10579 0))(
  ( (V!10580 (val!3645 Int)) )
))
(declare-datatypes ((ValueCell!3257 0))(
  ( (ValueCellFull!3257 (v!5811 V!10579)) (EmptyCell!3257) )
))
(declare-fun mapValue!12228 () ValueCell!3257)

(declare-fun mapRest!12228 () (Array (_ BitVec 32) ValueCell!3257))

(declare-datatypes ((array!17977 0))(
  ( (array!17978 (arr!8509 (Array (_ BitVec 32) ValueCell!3257)) (size!8862 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17977)

(declare-fun mapKey!12228 () (_ BitVec 32))

(assert (=> mapNonEmpty!12228 (= (arr!8509 _values!1525) (store mapRest!12228 mapKey!12228 mapValue!12228))))

(declare-fun b!341177 () Bool)

(declare-fun res!188639 () Bool)

(declare-fun e!209225 () Bool)

(assert (=> b!341177 (=> (not res!188639) (not e!209225))))

(declare-datatypes ((array!17979 0))(
  ( (array!17980 (arr!8510 (Array (_ BitVec 32) (_ BitVec 64))) (size!8863 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17979)

(declare-datatypes ((List!4850 0))(
  ( (Nil!4847) (Cons!4846 (h!5702 (_ BitVec 64)) (t!9949 List!4850)) )
))
(declare-fun arrayNoDuplicates!0 (array!17979 (_ BitVec 32) List!4850) Bool)

(assert (=> b!341177 (= res!188639 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4847))))

(declare-fun b!341178 () Bool)

(declare-fun res!188637 () Bool)

(assert (=> b!341178 (=> (not res!188637) (not e!209225))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17979 (_ BitVec 32)) Bool)

(assert (=> b!341178 (= res!188637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341179 () Bool)

(declare-fun e!209227 () Bool)

(assert (=> b!341179 (= e!209227 false)))

(declare-fun lt!161537 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17979 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341179 (= lt!161537 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341180 () Bool)

(declare-fun res!188632 () Bool)

(assert (=> b!341180 (=> (not res!188632) (not e!209225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341180 (= res!188632 (validKeyInArray!0 k0!1348))))

(declare-fun b!341181 () Bool)

(declare-fun e!209229 () Bool)

(declare-fun e!209230 () Bool)

(assert (=> b!341181 (= e!209229 (and e!209230 mapRes!12228))))

(declare-fun condMapEmpty!12228 () Bool)

(declare-fun mapDefault!12228 () ValueCell!3257)

(assert (=> b!341181 (= condMapEmpty!12228 (= (arr!8509 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3257)) mapDefault!12228)))))

(declare-fun b!341182 () Bool)

(declare-fun res!188636 () Bool)

(assert (=> b!341182 (=> (not res!188636) (not e!209227))))

(declare-fun arrayContainsKey!0 (array!17979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341182 (= res!188636 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!188634 () Bool)

(assert (=> start!34212 (=> (not res!188634) (not e!209225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34212 (= res!188634 (validMask!0 mask!2385))))

(assert (=> start!34212 e!209225))

(assert (=> start!34212 true))

(declare-fun tp_is_empty!7201 () Bool)

(assert (=> start!34212 tp_is_empty!7201))

(assert (=> start!34212 tp!25280))

(declare-fun array_inv!6328 (array!17977) Bool)

(assert (=> start!34212 (and (array_inv!6328 _values!1525) e!209229)))

(declare-fun array_inv!6329 (array!17979) Bool)

(assert (=> start!34212 (array_inv!6329 _keys!1895)))

(declare-fun b!341183 () Bool)

(declare-fun res!188635 () Bool)

(assert (=> b!341183 (=> (not res!188635) (not e!209225))))

(declare-fun zeroValue!1467 () V!10579)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10579)

(declare-datatypes ((tuple2!5226 0))(
  ( (tuple2!5227 (_1!2624 (_ BitVec 64)) (_2!2624 V!10579)) )
))
(declare-datatypes ((List!4851 0))(
  ( (Nil!4848) (Cons!4847 (h!5703 tuple2!5226) (t!9950 List!4851)) )
))
(declare-datatypes ((ListLongMap!4129 0))(
  ( (ListLongMap!4130 (toList!2080 List!4851)) )
))
(declare-fun contains!2145 (ListLongMap!4129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1586 (array!17979 array!17977 (_ BitVec 32) (_ BitVec 32) V!10579 V!10579 (_ BitVec 32) Int) ListLongMap!4129)

(assert (=> b!341183 (= res!188635 (not (contains!2145 (getCurrentListMap!1586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341184 () Bool)

(assert (=> b!341184 (= e!209230 tp_is_empty!7201)))

(declare-fun mapIsEmpty!12228 () Bool)

(assert (=> mapIsEmpty!12228 mapRes!12228))

(declare-fun b!341185 () Bool)

(declare-fun res!188638 () Bool)

(assert (=> b!341185 (=> (not res!188638) (not e!209225))))

(assert (=> b!341185 (= res!188638 (and (= (size!8862 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8863 _keys!1895) (size!8862 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341186 () Bool)

(assert (=> b!341186 (= e!209228 tp_is_empty!7201)))

(declare-fun b!341187 () Bool)

(assert (=> b!341187 (= e!209225 e!209227)))

(declare-fun res!188633 () Bool)

(assert (=> b!341187 (=> (not res!188633) (not e!209227))))

(declare-datatypes ((SeekEntryResult!3277 0))(
  ( (MissingZero!3277 (index!15287 (_ BitVec 32))) (Found!3277 (index!15288 (_ BitVec 32))) (Intermediate!3277 (undefined!4089 Bool) (index!15289 (_ BitVec 32)) (x!33994 (_ BitVec 32))) (Undefined!3277) (MissingVacant!3277 (index!15290 (_ BitVec 32))) )
))
(declare-fun lt!161538 () SeekEntryResult!3277)

(get-info :version)

(assert (=> b!341187 (= res!188633 (and (not ((_ is Found!3277) lt!161538)) (not ((_ is MissingZero!3277) lt!161538)) ((_ is MissingVacant!3277) lt!161538)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17979 (_ BitVec 32)) SeekEntryResult!3277)

(assert (=> b!341187 (= lt!161538 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34212 res!188634) b!341185))

(assert (= (and b!341185 res!188638) b!341178))

(assert (= (and b!341178 res!188637) b!341177))

(assert (= (and b!341177 res!188639) b!341180))

(assert (= (and b!341180 res!188632) b!341183))

(assert (= (and b!341183 res!188635) b!341187))

(assert (= (and b!341187 res!188633) b!341182))

(assert (= (and b!341182 res!188636) b!341179))

(assert (= (and b!341181 condMapEmpty!12228) mapIsEmpty!12228))

(assert (= (and b!341181 (not condMapEmpty!12228)) mapNonEmpty!12228))

(assert (= (and mapNonEmpty!12228 ((_ is ValueCellFull!3257) mapValue!12228)) b!341186))

(assert (= (and b!341181 ((_ is ValueCellFull!3257) mapDefault!12228)) b!341184))

(assert (= start!34212 b!341181))

(declare-fun m!343149 () Bool)

(assert (=> mapNonEmpty!12228 m!343149))

(declare-fun m!343151 () Bool)

(assert (=> start!34212 m!343151))

(declare-fun m!343153 () Bool)

(assert (=> start!34212 m!343153))

(declare-fun m!343155 () Bool)

(assert (=> start!34212 m!343155))

(declare-fun m!343157 () Bool)

(assert (=> b!341178 m!343157))

(declare-fun m!343159 () Bool)

(assert (=> b!341179 m!343159))

(declare-fun m!343161 () Bool)

(assert (=> b!341183 m!343161))

(assert (=> b!341183 m!343161))

(declare-fun m!343163 () Bool)

(assert (=> b!341183 m!343163))

(declare-fun m!343165 () Bool)

(assert (=> b!341187 m!343165))

(declare-fun m!343167 () Bool)

(assert (=> b!341182 m!343167))

(declare-fun m!343169 () Bool)

(assert (=> b!341180 m!343169))

(declare-fun m!343171 () Bool)

(assert (=> b!341177 m!343171))

(check-sat (not start!34212) (not b!341178) tp_is_empty!7201 (not mapNonEmpty!12228) (not b!341187) (not b_next!7249) (not b!341183) (not b!341180) b_and!14423 (not b!341177) (not b!341182) (not b!341179))
(check-sat b_and!14423 (not b_next!7249))
