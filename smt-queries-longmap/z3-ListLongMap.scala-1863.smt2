; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33598 () Bool)

(assert start!33598)

(declare-fun b_free!6847 () Bool)

(declare-fun b_next!6847 () Bool)

(assert (=> start!33598 (= b_free!6847 (not b_next!6847))))

(declare-fun tp!24045 () Bool)

(declare-fun b_and!14001 () Bool)

(assert (=> start!33598 (= tp!24045 b_and!14001)))

(declare-fun b!333255 () Bool)

(declare-fun res!183597 () Bool)

(declare-fun e!204622 () Bool)

(assert (=> b!333255 (=> (not res!183597) (not e!204622))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10043 0))(
  ( (V!10044 (val!3444 Int)) )
))
(declare-datatypes ((ValueCell!3056 0))(
  ( (ValueCellFull!3056 (v!5600 V!10043)) (EmptyCell!3056) )
))
(declare-datatypes ((array!17181 0))(
  ( (array!17182 (arr!8121 (Array (_ BitVec 32) ValueCell!3056)) (size!8474 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17181)

(declare-datatypes ((array!17183 0))(
  ( (array!17184 (arr!8122 (Array (_ BitVec 32) (_ BitVec 64))) (size!8475 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17183)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333255 (= res!183597 (and (= (size!8474 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8475 _keys!1895) (size!8474 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11595 () Bool)

(declare-fun mapRes!11595 () Bool)

(assert (=> mapIsEmpty!11595 mapRes!11595))

(declare-fun b!333256 () Bool)

(declare-fun e!204624 () Bool)

(declare-fun e!204623 () Bool)

(assert (=> b!333256 (= e!204624 (and e!204623 mapRes!11595))))

(declare-fun condMapEmpty!11595 () Bool)

(declare-fun mapDefault!11595 () ValueCell!3056)

(assert (=> b!333256 (= condMapEmpty!11595 (= (arr!8121 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3056)) mapDefault!11595)))))

(declare-fun b!333257 () Bool)

(assert (=> b!333257 (= e!204622 false)))

(declare-datatypes ((SeekEntryResult!3136 0))(
  ( (MissingZero!3136 (index!14723 (_ BitVec 32))) (Found!3136 (index!14724 (_ BitVec 32))) (Intermediate!3136 (undefined!3948 Bool) (index!14725 (_ BitVec 32)) (x!33217 (_ BitVec 32))) (Undefined!3136) (MissingVacant!3136 (index!14726 (_ BitVec 32))) )
))
(declare-fun lt!159138 () SeekEntryResult!3136)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17183 (_ BitVec 32)) SeekEntryResult!3136)

(assert (=> b!333257 (= lt!159138 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333258 () Bool)

(declare-fun res!183598 () Bool)

(assert (=> b!333258 (=> (not res!183598) (not e!204622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333258 (= res!183598 (validKeyInArray!0 k0!1348))))

(declare-fun b!333259 () Bool)

(declare-fun res!183602 () Bool)

(assert (=> b!333259 (=> (not res!183602) (not e!204622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17183 (_ BitVec 32)) Bool)

(assert (=> b!333259 (= res!183602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!183600 () Bool)

(assert (=> start!33598 (=> (not res!183600) (not e!204622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33598 (= res!183600 (validMask!0 mask!2385))))

(assert (=> start!33598 e!204622))

(assert (=> start!33598 true))

(declare-fun tp_is_empty!6799 () Bool)

(assert (=> start!33598 tp_is_empty!6799))

(assert (=> start!33598 tp!24045))

(declare-fun array_inv!6058 (array!17181) Bool)

(assert (=> start!33598 (and (array_inv!6058 _values!1525) e!204624)))

(declare-fun array_inv!6059 (array!17183) Bool)

(assert (=> start!33598 (array_inv!6059 _keys!1895)))

(declare-fun b!333260 () Bool)

(declare-fun res!183601 () Bool)

(assert (=> b!333260 (=> (not res!183601) (not e!204622))))

(declare-fun zeroValue!1467 () V!10043)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10043)

(declare-datatypes ((tuple2!4954 0))(
  ( (tuple2!4955 (_1!2488 (_ BitVec 64)) (_2!2488 V!10043)) )
))
(declare-datatypes ((List!4593 0))(
  ( (Nil!4590) (Cons!4589 (h!5445 tuple2!4954) (t!9672 List!4593)) )
))
(declare-datatypes ((ListLongMap!3857 0))(
  ( (ListLongMap!3858 (toList!1944 List!4593)) )
))
(declare-fun contains!1999 (ListLongMap!3857 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1453 (array!17183 array!17181 (_ BitVec 32) (_ BitVec 32) V!10043 V!10043 (_ BitVec 32) Int) ListLongMap!3857)

(assert (=> b!333260 (= res!183601 (not (contains!1999 (getCurrentListMap!1453 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!11595 () Bool)

(declare-fun tp!24044 () Bool)

(declare-fun e!204625 () Bool)

(assert (=> mapNonEmpty!11595 (= mapRes!11595 (and tp!24044 e!204625))))

(declare-fun mapKey!11595 () (_ BitVec 32))

(declare-fun mapValue!11595 () ValueCell!3056)

(declare-fun mapRest!11595 () (Array (_ BitVec 32) ValueCell!3056))

(assert (=> mapNonEmpty!11595 (= (arr!8121 _values!1525) (store mapRest!11595 mapKey!11595 mapValue!11595))))

(declare-fun b!333261 () Bool)

(assert (=> b!333261 (= e!204625 tp_is_empty!6799)))

(declare-fun b!333262 () Bool)

(declare-fun res!183599 () Bool)

(assert (=> b!333262 (=> (not res!183599) (not e!204622))))

(declare-datatypes ((List!4594 0))(
  ( (Nil!4591) (Cons!4590 (h!5446 (_ BitVec 64)) (t!9673 List!4594)) )
))
(declare-fun arrayNoDuplicates!0 (array!17183 (_ BitVec 32) List!4594) Bool)

(assert (=> b!333262 (= res!183599 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4591))))

(declare-fun b!333263 () Bool)

(assert (=> b!333263 (= e!204623 tp_is_empty!6799)))

(assert (= (and start!33598 res!183600) b!333255))

(assert (= (and b!333255 res!183597) b!333259))

(assert (= (and b!333259 res!183602) b!333262))

(assert (= (and b!333262 res!183599) b!333258))

(assert (= (and b!333258 res!183598) b!333260))

(assert (= (and b!333260 res!183601) b!333257))

(assert (= (and b!333256 condMapEmpty!11595) mapIsEmpty!11595))

(assert (= (and b!333256 (not condMapEmpty!11595)) mapNonEmpty!11595))

(get-info :version)

(assert (= (and mapNonEmpty!11595 ((_ is ValueCellFull!3056) mapValue!11595)) b!333261))

(assert (= (and b!333256 ((_ is ValueCellFull!3056) mapDefault!11595)) b!333263))

(assert (= start!33598 b!333256))

(declare-fun m!337031 () Bool)

(assert (=> mapNonEmpty!11595 m!337031))

(declare-fun m!337033 () Bool)

(assert (=> b!333258 m!337033))

(declare-fun m!337035 () Bool)

(assert (=> b!333260 m!337035))

(assert (=> b!333260 m!337035))

(declare-fun m!337037 () Bool)

(assert (=> b!333260 m!337037))

(declare-fun m!337039 () Bool)

(assert (=> b!333257 m!337039))

(declare-fun m!337041 () Bool)

(assert (=> b!333262 m!337041))

(declare-fun m!337043 () Bool)

(assert (=> b!333259 m!337043))

(declare-fun m!337045 () Bool)

(assert (=> start!33598 m!337045))

(declare-fun m!337047 () Bool)

(assert (=> start!33598 m!337047))

(declare-fun m!337049 () Bool)

(assert (=> start!33598 m!337049))

(check-sat (not b!333260) (not b!333258) tp_is_empty!6799 (not start!33598) (not mapNonEmpty!11595) (not b!333257) (not b!333262) b_and!14001 (not b!333259) (not b_next!6847))
(check-sat b_and!14001 (not b_next!6847))
