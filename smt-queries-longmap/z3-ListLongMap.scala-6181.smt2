; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79176 () Bool)

(assert start!79176)

(declare-fun b_free!17407 () Bool)

(declare-fun b_next!17407 () Bool)

(assert (=> start!79176 (= b_free!17407 (not b_next!17407))))

(declare-fun tp!60663 () Bool)

(declare-fun b_and!28447 () Bool)

(assert (=> start!79176 (= tp!60663 b_and!28447)))

(declare-fun b!929492 () Bool)

(declare-fun e!521942 () Bool)

(declare-fun e!521943 () Bool)

(assert (=> b!929492 (= e!521942 e!521943)))

(declare-fun res!625989 () Bool)

(assert (=> b!929492 (=> (not res!625989) (not e!521943))))

(declare-datatypes ((V!31519 0))(
  ( (V!31520 (val!10008 Int)) )
))
(declare-datatypes ((tuple2!13140 0))(
  ( (tuple2!13141 (_1!6581 (_ BitVec 64)) (_2!6581 V!31519)) )
))
(declare-datatypes ((List!18901 0))(
  ( (Nil!18898) (Cons!18897 (h!20043 tuple2!13140) (t!26949 List!18901)) )
))
(declare-datatypes ((ListLongMap!11827 0))(
  ( (ListLongMap!11828 (toList!5929 List!18901)) )
))
(declare-fun lt!418883 () ListLongMap!11827)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4935 (ListLongMap!11827 (_ BitVec 64)) Bool)

(assert (=> b!929492 (= res!625989 (contains!4935 lt!418883 k0!1099))))

