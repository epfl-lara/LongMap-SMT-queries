; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82780 () Bool)

(assert start!82780)

(declare-fun b_free!18745 () Bool)

(declare-fun b_next!18745 () Bool)

(assert (=> start!82780 (= b_free!18745 (not b_next!18745))))

(declare-fun tp!65356 () Bool)

(declare-fun b_and!30243 () Bool)

(assert (=> start!82780 (= tp!65356 b_and!30243)))

(declare-fun res!644721 () Bool)

(declare-fun e!543553 () Bool)

(assert (=> start!82780 (=> (not res!644721) (not e!543553))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82780 (= res!644721 (validMask!0 mask!2110))))

(assert (=> start!82780 e!543553))

(assert (=> start!82780 true))

(declare-datatypes ((V!33713 0))(
  ( (V!33714 (val!10824 Int)) )
))
(declare-datatypes ((ValueCell!10292 0))(
  ( (ValueCellFull!10292 (v!13379 V!33713)) (EmptyCell!10292) )
))
(declare-datatypes ((array!59208 0))(
  ( (array!59209 (arr!28468 (Array (_ BitVec 32) ValueCell!10292)) (size!28948 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59208)

(declare-fun e!543556 () Bool)

(declare-fun array_inv!22123 (array!59208) Bool)

(assert (=> start!82780 (and (array_inv!22123 _values!1400) e!543556)))

(declare-datatypes ((array!59210 0))(
  ( (array!59211 (arr!28469 (Array (_ BitVec 32) (_ BitVec 64))) (size!28949 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59210)

(declare-fun array_inv!22124 (array!59210) Bool)

(assert (=> start!82780 (array_inv!22124 _keys!1686)))

(assert (=> start!82780 tp!65356))

(declare-fun tp_is_empty!21547 () Bool)

(assert (=> start!82780 tp_is_empty!21547))

(declare-fun b!963768 () Bool)

(declare-fun res!644723 () Bool)

(assert (=> b!963768 (=> (not res!644723) (not e!543553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59210 (_ BitVec 32)) Bool)

(assert (=> b!963768 (= res!644723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34315 () Bool)

(declare-fun mapRes!34315 () Bool)

(assert (=> mapIsEmpty!34315 mapRes!34315))

(declare-fun b!963769 () Bool)

(declare-fun res!644727 () Bool)

(assert (=> b!963769 (=> (not res!644727) (not e!543553))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963769 (= res!644727 (validKeyInArray!0 (select (arr!28469 _keys!1686) i!803)))))

(declare-fun b!963770 () Bool)

(declare-fun e!543557 () Bool)

(assert (=> b!963770 (= e!543556 (and e!543557 mapRes!34315))))

(declare-fun condMapEmpty!34315 () Bool)

(declare-fun mapDefault!34315 () ValueCell!10292)

(assert (=> b!963770 (= condMapEmpty!34315 (= (arr!28468 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10292)) mapDefault!34315)))))

(declare-fun b!963771 () Bool)

(declare-fun res!644724 () Bool)

(assert (=> b!963771 (=> (not res!644724) (not e!543553))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!963771 (= res!644724 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28949 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28949 _keys!1686))))))

(declare-fun b!963772 () Bool)

(declare-fun res!644725 () Bool)

(assert (=> b!963772 (=> (not res!644725) (not e!543553))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33713)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33713)

(declare-datatypes ((tuple2!13886 0))(
  ( (tuple2!13887 (_1!6954 (_ BitVec 64)) (_2!6954 V!33713)) )
))
(declare-datatypes ((List!19738 0))(
  ( (Nil!19735) (Cons!19734 (h!20902 tuple2!13886) (t!28093 List!19738)) )
))
(declare-datatypes ((ListLongMap!12585 0))(
  ( (ListLongMap!12586 (toList!6308 List!19738)) )
))
(declare-fun contains!5423 (ListLongMap!12585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3541 (array!59210 array!59208 (_ BitVec 32) (_ BitVec 32) V!33713 V!33713 (_ BitVec 32) Int) ListLongMap!12585)

(assert (=> b!963772 (= res!644725 (contains!5423 (getCurrentListMap!3541 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28469 _keys!1686) i!803)))))

(declare-fun b!963773 () Bool)

(declare-fun e!543554 () Bool)

(assert (=> b!963773 (= e!543554 tp_is_empty!21547)))

(declare-fun b!963774 () Bool)

(assert (=> b!963774 (= e!543557 tp_is_empty!21547)))

(declare-fun b!963775 () Bool)

(declare-fun res!644722 () Bool)

(assert (=> b!963775 (=> (not res!644722) (not e!543553))))

(declare-datatypes ((List!19739 0))(
  ( (Nil!19736) (Cons!19735 (h!20903 (_ BitVec 64)) (t!28094 List!19739)) )
))
(declare-fun arrayNoDuplicates!0 (array!59210 (_ BitVec 32) List!19739) Bool)

(assert (=> b!963775 (= res!644722 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19736))))

(declare-fun b!963776 () Bool)

(declare-fun res!644720 () Bool)

(assert (=> b!963776 (=> (not res!644720) (not e!543553))))

(assert (=> b!963776 (= res!644720 (and (= (size!28948 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28949 _keys!1686) (size!28948 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963777 () Bool)

(assert (=> b!963777 (= e!543553 (not true))))

(assert (=> b!963777 (contains!5423 (getCurrentListMap!3541 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28469 _keys!1686) i!803))))

(declare-datatypes ((Unit!32178 0))(
  ( (Unit!32179) )
))
(declare-fun lt!431282 () Unit!32178)

(declare-fun lemmaInListMapFromThenInFromMinusOne!3 (array!59210 array!59208 (_ BitVec 32) (_ BitVec 32) V!33713 V!33713 (_ BitVec 32) (_ BitVec 32) Int) Unit!32178)

(assert (=> b!963777 (= lt!431282 (lemmaInListMapFromThenInFromMinusOne!3 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963778 () Bool)

(declare-fun res!644726 () Bool)

(assert (=> b!963778 (=> (not res!644726) (not e!543553))))

(assert (=> b!963778 (= res!644726 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34315 () Bool)

(declare-fun tp!65355 () Bool)

(assert (=> mapNonEmpty!34315 (= mapRes!34315 (and tp!65355 e!543554))))

(declare-fun mapRest!34315 () (Array (_ BitVec 32) ValueCell!10292))

(declare-fun mapKey!34315 () (_ BitVec 32))

(declare-fun mapValue!34315 () ValueCell!10292)

(assert (=> mapNonEmpty!34315 (= (arr!28468 _values!1400) (store mapRest!34315 mapKey!34315 mapValue!34315))))

(assert (= (and start!82780 res!644721) b!963776))

(assert (= (and b!963776 res!644720) b!963768))

(assert (= (and b!963768 res!644723) b!963775))

(assert (= (and b!963775 res!644722) b!963771))

(assert (= (and b!963771 res!644724) b!963769))

(assert (= (and b!963769 res!644727) b!963772))

(assert (= (and b!963772 res!644725) b!963778))

(assert (= (and b!963778 res!644726) b!963777))

(assert (= (and b!963770 condMapEmpty!34315) mapIsEmpty!34315))

(assert (= (and b!963770 (not condMapEmpty!34315)) mapNonEmpty!34315))

(get-info :version)

(assert (= (and mapNonEmpty!34315 ((_ is ValueCellFull!10292) mapValue!34315)) b!963773))

(assert (= (and b!963770 ((_ is ValueCellFull!10292) mapDefault!34315)) b!963774))

(assert (= start!82780 b!963770))

(declare-fun m!893701 () Bool)

(assert (=> b!963772 m!893701))

(declare-fun m!893703 () Bool)

(assert (=> b!963772 m!893703))

(assert (=> b!963772 m!893701))

(assert (=> b!963772 m!893703))

(declare-fun m!893705 () Bool)

(assert (=> b!963772 m!893705))

(declare-fun m!893707 () Bool)

(assert (=> b!963768 m!893707))

(declare-fun m!893709 () Bool)

(assert (=> mapNonEmpty!34315 m!893709))

(declare-fun m!893711 () Bool)

(assert (=> start!82780 m!893711))

(declare-fun m!893713 () Bool)

(assert (=> start!82780 m!893713))

(declare-fun m!893715 () Bool)

(assert (=> start!82780 m!893715))

(declare-fun m!893717 () Bool)

(assert (=> b!963775 m!893717))

(declare-fun m!893719 () Bool)

(assert (=> b!963777 m!893719))

(assert (=> b!963777 m!893703))

(assert (=> b!963777 m!893719))

(assert (=> b!963777 m!893703))

(declare-fun m!893721 () Bool)

(assert (=> b!963777 m!893721))

(declare-fun m!893723 () Bool)

(assert (=> b!963777 m!893723))

(assert (=> b!963769 m!893703))

(assert (=> b!963769 m!893703))

(declare-fun m!893725 () Bool)

(assert (=> b!963769 m!893725))

(check-sat (not b_next!18745) (not b!963777) (not b!963769) (not mapNonEmpty!34315) (not b!963768) tp_is_empty!21547 (not b!963775) b_and!30243 (not start!82780) (not b!963772))
(check-sat b_and!30243 (not b_next!18745))
