; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80044 () Bool)

(assert start!80044)

(declare-fun b_free!17773 () Bool)

(declare-fun b_next!17773 () Bool)

(assert (=> start!80044 (= b_free!17773 (not b_next!17773))))

(declare-fun tp!61784 () Bool)

(declare-fun b_and!29195 () Bool)

(assert (=> start!80044 (= tp!61784 b_and!29195)))

(declare-fun b!940341 () Bool)

(declare-fun e!528243 () Bool)

(declare-fun e!528246 () Bool)

(assert (=> b!940341 (= e!528243 e!528246)))

(declare-fun res!632230 () Bool)

(assert (=> b!940341 (=> res!632230 e!528246)))

(declare-datatypes ((V!32007 0))(
  ( (V!32008 (val!10191 Int)) )
))
(declare-datatypes ((tuple2!13382 0))(
  ( (tuple2!13383 (_1!6702 (_ BitVec 64)) (_2!6702 V!32007)) )
))
(declare-datatypes ((List!19161 0))(
  ( (Nil!19158) (Cons!19157 (h!20309 tuple2!13382) (t!27468 List!19161)) )
))
(declare-datatypes ((ListLongMap!12081 0))(
  ( (ListLongMap!12082 (toList!6056 List!19161)) )
))
(declare-fun lt!424895 () ListLongMap!12081)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5130 (ListLongMap!12081 (_ BitVec 64)) Bool)

(assert (=> b!940341 (= res!632230 (not (contains!5130 lt!424895 k0!1099)))))

