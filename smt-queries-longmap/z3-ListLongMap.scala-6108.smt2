; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78924 () Bool)

(assert start!78924)

(declare-fun b_free!16969 () Bool)

(declare-fun b_next!16969 () Bool)

(assert (=> start!78924 (= b_free!16969 (not b_next!16969))))

(declare-fun tp!59348 () Bool)

(declare-fun b_and!27685 () Bool)

(assert (=> start!78924 (= tp!59348 b_and!27685)))

(declare-fun mapIsEmpty!30972 () Bool)

(declare-fun mapRes!30972 () Bool)

(assert (=> mapIsEmpty!30972 mapRes!30972))

(declare-fun b!919847 () Bool)

(declare-fun res!619944 () Bool)

(declare-fun e!516417 () Bool)

(assert (=> b!919847 (=> (not res!619944) (not e!516417))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54983 0))(
  ( (array!54984 (arr!26432 (Array (_ BitVec 32) (_ BitVec 64))) (size!26892 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54983)

(assert (=> b!919847 (= res!619944 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26892 _keys!1487))))))

(declare-fun b!919848 () Bool)

(declare-fun e!516421 () Bool)

(assert (=> b!919848 (= e!516421 (not true))))

(declare-datatypes ((V!30935 0))(
  ( (V!30936 (val!9789 Int)) )
))
(declare-datatypes ((tuple2!12696 0))(
  ( (tuple2!12697 (_1!6359 (_ BitVec 64)) (_2!6359 V!30935)) )
))
(declare-datatypes ((List!18514 0))(
  ( (Nil!18511) (Cons!18510 (h!19662 tuple2!12696) (t!26205 List!18514)) )
))
(declare-datatypes ((ListLongMap!11395 0))(
  ( (ListLongMap!11396 (toList!5713 List!18514)) )
))
(declare-fun lt!412818 () ListLongMap!11395)

(declare-fun lt!412822 () tuple2!12696)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4767 (ListLongMap!11395 (_ BitVec 64)) Bool)

(declare-fun +!2654 (ListLongMap!11395 tuple2!12696) ListLongMap!11395)

(assert (=> b!919848 (contains!4767 (+!2654 lt!412818 lt!412822) k0!1099)))

(declare-fun lt!412823 () V!30935)

(declare-fun lt!412820 () (_ BitVec 64))

(declare-datatypes ((Unit!31020 0))(
  ( (Unit!31021) )
))
(declare-fun lt!412821 () Unit!31020)

(declare-fun addStillContains!363 (ListLongMap!11395 (_ BitVec 64) V!30935 (_ BitVec 64)) Unit!31020)

