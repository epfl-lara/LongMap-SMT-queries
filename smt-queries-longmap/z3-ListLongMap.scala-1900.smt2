; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33892 () Bool)

(assert start!33892)

(declare-fun b_free!7071 () Bool)

(declare-fun b_next!7071 () Bool)

(assert (=> start!33892 (= b_free!7071 (not b_next!7071))))

(declare-fun tp!24725 () Bool)

(declare-fun b_and!14257 () Bool)

(assert (=> start!33892 (= tp!24725 b_and!14257)))

(declare-fun b!337491 () Bool)

(declare-fun res!186435 () Bool)

(declare-fun e!207094 () Bool)

(assert (=> b!337491 (=> (not res!186435) (not e!207094))))

(declare-datatypes ((array!17641 0))(
  ( (array!17642 (arr!8348 (Array (_ BitVec 32) (_ BitVec 64))) (size!8700 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17641)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17641 (_ BitVec 32)) Bool)

(assert (=> b!337491 (= res!186435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337492 () Bool)

(declare-fun res!186437 () Bool)

(assert (=> b!337492 (=> (not res!186437) (not e!207094))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337492 (= res!186437 (validKeyInArray!0 k0!1348))))

(declare-fun b!337493 () Bool)

(declare-fun res!186438 () Bool)

(declare-fun e!207091 () Bool)

(assert (=> b!337493 (=> (not res!186438) (not e!207091))))

(declare-fun arrayContainsKey!0 (array!17641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337493 (= res!186438 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337494 () Bool)

(assert (=> b!337494 (= e!207094 e!207091)))

(declare-fun res!186434 () Bool)

(assert (=> b!337494 (=> (not res!186434) (not e!207091))))

(declare-datatypes ((SeekEntryResult!3226 0))(
  ( (MissingZero!3226 (index!15083 (_ BitVec 32))) (Found!3226 (index!15084 (_ BitVec 32))) (Intermediate!3226 (undefined!4038 Bool) (index!15085 (_ BitVec 32)) (x!33638 (_ BitVec 32))) (Undefined!3226) (MissingVacant!3226 (index!15086 (_ BitVec 32))) )
))
(declare-fun lt!160443 () SeekEntryResult!3226)

(get-info :version)

(assert (=> b!337494 (= res!186434 (and (not ((_ is Found!3226) lt!160443)) ((_ is MissingZero!3226) lt!160443)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17641 (_ BitVec 32)) SeekEntryResult!3226)

(assert (=> b!337494 (= lt!160443 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11940 () Bool)

(declare-fun mapRes!11940 () Bool)

(assert (=> mapIsEmpty!11940 mapRes!11940))

(declare-fun mapNonEmpty!11940 () Bool)

(declare-fun tp!24726 () Bool)

(declare-fun e!207093 () Bool)

(assert (=> mapNonEmpty!11940 (= mapRes!11940 (and tp!24726 e!207093))))

(declare-fun mapKey!11940 () (_ BitVec 32))

(declare-datatypes ((V!10341 0))(
  ( (V!10342 (val!3556 Int)) )
))
(declare-datatypes ((ValueCell!3168 0))(
  ( (ValueCellFull!3168 (v!5721 V!10341)) (EmptyCell!3168) )
))
(declare-fun mapRest!11940 () (Array (_ BitVec 32) ValueCell!3168))

(declare-datatypes ((array!17643 0))(
  ( (array!17644 (arr!8349 (Array (_ BitVec 32) ValueCell!3168)) (size!8701 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17643)

(declare-fun mapValue!11940 () ValueCell!3168)

(assert (=> mapNonEmpty!11940 (= (arr!8349 _values!1525) (store mapRest!11940 mapKey!11940 mapValue!11940))))

(declare-fun b!337495 () Bool)

(declare-fun res!186436 () Bool)

(assert (=> b!337495 (=> (not res!186436) (not e!207094))))

(declare-fun zeroValue!1467 () V!10341)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10341)

(declare-datatypes ((tuple2!5164 0))(
  ( (tuple2!5165 (_1!2593 (_ BitVec 64)) (_2!2593 V!10341)) )
))
(declare-datatypes ((List!4780 0))(
  ( (Nil!4777) (Cons!4776 (h!5632 tuple2!5164) (t!9874 List!4780)) )
))
(declare-datatypes ((ListLongMap!4077 0))(
  ( (ListLongMap!4078 (toList!2054 List!4780)) )
))
(declare-fun contains!2101 (ListLongMap!4077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1575 (array!17641 array!17643 (_ BitVec 32) (_ BitVec 32) V!10341 V!10341 (_ BitVec 32) Int) ListLongMap!4077)

(assert (=> b!337495 (= res!186436 (not (contains!2101 (getCurrentListMap!1575 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337496 () Bool)

(declare-fun tp_is_empty!7023 () Bool)

(assert (=> b!337496 (= e!207093 tp_is_empty!7023)))

(declare-fun b!337497 () Bool)

(declare-fun e!207095 () Bool)

(assert (=> b!337497 (= e!207095 tp_is_empty!7023)))

(declare-fun b!337498 () Bool)

(declare-fun res!186433 () Bool)

(assert (=> b!337498 (=> (not res!186433) (not e!207094))))

(declare-datatypes ((List!4781 0))(
  ( (Nil!4778) (Cons!4777 (h!5633 (_ BitVec 64)) (t!9875 List!4781)) )
))
(declare-fun arrayNoDuplicates!0 (array!17641 (_ BitVec 32) List!4781) Bool)

(assert (=> b!337498 (= res!186433 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4778))))

(declare-fun b!337500 () Bool)

(declare-fun res!186439 () Bool)

(assert (=> b!337500 (=> (not res!186439) (not e!207094))))

(assert (=> b!337500 (= res!186439 (and (= (size!8701 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8700 _keys!1895) (size!8701 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337501 () Bool)

(assert (=> b!337501 (= e!207091 false)))

(declare-fun lt!160444 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17641 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337501 (= lt!160444 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337499 () Bool)

(declare-fun e!207092 () Bool)

(assert (=> b!337499 (= e!207092 (and e!207095 mapRes!11940))))

(declare-fun condMapEmpty!11940 () Bool)

(declare-fun mapDefault!11940 () ValueCell!3168)

(assert (=> b!337499 (= condMapEmpty!11940 (= (arr!8349 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3168)) mapDefault!11940)))))

(declare-fun res!186440 () Bool)

(assert (=> start!33892 (=> (not res!186440) (not e!207094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33892 (= res!186440 (validMask!0 mask!2385))))

(assert (=> start!33892 e!207094))

(assert (=> start!33892 true))

(assert (=> start!33892 tp_is_empty!7023))

(assert (=> start!33892 tp!24725))

(declare-fun array_inv!6196 (array!17643) Bool)

(assert (=> start!33892 (and (array_inv!6196 _values!1525) e!207092)))

(declare-fun array_inv!6197 (array!17641) Bool)

(assert (=> start!33892 (array_inv!6197 _keys!1895)))

(assert (= (and start!33892 res!186440) b!337500))

(assert (= (and b!337500 res!186439) b!337491))

(assert (= (and b!337491 res!186435) b!337498))

(assert (= (and b!337498 res!186433) b!337492))

(assert (= (and b!337492 res!186437) b!337495))

(assert (= (and b!337495 res!186436) b!337494))

(assert (= (and b!337494 res!186434) b!337493))

(assert (= (and b!337493 res!186438) b!337501))

(assert (= (and b!337499 condMapEmpty!11940) mapIsEmpty!11940))

(assert (= (and b!337499 (not condMapEmpty!11940)) mapNonEmpty!11940))

(assert (= (and mapNonEmpty!11940 ((_ is ValueCellFull!3168) mapValue!11940)) b!337496))

(assert (= (and b!337499 ((_ is ValueCellFull!3168) mapDefault!11940)) b!337497))

(assert (= start!33892 b!337499))

(declare-fun m!341003 () Bool)

(assert (=> b!337501 m!341003))

(declare-fun m!341005 () Bool)

(assert (=> b!337493 m!341005))

(declare-fun m!341007 () Bool)

(assert (=> b!337492 m!341007))

(declare-fun m!341009 () Bool)

(assert (=> b!337498 m!341009))

(declare-fun m!341011 () Bool)

(assert (=> b!337491 m!341011))

(declare-fun m!341013 () Bool)

(assert (=> mapNonEmpty!11940 m!341013))

(declare-fun m!341015 () Bool)

(assert (=> b!337495 m!341015))

(assert (=> b!337495 m!341015))

(declare-fun m!341017 () Bool)

(assert (=> b!337495 m!341017))

(declare-fun m!341019 () Bool)

(assert (=> b!337494 m!341019))

(declare-fun m!341021 () Bool)

(assert (=> start!33892 m!341021))

(declare-fun m!341023 () Bool)

(assert (=> start!33892 m!341023))

(declare-fun m!341025 () Bool)

(assert (=> start!33892 m!341025))

(check-sat b_and!14257 (not b!337493) tp_is_empty!7023 (not b!337492) (not b!337491) (not mapNonEmpty!11940) (not b!337501) (not b!337494) (not b_next!7071) (not b!337495) (not b!337498) (not start!33892))
(check-sat b_and!14257 (not b_next!7071))
