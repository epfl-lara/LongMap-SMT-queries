; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34146 () Bool)

(assert start!34146)

(declare-fun b_free!7183 () Bool)

(declare-fun b_next!7183 () Bool)

(assert (=> start!34146 (= b_free!7183 (not b_next!7183))))

(declare-fun tp!25082 () Bool)

(declare-fun b_and!14357 () Bool)

(assert (=> start!34146 (= tp!25082 b_and!14357)))

(declare-fun mapNonEmpty!12129 () Bool)

(declare-fun mapRes!12129 () Bool)

(declare-fun tp!25083 () Bool)

(declare-fun e!208641 () Bool)

(assert (=> mapNonEmpty!12129 (= mapRes!12129 (and tp!25083 e!208641))))

(declare-datatypes ((V!10491 0))(
  ( (V!10492 (val!3612 Int)) )
))
(declare-datatypes ((ValueCell!3224 0))(
  ( (ValueCellFull!3224 (v!5778 V!10491)) (EmptyCell!3224) )
))
(declare-fun mapRest!12129 () (Array (_ BitVec 32) ValueCell!3224))

(declare-fun mapValue!12129 () ValueCell!3224)

(declare-fun mapKey!12129 () (_ BitVec 32))

(declare-datatypes ((array!17847 0))(
  ( (array!17848 (arr!8444 (Array (_ BitVec 32) ValueCell!3224)) (size!8797 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17847)

(assert (=> mapNonEmpty!12129 (= (arr!8444 _values!1525) (store mapRest!12129 mapKey!12129 mapValue!12129))))

(declare-fun res!187859 () Bool)

(declare-fun e!208638 () Bool)

(assert (=> start!34146 (=> (not res!187859) (not e!208638))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34146 (= res!187859 (validMask!0 mask!2385))))

(assert (=> start!34146 e!208638))

(assert (=> start!34146 true))

(declare-fun tp_is_empty!7135 () Bool)

(assert (=> start!34146 tp_is_empty!7135))

(assert (=> start!34146 tp!25082))

(declare-fun e!208642 () Bool)

(declare-fun array_inv!6286 (array!17847) Bool)

(assert (=> start!34146 (and (array_inv!6286 _values!1525) e!208642)))

(declare-datatypes ((array!17849 0))(
  ( (array!17850 (arr!8445 (Array (_ BitVec 32) (_ BitVec 64))) (size!8798 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17849)

(declare-fun array_inv!6287 (array!17849) Bool)

(assert (=> start!34146 (array_inv!6287 _keys!1895)))

(declare-fun b!340102 () Bool)

(declare-fun res!187856 () Bool)

(assert (=> b!340102 (=> (not res!187856) (not e!208638))))

(declare-datatypes ((List!4809 0))(
  ( (Nil!4806) (Cons!4805 (h!5661 (_ BitVec 64)) (t!9908 List!4809)) )
))
(declare-fun arrayNoDuplicates!0 (array!17849 (_ BitVec 32) List!4809) Bool)

(assert (=> b!340102 (= res!187856 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4806))))

(declare-fun b!340103 () Bool)

(assert (=> b!340103 (= e!208641 tp_is_empty!7135)))

(declare-fun b!340104 () Bool)

(assert (=> b!340104 (= e!208638 false)))

(declare-datatypes ((SeekEntryResult!3255 0))(
  ( (MissingZero!3255 (index!15199 (_ BitVec 32))) (Found!3255 (index!15200 (_ BitVec 32))) (Intermediate!3255 (undefined!4067 Bool) (index!15201 (_ BitVec 32)) (x!33884 (_ BitVec 32))) (Undefined!3255) (MissingVacant!3255 (index!15202 (_ BitVec 32))) )
))
(declare-fun lt!161346 () SeekEntryResult!3255)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17849 (_ BitVec 32)) SeekEntryResult!3255)

(assert (=> b!340104 (= lt!161346 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340105 () Bool)

(declare-fun res!187858 () Bool)

(assert (=> b!340105 (=> (not res!187858) (not e!208638))))

(declare-fun zeroValue!1467 () V!10491)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10491)

(declare-datatypes ((tuple2!5184 0))(
  ( (tuple2!5185 (_1!2603 (_ BitVec 64)) (_2!2603 V!10491)) )
))
(declare-datatypes ((List!4810 0))(
  ( (Nil!4807) (Cons!4806 (h!5662 tuple2!5184) (t!9909 List!4810)) )
))
(declare-datatypes ((ListLongMap!4087 0))(
  ( (ListLongMap!4088 (toList!2059 List!4810)) )
))
(declare-fun contains!2124 (ListLongMap!4087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1565 (array!17849 array!17847 (_ BitVec 32) (_ BitVec 32) V!10491 V!10491 (_ BitVec 32) Int) ListLongMap!4087)

(assert (=> b!340105 (= res!187858 (not (contains!2124 (getCurrentListMap!1565 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340106 () Bool)

(declare-fun res!187854 () Bool)

(assert (=> b!340106 (=> (not res!187854) (not e!208638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17849 (_ BitVec 32)) Bool)

(assert (=> b!340106 (= res!187854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340107 () Bool)

(declare-fun e!208639 () Bool)

(assert (=> b!340107 (= e!208639 tp_is_empty!7135)))

(declare-fun b!340108 () Bool)

(declare-fun res!187857 () Bool)

(assert (=> b!340108 (=> (not res!187857) (not e!208638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340108 (= res!187857 (validKeyInArray!0 k0!1348))))

(declare-fun b!340109 () Bool)

(declare-fun res!187855 () Bool)

(assert (=> b!340109 (=> (not res!187855) (not e!208638))))

(assert (=> b!340109 (= res!187855 (and (= (size!8797 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8798 _keys!1895) (size!8797 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12129 () Bool)

(assert (=> mapIsEmpty!12129 mapRes!12129))

(declare-fun b!340110 () Bool)

(assert (=> b!340110 (= e!208642 (and e!208639 mapRes!12129))))

(declare-fun condMapEmpty!12129 () Bool)

(declare-fun mapDefault!12129 () ValueCell!3224)

(assert (=> b!340110 (= condMapEmpty!12129 (= (arr!8444 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3224)) mapDefault!12129)))))

(assert (= (and start!34146 res!187859) b!340109))

(assert (= (and b!340109 res!187855) b!340106))

(assert (= (and b!340106 res!187854) b!340102))

(assert (= (and b!340102 res!187856) b!340108))

(assert (= (and b!340108 res!187857) b!340105))

(assert (= (and b!340105 res!187858) b!340104))

(assert (= (and b!340110 condMapEmpty!12129) mapIsEmpty!12129))

(assert (= (and b!340110 (not condMapEmpty!12129)) mapNonEmpty!12129))

(get-info :version)

(assert (= (and mapNonEmpty!12129 ((_ is ValueCellFull!3224) mapValue!12129)) b!340103))

(assert (= (and b!340110 ((_ is ValueCellFull!3224) mapDefault!12129)) b!340107))

(assert (= start!34146 b!340110))

(declare-fun m!342369 () Bool)

(assert (=> start!34146 m!342369))

(declare-fun m!342371 () Bool)

(assert (=> start!34146 m!342371))

(declare-fun m!342373 () Bool)

(assert (=> start!34146 m!342373))

(declare-fun m!342375 () Bool)

(assert (=> b!340102 m!342375))

(declare-fun m!342377 () Bool)

(assert (=> b!340104 m!342377))

(declare-fun m!342379 () Bool)

(assert (=> b!340108 m!342379))

(declare-fun m!342381 () Bool)

(assert (=> b!340106 m!342381))

(declare-fun m!342383 () Bool)

(assert (=> mapNonEmpty!12129 m!342383))

(declare-fun m!342385 () Bool)

(assert (=> b!340105 m!342385))

(assert (=> b!340105 m!342385))

(declare-fun m!342387 () Bool)

(assert (=> b!340105 m!342387))

(check-sat b_and!14357 (not b!340108) (not mapNonEmpty!12129) (not b!340105) (not b_next!7183) (not b!340104) (not start!34146) (not b!340106) tp_is_empty!7135 (not b!340102))
(check-sat b_and!14357 (not b_next!7183))
