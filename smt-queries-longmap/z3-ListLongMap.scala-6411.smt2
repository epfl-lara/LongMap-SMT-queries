; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82264 () Bool)

(assert start!82264)

(declare-fun b_free!18537 () Bool)

(declare-fun b_next!18537 () Bool)

(assert (=> start!82264 (= b_free!18537 (not b_next!18537))))

(declare-fun tp!64572 () Bool)

(declare-fun b_and!30025 () Bool)

(assert (=> start!82264 (= tp!64572 b_and!30025)))

(declare-fun mapNonEmpty!33844 () Bool)

(declare-fun mapRes!33844 () Bool)

(declare-fun tp!64571 () Bool)

(declare-fun e!540600 () Bool)

(assert (=> mapNonEmpty!33844 (= mapRes!33844 (and tp!64571 e!540600))))

(declare-datatypes ((V!33307 0))(
  ( (V!33308 (val!10672 Int)) )
))
(declare-datatypes ((ValueCell!10140 0))(
  ( (ValueCellFull!10140 (v!13229 V!33307)) (EmptyCell!10140) )
))
(declare-fun mapValue!33844 () ValueCell!10140)

(declare-fun mapRest!33844 () (Array (_ BitVec 32) ValueCell!10140))

(declare-fun mapKey!33844 () (_ BitVec 32))

