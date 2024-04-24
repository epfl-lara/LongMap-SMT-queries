; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33718 () Bool)

(assert start!33718)

(declare-fun b_free!6967 () Bool)

(declare-fun b_next!6967 () Bool)

(assert (=> start!33718 (= b_free!6967 (not b_next!6967))))

(declare-fun tp!24405 () Bool)

(declare-fun b_and!14161 () Bool)

(assert (=> start!33718 (= tp!24405 b_and!14161)))

(declare-fun b!335407 () Bool)

(declare-fun e!205884 () Bool)

(assert (=> b!335407 (= e!205884 (not true))))

(declare-datatypes ((V!10203 0))(
  ( (V!10204 (val!3504 Int)) )
))
(declare-datatypes ((tuple2!5008 0))(
  ( (tuple2!5009 (_1!2515 (_ BitVec 64)) (_2!2515 V!10203)) )
))
(declare-datatypes ((List!4627 0))(
  ( (Nil!4624) (Cons!4623 (h!5479 tuple2!5008) (t!9707 List!4627)) )
))
(declare-datatypes ((ListLongMap!3923 0))(
  ( (ListLongMap!3924 (toList!1977 List!4627)) )
))
(declare-fun lt!159857 () ListLongMap!3923)

(declare-datatypes ((array!17420 0))(
  ( (array!17421 (arr!8240 (Array (_ BitVec 32) (_ BitVec 64))) (size!8592 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17420)

(declare-datatypes ((SeekEntryResult!3150 0))(
  ( (MissingZero!3150 (index!14779 (_ BitVec 32))) (Found!3150 (index!14780 (_ BitVec 32))) (Intermediate!3150 (undefined!3962 Bool) (index!14781 (_ BitVec 32)) (x!33393 (_ BitVec 32))) (Undefined!3150) (MissingVacant!3150 (index!14782 (_ BitVec 32))) )
))
(declare-fun lt!159859 () SeekEntryResult!3150)

(declare-fun contains!2040 (ListLongMap!3923 (_ BitVec 64)) Bool)

(assert (=> b!335407 (contains!2040 lt!159857 (select (arr!8240 _keys!1895) (index!14780 lt!159859)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((Unit!10415 0))(
  ( (Unit!10416) )
))
(declare-fun lt!159856 () Unit!10415)

(declare-fun zeroValue!1467 () V!10203)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3116 0))(
  ( (ValueCellFull!3116 (v!5667 V!10203)) (EmptyCell!3116) )
))
(declare-datatypes ((array!17422 0))(
  ( (array!17423 (arr!8241 (Array (_ BitVec 32) ValueCell!3116)) (size!8593 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17422)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10203)

(declare-fun lemmaValidKeyInArrayIsInListMap!165 (array!17420 array!17422 (_ BitVec 32) (_ BitVec 32) V!10203 V!10203 (_ BitVec 32) Int) Unit!10415)

(assert (=> b!335407 (= lt!159856 (lemmaValidKeyInArrayIsInListMap!165 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14780 lt!159859) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335407 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159858 () Unit!10415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17420 (_ BitVec 64) (_ BitVec 32)) Unit!10415)

(assert (=> b!335407 (= lt!159858 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14780 lt!159859)))))

(declare-fun mapIsEmpty!11775 () Bool)

(declare-fun mapRes!11775 () Bool)

(assert (=> mapIsEmpty!11775 mapRes!11775))

(declare-fun res!185115 () Bool)

(declare-fun e!205886 () Bool)

(assert (=> start!33718 (=> (not res!185115) (not e!205886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33718 (= res!185115 (validMask!0 mask!2385))))

(assert (=> start!33718 e!205886))

(assert (=> start!33718 true))

(declare-fun tp_is_empty!6919 () Bool)

(assert (=> start!33718 tp_is_empty!6919))

(assert (=> start!33718 tp!24405))

(declare-fun e!205883 () Bool)

(declare-fun array_inv!6130 (array!17422) Bool)

(assert (=> start!33718 (and (array_inv!6130 _values!1525) e!205883)))

(declare-fun array_inv!6131 (array!17420) Bool)

(assert (=> start!33718 (array_inv!6131 _keys!1895)))

(declare-fun b!335408 () Bool)

(declare-fun res!185118 () Bool)

(assert (=> b!335408 (=> (not res!185118) (not e!205886))))

(declare-datatypes ((List!4628 0))(
  ( (Nil!4625) (Cons!4624 (h!5480 (_ BitVec 64)) (t!9708 List!4628)) )
))
(declare-fun arrayNoDuplicates!0 (array!17420 (_ BitVec 32) List!4628) Bool)

(assert (=> b!335408 (= res!185118 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4625))))

(declare-fun b!335409 () Bool)

(declare-fun e!205889 () Bool)

(assert (=> b!335409 (= e!205889 tp_is_empty!6919)))

(declare-fun b!335410 () Bool)

(declare-fun e!205885 () Bool)

(assert (=> b!335410 (= e!205885 e!205884)))

(declare-fun res!185117 () Bool)

(assert (=> b!335410 (=> (not res!185117) (not e!205884))))

(get-info :version)

(assert (=> b!335410 (= res!185117 (and ((_ is Found!3150) lt!159859) (= (select (arr!8240 _keys!1895) (index!14780 lt!159859)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17420 (_ BitVec 32)) SeekEntryResult!3150)

(assert (=> b!335410 (= lt!159859 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11775 () Bool)

(declare-fun tp!24404 () Bool)

(declare-fun e!205887 () Bool)

(assert (=> mapNonEmpty!11775 (= mapRes!11775 (and tp!24404 e!205887))))

(declare-fun mapKey!11775 () (_ BitVec 32))

(declare-fun mapValue!11775 () ValueCell!3116)

(declare-fun mapRest!11775 () (Array (_ BitVec 32) ValueCell!3116))

(assert (=> mapNonEmpty!11775 (= (arr!8241 _values!1525) (store mapRest!11775 mapKey!11775 mapValue!11775))))

(declare-fun b!335411 () Bool)

(assert (=> b!335411 (= e!205887 tp_is_empty!6919)))

(declare-fun b!335412 () Bool)

(assert (=> b!335412 (= e!205883 (and e!205889 mapRes!11775))))

(declare-fun condMapEmpty!11775 () Bool)

(declare-fun mapDefault!11775 () ValueCell!3116)

(assert (=> b!335412 (= condMapEmpty!11775 (= (arr!8241 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3116)) mapDefault!11775)))))

(declare-fun b!335413 () Bool)

(declare-fun res!185116 () Bool)

(assert (=> b!335413 (=> (not res!185116) (not e!205886))))

(assert (=> b!335413 (= res!185116 (and (= (size!8593 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8592 _keys!1895) (size!8593 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335414 () Bool)

(declare-fun res!185120 () Bool)

(assert (=> b!335414 (=> (not res!185120) (not e!205886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335414 (= res!185120 (validKeyInArray!0 k0!1348))))

(declare-fun b!335415 () Bool)

(declare-fun res!185119 () Bool)

(assert (=> b!335415 (=> (not res!185119) (not e!205886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17420 (_ BitVec 32)) Bool)

(assert (=> b!335415 (= res!185119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335416 () Bool)

(declare-fun res!185114 () Bool)

(assert (=> b!335416 (=> (not res!185114) (not e!205884))))

(assert (=> b!335416 (= res!185114 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14780 lt!159859)))))

(declare-fun b!335417 () Bool)

(assert (=> b!335417 (= e!205886 e!205885)))

(declare-fun res!185113 () Bool)

(assert (=> b!335417 (=> (not res!185113) (not e!205885))))

(assert (=> b!335417 (= res!185113 (not (contains!2040 lt!159857 k0!1348)))))

(declare-fun getCurrentListMap!1507 (array!17420 array!17422 (_ BitVec 32) (_ BitVec 32) V!10203 V!10203 (_ BitVec 32) Int) ListLongMap!3923)

(assert (=> b!335417 (= lt!159857 (getCurrentListMap!1507 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(assert (= (and start!33718 res!185115) b!335413))

(assert (= (and b!335413 res!185116) b!335415))

(assert (= (and b!335415 res!185119) b!335408))

(assert (= (and b!335408 res!185118) b!335414))

(assert (= (and b!335414 res!185120) b!335417))

(assert (= (and b!335417 res!185113) b!335410))

(assert (= (and b!335410 res!185117) b!335416))

(assert (= (and b!335416 res!185114) b!335407))

(assert (= (and b!335412 condMapEmpty!11775) mapIsEmpty!11775))

(assert (= (and b!335412 (not condMapEmpty!11775)) mapNonEmpty!11775))

(assert (= (and mapNonEmpty!11775 ((_ is ValueCellFull!3116) mapValue!11775)) b!335411))

(assert (= (and b!335412 ((_ is ValueCellFull!3116) mapDefault!11775)) b!335409))

(assert (= start!33718 b!335412))

(declare-fun m!339677 () Bool)

(assert (=> b!335415 m!339677))

(declare-fun m!339679 () Bool)

(assert (=> b!335414 m!339679))

(declare-fun m!339681 () Bool)

(assert (=> b!335408 m!339681))

(declare-fun m!339683 () Bool)

(assert (=> start!33718 m!339683))

(declare-fun m!339685 () Bool)

(assert (=> start!33718 m!339685))

(declare-fun m!339687 () Bool)

(assert (=> start!33718 m!339687))

(declare-fun m!339689 () Bool)

(assert (=> b!335407 m!339689))

(declare-fun m!339691 () Bool)

(assert (=> b!335407 m!339691))

(declare-fun m!339693 () Bool)

(assert (=> b!335407 m!339693))

(declare-fun m!339695 () Bool)

(assert (=> b!335407 m!339695))

(assert (=> b!335407 m!339691))

(declare-fun m!339697 () Bool)

(assert (=> b!335407 m!339697))

(declare-fun m!339699 () Bool)

(assert (=> mapNonEmpty!11775 m!339699))

(declare-fun m!339701 () Bool)

(assert (=> b!335416 m!339701))

(assert (=> b!335410 m!339691))

(declare-fun m!339703 () Bool)

(assert (=> b!335410 m!339703))

(declare-fun m!339705 () Bool)

(assert (=> b!335417 m!339705))

(declare-fun m!339707 () Bool)

(assert (=> b!335417 m!339707))

(check-sat (not b!335415) (not mapNonEmpty!11775) (not b!335414) b_and!14161 (not b_next!6967) (not start!33718) tp_is_empty!6919 (not b!335407) (not b!335410) (not b!335408) (not b!335417) (not b!335416))
(check-sat b_and!14161 (not b_next!6967))
