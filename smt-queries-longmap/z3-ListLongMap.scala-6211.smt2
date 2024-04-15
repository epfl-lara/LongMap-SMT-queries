; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79382 () Bool)

(assert start!79382)

(declare-fun b_free!17587 () Bool)

(declare-fun b_next!17587 () Bool)

(assert (=> start!79382 (= b_free!17587 (not b_next!17587))))

(declare-fun tp!61205 () Bool)

(declare-fun b_and!28707 () Bool)

(assert (=> start!79382 (= tp!61205 b_and!28707)))

(declare-fun b!932780 () Bool)

(declare-fun res!628297 () Bool)

(declare-fun e!523780 () Bool)

(assert (=> b!932780 (=> (not res!628297) (not e!523780))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31759 0))(
  ( (V!31760 (val!10098 Int)) )
))
(declare-fun v!791 () V!31759)

(declare-datatypes ((tuple2!13290 0))(
  ( (tuple2!13291 (_1!6656 (_ BitVec 64)) (_2!6656 V!31759)) )
))
(declare-datatypes ((List!19040 0))(
  ( (Nil!19037) (Cons!19036 (h!20182 tuple2!13290) (t!27162 List!19040)) )
))
(declare-datatypes ((ListLongMap!11977 0))(
  ( (ListLongMap!11978 (toList!6004 List!19040)) )
))
(declare-fun lt!419954 () ListLongMap!11977)

(declare-fun apply!793 (ListLongMap!11977 (_ BitVec 64)) V!31759)

(assert (=> b!932780 (= res!628297 (= (apply!793 lt!419954 k0!1099) v!791))))

(declare-fun b!932781 () Bool)

(declare-fun e!523782 () Bool)

(assert (=> b!932781 (= e!523780 e!523782)))

(declare-fun res!628296 () Bool)

(assert (=> b!932781 (=> (not res!628296) (not e!523782))))

(declare-fun lt!419950 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932781 (= res!628296 (validKeyInArray!0 lt!419950))))

