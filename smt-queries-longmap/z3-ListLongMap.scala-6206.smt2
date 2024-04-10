; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79372 () Bool)

(assert start!79372)

(declare-fun b_free!17559 () Bool)

(declare-fun b_next!17559 () Bool)

(assert (=> start!79372 (= b_free!17559 (not b_next!17559))))

(declare-fun tp!61121 () Bool)

(declare-fun b_and!28677 () Bool)

(assert (=> start!79372 (= tp!61121 b_and!28677)))

(declare-fun res!627989 () Bool)

(declare-fun e!523637 () Bool)

(assert (=> start!79372 (=> (not res!627989) (not e!523637))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79372 (= res!627989 (validMask!0 mask!1881))))

(assert (=> start!79372 e!523637))

(assert (=> start!79372 true))

(declare-fun tp_is_empty!20067 () Bool)

(assert (=> start!79372 tp_is_empty!20067))

(declare-datatypes ((V!31721 0))(
  ( (V!31722 (val!10084 Int)) )
))
(declare-datatypes ((ValueCell!9552 0))(
  ( (ValueCellFull!9552 (v!12603 V!31721)) (EmptyCell!9552) )
))
(declare-datatypes ((array!56074 0))(
  ( (array!56075 (arr!26981 (Array (_ BitVec 32) ValueCell!9552)) (size!27440 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56074)

(declare-fun e!523635 () Bool)

(declare-fun array_inv!21002 (array!56074) Bool)

(assert (=> start!79372 (and (array_inv!21002 _values!1231) e!523635)))

(assert (=> start!79372 tp!61121))

(declare-datatypes ((array!56076 0))(
  ( (array!56077 (arr!26982 (Array (_ BitVec 32) (_ BitVec 64))) (size!27441 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56076)

(declare-fun array_inv!21003 (array!56076) Bool)

(assert (=> start!79372 (array_inv!21003 _keys!1487)))

(declare-fun b!932445 () Bool)

(declare-fun e!523638 () Bool)

(assert (=> b!932445 (= e!523637 e!523638)))

(declare-fun res!627990 () Bool)

(assert (=> b!932445 (=> (not res!627990) (not e!523638))))

(declare-datatypes ((tuple2!13212 0))(
  ( (tuple2!13213 (_1!6617 (_ BitVec 64)) (_2!6617 V!31721)) )
))
(declare-datatypes ((List!18996 0))(
  ( (Nil!18993) (Cons!18992 (h!20138 tuple2!13212) (t!27099 List!18996)) )
))
(declare-datatypes ((ListLongMap!11909 0))(
  ( (ListLongMap!11910 (toList!5970 List!18996)) )
))
(declare-fun lt!419895 () ListLongMap!11909)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5019 (ListLongMap!11909 (_ BitVec 64)) Bool)

(assert (=> b!932445 (= res!627990 (contains!5019 lt!419895 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31721)

(declare-fun minValue!1173 () V!31721)

(declare-fun getCurrentListMap!3208 (array!56076 array!56074 (_ BitVec 32) (_ BitVec 32) V!31721 V!31721 (_ BitVec 32) Int) ListLongMap!11909)

(assert (=> b!932445 (= lt!419895 (getCurrentListMap!3208 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932446 () Bool)

(declare-fun e!523634 () Bool)

(assert (=> b!932446 (= e!523634 tp_is_empty!20067)))

(declare-fun b!932447 () Bool)

(declare-fun e!523632 () Bool)

(declare-fun mapRes!31860 () Bool)

(assert (=> b!932447 (= e!523635 (and e!523632 mapRes!31860))))

(declare-fun condMapEmpty!31860 () Bool)

(declare-fun mapDefault!31860 () ValueCell!9552)

(assert (=> b!932447 (= condMapEmpty!31860 (= (arr!26981 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9552)) mapDefault!31860)))))

(declare-fun b!932448 () Bool)

(assert (=> b!932448 (= e!523632 tp_is_empty!20067)))

(declare-fun b!932449 () Bool)

(declare-fun res!627991 () Bool)

(assert (=> b!932449 (=> (not res!627991) (not e!523638))))

(assert (=> b!932449 (= res!627991 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932450 () Bool)

(declare-fun res!627994 () Bool)

(assert (=> b!932450 (=> (not res!627994) (not e!523637))))

(assert (=> b!932450 (= res!627994 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27441 _keys!1487))))))

(declare-fun b!932451 () Bool)

(declare-fun res!627985 () Bool)

(assert (=> b!932451 (=> (not res!627985) (not e!523637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56076 (_ BitVec 32)) Bool)

(assert (=> b!932451 (= res!627985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31860 () Bool)

(assert (=> mapIsEmpty!31860 mapRes!31860))

(declare-fun b!932452 () Bool)

(declare-fun res!627992 () Bool)

(assert (=> b!932452 (=> (not res!627992) (not e!523637))))

(declare-datatypes ((List!18997 0))(
  ( (Nil!18994) (Cons!18993 (h!20139 (_ BitVec 64)) (t!27100 List!18997)) )
))
(declare-fun arrayNoDuplicates!0 (array!56076 (_ BitVec 32) List!18997) Bool)

(assert (=> b!932452 (= res!627992 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18994))))

(declare-fun b!932453 () Bool)

(declare-fun e!523633 () Bool)

(assert (=> b!932453 (= e!523633 (not true))))

(declare-fun lt!419897 () tuple2!13212)

(declare-fun +!2775 (ListLongMap!11909 tuple2!13212) ListLongMap!11909)

(assert (=> b!932453 (contains!5019 (+!2775 lt!419895 lt!419897) k0!1099)))

(declare-datatypes ((Unit!31465 0))(
  ( (Unit!31466) )
))
(declare-fun lt!419898 () Unit!31465)

(declare-fun lt!419899 () V!31721)

(declare-fun lt!419896 () (_ BitVec 64))

(declare-fun addStillContains!494 (ListLongMap!11909 (_ BitVec 64) V!31721 (_ BitVec 64)) Unit!31465)

(assert (=> b!932453 (= lt!419898 (addStillContains!494 lt!419895 lt!419896 lt!419899 k0!1099))))

(assert (=> b!932453 (= (getCurrentListMap!3208 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2775 (getCurrentListMap!3208 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419897))))

(assert (=> b!932453 (= lt!419897 (tuple2!13213 lt!419896 lt!419899))))

(declare-fun get!14187 (ValueCell!9552 V!31721) V!31721)

(declare-fun dynLambda!1564 (Int (_ BitVec 64)) V!31721)

(assert (=> b!932453 (= lt!419899 (get!14187 (select (arr!26981 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1564 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419900 () Unit!31465)

(declare-fun lemmaListMapRecursiveValidKeyArray!165 (array!56076 array!56074 (_ BitVec 32) (_ BitVec 32) V!31721 V!31721 (_ BitVec 32) Int) Unit!31465)

(assert (=> b!932453 (= lt!419900 (lemmaListMapRecursiveValidKeyArray!165 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31860 () Bool)

(declare-fun tp!61120 () Bool)

(assert (=> mapNonEmpty!31860 (= mapRes!31860 (and tp!61120 e!523634))))

(declare-fun mapKey!31860 () (_ BitVec 32))

(declare-fun mapValue!31860 () ValueCell!9552)

(declare-fun mapRest!31860 () (Array (_ BitVec 32) ValueCell!9552))

(assert (=> mapNonEmpty!31860 (= (arr!26981 _values!1231) (store mapRest!31860 mapKey!31860 mapValue!31860))))

(declare-fun b!932454 () Bool)

(assert (=> b!932454 (= e!523638 e!523633)))

(declare-fun res!627988 () Bool)

(assert (=> b!932454 (=> (not res!627988) (not e!523633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932454 (= res!627988 (validKeyInArray!0 lt!419896))))

(assert (=> b!932454 (= lt!419896 (select (arr!26982 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932455 () Bool)

(declare-fun res!627993 () Bool)

(assert (=> b!932455 (=> (not res!627993) (not e!523637))))

(assert (=> b!932455 (= res!627993 (and (= (size!27440 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27441 _keys!1487) (size!27440 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932456 () Bool)

(declare-fun res!627986 () Bool)

(assert (=> b!932456 (=> (not res!627986) (not e!523638))))

(declare-fun v!791 () V!31721)

(declare-fun apply!783 (ListLongMap!11909 (_ BitVec 64)) V!31721)

(assert (=> b!932456 (= res!627986 (= (apply!783 lt!419895 k0!1099) v!791))))

(declare-fun b!932457 () Bool)

(declare-fun res!627987 () Bool)

(assert (=> b!932457 (=> (not res!627987) (not e!523638))))

(assert (=> b!932457 (= res!627987 (validKeyInArray!0 k0!1099))))

(assert (= (and start!79372 res!627989) b!932455))

(assert (= (and b!932455 res!627993) b!932451))

(assert (= (and b!932451 res!627985) b!932452))

(assert (= (and b!932452 res!627992) b!932450))

(assert (= (and b!932450 res!627994) b!932445))

(assert (= (and b!932445 res!627990) b!932456))

(assert (= (and b!932456 res!627986) b!932449))

(assert (= (and b!932449 res!627991) b!932457))

(assert (= (and b!932457 res!627987) b!932454))

(assert (= (and b!932454 res!627988) b!932453))

(assert (= (and b!932447 condMapEmpty!31860) mapIsEmpty!31860))

(assert (= (and b!932447 (not condMapEmpty!31860)) mapNonEmpty!31860))

(get-info :version)

(assert (= (and mapNonEmpty!31860 ((_ is ValueCellFull!9552) mapValue!31860)) b!932446))

(assert (= (and b!932447 ((_ is ValueCellFull!9552) mapDefault!31860)) b!932448))

(assert (= start!79372 b!932447))

(declare-fun b_lambda!13893 () Bool)

(assert (=> (not b_lambda!13893) (not b!932453)))

(declare-fun t!27098 () Bool)

(declare-fun tb!5953 () Bool)

(assert (=> (and start!79372 (= defaultEntry!1235 defaultEntry!1235) t!27098) tb!5953))

(declare-fun result!11731 () Bool)

(assert (=> tb!5953 (= result!11731 tp_is_empty!20067)))

(assert (=> b!932453 t!27098))

(declare-fun b_and!28679 () Bool)

(assert (= b_and!28677 (and (=> t!27098 result!11731) b_and!28679)))

(declare-fun m!866415 () Bool)

(assert (=> b!932454 m!866415))

(declare-fun m!866417 () Bool)

(assert (=> b!932454 m!866417))

(declare-fun m!866419 () Bool)

(assert (=> start!79372 m!866419))

(declare-fun m!866421 () Bool)

(assert (=> start!79372 m!866421))

(declare-fun m!866423 () Bool)

(assert (=> start!79372 m!866423))

(declare-fun m!866425 () Bool)

(assert (=> b!932453 m!866425))

(declare-fun m!866427 () Bool)

(assert (=> b!932453 m!866427))

(declare-fun m!866429 () Bool)

(assert (=> b!932453 m!866429))

(assert (=> b!932453 m!866425))

(declare-fun m!866431 () Bool)

(assert (=> b!932453 m!866431))

(assert (=> b!932453 m!866427))

(assert (=> b!932453 m!866429))

(declare-fun m!866433 () Bool)

(assert (=> b!932453 m!866433))

(declare-fun m!866435 () Bool)

(assert (=> b!932453 m!866435))

(declare-fun m!866437 () Bool)

(assert (=> b!932453 m!866437))

(declare-fun m!866439 () Bool)

(assert (=> b!932453 m!866439))

(declare-fun m!866441 () Bool)

(assert (=> b!932453 m!866441))

(assert (=> b!932453 m!866437))

(declare-fun m!866443 () Bool)

(assert (=> b!932453 m!866443))

(declare-fun m!866445 () Bool)

(assert (=> mapNonEmpty!31860 m!866445))

(declare-fun m!866447 () Bool)

(assert (=> b!932457 m!866447))

(declare-fun m!866449 () Bool)

(assert (=> b!932451 m!866449))

(declare-fun m!866451 () Bool)

(assert (=> b!932456 m!866451))

(declare-fun m!866453 () Bool)

(assert (=> b!932445 m!866453))

(declare-fun m!866455 () Bool)

(assert (=> b!932445 m!866455))

(declare-fun m!866457 () Bool)

(assert (=> b!932452 m!866457))

(check-sat (not b!932452) (not b!932453) tp_is_empty!20067 (not b_next!17559) (not b!932454) (not b!932451) (not mapNonEmpty!31860) b_and!28679 (not start!79372) (not b!932445) (not b_lambda!13893) (not b!932456) (not b!932457))
(check-sat b_and!28679 (not b_next!17559))
