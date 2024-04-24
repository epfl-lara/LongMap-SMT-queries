; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79526 () Bool)

(assert start!79526)

(declare-fun b_free!17545 () Bool)

(declare-fun b_next!17545 () Bool)

(assert (=> start!79526 (= b_free!17545 (not b_next!17545))))

(declare-fun tp!61079 () Bool)

(declare-fun b_and!28659 () Bool)

(assert (=> start!79526 (= tp!61079 b_and!28659)))

(declare-fun b!933061 () Bool)

(declare-fun res!628127 () Bool)

(declare-fun e!524068 () Bool)

(assert (=> b!933061 (=> (not res!628127) (not e!524068))))

(declare-datatypes ((array!56101 0))(
  ( (array!56102 (arr!26990 (Array (_ BitVec 32) (_ BitVec 64))) (size!27450 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56101)

(declare-datatypes ((List!18972 0))(
  ( (Nil!18969) (Cons!18968 (h!20120 (_ BitVec 64)) (t!27053 List!18972)) )
))
(declare-fun arrayNoDuplicates!0 (array!56101 (_ BitVec 32) List!18972) Bool)

(assert (=> b!933061 (= res!628127 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18969))))

(declare-fun b!933062 () Bool)

(declare-fun e!524070 () Bool)

(declare-fun e!524071 () Bool)

(assert (=> b!933062 (= e!524070 e!524071)))

(declare-fun res!628121 () Bool)

(assert (=> b!933062 (=> (not res!628121) (not e!524071))))

(declare-fun lt!420135 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933062 (= res!628121 (validKeyInArray!0 lt!420135))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933062 (= lt!420135 (select (arr!26990 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31839 () Bool)

(declare-fun mapRes!31839 () Bool)

(assert (=> mapIsEmpty!31839 mapRes!31839))

(declare-fun b!933063 () Bool)

(declare-fun e!524069 () Bool)

(declare-fun tp_is_empty!20053 () Bool)

(assert (=> b!933063 (= e!524069 tp_is_empty!20053)))

(declare-fun b!933064 () Bool)

(assert (=> b!933064 (= e!524071 (not (or (bvsge (size!27450 _keys!1487) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!27450 _keys!1487)))))))

(declare-datatypes ((V!31703 0))(
  ( (V!31704 (val!10077 Int)) )
))
(declare-datatypes ((tuple2!13188 0))(
  ( (tuple2!13189 (_1!6605 (_ BitVec 64)) (_2!6605 V!31703)) )
))
(declare-datatypes ((List!18973 0))(
  ( (Nil!18970) (Cons!18969 (h!20121 tuple2!13188) (t!27054 List!18973)) )
))
(declare-datatypes ((ListLongMap!11887 0))(
  ( (ListLongMap!11888 (toList!5959 List!18973)) )
))
(declare-fun lt!420131 () ListLongMap!11887)

(declare-fun lt!420130 () tuple2!13188)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5025 (ListLongMap!11887 (_ BitVec 64)) Bool)

(declare-fun +!2789 (ListLongMap!11887 tuple2!13188) ListLongMap!11887)

(assert (=> b!933064 (contains!5025 (+!2789 lt!420131 lt!420130) k0!1099)))

(declare-datatypes ((Unit!31448 0))(
  ( (Unit!31449) )
))
(declare-fun lt!420134 () Unit!31448)

(declare-fun lt!420133 () V!31703)

(declare-fun addStillContains!492 (ListLongMap!11887 (_ BitVec 64) V!31703 (_ BitVec 64)) Unit!31448)

(assert (=> b!933064 (= lt!420134 (addStillContains!492 lt!420131 lt!420135 lt!420133 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9545 0))(
  ( (ValueCellFull!9545 (v!12593 V!31703)) (EmptyCell!9545) )
))
(declare-datatypes ((array!56103 0))(
  ( (array!56104 (arr!26991 (Array (_ BitVec 32) ValueCell!9545)) (size!27451 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56103)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31703)

(declare-fun minValue!1173 () V!31703)

(declare-fun getCurrentListMap!3202 (array!56101 array!56103 (_ BitVec 32) (_ BitVec 32) V!31703 V!31703 (_ BitVec 32) Int) ListLongMap!11887)

(assert (=> b!933064 (= (getCurrentListMap!3202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2789 (getCurrentListMap!3202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420130))))

(assert (=> b!933064 (= lt!420130 (tuple2!13189 lt!420135 lt!420133))))

(declare-fun get!14209 (ValueCell!9545 V!31703) V!31703)

(declare-fun dynLambda!1586 (Int (_ BitVec 64)) V!31703)

(assert (=> b!933064 (= lt!420133 (get!14209 (select (arr!26991 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1586 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420132 () Unit!31448)

(declare-fun lemmaListMapRecursiveValidKeyArray!169 (array!56101 array!56103 (_ BitVec 32) (_ BitVec 32) V!31703 V!31703 (_ BitVec 32) Int) Unit!31448)

(assert (=> b!933064 (= lt!420132 (lemmaListMapRecursiveValidKeyArray!169 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933065 () Bool)

(assert (=> b!933065 (= e!524068 e!524070)))

(declare-fun res!628122 () Bool)

(assert (=> b!933065 (=> (not res!628122) (not e!524070))))

(assert (=> b!933065 (= res!628122 (contains!5025 lt!420131 k0!1099))))

(assert (=> b!933065 (= lt!420131 (getCurrentListMap!3202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933066 () Bool)

(declare-fun res!628123 () Bool)

(assert (=> b!933066 (=> (not res!628123) (not e!524070))))

(declare-fun v!791 () V!31703)

(declare-fun apply!787 (ListLongMap!11887 (_ BitVec 64)) V!31703)

(assert (=> b!933066 (= res!628123 (= (apply!787 lt!420131 k0!1099) v!791))))

(declare-fun b!933067 () Bool)

(declare-fun e!524073 () Bool)

(assert (=> b!933067 (= e!524073 (and e!524069 mapRes!31839))))

(declare-fun condMapEmpty!31839 () Bool)

(declare-fun mapDefault!31839 () ValueCell!9545)

(assert (=> b!933067 (= condMapEmpty!31839 (= (arr!26991 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9545)) mapDefault!31839)))))

(declare-fun b!933068 () Bool)

(declare-fun res!628125 () Bool)

(assert (=> b!933068 (=> (not res!628125) (not e!524068))))

(assert (=> b!933068 (= res!628125 (and (= (size!27451 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27450 _keys!1487) (size!27451 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31839 () Bool)

(declare-fun tp!61080 () Bool)

(declare-fun e!524067 () Bool)

(assert (=> mapNonEmpty!31839 (= mapRes!31839 (and tp!61080 e!524067))))

(declare-fun mapValue!31839 () ValueCell!9545)

(declare-fun mapKey!31839 () (_ BitVec 32))

(declare-fun mapRest!31839 () (Array (_ BitVec 32) ValueCell!9545))

(assert (=> mapNonEmpty!31839 (= (arr!26991 _values!1231) (store mapRest!31839 mapKey!31839 mapValue!31839))))

(declare-fun b!933069 () Bool)

(declare-fun res!628126 () Bool)

(assert (=> b!933069 (=> (not res!628126) (not e!524070))))

(assert (=> b!933069 (= res!628126 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933071 () Bool)

(declare-fun res!628124 () Bool)

(assert (=> b!933071 (=> (not res!628124) (not e!524068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56101 (_ BitVec 32)) Bool)

(assert (=> b!933071 (= res!628124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!628119 () Bool)

(assert (=> start!79526 (=> (not res!628119) (not e!524068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79526 (= res!628119 (validMask!0 mask!1881))))

(assert (=> start!79526 e!524068))

(assert (=> start!79526 true))

(assert (=> start!79526 tp_is_empty!20053))

(declare-fun array_inv!21092 (array!56103) Bool)

(assert (=> start!79526 (and (array_inv!21092 _values!1231) e!524073)))

(assert (=> start!79526 tp!61079))

(declare-fun array_inv!21093 (array!56101) Bool)

(assert (=> start!79526 (array_inv!21093 _keys!1487)))

(declare-fun b!933070 () Bool)

(declare-fun res!628128 () Bool)

(assert (=> b!933070 (=> (not res!628128) (not e!524070))))

(assert (=> b!933070 (= res!628128 (validKeyInArray!0 k0!1099))))

(declare-fun b!933072 () Bool)

(declare-fun res!628120 () Bool)

(assert (=> b!933072 (=> (not res!628120) (not e!524068))))

(assert (=> b!933072 (= res!628120 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27450 _keys!1487))))))

(declare-fun b!933073 () Bool)

(assert (=> b!933073 (= e!524067 tp_is_empty!20053)))

(assert (= (and start!79526 res!628119) b!933068))

(assert (= (and b!933068 res!628125) b!933071))

(assert (= (and b!933071 res!628124) b!933061))

(assert (= (and b!933061 res!628127) b!933072))

(assert (= (and b!933072 res!628120) b!933065))

(assert (= (and b!933065 res!628122) b!933066))

(assert (= (and b!933066 res!628123) b!933069))

(assert (= (and b!933069 res!628126) b!933070))

(assert (= (and b!933070 res!628128) b!933062))

(assert (= (and b!933062 res!628121) b!933064))

(assert (= (and b!933067 condMapEmpty!31839) mapIsEmpty!31839))

(assert (= (and b!933067 (not condMapEmpty!31839)) mapNonEmpty!31839))

(get-info :version)

(assert (= (and mapNonEmpty!31839 ((_ is ValueCellFull!9545) mapValue!31839)) b!933073))

(assert (= (and b!933067 ((_ is ValueCellFull!9545) mapDefault!31839)) b!933063))

(assert (= start!79526 b!933067))

(declare-fun b_lambda!13893 () Bool)

(assert (=> (not b_lambda!13893) (not b!933064)))

(declare-fun t!27052 () Bool)

(declare-fun tb!5931 () Bool)

(assert (=> (and start!79526 (= defaultEntry!1235 defaultEntry!1235) t!27052) tb!5931))

(declare-fun result!11695 () Bool)

(assert (=> tb!5931 (= result!11695 tp_is_empty!20053)))

(assert (=> b!933064 t!27052))

(declare-fun b_and!28661 () Bool)

(assert (= b_and!28659 (and (=> t!27052 result!11695) b_and!28661)))

(declare-fun m!867401 () Bool)

(assert (=> mapNonEmpty!31839 m!867401))

(declare-fun m!867403 () Bool)

(assert (=> b!933071 m!867403))

(declare-fun m!867405 () Bool)

(assert (=> b!933062 m!867405))

(declare-fun m!867407 () Bool)

(assert (=> b!933062 m!867407))

(declare-fun m!867409 () Bool)

(assert (=> b!933070 m!867409))

(declare-fun m!867411 () Bool)

(assert (=> b!933061 m!867411))

(declare-fun m!867413 () Bool)

(assert (=> b!933066 m!867413))

(declare-fun m!867415 () Bool)

(assert (=> start!79526 m!867415))

(declare-fun m!867417 () Bool)

(assert (=> start!79526 m!867417))

(declare-fun m!867419 () Bool)

(assert (=> start!79526 m!867419))

(declare-fun m!867421 () Bool)

(assert (=> b!933064 m!867421))

(declare-fun m!867423 () Bool)

(assert (=> b!933064 m!867423))

(declare-fun m!867425 () Bool)

(assert (=> b!933064 m!867425))

(assert (=> b!933064 m!867421))

(assert (=> b!933064 m!867425))

(declare-fun m!867427 () Bool)

(assert (=> b!933064 m!867427))

(declare-fun m!867429 () Bool)

(assert (=> b!933064 m!867429))

(declare-fun m!867431 () Bool)

(assert (=> b!933064 m!867431))

(declare-fun m!867433 () Bool)

(assert (=> b!933064 m!867433))

(assert (=> b!933064 m!867431))

(declare-fun m!867435 () Bool)

(assert (=> b!933064 m!867435))

(assert (=> b!933064 m!867423))

(declare-fun m!867437 () Bool)

(assert (=> b!933064 m!867437))

(declare-fun m!867439 () Bool)

(assert (=> b!933064 m!867439))

(declare-fun m!867441 () Bool)

(assert (=> b!933065 m!867441))

(declare-fun m!867443 () Bool)

(assert (=> b!933065 m!867443))

(check-sat (not start!79526) (not b!933065) (not b!933070) (not b_next!17545) (not b_lambda!13893) tp_is_empty!20053 (not b!933064) (not b!933061) b_and!28661 (not b!933071) (not mapNonEmpty!31839) (not b!933066) (not b!933062))
(check-sat b_and!28661 (not b_next!17545))