(declare-datatypes ((array!56095 0))(
  ( (array!56096 (arr!26992 (Array (_ BitVec 32) (_ BitVec 64))) (size!27453 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56095)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932781 (= lt!419950 (select (arr!26992 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932782 () Bool)

(declare-fun e!523783 () Bool)

(assert (=> b!932782 (= e!523783 e!523780)))

(declare-fun res!628299 () Bool)

(assert (=> b!932782 (=> (not res!628299) (not e!523780))))

(declare-fun contains!5001 (ListLongMap!11977 (_ BitVec 64)) Bool)

(assert (=> b!932782 (= res!628299 (contains!5001 lt!419954 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9566 0))(
  ( (ValueCellFull!9566 (v!12616 V!31759)) (EmptyCell!9566) )
))
(declare-datatypes ((array!56097 0))(
  ( (array!56098 (arr!26993 (Array (_ BitVec 32) ValueCell!9566)) (size!27454 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56097)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31759)

(declare-fun minValue!1173 () V!31759)

(declare-fun getCurrentListMap!3176 (array!56095 array!56097 (_ BitVec 32) (_ BitVec 32) V!31759 V!31759 (_ BitVec 32) Int) ListLongMap!11977)

(assert (=> b!932782 (= lt!419954 (getCurrentListMap!3176 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932783 () Bool)

(assert (=> b!932783 (= e!523782 (not true))))

(declare-datatypes ((List!19041 0))(
  ( (Nil!19038) (Cons!19037 (h!20183 (_ BitVec 64)) (t!27163 List!19041)) )
))
(declare-fun arrayNoDuplicates!0 (array!56095 (_ BitVec 32) List!19041) Bool)

(assert (=> b!932783 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19038)))

(declare-datatypes ((Unit!31392 0))(
  ( (Unit!31393) )
))
(declare-fun lt!419951 () Unit!31392)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56095 (_ BitVec 32) (_ BitVec 32)) Unit!31392)

(assert (=> b!932783 (= lt!419951 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419955 () tuple2!13290)

(declare-fun +!2811 (ListLongMap!11977 tuple2!13290) ListLongMap!11977)

(assert (=> b!932783 (contains!5001 (+!2811 lt!419954 lt!419955) k0!1099)))

(declare-fun lt!419952 () V!31759)

(declare-fun lt!419953 () Unit!31392)

(declare-fun addStillContains!500 (ListLongMap!11977 (_ BitVec 64) V!31759 (_ BitVec 64)) Unit!31392)

(assert (=> b!932783 (= lt!419953 (addStillContains!500 lt!419954 lt!419950 lt!419952 k0!1099))))

(assert (=> b!932783 (= (getCurrentListMap!3176 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2811 (getCurrentListMap!3176 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419955))))

(assert (=> b!932783 (= lt!419955 (tuple2!13291 lt!419950 lt!419952))))

(declare-fun get!14205 (ValueCell!9566 V!31759) V!31759)

(declare-fun dynLambda!1567 (Int (_ BitVec 64)) V!31759)

(assert (=> b!932783 (= lt!419952 (get!14205 (select (arr!26993 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1567 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419949 () Unit!31392)

(declare-fun lemmaListMapRecursiveValidKeyArray!175 (array!56095 array!56097 (_ BitVec 32) (_ BitVec 32) V!31759 V!31759 (_ BitVec 32) Int) Unit!31392)

(assert (=> b!932783 (= lt!419949 (lemmaListMapRecursiveValidKeyArray!175 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932784 () Bool)

(declare-fun res!628302 () Bool)

(assert (=> b!932784 (=> (not res!628302) (not e!523783))))

(assert (=> b!932784 (= res!628302 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27453 _keys!1487))))))

(declare-fun b!932785 () Bool)

(declare-fun e!523784 () Bool)

(declare-fun e!523778 () Bool)

(declare-fun mapRes!31902 () Bool)

(assert (=> b!932785 (= e!523784 (and e!523778 mapRes!31902))))

(declare-fun condMapEmpty!31902 () Bool)

(declare-fun mapDefault!31902 () ValueCell!9566)

(assert (=> b!932785 (= condMapEmpty!31902 (= (arr!26993 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9566)) mapDefault!31902)))))

(declare-fun b!932786 () Bool)

(declare-fun res!628298 () Bool)

(assert (=> b!932786 (=> (not res!628298) (not e!523780))))

(assert (=> b!932786 (= res!628298 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932787 () Bool)

(declare-fun res!628301 () Bool)

(assert (=> b!932787 (=> (not res!628301) (not e!523780))))

(assert (=> b!932787 (= res!628301 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!31902 () Bool)

(assert (=> mapIsEmpty!31902 mapRes!31902))

(declare-fun b!932789 () Bool)

(declare-fun res!628300 () Bool)

(assert (=> b!932789 (=> (not res!628300) (not e!523783))))

(assert (=> b!932789 (= res!628300 (and (= (size!27454 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27453 _keys!1487) (size!27454 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932790 () Bool)

(declare-fun e!523779 () Bool)

(declare-fun tp_is_empty!20095 () Bool)

(assert (=> b!932790 (= e!523779 tp_is_empty!20095)))

(declare-fun mapNonEmpty!31902 () Bool)

(declare-fun tp!61206 () Bool)

(assert (=> mapNonEmpty!31902 (= mapRes!31902 (and tp!61206 e!523779))))

(declare-fun mapValue!31902 () ValueCell!9566)

(declare-fun mapRest!31902 () (Array (_ BitVec 32) ValueCell!9566))

(declare-fun mapKey!31902 () (_ BitVec 32))

(assert (=> mapNonEmpty!31902 (= (arr!26993 _values!1231) (store mapRest!31902 mapKey!31902 mapValue!31902))))

(declare-fun b!932791 () Bool)

(declare-fun res!628304 () Bool)

(assert (=> b!932791 (=> (not res!628304) (not e!523783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56095 (_ BitVec 32)) Bool)

(assert (=> b!932791 (= res!628304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932792 () Bool)

(assert (=> b!932792 (= e!523778 tp_is_empty!20095)))

(declare-fun res!628303 () Bool)

(assert (=> start!79382 (=> (not res!628303) (not e!523783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79382 (= res!628303 (validMask!0 mask!1881))))

(assert (=> start!79382 e!523783))

(assert (=> start!79382 true))

(assert (=> start!79382 tp_is_empty!20095))

(declare-fun array_inv!21076 (array!56097) Bool)

(assert (=> start!79382 (and (array_inv!21076 _values!1231) e!523784)))

(assert (=> start!79382 tp!61205))

(declare-fun array_inv!21077 (array!56095) Bool)

(assert (=> start!79382 (array_inv!21077 _keys!1487)))

(declare-fun b!932788 () Bool)

(declare-fun res!628295 () Bool)

(assert (=> b!932788 (=> (not res!628295) (not e!523783))))

(assert (=> b!932788 (= res!628295 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19038))))

(assert (= (and start!79382 res!628303) b!932789))

(assert (= (and b!932789 res!628300) b!932791))

(assert (= (and b!932791 res!628304) b!932788))

(assert (= (and b!932788 res!628295) b!932784))

(assert (= (and b!932784 res!628302) b!932782))

(assert (= (and b!932782 res!628299) b!932780))

(assert (= (and b!932780 res!628297) b!932786))

(assert (= (and b!932786 res!628298) b!932787))

(assert (= (and b!932787 res!628301) b!932781))

(assert (= (and b!932781 res!628296) b!932783))

(assert (= (and b!932785 condMapEmpty!31902) mapIsEmpty!31902))

(assert (= (and b!932785 (not condMapEmpty!31902)) mapNonEmpty!31902))

(get-info :version)

(assert (= (and mapNonEmpty!31902 ((_ is ValueCellFull!9566) mapValue!31902)) b!932790))

(assert (= (and b!932785 ((_ is ValueCellFull!9566) mapDefault!31902)) b!932792))

(assert (= start!79382 b!932785))

(declare-fun b_lambda!13903 () Bool)

(assert (=> (not b_lambda!13903) (not b!932783)))

(declare-fun t!27161 () Bool)

(declare-fun tb!5973 () Bool)

(assert (=> (and start!79382 (= defaultEntry!1235 defaultEntry!1235) t!27161) tb!5973))

(declare-fun result!11779 () Bool)

(assert (=> tb!5973 (= result!11779 tp_is_empty!20095)))

(assert (=> b!932783 t!27161))

(declare-fun b_and!28709 () Bool)

(assert (= b_and!28707 (and (=> t!27161 result!11779) b_and!28709)))

(declare-fun m!866321 () Bool)

(assert (=> start!79382 m!866321))

(declare-fun m!866323 () Bool)

(assert (=> start!79382 m!866323))

(declare-fun m!866325 () Bool)

(assert (=> start!79382 m!866325))

(declare-fun m!866327 () Bool)

(assert (=> b!932791 m!866327))

(declare-fun m!866329 () Bool)

(assert (=> b!932788 m!866329))

(declare-fun m!866331 () Bool)

(assert (=> b!932780 m!866331))

(declare-fun m!866333 () Bool)

(assert (=> b!932782 m!866333))

(declare-fun m!866335 () Bool)

(assert (=> b!932782 m!866335))

(declare-fun m!866337 () Bool)

(assert (=> mapNonEmpty!31902 m!866337))

(declare-fun m!866339 () Bool)

(assert (=> b!932783 m!866339))

(declare-fun m!866341 () Bool)

(assert (=> b!932783 m!866341))

(declare-fun m!866343 () Bool)

(assert (=> b!932783 m!866343))

(declare-fun m!866345 () Bool)

(assert (=> b!932783 m!866345))

(assert (=> b!932783 m!866339))

(declare-fun m!866347 () Bool)

(assert (=> b!932783 m!866347))

(declare-fun m!866349 () Bool)

(assert (=> b!932783 m!866349))

(declare-fun m!866351 () Bool)

(assert (=> b!932783 m!866351))

(declare-fun m!866353 () Bool)

(assert (=> b!932783 m!866353))

(declare-fun m!866355 () Bool)

(assert (=> b!932783 m!866355))

(assert (=> b!932783 m!866347))

(declare-fun m!866357 () Bool)

(assert (=> b!932783 m!866357))

(declare-fun m!866359 () Bool)

(assert (=> b!932783 m!866359))

(assert (=> b!932783 m!866341))

(assert (=> b!932783 m!866357))

(declare-fun m!866361 () Bool)

(assert (=> b!932783 m!866361))

(declare-fun m!866363 () Bool)

(assert (=> b!932787 m!866363))

(declare-fun m!866365 () Bool)

(assert (=> b!932781 m!866365))

(declare-fun m!866367 () Bool)

(assert (=> b!932781 m!866367))

(check-sat (not b!932780) (not b!932783) (not b_next!17587) (not b_lambda!13903) tp_is_empty!20095 b_and!28709 (not start!79382) (not mapNonEmpty!31902) (not b!932791) (not b!932788) (not b!932782) (not b!932787) (not b!932781))
(check-sat b_and!28709 (not b_next!17587))
