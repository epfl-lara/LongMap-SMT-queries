; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79340 () Bool)

(assert start!79340)

(declare-fun b_free!17545 () Bool)

(declare-fun b_next!17545 () Bool)

(assert (=> start!79340 (= b_free!17545 (not b_next!17545))))

(declare-fun tp!61080 () Bool)

(declare-fun b_and!28623 () Bool)

(assert (=> start!79340 (= tp!61080 b_and!28623)))

(declare-fun b!931919 () Bool)

(declare-fun e!523341 () Bool)

(declare-fun tp_is_empty!20053 () Bool)

(assert (=> b!931919 (= e!523341 tp_is_empty!20053)))

(declare-fun b!931920 () Bool)

(declare-fun e!523342 () Bool)

(declare-fun e!523340 () Bool)

(assert (=> b!931920 (= e!523342 e!523340)))

(declare-fun res!627667 () Bool)

(assert (=> b!931920 (=> (not res!627667) (not e!523340))))

(declare-fun lt!419534 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931920 (= res!627667 (validKeyInArray!0 lt!419534))))

(declare-datatypes ((array!56015 0))(
  ( (array!56016 (arr!26952 (Array (_ BitVec 32) (_ BitVec 64))) (size!27413 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56015)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931920 (= lt!419534 (select (arr!26952 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!627666 () Bool)

(declare-fun e!523343 () Bool)

(assert (=> start!79340 (=> (not res!627666) (not e!523343))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79340 (= res!627666 (validMask!0 mask!1881))))

(assert (=> start!79340 e!523343))

(assert (=> start!79340 true))

(assert (=> start!79340 tp_is_empty!20053))

(declare-datatypes ((V!31703 0))(
  ( (V!31704 (val!10077 Int)) )
))
(declare-datatypes ((ValueCell!9545 0))(
  ( (ValueCellFull!9545 (v!12595 V!31703)) (EmptyCell!9545) )
))
(declare-datatypes ((array!56017 0))(
  ( (array!56018 (arr!26953 (Array (_ BitVec 32) ValueCell!9545)) (size!27414 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56017)

(declare-fun e!523337 () Bool)

(declare-fun array_inv!21046 (array!56017) Bool)

(assert (=> start!79340 (and (array_inv!21046 _values!1231) e!523337)))

(assert (=> start!79340 tp!61080))

(declare-fun array_inv!21047 (array!56015) Bool)

(assert (=> start!79340 (array_inv!21047 _keys!1487)))

(declare-fun b!931921 () Bool)

(declare-fun res!627673 () Bool)

(assert (=> b!931921 (=> (not res!627673) (not e!523343))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931921 (= res!627673 (and (= (size!27414 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27413 _keys!1487) (size!27414 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31839 () Bool)

(declare-fun mapRes!31839 () Bool)

(assert (=> mapIsEmpty!31839 mapRes!31839))

(declare-fun b!931922 () Bool)

(assert (=> b!931922 (= e!523343 e!523342)))

(declare-fun res!627669 () Bool)

(assert (=> b!931922 (=> (not res!627669) (not e!523342))))

(declare-datatypes ((tuple2!13254 0))(
  ( (tuple2!13255 (_1!6638 (_ BitVec 64)) (_2!6638 V!31703)) )
))
(declare-datatypes ((List!19007 0))(
  ( (Nil!19004) (Cons!19003 (h!20149 tuple2!13254) (t!27087 List!19007)) )
))
(declare-datatypes ((ListLongMap!11941 0))(
  ( (ListLongMap!11942 (toList!5986 List!19007)) )
))
(declare-fun lt!419536 () ListLongMap!11941)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4984 (ListLongMap!11941 (_ BitVec 64)) Bool)

(assert (=> b!931922 (= res!627669 (contains!4984 lt!419536 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31703)

(declare-fun minValue!1173 () V!31703)

(declare-fun getCurrentListMap!3159 (array!56015 array!56017 (_ BitVec 32) (_ BitVec 32) V!31703 V!31703 (_ BitVec 32) Int) ListLongMap!11941)

(assert (=> b!931922 (= lt!419536 (getCurrentListMap!3159 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931923 () Bool)

(declare-fun res!627671 () Bool)

(assert (=> b!931923 (=> (not res!627671) (not e!523342))))

(assert (=> b!931923 (= res!627671 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931924 () Bool)

(declare-fun res!627665 () Bool)

(assert (=> b!931924 (=> (not res!627665) (not e!523343))))

(assert (=> b!931924 (= res!627665 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27413 _keys!1487))))))

(declare-fun mapNonEmpty!31839 () Bool)

(declare-fun tp!61079 () Bool)

(declare-fun e!523338 () Bool)

(assert (=> mapNonEmpty!31839 (= mapRes!31839 (and tp!61079 e!523338))))

(declare-fun mapValue!31839 () ValueCell!9545)

(declare-fun mapRest!31839 () (Array (_ BitVec 32) ValueCell!9545))

(declare-fun mapKey!31839 () (_ BitVec 32))

(assert (=> mapNonEmpty!31839 (= (arr!26953 _values!1231) (store mapRest!31839 mapKey!31839 mapValue!31839))))

(declare-fun b!931925 () Bool)

(assert (=> b!931925 (= e!523337 (and e!523341 mapRes!31839))))

(declare-fun condMapEmpty!31839 () Bool)

(declare-fun mapDefault!31839 () ValueCell!9545)

(assert (=> b!931925 (= condMapEmpty!31839 (= (arr!26953 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9545)) mapDefault!31839)))))

(declare-fun b!931926 () Bool)

(declare-fun res!627674 () Bool)

(assert (=> b!931926 (=> (not res!627674) (not e!523342))))

(declare-fun v!791 () V!31703)

(declare-fun apply!778 (ListLongMap!11941 (_ BitVec 64)) V!31703)

(assert (=> b!931926 (= res!627674 (= (apply!778 lt!419536 k0!1099) v!791))))

(declare-fun b!931927 () Bool)

(declare-fun res!627670 () Bool)

(assert (=> b!931927 (=> (not res!627670) (not e!523343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56015 (_ BitVec 32)) Bool)

(assert (=> b!931927 (= res!627670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931928 () Bool)

(declare-fun res!627672 () Bool)

(assert (=> b!931928 (=> (not res!627672) (not e!523342))))

(assert (=> b!931928 (= res!627672 (validKeyInArray!0 k0!1099))))

(declare-fun b!931929 () Bool)

(declare-fun res!627668 () Bool)

(assert (=> b!931929 (=> (not res!627668) (not e!523343))))

(declare-datatypes ((List!19008 0))(
  ( (Nil!19005) (Cons!19004 (h!20150 (_ BitVec 64)) (t!27088 List!19008)) )
))
(declare-fun arrayNoDuplicates!0 (array!56015 (_ BitVec 32) List!19008) Bool)

(assert (=> b!931929 (= res!627668 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19005))))

(declare-fun b!931930 () Bool)

(assert (=> b!931930 (= e!523340 (not (or (bvsge (size!27413 _keys!1487) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!27413 _keys!1487)))))))

(declare-fun lt!419537 () tuple2!13254)

(declare-fun +!2796 (ListLongMap!11941 tuple2!13254) ListLongMap!11941)

(assert (=> b!931930 (contains!4984 (+!2796 lt!419536 lt!419537) k0!1099)))

(declare-fun lt!419538 () V!31703)

(declare-datatypes ((Unit!31362 0))(
  ( (Unit!31363) )
))
(declare-fun lt!419535 () Unit!31362)

(declare-fun addStillContains!485 (ListLongMap!11941 (_ BitVec 64) V!31703 (_ BitVec 64)) Unit!31362)

(assert (=> b!931930 (= lt!419535 (addStillContains!485 lt!419536 lt!419534 lt!419538 k0!1099))))

(assert (=> b!931930 (= (getCurrentListMap!3159 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2796 (getCurrentListMap!3159 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419537))))

(assert (=> b!931930 (= lt!419537 (tuple2!13255 lt!419534 lt!419538))))

(declare-fun get!14176 (ValueCell!9545 V!31703) V!31703)

(declare-fun dynLambda!1552 (Int (_ BitVec 64)) V!31703)

(assert (=> b!931930 (= lt!419538 (get!14176 (select (arr!26953 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1552 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419533 () Unit!31362)

(declare-fun lemmaListMapRecursiveValidKeyArray!160 (array!56015 array!56017 (_ BitVec 32) (_ BitVec 32) V!31703 V!31703 (_ BitVec 32) Int) Unit!31362)

(assert (=> b!931930 (= lt!419533 (lemmaListMapRecursiveValidKeyArray!160 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931931 () Bool)

(assert (=> b!931931 (= e!523338 tp_is_empty!20053)))

(assert (= (and start!79340 res!627666) b!931921))

(assert (= (and b!931921 res!627673) b!931927))

(assert (= (and b!931927 res!627670) b!931929))

(assert (= (and b!931929 res!627668) b!931924))

(assert (= (and b!931924 res!627665) b!931922))

(assert (= (and b!931922 res!627669) b!931926))

(assert (= (and b!931926 res!627674) b!931923))

(assert (= (and b!931923 res!627671) b!931928))

(assert (= (and b!931928 res!627672) b!931920))

(assert (= (and b!931920 res!627667) b!931930))

(assert (= (and b!931925 condMapEmpty!31839) mapIsEmpty!31839))

(assert (= (and b!931925 (not condMapEmpty!31839)) mapNonEmpty!31839))

(get-info :version)

(assert (= (and mapNonEmpty!31839 ((_ is ValueCellFull!9545) mapValue!31839)) b!931931))

(assert (= (and b!931925 ((_ is ValueCellFull!9545) mapDefault!31839)) b!931919))

(assert (= start!79340 b!931925))

(declare-fun b_lambda!13861 () Bool)

(assert (=> (not b_lambda!13861) (not b!931930)))

(declare-fun t!27086 () Bool)

(declare-fun tb!5931 () Bool)

(assert (=> (and start!79340 (= defaultEntry!1235 defaultEntry!1235) t!27086) tb!5931))

(declare-fun result!11695 () Bool)

(assert (=> tb!5931 (= result!11695 tp_is_empty!20053)))

(assert (=> b!931930 t!27086))

(declare-fun b_and!28625 () Bool)

(assert (= b_and!28623 (and (=> t!27086 result!11695) b_and!28625)))

(declare-fun m!865349 () Bool)

(assert (=> mapNonEmpty!31839 m!865349))

(declare-fun m!865351 () Bool)

(assert (=> b!931922 m!865351))

(declare-fun m!865353 () Bool)

(assert (=> b!931922 m!865353))

(declare-fun m!865355 () Bool)

(assert (=> b!931928 m!865355))

(declare-fun m!865357 () Bool)

(assert (=> b!931929 m!865357))

(declare-fun m!865359 () Bool)

(assert (=> start!79340 m!865359))

(declare-fun m!865361 () Bool)

(assert (=> start!79340 m!865361))

(declare-fun m!865363 () Bool)

(assert (=> start!79340 m!865363))

(declare-fun m!865365 () Bool)

(assert (=> b!931920 m!865365))

(declare-fun m!865367 () Bool)

(assert (=> b!931920 m!865367))

(declare-fun m!865369 () Bool)

(assert (=> b!931927 m!865369))

(declare-fun m!865371 () Bool)

(assert (=> b!931926 m!865371))

(declare-fun m!865373 () Bool)

(assert (=> b!931930 m!865373))

(declare-fun m!865375 () Bool)

(assert (=> b!931930 m!865375))

(declare-fun m!865377 () Bool)

(assert (=> b!931930 m!865377))

(declare-fun m!865379 () Bool)

(assert (=> b!931930 m!865379))

(assert (=> b!931930 m!865373))

(assert (=> b!931930 m!865375))

(declare-fun m!865381 () Bool)

(assert (=> b!931930 m!865381))

(declare-fun m!865383 () Bool)

(assert (=> b!931930 m!865383))

(assert (=> b!931930 m!865377))

(declare-fun m!865385 () Bool)

(assert (=> b!931930 m!865385))

(declare-fun m!865387 () Bool)

(assert (=> b!931930 m!865387))

(declare-fun m!865389 () Bool)

(assert (=> b!931930 m!865389))

(assert (=> b!931930 m!865387))

(declare-fun m!865391 () Bool)

(assert (=> b!931930 m!865391))

(check-sat (not b!931930) (not b!931928) (not b!931926) (not start!79340) (not b!931927) b_and!28625 (not mapNonEmpty!31839) tp_is_empty!20053 (not b_next!17545) (not b!931929) (not b_lambda!13861) (not b!931922) (not b!931920))
(check-sat b_and!28625 (not b_next!17545))
