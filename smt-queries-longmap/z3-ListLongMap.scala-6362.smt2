; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82076 () Bool)

(assert start!82076)

(declare-fun b_free!18403 () Bool)

(declare-fun b_next!18403 () Bool)

(assert (=> start!82076 (= b_free!18403 (not b_next!18403))))

(declare-fun tp!63910 () Bool)

(declare-fun b_and!29899 () Bool)

(assert (=> start!82076 (= tp!63910 b_and!29899)))

(declare-fun b!956250 () Bool)

(declare-fun res!640097 () Bool)

(declare-fun e!538794 () Bool)

(assert (=> b!956250 (=> (not res!640097) (not e!538794))))

(declare-datatypes ((array!58048 0))(
  ( (array!58049 (arr!27899 (Array (_ BitVec 32) (_ BitVec 64))) (size!28379 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58048)

(declare-datatypes ((List!19435 0))(
  ( (Nil!19432) (Cons!19431 (h!20599 (_ BitVec 64)) (t!27788 List!19435)) )
))
(declare-fun arrayNoDuplicates!0 (array!58048 (_ BitVec 32) List!19435) Bool)

(assert (=> b!956250 (= res!640097 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19432))))

(declare-fun b!956251 () Bool)

(declare-fun res!640098 () Bool)

(assert (=> b!956251 (=> (not res!640098) (not e!538794))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956251 (= res!640098 (validKeyInArray!0 (select (arr!27899 _keys!1441) i!735)))))

(declare-fun b!956252 () Bool)

(declare-fun res!640094 () Bool)

(assert (=> b!956252 (=> (not res!640094) (not e!538794))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32913 0))(
  ( (V!32914 (val!10524 Int)) )
))
(declare-fun zeroValue!1139 () V!32913)

(declare-datatypes ((ValueCell!9992 0))(
  ( (ValueCellFull!9992 (v!13076 V!32913)) (EmptyCell!9992) )
))
(declare-datatypes ((array!58050 0))(
  ( (array!58051 (arr!27900 (Array (_ BitVec 32) ValueCell!9992)) (size!28380 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58050)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32913)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13652 0))(
  ( (tuple2!13653 (_1!6837 (_ BitVec 64)) (_2!6837 V!32913)) )
))
(declare-datatypes ((List!19436 0))(
  ( (Nil!19433) (Cons!19432 (h!20600 tuple2!13652) (t!27789 List!19436)) )
))
(declare-datatypes ((ListLongMap!12351 0))(
  ( (ListLongMap!12352 (toList!6191 List!19436)) )
))
(declare-fun contains!5300 (ListLongMap!12351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3424 (array!58048 array!58050 (_ BitVec 32) (_ BitVec 32) V!32913 V!32913 (_ BitVec 32) Int) ListLongMap!12351)

(assert (=> b!956252 (= res!640094 (contains!5300 (getCurrentListMap!3424 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27899 _keys!1441) i!735)))))

(declare-fun b!956253 () Bool)

(declare-fun res!640100 () Bool)

(assert (=> b!956253 (=> (not res!640100) (not e!538794))))

(assert (=> b!956253 (= res!640100 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28379 _keys!1441))))))

(declare-fun b!956254 () Bool)

(declare-fun e!538791 () Bool)

(declare-fun tp_is_empty!20947 () Bool)

(assert (=> b!956254 (= e!538791 tp_is_empty!20947)))

(declare-fun b!956255 () Bool)

(assert (=> b!956255 (= e!538794 (not true))))

(assert (=> b!956255 (contains!5300 (getCurrentListMap!3424 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27899 _keys!1441) i!735))))

(declare-datatypes ((Unit!32084 0))(
  ( (Unit!32085) )
))
(declare-fun lt!430359 () Unit!32084)

(declare-fun lemmaInListMapFromThenFromZero!7 (array!58048 array!58050 (_ BitVec 32) (_ BitVec 32) V!32913 V!32913 (_ BitVec 32) (_ BitVec 32) Int) Unit!32084)

