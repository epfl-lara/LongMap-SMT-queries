; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79432 () Bool)

(assert start!79432)

(declare-fun b_free!17619 () Bool)

(declare-fun b_next!17619 () Bool)

(assert (=> start!79432 (= b_free!17619 (not b_next!17619))))

(declare-fun tp!61301 () Bool)

(declare-fun b_and!28797 () Bool)

(assert (=> start!79432 (= tp!61301 b_and!28797)))

(declare-fun mapNonEmpty!31950 () Bool)

(declare-fun mapRes!31950 () Bool)

(declare-fun tp!61300 () Bool)

(declare-fun e!524267 () Bool)

(assert (=> mapNonEmpty!31950 (= mapRes!31950 (and tp!61300 e!524267))))

(declare-datatypes ((V!31801 0))(
  ( (V!31802 (val!10114 Int)) )
))
(declare-datatypes ((ValueCell!9582 0))(
  ( (ValueCellFull!9582 (v!12633 V!31801)) (EmptyCell!9582) )
))
(declare-fun mapRest!31950 () (Array (_ BitVec 32) ValueCell!9582))

(declare-fun mapValue!31950 () ValueCell!9582)

(declare-datatypes ((array!56190 0))(
  ( (array!56191 (arr!27039 (Array (_ BitVec 32) ValueCell!9582)) (size!27498 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56190)

(declare-fun mapKey!31950 () (_ BitVec 32))

(assert (=> mapNonEmpty!31950 (= (arr!27039 _values!1231) (store mapRest!31950 mapKey!31950 mapValue!31950))))

(declare-fun b!933675 () Bool)

(declare-fun res!628889 () Bool)

(declare-fun e!524264 () Bool)

(assert (=> b!933675 (=> (not res!628889) (not e!524264))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56192 0))(
  ( (array!56193 (arr!27040 (Array (_ BitVec 32) (_ BitVec 64))) (size!27499 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56192)

(assert (=> b!933675 (= res!628889 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27499 _keys!1487))))))

(declare-fun res!628886 () Bool)

(assert (=> start!79432 (=> (not res!628886) (not e!524264))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79432 (= res!628886 (validMask!0 mask!1881))))

(assert (=> start!79432 e!524264))

(assert (=> start!79432 true))

(declare-fun tp_is_empty!20127 () Bool)

(assert (=> start!79432 tp_is_empty!20127))

(declare-fun e!524265 () Bool)

(declare-fun array_inv!21046 (array!56190) Bool)

(assert (=> start!79432 (and (array_inv!21046 _values!1231) e!524265)))

(assert (=> start!79432 tp!61301))

(declare-fun array_inv!21047 (array!56192) Bool)

(assert (=> start!79432 (array_inv!21047 _keys!1487)))

(declare-fun b!933676 () Bool)

(declare-fun e!524262 () Bool)

(assert (=> b!933676 (= e!524262 (not true))))

(declare-datatypes ((List!19041 0))(
  ( (Nil!19038) (Cons!19037 (h!20183 (_ BitVec 64)) (t!27204 List!19041)) )
))
(declare-fun arrayNoDuplicates!0 (array!56192 (_ BitVec 32) List!19041) Bool)

(assert (=> b!933676 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19038)))

(declare-datatypes ((Unit!31503 0))(
  ( (Unit!31504) )
))
(declare-fun lt!420521 () Unit!31503)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56192 (_ BitVec 32) (_ BitVec 32)) Unit!31503)

(assert (=> b!933676 (= lt!420521 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13258 0))(
  ( (tuple2!13259 (_1!6640 (_ BitVec 64)) (_2!6640 V!31801)) )
))
(declare-datatypes ((List!19042 0))(
  ( (Nil!19039) (Cons!19038 (h!20184 tuple2!13258) (t!27205 List!19042)) )
))
(declare-datatypes ((ListLongMap!11955 0))(
  ( (ListLongMap!11956 (toList!5993 List!19042)) )
))
(declare-fun lt!420522 () ListLongMap!11955)

(declare-fun lt!420523 () tuple2!13258)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5042 (ListLongMap!11955 (_ BitVec 64)) Bool)

(declare-fun +!2794 (ListLongMap!11955 tuple2!13258) ListLongMap!11955)

(assert (=> b!933676 (contains!5042 (+!2794 lt!420522 lt!420523) k0!1099)))

(declare-fun lt!420526 () Unit!31503)