(declare-datatypes ((array!55749 0))(
  ( (array!55750 (arr!26820 (Array (_ BitVec 32) (_ BitVec 64))) (size!27281 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55749)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9476 0))(
  ( (ValueCellFull!9476 (v!12525 V!31519)) (EmptyCell!9476) )
))
(declare-datatypes ((array!55751 0))(
  ( (array!55752 (arr!26821 (Array (_ BitVec 32) ValueCell!9476)) (size!27282 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55751)

(declare-fun zeroValue!1173 () V!31519)

(declare-fun minValue!1173 () V!31519)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3109 (array!55749 array!55751 (_ BitVec 32) (_ BitVec 32) V!31519 V!31519 (_ BitVec 32) Int) ListLongMap!11827)

(assert (=> b!929492 (= lt!418883 (getCurrentListMap!3109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!625985 () Bool)

(assert (=> start!79176 (=> (not res!625985) (not e!521942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79176 (= res!625985 (validMask!0 mask!1881))))

(assert (=> start!79176 e!521942))

(assert (=> start!79176 true))

(declare-fun tp_is_empty!19915 () Bool)

(assert (=> start!79176 tp_is_empty!19915))

(declare-fun e!521938 () Bool)

(declare-fun array_inv!20958 (array!55751) Bool)

(assert (=> start!79176 (and (array_inv!20958 _values!1231) e!521938)))

(assert (=> start!79176 tp!60663))

(declare-fun array_inv!20959 (array!55749) Bool)

(assert (=> start!79176 (array_inv!20959 _keys!1487)))

(declare-fun b!929493 () Bool)

(declare-fun res!625986 () Bool)

(assert (=> b!929493 (=> (not res!625986) (not e!521942))))

(assert (=> b!929493 (= res!625986 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27281 _keys!1487))))))

(declare-fun mapIsEmpty!31629 () Bool)

(declare-fun mapRes!31629 () Bool)

(assert (=> mapIsEmpty!31629 mapRes!31629))

(declare-fun b!929494 () Bool)

(declare-fun res!625987 () Bool)

(assert (=> b!929494 (=> (not res!625987) (not e!521942))))

(declare-datatypes ((List!18902 0))(
  ( (Nil!18899) (Cons!18898 (h!20044 (_ BitVec 64)) (t!26950 List!18902)) )
))
(declare-fun arrayNoDuplicates!0 (array!55749 (_ BitVec 32) List!18902) Bool)

(assert (=> b!929494 (= res!625987 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18899))))

(declare-fun b!929495 () Bool)

(assert (=> b!929495 (= e!521943 false)))

(declare-fun lt!418882 () Bool)

(assert (=> b!929495 (= lt!418882 (contains!4935 (getCurrentListMap!3109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun mapNonEmpty!31629 () Bool)

(declare-fun tp!60662 () Bool)

(declare-fun e!521939 () Bool)

(assert (=> mapNonEmpty!31629 (= mapRes!31629 (and tp!60662 e!521939))))

(declare-fun mapValue!31629 () ValueCell!9476)

(declare-fun mapRest!31629 () (Array (_ BitVec 32) ValueCell!9476))

(declare-fun mapKey!31629 () (_ BitVec 32))

(assert (=> mapNonEmpty!31629 (= (arr!26821 _values!1231) (store mapRest!31629 mapKey!31629 mapValue!31629))))

(declare-fun b!929496 () Bool)

(assert (=> b!929496 (= e!521939 tp_is_empty!19915)))

(declare-fun b!929497 () Bool)

(declare-fun res!625988 () Bool)

(assert (=> b!929497 (=> (not res!625988) (not e!521943))))

(declare-fun v!791 () V!31519)

(declare-fun apply!733 (ListLongMap!11827 (_ BitVec 64)) V!31519)

(assert (=> b!929497 (= res!625988 (= (apply!733 lt!418883 k0!1099) v!791))))

(declare-fun b!929498 () Bool)

(declare-fun res!625990 () Bool)

(assert (=> b!929498 (=> (not res!625990) (not e!521942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55749 (_ BitVec 32)) Bool)

(assert (=> b!929498 (= res!625990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929499 () Bool)

(declare-fun res!625984 () Bool)

(assert (=> b!929499 (=> (not res!625984) (not e!521943))))

(assert (=> b!929499 (= res!625984 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929500 () Bool)

(declare-fun e!521941 () Bool)

(assert (=> b!929500 (= e!521938 (and e!521941 mapRes!31629))))

(declare-fun condMapEmpty!31629 () Bool)

(declare-fun mapDefault!31629 () ValueCell!9476)

(assert (=> b!929500 (= condMapEmpty!31629 (= (arr!26821 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9476)) mapDefault!31629)))))

(declare-fun b!929501 () Bool)

(assert (=> b!929501 (= e!521941 tp_is_empty!19915)))

(declare-fun b!929502 () Bool)

(declare-fun res!625991 () Bool)

(assert (=> b!929502 (=> (not res!625991) (not e!521942))))

(assert (=> b!929502 (= res!625991 (and (= (size!27282 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27281 _keys!1487) (size!27282 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79176 res!625985) b!929502))

(assert (= (and b!929502 res!625991) b!929498))

(assert (= (and b!929498 res!625990) b!929494))

(assert (= (and b!929494 res!625987) b!929493))

(assert (= (and b!929493 res!625986) b!929492))

(assert (= (and b!929492 res!625989) b!929497))

(assert (= (and b!929497 res!625988) b!929499))

(assert (= (and b!929499 res!625984) b!929495))

(assert (= (and b!929500 condMapEmpty!31629) mapIsEmpty!31629))

(assert (= (and b!929500 (not condMapEmpty!31629)) mapNonEmpty!31629))

(get-info :version)

(assert (= (and mapNonEmpty!31629 ((_ is ValueCellFull!9476) mapValue!31629)) b!929496))

(assert (= (and b!929500 ((_ is ValueCellFull!9476) mapDefault!31629)) b!929501))

(assert (= start!79176 b!929500))

(declare-fun m!863437 () Bool)

(assert (=> b!929495 m!863437))

(assert (=> b!929495 m!863437))

(declare-fun m!863439 () Bool)

(assert (=> b!929495 m!863439))

(declare-fun m!863441 () Bool)

(assert (=> b!929497 m!863441))

(declare-fun m!863443 () Bool)

(assert (=> start!79176 m!863443))

(declare-fun m!863445 () Bool)

(assert (=> start!79176 m!863445))

(declare-fun m!863447 () Bool)

(assert (=> start!79176 m!863447))

(declare-fun m!863449 () Bool)

(assert (=> mapNonEmpty!31629 m!863449))

(declare-fun m!863451 () Bool)

(assert (=> b!929492 m!863451))

(declare-fun m!863453 () Bool)

(assert (=> b!929492 m!863453))

(declare-fun m!863455 () Bool)

(assert (=> b!929494 m!863455))

(declare-fun m!863457 () Bool)

(assert (=> b!929498 m!863457))

(check-sat (not b!929498) (not b_next!17407) (not b!929495) (not start!79176) (not b!929492) (not mapNonEmpty!31629) (not b!929494) (not b!929497) b_and!28447 tp_is_empty!19915)
(check-sat b_and!28447 (not b_next!17407))
