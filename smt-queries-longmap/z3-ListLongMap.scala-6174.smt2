; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79320 () Bool)

(assert start!79320)

(declare-fun b_free!17365 () Bool)

(declare-fun b_next!17365 () Bool)

(assert (=> start!79320 (= b_free!17365 (not b_next!17365))))

(declare-fun tp!60536 () Bool)

(declare-fun b_and!28441 () Bool)

(assert (=> start!79320 (= tp!60536 b_and!28441)))

(declare-fun b!929982 () Bool)

(declare-fun res!625978 () Bool)

(declare-fun e!522294 () Bool)

(assert (=> b!929982 (=> (not res!625978) (not e!522294))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55755 0))(
  ( (array!55756 (arr!26818 (Array (_ BitVec 32) (_ BitVec 64))) (size!27278 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55755)

(assert (=> b!929982 (= res!625978 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27278 _keys!1487))))))

(declare-fun b!929983 () Bool)

(declare-fun res!625975 () Bool)

(assert (=> b!929983 (=> (not res!625975) (not e!522294))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55755 (_ BitVec 32)) Bool)

(assert (=> b!929983 (= res!625975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31566 () Bool)

(declare-fun mapRes!31566 () Bool)

(assert (=> mapIsEmpty!31566 mapRes!31566))

(declare-fun b!929984 () Bool)

(declare-fun res!625979 () Bool)

(assert (=> b!929984 (=> (not res!625979) (not e!522294))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31463 0))(
  ( (V!31464 (val!9987 Int)) )
))
(declare-datatypes ((ValueCell!9455 0))(
  ( (ValueCellFull!9455 (v!12502 V!31463)) (EmptyCell!9455) )
))
(declare-datatypes ((array!55757 0))(
  ( (array!55758 (arr!26819 (Array (_ BitVec 32) ValueCell!9455)) (size!27279 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55757)

(assert (=> b!929984 (= res!625979 (and (= (size!27279 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27278 _keys!1487) (size!27279 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31566 () Bool)

(declare-fun tp!60537 () Bool)

(declare-fun e!522290 () Bool)

(assert (=> mapNonEmpty!31566 (= mapRes!31566 (and tp!60537 e!522290))))

(declare-fun mapKey!31566 () (_ BitVec 32))

(declare-fun mapRest!31566 () (Array (_ BitVec 32) ValueCell!9455))

(declare-fun mapValue!31566 () ValueCell!9455)

(assert (=> mapNonEmpty!31566 (= (arr!26819 _values!1231) (store mapRest!31566 mapKey!31566 mapValue!31566))))

(declare-fun b!929986 () Bool)

(declare-fun res!625976 () Bool)

(assert (=> b!929986 (=> (not res!625976) (not e!522294))))

(declare-datatypes ((List!18848 0))(
  ( (Nil!18845) (Cons!18844 (h!19996 (_ BitVec 64)) (t!26897 List!18848)) )
))
(declare-fun arrayNoDuplicates!0 (array!55755 (_ BitVec 32) List!18848) Bool)

(assert (=> b!929986 (= res!625976 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18845))))

(declare-fun b!929987 () Bool)

(declare-fun e!522291 () Bool)

(assert (=> b!929987 (= e!522294 e!522291)))

(declare-fun res!625980 () Bool)

(assert (=> b!929987 (=> (not res!625980) (not e!522291))))

(declare-datatypes ((tuple2!13044 0))(
  ( (tuple2!13045 (_1!6533 (_ BitVec 64)) (_2!6533 V!31463)) )
))
(declare-datatypes ((List!18849 0))(
  ( (Nil!18846) (Cons!18845 (h!19997 tuple2!13044) (t!26898 List!18849)) )
))
(declare-datatypes ((ListLongMap!11743 0))(
  ( (ListLongMap!11744 (toList!5887 List!18849)) )
))
(declare-fun lt!419363 () ListLongMap!11743)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4957 (ListLongMap!11743 (_ BitVec 64)) Bool)

(assert (=> b!929987 (= res!625980 (contains!4957 lt!419363 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31463)

(declare-fun minValue!1173 () V!31463)

(declare-fun getCurrentListMap!3135 (array!55755 array!55757 (_ BitVec 32) (_ BitVec 32) V!31463 V!31463 (_ BitVec 32) Int) ListLongMap!11743)

(assert (=> b!929987 (= lt!419363 (getCurrentListMap!3135 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929988 () Bool)

(declare-fun tp_is_empty!19873 () Bool)

(assert (=> b!929988 (= e!522290 tp_is_empty!19873)))

(declare-fun b!929985 () Bool)

(assert (=> b!929985 (= e!522291 false)))

(declare-fun lt!419362 () V!31463)

(declare-fun apply!734 (ListLongMap!11743 (_ BitVec 64)) V!31463)

(assert (=> b!929985 (= lt!419362 (apply!734 lt!419363 k0!1099))))

(declare-fun res!625977 () Bool)

(assert (=> start!79320 (=> (not res!625977) (not e!522294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79320 (= res!625977 (validMask!0 mask!1881))))

(assert (=> start!79320 e!522294))

(assert (=> start!79320 true))

(declare-fun e!522293 () Bool)

(declare-fun array_inv!20984 (array!55757) Bool)

(assert (=> start!79320 (and (array_inv!20984 _values!1231) e!522293)))

(assert (=> start!79320 tp!60536))

(declare-fun array_inv!20985 (array!55755) Bool)

(assert (=> start!79320 (array_inv!20985 _keys!1487)))

(assert (=> start!79320 tp_is_empty!19873))

(declare-fun b!929989 () Bool)

(declare-fun e!522295 () Bool)

(assert (=> b!929989 (= e!522293 (and e!522295 mapRes!31566))))

(declare-fun condMapEmpty!31566 () Bool)

(declare-fun mapDefault!31566 () ValueCell!9455)

(assert (=> b!929989 (= condMapEmpty!31566 (= (arr!26819 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9455)) mapDefault!31566)))))

(declare-fun b!929990 () Bool)

(assert (=> b!929990 (= e!522295 tp_is_empty!19873)))

(assert (= (and start!79320 res!625977) b!929984))

(assert (= (and b!929984 res!625979) b!929983))

(assert (= (and b!929983 res!625975) b!929986))

(assert (= (and b!929986 res!625976) b!929982))

(assert (= (and b!929982 res!625978) b!929987))

(assert (= (and b!929987 res!625980) b!929985))

(assert (= (and b!929989 condMapEmpty!31566) mapIsEmpty!31566))

(assert (= (and b!929989 (not condMapEmpty!31566)) mapNonEmpty!31566))

(get-info :version)

(assert (= (and mapNonEmpty!31566 ((_ is ValueCellFull!9455) mapValue!31566)) b!929988))

(assert (= (and b!929989 ((_ is ValueCellFull!9455) mapDefault!31566)) b!929990))

(assert (= start!79320 b!929989))

(declare-fun m!865063 () Bool)

(assert (=> mapNonEmpty!31566 m!865063))

(declare-fun m!865065 () Bool)

(assert (=> b!929985 m!865065))

(declare-fun m!865067 () Bool)

(assert (=> start!79320 m!865067))

(declare-fun m!865069 () Bool)

(assert (=> start!79320 m!865069))

(declare-fun m!865071 () Bool)

(assert (=> start!79320 m!865071))

(declare-fun m!865073 () Bool)

(assert (=> b!929986 m!865073))

(declare-fun m!865075 () Bool)

(assert (=> b!929987 m!865075))

(declare-fun m!865077 () Bool)

(assert (=> b!929987 m!865077))

(declare-fun m!865079 () Bool)

(assert (=> b!929983 m!865079))

(check-sat (not b_next!17365) (not b!929985) tp_is_empty!19873 (not b!929983) (not b!929986) b_and!28441 (not start!79320) (not b!929987) (not mapNonEmpty!31566))
(check-sat b_and!28441 (not b_next!17365))
