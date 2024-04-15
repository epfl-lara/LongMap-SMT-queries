; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81884 () Bool)

(assert start!81884)

(declare-fun b_free!18397 () Bool)

(declare-fun b_next!18397 () Bool)

(assert (=> start!81884 (= b_free!18397 (not b_next!18397))))

(declare-fun tp!63892 () Bool)

(declare-fun b_and!29857 () Bool)

(assert (=> start!81884 (= tp!63892 b_and!29857)))

(declare-fun b!955018 () Bool)

(declare-fun res!639583 () Bool)

(declare-fun e!538020 () Bool)

(assert (=> b!955018 (=> (not res!639583) (not e!538020))))

(declare-datatypes ((array!57944 0))(
  ( (array!57945 (arr!27852 (Array (_ BitVec 32) (_ BitVec 64))) (size!28333 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57944)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955018 (= res!639583 (validKeyInArray!0 (select (arr!27852 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33373 () Bool)

(declare-fun mapRes!33373 () Bool)

(assert (=> mapIsEmpty!33373 mapRes!33373))

(declare-fun b!955019 () Bool)

(declare-fun res!639579 () Bool)

(assert (=> b!955019 (=> (not res!639579) (not e!538020))))

(declare-datatypes ((List!19440 0))(
  ( (Nil!19437) (Cons!19436 (h!20598 (_ BitVec 64)) (t!27792 List!19440)) )
))
(declare-fun arrayNoDuplicates!0 (array!57944 (_ BitVec 32) List!19440) Bool)

(assert (=> b!955019 (= res!639579 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19437))))

(declare-fun res!639577 () Bool)

(assert (=> start!81884 (=> (not res!639577) (not e!538020))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81884 (= res!639577 (validMask!0 mask!1823))))

(assert (=> start!81884 e!538020))

(assert (=> start!81884 true))

(declare-fun tp_is_empty!20941 () Bool)

(assert (=> start!81884 tp_is_empty!20941))

(declare-fun array_inv!21677 (array!57944) Bool)

(assert (=> start!81884 (array_inv!21677 _keys!1441)))

(declare-datatypes ((V!32905 0))(
  ( (V!32906 (val!10521 Int)) )
))
(declare-datatypes ((ValueCell!9989 0))(
  ( (ValueCellFull!9989 (v!13075 V!32905)) (EmptyCell!9989) )
))
(declare-datatypes ((array!57946 0))(
  ( (array!57947 (arr!27853 (Array (_ BitVec 32) ValueCell!9989)) (size!28334 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57946)

(declare-fun e!538016 () Bool)

(declare-fun array_inv!21678 (array!57946) Bool)

(assert (=> start!81884 (and (array_inv!21678 _values!1197) e!538016)))

(assert (=> start!81884 tp!63892))

(declare-fun b!955020 () Bool)

(declare-fun res!639582 () Bool)

(assert (=> b!955020 (=> (not res!639582) (not e!538020))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955020 (= res!639582 (and (= (size!28334 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28333 _keys!1441) (size!28334 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955021 () Bool)

(declare-fun res!639581 () Bool)

(assert (=> b!955021 (=> (not res!639581) (not e!538020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57944 (_ BitVec 32)) Bool)

(assert (=> b!955021 (= res!639581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955022 () Bool)

(declare-fun res!639578 () Bool)

(assert (=> b!955022 (=> (not res!639578) (not e!538020))))

(declare-fun zeroValue!1139 () V!32905)

(declare-fun minValue!1139 () V!32905)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13700 0))(
  ( (tuple2!13701 (_1!6861 (_ BitVec 64)) (_2!6861 V!32905)) )
))
(declare-datatypes ((List!19441 0))(
  ( (Nil!19438) (Cons!19437 (h!20599 tuple2!13700) (t!27793 List!19441)) )
))
(declare-datatypes ((ListLongMap!12387 0))(
  ( (ListLongMap!12388 (toList!6209 List!19441)) )
))
(declare-fun contains!5250 (ListLongMap!12387 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3371 (array!57944 array!57946 (_ BitVec 32) (_ BitVec 32) V!32905 V!32905 (_ BitVec 32) Int) ListLongMap!12387)

(assert (=> b!955022 (= res!639578 (contains!5250 (getCurrentListMap!3371 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27852 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33373 () Bool)

(declare-fun tp!63891 () Bool)

(declare-fun e!538018 () Bool)

(assert (=> mapNonEmpty!33373 (= mapRes!33373 (and tp!63891 e!538018))))

(declare-fun mapKey!33373 () (_ BitVec 32))

(declare-fun mapValue!33373 () ValueCell!9989)

(declare-fun mapRest!33373 () (Array (_ BitVec 32) ValueCell!9989))

(assert (=> mapNonEmpty!33373 (= (arr!27853 _values!1197) (store mapRest!33373 mapKey!33373 mapValue!33373))))

(declare-fun b!955023 () Bool)

(declare-fun e!538019 () Bool)

(assert (=> b!955023 (= e!538019 tp_is_empty!20941)))

(declare-fun b!955024 () Bool)

(assert (=> b!955024 (= e!538016 (and e!538019 mapRes!33373))))

(declare-fun condMapEmpty!33373 () Bool)

(declare-fun mapDefault!33373 () ValueCell!9989)

(assert (=> b!955024 (= condMapEmpty!33373 (= (arr!27853 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9989)) mapDefault!33373)))))

(declare-fun b!955025 () Bool)

(declare-fun res!639580 () Bool)

(assert (=> b!955025 (=> (not res!639580) (not e!538020))))

(assert (=> b!955025 (= res!639580 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28333 _keys!1441))))))

(declare-fun b!955026 () Bool)

(assert (=> b!955026 (= e!538020 (not true))))

(assert (=> b!955026 (contains!5250 (getCurrentListMap!3371 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27852 _keys!1441) i!735))))

(declare-datatypes ((Unit!31968 0))(
  ( (Unit!31969) )
))
(declare-fun lt!429753 () Unit!31968)

(declare-fun lemmaInListMapFromThenFromZero!3 (array!57944 array!57946 (_ BitVec 32) (_ BitVec 32) V!32905 V!32905 (_ BitVec 32) (_ BitVec 32) Int) Unit!31968)

(assert (=> b!955026 (= lt!429753 (lemmaInListMapFromThenFromZero!3 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955027 () Bool)

(assert (=> b!955027 (= e!538018 tp_is_empty!20941)))

(assert (= (and start!81884 res!639577) b!955020))

(assert (= (and b!955020 res!639582) b!955021))

(assert (= (and b!955021 res!639581) b!955019))

(assert (= (and b!955019 res!639579) b!955025))

(assert (= (and b!955025 res!639580) b!955018))

(assert (= (and b!955018 res!639583) b!955022))

(assert (= (and b!955022 res!639578) b!955026))

(assert (= (and b!955024 condMapEmpty!33373) mapIsEmpty!33373))

(assert (= (and b!955024 (not condMapEmpty!33373)) mapNonEmpty!33373))

(get-info :version)

(assert (= (and mapNonEmpty!33373 ((_ is ValueCellFull!9989) mapValue!33373)) b!955027))

(assert (= (and b!955024 ((_ is ValueCellFull!9989) mapDefault!33373)) b!955023))

(assert (= start!81884 b!955024))

(declare-fun m!886041 () Bool)

(assert (=> mapNonEmpty!33373 m!886041))

(declare-fun m!886043 () Bool)

(assert (=> b!955021 m!886043))

(declare-fun m!886045 () Bool)

(assert (=> b!955019 m!886045))

(declare-fun m!886047 () Bool)

(assert (=> b!955026 m!886047))

(declare-fun m!886049 () Bool)

(assert (=> b!955026 m!886049))

(assert (=> b!955026 m!886047))

(assert (=> b!955026 m!886049))

(declare-fun m!886051 () Bool)

(assert (=> b!955026 m!886051))

(declare-fun m!886053 () Bool)

(assert (=> b!955026 m!886053))

(declare-fun m!886055 () Bool)

(assert (=> start!81884 m!886055))

(declare-fun m!886057 () Bool)

(assert (=> start!81884 m!886057))

(declare-fun m!886059 () Bool)

(assert (=> start!81884 m!886059))

(declare-fun m!886061 () Bool)

(assert (=> b!955022 m!886061))

(assert (=> b!955022 m!886049))

(assert (=> b!955022 m!886061))

(assert (=> b!955022 m!886049))

(declare-fun m!886063 () Bool)

(assert (=> b!955022 m!886063))

(assert (=> b!955018 m!886049))

(assert (=> b!955018 m!886049))

(declare-fun m!886065 () Bool)

(assert (=> b!955018 m!886065))

(check-sat b_and!29857 (not b!955021) (not start!81884) (not b!955022) tp_is_empty!20941 (not b!955026) (not b!955018) (not b_next!18397) (not mapNonEmpty!33373) (not b!955019))
(check-sat b_and!29857 (not b_next!18397))
