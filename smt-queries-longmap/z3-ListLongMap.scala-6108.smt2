; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78758 () Bool)

(assert start!78758)

(declare-fun b_free!16971 () Bool)

(declare-fun b_next!16971 () Bool)

(assert (=> start!78758 (= b_free!16971 (not b_next!16971))))

(declare-fun tp!59354 () Bool)

(declare-fun b_and!27679 () Bool)

(assert (=> start!78758 (= tp!59354 b_and!27679)))

(declare-fun b!918985 () Bool)

(declare-fun res!619634 () Bool)

(declare-fun e!515854 () Bool)

(assert (=> b!918985 (=> (not res!619634) (not e!515854))))

(declare-datatypes ((array!54942 0))(
  ( (array!54943 (arr!26416 (Array (_ BitVec 32) (_ BitVec 64))) (size!26875 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54942)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30937 0))(
  ( (V!30938 (val!9790 Int)) )
))
(declare-datatypes ((ValueCell!9258 0))(
  ( (ValueCellFull!9258 (v!12308 V!30937)) (EmptyCell!9258) )
))
(declare-datatypes ((array!54944 0))(
  ( (array!54945 (arr!26417 (Array (_ BitVec 32) ValueCell!9258)) (size!26876 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54944)

(assert (=> b!918985 (= res!619634 (and (= (size!26876 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26875 _keys!1487) (size!26876 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918986 () Bool)

(declare-fun e!515859 () Bool)

(declare-fun tp_is_empty!19479 () Bool)

(assert (=> b!918986 (= e!515859 tp_is_empty!19479)))

(declare-fun b!918987 () Bool)

(declare-fun e!515856 () Bool)

(declare-fun e!515855 () Bool)

(assert (=> b!918987 (= e!515856 e!515855)))

(declare-fun res!619636 () Bool)

(assert (=> b!918987 (=> (not res!619636) (not e!515855))))

(declare-fun lt!412480 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918987 (= res!619636 (validKeyInArray!0 lt!412480))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918987 (= lt!412480 (select (arr!26416 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!30975 () Bool)

(declare-fun mapRes!30975 () Bool)

(assert (=> mapIsEmpty!30975 mapRes!30975))

(declare-fun b!918988 () Bool)

(declare-fun res!619632 () Bool)

(assert (=> b!918988 (=> (not res!619632) (not e!515856))))

(assert (=> b!918988 (= res!619632 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918989 () Bool)

(declare-fun e!515860 () Bool)

(assert (=> b!918989 (= e!515860 tp_is_empty!19479)))

(declare-fun b!918990 () Bool)

(assert (=> b!918990 (= e!515854 e!515856)))

(declare-fun res!619635 () Bool)

(assert (=> b!918990 (=> (not res!619635) (not e!515856))))

(declare-datatypes ((tuple2!12726 0))(
  ( (tuple2!12727 (_1!6374 (_ BitVec 64)) (_2!6374 V!30937)) )
))
(declare-datatypes ((List!18530 0))(
  ( (Nil!18527) (Cons!18526 (h!19672 tuple2!12726) (t!26231 List!18530)) )
))
(declare-datatypes ((ListLongMap!11423 0))(
  ( (ListLongMap!11424 (toList!5727 List!18530)) )
))
(declare-fun lt!412476 () ListLongMap!11423)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4773 (ListLongMap!11423 (_ BitVec 64)) Bool)

(assert (=> b!918990 (= res!619635 (contains!4773 lt!412476 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30937)

(declare-fun minValue!1173 () V!30937)

(declare-fun getCurrentListMap!2983 (array!54942 array!54944 (_ BitVec 32) (_ BitVec 32) V!30937 V!30937 (_ BitVec 32) Int) ListLongMap!11423)

(assert (=> b!918990 (= lt!412476 (getCurrentListMap!2983 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30975 () Bool)

(declare-fun tp!59353 () Bool)

(assert (=> mapNonEmpty!30975 (= mapRes!30975 (and tp!59353 e!515860))))

(declare-fun mapKey!30975 () (_ BitVec 32))

(declare-fun mapRest!30975 () (Array (_ BitVec 32) ValueCell!9258))

(declare-fun mapValue!30975 () ValueCell!9258)

(assert (=> mapNonEmpty!30975 (= (arr!26417 _values!1231) (store mapRest!30975 mapKey!30975 mapValue!30975))))

(declare-fun b!918992 () Bool)

(declare-fun res!619631 () Bool)

(assert (=> b!918992 (=> (not res!619631) (not e!515856))))

(declare-fun v!791 () V!30937)

(declare-fun apply!573 (ListLongMap!11423 (_ BitVec 64)) V!30937)

(assert (=> b!918992 (= res!619631 (= (apply!573 lt!412476 k0!1099) v!791))))

(declare-fun b!918993 () Bool)

(assert (=> b!918993 (= e!515855 (not true))))

(declare-fun lt!412478 () tuple2!12726)

(declare-fun +!2638 (ListLongMap!11423 tuple2!12726) ListLongMap!11423)

(assert (=> b!918993 (contains!4773 (+!2638 lt!412476 lt!412478) k0!1099)))

(declare-datatypes ((Unit!31024 0))(
  ( (Unit!31025) )
))
(declare-fun lt!412477 () Unit!31024)

(declare-fun lt!412475 () V!30937)

(declare-fun addStillContains!362 (ListLongMap!11423 (_ BitVec 64) V!30937 (_ BitVec 64)) Unit!31024)

(assert (=> b!918993 (= lt!412477 (addStillContains!362 lt!412476 lt!412480 lt!412475 k0!1099))))

(assert (=> b!918993 (= (getCurrentListMap!2983 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2638 (getCurrentListMap!2983 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412478))))

(assert (=> b!918993 (= lt!412478 (tuple2!12727 lt!412480 lt!412475))))

(declare-fun get!13851 (ValueCell!9258 V!30937) V!30937)

(declare-fun dynLambda!1427 (Int (_ BitVec 64)) V!30937)

(assert (=> b!918993 (= lt!412475 (get!13851 (select (arr!26417 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1427 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412479 () Unit!31024)

(declare-fun lemmaListMapRecursiveValidKeyArray!28 (array!54942 array!54944 (_ BitVec 32) (_ BitVec 32) V!30937 V!30937 (_ BitVec 32) Int) Unit!31024)

(assert (=> b!918993 (= lt!412479 (lemmaListMapRecursiveValidKeyArray!28 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918994 () Bool)

(declare-fun res!619633 () Bool)

(assert (=> b!918994 (=> (not res!619633) (not e!515854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54942 (_ BitVec 32)) Bool)

(assert (=> b!918994 (= res!619633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918995 () Bool)

(declare-fun res!619630 () Bool)

(assert (=> b!918995 (=> (not res!619630) (not e!515856))))

(assert (=> b!918995 (= res!619630 (validKeyInArray!0 k0!1099))))

(declare-fun b!918996 () Bool)

(declare-fun res!619637 () Bool)

(assert (=> b!918996 (=> (not res!619637) (not e!515854))))

(declare-datatypes ((List!18531 0))(
  ( (Nil!18528) (Cons!18527 (h!19673 (_ BitVec 64)) (t!26232 List!18531)) )
))
(declare-fun arrayNoDuplicates!0 (array!54942 (_ BitVec 32) List!18531) Bool)

(assert (=> b!918996 (= res!619637 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18528))))

(declare-fun b!918997 () Bool)

(declare-fun e!515858 () Bool)

(assert (=> b!918997 (= e!515858 (and e!515859 mapRes!30975))))

(declare-fun condMapEmpty!30975 () Bool)

(declare-fun mapDefault!30975 () ValueCell!9258)

(assert (=> b!918997 (= condMapEmpty!30975 (= (arr!26417 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9258)) mapDefault!30975)))))

(declare-fun res!619638 () Bool)

(assert (=> start!78758 (=> (not res!619638) (not e!515854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78758 (= res!619638 (validMask!0 mask!1881))))

(assert (=> start!78758 e!515854))

(assert (=> start!78758 true))

(assert (=> start!78758 tp_is_empty!19479))

(declare-fun array_inv!20588 (array!54944) Bool)

(assert (=> start!78758 (and (array_inv!20588 _values!1231) e!515858)))

(assert (=> start!78758 tp!59354))

(declare-fun array_inv!20589 (array!54942) Bool)

(assert (=> start!78758 (array_inv!20589 _keys!1487)))

(declare-fun b!918991 () Bool)

(declare-fun res!619639 () Bool)

(assert (=> b!918991 (=> (not res!619639) (not e!515854))))

(assert (=> b!918991 (= res!619639 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26875 _keys!1487))))))

(assert (= (and start!78758 res!619638) b!918985))

(assert (= (and b!918985 res!619634) b!918994))

(assert (= (and b!918994 res!619633) b!918996))

(assert (= (and b!918996 res!619637) b!918991))

(assert (= (and b!918991 res!619639) b!918990))

(assert (= (and b!918990 res!619635) b!918992))

(assert (= (and b!918992 res!619631) b!918988))

(assert (= (and b!918988 res!619632) b!918995))

(assert (= (and b!918995 res!619630) b!918987))

(assert (= (and b!918987 res!619636) b!918993))

(assert (= (and b!918997 condMapEmpty!30975) mapIsEmpty!30975))

(assert (= (and b!918997 (not condMapEmpty!30975)) mapNonEmpty!30975))

(get-info :version)

(assert (= (and mapNonEmpty!30975 ((_ is ValueCellFull!9258) mapValue!30975)) b!918989))

(assert (= (and b!918997 ((_ is ValueCellFull!9258) mapDefault!30975)) b!918986))

(assert (= start!78758 b!918997))

(declare-fun b_lambda!13473 () Bool)

(assert (=> (not b_lambda!13473) (not b!918993)))

(declare-fun t!26230 () Bool)

(declare-fun tb!5551 () Bool)

(assert (=> (and start!78758 (= defaultEntry!1235 defaultEntry!1235) t!26230) tb!5551))

(declare-fun result!10925 () Bool)

(assert (=> tb!5551 (= result!10925 tp_is_empty!19479)))

(assert (=> b!918993 t!26230))

(declare-fun b_and!27681 () Bool)

(assert (= b_and!27679 (and (=> t!26230 result!10925) b_and!27681)))

(declare-fun m!852695 () Bool)

(assert (=> b!918992 m!852695))

(declare-fun m!852697 () Bool)

(assert (=> b!918994 m!852697))

(declare-fun m!852699 () Bool)

(assert (=> b!918990 m!852699))

(declare-fun m!852701 () Bool)

(assert (=> b!918990 m!852701))

(declare-fun m!852703 () Bool)

(assert (=> b!918996 m!852703))

(declare-fun m!852705 () Bool)

(assert (=> mapNonEmpty!30975 m!852705))

(declare-fun m!852707 () Bool)

(assert (=> b!918987 m!852707))

(declare-fun m!852709 () Bool)

(assert (=> b!918987 m!852709))

(declare-fun m!852711 () Bool)

(assert (=> start!78758 m!852711))

(declare-fun m!852713 () Bool)

(assert (=> start!78758 m!852713))

(declare-fun m!852715 () Bool)

(assert (=> start!78758 m!852715))

(declare-fun m!852717 () Bool)

(assert (=> b!918993 m!852717))

(declare-fun m!852719 () Bool)

(assert (=> b!918993 m!852719))

(declare-fun m!852721 () Bool)

(assert (=> b!918993 m!852721))

(declare-fun m!852723 () Bool)

(assert (=> b!918993 m!852723))

(declare-fun m!852725 () Bool)

(assert (=> b!918993 m!852725))

(declare-fun m!852727 () Bool)

(assert (=> b!918993 m!852727))

(assert (=> b!918993 m!852717))

(assert (=> b!918993 m!852719))

(declare-fun m!852729 () Bool)

(assert (=> b!918993 m!852729))

(assert (=> b!918993 m!852725))

(declare-fun m!852731 () Bool)

(assert (=> b!918993 m!852731))

(declare-fun m!852733 () Bool)

(assert (=> b!918993 m!852733))

(assert (=> b!918993 m!852721))

(declare-fun m!852735 () Bool)

(assert (=> b!918993 m!852735))

(declare-fun m!852737 () Bool)

(assert (=> b!918995 m!852737))

(check-sat (not b!918996) (not b_lambda!13473) tp_is_empty!19479 (not b!918994) (not b!918990) (not b!918987) (not mapNonEmpty!30975) (not start!78758) (not b!918993) (not b!918992) (not b_next!16971) b_and!27681 (not b!918995))
(check-sat b_and!27681 (not b_next!16971))
