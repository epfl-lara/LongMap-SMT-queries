; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33730 () Bool)

(assert start!33730)

(declare-fun b_free!6979 () Bool)

(declare-fun b_next!6979 () Bool)

(assert (=> start!33730 (= b_free!6979 (not b_next!6979))))

(declare-fun tp!24441 () Bool)

(declare-fun b_and!14173 () Bool)

(assert (=> start!33730 (= tp!24441 b_and!14173)))

(declare-fun res!185263 () Bool)

(declare-fun e!206013 () Bool)

(assert (=> start!33730 (=> (not res!185263) (not e!206013))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33730 (= res!185263 (validMask!0 mask!2385))))

(assert (=> start!33730 e!206013))

(assert (=> start!33730 true))

(declare-fun tp_is_empty!6931 () Bool)

(assert (=> start!33730 tp_is_empty!6931))

(assert (=> start!33730 tp!24441))

(declare-datatypes ((V!10219 0))(
  ( (V!10220 (val!3510 Int)) )
))
(declare-datatypes ((ValueCell!3122 0))(
  ( (ValueCellFull!3122 (v!5673 V!10219)) (EmptyCell!3122) )
))
(declare-datatypes ((array!17442 0))(
  ( (array!17443 (arr!8251 (Array (_ BitVec 32) ValueCell!3122)) (size!8603 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17442)

(declare-fun e!206012 () Bool)

(declare-fun array_inv!6136 (array!17442) Bool)

(assert (=> start!33730 (and (array_inv!6136 _values!1525) e!206012)))

(declare-datatypes ((array!17444 0))(
  ( (array!17445 (arr!8252 (Array (_ BitVec 32) (_ BitVec 64))) (size!8604 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17444)

(declare-fun array_inv!6137 (array!17444) Bool)

(assert (=> start!33730 (array_inv!6137 _keys!1895)))

(declare-fun mapIsEmpty!11793 () Bool)

(declare-fun mapRes!11793 () Bool)

(assert (=> mapIsEmpty!11793 mapRes!11793))

(declare-fun b!335605 () Bool)

(declare-fun e!206009 () Bool)

(assert (=> b!335605 (= e!206009 (not true))))

(declare-datatypes ((tuple2!5018 0))(
  ( (tuple2!5019 (_1!2520 (_ BitVec 64)) (_2!2520 V!10219)) )
))
(declare-datatypes ((List!4636 0))(
  ( (Nil!4633) (Cons!4632 (h!5488 tuple2!5018) (t!9716 List!4636)) )
))
(declare-datatypes ((ListLongMap!3933 0))(
  ( (ListLongMap!3934 (toList!1982 List!4636)) )
))
(declare-fun lt!159928 () ListLongMap!3933)

(declare-datatypes ((SeekEntryResult!3155 0))(
  ( (MissingZero!3155 (index!14799 (_ BitVec 32))) (Found!3155 (index!14800 (_ BitVec 32))) (Intermediate!3155 (undefined!3967 Bool) (index!14801 (_ BitVec 32)) (x!33414 (_ BitVec 32))) (Undefined!3155) (MissingVacant!3155 (index!14802 (_ BitVec 32))) )
))
(declare-fun lt!159931 () SeekEntryResult!3155)

(declare-fun contains!2045 (ListLongMap!3933 (_ BitVec 64)) Bool)

(assert (=> b!335605 (contains!2045 lt!159928 (select (arr!8252 _keys!1895) (index!14800 lt!159931)))))

(declare-fun zeroValue!1467 () V!10219)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((Unit!10423 0))(
  ( (Unit!10424) )
))
(declare-fun lt!159930 () Unit!10423)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10219)

(declare-fun lemmaValidKeyInArrayIsInListMap!169 (array!17444 array!17442 (_ BitVec 32) (_ BitVec 32) V!10219 V!10219 (_ BitVec 32) Int) Unit!10423)

(assert (=> b!335605 (= lt!159930 (lemmaValidKeyInArrayIsInListMap!169 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14800 lt!159931) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335605 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159929 () Unit!10423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17444 (_ BitVec 64) (_ BitVec 32)) Unit!10423)

(assert (=> b!335605 (= lt!159929 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14800 lt!159931)))))

(declare-fun b!335606 () Bool)

(declare-fun e!206015 () Bool)

(assert (=> b!335606 (= e!206012 (and e!206015 mapRes!11793))))

(declare-fun condMapEmpty!11793 () Bool)

(declare-fun mapDefault!11793 () ValueCell!3122)

(assert (=> b!335606 (= condMapEmpty!11793 (= (arr!8251 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3122)) mapDefault!11793)))))

(declare-fun b!335607 () Bool)

(assert (=> b!335607 (= e!206015 tp_is_empty!6931)))

(declare-fun b!335608 () Bool)

(declare-fun e!206010 () Bool)

(assert (=> b!335608 (= e!206010 tp_is_empty!6931)))

(declare-fun b!335609 () Bool)

(declare-fun e!206011 () Bool)

(assert (=> b!335609 (= e!206013 e!206011)))

(declare-fun res!185258 () Bool)

(assert (=> b!335609 (=> (not res!185258) (not e!206011))))

(assert (=> b!335609 (= res!185258 (not (contains!2045 lt!159928 k0!1348)))))

(declare-fun getCurrentListMap!1511 (array!17444 array!17442 (_ BitVec 32) (_ BitVec 32) V!10219 V!10219 (_ BitVec 32) Int) ListLongMap!3933)

(assert (=> b!335609 (= lt!159928 (getCurrentListMap!1511 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335610 () Bool)

(declare-fun res!185261 () Bool)

(assert (=> b!335610 (=> (not res!185261) (not e!206013))))

(declare-datatypes ((List!4637 0))(
  ( (Nil!4634) (Cons!4633 (h!5489 (_ BitVec 64)) (t!9717 List!4637)) )
))
(declare-fun arrayNoDuplicates!0 (array!17444 (_ BitVec 32) List!4637) Bool)

(assert (=> b!335610 (= res!185261 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4634))))

(declare-fun b!335611 () Bool)

(declare-fun res!185262 () Bool)

(assert (=> b!335611 (=> (not res!185262) (not e!206013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17444 (_ BitVec 32)) Bool)

(assert (=> b!335611 (= res!185262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335612 () Bool)

(assert (=> b!335612 (= e!206011 e!206009)))

(declare-fun res!185257 () Bool)

(assert (=> b!335612 (=> (not res!185257) (not e!206009))))

(get-info :version)

(assert (=> b!335612 (= res!185257 (and ((_ is Found!3155) lt!159931) (= (select (arr!8252 _keys!1895) (index!14800 lt!159931)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17444 (_ BitVec 32)) SeekEntryResult!3155)

(assert (=> b!335612 (= lt!159931 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335613 () Bool)

(declare-fun res!185260 () Bool)

(assert (=> b!335613 (=> (not res!185260) (not e!206013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335613 (= res!185260 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!11793 () Bool)

(declare-fun tp!24440 () Bool)

(assert (=> mapNonEmpty!11793 (= mapRes!11793 (and tp!24440 e!206010))))

(declare-fun mapValue!11793 () ValueCell!3122)

(declare-fun mapRest!11793 () (Array (_ BitVec 32) ValueCell!3122))

(declare-fun mapKey!11793 () (_ BitVec 32))

(assert (=> mapNonEmpty!11793 (= (arr!8251 _values!1525) (store mapRest!11793 mapKey!11793 mapValue!11793))))

(declare-fun b!335614 () Bool)

(declare-fun res!185259 () Bool)

(assert (=> b!335614 (=> (not res!185259) (not e!206013))))

(assert (=> b!335614 (= res!185259 (and (= (size!8603 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8604 _keys!1895) (size!8603 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335615 () Bool)

(declare-fun res!185264 () Bool)

(assert (=> b!335615 (=> (not res!185264) (not e!206009))))

(assert (=> b!335615 (= res!185264 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14800 lt!159931)))))

(assert (= (and start!33730 res!185263) b!335614))

(assert (= (and b!335614 res!185259) b!335611))

(assert (= (and b!335611 res!185262) b!335610))

(assert (= (and b!335610 res!185261) b!335613))

(assert (= (and b!335613 res!185260) b!335609))

(assert (= (and b!335609 res!185258) b!335612))

(assert (= (and b!335612 res!185257) b!335615))

(assert (= (and b!335615 res!185264) b!335605))

(assert (= (and b!335606 condMapEmpty!11793) mapIsEmpty!11793))

(assert (= (and b!335606 (not condMapEmpty!11793)) mapNonEmpty!11793))

(assert (= (and mapNonEmpty!11793 ((_ is ValueCellFull!3122) mapValue!11793)) b!335608))

(assert (= (and b!335606 ((_ is ValueCellFull!3122) mapDefault!11793)) b!335607))

(assert (= start!33730 b!335606))

(declare-fun m!339869 () Bool)

(assert (=> b!335610 m!339869))

(declare-fun m!339871 () Bool)

(assert (=> b!335613 m!339871))

(declare-fun m!339873 () Bool)

(assert (=> b!335615 m!339873))

(declare-fun m!339875 () Bool)

(assert (=> b!335612 m!339875))

(declare-fun m!339877 () Bool)

(assert (=> b!335612 m!339877))

(assert (=> b!335605 m!339875))

(declare-fun m!339879 () Bool)

(assert (=> b!335605 m!339879))

(declare-fun m!339881 () Bool)

(assert (=> b!335605 m!339881))

(declare-fun m!339883 () Bool)

(assert (=> b!335605 m!339883))

(declare-fun m!339885 () Bool)

(assert (=> b!335605 m!339885))

(assert (=> b!335605 m!339875))

(declare-fun m!339887 () Bool)

(assert (=> b!335611 m!339887))

(declare-fun m!339889 () Bool)

(assert (=> mapNonEmpty!11793 m!339889))

(declare-fun m!339891 () Bool)

(assert (=> b!335609 m!339891))

(declare-fun m!339893 () Bool)

(assert (=> b!335609 m!339893))

(declare-fun m!339895 () Bool)

(assert (=> start!33730 m!339895))

(declare-fun m!339897 () Bool)

(assert (=> start!33730 m!339897))

(declare-fun m!339899 () Bool)

(assert (=> start!33730 m!339899))

(check-sat (not b!335610) (not b!335605) (not b_next!6979) (not start!33730) (not b!335612) (not b!335609) (not b!335615) (not b!335613) (not mapNonEmpty!11793) tp_is_empty!6931 (not b!335611) b_and!14173)
(check-sat b_and!14173 (not b_next!6979))
