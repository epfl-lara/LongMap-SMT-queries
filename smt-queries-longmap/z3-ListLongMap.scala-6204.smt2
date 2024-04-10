; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79360 () Bool)

(assert start!79360)

(declare-fun b_free!17547 () Bool)

(declare-fun b_next!17547 () Bool)

(assert (=> start!79360 (= b_free!17547 (not b_next!17547))))

(declare-fun tp!61085 () Bool)

(declare-fun b_and!28653 () Bool)

(assert (=> start!79360 (= tp!61085 b_and!28653)))

(declare-fun mapNonEmpty!31842 () Bool)

(declare-fun mapRes!31842 () Bool)

(declare-fun tp!61084 () Bool)

(declare-fun e!523509 () Bool)

(assert (=> mapNonEmpty!31842 (= mapRes!31842 (and tp!61084 e!523509))))

(declare-datatypes ((V!31705 0))(
  ( (V!31706 (val!10078 Int)) )
))
(declare-datatypes ((ValueCell!9546 0))(
  ( (ValueCellFull!9546 (v!12597 V!31705)) (EmptyCell!9546) )
))
(declare-fun mapRest!31842 () (Array (_ BitVec 32) ValueCell!9546))

(declare-datatypes ((array!56050 0))(
  ( (array!56051 (arr!26969 (Array (_ BitVec 32) ValueCell!9546)) (size!27428 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56050)

(declare-fun mapKey!31842 () (_ BitVec 32))

(declare-fun mapValue!31842 () ValueCell!9546)

(assert (=> mapNonEmpty!31842 (= (arr!26969 _values!1231) (store mapRest!31842 mapKey!31842 mapValue!31842))))

(declare-fun b!932199 () Bool)

(declare-fun e!523510 () Bool)

(declare-fun tp_is_empty!20055 () Bool)

(assert (=> b!932199 (= e!523510 tp_is_empty!20055)))

(declare-fun res!627812 () Bool)

(declare-fun e!523512 () Bool)

(assert (=> start!79360 (=> (not res!627812) (not e!523512))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79360 (= res!627812 (validMask!0 mask!1881))))

(assert (=> start!79360 e!523512))

(assert (=> start!79360 true))

(assert (=> start!79360 tp_is_empty!20055))

(declare-fun e!523506 () Bool)

(declare-fun array_inv!20992 (array!56050) Bool)

(assert (=> start!79360 (and (array_inv!20992 _values!1231) e!523506)))

(assert (=> start!79360 tp!61085))

(declare-datatypes ((array!56052 0))(
  ( (array!56053 (arr!26970 (Array (_ BitVec 32) (_ BitVec 64))) (size!27429 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56052)

(declare-fun array_inv!20993 (array!56052) Bool)

(assert (=> start!79360 (array_inv!20993 _keys!1487)))

(declare-fun b!932200 () Bool)

(declare-fun res!627809 () Bool)

(assert (=> b!932200 (=> (not res!627809) (not e!523512))))

(declare-datatypes ((List!18987 0))(
  ( (Nil!18984) (Cons!18983 (h!20129 (_ BitVec 64)) (t!27078 List!18987)) )
))
(declare-fun arrayNoDuplicates!0 (array!56052 (_ BitVec 32) List!18987) Bool)

(assert (=> b!932200 (= res!627809 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18984))))

(declare-fun b!932201 () Bool)

(assert (=> b!932201 (= e!523509 tp_is_empty!20055)))

(declare-fun b!932202 () Bool)

(declare-fun e!523508 () Bool)

(assert (=> b!932202 (= e!523508 (not (or (bvsge (size!27429 _keys!1487) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!27429 _keys!1487)))))))

(declare-datatypes ((tuple2!13202 0))(
  ( (tuple2!13203 (_1!6612 (_ BitVec 64)) (_2!6612 V!31705)) )
))
(declare-datatypes ((List!18988 0))(
  ( (Nil!18985) (Cons!18984 (h!20130 tuple2!13202) (t!27079 List!18988)) )
))
(declare-datatypes ((ListLongMap!11899 0))(
  ( (ListLongMap!11900 (toList!5965 List!18988)) )
))
(declare-fun lt!419792 () ListLongMap!11899)

(declare-fun lt!419788 () tuple2!13202)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5014 (ListLongMap!11899 (_ BitVec 64)) Bool)

(declare-fun +!2772 (ListLongMap!11899 tuple2!13202) ListLongMap!11899)

(assert (=> b!932202 (contains!5014 (+!2772 lt!419792 lt!419788) k0!1099)))

(declare-fun lt!419790 () (_ BitVec 64))

(declare-datatypes ((Unit!31459 0))(
  ( (Unit!31460) )
))
(declare-fun lt!419787 () Unit!31459)

(declare-fun lt!419791 () V!31705)

(declare-fun addStillContains!491 (ListLongMap!11899 (_ BitVec 64) V!31705 (_ BitVec 64)) Unit!31459)

(assert (=> b!932202 (= lt!419787 (addStillContains!491 lt!419792 lt!419790 lt!419791 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31705)

(declare-fun minValue!1173 () V!31705)

(declare-fun getCurrentListMap!3203 (array!56052 array!56050 (_ BitVec 32) (_ BitVec 32) V!31705 V!31705 (_ BitVec 32) Int) ListLongMap!11899)

(assert (=> b!932202 (= (getCurrentListMap!3203 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2772 (getCurrentListMap!3203 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419788))))

(assert (=> b!932202 (= lt!419788 (tuple2!13203 lt!419790 lt!419791))))

(declare-fun get!14180 (ValueCell!9546 V!31705) V!31705)

(declare-fun dynLambda!1561 (Int (_ BitVec 64)) V!31705)

(assert (=> b!932202 (= lt!419791 (get!14180 (select (arr!26969 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1561 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419789 () Unit!31459)

(declare-fun lemmaListMapRecursiveValidKeyArray!162 (array!56052 array!56050 (_ BitVec 32) (_ BitVec 32) V!31705 V!31705 (_ BitVec 32) Int) Unit!31459)

(assert (=> b!932202 (= lt!419789 (lemmaListMapRecursiveValidKeyArray!162 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932203 () Bool)

(declare-fun res!627813 () Bool)

(declare-fun e!523507 () Bool)

(assert (=> b!932203 (=> (not res!627813) (not e!523507))))

(assert (=> b!932203 (= res!627813 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932204 () Bool)

(declare-fun res!627806 () Bool)

(assert (=> b!932204 (=> (not res!627806) (not e!523507))))

(declare-fun v!791 () V!31705)

(declare-fun apply!780 (ListLongMap!11899 (_ BitVec 64)) V!31705)

(assert (=> b!932204 (= res!627806 (= (apply!780 lt!419792 k0!1099) v!791))))

(declare-fun b!932205 () Bool)

(declare-fun res!627810 () Bool)

(assert (=> b!932205 (=> (not res!627810) (not e!523512))))

(assert (=> b!932205 (= res!627810 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27429 _keys!1487))))))

(declare-fun b!932206 () Bool)

(assert (=> b!932206 (= e!523506 (and e!523510 mapRes!31842))))

(declare-fun condMapEmpty!31842 () Bool)

(declare-fun mapDefault!31842 () ValueCell!9546)

(assert (=> b!932206 (= condMapEmpty!31842 (= (arr!26969 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9546)) mapDefault!31842)))))

(declare-fun b!932207 () Bool)

(declare-fun res!627805 () Bool)

(assert (=> b!932207 (=> (not res!627805) (not e!523512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56052 (_ BitVec 32)) Bool)

(assert (=> b!932207 (= res!627805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932208 () Bool)

(assert (=> b!932208 (= e!523512 e!523507)))

(declare-fun res!627807 () Bool)

(assert (=> b!932208 (=> (not res!627807) (not e!523507))))

(assert (=> b!932208 (= res!627807 (contains!5014 lt!419792 k0!1099))))

(assert (=> b!932208 (= lt!419792 (getCurrentListMap!3203 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932209 () Bool)

(declare-fun res!627814 () Bool)

(assert (=> b!932209 (=> (not res!627814) (not e!523512))))

(assert (=> b!932209 (= res!627814 (and (= (size!27428 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27429 _keys!1487) (size!27428 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31842 () Bool)

(assert (=> mapIsEmpty!31842 mapRes!31842))

(declare-fun b!932210 () Bool)

(declare-fun res!627808 () Bool)

(assert (=> b!932210 (=> (not res!627808) (not e!523507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932210 (= res!627808 (validKeyInArray!0 k0!1099))))

(declare-fun b!932211 () Bool)

(assert (=> b!932211 (= e!523507 e!523508)))

(declare-fun res!627811 () Bool)

(assert (=> b!932211 (=> (not res!627811) (not e!523508))))

(assert (=> b!932211 (= res!627811 (validKeyInArray!0 lt!419790))))

(assert (=> b!932211 (= lt!419790 (select (arr!26970 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!79360 res!627812) b!932209))

(assert (= (and b!932209 res!627814) b!932207))

(assert (= (and b!932207 res!627805) b!932200))

(assert (= (and b!932200 res!627809) b!932205))

(assert (= (and b!932205 res!627810) b!932208))

(assert (= (and b!932208 res!627807) b!932204))

(assert (= (and b!932204 res!627806) b!932203))

(assert (= (and b!932203 res!627813) b!932210))

(assert (= (and b!932210 res!627808) b!932211))

(assert (= (and b!932211 res!627811) b!932202))

(assert (= (and b!932206 condMapEmpty!31842) mapIsEmpty!31842))

(assert (= (and b!932206 (not condMapEmpty!31842)) mapNonEmpty!31842))

(get-info :version)

(assert (= (and mapNonEmpty!31842 ((_ is ValueCellFull!9546) mapValue!31842)) b!932201))

(assert (= (and b!932206 ((_ is ValueCellFull!9546) mapDefault!31842)) b!932199))

(assert (= start!79360 b!932206))

(declare-fun b_lambda!13881 () Bool)

(assert (=> (not b_lambda!13881) (not b!932202)))

(declare-fun t!27077 () Bool)

(declare-fun tb!5941 () Bool)

(assert (=> (and start!79360 (= defaultEntry!1235 defaultEntry!1235) t!27077) tb!5941))

(declare-fun result!11707 () Bool)

(assert (=> tb!5941 (= result!11707 tp_is_empty!20055)))

(assert (=> b!932202 t!27077))

(declare-fun b_and!28655 () Bool)

(assert (= b_and!28653 (and (=> t!27077 result!11707) b_and!28655)))

(declare-fun m!866151 () Bool)

(assert (=> b!932211 m!866151))

(declare-fun m!866153 () Bool)

(assert (=> b!932211 m!866153))

(declare-fun m!866155 () Bool)

(assert (=> b!932200 m!866155))

(declare-fun m!866157 () Bool)

(assert (=> start!79360 m!866157))

(declare-fun m!866159 () Bool)

(assert (=> start!79360 m!866159))

(declare-fun m!866161 () Bool)

(assert (=> start!79360 m!866161))

(declare-fun m!866163 () Bool)

(assert (=> b!932208 m!866163))

(declare-fun m!866165 () Bool)

(assert (=> b!932208 m!866165))

(declare-fun m!866167 () Bool)

(assert (=> b!932210 m!866167))

(declare-fun m!866169 () Bool)

(assert (=> mapNonEmpty!31842 m!866169))

(declare-fun m!866171 () Bool)

(assert (=> b!932207 m!866171))

(declare-fun m!866173 () Bool)

(assert (=> b!932202 m!866173))

(declare-fun m!866175 () Bool)

(assert (=> b!932202 m!866175))

(declare-fun m!866177 () Bool)

(assert (=> b!932202 m!866177))

(declare-fun m!866179 () Bool)

(assert (=> b!932202 m!866179))

(declare-fun m!866181 () Bool)

(assert (=> b!932202 m!866181))

(declare-fun m!866183 () Bool)

(assert (=> b!932202 m!866183))

(declare-fun m!866185 () Bool)

(assert (=> b!932202 m!866185))

(assert (=> b!932202 m!866173))

(declare-fun m!866187 () Bool)

(assert (=> b!932202 m!866187))

(assert (=> b!932202 m!866185))

(declare-fun m!866189 () Bool)

(assert (=> b!932202 m!866189))

(assert (=> b!932202 m!866177))

(assert (=> b!932202 m!866179))

(declare-fun m!866191 () Bool)

(assert (=> b!932202 m!866191))

(declare-fun m!866193 () Bool)

(assert (=> b!932204 m!866193))

(check-sat tp_is_empty!20055 (not b!932208) (not b!932207) (not mapNonEmpty!31842) (not b_lambda!13881) (not b!932211) (not b!932202) b_and!28655 (not b_next!17547) (not b!932200) (not b!932210) (not start!79360) (not b!932204))
(check-sat b_and!28655 (not b_next!17547))
