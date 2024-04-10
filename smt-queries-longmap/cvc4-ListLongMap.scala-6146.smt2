; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78988 () Bool)

(assert start!78988)

(declare-fun b_free!17201 () Bool)

(declare-fun b_next!17201 () Bool)

(assert (=> start!78988 (= b_free!17201 (not b_next!17201))))

(declare-fun tp!60044 () Bool)

(declare-fun b_and!28139 () Bool)

(assert (=> start!78988 (= tp!60044 b_and!28139)))

(declare-fun b!924685 () Bool)

(declare-fun e!518922 () Bool)

(declare-fun e!518927 () Bool)

(assert (=> b!924685 (= e!518922 e!518927)))

(declare-fun res!623250 () Bool)

(assert (=> b!924685 (=> (not res!623250) (not e!518927))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55388 0))(
  ( (array!55389 (arr!26639 (Array (_ BitVec 32) (_ BitVec 64))) (size!27098 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55388)

(assert (=> b!924685 (= res!623250 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27098 _keys!1487)))))

(declare-datatypes ((Unit!31223 0))(
  ( (Unit!31224) )
))
(declare-fun lt!415871 () Unit!31223)

(declare-fun e!518931 () Unit!31223)

(assert (=> b!924685 (= lt!415871 e!518931)))

(declare-fun c!96463 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!924685 (= c!96463 (validKeyInArray!0 k!1099))))

(declare-fun b!924686 () Bool)

(declare-fun res!623248 () Bool)

(declare-fun e!518923 () Bool)

