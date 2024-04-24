; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79026 () Bool)

(assert start!79026)

(declare-fun b_free!17071 () Bool)

(declare-fun b_next!17071 () Bool)

(assert (=> start!79026 (= b_free!17071 (not b_next!17071))))

(declare-fun tp!59655 () Bool)

(declare-fun b_and!27889 () Bool)

(assert (=> start!79026 (= tp!59655 b_and!27889)))

(declare-fun b!922218 () Bool)

(declare-fun res!621652 () Bool)

(declare-fun e!517601 () Bool)

(assert (=> b!922218 (=> res!621652 e!517601)))

(declare-datatypes ((List!18597 0))(
  ( (Nil!18594) (Cons!18593 (h!19745 (_ BitVec 64)) (t!26390 List!18597)) )
))
(declare-fun contains!4821 (List!18597 (_ BitVec 64)) Bool)

(assert (=> b!922218 (= res!621652 (contains!4821 Nil!18594 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!922219 () Bool)

(declare-fun res!621653 () Bool)

(declare-fun e!517603 () Bool)

(assert (=> b!922219 (=> (not res!621653) (not e!517603))))

(declare-datatypes ((array!55183 0))(
  ( (array!55184 (arr!26532 (Array (_ BitVec 32) (_ BitVec 64))) (size!26992 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55183)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55183 (_ BitVec 32)) Bool)

(assert (=> b!922219 (= res!621653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31125 () Bool)

(declare-fun mapRes!31125 () Bool)

(assert (=> mapIsEmpty!31125 mapRes!31125))

(declare-fun b!922220 () Bool)

(declare-fun res!621643 () Bool)

(assert (=> b!922220 (=> (not res!621643) (not e!517603))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922220 (= res!621643 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26992 _keys!1487))))))

(declare-fun res!621645 () Bool)

(assert (=> start!79026 (=> (not res!621645) (not e!517603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79026 (= res!621645 (validMask!0 mask!1881))))

(assert (=> start!79026 e!517603))

(assert (=> start!79026 true))

(declare-fun tp_is_empty!19579 () Bool)

(assert (=> start!79026 tp_is_empty!19579))

(declare-datatypes ((V!31071 0))(
  ( (V!31072 (val!9840 Int)) )
))
(declare-datatypes ((ValueCell!9308 0))(
  ( (ValueCellFull!9308 (v!12355 V!31071)) (EmptyCell!9308) )
))
(declare-datatypes ((array!55185 0))(
  ( (array!55186 (arr!26533 (Array (_ BitVec 32) ValueCell!9308)) (size!26993 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55185)

(declare-fun e!517605 () Bool)

(declare-fun array_inv!20772 (array!55185) Bool)

(assert (=> start!79026 (and (array_inv!20772 _values!1231) e!517605)))

(assert (=> start!79026 tp!59655))

(declare-fun array_inv!20773 (array!55183) Bool)

(assert (=> start!79026 (array_inv!20773 _keys!1487)))

(declare-fun b!922221 () Bool)

(declare-fun e!517604 () Bool)

(assert (=> b!922221 (= e!517604 (not e!517601))))

(declare-fun res!621642 () Bool)

(assert (=> b!922221 (=> res!621642 e!517601)))

(assert (=> b!922221 (= res!621642 (or (bvsge (size!26992 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26992 _keys!1487))))))

(declare-fun e!517600 () Bool)

(assert (=> b!922221 e!517600))

(declare-fun c!96390 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!922221 (= c!96390 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31084 0))(
  ( (Unit!31085) )
))
(declare-fun lt!414001 () Unit!31084)

(declare-fun zeroValue!1173 () V!31071)

(declare-fun minValue!1173 () V!31071)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!177 (array!55183 array!55185 (_ BitVec 32) (_ BitVec 32) V!31071 V!31071 (_ BitVec 64) (_ BitVec 32) Int) Unit!31084)

(assert (=> b!922221 (= lt!414001 (lemmaListMapContainsThenArrayContainsFrom!177 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55183 (_ BitVec 32) List!18597) Bool)

(assert (=> b!922221 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18594)))

(declare-fun lt!413995 () Unit!31084)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55183 (_ BitVec 32) (_ BitVec 32)) Unit!31084)

(assert (=> b!922221 (= lt!413995 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12780 0))(
  ( (tuple2!12781 (_1!6401 (_ BitVec 64)) (_2!6401 V!31071)) )
))
(declare-datatypes ((List!18598 0))(
  ( (Nil!18595) (Cons!18594 (h!19746 tuple2!12780) (t!26391 List!18598)) )
))
(declare-datatypes ((ListLongMap!11479 0))(
  ( (ListLongMap!11480 (toList!5755 List!18598)) )
))
(declare-fun lt!413998 () ListLongMap!11479)

(declare-fun lt!413994 () tuple2!12780)

(declare-fun contains!4822 (ListLongMap!11479 (_ BitVec 64)) Bool)

(declare-fun +!2686 (ListLongMap!11479 tuple2!12780) ListLongMap!11479)

(assert (=> b!922221 (contains!4822 (+!2686 lt!413998 lt!413994) k0!1099)))

(declare-fun lt!413999 () Unit!31084)

(declare-fun lt!413997 () V!31071)

(declare-fun lt!414000 () (_ BitVec 64))

(declare-fun addStillContains!395 (ListLongMap!11479 (_ BitVec 64) V!31071 (_ BitVec 64)) Unit!31084)

(assert (=> b!922221 (= lt!413999 (addStillContains!395 lt!413998 lt!414000 lt!413997 k0!1099))))

(declare-fun getCurrentListMap!3008 (array!55183 array!55185 (_ BitVec 32) (_ BitVec 32) V!31071 V!31071 (_ BitVec 32) Int) ListLongMap!11479)

(assert (=> b!922221 (= (getCurrentListMap!3008 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2686 (getCurrentListMap!3008 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413994))))

(assert (=> b!922221 (= lt!413994 (tuple2!12781 lt!414000 lt!413997))))

(declare-fun get!13945 (ValueCell!9308 V!31071) V!31071)

(declare-fun dynLambda!1483 (Int (_ BitVec 64)) V!31071)

(assert (=> b!922221 (= lt!413997 (get!13945 (select (arr!26533 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1483 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413996 () Unit!31084)

(declare-fun lemmaListMapRecursiveValidKeyArray!66 (array!55183 array!55185 (_ BitVec 32) (_ BitVec 32) V!31071 V!31071 (_ BitVec 32) Int) Unit!31084)

(assert (=> b!922221 (= lt!413996 (lemmaListMapRecursiveValidKeyArray!66 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922222 () Bool)

(declare-fun res!621647 () Bool)

(assert (=> b!922222 (=> (not res!621647) (not e!517603))))

(assert (=> b!922222 (= res!621647 (and (= (size!26993 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26992 _keys!1487) (size!26993 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922223 () Bool)

(declare-fun res!621649 () Bool)

(assert (=> b!922223 (=> (not res!621649) (not e!517603))))

(assert (=> b!922223 (= res!621649 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18594))))

(declare-fun b!922224 () Bool)

(assert (=> b!922224 (= e!517601 true)))

(declare-fun lt!414002 () Bool)

(assert (=> b!922224 (= lt!414002 (contains!4821 Nil!18594 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!922225 () Bool)

(declare-fun e!517606 () Bool)

(assert (=> b!922225 (= e!517606 e!517604)))

(declare-fun res!621650 () Bool)

(assert (=> b!922225 (=> (not res!621650) (not e!517604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922225 (= res!621650 (validKeyInArray!0 lt!414000))))

(assert (=> b!922225 (= lt!414000 (select (arr!26532 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922226 () Bool)

(declare-fun res!621646 () Bool)

(assert (=> b!922226 (=> (not res!621646) (not e!517606))))

(assert (=> b!922226 (= res!621646 (validKeyInArray!0 k0!1099))))

(declare-fun b!922227 () Bool)

(declare-fun res!621651 () Bool)

(assert (=> b!922227 (=> (not res!621651) (not e!517606))))

(assert (=> b!922227 (= res!621651 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922228 () Bool)

(assert (=> b!922228 (= e!517603 e!517606)))

(declare-fun res!621648 () Bool)

(assert (=> b!922228 (=> (not res!621648) (not e!517606))))

(assert (=> b!922228 (= res!621648 (contains!4822 lt!413998 k0!1099))))

(assert (=> b!922228 (= lt!413998 (getCurrentListMap!3008 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922229 () Bool)

(assert (=> b!922229 (= e!517600 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922230 () Bool)

(declare-fun e!517602 () Bool)

(assert (=> b!922230 (= e!517602 tp_is_empty!19579)))

(declare-fun mapNonEmpty!31125 () Bool)

(declare-fun tp!59654 () Bool)

(assert (=> mapNonEmpty!31125 (= mapRes!31125 (and tp!59654 e!517602))))

(declare-fun mapValue!31125 () ValueCell!9308)

(declare-fun mapRest!31125 () (Array (_ BitVec 32) ValueCell!9308))

(declare-fun mapKey!31125 () (_ BitVec 32))

(assert (=> mapNonEmpty!31125 (= (arr!26533 _values!1231) (store mapRest!31125 mapKey!31125 mapValue!31125))))

(declare-fun b!922231 () Bool)

(declare-fun e!517599 () Bool)

(assert (=> b!922231 (= e!517605 (and e!517599 mapRes!31125))))

(declare-fun condMapEmpty!31125 () Bool)

(declare-fun mapDefault!31125 () ValueCell!9308)

(assert (=> b!922231 (= condMapEmpty!31125 (= (arr!26533 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9308)) mapDefault!31125)))))

(declare-fun b!922232 () Bool)

(declare-fun arrayContainsKey!0 (array!55183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922232 (= e!517600 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922233 () Bool)

(declare-fun res!621644 () Bool)

(assert (=> b!922233 (=> (not res!621644) (not e!517606))))

(declare-fun v!791 () V!31071)

(declare-fun apply!617 (ListLongMap!11479 (_ BitVec 64)) V!31071)

(assert (=> b!922233 (= res!621644 (= (apply!617 lt!413998 k0!1099) v!791))))

(declare-fun b!922234 () Bool)

(declare-fun res!621654 () Bool)

(assert (=> b!922234 (=> res!621654 e!517601)))

(declare-fun noDuplicate!1353 (List!18597) Bool)

(assert (=> b!922234 (= res!621654 (not (noDuplicate!1353 Nil!18594)))))

(declare-fun b!922235 () Bool)

(assert (=> b!922235 (= e!517599 tp_is_empty!19579)))

(assert (= (and start!79026 res!621645) b!922222))

(assert (= (and b!922222 res!621647) b!922219))

(assert (= (and b!922219 res!621653) b!922223))

(assert (= (and b!922223 res!621649) b!922220))

(assert (= (and b!922220 res!621643) b!922228))

(assert (= (and b!922228 res!621648) b!922233))

(assert (= (and b!922233 res!621644) b!922227))

(assert (= (and b!922227 res!621651) b!922226))

(assert (= (and b!922226 res!621646) b!922225))

(assert (= (and b!922225 res!621650) b!922221))

(assert (= (and b!922221 c!96390) b!922232))

(assert (= (and b!922221 (not c!96390)) b!922229))

(assert (= (and b!922221 (not res!621642)) b!922234))

(assert (= (and b!922234 (not res!621654)) b!922218))

(assert (= (and b!922218 (not res!621652)) b!922224))

(assert (= (and b!922231 condMapEmpty!31125) mapIsEmpty!31125))

(assert (= (and b!922231 (not condMapEmpty!31125)) mapNonEmpty!31125))

(get-info :version)

(assert (= (and mapNonEmpty!31125 ((_ is ValueCellFull!9308) mapValue!31125)) b!922230))

(assert (= (and b!922231 ((_ is ValueCellFull!9308) mapDefault!31125)) b!922235))

(assert (= start!79026 b!922231))

(declare-fun b_lambda!13587 () Bool)

(assert (=> (not b_lambda!13587) (not b!922221)))

(declare-fun t!26389 () Bool)

(declare-fun tb!5643 () Bool)

(assert (=> (and start!79026 (= defaultEntry!1235 defaultEntry!1235) t!26389) tb!5643))

(declare-fun result!11117 () Bool)

(assert (=> tb!5643 (= result!11117 tp_is_empty!19579)))

(assert (=> b!922221 t!26389))

(declare-fun b_and!27891 () Bool)

(assert (= b_and!27889 (and (=> t!26389 result!11117) b_and!27891)))

(declare-fun m!856561 () Bool)

(assert (=> b!922224 m!856561))

(declare-fun m!856563 () Bool)

(assert (=> b!922223 m!856563))

(declare-fun m!856565 () Bool)

(assert (=> b!922233 m!856565))

(declare-fun m!856567 () Bool)

(assert (=> b!922221 m!856567))

(declare-fun m!856569 () Bool)

(assert (=> b!922221 m!856569))

(declare-fun m!856571 () Bool)

(assert (=> b!922221 m!856571))

(assert (=> b!922221 m!856567))

(declare-fun m!856573 () Bool)

(assert (=> b!922221 m!856573))

(declare-fun m!856575 () Bool)

(assert (=> b!922221 m!856575))

(assert (=> b!922221 m!856571))

(assert (=> b!922221 m!856575))

(declare-fun m!856577 () Bool)

(assert (=> b!922221 m!856577))

(declare-fun m!856579 () Bool)

(assert (=> b!922221 m!856579))

(declare-fun m!856581 () Bool)

(assert (=> b!922221 m!856581))

(declare-fun m!856583 () Bool)

(assert (=> b!922221 m!856583))

(declare-fun m!856585 () Bool)

(assert (=> b!922221 m!856585))

(declare-fun m!856587 () Bool)

(assert (=> b!922221 m!856587))

(declare-fun m!856589 () Bool)

(assert (=> b!922221 m!856589))

(assert (=> b!922221 m!856587))

(declare-fun m!856591 () Bool)

(assert (=> b!922221 m!856591))

(declare-fun m!856593 () Bool)

(assert (=> b!922228 m!856593))

(declare-fun m!856595 () Bool)

(assert (=> b!922228 m!856595))

(declare-fun m!856597 () Bool)

(assert (=> mapNonEmpty!31125 m!856597))

(declare-fun m!856599 () Bool)

(assert (=> start!79026 m!856599))

(declare-fun m!856601 () Bool)

(assert (=> start!79026 m!856601))

(declare-fun m!856603 () Bool)

(assert (=> start!79026 m!856603))

(declare-fun m!856605 () Bool)

(assert (=> b!922219 m!856605))

(declare-fun m!856607 () Bool)

(assert (=> b!922234 m!856607))

(declare-fun m!856609 () Bool)

(assert (=> b!922232 m!856609))

(declare-fun m!856611 () Bool)

(assert (=> b!922225 m!856611))

(declare-fun m!856613 () Bool)

(assert (=> b!922225 m!856613))

(declare-fun m!856615 () Bool)

(assert (=> b!922226 m!856615))

(declare-fun m!856617 () Bool)

(assert (=> b!922218 m!856617))

(check-sat (not b!922228) b_and!27891 (not b!922233) (not b!922223) (not b!922224) tp_is_empty!19579 (not start!79026) (not b!922232) (not b!922219) (not b!922221) (not b!922225) (not mapNonEmpty!31125) (not b!922226) (not b_next!17071) (not b!922234) (not b_lambda!13587) (not b!922218))
(check-sat b_and!27891 (not b_next!17071))