(assert (=> b!919848 (= lt!412821 (addStillContains!363 lt!412818 lt!412820 lt!412823 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9257 0))(
  ( (ValueCellFull!9257 (v!12304 V!30935)) (EmptyCell!9257) )
))
(declare-datatypes ((array!54985 0))(
  ( (array!54986 (arr!26433 (Array (_ BitVec 32) ValueCell!9257)) (size!26893 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54985)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30935)

(declare-fun minValue!1173 () V!30935)

(declare-fun getCurrentListMap!2967 (array!54983 array!54985 (_ BitVec 32) (_ BitVec 32) V!30935 V!30935 (_ BitVec 32) Int) ListLongMap!11395)

(assert (=> b!919848 (= (getCurrentListMap!2967 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2654 (getCurrentListMap!2967 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412822))))

(assert (=> b!919848 (= lt!412822 (tuple2!12697 lt!412820 lt!412823))))

(declare-fun get!13879 (ValueCell!9257 V!30935) V!30935)

(declare-fun dynLambda!1451 (Int (_ BitVec 64)) V!30935)

(assert (=> b!919848 (= lt!412823 (get!13879 (select (arr!26433 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1451 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412819 () Unit!31020)

(declare-fun lemmaListMapRecursiveValidKeyArray!34 (array!54983 array!54985 (_ BitVec 32) (_ BitVec 32) V!30935 V!30935 (_ BitVec 32) Int) Unit!31020)

(assert (=> b!919848 (= lt!412819 (lemmaListMapRecursiveValidKeyArray!34 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919849 () Bool)

(declare-fun e!516419 () Bool)

(declare-fun tp_is_empty!19477 () Bool)

(assert (=> b!919849 (= e!516419 tp_is_empty!19477)))

(declare-fun res!619948 () Bool)

(assert (=> start!78924 (=> (not res!619948) (not e!516417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78924 (= res!619948 (validMask!0 mask!1881))))

(assert (=> start!78924 e!516417))

(assert (=> start!78924 true))

(assert (=> start!78924 tp_is_empty!19477))

(declare-fun e!516418 () Bool)

(declare-fun array_inv!20696 (array!54985) Bool)

(assert (=> start!78924 (and (array_inv!20696 _values!1231) e!516418)))

(assert (=> start!78924 tp!59348))

(declare-fun array_inv!20697 (array!54983) Bool)

(assert (=> start!78924 (array_inv!20697 _keys!1487)))

(declare-fun b!919850 () Bool)

(declare-fun res!619952 () Bool)

(declare-fun e!516420 () Bool)

(assert (=> b!919850 (=> (not res!619952) (not e!516420))))

(declare-fun v!791 () V!30935)

(declare-fun apply!587 (ListLongMap!11395 (_ BitVec 64)) V!30935)

(assert (=> b!919850 (= res!619952 (= (apply!587 lt!412818 k0!1099) v!791))))

(declare-fun b!919851 () Bool)

(declare-fun res!619949 () Bool)

(assert (=> b!919851 (=> (not res!619949) (not e!516417))))

(declare-datatypes ((List!18515 0))(
  ( (Nil!18512) (Cons!18511 (h!19663 (_ BitVec 64)) (t!26206 List!18515)) )
))
(declare-fun arrayNoDuplicates!0 (array!54983 (_ BitVec 32) List!18515) Bool)

(assert (=> b!919851 (= res!619949 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18512))))

(declare-fun b!919852 () Bool)

(declare-fun res!619945 () Bool)

(assert (=> b!919852 (=> (not res!619945) (not e!516417))))

(assert (=> b!919852 (= res!619945 (and (= (size!26893 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26892 _keys!1487) (size!26893 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919853 () Bool)

(declare-fun e!516416 () Bool)

(assert (=> b!919853 (= e!516416 tp_is_empty!19477)))

(declare-fun b!919854 () Bool)

(assert (=> b!919854 (= e!516417 e!516420)))

(declare-fun res!619946 () Bool)

(assert (=> b!919854 (=> (not res!619946) (not e!516420))))

(assert (=> b!919854 (= res!619946 (contains!4767 lt!412818 k0!1099))))

(assert (=> b!919854 (= lt!412818 (getCurrentListMap!2967 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919855 () Bool)

(declare-fun res!619947 () Bool)

(assert (=> b!919855 (=> (not res!619947) (not e!516417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54983 (_ BitVec 32)) Bool)

(assert (=> b!919855 (= res!619947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919856 () Bool)

(declare-fun res!619950 () Bool)

(assert (=> b!919856 (=> (not res!619950) (not e!516420))))

(assert (=> b!919856 (= res!619950 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919857 () Bool)

(declare-fun res!619953 () Bool)

(assert (=> b!919857 (=> (not res!619953) (not e!516420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919857 (= res!619953 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!30972 () Bool)

(declare-fun tp!59349 () Bool)

(assert (=> mapNonEmpty!30972 (= mapRes!30972 (and tp!59349 e!516416))))

(declare-fun mapRest!30972 () (Array (_ BitVec 32) ValueCell!9257))

(declare-fun mapKey!30972 () (_ BitVec 32))

(declare-fun mapValue!30972 () ValueCell!9257)

(assert (=> mapNonEmpty!30972 (= (arr!26433 _values!1231) (store mapRest!30972 mapKey!30972 mapValue!30972))))

(declare-fun b!919858 () Bool)

(assert (=> b!919858 (= e!516420 e!516421)))

(declare-fun res!619951 () Bool)

(assert (=> b!919858 (=> (not res!619951) (not e!516421))))

(assert (=> b!919858 (= res!619951 (validKeyInArray!0 lt!412820))))

(assert (=> b!919858 (= lt!412820 (select (arr!26432 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919859 () Bool)

(assert (=> b!919859 (= e!516418 (and e!516419 mapRes!30972))))

(declare-fun condMapEmpty!30972 () Bool)

(declare-fun mapDefault!30972 () ValueCell!9257)

(assert (=> b!919859 (= condMapEmpty!30972 (= (arr!26433 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9257)) mapDefault!30972)))))

(assert (= (and start!78924 res!619948) b!919852))

(assert (= (and b!919852 res!619945) b!919855))

(assert (= (and b!919855 res!619947) b!919851))

(assert (= (and b!919851 res!619949) b!919847))

(assert (= (and b!919847 res!619944) b!919854))

(assert (= (and b!919854 res!619946) b!919850))

(assert (= (and b!919850 res!619952) b!919856))

(assert (= (and b!919856 res!619950) b!919857))

(assert (= (and b!919857 res!619953) b!919858))

(assert (= (and b!919858 res!619951) b!919848))

(assert (= (and b!919859 condMapEmpty!30972) mapIsEmpty!30972))

(assert (= (and b!919859 (not condMapEmpty!30972)) mapNonEmpty!30972))

(get-info :version)

(assert (= (and mapNonEmpty!30972 ((_ is ValueCellFull!9257) mapValue!30972)) b!919853))

(assert (= (and b!919859 ((_ is ValueCellFull!9257) mapDefault!30972)) b!919849))

(assert (= start!78924 b!919859))

(declare-fun b_lambda!13485 () Bool)

(assert (=> (not b_lambda!13485) (not b!919848)))

(declare-fun t!26204 () Bool)

(declare-fun tb!5541 () Bool)

(assert (=> (and start!78924 (= defaultEntry!1235 defaultEntry!1235) t!26204) tb!5541))

(declare-fun result!10913 () Bool)

(assert (=> tb!5541 (= result!10913 tp_is_empty!19477)))

(assert (=> b!919848 t!26204))

(declare-fun b_and!27687 () Bool)

(assert (= b_and!27685 (and (=> t!26204 result!10913) b_and!27687)))

(declare-fun m!853945 () Bool)

(assert (=> b!919857 m!853945))

(declare-fun m!853947 () Bool)

(assert (=> b!919850 m!853947))

(declare-fun m!853949 () Bool)

(assert (=> b!919848 m!853949))

(declare-fun m!853951 () Bool)

(assert (=> b!919848 m!853951))

(declare-fun m!853953 () Bool)

(assert (=> b!919848 m!853953))

(declare-fun m!853955 () Bool)

(assert (=> b!919848 m!853955))

(declare-fun m!853957 () Bool)

(assert (=> b!919848 m!853957))

(declare-fun m!853959 () Bool)

(assert (=> b!919848 m!853959))

(assert (=> b!919848 m!853953))

(assert (=> b!919848 m!853959))

(declare-fun m!853961 () Bool)

(assert (=> b!919848 m!853961))

(declare-fun m!853963 () Bool)

(assert (=> b!919848 m!853963))

(declare-fun m!853965 () Bool)

(assert (=> b!919848 m!853965))

(assert (=> b!919848 m!853955))

(assert (=> b!919848 m!853949))

(declare-fun m!853967 () Bool)

(assert (=> b!919848 m!853967))

(declare-fun m!853969 () Bool)

(assert (=> b!919851 m!853969))

(declare-fun m!853971 () Bool)

(assert (=> b!919854 m!853971))

(declare-fun m!853973 () Bool)

(assert (=> b!919854 m!853973))

(declare-fun m!853975 () Bool)

(assert (=> b!919855 m!853975))

(declare-fun m!853977 () Bool)

(assert (=> mapNonEmpty!30972 m!853977))

(declare-fun m!853979 () Bool)

(assert (=> start!78924 m!853979))

(declare-fun m!853981 () Bool)

(assert (=> start!78924 m!853981))

(declare-fun m!853983 () Bool)

(assert (=> start!78924 m!853983))

(declare-fun m!853985 () Bool)

(assert (=> b!919858 m!853985))

(declare-fun m!853987 () Bool)

(assert (=> b!919858 m!853987))

(check-sat (not b!919854) (not b!919850) (not b!919857) (not b!919851) (not b_lambda!13485) (not b!919855) (not mapNonEmpty!30972) (not b!919848) tp_is_empty!19477 (not start!78924) (not b_next!16969) (not b!919858) b_and!27687)
(check-sat b_and!27687 (not b_next!16969))
