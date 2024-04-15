; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79604 () Bool)

(assert start!79604)

(declare-fun b_free!17671 () Bool)

(declare-fun b_next!17671 () Bool)

(assert (=> start!79604 (= b_free!17671 (not b_next!17671))))

(declare-fun tp!61470 () Bool)

(declare-fun b_and!28907 () Bool)

(assert (=> start!79604 (= tp!61470 b_and!28907)))

(declare-fun b!935513 () Bool)

(declare-fun res!630012 () Bool)

(declare-fun e!525301 () Bool)

(assert (=> b!935513 (=> (not res!630012) (not e!525301))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31871 0))(
  ( (V!31872 (val!10140 Int)) )
))
(declare-fun v!791 () V!31871)

(declare-datatypes ((tuple2!13366 0))(
  ( (tuple2!13367 (_1!6694 (_ BitVec 64)) (_2!6694 V!31871)) )
))
(declare-datatypes ((List!19114 0))(
  ( (Nil!19111) (Cons!19110 (h!20256 tuple2!13366) (t!27320 List!19114)) )
))
(declare-datatypes ((ListLongMap!12053 0))(
  ( (ListLongMap!12054 (toList!6042 List!19114)) )
))
(declare-fun lt!421576 () ListLongMap!12053)

(declare-fun apply!821 (ListLongMap!12053 (_ BitVec 64)) V!31871)

(assert (=> b!935513 (= res!630012 (= (apply!821 lt!421576 k0!1099) v!791))))

(declare-fun b!935514 () Bool)

(declare-fun res!630006 () Bool)

(declare-fun e!525300 () Bool)

(assert (=> b!935514 (=> (not res!630006) (not e!525300))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56267 0))(
  ( (array!56268 (arr!27074 (Array (_ BitVec 32) (_ BitVec 64))) (size!27535 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56267)

(assert (=> b!935514 (= res!630006 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27535 _keys!1487))))))

(declare-fun b!935515 () Bool)

(declare-fun res!630008 () Bool)

(assert (=> b!935515 (=> (not res!630008) (not e!525300))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56267 (_ BitVec 32)) Bool)

