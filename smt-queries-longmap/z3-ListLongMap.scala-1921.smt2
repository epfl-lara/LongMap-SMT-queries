; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34174 () Bool)

(assert start!34174)

(declare-fun b_free!7197 () Bool)

(declare-fun b_next!7197 () Bool)

(assert (=> start!34174 (= b_free!7197 (not b_next!7197))))

(declare-fun tp!25125 () Bool)

(declare-fun b_and!14397 () Bool)

(assert (=> start!34174 (= tp!25125 b_and!14397)))

(declare-fun b!340594 () Bool)

(declare-fun res!188144 () Bool)

(declare-fun e!208934 () Bool)

(assert (=> b!340594 (=> (not res!188144) (not e!208934))))

(declare-datatypes ((array!17901 0))(
  ( (array!17902 (arr!8471 (Array (_ BitVec 32) (_ BitVec 64))) (size!8823 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17901)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340594 (= res!188144 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340595 () Bool)

(declare-fun res!188141 () Bool)

(declare-fun e!208937 () Bool)

(assert (=> b!340595 (=> (not res!188141) (not e!208937))))

(declare-datatypes ((List!4872 0))(
  ( (Nil!4869) (Cons!4868 (h!5724 (_ BitVec 64)) (t!9980 List!4872)) )
))
(declare-fun arrayNoDuplicates!0 (array!17901 (_ BitVec 32) List!4872) Bool)

(assert (=> b!340595 (= res!188141 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4869))))

(declare-fun b!340596 () Bool)

(declare-fun res!188137 () Bool)

(assert (=> b!340596 (=> (not res!188137) (not e!208937))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((V!10509 0))(
  ( (V!10510 (val!3619 Int)) )
))
(declare-datatypes ((ValueCell!3231 0))(
  ( (ValueCellFull!3231 (v!5791 V!10509)) (EmptyCell!3231) )
))
(declare-datatypes ((array!17903 0))(
  ( (array!17904 (arr!8472 (Array (_ BitVec 32) ValueCell!3231)) (size!8824 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17903)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10509)

(declare-fun zeroValue!1467 () V!10509)

(declare-datatypes ((tuple2!5254 0))(
  ( (tuple2!5255 (_1!2638 (_ BitVec 64)) (_2!2638 V!10509)) )
))
(declare-datatypes ((List!4873 0))(
  ( (Nil!4870) (Cons!4869 (h!5725 tuple2!5254) (t!9981 List!4873)) )
))
(declare-datatypes ((ListLongMap!4167 0))(
  ( (ListLongMap!4168 (toList!2099 List!4873)) )
))
(declare-fun contains!2153 (ListLongMap!4167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1620 (array!17901 array!17903 (_ BitVec 32) (_ BitVec 32) V!10509 V!10509 (_ BitVec 32) Int) ListLongMap!4167)

(assert (=> b!340596 (= res!188137 (not (contains!2153 (getCurrentListMap!1620 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340597 () Bool)

(declare-fun res!188143 () Bool)

(assert (=> b!340597 (=> (not res!188143) (not e!208937))))

(assert (=> b!340597 (= res!188143 (and (= (size!8824 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8823 _keys!1895) (size!8824 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12150 () Bool)

(declare-fun mapRes!12150 () Bool)

(assert (=> mapIsEmpty!12150 mapRes!12150))

(declare-fun b!340598 () Bool)

(assert (=> b!340598 (= e!208934 false)))

(declare-fun lt!161616 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17901 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340598 (= lt!161616 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!188140 () Bool)

(assert (=> start!34174 (=> (not res!188140) (not e!208937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34174 (= res!188140 (validMask!0 mask!2385))))

(assert (=> start!34174 e!208937))

(assert (=> start!34174 true))

(declare-fun tp_is_empty!7149 () Bool)

(assert (=> start!34174 tp_is_empty!7149))

(assert (=> start!34174 tp!25125))

(declare-fun e!208935 () Bool)

(declare-fun array_inv!6274 (array!17903) Bool)

(assert (=> start!34174 (and (array_inv!6274 _values!1525) e!208935)))

(declare-fun array_inv!6275 (array!17901) Bool)

(assert (=> start!34174 (array_inv!6275 _keys!1895)))

(declare-fun b!340599 () Bool)

(declare-fun e!208938 () Bool)

(assert (=> b!340599 (= e!208938 tp_is_empty!7149)))

(declare-fun b!340600 () Bool)

(declare-fun res!188142 () Bool)

(assert (=> b!340600 (=> (not res!188142) (not e!208937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17901 (_ BitVec 32)) Bool)

(assert (=> b!340600 (= res!188142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340601 () Bool)

(assert (=> b!340601 (= e!208935 (and e!208938 mapRes!12150))))

(declare-fun condMapEmpty!12150 () Bool)

(declare-fun mapDefault!12150 () ValueCell!3231)

(assert (=> b!340601 (= condMapEmpty!12150 (= (arr!8472 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3231)) mapDefault!12150)))))

(declare-fun mapNonEmpty!12150 () Bool)

(declare-fun tp!25124 () Bool)

(declare-fun e!208933 () Bool)

(assert (=> mapNonEmpty!12150 (= mapRes!12150 (and tp!25124 e!208933))))

(declare-fun mapRest!12150 () (Array (_ BitVec 32) ValueCell!3231))

(declare-fun mapKey!12150 () (_ BitVec 32))

(declare-fun mapValue!12150 () ValueCell!3231)

(assert (=> mapNonEmpty!12150 (= (arr!8472 _values!1525) (store mapRest!12150 mapKey!12150 mapValue!12150))))

(declare-fun b!340602 () Bool)

(assert (=> b!340602 (= e!208933 tp_is_empty!7149)))

(declare-fun b!340603 () Bool)

(assert (=> b!340603 (= e!208937 e!208934)))

(declare-fun res!188138 () Bool)

(assert (=> b!340603 (=> (not res!188138) (not e!208934))))

(declare-datatypes ((SeekEntryResult!3274 0))(
  ( (MissingZero!3274 (index!15275 (_ BitVec 32))) (Found!3274 (index!15276 (_ BitVec 32))) (Intermediate!3274 (undefined!4086 Bool) (index!15277 (_ BitVec 32)) (x!33924 (_ BitVec 32))) (Undefined!3274) (MissingVacant!3274 (index!15278 (_ BitVec 32))) )
))
(declare-fun lt!161617 () SeekEntryResult!3274)

(get-info :version)

(assert (=> b!340603 (= res!188138 (and (not ((_ is Found!3274) lt!161617)) (not ((_ is MissingZero!3274) lt!161617)) ((_ is MissingVacant!3274) lt!161617)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17901 (_ BitVec 32)) SeekEntryResult!3274)

(assert (=> b!340603 (= lt!161617 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340604 () Bool)

(declare-fun res!188139 () Bool)

(assert (=> b!340604 (=> (not res!188139) (not e!208937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340604 (= res!188139 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34174 res!188140) b!340597))

(assert (= (and b!340597 res!188143) b!340600))

(assert (= (and b!340600 res!188142) b!340595))

(assert (= (and b!340595 res!188141) b!340604))

(assert (= (and b!340604 res!188139) b!340596))

(assert (= (and b!340596 res!188137) b!340603))

(assert (= (and b!340603 res!188138) b!340594))

(assert (= (and b!340594 res!188144) b!340598))

(assert (= (and b!340601 condMapEmpty!12150) mapIsEmpty!12150))

(assert (= (and b!340601 (not condMapEmpty!12150)) mapNonEmpty!12150))

(assert (= (and mapNonEmpty!12150 ((_ is ValueCellFull!3231) mapValue!12150)) b!340602))

(assert (= (and b!340601 ((_ is ValueCellFull!3231) mapDefault!12150)) b!340599))

(assert (= start!34174 b!340601))

(declare-fun m!343255 () Bool)

(assert (=> b!340596 m!343255))

(assert (=> b!340596 m!343255))

(declare-fun m!343257 () Bool)

(assert (=> b!340596 m!343257))

(declare-fun m!343259 () Bool)

(assert (=> b!340594 m!343259))

(declare-fun m!343261 () Bool)

(assert (=> b!340598 m!343261))

(declare-fun m!343263 () Bool)

(assert (=> start!34174 m!343263))

(declare-fun m!343265 () Bool)

(assert (=> start!34174 m!343265))

(declare-fun m!343267 () Bool)

(assert (=> start!34174 m!343267))

(declare-fun m!343269 () Bool)

(assert (=> b!340600 m!343269))

(declare-fun m!343271 () Bool)

(assert (=> b!340595 m!343271))

(declare-fun m!343273 () Bool)

(assert (=> mapNonEmpty!12150 m!343273))

(declare-fun m!343275 () Bool)

(assert (=> b!340603 m!343275))

(declare-fun m!343277 () Bool)

(assert (=> b!340604 m!343277))

(check-sat (not mapNonEmpty!12150) (not b!340600) (not b!340598) (not b!340604) (not b!340594) (not b!340603) (not b!340596) (not b_next!7197) b_and!14397 (not start!34174) (not b!340595) tp_is_empty!7149)
(check-sat b_and!14397 (not b_next!7197))