(declare-datatypes ((array!56555 0))(
  ( (array!56556 (arr!27211 (Array (_ BitVec 32) (_ BitVec 64))) (size!27671 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56555)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9659 0))(
  ( (ValueCellFull!9659 (v!12719 V!32007)) (EmptyCell!9659) )
))
(declare-datatypes ((array!56557 0))(
  ( (array!56558 (arr!27212 (Array (_ BitVec 32) ValueCell!9659)) (size!27672 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56557)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!32007)

(declare-fun minValue!1173 () V!32007)

(declare-fun getCurrentListMap!3291 (array!56555 array!56557 (_ BitVec 32) (_ BitVec 32) V!32007 V!32007 (_ BitVec 32) Int) ListLongMap!12081)

(assert (=> b!940341 (= lt!424895 (getCurrentListMap!3291 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun mapIsEmpty!32201 () Bool)

(declare-fun mapRes!32201 () Bool)

(assert (=> mapIsEmpty!32201 mapRes!32201))

(declare-fun v!791 () V!32007)

(declare-fun b!940342 () Bool)

(declare-fun apply!872 (ListLongMap!12081 (_ BitVec 64)) V!32007)

(assert (=> b!940342 (= e!528246 (not (= (apply!872 lt!424895 k0!1099) v!791)))))

(declare-fun b!940343 () Bool)

(declare-fun e!528248 () Bool)

(declare-fun tp_is_empty!20281 () Bool)

(assert (=> b!940343 (= e!528248 tp_is_empty!20281)))

(declare-fun b!940344 () Bool)

(declare-fun res!632235 () Bool)

(declare-fun e!528249 () Bool)

(assert (=> b!940344 (=> (not res!632235) (not e!528249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56555 (_ BitVec 32)) Bool)

(assert (=> b!940344 (= res!632235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!940345 () Bool)

(declare-fun res!632231 () Bool)

(assert (=> b!940345 (=> (not res!632231) (not e!528249))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!940345 (= res!632231 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27671 _keys!1487))))))

(declare-fun b!940346 () Bool)

(declare-fun res!632229 () Bool)

(assert (=> b!940346 (=> (not res!632229) (not e!528243))))

(assert (=> b!940346 (= res!632229 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun res!632233 () Bool)

(assert (=> start!80044 (=> (not res!632233) (not e!528249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!80044 (= res!632233 (validMask!0 mask!1881))))

(assert (=> start!80044 e!528249))

(assert (=> start!80044 true))

(assert (=> start!80044 tp_is_empty!20281))

(declare-fun e!528245 () Bool)

(declare-fun array_inv!21248 (array!56557) Bool)

(assert (=> start!80044 (and (array_inv!21248 _values!1231) e!528245)))

(assert (=> start!80044 tp!61784))

(declare-fun array_inv!21249 (array!56555) Bool)

(assert (=> start!80044 (array_inv!21249 _keys!1487)))

(declare-fun b!940347 () Bool)

(declare-fun e!528247 () Bool)

(assert (=> b!940347 (= e!528247 tp_is_empty!20281)))

(declare-fun b!940348 () Bool)

(assert (=> b!940348 (= e!528245 (and e!528248 mapRes!32201))))

(declare-fun condMapEmpty!32201 () Bool)

(declare-fun mapDefault!32201 () ValueCell!9659)

(assert (=> b!940348 (= condMapEmpty!32201 (= (arr!27212 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9659)) mapDefault!32201)))))

(declare-fun b!940349 () Bool)

(declare-fun res!632234 () Bool)

(assert (=> b!940349 (=> (not res!632234) (not e!528249))))

(assert (=> b!940349 (= res!632234 (and (= (size!27672 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27671 _keys!1487) (size!27672 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!940350 () Bool)

(assert (=> b!940350 (= e!528249 e!528243)))

(declare-fun res!632232 () Bool)

(assert (=> b!940350 (=> (not res!632232) (not e!528243))))

(declare-fun lt!424894 () ListLongMap!12081)

(assert (=> b!940350 (= res!632232 (contains!5130 lt!424894 k0!1099))))

(assert (=> b!940350 (= lt!424894 (getCurrentListMap!3291 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!32201 () Bool)

(declare-fun tp!61783 () Bool)

(assert (=> mapNonEmpty!32201 (= mapRes!32201 (and tp!61783 e!528247))))

(declare-fun mapKey!32201 () (_ BitVec 32))

(declare-fun mapRest!32201 () (Array (_ BitVec 32) ValueCell!9659))

(declare-fun mapValue!32201 () ValueCell!9659)

(assert (=> mapNonEmpty!32201 (= (arr!27212 _values!1231) (store mapRest!32201 mapKey!32201 mapValue!32201))))

(declare-fun b!940351 () Bool)

(declare-fun res!632227 () Bool)

(assert (=> b!940351 (=> (not res!632227) (not e!528243))))

(assert (=> b!940351 (= res!632227 (= (apply!872 lt!424894 k0!1099) v!791))))

(declare-fun b!940352 () Bool)

(declare-fun res!632228 () Bool)

(assert (=> b!940352 (=> (not res!632228) (not e!528249))))

(declare-datatypes ((List!19162 0))(
  ( (Nil!19159) (Cons!19158 (h!20310 (_ BitVec 64)) (t!27469 List!19162)) )
))
(declare-fun arrayNoDuplicates!0 (array!56555 (_ BitVec 32) List!19162) Bool)

(assert (=> b!940352 (= res!632228 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19159))))

(assert (= (and start!80044 res!632233) b!940349))

(assert (= (and b!940349 res!632234) b!940344))

(assert (= (and b!940344 res!632235) b!940352))

(assert (= (and b!940352 res!632228) b!940345))

(assert (= (and b!940345 res!632231) b!940350))

(assert (= (and b!940350 res!632232) b!940351))

(assert (= (and b!940351 res!632227) b!940346))

(assert (= (and b!940346 res!632229) b!940341))

(assert (= (and b!940341 (not res!632230)) b!940342))

(assert (= (and b!940348 condMapEmpty!32201) mapIsEmpty!32201))

(assert (= (and b!940348 (not condMapEmpty!32201)) mapNonEmpty!32201))

(get-info :version)

(assert (= (and mapNonEmpty!32201 ((_ is ValueCellFull!9659) mapValue!32201)) b!940347))

(assert (= (and b!940348 ((_ is ValueCellFull!9659) mapDefault!32201)) b!940343))

(assert (= start!80044 b!940348))

(declare-fun m!876597 () Bool)

(assert (=> mapNonEmpty!32201 m!876597))

(declare-fun m!876599 () Bool)

(assert (=> b!940350 m!876599))

(declare-fun m!876601 () Bool)

(assert (=> b!940350 m!876601))

(declare-fun m!876603 () Bool)

(assert (=> start!80044 m!876603))

(declare-fun m!876605 () Bool)

(assert (=> start!80044 m!876605))

(declare-fun m!876607 () Bool)

(assert (=> start!80044 m!876607))

(declare-fun m!876609 () Bool)

(assert (=> b!940344 m!876609))

(declare-fun m!876611 () Bool)

(assert (=> b!940341 m!876611))

(declare-fun m!876613 () Bool)

(assert (=> b!940341 m!876613))

(declare-fun m!876615 () Bool)

(assert (=> b!940352 m!876615))

(declare-fun m!876617 () Bool)

(assert (=> b!940351 m!876617))

(declare-fun m!876619 () Bool)

(assert (=> b!940342 m!876619))

(check-sat (not b!940341) (not b!940342) (not mapNonEmpty!32201) b_and!29195 (not b!940350) tp_is_empty!20281 (not b!940352) (not start!80044) (not b!940351) (not b_next!17773) (not b!940344))
(check-sat b_and!29195 (not b_next!17773))