(assert (=> b!935515 (= res!630008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935516 () Bool)

(declare-fun res!630009 () Bool)

(assert (=> b!935516 (=> (not res!630009) (not e!525300))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9608 0))(
  ( (ValueCellFull!9608 (v!12664 V!31871)) (EmptyCell!9608) )
))
(declare-datatypes ((array!56269 0))(
  ( (array!56270 (arr!27075 (Array (_ BitVec 32) ValueCell!9608)) (size!27536 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56269)

(assert (=> b!935516 (= res!630009 (and (= (size!27536 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27535 _keys!1487) (size!27536 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935517 () Bool)

(declare-fun e!525307 () Bool)

(declare-fun arrayContainsKey!0 (array!56267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935517 (= e!525307 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935518 () Bool)

(assert (=> b!935518 (= e!525300 e!525301)))

(declare-fun res!630013 () Bool)

(assert (=> b!935518 (=> (not res!630013) (not e!525301))))

(declare-fun contains!5046 (ListLongMap!12053 (_ BitVec 64)) Bool)

(assert (=> b!935518 (= res!630013 (contains!5046 lt!421576 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31871)

(declare-fun minValue!1173 () V!31871)

(declare-fun getCurrentListMap!3210 (array!56267 array!56269 (_ BitVec 32) (_ BitVec 32) V!31871 V!31871 (_ BitVec 32) Int) ListLongMap!12053)

(assert (=> b!935518 (= lt!421576 (getCurrentListMap!3210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935519 () Bool)

(declare-fun e!525303 () Bool)

(declare-fun e!525302 () Bool)

(declare-fun mapRes!32040 () Bool)

(assert (=> b!935519 (= e!525303 (and e!525302 mapRes!32040))))

(declare-fun condMapEmpty!32040 () Bool)

(declare-fun mapDefault!32040 () ValueCell!9608)

(assert (=> b!935519 (= condMapEmpty!32040 (= (arr!27075 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9608)) mapDefault!32040)))))

(declare-fun b!935520 () Bool)

(declare-fun e!525305 () Bool)

(assert (=> b!935520 (= e!525301 e!525305)))

(declare-fun res!630017 () Bool)

(assert (=> b!935520 (=> (not res!630017) (not e!525305))))

(declare-fun lt!421581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935520 (= res!630017 (validKeyInArray!0 lt!421581))))

(assert (=> b!935520 (= lt!421581 (select (arr!27074 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935521 () Bool)

(declare-fun res!630016 () Bool)

(declare-fun e!525304 () Bool)

(assert (=> b!935521 (=> res!630016 e!525304)))

(declare-datatypes ((List!19115 0))(
  ( (Nil!19112) (Cons!19111 (h!20257 (_ BitVec 64)) (t!27321 List!19115)) )
))
(declare-fun contains!5047 (List!19115 (_ BitVec 64)) Bool)

(assert (=> b!935521 (= res!630016 (contains!5047 Nil!19112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!630010 () Bool)

(assert (=> start!79604 (=> (not res!630010) (not e!525300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79604 (= res!630010 (validMask!0 mask!1881))))

(assert (=> start!79604 e!525300))

(assert (=> start!79604 true))

(declare-fun tp_is_empty!20179 () Bool)

(assert (=> start!79604 tp_is_empty!20179))

(declare-fun array_inv!21130 (array!56269) Bool)

(assert (=> start!79604 (and (array_inv!21130 _values!1231) e!525303)))

(assert (=> start!79604 tp!61470))

(declare-fun array_inv!21131 (array!56267) Bool)

(assert (=> start!79604 (array_inv!21131 _keys!1487)))

(declare-fun b!935512 () Bool)

(declare-fun res!630011 () Bool)

(assert (=> b!935512 (=> (not res!630011) (not e!525301))))

(assert (=> b!935512 (= res!630011 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935522 () Bool)

(assert (=> b!935522 (= e!525307 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935523 () Bool)

(assert (=> b!935523 (= e!525305 (not e!525304))))

(declare-fun res!630007 () Bool)

(assert (=> b!935523 (=> res!630007 e!525304)))

(assert (=> b!935523 (= res!630007 (or (bvsge (size!27535 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27535 _keys!1487))))))

(assert (=> b!935523 e!525307))

(declare-fun c!97273 () Bool)

(assert (=> b!935523 (= c!97273 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31470 0))(
  ( (Unit!31471) )
))
(declare-fun lt!421579 () Unit!31470)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!287 (array!56267 array!56269 (_ BitVec 32) (_ BitVec 32) V!31871 V!31871 (_ BitVec 64) (_ BitVec 32) Int) Unit!31470)

(assert (=> b!935523 (= lt!421579 (lemmaListMapContainsThenArrayContainsFrom!287 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56267 (_ BitVec 32) List!19115) Bool)

(assert (=> b!935523 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19112)))

(declare-fun lt!421582 () Unit!31470)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56267 (_ BitVec 32) (_ BitVec 32)) Unit!31470)

(assert (=> b!935523 (= lt!421582 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421584 () tuple2!13366)

(declare-fun +!2840 (ListLongMap!12053 tuple2!13366) ListLongMap!12053)

(assert (=> b!935523 (contains!5046 (+!2840 lt!421576 lt!421584) k0!1099)))

(declare-fun lt!421577 () V!31871)

(declare-fun lt!421580 () Unit!31470)

(declare-fun addStillContains!529 (ListLongMap!12053 (_ BitVec 64) V!31871 (_ BitVec 64)) Unit!31470)

(assert (=> b!935523 (= lt!421580 (addStillContains!529 lt!421576 lt!421581 lt!421577 k0!1099))))

(assert (=> b!935523 (= (getCurrentListMap!3210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2840 (getCurrentListMap!3210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421584))))

(assert (=> b!935523 (= lt!421584 (tuple2!13367 lt!421581 lt!421577))))

(declare-fun get!14274 (ValueCell!9608 V!31871) V!31871)

(declare-fun dynLambda!1596 (Int (_ BitVec 64)) V!31871)

(assert (=> b!935523 (= lt!421577 (get!14274 (select (arr!27075 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1596 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421578 () Unit!31470)

(declare-fun lemmaListMapRecursiveValidKeyArray!204 (array!56267 array!56269 (_ BitVec 32) (_ BitVec 32) V!31871 V!31871 (_ BitVec 32) Int) Unit!31470)

(assert (=> b!935523 (= lt!421578 (lemmaListMapRecursiveValidKeyArray!204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!32040 () Bool)

(declare-fun tp!61469 () Bool)

(declare-fun e!525308 () Bool)

(assert (=> mapNonEmpty!32040 (= mapRes!32040 (and tp!61469 e!525308))))

(declare-fun mapKey!32040 () (_ BitVec 32))

(declare-fun mapRest!32040 () (Array (_ BitVec 32) ValueCell!9608))

(declare-fun mapValue!32040 () ValueCell!9608)

(assert (=> mapNonEmpty!32040 (= (arr!27075 _values!1231) (store mapRest!32040 mapKey!32040 mapValue!32040))))

(declare-fun b!935524 () Bool)

(declare-fun res!630005 () Bool)

(assert (=> b!935524 (=> res!630005 e!525304)))

(declare-fun noDuplicate!1364 (List!19115) Bool)

(assert (=> b!935524 (= res!630005 (not (noDuplicate!1364 Nil!19112)))))

(declare-fun b!935525 () Bool)

(declare-fun res!630015 () Bool)

(assert (=> b!935525 (=> (not res!630015) (not e!525301))))

(assert (=> b!935525 (= res!630015 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!32040 () Bool)

(assert (=> mapIsEmpty!32040 mapRes!32040))

(declare-fun b!935526 () Bool)

(assert (=> b!935526 (= e!525304 true)))

(declare-fun lt!421583 () Bool)

(assert (=> b!935526 (= lt!421583 (contains!5047 Nil!19112 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935527 () Bool)

(assert (=> b!935527 (= e!525302 tp_is_empty!20179)))

(declare-fun b!935528 () Bool)

(assert (=> b!935528 (= e!525308 tp_is_empty!20179)))

(declare-fun b!935529 () Bool)

(declare-fun res!630014 () Bool)

(assert (=> b!935529 (=> (not res!630014) (not e!525300))))

(assert (=> b!935529 (= res!630014 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19112))))

(assert (= (and start!79604 res!630010) b!935516))

(assert (= (and b!935516 res!630009) b!935515))

(assert (= (and b!935515 res!630008) b!935529))

(assert (= (and b!935529 res!630014) b!935514))

(assert (= (and b!935514 res!630006) b!935518))

(assert (= (and b!935518 res!630013) b!935513))

(assert (= (and b!935513 res!630012) b!935512))

(assert (= (and b!935512 res!630011) b!935525))

(assert (= (and b!935525 res!630015) b!935520))

(assert (= (and b!935520 res!630017) b!935523))

(assert (= (and b!935523 c!97273) b!935517))

(assert (= (and b!935523 (not c!97273)) b!935522))

(assert (= (and b!935523 (not res!630007)) b!935524))

(assert (= (and b!935524 (not res!630005)) b!935521))

(assert (= (and b!935521 (not res!630016)) b!935526))

(assert (= (and b!935519 condMapEmpty!32040) mapIsEmpty!32040))

(assert (= (and b!935519 (not condMapEmpty!32040)) mapNonEmpty!32040))

(get-info :version)

(assert (= (and mapNonEmpty!32040 ((_ is ValueCellFull!9608) mapValue!32040)) b!935528))

(assert (= (and b!935519 ((_ is ValueCellFull!9608) mapDefault!32040)) b!935527))

(assert (= start!79604 b!935519))

(declare-fun b_lambda!14059 () Bool)

(assert (=> (not b_lambda!14059) (not b!935523)))

(declare-fun t!27319 () Bool)

(declare-fun tb!6057 () Bool)

(assert (=> (and start!79604 (= defaultEntry!1235 defaultEntry!1235) t!27319) tb!6057))

(declare-fun result!11955 () Bool)

(assert (=> tb!6057 (= result!11955 tp_is_empty!20179)))

(assert (=> b!935523 t!27319))

(declare-fun b_and!28909 () Bool)

(assert (= b_and!28907 (and (=> t!27319 result!11955) b_and!28909)))

(declare-fun m!869507 () Bool)

(assert (=> b!935520 m!869507))

(declare-fun m!869509 () Bool)

(assert (=> b!935520 m!869509))

(declare-fun m!869511 () Bool)

(assert (=> b!935517 m!869511))

(declare-fun m!869513 () Bool)

(assert (=> b!935513 m!869513))

(declare-fun m!869515 () Bool)

(assert (=> b!935515 m!869515))

(declare-fun m!869517 () Bool)

(assert (=> b!935524 m!869517))

(declare-fun m!869519 () Bool)

(assert (=> b!935518 m!869519))

(declare-fun m!869521 () Bool)

(assert (=> b!935518 m!869521))

(declare-fun m!869523 () Bool)

(assert (=> b!935525 m!869523))

(declare-fun m!869525 () Bool)

(assert (=> start!79604 m!869525))

(declare-fun m!869527 () Bool)

(assert (=> start!79604 m!869527))

(declare-fun m!869529 () Bool)

(assert (=> start!79604 m!869529))

(declare-fun m!869531 () Bool)

(assert (=> b!935526 m!869531))

(declare-fun m!869533 () Bool)

(assert (=> b!935529 m!869533))

(declare-fun m!869535 () Bool)

(assert (=> mapNonEmpty!32040 m!869535))

(declare-fun m!869537 () Bool)

(assert (=> b!935523 m!869537))

(declare-fun m!869539 () Bool)

(assert (=> b!935523 m!869539))

(declare-fun m!869541 () Bool)

(assert (=> b!935523 m!869541))

(declare-fun m!869543 () Bool)

(assert (=> b!935523 m!869543))

(declare-fun m!869545 () Bool)

(assert (=> b!935523 m!869545))

(declare-fun m!869547 () Bool)

(assert (=> b!935523 m!869547))

(assert (=> b!935523 m!869543))

(declare-fun m!869549 () Bool)

(assert (=> b!935523 m!869549))

(declare-fun m!869551 () Bool)

(assert (=> b!935523 m!869551))

(declare-fun m!869553 () Bool)

(assert (=> b!935523 m!869553))

(declare-fun m!869555 () Bool)

(assert (=> b!935523 m!869555))

(declare-fun m!869557 () Bool)

(assert (=> b!935523 m!869557))

(declare-fun m!869559 () Bool)

(assert (=> b!935523 m!869559))

(assert (=> b!935523 m!869549))

(assert (=> b!935523 m!869545))

(assert (=> b!935523 m!869537))

(declare-fun m!869561 () Bool)

(assert (=> b!935523 m!869561))

(declare-fun m!869563 () Bool)

(assert (=> b!935521 m!869563))

(check-sat (not b!935524) (not b!935521) (not b!935518) (not b!935513) (not b!935515) (not b_lambda!14059) b_and!28909 (not start!79604) (not b!935520) (not b_next!17671) (not b!935529) (not b!935517) (not b!935526) (not b!935523) (not mapNonEmpty!32040) tp_is_empty!20179 (not b!935525))
(check-sat b_and!28909 (not b_next!17671))
