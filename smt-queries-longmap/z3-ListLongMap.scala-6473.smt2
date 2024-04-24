; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82846 () Bool)

(assert start!82846)

(declare-fun b_free!18811 () Bool)

(declare-fun b_next!18811 () Bool)

(assert (=> start!82846 (= b_free!18811 (not b_next!18811))))

(declare-fun tp!65554 () Bool)

(declare-fun b_and!30309 () Bool)

(assert (=> start!82846 (= tp!65554 b_and!30309)))

(declare-fun res!645515 () Bool)

(declare-fun e!544053 () Bool)

(assert (=> start!82846 (=> (not res!645515) (not e!544053))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82846 (= res!645515 (validMask!0 mask!2110))))

(assert (=> start!82846 e!544053))

(assert (=> start!82846 true))

(declare-datatypes ((V!33801 0))(
  ( (V!33802 (val!10857 Int)) )
))
(declare-datatypes ((ValueCell!10325 0))(
  ( (ValueCellFull!10325 (v!13412 V!33801)) (EmptyCell!10325) )
))
(declare-datatypes ((array!59336 0))(
  ( (array!59337 (arr!28532 (Array (_ BitVec 32) ValueCell!10325)) (size!29012 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59336)

(declare-fun e!544050 () Bool)

(declare-fun array_inv!22169 (array!59336) Bool)

(assert (=> start!82846 (and (array_inv!22169 _values!1400) e!544050)))

(declare-datatypes ((array!59338 0))(
  ( (array!59339 (arr!28533 (Array (_ BitVec 32) (_ BitVec 64))) (size!29013 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59338)

(declare-fun array_inv!22170 (array!59338) Bool)

(assert (=> start!82846 (array_inv!22170 _keys!1686)))

(assert (=> start!82846 tp!65554))

(declare-fun tp_is_empty!21613 () Bool)

(assert (=> start!82846 tp_is_empty!21613))

(declare-fun b!964859 () Bool)

(declare-fun e!544054 () Bool)

(declare-fun mapRes!34414 () Bool)

(assert (=> b!964859 (= e!544050 (and e!544054 mapRes!34414))))

(declare-fun condMapEmpty!34414 () Bool)

(declare-fun mapDefault!34414 () ValueCell!10325)

(assert (=> b!964859 (= condMapEmpty!34414 (= (arr!28532 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10325)) mapDefault!34414)))))

(declare-fun b!964860 () Bool)

(declare-fun res!645522 () Bool)

(assert (=> b!964860 (=> (not res!645522) (not e!544053))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33801)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33801)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-datatypes ((tuple2!13938 0))(
  ( (tuple2!13939 (_1!6980 (_ BitVec 64)) (_2!6980 V!33801)) )
))
(declare-datatypes ((List!19785 0))(
  ( (Nil!19782) (Cons!19781 (h!20949 tuple2!13938) (t!28140 List!19785)) )
))
(declare-datatypes ((ListLongMap!12637 0))(
  ( (ListLongMap!12638 (toList!6334 List!19785)) )
))
(declare-fun contains!5449 (ListLongMap!12637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3567 (array!59338 array!59336 (_ BitVec 32) (_ BitVec 32) V!33801 V!33801 (_ BitVec 32) Int) ListLongMap!12637)

(assert (=> b!964860 (= res!645522 (contains!5449 (getCurrentListMap!3567 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28533 _keys!1686) i!803)))))

(declare-fun b!964861 () Bool)

(declare-fun res!645519 () Bool)

(assert (=> b!964861 (=> (not res!645519) (not e!544053))))

(declare-datatypes ((List!19786 0))(
  ( (Nil!19783) (Cons!19782 (h!20950 (_ BitVec 64)) (t!28141 List!19786)) )
))
(declare-fun arrayNoDuplicates!0 (array!59338 (_ BitVec 32) List!19786) Bool)

(assert (=> b!964861 (= res!645519 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19783))))

(declare-fun b!964862 () Bool)

(declare-fun res!645520 () Bool)

(assert (=> b!964862 (=> (not res!645520) (not e!544053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964862 (= res!645520 (validKeyInArray!0 (select (arr!28533 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34414 () Bool)

(declare-fun tp!65553 () Bool)

(declare-fun e!544052 () Bool)

(assert (=> mapNonEmpty!34414 (= mapRes!34414 (and tp!65553 e!544052))))

(declare-fun mapRest!34414 () (Array (_ BitVec 32) ValueCell!10325))

(declare-fun mapKey!34414 () (_ BitVec 32))

(declare-fun mapValue!34414 () ValueCell!10325)

(assert (=> mapNonEmpty!34414 (= (arr!28532 _values!1400) (store mapRest!34414 mapKey!34414 mapValue!34414))))

(declare-fun b!964863 () Bool)

(assert (=> b!964863 (= e!544054 tp_is_empty!21613)))

(declare-fun b!964864 () Bool)

(assert (=> b!964864 (= e!544052 tp_is_empty!21613)))

(declare-fun b!964865 () Bool)

(declare-fun e!544055 () Bool)

(assert (=> b!964865 (= e!544053 (not e!544055))))

(declare-fun res!645521 () Bool)

(assert (=> b!964865 (=> res!645521 e!544055)))

(assert (=> b!964865 (= res!645521 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29013 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964865 (contains!5449 (getCurrentListMap!3567 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28533 _keys!1686) i!803))))

(declare-datatypes ((Unit!32224 0))(
  ( (Unit!32225) )
))
(declare-fun lt!431384 () Unit!32224)

(declare-fun lemmaInListMapFromThenInFromMinusOne!26 (array!59338 array!59336 (_ BitVec 32) (_ BitVec 32) V!33801 V!33801 (_ BitVec 32) (_ BitVec 32) Int) Unit!32224)

(assert (=> b!964865 (= lt!431384 (lemmaInListMapFromThenInFromMinusOne!26 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964866 () Bool)

(declare-fun res!645514 () Bool)

(assert (=> b!964866 (=> (not res!645514) (not e!544053))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964866 (= res!645514 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29013 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29013 _keys!1686))))))

(declare-fun b!964867 () Bool)

(declare-fun res!645517 () Bool)

(assert (=> b!964867 (=> (not res!645517) (not e!544053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59338 (_ BitVec 32)) Bool)

(assert (=> b!964867 (= res!645517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964868 () Bool)

(declare-fun res!645516 () Bool)

(assert (=> b!964868 (=> (not res!645516) (not e!544053))))

(assert (=> b!964868 (= res!645516 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34414 () Bool)

(assert (=> mapIsEmpty!34414 mapRes!34414))

(declare-fun b!964869 () Bool)

(assert (=> b!964869 (= e!544055 true)))

(assert (=> b!964869 (contains!5449 (getCurrentListMap!3567 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28533 _keys!1686) i!803))))

(declare-fun lt!431383 () Unit!32224)

(declare-fun lemmaInListMapFromThenInFromSmaller!21 (array!59338 array!59336 (_ BitVec 32) (_ BitVec 32) V!33801 V!33801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32224)

(assert (=> b!964869 (= lt!431383 (lemmaInListMapFromThenInFromSmaller!21 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964870 () Bool)

(declare-fun res!645518 () Bool)

(assert (=> b!964870 (=> (not res!645518) (not e!544053))))

(assert (=> b!964870 (= res!645518 (and (= (size!29012 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29013 _keys!1686) (size!29012 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82846 res!645515) b!964870))

(assert (= (and b!964870 res!645518) b!964867))

(assert (= (and b!964867 res!645517) b!964861))

(assert (= (and b!964861 res!645519) b!964866))

(assert (= (and b!964866 res!645514) b!964862))

(assert (= (and b!964862 res!645520) b!964860))

(assert (= (and b!964860 res!645522) b!964868))

(assert (= (and b!964868 res!645516) b!964865))

(assert (= (and b!964865 (not res!645521)) b!964869))

(assert (= (and b!964859 condMapEmpty!34414) mapIsEmpty!34414))

(assert (= (and b!964859 (not condMapEmpty!34414)) mapNonEmpty!34414))

(get-info :version)

(assert (= (and mapNonEmpty!34414 ((_ is ValueCellFull!10325) mapValue!34414)) b!964864))

(assert (= (and b!964859 ((_ is ValueCellFull!10325) mapDefault!34414)) b!964863))

(assert (= start!82846 b!964859))

(declare-fun m!894559 () Bool)

(assert (=> b!964862 m!894559))

(assert (=> b!964862 m!894559))

(declare-fun m!894561 () Bool)

(assert (=> b!964862 m!894561))

(declare-fun m!894563 () Bool)

(assert (=> b!964860 m!894563))

(assert (=> b!964860 m!894559))

(assert (=> b!964860 m!894563))

(assert (=> b!964860 m!894559))

(declare-fun m!894565 () Bool)

(assert (=> b!964860 m!894565))

(declare-fun m!894567 () Bool)

(assert (=> start!82846 m!894567))

(declare-fun m!894569 () Bool)

(assert (=> start!82846 m!894569))

(declare-fun m!894571 () Bool)

(assert (=> start!82846 m!894571))

(declare-fun m!894573 () Bool)

(assert (=> b!964869 m!894573))

(assert (=> b!964869 m!894559))

(assert (=> b!964869 m!894573))

(assert (=> b!964869 m!894559))

(declare-fun m!894575 () Bool)

(assert (=> b!964869 m!894575))

(declare-fun m!894577 () Bool)

(assert (=> b!964869 m!894577))

(declare-fun m!894579 () Bool)

(assert (=> b!964865 m!894579))

(assert (=> b!964865 m!894559))

(assert (=> b!964865 m!894579))

(assert (=> b!964865 m!894559))

(declare-fun m!894581 () Bool)

(assert (=> b!964865 m!894581))

(declare-fun m!894583 () Bool)

(assert (=> b!964865 m!894583))

(declare-fun m!894585 () Bool)

(assert (=> b!964861 m!894585))

(declare-fun m!894587 () Bool)

(assert (=> mapNonEmpty!34414 m!894587))

(declare-fun m!894589 () Bool)

(assert (=> b!964867 m!894589))

(check-sat (not b!964869) (not mapNonEmpty!34414) (not b!964860) tp_is_empty!21613 b_and!30309 (not b!964862) (not start!82846) (not b!964861) (not b!964867) (not b_next!18811) (not b!964865))
(check-sat b_and!30309 (not b_next!18811))