(assert (=> b!956255 (= lt!430359 (lemmaInListMapFromThenFromZero!7 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956256 () Bool)

(declare-fun res!640099 () Bool)

(assert (=> b!956256 (=> (not res!640099) (not e!538794))))

(assert (=> b!956256 (= res!640099 (and (= (size!28380 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28379 _keys!1441) (size!28380 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33382 () Bool)

(declare-fun mapRes!33382 () Bool)

(assert (=> mapIsEmpty!33382 mapRes!33382))

(declare-fun res!640096 () Bool)

(assert (=> start!82076 (=> (not res!640096) (not e!538794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82076 (= res!640096 (validMask!0 mask!1823))))

(assert (=> start!82076 e!538794))

(assert (=> start!82076 true))

(assert (=> start!82076 tp_is_empty!20947))

(declare-fun array_inv!21727 (array!58048) Bool)

(assert (=> start!82076 (array_inv!21727 _keys!1441)))

(declare-fun e!538792 () Bool)

(declare-fun array_inv!21728 (array!58050) Bool)

(assert (=> start!82076 (and (array_inv!21728 _values!1197) e!538792)))

(assert (=> start!82076 tp!63910))

(declare-fun b!956257 () Bool)

(declare-fun e!538795 () Bool)

(assert (=> b!956257 (= e!538792 (and e!538795 mapRes!33382))))

(declare-fun condMapEmpty!33382 () Bool)

(declare-fun mapDefault!33382 () ValueCell!9992)

(assert (=> b!956257 (= condMapEmpty!33382 (= (arr!27900 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9992)) mapDefault!33382)))))

(declare-fun mapNonEmpty!33382 () Bool)

(declare-fun tp!63909 () Bool)

(assert (=> mapNonEmpty!33382 (= mapRes!33382 (and tp!63909 e!538791))))

(declare-fun mapRest!33382 () (Array (_ BitVec 32) ValueCell!9992))

(declare-fun mapValue!33382 () ValueCell!9992)

(declare-fun mapKey!33382 () (_ BitVec 32))

(assert (=> mapNonEmpty!33382 (= (arr!27900 _values!1197) (store mapRest!33382 mapKey!33382 mapValue!33382))))

(declare-fun b!956258 () Bool)

(assert (=> b!956258 (= e!538795 tp_is_empty!20947)))

(declare-fun b!956259 () Bool)

(declare-fun res!640095 () Bool)

(assert (=> b!956259 (=> (not res!640095) (not e!538794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58048 (_ BitVec 32)) Bool)

(assert (=> b!956259 (= res!640095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!82076 res!640096) b!956256))

(assert (= (and b!956256 res!640099) b!956259))

(assert (= (and b!956259 res!640095) b!956250))

(assert (= (and b!956250 res!640097) b!956253))

(assert (= (and b!956253 res!640100) b!956251))

(assert (= (and b!956251 res!640098) b!956252))

(assert (= (and b!956252 res!640094) b!956255))

(assert (= (and b!956257 condMapEmpty!33382) mapIsEmpty!33382))

(assert (= (and b!956257 (not condMapEmpty!33382)) mapNonEmpty!33382))

(get-info :version)

(assert (= (and mapNonEmpty!33382 ((_ is ValueCellFull!9992) mapValue!33382)) b!956254))

(assert (= (and b!956257 ((_ is ValueCellFull!9992) mapDefault!33382)) b!956258))

(assert (= start!82076 b!956257))

(declare-fun m!888171 () Bool)

(assert (=> mapNonEmpty!33382 m!888171))

(declare-fun m!888173 () Bool)

(assert (=> b!956252 m!888173))

(declare-fun m!888175 () Bool)

(assert (=> b!956252 m!888175))

(assert (=> b!956252 m!888173))

(assert (=> b!956252 m!888175))

(declare-fun m!888177 () Bool)

(assert (=> b!956252 m!888177))

(assert (=> b!956251 m!888175))

(assert (=> b!956251 m!888175))

(declare-fun m!888179 () Bool)

(assert (=> b!956251 m!888179))

(declare-fun m!888181 () Bool)

(assert (=> start!82076 m!888181))

(declare-fun m!888183 () Bool)

(assert (=> start!82076 m!888183))

(declare-fun m!888185 () Bool)

(assert (=> start!82076 m!888185))

(declare-fun m!888187 () Bool)

(assert (=> b!956255 m!888187))

(assert (=> b!956255 m!888175))

(assert (=> b!956255 m!888187))

(assert (=> b!956255 m!888175))

(declare-fun m!888189 () Bool)

(assert (=> b!956255 m!888189))

(declare-fun m!888191 () Bool)

(assert (=> b!956255 m!888191))

(declare-fun m!888193 () Bool)

(assert (=> b!956259 m!888193))

(declare-fun m!888195 () Bool)

(assert (=> b!956250 m!888195))

(check-sat (not b!956250) (not b!956255) (not b!956252) (not b_next!18403) (not mapNonEmpty!33382) (not start!82076) tp_is_empty!20947 (not b!956251) (not b!956259) b_and!29899)
(check-sat b_and!29899 (not b_next!18403))