(declare-fun lt!420524 () (_ BitVec 64))

(declare-fun lt!420527 () V!31801)

(declare-fun addStillContains!513 (ListLongMap!11955 (_ BitVec 64) V!31801 (_ BitVec 64)) Unit!31503)

(assert (=> b!933676 (= lt!420526 (addStillContains!513 lt!420522 lt!420524 lt!420527 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31801)

(declare-fun minValue!1173 () V!31801)

(declare-fun getCurrentListMap!3231 (array!56192 array!56190 (_ BitVec 32) (_ BitVec 32) V!31801 V!31801 (_ BitVec 32) Int) ListLongMap!11955)

(assert (=> b!933676 (= (getCurrentListMap!3231 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2794 (getCurrentListMap!3231 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420523))))

(assert (=> b!933676 (= lt!420523 (tuple2!13259 lt!420524 lt!420527))))

(declare-fun get!14226 (ValueCell!9582 V!31801) V!31801)

(declare-fun dynLambda!1583 (Int (_ BitVec 64)) V!31801)

(assert (=> b!933676 (= lt!420527 (get!14226 (select (arr!27039 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1583 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420525 () Unit!31503)

(declare-fun lemmaListMapRecursiveValidKeyArray!184 (array!56192 array!56190 (_ BitVec 32) (_ BitVec 32) V!31801 V!31801 (_ BitVec 32) Int) Unit!31503)

(assert (=> b!933676 (= lt!420525 (lemmaListMapRecursiveValidKeyArray!184 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31950 () Bool)

(assert (=> mapIsEmpty!31950 mapRes!31950))

(declare-fun b!933677 () Bool)

(declare-fun res!628892 () Bool)

(assert (=> b!933677 (=> (not res!628892) (not e!524264))))

(assert (=> b!933677 (= res!628892 (and (= (size!27498 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27499 _keys!1487) (size!27498 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933678 () Bool)

(declare-fun res!628890 () Bool)

(assert (=> b!933678 (=> (not res!628890) (not e!524264))))

(assert (=> b!933678 (= res!628890 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19038))))

(declare-fun b!933679 () Bool)

(declare-fun e!524266 () Bool)

(assert (=> b!933679 (= e!524266 e!524262)))

(declare-fun res!628893 () Bool)

(assert (=> b!933679 (=> (not res!628893) (not e!524262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933679 (= res!628893 (validKeyInArray!0 lt!420524))))

(assert (=> b!933679 (= lt!420524 (select (arr!27040 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933680 () Bool)

(assert (=> b!933680 (= e!524267 tp_is_empty!20127)))

(declare-fun b!933681 () Bool)

(declare-fun e!524263 () Bool)

(assert (=> b!933681 (= e!524265 (and e!524263 mapRes!31950))))

(declare-fun condMapEmpty!31950 () Bool)

(declare-fun mapDefault!31950 () ValueCell!9582)

(assert (=> b!933681 (= condMapEmpty!31950 (= (arr!27039 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9582)) mapDefault!31950)))))

(declare-fun b!933682 () Bool)

(declare-fun res!628891 () Bool)

(assert (=> b!933682 (=> (not res!628891) (not e!524266))))

(assert (=> b!933682 (= res!628891 (validKeyInArray!0 k0!1099))))

(declare-fun b!933683 () Bool)

(assert (=> b!933683 (= e!524264 e!524266)))

(declare-fun res!628887 () Bool)

(assert (=> b!933683 (=> (not res!628887) (not e!524266))))

(assert (=> b!933683 (= res!628887 (contains!5042 lt!420522 k0!1099))))

(assert (=> b!933683 (= lt!420522 (getCurrentListMap!3231 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933684 () Bool)

(declare-fun res!628894 () Bool)

(assert (=> b!933684 (=> (not res!628894) (not e!524264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56192 (_ BitVec 32)) Bool)

(assert (=> b!933684 (= res!628894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933685 () Bool)

(declare-fun res!628885 () Bool)

(assert (=> b!933685 (=> (not res!628885) (not e!524266))))

(declare-fun v!791 () V!31801)

(declare-fun apply!803 (ListLongMap!11955 (_ BitVec 64)) V!31801)

(assert (=> b!933685 (= res!628885 (= (apply!803 lt!420522 k0!1099) v!791))))

(declare-fun b!933686 () Bool)

(declare-fun res!628888 () Bool)

(assert (=> b!933686 (=> (not res!628888) (not e!524266))))

(assert (=> b!933686 (= res!628888 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933687 () Bool)

(assert (=> b!933687 (= e!524263 tp_is_empty!20127)))

(assert (= (and start!79432 res!628886) b!933677))

(assert (= (and b!933677 res!628892) b!933684))

(assert (= (and b!933684 res!628894) b!933678))

(assert (= (and b!933678 res!628890) b!933675))

(assert (= (and b!933675 res!628889) b!933683))

(assert (= (and b!933683 res!628887) b!933685))

(assert (= (and b!933685 res!628885) b!933686))

(assert (= (and b!933686 res!628888) b!933682))

(assert (= (and b!933682 res!628891) b!933679))

(assert (= (and b!933679 res!628893) b!933676))

(assert (= (and b!933681 condMapEmpty!31950) mapIsEmpty!31950))

(assert (= (and b!933681 (not condMapEmpty!31950)) mapNonEmpty!31950))

(get-info :version)

(assert (= (and mapNonEmpty!31950 ((_ is ValueCellFull!9582) mapValue!31950)) b!933680))

(assert (= (and b!933681 ((_ is ValueCellFull!9582) mapDefault!31950)) b!933687))

(assert (= start!79432 b!933681))

(declare-fun b_lambda!13953 () Bool)

(assert (=> (not b_lambda!13953) (not b!933676)))

(declare-fun t!27203 () Bool)

(declare-fun tb!6013 () Bool)

(assert (=> (and start!79432 (= defaultEntry!1235 defaultEntry!1235) t!27203) tb!6013))

(declare-fun result!11851 () Bool)

(assert (=> tb!6013 (= result!11851 tp_is_empty!20127)))

(assert (=> b!933676 t!27203))

(declare-fun b_and!28799 () Bool)

(assert (= b_and!28797 (and (=> t!27203 result!11851) b_and!28799)))

(declare-fun m!867847 () Bool)

(assert (=> b!933683 m!867847))

(declare-fun m!867849 () Bool)

(assert (=> b!933683 m!867849))

(declare-fun m!867851 () Bool)

(assert (=> start!79432 m!867851))

(declare-fun m!867853 () Bool)

(assert (=> start!79432 m!867853))

(declare-fun m!867855 () Bool)

(assert (=> start!79432 m!867855))

(declare-fun m!867857 () Bool)

(assert (=> b!933682 m!867857))

(declare-fun m!867859 () Bool)

(assert (=> b!933684 m!867859))

(declare-fun m!867861 () Bool)

(assert (=> b!933676 m!867861))

(declare-fun m!867863 () Bool)

(assert (=> b!933676 m!867863))

(declare-fun m!867865 () Bool)

(assert (=> b!933676 m!867865))

(declare-fun m!867867 () Bool)

(assert (=> b!933676 m!867867))

(declare-fun m!867869 () Bool)

(assert (=> b!933676 m!867869))

(declare-fun m!867871 () Bool)

(assert (=> b!933676 m!867871))

(assert (=> b!933676 m!867865))

(assert (=> b!933676 m!867867))

(declare-fun m!867873 () Bool)

(assert (=> b!933676 m!867873))

(declare-fun m!867875 () Bool)

(assert (=> b!933676 m!867875))

(assert (=> b!933676 m!867861))

(declare-fun m!867877 () Bool)

(assert (=> b!933676 m!867877))

(declare-fun m!867879 () Bool)

(assert (=> b!933676 m!867879))

(declare-fun m!867881 () Bool)

(assert (=> b!933676 m!867881))

(assert (=> b!933676 m!867869))

(declare-fun m!867883 () Bool)

(assert (=> b!933676 m!867883))

(declare-fun m!867885 () Bool)

(assert (=> b!933678 m!867885))

(declare-fun m!867887 () Bool)

(assert (=> b!933685 m!867887))

(declare-fun m!867889 () Bool)

(assert (=> b!933679 m!867889))

(declare-fun m!867891 () Bool)

(assert (=> b!933679 m!867891))

(declare-fun m!867893 () Bool)

(assert (=> mapNonEmpty!31950 m!867893))

(check-sat (not mapNonEmpty!31950) b_and!28799 (not b!933678) (not b!933685) (not start!79432) tp_is_empty!20127 (not b!933682) (not b!933679) (not b!933676) (not b_lambda!13953) (not b!933684) (not b_next!17619) (not b!933683))
(check-sat b_and!28799 (not b_next!17619))