(declare-datatypes ((array!58585 0))(
  ( (array!58586 (arr!28166 (Array (_ BitVec 32) ValueCell!10140)) (size!28645 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58585)

(assert (=> mapNonEmpty!33844 (= (arr!28166 _values!1386) (store mapRest!33844 mapKey!33844 mapValue!33844))))

(declare-fun b!958942 () Bool)

(declare-fun res!641887 () Bool)

(declare-fun e!540599 () Bool)

(assert (=> b!958942 (=> (not res!641887) (not e!540599))))

(declare-datatypes ((array!58587 0))(
  ( (array!58588 (arr!28167 (Array (_ BitVec 32) (_ BitVec 64))) (size!28646 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58587)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958942 (= res!641887 (validKeyInArray!0 (select (arr!28167 _keys!1668) i!793)))))

(declare-fun b!958943 () Bool)

(declare-fun e!540597 () Bool)

(declare-fun e!540598 () Bool)

(assert (=> b!958943 (= e!540597 (and e!540598 mapRes!33844))))

(declare-fun condMapEmpty!33844 () Bool)

(declare-fun mapDefault!33844 () ValueCell!10140)

(assert (=> b!958943 (= condMapEmpty!33844 (= (arr!28166 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10140)) mapDefault!33844)))))

(declare-fun b!958944 () Bool)

(declare-fun tp_is_empty!21243 () Bool)

(assert (=> b!958944 (= e!540598 tp_is_empty!21243)))

(declare-fun mapIsEmpty!33844 () Bool)

(assert (=> mapIsEmpty!33844 mapRes!33844))

(declare-fun b!958945 () Bool)

(declare-fun res!641886 () Bool)

(assert (=> b!958945 (=> (not res!641886) (not e!540599))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33307)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33307)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13762 0))(
  ( (tuple2!13763 (_1!6892 (_ BitVec 64)) (_2!6892 V!33307)) )
))
(declare-datatypes ((List!19581 0))(
  ( (Nil!19578) (Cons!19577 (h!20739 tuple2!13762) (t!27944 List!19581)) )
))
(declare-datatypes ((ListLongMap!12459 0))(
  ( (ListLongMap!12460 (toList!6245 List!19581)) )
))
(declare-fun contains!5346 (ListLongMap!12459 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3478 (array!58587 array!58585 (_ BitVec 32) (_ BitVec 32) V!33307 V!33307 (_ BitVec 32) Int) ListLongMap!12459)

(assert (=> b!958945 (= res!641886 (contains!5346 (getCurrentListMap!3478 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28167 _keys!1668) i!793)))))

(declare-fun b!958946 () Bool)

(assert (=> b!958946 (= e!540600 tp_is_empty!21243)))

(declare-fun b!958947 () Bool)

(declare-fun res!641888 () Bool)

(assert (=> b!958947 (=> (not res!641888) (not e!540599))))

(assert (=> b!958947 (= res!641888 (and (= (size!28645 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28646 _keys!1668) (size!28645 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958948 () Bool)

(declare-fun res!641891 () Bool)

(assert (=> b!958948 (=> (not res!641891) (not e!540599))))

(declare-datatypes ((List!19582 0))(
  ( (Nil!19579) (Cons!19578 (h!20740 (_ BitVec 64)) (t!27945 List!19582)) )
))
(declare-fun arrayNoDuplicates!0 (array!58587 (_ BitVec 32) List!19582) Bool)

(assert (=> b!958948 (= res!641891 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19579))))

(declare-fun b!958949 () Bool)

(assert (=> b!958949 (= e!540599 (not true))))

(assert (=> b!958949 (contains!5346 (getCurrentListMap!3478 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28167 _keys!1668) i!793))))

(declare-datatypes ((Unit!32165 0))(
  ( (Unit!32166) )
))
(declare-fun lt!430497 () Unit!32165)

(declare-fun lemmaInListMapFromThenInFromSmaller!4 (array!58587 array!58585 (_ BitVec 32) (_ BitVec 32) V!33307 V!33307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32165)

(assert (=> b!958949 (= lt!430497 (lemmaInListMapFromThenInFromSmaller!4 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun res!641889 () Bool)

(assert (=> start!82264 (=> (not res!641889) (not e!540599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82264 (= res!641889 (validMask!0 mask!2088))))

(assert (=> start!82264 e!540599))

(assert (=> start!82264 true))

(assert (=> start!82264 tp_is_empty!21243))

(declare-fun array_inv!21839 (array!58587) Bool)

(assert (=> start!82264 (array_inv!21839 _keys!1668)))

(declare-fun array_inv!21840 (array!58585) Bool)

(assert (=> start!82264 (and (array_inv!21840 _values!1386) e!540597)))

(assert (=> start!82264 tp!64572))

(declare-fun b!958950 () Bool)

(declare-fun res!641885 () Bool)

(assert (=> b!958950 (=> (not res!641885) (not e!540599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58587 (_ BitVec 32)) Bool)

(assert (=> b!958950 (= res!641885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958951 () Bool)

(declare-fun res!641890 () Bool)

(assert (=> b!958951 (=> (not res!641890) (not e!540599))))

(assert (=> b!958951 (= res!641890 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28646 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28646 _keys!1668))))))

(assert (= (and start!82264 res!641889) b!958947))

(assert (= (and b!958947 res!641888) b!958950))

(assert (= (and b!958950 res!641885) b!958948))

(assert (= (and b!958948 res!641891) b!958951))

(assert (= (and b!958951 res!641890) b!958942))

(assert (= (and b!958942 res!641887) b!958945))

(assert (= (and b!958945 res!641886) b!958949))

(assert (= (and b!958943 condMapEmpty!33844) mapIsEmpty!33844))

(assert (= (and b!958943 (not condMapEmpty!33844)) mapNonEmpty!33844))

(get-info :version)

(assert (= (and mapNonEmpty!33844 ((_ is ValueCellFull!10140) mapValue!33844)) b!958946))

(assert (= (and b!958943 ((_ is ValueCellFull!10140) mapDefault!33844)) b!958944))

(assert (= start!82264 b!958943))

(declare-fun m!889501 () Bool)

(assert (=> b!958942 m!889501))

(assert (=> b!958942 m!889501))

(declare-fun m!889503 () Bool)

(assert (=> b!958942 m!889503))

(declare-fun m!889505 () Bool)

(assert (=> b!958950 m!889505))

(declare-fun m!889507 () Bool)

(assert (=> b!958945 m!889507))

(assert (=> b!958945 m!889501))

(assert (=> b!958945 m!889507))

(assert (=> b!958945 m!889501))

(declare-fun m!889509 () Bool)

(assert (=> b!958945 m!889509))

(declare-fun m!889511 () Bool)

(assert (=> start!82264 m!889511))

(declare-fun m!889513 () Bool)

(assert (=> start!82264 m!889513))

(declare-fun m!889515 () Bool)

(assert (=> start!82264 m!889515))

(declare-fun m!889517 () Bool)

(assert (=> b!958948 m!889517))

(declare-fun m!889519 () Bool)

(assert (=> b!958949 m!889519))

(assert (=> b!958949 m!889501))

(assert (=> b!958949 m!889519))

(assert (=> b!958949 m!889501))

(declare-fun m!889521 () Bool)

(assert (=> b!958949 m!889521))

(declare-fun m!889523 () Bool)

(assert (=> b!958949 m!889523))

(declare-fun m!889525 () Bool)

(assert (=> mapNonEmpty!33844 m!889525))

(check-sat (not b_next!18537) (not b!958950) tp_is_empty!21243 (not b!958942) b_and!30025 (not b!958949) (not b!958948) (not b!958945) (not mapNonEmpty!33844) (not start!82264))
(check-sat b_and!30025 (not b_next!18537))
