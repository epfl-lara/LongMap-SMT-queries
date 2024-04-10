; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78922 () Bool)

(assert start!78922)

(declare-fun b_free!17135 () Bool)

(declare-fun b_next!17135 () Bool)

(assert (=> start!78922 (= b_free!17135 (not b_next!17135))))

(declare-fun tp!59846 () Bool)

(declare-fun b_and!28007 () Bool)

(assert (=> start!78922 (= tp!59846 b_and!28007)))

(declare-fun b!922894 () Bool)

(declare-fun res!622336 () Bool)

(declare-fun e!517815 () Bool)

(assert (=> b!922894 (=> (not res!622336) (not e!517815))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55262 0))(
  ( (array!55263 (arr!26576 (Array (_ BitVec 32) (_ BitVec 64))) (size!27035 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55262)

(assert (=> b!922894 (= res!622336 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27035 _keys!1487))))))

(declare-fun b!922895 () Bool)

(declare-fun e!517809 () Bool)

(assert (=> b!922895 (= e!517809 (not true))))

(declare-fun lt!414502 () (_ BitVec 64))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!922895 (not (= lt!414502 k!1099))))

(declare-datatypes ((Unit!31130 0))(
  ( (Unit!31131) )
))
(declare-fun lt!414505 () Unit!31130)

(declare-datatypes ((List!18651 0))(
  ( (Nil!18648) (Cons!18647 (h!19793 (_ BitVec 64)) (t!26516 List!18651)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55262 (_ BitVec 64) (_ BitVec 32) List!18651) Unit!31130)

(assert (=> b!922895 (= lt!414505 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18648))))

(declare-fun e!517812 () Bool)

(assert (=> b!922895 e!517812))

(declare-fun c!96204 () Bool)

(assert (=> b!922895 (= c!96204 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31155 0))(
  ( (V!31156 (val!9872 Int)) )
))
(declare-datatypes ((ValueCell!9340 0))(
  ( (ValueCellFull!9340 (v!12390 V!31155)) (EmptyCell!9340) )
))
(declare-datatypes ((array!55264 0))(
  ( (array!55265 (arr!26577 (Array (_ BitVec 32) ValueCell!9340)) (size!27036 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55264)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!414497 () Unit!31130)

(declare-fun zeroValue!1173 () V!31155)

(declare-fun minValue!1173 () V!31155)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!198 (array!55262 array!55264 (_ BitVec 32) (_ BitVec 32) V!31155 V!31155 (_ BitVec 64) (_ BitVec 32) Int) Unit!31130)

(assert (=> b!922895 (= lt!414497 (lemmaListMapContainsThenArrayContainsFrom!198 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55262 (_ BitVec 32) List!18651) Bool)

(assert (=> b!922895 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18648)))

(declare-fun lt!414498 () Unit!31130)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55262 (_ BitVec 32) (_ BitVec 32)) Unit!31130)

(assert (=> b!922895 (= lt!414498 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12846 0))(
  ( (tuple2!12847 (_1!6434 (_ BitVec 64)) (_2!6434 V!31155)) )
))
(declare-datatypes ((List!18652 0))(
  ( (Nil!18649) (Cons!18648 (h!19794 tuple2!12846) (t!26517 List!18652)) )
))
(declare-datatypes ((ListLongMap!11543 0))(
  ( (ListLongMap!11544 (toList!5787 List!18652)) )
))
(declare-fun lt!414499 () ListLongMap!11543)

(declare-fun lt!414504 () tuple2!12846)

(declare-fun contains!4850 (ListLongMap!11543 (_ BitVec 64)) Bool)

(declare-fun +!2691 (ListLongMap!11543 tuple2!12846) ListLongMap!11543)

(assert (=> b!922895 (contains!4850 (+!2691 lt!414499 lt!414504) k!1099)))

(declare-fun lt!414503 () Unit!31130)

(declare-fun lt!414501 () V!31155)

(declare-fun addStillContains!415 (ListLongMap!11543 (_ BitVec 64) V!31155 (_ BitVec 64)) Unit!31130)

(assert (=> b!922895 (= lt!414503 (addStillContains!415 lt!414499 lt!414502 lt!414501 k!1099))))

(declare-fun getCurrentListMap!3041 (array!55262 array!55264 (_ BitVec 32) (_ BitVec 32) V!31155 V!31155 (_ BitVec 32) Int) ListLongMap!11543)

(assert (=> b!922895 (= (getCurrentListMap!3041 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2691 (getCurrentListMap!3041 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414504))))

(assert (=> b!922895 (= lt!414504 (tuple2!12847 lt!414502 lt!414501))))

(declare-fun get!13958 (ValueCell!9340 V!31155) V!31155)

(declare-fun dynLambda!1480 (Int (_ BitVec 64)) V!31155)

(assert (=> b!922895 (= lt!414501 (get!13958 (select (arr!26577 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1480 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414500 () Unit!31130)

(declare-fun lemmaListMapRecursiveValidKeyArray!81 (array!55262 array!55264 (_ BitVec 32) (_ BitVec 32) V!31155 V!31155 (_ BitVec 32) Int) Unit!31130)

(assert (=> b!922895 (= lt!414500 (lemmaListMapRecursiveValidKeyArray!81 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31221 () Bool)

(declare-fun mapRes!31221 () Bool)

(assert (=> mapIsEmpty!31221 mapRes!31221))

(declare-fun b!922896 () Bool)

(declare-fun arrayContainsKey!0 (array!55262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922896 (= e!517812 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!922897 () Bool)

(declare-fun e!517814 () Bool)

(assert (=> b!922897 (= e!517815 e!517814)))

(declare-fun res!622340 () Bool)

(assert (=> b!922897 (=> (not res!622340) (not e!517814))))

(assert (=> b!922897 (= res!622340 (contains!4850 lt!414499 k!1099))))

(assert (=> b!922897 (= lt!414499 (getCurrentListMap!3041 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!622337 () Bool)

(assert (=> start!78922 (=> (not res!622337) (not e!517815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78922 (= res!622337 (validMask!0 mask!1881))))

(assert (=> start!78922 e!517815))

(assert (=> start!78922 true))

(declare-fun tp_is_empty!19643 () Bool)

(assert (=> start!78922 tp_is_empty!19643))

(declare-fun e!517811 () Bool)

(declare-fun array_inv!20700 (array!55264) Bool)

(assert (=> start!78922 (and (array_inv!20700 _values!1231) e!517811)))

(assert (=> start!78922 tp!59846))

(declare-fun array_inv!20701 (array!55262) Bool)

(assert (=> start!78922 (array_inv!20701 _keys!1487)))

(declare-fun b!922898 () Bool)

(declare-fun e!517816 () Bool)

(assert (=> b!922898 (= e!517816 tp_is_empty!19643)))

(declare-fun b!922899 () Bool)

(declare-fun e!517813 () Bool)

(assert (=> b!922899 (= e!517811 (and e!517813 mapRes!31221))))

(declare-fun condMapEmpty!31221 () Bool)

(declare-fun mapDefault!31221 () ValueCell!9340)

