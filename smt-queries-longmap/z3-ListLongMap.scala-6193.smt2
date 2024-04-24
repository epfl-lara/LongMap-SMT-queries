; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79434 () Bool)

(assert start!79434)

(declare-fun b_free!17479 () Bool)

(declare-fun b_next!17479 () Bool)

(assert (=> start!79434 (= b_free!17479 (not b_next!17479))))

(declare-fun tp!60878 () Bool)

(declare-fun b_and!28555 () Bool)

(assert (=> start!79434 (= tp!60878 b_and!28555)))

(declare-fun b!931746 () Bool)

(declare-fun e!523321 () Bool)

(declare-fun e!523318 () Bool)

(declare-fun mapRes!31737 () Bool)

(assert (=> b!931746 (= e!523321 (and e!523318 mapRes!31737))))

(declare-fun condMapEmpty!31737 () Bool)

(declare-datatypes ((V!31615 0))(
  ( (V!31616 (val!10044 Int)) )
))
(declare-datatypes ((ValueCell!9512 0))(
  ( (ValueCellFull!9512 (v!12559 V!31615)) (EmptyCell!9512) )
))
(declare-datatypes ((array!55979 0))(
  ( (array!55980 (arr!26930 (Array (_ BitVec 32) ValueCell!9512)) (size!27390 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55979)

(declare-fun mapDefault!31737 () ValueCell!9512)

(assert (=> b!931746 (= condMapEmpty!31737 (= (arr!26930 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9512)) mapDefault!31737)))))

(declare-fun b!931747 () Bool)

(declare-fun res!627226 () Bool)

(declare-fun e!523317 () Bool)

(assert (=> b!931747 (=> (not res!627226) (not e!523317))))

(declare-datatypes ((array!55981 0))(
  ( (array!55982 (arr!26931 (Array (_ BitVec 32) (_ BitVec 64))) (size!27391 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55981)

(declare-datatypes ((List!18932 0))(
  ( (Nil!18929) (Cons!18928 (h!20080 (_ BitVec 64)) (t!26981 List!18932)) )
))
(declare-fun arrayNoDuplicates!0 (array!55981 (_ BitVec 32) List!18932) Bool)

(assert (=> b!931747 (= res!627226 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18929))))

(declare-fun b!931748 () Bool)

(declare-fun res!627231 () Bool)

(assert (=> b!931748 (=> (not res!627231) (not e!523317))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931748 (= res!627231 (and (= (size!27390 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27391 _keys!1487) (size!27390 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!627229 () Bool)

(assert (=> start!79434 (=> (not res!627229) (not e!523317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79434 (= res!627229 (validMask!0 mask!1881))))

(assert (=> start!79434 e!523317))

(assert (=> start!79434 true))

(declare-fun array_inv!21056 (array!55979) Bool)

(assert (=> start!79434 (and (array_inv!21056 _values!1231) e!523321)))

(assert (=> start!79434 tp!60878))

(declare-fun array_inv!21057 (array!55981) Bool)

(assert (=> start!79434 (array_inv!21057 _keys!1487)))

(declare-fun tp_is_empty!19987 () Bool)

(assert (=> start!79434 tp_is_empty!19987))

(declare-fun b!931749 () Bool)

(declare-fun e!523316 () Bool)

(assert (=> b!931749 (= e!523317 e!523316)))

(declare-fun res!627228 () Bool)

(assert (=> b!931749 (=> (not res!627228) (not e!523316))))

(declare-datatypes ((tuple2!13144 0))(
  ( (tuple2!13145 (_1!6583 (_ BitVec 64)) (_2!6583 V!31615)) )
))
(declare-datatypes ((List!18933 0))(
  ( (Nil!18930) (Cons!18929 (h!20081 tuple2!13144) (t!26982 List!18933)) )
))
(declare-datatypes ((ListLongMap!11843 0))(
  ( (ListLongMap!11844 (toList!5937 List!18933)) )
))
(declare-fun lt!419678 () ListLongMap!11843)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5002 (ListLongMap!11843 (_ BitVec 64)) Bool)

(assert (=> b!931749 (= res!627228 (contains!5002 lt!419678 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31615)

(declare-fun minValue!1173 () V!31615)

(declare-fun getCurrentListMap!3180 (array!55981 array!55979 (_ BitVec 32) (_ BitVec 32) V!31615 V!31615 (_ BitVec 32) Int) ListLongMap!11843)

(assert (=> b!931749 (= lt!419678 (getCurrentListMap!3180 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31737 () Bool)

(assert (=> mapIsEmpty!31737 mapRes!31737))

(declare-fun b!931750 () Bool)

(declare-fun res!627227 () Bool)

(assert (=> b!931750 (=> (not res!627227) (not e!523317))))

(assert (=> b!931750 (= res!627227 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27391 _keys!1487))))))

(declare-fun b!931751 () Bool)

(assert (=> b!931751 (= e!523318 tp_is_empty!19987)))

(declare-fun b!931752 () Bool)

(assert (=> b!931752 (= e!523316 false)))

(declare-fun lt!419677 () V!31615)

(declare-fun apply!772 (ListLongMap!11843 (_ BitVec 64)) V!31615)

(assert (=> b!931752 (= lt!419677 (apply!772 lt!419678 k0!1099))))

(declare-fun b!931753 () Bool)

(declare-fun res!627230 () Bool)

(assert (=> b!931753 (=> (not res!627230) (not e!523317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55981 (_ BitVec 32)) Bool)

(assert (=> b!931753 (= res!627230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31737 () Bool)

(declare-fun tp!60879 () Bool)

(declare-fun e!523320 () Bool)

(assert (=> mapNonEmpty!31737 (= mapRes!31737 (and tp!60879 e!523320))))

(declare-fun mapRest!31737 () (Array (_ BitVec 32) ValueCell!9512))

(declare-fun mapKey!31737 () (_ BitVec 32))

(declare-fun mapValue!31737 () ValueCell!9512)

(assert (=> mapNonEmpty!31737 (= (arr!26930 _values!1231) (store mapRest!31737 mapKey!31737 mapValue!31737))))

(declare-fun b!931754 () Bool)

(assert (=> b!931754 (= e!523320 tp_is_empty!19987)))

(assert (= (and start!79434 res!627229) b!931748))

(assert (= (and b!931748 res!627231) b!931753))

(assert (= (and b!931753 res!627230) b!931747))

(assert (= (and b!931747 res!627226) b!931750))

(assert (= (and b!931750 res!627227) b!931749))

(assert (= (and b!931749 res!627228) b!931752))

(assert (= (and b!931746 condMapEmpty!31737) mapIsEmpty!31737))

(assert (= (and b!931746 (not condMapEmpty!31737)) mapNonEmpty!31737))

(get-info :version)

(assert (= (and mapNonEmpty!31737 ((_ is ValueCellFull!9512) mapValue!31737)) b!931754))

(assert (= (and b!931746 ((_ is ValueCellFull!9512) mapDefault!31737)) b!931751))

(assert (= start!79434 b!931746))

(declare-fun m!866215 () Bool)

(assert (=> b!931749 m!866215))

(declare-fun m!866217 () Bool)

(assert (=> b!931749 m!866217))

(declare-fun m!866219 () Bool)

(assert (=> start!79434 m!866219))

(declare-fun m!866221 () Bool)

(assert (=> start!79434 m!866221))

(declare-fun m!866223 () Bool)

(assert (=> start!79434 m!866223))

(declare-fun m!866225 () Bool)

(assert (=> mapNonEmpty!31737 m!866225))

(declare-fun m!866227 () Bool)

(assert (=> b!931752 m!866227))

(declare-fun m!866229 () Bool)

(assert (=> b!931753 m!866229))

(declare-fun m!866231 () Bool)

(assert (=> b!931747 m!866231))

(check-sat (not start!79434) (not b_next!17479) (not b!931749) (not b!931753) (not b!931747) (not b!931752) b_and!28555 tp_is_empty!19987 (not mapNonEmpty!31737))
(check-sat b_and!28555 (not b_next!17479))
