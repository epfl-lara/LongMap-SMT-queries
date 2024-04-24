; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33676 () Bool)

(assert start!33676)

(declare-fun b_free!6925 () Bool)

(declare-fun b_next!6925 () Bool)

(assert (=> start!33676 (= b_free!6925 (not b_next!6925))))

(declare-fun tp!24279 () Bool)

(declare-fun b_and!14119 () Bool)

(assert (=> start!33676 (= tp!24279 b_and!14119)))

(declare-fun b!334714 () Bool)

(declare-fun res!184615 () Bool)

(declare-fun e!205445 () Bool)

(assert (=> b!334714 (=> (not res!184615) (not e!205445))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10147 0))(
  ( (V!10148 (val!3483 Int)) )
))
(declare-datatypes ((ValueCell!3095 0))(
  ( (ValueCellFull!3095 (v!5646 V!10147)) (EmptyCell!3095) )
))
(declare-datatypes ((array!17340 0))(
  ( (array!17341 (arr!8200 (Array (_ BitVec 32) ValueCell!3095)) (size!8552 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17340)

(declare-datatypes ((array!17342 0))(
  ( (array!17343 (arr!8201 (Array (_ BitVec 32) (_ BitVec 64))) (size!8553 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17342)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334714 (= res!184615 (and (= (size!8552 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8553 _keys!1895) (size!8552 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334715 () Bool)

(declare-fun res!184614 () Bool)

(assert (=> b!334715 (=> (not res!184614) (not e!205445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17342 (_ BitVec 32)) Bool)

(assert (=> b!334715 (= res!184614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334716 () Bool)

(declare-fun e!205444 () Bool)

(assert (=> b!334716 (= e!205445 e!205444)))

(declare-fun res!184613 () Bool)

(assert (=> b!334716 (=> (not res!184613) (not e!205444))))

(declare-datatypes ((tuple2!4978 0))(
  ( (tuple2!4979 (_1!2500 (_ BitVec 64)) (_2!2500 V!10147)) )
))
(declare-datatypes ((List!4595 0))(
  ( (Nil!4592) (Cons!4591 (h!5447 tuple2!4978) (t!9675 List!4595)) )
))
(declare-datatypes ((ListLongMap!3893 0))(
  ( (ListLongMap!3894 (toList!1962 List!4595)) )
))
(declare-fun lt!159606 () ListLongMap!3893)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun contains!2025 (ListLongMap!3893 (_ BitVec 64)) Bool)

(assert (=> b!334716 (= res!184613 (not (contains!2025 lt!159606 k0!1348)))))

(declare-fun zeroValue!1467 () V!10147)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10147)

(declare-fun getCurrentListMap!1494 (array!17342 array!17340 (_ BitVec 32) (_ BitVec 32) V!10147 V!10147 (_ BitVec 32) Int) ListLongMap!3893)

(assert (=> b!334716 (= lt!159606 (getCurrentListMap!1494 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334717 () Bool)

(declare-fun e!205443 () Bool)

(declare-fun tp_is_empty!6877 () Bool)

(assert (=> b!334717 (= e!205443 tp_is_empty!6877)))

(declare-fun b!334718 () Bool)

(declare-fun res!184610 () Bool)

(declare-fun e!205442 () Bool)

(assert (=> b!334718 (=> (not res!184610) (not e!205442))))

(declare-datatypes ((SeekEntryResult!3134 0))(
  ( (MissingZero!3134 (index!14715 (_ BitVec 32))) (Found!3134 (index!14716 (_ BitVec 32))) (Intermediate!3134 (undefined!3946 Bool) (index!14717 (_ BitVec 32)) (x!33321 (_ BitVec 32))) (Undefined!3134) (MissingVacant!3134 (index!14718 (_ BitVec 32))) )
))
(declare-fun lt!159607 () SeekEntryResult!3134)

(declare-fun arrayContainsKey!0 (array!17342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334718 (= res!184610 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14716 lt!159607)))))

(declare-fun b!334719 () Bool)

(declare-fun res!184611 () Bool)

(assert (=> b!334719 (=> (not res!184611) (not e!205445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334719 (= res!184611 (validKeyInArray!0 k0!1348))))

(declare-fun res!184612 () Bool)

(assert (=> start!33676 (=> (not res!184612) (not e!205445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33676 (= res!184612 (validMask!0 mask!2385))))

(assert (=> start!33676 e!205445))

(assert (=> start!33676 true))

(assert (=> start!33676 tp_is_empty!6877))

(assert (=> start!33676 tp!24279))

(declare-fun e!205448 () Bool)

(declare-fun array_inv!6100 (array!17340) Bool)

(assert (=> start!33676 (and (array_inv!6100 _values!1525) e!205448)))

(declare-fun array_inv!6101 (array!17342) Bool)

(assert (=> start!33676 (array_inv!6101 _keys!1895)))

(declare-fun b!334720 () Bool)

(declare-fun e!205447 () Bool)

(assert (=> b!334720 (= e!205447 tp_is_empty!6877)))

(declare-fun mapIsEmpty!11712 () Bool)

(declare-fun mapRes!11712 () Bool)

(assert (=> mapIsEmpty!11712 mapRes!11712))

(declare-fun mapNonEmpty!11712 () Bool)

(declare-fun tp!24278 () Bool)

(assert (=> mapNonEmpty!11712 (= mapRes!11712 (and tp!24278 e!205447))))

(declare-fun mapValue!11712 () ValueCell!3095)

(declare-fun mapRest!11712 () (Array (_ BitVec 32) ValueCell!3095))

(declare-fun mapKey!11712 () (_ BitVec 32))

(assert (=> mapNonEmpty!11712 (= (arr!8200 _values!1525) (store mapRest!11712 mapKey!11712 mapValue!11712))))

(declare-fun b!334721 () Bool)

(declare-fun res!184609 () Bool)

(assert (=> b!334721 (=> (not res!184609) (not e!205445))))

(declare-datatypes ((List!4596 0))(
  ( (Nil!4593) (Cons!4592 (h!5448 (_ BitVec 64)) (t!9676 List!4596)) )
))
(declare-fun arrayNoDuplicates!0 (array!17342 (_ BitVec 32) List!4596) Bool)

(assert (=> b!334721 (= res!184609 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4593))))

(declare-fun b!334722 () Bool)

(assert (=> b!334722 (= e!205442 (not true))))

(assert (=> b!334722 (contains!2025 lt!159606 (select (arr!8201 _keys!1895) (index!14716 lt!159607)))))

(declare-datatypes ((Unit!10389 0))(
  ( (Unit!10390) )
))
(declare-fun lt!159604 () Unit!10389)

(declare-fun lemmaValidKeyInArrayIsInListMap!152 (array!17342 array!17340 (_ BitVec 32) (_ BitVec 32) V!10147 V!10147 (_ BitVec 32) Int) Unit!10389)

(assert (=> b!334722 (= lt!159604 (lemmaValidKeyInArrayIsInListMap!152 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14716 lt!159607) defaultEntry!1528))))

(assert (=> b!334722 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159605 () Unit!10389)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17342 (_ BitVec 64) (_ BitVec 32)) Unit!10389)

(assert (=> b!334722 (= lt!159605 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14716 lt!159607)))))

(declare-fun b!334723 () Bool)

(assert (=> b!334723 (= e!205444 e!205442)))

(declare-fun res!184616 () Bool)

(assert (=> b!334723 (=> (not res!184616) (not e!205442))))

(get-info :version)

(assert (=> b!334723 (= res!184616 (and ((_ is Found!3134) lt!159607) (= (select (arr!8201 _keys!1895) (index!14716 lt!159607)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17342 (_ BitVec 32)) SeekEntryResult!3134)

(assert (=> b!334723 (= lt!159607 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334724 () Bool)

(assert (=> b!334724 (= e!205448 (and e!205443 mapRes!11712))))

(declare-fun condMapEmpty!11712 () Bool)

(declare-fun mapDefault!11712 () ValueCell!3095)

(assert (=> b!334724 (= condMapEmpty!11712 (= (arr!8200 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3095)) mapDefault!11712)))))

(assert (= (and start!33676 res!184612) b!334714))

(assert (= (and b!334714 res!184615) b!334715))

(assert (= (and b!334715 res!184614) b!334721))

(assert (= (and b!334721 res!184609) b!334719))

(assert (= (and b!334719 res!184611) b!334716))

(assert (= (and b!334716 res!184613) b!334723))

(assert (= (and b!334723 res!184616) b!334718))

(assert (= (and b!334718 res!184610) b!334722))

(assert (= (and b!334724 condMapEmpty!11712) mapIsEmpty!11712))

(assert (= (and b!334724 (not condMapEmpty!11712)) mapNonEmpty!11712))

(assert (= (and mapNonEmpty!11712 ((_ is ValueCellFull!3095) mapValue!11712)) b!334720))

(assert (= (and b!334724 ((_ is ValueCellFull!3095) mapDefault!11712)) b!334717))

(assert (= start!33676 b!334724))

(declare-fun m!339005 () Bool)

(assert (=> start!33676 m!339005))

(declare-fun m!339007 () Bool)

(assert (=> start!33676 m!339007))

(declare-fun m!339009 () Bool)

(assert (=> start!33676 m!339009))

(declare-fun m!339011 () Bool)

(assert (=> b!334723 m!339011))

(declare-fun m!339013 () Bool)

(assert (=> b!334723 m!339013))

(declare-fun m!339015 () Bool)

(assert (=> b!334721 m!339015))

(declare-fun m!339017 () Bool)

(assert (=> b!334718 m!339017))

(declare-fun m!339019 () Bool)

(assert (=> b!334719 m!339019))

(declare-fun m!339021 () Bool)

(assert (=> b!334722 m!339021))

(declare-fun m!339023 () Bool)

(assert (=> b!334722 m!339023))

(assert (=> b!334722 m!339011))

(declare-fun m!339025 () Bool)

(assert (=> b!334722 m!339025))

(assert (=> b!334722 m!339011))

(declare-fun m!339027 () Bool)

(assert (=> b!334722 m!339027))

(declare-fun m!339029 () Bool)

(assert (=> b!334716 m!339029))

(declare-fun m!339031 () Bool)

(assert (=> b!334716 m!339031))

(declare-fun m!339033 () Bool)

(assert (=> mapNonEmpty!11712 m!339033))

(declare-fun m!339035 () Bool)

(assert (=> b!334715 m!339035))

(check-sat (not b!334721) (not start!33676) (not b!334718) (not b!334716) (not mapNonEmpty!11712) tp_is_empty!6877 (not b_next!6925) (not b!334719) (not b!334722) (not b!334715) b_and!14119 (not b!334723))
(check-sat b_and!14119 (not b_next!6925))
