; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78672 () Bool)

(assert start!78672)

(declare-fun b_free!16903 () Bool)

(declare-fun b_next!16903 () Bool)

(assert (=> start!78672 (= b_free!16903 (not b_next!16903))))

(declare-fun tp!59150 () Bool)

(declare-fun b_and!27517 () Bool)

(assert (=> start!78672 (= tp!59150 b_and!27517)))

(declare-fun b!917352 () Bool)

(declare-fun e!514993 () Bool)

(declare-fun e!514997 () Bool)

(declare-fun mapRes!30873 () Bool)

(assert (=> b!917352 (= e!514993 (and e!514997 mapRes!30873))))

(declare-fun condMapEmpty!30873 () Bool)

(declare-datatypes ((V!30847 0))(
  ( (V!30848 (val!9756 Int)) )
))
(declare-datatypes ((ValueCell!9224 0))(
  ( (ValueCellFull!9224 (v!12273 V!30847)) (EmptyCell!9224) )
))
(declare-datatypes ((array!54797 0))(
  ( (array!54798 (arr!26344 (Array (_ BitVec 32) ValueCell!9224)) (size!26805 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54797)

(declare-fun mapDefault!30873 () ValueCell!9224)

(assert (=> b!917352 (= condMapEmpty!30873 (= (arr!26344 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9224)) mapDefault!30873)))))

(declare-fun mapNonEmpty!30873 () Bool)

(declare-fun tp!59151 () Bool)

(declare-fun e!514994 () Bool)

(assert (=> mapNonEmpty!30873 (= mapRes!30873 (and tp!59151 e!514994))))

(declare-fun mapKey!30873 () (_ BitVec 32))

(declare-fun mapValue!30873 () ValueCell!9224)

(declare-fun mapRest!30873 () (Array (_ BitVec 32) ValueCell!9224))

(assert (=> mapNonEmpty!30873 (= (arr!26344 _values!1231) (store mapRest!30873 mapKey!30873 mapValue!30873))))

(declare-fun b!917353 () Bool)

(declare-fun e!514995 () Bool)

(declare-fun e!514992 () Bool)

(assert (=> b!917353 (= e!514995 e!514992)))

(declare-fun res!618506 () Bool)

(assert (=> b!917353 (=> (not res!618506) (not e!514992))))

(declare-datatypes ((tuple2!12718 0))(
  ( (tuple2!12719 (_1!6370 (_ BitVec 64)) (_2!6370 V!30847)) )
))
(declare-datatypes ((List!18507 0))(
  ( (Nil!18504) (Cons!18503 (h!19649 tuple2!12718) (t!26131 List!18507)) )
))
(declare-datatypes ((ListLongMap!11405 0))(
  ( (ListLongMap!11406 (toList!5718 List!18507)) )
))
(declare-fun lt!411811 () ListLongMap!11405)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4721 (ListLongMap!11405 (_ BitVec 64)) Bool)

(assert (=> b!917353 (= res!618506 (contains!4721 lt!411811 k0!1099))))

(declare-datatypes ((array!54799 0))(
  ( (array!54800 (arr!26345 (Array (_ BitVec 32) (_ BitVec 64))) (size!26806 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54799)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30847)

(declare-fun minValue!1173 () V!30847)

(declare-fun getCurrentListMap!2911 (array!54799 array!54797 (_ BitVec 32) (_ BitVec 32) V!30847 V!30847 (_ BitVec 32) Int) ListLongMap!11405)

(assert (=> b!917353 (= lt!411811 (getCurrentListMap!2911 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917354 () Bool)

(declare-fun res!618502 () Bool)

(assert (=> b!917354 (=> (not res!618502) (not e!514992))))

(assert (=> b!917354 (= res!618502 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917355 () Bool)

(declare-fun tp_is_empty!19411 () Bool)

(assert (=> b!917355 (= e!514997 tp_is_empty!19411)))

(declare-fun b!917356 () Bool)

(declare-fun e!514996 () Bool)

(assert (=> b!917356 (= e!514996 (not true))))

(declare-fun lt!411812 () (_ BitVec 64))

(declare-fun +!2642 (ListLongMap!11405 tuple2!12718) ListLongMap!11405)

(declare-fun get!13805 (ValueCell!9224 V!30847) V!30847)

(declare-fun dynLambda!1398 (Int (_ BitVec 64)) V!30847)

(assert (=> b!917356 (= (getCurrentListMap!2911 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2642 (getCurrentListMap!2911 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12719 lt!411812 (get!13805 (select (arr!26344 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1398 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30896 0))(
  ( (Unit!30897) )
))
(declare-fun lt!411810 () Unit!30896)

(declare-fun lemmaListMapRecursiveValidKeyArray!6 (array!54799 array!54797 (_ BitVec 32) (_ BitVec 32) V!30847 V!30847 (_ BitVec 32) Int) Unit!30896)

(assert (=> b!917356 (= lt!411810 (lemmaListMapRecursiveValidKeyArray!6 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917357 () Bool)

(declare-fun res!618507 () Bool)

(assert (=> b!917357 (=> (not res!618507) (not e!514995))))

(declare-datatypes ((List!18508 0))(
  ( (Nil!18505) (Cons!18504 (h!19650 (_ BitVec 64)) (t!26132 List!18508)) )
))
(declare-fun arrayNoDuplicates!0 (array!54799 (_ BitVec 32) List!18508) Bool)

(assert (=> b!917357 (= res!618507 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18505))))

(declare-fun b!917358 () Bool)

(declare-fun res!618505 () Bool)

(assert (=> b!917358 (=> (not res!618505) (not e!514992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917358 (= res!618505 (validKeyInArray!0 k0!1099))))

(declare-fun b!917359 () Bool)

(declare-fun res!618501 () Bool)

(assert (=> b!917359 (=> (not res!618501) (not e!514992))))

(declare-fun v!791 () V!30847)

(declare-fun apply!556 (ListLongMap!11405 (_ BitVec 64)) V!30847)

(assert (=> b!917359 (= res!618501 (= (apply!556 lt!411811 k0!1099) v!791))))

(declare-fun mapIsEmpty!30873 () Bool)

(assert (=> mapIsEmpty!30873 mapRes!30873))

(declare-fun b!917360 () Bool)

(declare-fun res!618500 () Bool)

(assert (=> b!917360 (=> (not res!618500) (not e!514995))))

(assert (=> b!917360 (= res!618500 (and (= (size!26805 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26806 _keys!1487) (size!26805 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917361 () Bool)

(assert (=> b!917361 (= e!514994 tp_is_empty!19411)))

(declare-fun b!917362 () Bool)

(declare-fun res!618508 () Bool)

(assert (=> b!917362 (=> (not res!618508) (not e!514995))))

(assert (=> b!917362 (= res!618508 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26806 _keys!1487))))))

(declare-fun res!618503 () Bool)

(assert (=> start!78672 (=> (not res!618503) (not e!514995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78672 (= res!618503 (validMask!0 mask!1881))))

(assert (=> start!78672 e!514995))

(assert (=> start!78672 true))

(assert (=> start!78672 tp_is_empty!19411))

(declare-fun array_inv!20622 (array!54797) Bool)

(assert (=> start!78672 (and (array_inv!20622 _values!1231) e!514993)))

(assert (=> start!78672 tp!59150))

(declare-fun array_inv!20623 (array!54799) Bool)

(assert (=> start!78672 (array_inv!20623 _keys!1487)))

(declare-fun b!917363 () Bool)

(declare-fun res!618504 () Bool)

(assert (=> b!917363 (=> (not res!618504) (not e!514995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54799 (_ BitVec 32)) Bool)

(assert (=> b!917363 (= res!618504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917364 () Bool)

(assert (=> b!917364 (= e!514992 e!514996)))

(declare-fun res!618509 () Bool)

(assert (=> b!917364 (=> (not res!618509) (not e!514996))))

(assert (=> b!917364 (= res!618509 (validKeyInArray!0 lt!411812))))

(assert (=> b!917364 (= lt!411812 (select (arr!26345 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!78672 res!618503) b!917360))

(assert (= (and b!917360 res!618500) b!917363))

(assert (= (and b!917363 res!618504) b!917357))

(assert (= (and b!917357 res!618507) b!917362))

(assert (= (and b!917362 res!618508) b!917353))

(assert (= (and b!917353 res!618506) b!917359))

(assert (= (and b!917359 res!618501) b!917354))

(assert (= (and b!917354 res!618502) b!917358))

(assert (= (and b!917358 res!618505) b!917364))

(assert (= (and b!917364 res!618509) b!917356))

(assert (= (and b!917352 condMapEmpty!30873) mapIsEmpty!30873))

(assert (= (and b!917352 (not condMapEmpty!30873)) mapNonEmpty!30873))

(get-info :version)

(assert (= (and mapNonEmpty!30873 ((_ is ValueCellFull!9224) mapValue!30873)) b!917361))

(assert (= (and b!917352 ((_ is ValueCellFull!9224) mapDefault!30873)) b!917355))

(assert (= start!78672 b!917352))

(declare-fun b_lambda!13387 () Bool)

(assert (=> (not b_lambda!13387) (not b!917356)))

(declare-fun t!26130 () Bool)

(declare-fun tb!5475 () Bool)

(assert (=> (and start!78672 (= defaultEntry!1235 defaultEntry!1235) t!26130) tb!5475))

(declare-fun result!10781 () Bool)

(assert (=> tb!5475 (= result!10781 tp_is_empty!19411)))

(assert (=> b!917356 t!26130))

(declare-fun b_and!27519 () Bool)

(assert (= b_and!27517 (and (=> t!26130 result!10781) b_and!27519)))

(declare-fun m!850567 () Bool)

(assert (=> b!917353 m!850567))

(declare-fun m!850569 () Bool)

(assert (=> b!917353 m!850569))

(declare-fun m!850571 () Bool)

(assert (=> b!917364 m!850571))

(declare-fun m!850573 () Bool)

(assert (=> b!917364 m!850573))

(declare-fun m!850575 () Bool)

(assert (=> b!917359 m!850575))

(declare-fun m!850577 () Bool)

(assert (=> b!917357 m!850577))

(declare-fun m!850579 () Bool)

(assert (=> b!917363 m!850579))

(declare-fun m!850581 () Bool)

(assert (=> b!917356 m!850581))

(declare-fun m!850583 () Bool)

(assert (=> b!917356 m!850583))

(assert (=> b!917356 m!850581))

(assert (=> b!917356 m!850583))

(declare-fun m!850585 () Bool)

(assert (=> b!917356 m!850585))

(declare-fun m!850587 () Bool)

(assert (=> b!917356 m!850587))

(declare-fun m!850589 () Bool)

(assert (=> b!917356 m!850589))

(assert (=> b!917356 m!850589))

(declare-fun m!850591 () Bool)

(assert (=> b!917356 m!850591))

(declare-fun m!850593 () Bool)

(assert (=> b!917356 m!850593))

(declare-fun m!850595 () Bool)

(assert (=> b!917358 m!850595))

(declare-fun m!850597 () Bool)

(assert (=> start!78672 m!850597))

(declare-fun m!850599 () Bool)

(assert (=> start!78672 m!850599))

(declare-fun m!850601 () Bool)

(assert (=> start!78672 m!850601))

(declare-fun m!850603 () Bool)

(assert (=> mapNonEmpty!30873 m!850603))

(check-sat (not b_next!16903) (not b!917357) (not start!78672) tp_is_empty!19411 (not b!917359) (not b!917363) (not b_lambda!13387) b_and!27519 (not mapNonEmpty!30873) (not b!917358) (not b!917364) (not b!917353) (not b!917356))
(check-sat b_and!27519 (not b_next!16903))
