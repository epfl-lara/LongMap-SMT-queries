; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82660 () Bool)

(assert start!82660)

(declare-fun b_free!18811 () Bool)

(declare-fun b_next!18811 () Bool)

(assert (=> start!82660 (= b_free!18811 (not b_next!18811))))

(declare-fun tp!65554 () Bool)

(declare-fun b_and!30273 () Bool)

(assert (=> start!82660 (= tp!65554 b_and!30273)))

(declare-fun b!963717 () Bool)

(declare-fun e!543325 () Bool)

(declare-fun tp_is_empty!21613 () Bool)

(assert (=> b!963717 (= e!543325 tp_is_empty!21613)))

(declare-fun b!963718 () Bool)

(declare-fun res!645065 () Bool)

(declare-fun e!543323 () Bool)

(assert (=> b!963718 (=> (not res!645065) (not e!543323))))

(declare-datatypes ((array!59250 0))(
  ( (array!59251 (arr!28494 (Array (_ BitVec 32) (_ BitVec 64))) (size!28975 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59250)

(declare-datatypes ((List!19824 0))(
  ( (Nil!19821) (Cons!19820 (h!20982 (_ BitVec 64)) (t!28178 List!19824)) )
))
(declare-fun arrayNoDuplicates!0 (array!59250 (_ BitVec 32) List!19824) Bool)

(assert (=> b!963718 (= res!645065 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19821))))

(declare-fun b!963719 () Bool)

(declare-fun e!543322 () Bool)

(assert (=> b!963719 (= e!543323 (not e!543322))))

(declare-fun res!645066 () Bool)

(assert (=> b!963719 (=> res!645066 e!543322)))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963719 (= res!645066 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!28975 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33801 0))(
  ( (V!33802 (val!10857 Int)) )
))
(declare-datatypes ((ValueCell!10325 0))(
  ( (ValueCellFull!10325 (v!13414 V!33801)) (EmptyCell!10325) )
))
(declare-datatypes ((array!59252 0))(
  ( (array!59253 (arr!28495 (Array (_ BitVec 32) ValueCell!10325)) (size!28976 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59252)

(declare-fun minValue!1342 () V!33801)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33801)

(declare-datatypes ((tuple2!14016 0))(
  ( (tuple2!14017 (_1!7019 (_ BitVec 64)) (_2!7019 V!33801)) )
))
(declare-datatypes ((List!19825 0))(
  ( (Nil!19822) (Cons!19821 (h!20983 tuple2!14016) (t!28179 List!19825)) )
))
(declare-datatypes ((ListLongMap!12703 0))(
  ( (ListLongMap!12704 (toList!6367 List!19825)) )
))
(declare-fun contains!5414 (ListLongMap!12703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3529 (array!59250 array!59252 (_ BitVec 32) (_ BitVec 32) V!33801 V!33801 (_ BitVec 32) Int) ListLongMap!12703)

(assert (=> b!963719 (contains!5414 (getCurrentListMap!3529 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28494 _keys!1686) i!803))))

(declare-datatypes ((Unit!32120 0))(
  ( (Unit!32121) )
))
(declare-fun lt!430787 () Unit!32120)

(declare-fun lemmaInListMapFromThenInFromMinusOne!26 (array!59250 array!59252 (_ BitVec 32) (_ BitVec 32) V!33801 V!33801 (_ BitVec 32) (_ BitVec 32) Int) Unit!32120)

(assert (=> b!963719 (= lt!430787 (lemmaInListMapFromThenInFromMinusOne!26 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34414 () Bool)

(declare-fun mapRes!34414 () Bool)

(assert (=> mapIsEmpty!34414 mapRes!34414))

(declare-fun b!963720 () Bool)

(declare-fun res!645067 () Bool)

(assert (=> b!963720 (=> (not res!645067) (not e!543323))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963720 (= res!645067 (bvsgt from!2084 newFrom!159))))

(declare-fun res!645062 () Bool)

(assert (=> start!82660 (=> (not res!645062) (not e!543323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82660 (= res!645062 (validMask!0 mask!2110))))

(assert (=> start!82660 e!543323))

(assert (=> start!82660 true))

(declare-fun e!543324 () Bool)

(declare-fun array_inv!22133 (array!59252) Bool)

(assert (=> start!82660 (and (array_inv!22133 _values!1400) e!543324)))

(declare-fun array_inv!22134 (array!59250) Bool)

(assert (=> start!82660 (array_inv!22134 _keys!1686)))

(assert (=> start!82660 tp!65554))

(assert (=> start!82660 tp_is_empty!21613))

(declare-fun b!963721 () Bool)

(declare-fun res!645068 () Bool)

(assert (=> b!963721 (=> (not res!645068) (not e!543323))))

(assert (=> b!963721 (= res!645068 (contains!5414 (getCurrentListMap!3529 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28494 _keys!1686) i!803)))))

(declare-fun b!963722 () Bool)

(assert (=> b!963722 (= e!543322 true)))

(assert (=> b!963722 (contains!5414 (getCurrentListMap!3529 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28494 _keys!1686) i!803))))

(declare-fun lt!430786 () Unit!32120)

(declare-fun lemmaInListMapFromThenInFromSmaller!22 (array!59250 array!59252 (_ BitVec 32) (_ BitVec 32) V!33801 V!33801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32120)

(assert (=> b!963722 (= lt!430786 (lemmaInListMapFromThenInFromSmaller!22 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34414 () Bool)

(declare-fun tp!65553 () Bool)

(declare-fun e!543320 () Bool)

(assert (=> mapNonEmpty!34414 (= mapRes!34414 (and tp!65553 e!543320))))

(declare-fun mapValue!34414 () ValueCell!10325)

(declare-fun mapRest!34414 () (Array (_ BitVec 32) ValueCell!10325))

(declare-fun mapKey!34414 () (_ BitVec 32))

(assert (=> mapNonEmpty!34414 (= (arr!28495 _values!1400) (store mapRest!34414 mapKey!34414 mapValue!34414))))

(declare-fun b!963723 () Bool)

(declare-fun res!645060 () Bool)

(assert (=> b!963723 (=> (not res!645060) (not e!543323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59250 (_ BitVec 32)) Bool)

(assert (=> b!963723 (= res!645060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963724 () Bool)

(declare-fun res!645064 () Bool)

(assert (=> b!963724 (=> (not res!645064) (not e!543323))))

(assert (=> b!963724 (= res!645064 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28975 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28975 _keys!1686))))))

(declare-fun b!963725 () Bool)

(assert (=> b!963725 (= e!543324 (and e!543325 mapRes!34414))))

(declare-fun condMapEmpty!34414 () Bool)

(declare-fun mapDefault!34414 () ValueCell!10325)

(assert (=> b!963725 (= condMapEmpty!34414 (= (arr!28495 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10325)) mapDefault!34414)))))

(declare-fun b!963726 () Bool)

(declare-fun res!645063 () Bool)

(assert (=> b!963726 (=> (not res!645063) (not e!543323))))

(assert (=> b!963726 (= res!645063 (and (= (size!28976 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28975 _keys!1686) (size!28976 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963727 () Bool)

(declare-fun res!645061 () Bool)

(assert (=> b!963727 (=> (not res!645061) (not e!543323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963727 (= res!645061 (validKeyInArray!0 (select (arr!28494 _keys!1686) i!803)))))

(declare-fun b!963728 () Bool)

(assert (=> b!963728 (= e!543320 tp_is_empty!21613)))

(assert (= (and start!82660 res!645062) b!963726))

(assert (= (and b!963726 res!645063) b!963723))

(assert (= (and b!963723 res!645060) b!963718))

(assert (= (and b!963718 res!645065) b!963724))

(assert (= (and b!963724 res!645064) b!963727))

(assert (= (and b!963727 res!645061) b!963721))

(assert (= (and b!963721 res!645068) b!963720))

(assert (= (and b!963720 res!645067) b!963719))

(assert (= (and b!963719 (not res!645066)) b!963722))

(assert (= (and b!963725 condMapEmpty!34414) mapIsEmpty!34414))

(assert (= (and b!963725 (not condMapEmpty!34414)) mapNonEmpty!34414))

(get-info :version)

(assert (= (and mapNonEmpty!34414 ((_ is ValueCellFull!10325) mapValue!34414)) b!963728))

(assert (= (and b!963725 ((_ is ValueCellFull!10325) mapDefault!34414)) b!963717))

(assert (= start!82660 b!963725))

(declare-fun m!892507 () Bool)

(assert (=> b!963721 m!892507))

(declare-fun m!892509 () Bool)

(assert (=> b!963721 m!892509))

(assert (=> b!963721 m!892507))

(assert (=> b!963721 m!892509))

(declare-fun m!892511 () Bool)

(assert (=> b!963721 m!892511))

(declare-fun m!892513 () Bool)

(assert (=> b!963718 m!892513))

(declare-fun m!892515 () Bool)

(assert (=> b!963723 m!892515))

(declare-fun m!892517 () Bool)

(assert (=> b!963719 m!892517))

(assert (=> b!963719 m!892509))

(assert (=> b!963719 m!892517))

(assert (=> b!963719 m!892509))

(declare-fun m!892519 () Bool)

(assert (=> b!963719 m!892519))

(declare-fun m!892521 () Bool)

(assert (=> b!963719 m!892521))

(declare-fun m!892523 () Bool)

(assert (=> b!963722 m!892523))

(assert (=> b!963722 m!892509))

(assert (=> b!963722 m!892523))

(assert (=> b!963722 m!892509))

(declare-fun m!892525 () Bool)

(assert (=> b!963722 m!892525))

(declare-fun m!892527 () Bool)

(assert (=> b!963722 m!892527))

(declare-fun m!892529 () Bool)

(assert (=> start!82660 m!892529))

(declare-fun m!892531 () Bool)

(assert (=> start!82660 m!892531))

(declare-fun m!892533 () Bool)

(assert (=> start!82660 m!892533))

(declare-fun m!892535 () Bool)

(assert (=> mapNonEmpty!34414 m!892535))

(assert (=> b!963727 m!892509))

(assert (=> b!963727 m!892509))

(declare-fun m!892537 () Bool)

(assert (=> b!963727 m!892537))

(check-sat (not b!963718) (not b!963723) (not b!963727) b_and!30273 (not b!963721) (not mapNonEmpty!34414) (not start!82660) (not b!963722) (not b_next!18811) (not b!963719) tp_is_empty!21613)
(check-sat b_and!30273 (not b_next!18811))
