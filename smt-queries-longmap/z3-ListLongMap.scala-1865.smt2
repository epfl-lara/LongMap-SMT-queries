; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33610 () Bool)

(assert start!33610)

(declare-fun b_free!6859 () Bool)

(declare-fun b_next!6859 () Bool)

(assert (=> start!33610 (= b_free!6859 (not b_next!6859))))

(declare-fun tp!24081 () Bool)

(declare-fun b_and!14013 () Bool)

(assert (=> start!33610 (= tp!24081 b_and!14013)))

(declare-fun res!183706 () Bool)

(declare-fun e!204712 () Bool)

(assert (=> start!33610 (=> (not res!183706) (not e!204712))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33610 (= res!183706 (validMask!0 mask!2385))))

(assert (=> start!33610 e!204712))

(assert (=> start!33610 true))

(declare-fun tp_is_empty!6811 () Bool)

(assert (=> start!33610 tp_is_empty!6811))

(assert (=> start!33610 tp!24081))

(declare-datatypes ((V!10059 0))(
  ( (V!10060 (val!3450 Int)) )
))
(declare-datatypes ((ValueCell!3062 0))(
  ( (ValueCellFull!3062 (v!5606 V!10059)) (EmptyCell!3062) )
))
(declare-datatypes ((array!17201 0))(
  ( (array!17202 (arr!8131 (Array (_ BitVec 32) ValueCell!3062)) (size!8484 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17201)

(declare-fun e!204714 () Bool)

(declare-fun array_inv!6066 (array!17201) Bool)

(assert (=> start!33610 (and (array_inv!6066 _values!1525) e!204714)))

(declare-datatypes ((array!17203 0))(
  ( (array!17204 (arr!8132 (Array (_ BitVec 32) (_ BitVec 64))) (size!8485 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17203)

(declare-fun array_inv!6067 (array!17203) Bool)

(assert (=> start!33610 (array_inv!6067 _keys!1895)))

(declare-fun b!333417 () Bool)

(assert (=> b!333417 (= e!204712 false)))

(declare-datatypes ((SeekEntryResult!3140 0))(
  ( (MissingZero!3140 (index!14739 (_ BitVec 32))) (Found!3140 (index!14740 (_ BitVec 32))) (Intermediate!3140 (undefined!3952 Bool) (index!14741 (_ BitVec 32)) (x!33237 (_ BitVec 32))) (Undefined!3140) (MissingVacant!3140 (index!14742 (_ BitVec 32))) )
))
(declare-fun lt!159156 () SeekEntryResult!3140)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17203 (_ BitVec 32)) SeekEntryResult!3140)

(assert (=> b!333417 (= lt!159156 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333418 () Bool)

(declare-fun e!204711 () Bool)

(assert (=> b!333418 (= e!204711 tp_is_empty!6811)))

(declare-fun b!333419 () Bool)

(declare-fun res!183710 () Bool)

(assert (=> b!333419 (=> (not res!183710) (not e!204712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17203 (_ BitVec 32)) Bool)

(assert (=> b!333419 (= res!183710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333420 () Bool)

(declare-fun res!183708 () Bool)

(assert (=> b!333420 (=> (not res!183708) (not e!204712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333420 (= res!183708 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!11613 () Bool)

(declare-fun mapRes!11613 () Bool)

(declare-fun tp!24080 () Bool)

(assert (=> mapNonEmpty!11613 (= mapRes!11613 (and tp!24080 e!204711))))

(declare-fun mapKey!11613 () (_ BitVec 32))

(declare-fun mapValue!11613 () ValueCell!3062)

(declare-fun mapRest!11613 () (Array (_ BitVec 32) ValueCell!3062))

(assert (=> mapNonEmpty!11613 (= (arr!8131 _values!1525) (store mapRest!11613 mapKey!11613 mapValue!11613))))

(declare-fun b!333421 () Bool)

(declare-fun e!204715 () Bool)

(assert (=> b!333421 (= e!204715 tp_is_empty!6811)))

(declare-fun mapIsEmpty!11613 () Bool)

(assert (=> mapIsEmpty!11613 mapRes!11613))

(declare-fun b!333422 () Bool)

(assert (=> b!333422 (= e!204714 (and e!204715 mapRes!11613))))

(declare-fun condMapEmpty!11613 () Bool)

(declare-fun mapDefault!11613 () ValueCell!3062)

(assert (=> b!333422 (= condMapEmpty!11613 (= (arr!8131 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3062)) mapDefault!11613)))))

(declare-fun b!333423 () Bool)

(declare-fun res!183705 () Bool)

(assert (=> b!333423 (=> (not res!183705) (not e!204712))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333423 (= res!183705 (and (= (size!8484 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8485 _keys!1895) (size!8484 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333424 () Bool)

(declare-fun res!183707 () Bool)

(assert (=> b!333424 (=> (not res!183707) (not e!204712))))

(declare-fun zeroValue!1467 () V!10059)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10059)

(declare-datatypes ((tuple2!4960 0))(
  ( (tuple2!4961 (_1!2491 (_ BitVec 64)) (_2!2491 V!10059)) )
))
(declare-datatypes ((List!4600 0))(
  ( (Nil!4597) (Cons!4596 (h!5452 tuple2!4960) (t!9679 List!4600)) )
))
(declare-datatypes ((ListLongMap!3863 0))(
  ( (ListLongMap!3864 (toList!1947 List!4600)) )
))
(declare-fun contains!2002 (ListLongMap!3863 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1456 (array!17203 array!17201 (_ BitVec 32) (_ BitVec 32) V!10059 V!10059 (_ BitVec 32) Int) ListLongMap!3863)

(assert (=> b!333424 (= res!183707 (not (contains!2002 (getCurrentListMap!1456 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333425 () Bool)

(declare-fun res!183709 () Bool)

(assert (=> b!333425 (=> (not res!183709) (not e!204712))))

(declare-datatypes ((List!4601 0))(
  ( (Nil!4598) (Cons!4597 (h!5453 (_ BitVec 64)) (t!9680 List!4601)) )
))
(declare-fun arrayNoDuplicates!0 (array!17203 (_ BitVec 32) List!4601) Bool)

(assert (=> b!333425 (= res!183709 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4598))))

(assert (= (and start!33610 res!183706) b!333423))

(assert (= (and b!333423 res!183705) b!333419))

(assert (= (and b!333419 res!183710) b!333425))

(assert (= (and b!333425 res!183709) b!333420))

(assert (= (and b!333420 res!183708) b!333424))

(assert (= (and b!333424 res!183707) b!333417))

(assert (= (and b!333422 condMapEmpty!11613) mapIsEmpty!11613))

(assert (= (and b!333422 (not condMapEmpty!11613)) mapNonEmpty!11613))

(get-info :version)

(assert (= (and mapNonEmpty!11613 ((_ is ValueCellFull!3062) mapValue!11613)) b!333418))

(assert (= (and b!333422 ((_ is ValueCellFull!3062) mapDefault!11613)) b!333421))

(assert (= start!33610 b!333422))

(declare-fun m!337151 () Bool)

(assert (=> b!333417 m!337151))

(declare-fun m!337153 () Bool)

(assert (=> b!333425 m!337153))

(declare-fun m!337155 () Bool)

(assert (=> b!333419 m!337155))

(declare-fun m!337157 () Bool)

(assert (=> b!333420 m!337157))

(declare-fun m!337159 () Bool)

(assert (=> start!33610 m!337159))

(declare-fun m!337161 () Bool)

(assert (=> start!33610 m!337161))

(declare-fun m!337163 () Bool)

(assert (=> start!33610 m!337163))

(declare-fun m!337165 () Bool)

(assert (=> b!333424 m!337165))

(assert (=> b!333424 m!337165))

(declare-fun m!337167 () Bool)

(assert (=> b!333424 m!337167))

(declare-fun m!337169 () Bool)

(assert (=> mapNonEmpty!11613 m!337169))

(check-sat (not b_next!6859) (not b!333419) tp_is_empty!6811 (not b!333417) (not mapNonEmpty!11613) (not b!333424) b_and!14013 (not start!33610) (not b!333420) (not b!333425))
(check-sat b_and!14013 (not b_next!6859))
