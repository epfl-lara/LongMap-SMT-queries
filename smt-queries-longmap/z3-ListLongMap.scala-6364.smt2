; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81922 () Bool)

(assert start!81922)

(declare-fun b_free!18417 () Bool)

(declare-fun b_next!18417 () Bool)

(assert (=> start!81922 (= b_free!18417 (not b_next!18417))))

(declare-fun tp!63951 () Bool)

(declare-fun b_and!29903 () Bool)

(assert (=> start!81922 (= tp!63951 b_and!29903)))

(declare-fun b!955558 () Bool)

(declare-fun e!538315 () Bool)

(declare-fun tp_is_empty!20961 () Bool)

(assert (=> b!955558 (= e!538315 tp_is_empty!20961)))

(declare-fun b!955559 () Bool)

(declare-fun e!538318 () Bool)

(assert (=> b!955559 (= e!538318 tp_is_empty!20961)))

(declare-fun b!955560 () Bool)

(declare-fun res!639897 () Bool)

(declare-fun e!538314 () Bool)

(assert (=> b!955560 (=> (not res!639897) (not e!538314))))

(declare-datatypes ((array!58027 0))(
  ( (array!58028 (arr!27893 (Array (_ BitVec 32) (_ BitVec 64))) (size!28372 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58027)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955560 (= res!639897 (validKeyInArray!0 (select (arr!27893 _keys!1441) i!735)))))

(declare-fun b!955561 () Bool)

(assert (=> b!955561 (= e!538314 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32931 0))(
  ( (V!32932 (val!10531 Int)) )
))
(declare-fun zeroValue!1139 () V!32931)

(declare-datatypes ((ValueCell!9999 0))(
  ( (ValueCellFull!9999 (v!13086 V!32931)) (EmptyCell!9999) )
))
(declare-datatypes ((array!58029 0))(
  ( (array!58030 (arr!27894 (Array (_ BitVec 32) ValueCell!9999)) (size!28373 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58029)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32931)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13668 0))(
  ( (tuple2!13669 (_1!6845 (_ BitVec 64)) (_2!6845 V!32931)) )
))
(declare-datatypes ((List!19441 0))(
  ( (Nil!19438) (Cons!19437 (h!20599 tuple2!13668) (t!27802 List!19441)) )
))
(declare-datatypes ((ListLongMap!12365 0))(
  ( (ListLongMap!12366 (toList!6198 List!19441)) )
))
(declare-fun contains!5296 (ListLongMap!12365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3431 (array!58027 array!58029 (_ BitVec 32) (_ BitVec 32) V!32931 V!32931 (_ BitVec 32) Int) ListLongMap!12365)

(assert (=> b!955561 (contains!5296 (getCurrentListMap!3431 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27893 _keys!1441) i!735))))

(declare-datatypes ((Unit!32117 0))(
  ( (Unit!32118) )
))
(declare-fun lt!430019 () Unit!32117)

(declare-fun lemmaInListMapFromThenFromZero!13 (array!58027 array!58029 (_ BitVec 32) (_ BitVec 32) V!32931 V!32931 (_ BitVec 32) (_ BitVec 32) Int) Unit!32117)

(assert (=> b!955561 (= lt!430019 (lemmaInListMapFromThenFromZero!13 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955562 () Bool)

(declare-fun res!639898 () Bool)

(assert (=> b!955562 (=> (not res!639898) (not e!538314))))

(declare-datatypes ((List!19442 0))(
  ( (Nil!19439) (Cons!19438 (h!20600 (_ BitVec 64)) (t!27803 List!19442)) )
))
(declare-fun arrayNoDuplicates!0 (array!58027 (_ BitVec 32) List!19442) Bool)

(assert (=> b!955562 (= res!639898 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19439))))

(declare-fun b!955563 () Bool)

(declare-fun res!639899 () Bool)

(assert (=> b!955563 (=> (not res!639899) (not e!538314))))

(assert (=> b!955563 (= res!639899 (contains!5296 (getCurrentListMap!3431 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27893 _keys!1441) i!735)))))

(declare-fun b!955564 () Bool)

(declare-fun res!639900 () Bool)

(assert (=> b!955564 (=> (not res!639900) (not e!538314))))

(assert (=> b!955564 (= res!639900 (and (= (size!28373 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28372 _keys!1441) (size!28373 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!639901 () Bool)

(assert (=> start!81922 (=> (not res!639901) (not e!538314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81922 (= res!639901 (validMask!0 mask!1823))))

(assert (=> start!81922 e!538314))

(assert (=> start!81922 true))

(assert (=> start!81922 tp_is_empty!20961))

(declare-fun array_inv!21647 (array!58027) Bool)

(assert (=> start!81922 (array_inv!21647 _keys!1441)))

(declare-fun e!538317 () Bool)

(declare-fun array_inv!21648 (array!58029) Bool)

(assert (=> start!81922 (and (array_inv!21648 _values!1197) e!538317)))

(assert (=> start!81922 tp!63951))

(declare-fun b!955557 () Bool)

(declare-fun res!639902 () Bool)

(assert (=> b!955557 (=> (not res!639902) (not e!538314))))

(assert (=> b!955557 (= res!639902 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28372 _keys!1441))))))

(declare-fun mapIsEmpty!33403 () Bool)

(declare-fun mapRes!33403 () Bool)

(assert (=> mapIsEmpty!33403 mapRes!33403))

(declare-fun b!955565 () Bool)

(declare-fun res!639903 () Bool)

(assert (=> b!955565 (=> (not res!639903) (not e!538314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58027 (_ BitVec 32)) Bool)

(assert (=> b!955565 (= res!639903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33403 () Bool)

(declare-fun tp!63950 () Bool)

(assert (=> mapNonEmpty!33403 (= mapRes!33403 (and tp!63950 e!538318))))

(declare-fun mapRest!33403 () (Array (_ BitVec 32) ValueCell!9999))

(declare-fun mapValue!33403 () ValueCell!9999)

(declare-fun mapKey!33403 () (_ BitVec 32))

(assert (=> mapNonEmpty!33403 (= (arr!27894 _values!1197) (store mapRest!33403 mapKey!33403 mapValue!33403))))

(declare-fun b!955566 () Bool)

(assert (=> b!955566 (= e!538317 (and e!538315 mapRes!33403))))

(declare-fun condMapEmpty!33403 () Bool)

(declare-fun mapDefault!33403 () ValueCell!9999)

(assert (=> b!955566 (= condMapEmpty!33403 (= (arr!27894 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9999)) mapDefault!33403)))))

(assert (= (and start!81922 res!639901) b!955564))

(assert (= (and b!955564 res!639900) b!955565))

(assert (= (and b!955565 res!639903) b!955562))

(assert (= (and b!955562 res!639898) b!955557))

(assert (= (and b!955557 res!639902) b!955560))

(assert (= (and b!955560 res!639897) b!955563))

(assert (= (and b!955563 res!639899) b!955561))

(assert (= (and b!955566 condMapEmpty!33403) mapIsEmpty!33403))

(assert (= (and b!955566 (not condMapEmpty!33403)) mapNonEmpty!33403))

(get-info :version)

(assert (= (and mapNonEmpty!33403 ((_ is ValueCellFull!9999) mapValue!33403)) b!955559))

(assert (= (and b!955566 ((_ is ValueCellFull!9999) mapDefault!33403)) b!955558))

(assert (= start!81922 b!955566))

(declare-fun m!887059 () Bool)

(assert (=> b!955562 m!887059))

(declare-fun m!887061 () Bool)

(assert (=> b!955561 m!887061))

(declare-fun m!887063 () Bool)

(assert (=> b!955561 m!887063))

(assert (=> b!955561 m!887061))

(assert (=> b!955561 m!887063))

(declare-fun m!887065 () Bool)

(assert (=> b!955561 m!887065))

(declare-fun m!887067 () Bool)

(assert (=> b!955561 m!887067))

(declare-fun m!887069 () Bool)

(assert (=> mapNonEmpty!33403 m!887069))

(declare-fun m!887071 () Bool)

(assert (=> start!81922 m!887071))

(declare-fun m!887073 () Bool)

(assert (=> start!81922 m!887073))

(declare-fun m!887075 () Bool)

(assert (=> start!81922 m!887075))

(declare-fun m!887077 () Bool)

(assert (=> b!955563 m!887077))

(assert (=> b!955563 m!887063))

(assert (=> b!955563 m!887077))

(assert (=> b!955563 m!887063))

(declare-fun m!887079 () Bool)

(assert (=> b!955563 m!887079))

(declare-fun m!887081 () Bool)

(assert (=> b!955565 m!887081))

(assert (=> b!955560 m!887063))

(assert (=> b!955560 m!887063))

(declare-fun m!887083 () Bool)

(assert (=> b!955560 m!887083))

(check-sat (not b!955560) (not b_next!18417) b_and!29903 (not mapNonEmpty!33403) (not b!955565) tp_is_empty!20961 (not b!955562) (not b!955563) (not start!81922) (not b!955561))
(check-sat b_and!29903 (not b_next!18417))
