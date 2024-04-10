; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79394 () Bool)

(assert start!79394)

(declare-fun b_free!17581 () Bool)

(declare-fun b_next!17581 () Bool)

(assert (=> start!79394 (= b_free!17581 (not b_next!17581))))

(declare-fun tp!61187 () Bool)

(declare-fun b_and!28721 () Bool)

(assert (=> start!79394 (= tp!61187 b_and!28721)))

(declare-fun mapIsEmpty!31893 () Bool)

(declare-fun mapRes!31893 () Bool)

(assert (=> mapIsEmpty!31893 mapRes!31893))

(declare-fun b!932896 () Bool)

(declare-fun res!628319 () Bool)

(declare-fun e!523869 () Bool)

(assert (=> b!932896 (=> (not res!628319) (not e!523869))))

(declare-datatypes ((array!56114 0))(
  ( (array!56115 (arr!27001 (Array (_ BitVec 32) (_ BitVec 64))) (size!27460 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56114)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31751 0))(
  ( (V!31752 (val!10095 Int)) )
))
(declare-datatypes ((ValueCell!9563 0))(
  ( (ValueCellFull!9563 (v!12614 V!31751)) (EmptyCell!9563) )
))
(declare-datatypes ((array!56116 0))(
  ( (array!56117 (arr!27002 (Array (_ BitVec 32) ValueCell!9563)) (size!27461 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56116)

(assert (=> b!932896 (= res!628319 (and (= (size!27461 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27460 _keys!1487) (size!27461 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932897 () Bool)

(declare-fun res!628322 () Bool)

(assert (=> b!932897 (=> (not res!628322) (not e!523869))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932897 (= res!628322 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27460 _keys!1487))))))

(declare-fun b!932898 () Bool)

(declare-fun e!523865 () Bool)

(assert (=> b!932898 (= e!523869 e!523865)))

(declare-fun res!628323 () Bool)

(assert (=> b!932898 (=> (not res!628323) (not e!523865))))

(declare-datatypes ((tuple2!13228 0))(
  ( (tuple2!13229 (_1!6625 (_ BitVec 64)) (_2!6625 V!31751)) )
))
(declare-datatypes ((List!19010 0))(
  ( (Nil!19007) (Cons!19006 (h!20152 tuple2!13228) (t!27135 List!19010)) )
))
(declare-datatypes ((ListLongMap!11925 0))(
  ( (ListLongMap!11926 (toList!5978 List!19010)) )
))
(declare-fun lt!420126 () ListLongMap!11925)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5027 (ListLongMap!11925 (_ BitVec 64)) Bool)

(assert (=> b!932898 (= res!628323 (contains!5027 lt!420126 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31751)

(declare-fun minValue!1173 () V!31751)

(declare-fun getCurrentListMap!3216 (array!56114 array!56116 (_ BitVec 32) (_ BitVec 32) V!31751 V!31751 (_ BitVec 32) Int) ListLongMap!11925)

(assert (=> b!932898 (= lt!420126 (getCurrentListMap!3216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932899 () Bool)

(declare-fun res!628316 () Bool)

(assert (=> b!932899 (=> (not res!628316) (not e!523869))))

(declare-datatypes ((List!19011 0))(
  ( (Nil!19008) (Cons!19007 (h!20153 (_ BitVec 64)) (t!27136 List!19011)) )
))
(declare-fun arrayNoDuplicates!0 (array!56114 (_ BitVec 32) List!19011) Bool)

(assert (=> b!932899 (= res!628316 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19008))))

(declare-fun b!932900 () Bool)

(declare-fun e!523863 () Bool)

(assert (=> b!932900 (= e!523865 e!523863)))

(declare-fun res!628321 () Bool)

(assert (=> b!932900 (=> (not res!628321) (not e!523863))))

(declare-fun lt!420124 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932900 (= res!628321 (validKeyInArray!0 lt!420124))))

(assert (=> b!932900 (= lt!420124 (select (arr!27001 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31893 () Bool)

(declare-fun tp!61186 () Bool)

(declare-fun e!523864 () Bool)

(assert (=> mapNonEmpty!31893 (= mapRes!31893 (and tp!61186 e!523864))))

(declare-fun mapValue!31893 () ValueCell!9563)

(declare-fun mapKey!31893 () (_ BitVec 32))

(declare-fun mapRest!31893 () (Array (_ BitVec 32) ValueCell!9563))

(assert (=> mapNonEmpty!31893 (= (arr!27002 _values!1231) (store mapRest!31893 mapKey!31893 mapValue!31893))))

(declare-fun b!932901 () Bool)

(declare-fun e!523866 () Bool)

(declare-fun tp_is_empty!20089 () Bool)

(assert (=> b!932901 (= e!523866 tp_is_empty!20089)))

(declare-fun b!932902 () Bool)

(assert (=> b!932902 (= e!523864 tp_is_empty!20089)))

(declare-fun b!932903 () Bool)

(assert (=> b!932903 (= e!523863 (not true))))

(assert (=> b!932903 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19008)))

(declare-datatypes ((Unit!31479 0))(
  ( (Unit!31480) )
))
(declare-fun lt!420122 () Unit!31479)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56114 (_ BitVec 32) (_ BitVec 32)) Unit!31479)

(assert (=> b!932903 (= lt!420122 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420123 () tuple2!13228)

(declare-fun +!2782 (ListLongMap!11925 tuple2!13228) ListLongMap!11925)

(assert (=> b!932903 (contains!5027 (+!2782 lt!420126 lt!420123) k!1099)))

(declare-fun lt!420127 () Unit!31479)

(declare-fun lt!420128 () V!31751)

(declare-fun addStillContains!501 (ListLongMap!11925 (_ BitVec 64) V!31751 (_ BitVec 64)) Unit!31479)

(assert (=> b!932903 (= lt!420127 (addStillContains!501 lt!420126 lt!420124 lt!420128 k!1099))))

(assert (=> b!932903 (= (getCurrentListMap!3216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2782 (getCurrentListMap!3216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420123))))

(assert (=> b!932903 (= lt!420123 (tuple2!13229 lt!420124 lt!420128))))

(declare-fun get!14202 (ValueCell!9563 V!31751) V!31751)

(declare-fun dynLambda!1571 (Int (_ BitVec 64)) V!31751)

(assert (=> b!932903 (= lt!420128 (get!14202 (select (arr!27002 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1571 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420125 () Unit!31479)

(declare-fun lemmaListMapRecursiveValidKeyArray!172 (array!56114 array!56116 (_ BitVec 32) (_ BitVec 32) V!31751 V!31751 (_ BitVec 32) Int) Unit!31479)

(assert (=> b!932903 (= lt!420125 (lemmaListMapRecursiveValidKeyArray!172 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932905 () Bool)

(declare-fun res!628320 () Bool)

(assert (=> b!932905 (=> (not res!628320) (not e!523865))))

(assert (=> b!932905 (= res!628320 (validKeyInArray!0 k!1099))))

(declare-fun b!932906 () Bool)

(declare-fun res!628324 () Bool)

(assert (=> b!932906 (=> (not res!628324) (not e!523865))))

(declare-fun v!791 () V!31751)

(declare-fun apply!791 (ListLongMap!11925 (_ BitVec 64)) V!31751)

(assert (=> b!932906 (= res!628324 (= (apply!791 lt!420126 k!1099) v!791))))

(declare-fun b!932907 () Bool)

(declare-fun res!628317 () Bool)

(assert (=> b!932907 (=> (not res!628317) (not e!523869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56114 (_ BitVec 32)) Bool)

(assert (=> b!932907 (= res!628317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932908 () Bool)

(declare-fun res!628318 () Bool)

(assert (=> b!932908 (=> (not res!628318) (not e!523865))))

(assert (=> b!932908 (= res!628318 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!628315 () Bool)

(assert (=> start!79394 (=> (not res!628315) (not e!523869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79394 (= res!628315 (validMask!0 mask!1881))))

(assert (=> start!79394 e!523869))

(assert (=> start!79394 true))

(assert (=> start!79394 tp_is_empty!20089))

(declare-fun e!523868 () Bool)

(declare-fun array_inv!21014 (array!56116) Bool)

(assert (=> start!79394 (and (array_inv!21014 _values!1231) e!523868)))

(assert (=> start!79394 tp!61187))

(declare-fun array_inv!21015 (array!56114) Bool)

(assert (=> start!79394 (array_inv!21015 _keys!1487)))

(declare-fun b!932904 () Bool)

(assert (=> b!932904 (= e!523868 (and e!523866 mapRes!31893))))

(declare-fun condMapEmpty!31893 () Bool)

(declare-fun mapDefault!31893 () ValueCell!9563)

