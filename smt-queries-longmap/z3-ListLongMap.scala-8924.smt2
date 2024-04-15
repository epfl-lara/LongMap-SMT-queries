; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108226 () Bool)

(assert start!108226)

(declare-fun b_free!27907 () Bool)

(declare-fun b_next!27907 () Bool)

(assert (=> start!108226 (= b_free!27907 (not b_next!27907))))

(declare-fun tp!98681 () Bool)

(declare-fun b_and!45949 () Bool)

(assert (=> start!108226 (= tp!98681 b_and!45949)))

(declare-fun b!1277877 () Bool)

(declare-fun res!849078 () Bool)

(declare-fun e!729858 () Bool)

(assert (=> b!1277877 (=> (not res!849078) (not e!729858))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83903 0))(
  ( (array!83904 (arr!40461 (Array (_ BitVec 32) (_ BitVec 64))) (size!41013 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83903)

(declare-datatypes ((V!49713 0))(
  ( (V!49714 (val!16803 Int)) )
))
(declare-datatypes ((ValueCell!15830 0))(
  ( (ValueCellFull!15830 (v!19401 V!49713)) (EmptyCell!15830) )
))
(declare-datatypes ((array!83905 0))(
  ( (array!83906 (arr!40462 (Array (_ BitVec 32) ValueCell!15830)) (size!41014 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83905)

(assert (=> b!1277877 (= res!849078 (and (= (size!41014 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41013 _keys!1427) (size!41014 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51722 () Bool)

(declare-fun mapRes!51722 () Bool)

(assert (=> mapIsEmpty!51722 mapRes!51722))

(declare-fun res!849077 () Bool)

(assert (=> start!108226 (=> (not res!849077) (not e!729858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108226 (= res!849077 (validMask!0 mask!1805))))

(assert (=> start!108226 e!729858))

(assert (=> start!108226 true))

(assert (=> start!108226 tp!98681))

(declare-fun tp_is_empty!33457 () Bool)

(assert (=> start!108226 tp_is_empty!33457))

(declare-fun e!729861 () Bool)

(declare-fun array_inv!30899 (array!83905) Bool)

(assert (=> start!108226 (and (array_inv!30899 _values!1187) e!729861)))

(declare-fun array_inv!30900 (array!83903) Bool)

(assert (=> start!108226 (array_inv!30900 _keys!1427)))

(declare-fun mapNonEmpty!51722 () Bool)

(declare-fun tp!98682 () Bool)

(declare-fun e!729862 () Bool)

(assert (=> mapNonEmpty!51722 (= mapRes!51722 (and tp!98682 e!729862))))

(declare-fun mapValue!51722 () ValueCell!15830)

(declare-fun mapRest!51722 () (Array (_ BitVec 32) ValueCell!15830))

(declare-fun mapKey!51722 () (_ BitVec 32))

(assert (=> mapNonEmpty!51722 (= (arr!40462 _values!1187) (store mapRest!51722 mapKey!51722 mapValue!51722))))

(declare-fun b!1277878 () Bool)

(assert (=> b!1277878 (= e!729858 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49713)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!575652 () Bool)

(declare-fun zeroValue!1129 () V!49713)

(declare-datatypes ((tuple2!21632 0))(
  ( (tuple2!21633 (_1!10827 (_ BitVec 64)) (_2!10827 V!49713)) )
))
(declare-datatypes ((List!28803 0))(
  ( (Nil!28800) (Cons!28799 (h!30008 tuple2!21632) (t!42335 List!28803)) )
))
(declare-datatypes ((ListLongMap!19289 0))(
  ( (ListLongMap!19290 (toList!9660 List!28803)) )
))
(declare-fun contains!7702 (ListLongMap!19289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4634 (array!83903 array!83905 (_ BitVec 32) (_ BitVec 32) V!49713 V!49713 (_ BitVec 32) Int) ListLongMap!19289)

(assert (=> b!1277878 (= lt!575652 (contains!7702 (getCurrentListMap!4634 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277879 () Bool)

(assert (=> b!1277879 (= e!729862 tp_is_empty!33457)))

(declare-fun b!1277880 () Bool)

(declare-fun res!849075 () Bool)

(assert (=> b!1277880 (=> (not res!849075) (not e!729858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83903 (_ BitVec 32)) Bool)

(assert (=> b!1277880 (= res!849075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277881 () Bool)

(declare-fun e!729860 () Bool)

(assert (=> b!1277881 (= e!729860 tp_is_empty!33457)))

(declare-fun b!1277882 () Bool)

(assert (=> b!1277882 (= e!729861 (and e!729860 mapRes!51722))))

(declare-fun condMapEmpty!51722 () Bool)

(declare-fun mapDefault!51722 () ValueCell!15830)

(assert (=> b!1277882 (= condMapEmpty!51722 (= (arr!40462 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15830)) mapDefault!51722)))))

(declare-fun b!1277883 () Bool)

(declare-fun res!849076 () Bool)

(assert (=> b!1277883 (=> (not res!849076) (not e!729858))))

(declare-datatypes ((List!28804 0))(
  ( (Nil!28801) (Cons!28800 (h!30009 (_ BitVec 64)) (t!42336 List!28804)) )
))
(declare-fun arrayNoDuplicates!0 (array!83903 (_ BitVec 32) List!28804) Bool)

(assert (=> b!1277883 (= res!849076 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28801))))

(assert (= (and start!108226 res!849077) b!1277877))

(assert (= (and b!1277877 res!849078) b!1277880))

(assert (= (and b!1277880 res!849075) b!1277883))

(assert (= (and b!1277883 res!849076) b!1277878))

(assert (= (and b!1277882 condMapEmpty!51722) mapIsEmpty!51722))

(assert (= (and b!1277882 (not condMapEmpty!51722)) mapNonEmpty!51722))

(get-info :version)

(assert (= (and mapNonEmpty!51722 ((_ is ValueCellFull!15830) mapValue!51722)) b!1277879))

(assert (= (and b!1277882 ((_ is ValueCellFull!15830) mapDefault!51722)) b!1277881))

(assert (= start!108226 b!1277882))

(declare-fun m!1172933 () Bool)

(assert (=> b!1277880 m!1172933))

(declare-fun m!1172935 () Bool)

(assert (=> start!108226 m!1172935))

(declare-fun m!1172937 () Bool)

(assert (=> start!108226 m!1172937))

(declare-fun m!1172939 () Bool)

(assert (=> start!108226 m!1172939))

(declare-fun m!1172941 () Bool)

(assert (=> b!1277883 m!1172941))

(declare-fun m!1172943 () Bool)

(assert (=> mapNonEmpty!51722 m!1172943))

(declare-fun m!1172945 () Bool)

(assert (=> b!1277878 m!1172945))

(assert (=> b!1277878 m!1172945))

(declare-fun m!1172947 () Bool)

(assert (=> b!1277878 m!1172947))

(check-sat (not start!108226) b_and!45949 (not b!1277883) (not b!1277880) tp_is_empty!33457 (not mapNonEmpty!51722) (not b!1277878) (not b_next!27907))
(check-sat b_and!45949 (not b_next!27907))