(assert (=> b!924686 (=> (not res!623248) (not e!518923))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31243 0))(
  ( (V!31244 (val!9905 Int)) )
))
(declare-datatypes ((ValueCell!9373 0))(
  ( (ValueCellFull!9373 (v!12423 V!31243)) (EmptyCell!9373) )
))
(declare-datatypes ((array!55390 0))(
  ( (array!55391 (arr!26640 (Array (_ BitVec 32) ValueCell!9373)) (size!27099 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55390)

(assert (=> b!924686 (= res!623248 (and (= (size!27099 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27098 _keys!1487) (size!27099 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31320 () Bool)

(declare-fun mapRes!31320 () Bool)

(declare-fun tp!60043 () Bool)

(declare-fun e!518924 () Bool)

(assert (=> mapNonEmpty!31320 (= mapRes!31320 (and tp!60043 e!518924))))

(declare-fun mapKey!31320 () (_ BitVec 32))

(declare-fun mapRest!31320 () (Array (_ BitVec 32) ValueCell!9373))

(declare-fun mapValue!31320 () ValueCell!9373)

(assert (=> mapNonEmpty!31320 (= (arr!26640 _values!1231) (store mapRest!31320 mapKey!31320 mapValue!31320))))

(declare-fun res!623243 () Bool)

(assert (=> start!78988 (=> (not res!623243) (not e!518923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78988 (= res!623243 (validMask!0 mask!1881))))

(assert (=> start!78988 e!518923))

(assert (=> start!78988 true))

(declare-fun tp_is_empty!19709 () Bool)

(assert (=> start!78988 tp_is_empty!19709))

(declare-fun e!518921 () Bool)

(declare-fun array_inv!20746 (array!55390) Bool)

(assert (=> start!78988 (and (array_inv!20746 _values!1231) e!518921)))

(assert (=> start!78988 tp!60044))

(declare-fun array_inv!20747 (array!55388) Bool)

(assert (=> start!78988 (array_inv!20747 _keys!1487)))

(declare-fun mapIsEmpty!31320 () Bool)

(assert (=> mapIsEmpty!31320 mapRes!31320))

(declare-fun b!924687 () Bool)

(declare-fun e!518928 () Unit!31223)

(declare-fun Unit!31225 () Unit!31223)

(assert (=> b!924687 (= e!518928 Unit!31225)))

(declare-fun b!924688 () Bool)

(declare-fun e!518932 () Bool)

(declare-fun arrayContainsKey!0 (array!55388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!924688 (= e!518932 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!924689 () Bool)

(assert (=> b!924689 (= e!518924 tp_is_empty!19709)))

(declare-fun b!924690 () Bool)

(declare-fun e!518930 () Bool)

(assert (=> b!924690 (= e!518930 false)))

(declare-fun lt!415875 () V!31243)

(declare-datatypes ((tuple2!12908 0))(
  ( (tuple2!12909 (_1!6465 (_ BitVec 64)) (_2!6465 V!31243)) )
))
(declare-datatypes ((List!18710 0))(
  ( (Nil!18707) (Cons!18706 (h!19852 tuple2!12908) (t!26641 List!18710)) )
))
(declare-datatypes ((ListLongMap!11605 0))(
  ( (ListLongMap!11606 (toList!5818 List!18710)) )
))
(declare-fun lt!415874 () ListLongMap!11605)

(declare-fun apply!648 (ListLongMap!11605 (_ BitVec 64)) V!31243)

(assert (=> b!924690 (= lt!415875 (apply!648 lt!415874 k!1099))))

(declare-fun b!924691 () Bool)

(assert (=> b!924691 (= e!518932 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!924692 () Bool)

(declare-fun e!518925 () Bool)

(assert (=> b!924692 (= e!518925 e!518922)))

(declare-fun res!623245 () Bool)

(assert (=> b!924692 (=> (not res!623245) (not e!518922))))

(declare-fun v!791 () V!31243)

(declare-fun lt!415872 () V!31243)

(assert (=> b!924692 (= res!623245 (and (= lt!415872 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!415878 () ListLongMap!11605)

(assert (=> b!924692 (= lt!415872 (apply!648 lt!415878 k!1099))))

(declare-fun b!924693 () Bool)

(declare-fun res!623244 () Bool)

(assert (=> b!924693 (=> (not res!623244) (not e!518923))))

(assert (=> b!924693 (= res!623244 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27098 _keys!1487))))))

(declare-fun b!924694 () Bool)

(declare-fun lt!415881 () ListLongMap!11605)

(assert (=> b!924694 (= (apply!648 lt!415881 k!1099) lt!415872)))

(declare-fun lt!415870 () V!31243)

(declare-fun lt!415873 () Unit!31223)

(declare-fun lt!415877 () (_ BitVec 64))

(declare-fun addApplyDifferent!370 (ListLongMap!11605 (_ BitVec 64) V!31243 (_ BitVec 64)) Unit!31223)

(assert (=> b!924694 (= lt!415873 (addApplyDifferent!370 lt!415878 lt!415877 lt!415870 k!1099))))

(assert (=> b!924694 (not (= lt!415877 k!1099))))

(declare-fun lt!415879 () Unit!31223)

(declare-datatypes ((List!18711 0))(
  ( (Nil!18708) (Cons!18707 (h!19853 (_ BitVec 64)) (t!26642 List!18711)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55388 (_ BitVec 64) (_ BitVec 32) List!18711) Unit!31223)

(assert (=> b!924694 (= lt!415879 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18708))))

(assert (=> b!924694 e!518932))

(declare-fun c!96464 () Bool)

(assert (=> b!924694 (= c!96464 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!415880 () Unit!31223)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31243)

(declare-fun minValue!1173 () V!31243)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!221 (array!55388 array!55390 (_ BitVec 32) (_ BitVec 32) V!31243 V!31243 (_ BitVec 64) (_ BitVec 32) Int) Unit!31223)

(assert (=> b!924694 (= lt!415880 (lemmaListMapContainsThenArrayContainsFrom!221 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55388 (_ BitVec 32) List!18711) Bool)

(assert (=> b!924694 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18708)))

(declare-fun lt!415882 () Unit!31223)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55388 (_ BitVec 32) (_ BitVec 32)) Unit!31223)

(assert (=> b!924694 (= lt!415882 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4878 (ListLongMap!11605 (_ BitVec 64)) Bool)

(assert (=> b!924694 (contains!4878 lt!415881 k!1099)))

(declare-fun lt!415868 () tuple2!12908)

(declare-fun +!2714 (ListLongMap!11605 tuple2!12908) ListLongMap!11605)

(assert (=> b!924694 (= lt!415881 (+!2714 lt!415878 lt!415868))))

(declare-fun lt!415869 () Unit!31223)

(declare-fun addStillContains!438 (ListLongMap!11605 (_ BitVec 64) V!31243 (_ BitVec 64)) Unit!31223)

(assert (=> b!924694 (= lt!415869 (addStillContains!438 lt!415878 lt!415877 lt!415870 k!1099))))

(declare-fun getCurrentListMap!3069 (array!55388 array!55390 (_ BitVec 32) (_ BitVec 32) V!31243 V!31243 (_ BitVec 32) Int) ListLongMap!11605)

(assert (=> b!924694 (= (getCurrentListMap!3069 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2714 (getCurrentListMap!3069 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415868))))

(assert (=> b!924694 (= lt!415868 (tuple2!12909 lt!415877 lt!415870))))

(declare-fun get!14003 (ValueCell!9373 V!31243) V!31243)

(declare-fun dynLambda!1503 (Int (_ BitVec 64)) V!31243)

(assert (=> b!924694 (= lt!415870 (get!14003 (select (arr!26640 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1503 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415876 () Unit!31223)

(declare-fun lemmaListMapRecursiveValidKeyArray!104 (array!55388 array!55390 (_ BitVec 32) (_ BitVec 32) V!31243 V!31243 (_ BitVec 32) Int) Unit!31223)

(assert (=> b!924694 (= lt!415876 (lemmaListMapRecursiveValidKeyArray!104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!924694 (= e!518928 lt!415873)))

(declare-fun b!924695 () Bool)

(assert (=> b!924695 (= e!518927 e!518930)))

(declare-fun res!623249 () Bool)

(assert (=> b!924695 (=> (not res!623249) (not e!518930))))

(assert (=> b!924695 (= res!623249 (contains!4878 lt!415874 k!1099))))

(assert (=> b!924695 (= lt!415874 (getCurrentListMap!3069 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!924696 () Bool)

(assert (=> b!924696 (= e!518923 e!518925)))

(declare-fun res!623246 () Bool)

(assert (=> b!924696 (=> (not res!623246) (not e!518925))))

(assert (=> b!924696 (= res!623246 (contains!4878 lt!415878 k!1099))))

(assert (=> b!924696 (= lt!415878 (getCurrentListMap!3069 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!924697 () Bool)

(declare-fun Unit!31226 () Unit!31223)

(assert (=> b!924697 (= e!518931 Unit!31226)))

(declare-fun b!924698 () Bool)

(declare-fun res!623247 () Bool)

(assert (=> b!924698 (=> (not res!623247) (not e!518923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55388 (_ BitVec 32)) Bool)

(assert (=> b!924698 (= res!623247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!924699 () Bool)

(declare-fun e!518926 () Bool)

(assert (=> b!924699 (= e!518921 (and e!518926 mapRes!31320))))

(declare-fun condMapEmpty!31320 () Bool)

(declare-fun mapDefault!31320 () ValueCell!9373)

