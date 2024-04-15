; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81890 () Bool)

(assert start!81890)

(declare-fun b_free!18403 () Bool)

(declare-fun b_next!18403 () Bool)

(assert (=> start!81890 (= b_free!18403 (not b_next!18403))))

(declare-fun tp!63910 () Bool)

(declare-fun b_and!29863 () Bool)

(assert (=> start!81890 (= tp!63910 b_and!29863)))

(declare-fun res!639646 () Bool)

(declare-fun e!538061 () Bool)

(assert (=> start!81890 (=> (not res!639646) (not e!538061))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81890 (= res!639646 (validMask!0 mask!1823))))

(assert (=> start!81890 e!538061))

(assert (=> start!81890 true))

(declare-fun tp_is_empty!20947 () Bool)

(assert (=> start!81890 tp_is_empty!20947))

(declare-datatypes ((array!57954 0))(
  ( (array!57955 (arr!27857 (Array (_ BitVec 32) (_ BitVec 64))) (size!28338 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57954)

(declare-fun array_inv!21681 (array!57954) Bool)

(assert (=> start!81890 (array_inv!21681 _keys!1441)))

(declare-datatypes ((V!32913 0))(
  ( (V!32914 (val!10524 Int)) )
))
(declare-datatypes ((ValueCell!9992 0))(
  ( (ValueCellFull!9992 (v!13078 V!32913)) (EmptyCell!9992) )
))
(declare-datatypes ((array!57956 0))(
  ( (array!57957 (arr!27858 (Array (_ BitVec 32) ValueCell!9992)) (size!28339 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57956)

(declare-fun e!538065 () Bool)

(declare-fun array_inv!21682 (array!57956) Bool)

(assert (=> start!81890 (and (array_inv!21682 _values!1197) e!538065)))

(assert (=> start!81890 tp!63910))

(declare-fun b!955108 () Bool)

(declare-fun res!639640 () Bool)

(assert (=> b!955108 (=> (not res!639640) (not e!538061))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955108 (= res!639640 (validKeyInArray!0 (select (arr!27857 _keys!1441) i!735)))))

(declare-fun b!955109 () Bool)

(declare-fun res!639643 () Bool)

(assert (=> b!955109 (=> (not res!639643) (not e!538061))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32913)

(declare-fun minValue!1139 () V!32913)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13702 0))(
  ( (tuple2!13703 (_1!6862 (_ BitVec 64)) (_2!6862 V!32913)) )
))
(declare-datatypes ((List!19442 0))(
  ( (Nil!19439) (Cons!19438 (h!20600 tuple2!13702) (t!27794 List!19442)) )
))
(declare-datatypes ((ListLongMap!12389 0))(
  ( (ListLongMap!12390 (toList!6210 List!19442)) )
))
(declare-fun contains!5251 (ListLongMap!12389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3372 (array!57954 array!57956 (_ BitVec 32) (_ BitVec 32) V!32913 V!32913 (_ BitVec 32) Int) ListLongMap!12389)

(assert (=> b!955109 (= res!639643 (contains!5251 (getCurrentListMap!3372 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27857 _keys!1441) i!735)))))

(declare-fun b!955110 () Bool)

(declare-fun e!538062 () Bool)

(declare-fun mapRes!33382 () Bool)

(assert (=> b!955110 (= e!538065 (and e!538062 mapRes!33382))))

(declare-fun condMapEmpty!33382 () Bool)

(declare-fun mapDefault!33382 () ValueCell!9992)

(assert (=> b!955110 (= condMapEmpty!33382 (= (arr!27858 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9992)) mapDefault!33382)))))

(declare-fun b!955111 () Bool)

(declare-fun e!538063 () Bool)

(assert (=> b!955111 (= e!538063 tp_is_empty!20947)))

(declare-fun b!955112 () Bool)

(declare-fun res!639644 () Bool)

(assert (=> b!955112 (=> (not res!639644) (not e!538061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57954 (_ BitVec 32)) Bool)

(assert (=> b!955112 (= res!639644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955113 () Bool)

(declare-fun res!639642 () Bool)

(assert (=> b!955113 (=> (not res!639642) (not e!538061))))

(declare-datatypes ((List!19443 0))(
  ( (Nil!19440) (Cons!19439 (h!20601 (_ BitVec 64)) (t!27795 List!19443)) )
))
(declare-fun arrayNoDuplicates!0 (array!57954 (_ BitVec 32) List!19443) Bool)

(assert (=> b!955113 (= res!639642 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19440))))

(declare-fun b!955114 () Bool)

(assert (=> b!955114 (= e!538062 tp_is_empty!20947)))

(declare-fun b!955115 () Bool)

(assert (=> b!955115 (= e!538061 (not true))))

(assert (=> b!955115 (contains!5251 (getCurrentListMap!3372 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27857 _keys!1441) i!735))))

(declare-datatypes ((Unit!31970 0))(
  ( (Unit!31971) )
))
(declare-fun lt!429762 () Unit!31970)

(declare-fun lemmaInListMapFromThenFromZero!4 (array!57954 array!57956 (_ BitVec 32) (_ BitVec 32) V!32913 V!32913 (_ BitVec 32) (_ BitVec 32) Int) Unit!31970)

(assert (=> b!955115 (= lt!429762 (lemmaInListMapFromThenFromZero!4 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955116 () Bool)

(declare-fun res!639641 () Bool)

(assert (=> b!955116 (=> (not res!639641) (not e!538061))))

(assert (=> b!955116 (= res!639641 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28338 _keys!1441))))))

(declare-fun b!955117 () Bool)

(declare-fun res!639645 () Bool)

(assert (=> b!955117 (=> (not res!639645) (not e!538061))))

(assert (=> b!955117 (= res!639645 (and (= (size!28339 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28338 _keys!1441) (size!28339 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33382 () Bool)

(assert (=> mapIsEmpty!33382 mapRes!33382))

(declare-fun mapNonEmpty!33382 () Bool)

(declare-fun tp!63909 () Bool)

(assert (=> mapNonEmpty!33382 (= mapRes!33382 (and tp!63909 e!538063))))

(declare-fun mapKey!33382 () (_ BitVec 32))

(declare-fun mapRest!33382 () (Array (_ BitVec 32) ValueCell!9992))

(declare-fun mapValue!33382 () ValueCell!9992)

(assert (=> mapNonEmpty!33382 (= (arr!27858 _values!1197) (store mapRest!33382 mapKey!33382 mapValue!33382))))

(assert (= (and start!81890 res!639646) b!955117))

(assert (= (and b!955117 res!639645) b!955112))

(assert (= (and b!955112 res!639644) b!955113))

(assert (= (and b!955113 res!639642) b!955116))

(assert (= (and b!955116 res!639641) b!955108))

(assert (= (and b!955108 res!639640) b!955109))

(assert (= (and b!955109 res!639643) b!955115))

(assert (= (and b!955110 condMapEmpty!33382) mapIsEmpty!33382))

(assert (= (and b!955110 (not condMapEmpty!33382)) mapNonEmpty!33382))

(get-info :version)

(assert (= (and mapNonEmpty!33382 ((_ is ValueCellFull!9992) mapValue!33382)) b!955111))

(assert (= (and b!955110 ((_ is ValueCellFull!9992) mapDefault!33382)) b!955114))

(assert (= start!81890 b!955110))

(declare-fun m!886119 () Bool)

(assert (=> start!81890 m!886119))

(declare-fun m!886121 () Bool)

(assert (=> start!81890 m!886121))

(declare-fun m!886123 () Bool)

(assert (=> start!81890 m!886123))

(declare-fun m!886125 () Bool)

(assert (=> b!955109 m!886125))

(declare-fun m!886127 () Bool)

(assert (=> b!955109 m!886127))

(assert (=> b!955109 m!886125))

(assert (=> b!955109 m!886127))

(declare-fun m!886129 () Bool)

(assert (=> b!955109 m!886129))

(assert (=> b!955108 m!886127))

(assert (=> b!955108 m!886127))

(declare-fun m!886131 () Bool)

(assert (=> b!955108 m!886131))

(declare-fun m!886133 () Bool)

(assert (=> b!955112 m!886133))

(declare-fun m!886135 () Bool)

(assert (=> b!955115 m!886135))

(assert (=> b!955115 m!886127))

(assert (=> b!955115 m!886135))

(assert (=> b!955115 m!886127))

(declare-fun m!886137 () Bool)

(assert (=> b!955115 m!886137))

(declare-fun m!886139 () Bool)

(assert (=> b!955115 m!886139))

(declare-fun m!886141 () Bool)

(assert (=> b!955113 m!886141))

(declare-fun m!886143 () Bool)

(assert (=> mapNonEmpty!33382 m!886143))

(check-sat (not b_next!18403) (not b!955112) (not b!955109) (not mapNonEmpty!33382) (not b!955108) tp_is_empty!20947 b_and!29863 (not b!955113) (not b!955115) (not start!81890))
(check-sat b_and!29863 (not b_next!18403))
