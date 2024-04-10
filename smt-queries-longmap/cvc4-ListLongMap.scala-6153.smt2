; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79030 () Bool)

(assert start!79030)

(declare-fun b_free!17243 () Bool)

(declare-fun b_next!17243 () Bool)

(assert (=> start!79030 (= b_free!17243 (not b_next!17243))))

(declare-fun tp!60169 () Bool)

(declare-fun b_and!28223 () Bool)

(assert (=> start!79030 (= tp!60169 b_and!28223)))

(declare-fun b!925949 () Bool)

(declare-datatypes ((Unit!31295 0))(
  ( (Unit!31296) )
))
(declare-fun e!519731 () Unit!31295)

(declare-fun Unit!31297 () Unit!31295)

(assert (=> b!925949 (= e!519731 Unit!31297)))

(declare-fun res!623902 () Bool)

(declare-fun e!519724 () Bool)

(assert (=> start!79030 (=> (not res!623902) (not e!519724))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79030 (= res!623902 (validMask!0 mask!1881))))

(assert (=> start!79030 e!519724))

(assert (=> start!79030 true))

(declare-fun tp_is_empty!19751 () Bool)

(assert (=> start!79030 tp_is_empty!19751))

(declare-datatypes ((V!31299 0))(
  ( (V!31300 (val!9926 Int)) )
))
(declare-datatypes ((ValueCell!9394 0))(
  ( (ValueCellFull!9394 (v!12444 V!31299)) (EmptyCell!9394) )
))
(declare-datatypes ((array!55468 0))(
  ( (array!55469 (arr!26679 (Array (_ BitVec 32) ValueCell!9394)) (size!27138 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55468)

(declare-fun e!519730 () Bool)

(declare-fun array_inv!20778 (array!55468) Bool)

(assert (=> start!79030 (and (array_inv!20778 _values!1231) e!519730)))

(assert (=> start!79030 tp!60169))

(declare-datatypes ((array!55470 0))(
  ( (array!55471 (arr!26680 (Array (_ BitVec 32) (_ BitVec 64))) (size!27139 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55470)

(declare-fun array_inv!20779 (array!55470) Bool)

(assert (=> start!79030 (array_inv!20779 _keys!1487)))

(declare-fun b!925950 () Bool)

(declare-fun e!519727 () Bool)

(assert (=> b!925950 (= e!519727 (not true))))

(declare-fun e!519733 () Bool)

(assert (=> b!925950 e!519733))

(declare-fun res!623901 () Bool)

(assert (=> b!925950 (=> (not res!623901) (not e!519733))))

(declare-datatypes ((tuple2!12946 0))(
  ( (tuple2!12947 (_1!6484 (_ BitVec 64)) (_2!6484 V!31299)) )
))
(declare-datatypes ((List!18748 0))(
  ( (Nil!18745) (Cons!18744 (h!19890 tuple2!12946) (t!26721 List!18748)) )
))
(declare-datatypes ((ListLongMap!11643 0))(
  ( (ListLongMap!11644 (toList!5837 List!18748)) )
))
(declare-fun lt!416861 () ListLongMap!11643)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4896 (ListLongMap!11643 (_ BitVec 64)) Bool)

(assert (=> b!925950 (= res!623901 (contains!4896 lt!416861 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31299)

(declare-fun minValue!1173 () V!31299)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3087 (array!55470 array!55468 (_ BitVec 32) (_ BitVec 32) V!31299 V!31299 (_ BitVec 32) Int) ListLongMap!11643)

(assert (=> b!925950 (= lt!416861 (getCurrentListMap!3087 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31299)

(declare-fun lt!416859 () Unit!31295)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!75 (array!55470 array!55468 (_ BitVec 32) (_ BitVec 32) V!31299 V!31299 (_ BitVec 64) V!31299 (_ BitVec 32) Int) Unit!31295)

(assert (=> b!925950 (= lt!416859 (lemmaListMapApplyFromThenApplyFromZero!75 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925951 () Bool)

(declare-fun e!519725 () Bool)

(assert (=> b!925951 (= e!519725 tp_is_empty!19751)))

(declare-fun mapIsEmpty!31383 () Bool)

(declare-fun mapRes!31383 () Bool)

(assert (=> mapIsEmpty!31383 mapRes!31383))

(declare-fun b!925952 () Bool)

(declare-fun e!519723 () Unit!31295)

(declare-fun Unit!31298 () Unit!31295)

(assert (=> b!925952 (= e!519723 Unit!31298)))

(declare-fun b!925953 () Bool)

(declare-fun res!623906 () Bool)

(assert (=> b!925953 (=> (not res!623906) (not e!519724))))

(assert (=> b!925953 (= res!623906 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27139 _keys!1487))))))

(declare-fun b!925954 () Bool)

(declare-fun res!623903 () Bool)

(assert (=> b!925954 (=> (not res!623903) (not e!519724))))

(declare-datatypes ((List!18749 0))(
  ( (Nil!18746) (Cons!18745 (h!19891 (_ BitVec 64)) (t!26722 List!18749)) )
))
(declare-fun arrayNoDuplicates!0 (array!55470 (_ BitVec 32) List!18749) Bool)

(assert (=> b!925954 (= res!623903 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18746))))

(declare-fun b!925955 () Bool)

(assert (=> b!925955 (= e!519723 e!519731)))

(declare-fun lt!416865 () (_ BitVec 64))

(assert (=> b!925955 (= lt!416865 (select (arr!26680 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96652 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925955 (= c!96652 (validKeyInArray!0 lt!416865))))

(declare-fun b!925956 () Bool)

(declare-fun e!519721 () Bool)

(assert (=> b!925956 (= e!519721 tp_is_empty!19751)))

(declare-fun b!925957 () Bool)

(declare-fun res!623905 () Bool)

(assert (=> b!925957 (=> (not res!623905) (not e!519724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55470 (_ BitVec 32)) Bool)

(assert (=> b!925957 (= res!623905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925958 () Bool)

(declare-fun res!623908 () Bool)

(assert (=> b!925958 (=> (not res!623908) (not e!519724))))

(assert (=> b!925958 (= res!623908 (and (= (size!27138 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27139 _keys!1487) (size!27138 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925959 () Bool)

(declare-fun lt!416868 () ListLongMap!11643)

(declare-fun lt!416863 () V!31299)

(declare-fun apply!667 (ListLongMap!11643 (_ BitVec 64)) V!31299)

(assert (=> b!925959 (= (apply!667 lt!416868 k!1099) lt!416863)))

(declare-fun lt!416864 () ListLongMap!11643)

(declare-fun lt!416871 () V!31299)

(declare-fun lt!416870 () Unit!31295)

(declare-fun addApplyDifferent!387 (ListLongMap!11643 (_ BitVec 64) V!31299 (_ BitVec 64)) Unit!31295)

(assert (=> b!925959 (= lt!416870 (addApplyDifferent!387 lt!416864 lt!416865 lt!416871 k!1099))))

(assert (=> b!925959 (not (= lt!416865 k!1099))))

(declare-fun lt!416860 () Unit!31295)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55470 (_ BitVec 64) (_ BitVec 32) List!18749) Unit!31295)

(assert (=> b!925959 (= lt!416860 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18746))))

(declare-fun e!519726 () Bool)

(assert (=> b!925959 e!519726))

(declare-fun c!96653 () Bool)

(assert (=> b!925959 (= c!96653 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416872 () Unit!31295)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!238 (array!55470 array!55468 (_ BitVec 32) (_ BitVec 32) V!31299 V!31299 (_ BitVec 64) (_ BitVec 32) Int) Unit!31295)

(assert (=> b!925959 (= lt!416872 (lemmaListMapContainsThenArrayContainsFrom!238 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925959 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18746)))

(declare-fun lt!416857 () Unit!31295)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55470 (_ BitVec 32) (_ BitVec 32)) Unit!31295)

(assert (=> b!925959 (= lt!416857 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925959 (contains!4896 lt!416868 k!1099)))

(declare-fun lt!416862 () tuple2!12946)

(declare-fun +!2731 (ListLongMap!11643 tuple2!12946) ListLongMap!11643)

(assert (=> b!925959 (= lt!416868 (+!2731 lt!416864 lt!416862))))

(declare-fun lt!416858 () Unit!31295)

(declare-fun addStillContains!455 (ListLongMap!11643 (_ BitVec 64) V!31299 (_ BitVec 64)) Unit!31295)

(assert (=> b!925959 (= lt!416858 (addStillContains!455 lt!416864 lt!416865 lt!416871 k!1099))))

(assert (=> b!925959 (= (getCurrentListMap!3087 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2731 (getCurrentListMap!3087 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416862))))

(assert (=> b!925959 (= lt!416862 (tuple2!12947 lt!416865 lt!416871))))

(declare-fun get!14034 (ValueCell!9394 V!31299) V!31299)

(declare-fun dynLambda!1520 (Int (_ BitVec 64)) V!31299)

(assert (=> b!925959 (= lt!416871 (get!14034 (select (arr!26679 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1520 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416869 () Unit!31295)

(declare-fun lemmaListMapRecursiveValidKeyArray!121 (array!55470 array!55468 (_ BitVec 32) (_ BitVec 32) V!31299 V!31299 (_ BitVec 32) Int) Unit!31295)

(assert (=> b!925959 (= lt!416869 (lemmaListMapRecursiveValidKeyArray!121 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925959 (= e!519731 lt!416870)))

(declare-fun b!925960 () Bool)

(declare-fun e!519722 () Bool)

(assert (=> b!925960 (= e!519722 e!519727)))

(declare-fun res!623907 () Bool)

(assert (=> b!925960 (=> (not res!623907) (not e!519727))))

(declare-fun lt!416866 () ListLongMap!11643)

(assert (=> b!925960 (= res!623907 (contains!4896 lt!416866 k!1099))))

(assert (=> b!925960 (= lt!416866 (getCurrentListMap!3087 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31383 () Bool)

(declare-fun tp!60170 () Bool)

(assert (=> mapNonEmpty!31383 (= mapRes!31383 (and tp!60170 e!519721))))

(declare-fun mapRest!31383 () (Array (_ BitVec 32) ValueCell!9394))

(declare-fun mapValue!31383 () ValueCell!9394)

(declare-fun mapKey!31383 () (_ BitVec 32))

(assert (=> mapNonEmpty!31383 (= (arr!26679 _values!1231) (store mapRest!31383 mapKey!31383 mapValue!31383))))

(declare-fun b!925961 () Bool)

(declare-fun e!519732 () Bool)

(declare-fun e!519728 () Bool)

(assert (=> b!925961 (= e!519732 e!519728)))

(declare-fun res!623898 () Bool)

(assert (=> b!925961 (=> (not res!623898) (not e!519728))))

(assert (=> b!925961 (= res!623898 (and (= lt!416863 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925961 (= lt!416863 (apply!667 lt!416864 k!1099))))

(declare-fun b!925962 () Bool)

(declare-fun arrayContainsKey!0 (array!55470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925962 (= e!519726 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!925963 () Bool)

(assert (=> b!925963 (= e!519726 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925964 () Bool)

(assert (=> b!925964 (= e!519728 e!519722)))

(declare-fun res!623900 () Bool)

(assert (=> b!925964 (=> (not res!623900) (not e!519722))))

(assert (=> b!925964 (= res!623900 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27139 _keys!1487)))))

(declare-fun lt!416867 () Unit!31295)

(assert (=> b!925964 (= lt!416867 e!519723)))

(declare-fun c!96654 () Bool)

(assert (=> b!925964 (= c!96654 (validKeyInArray!0 k!1099))))

(declare-fun b!925965 () Bool)

(assert (=> b!925965 (= e!519733 (= (apply!667 lt!416861 k!1099) v!791))))

(declare-fun b!925966 () Bool)

(assert (=> b!925966 (= e!519730 (and e!519725 mapRes!31383))))

(declare-fun condMapEmpty!31383 () Bool)

(declare-fun mapDefault!31383 () ValueCell!9394)

