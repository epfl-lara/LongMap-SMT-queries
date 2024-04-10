; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79178 () Bool)

(assert start!79178)

(declare-fun b_free!17391 () Bool)

(declare-fun b_next!17391 () Bool)

(assert (=> start!79178 (= b_free!17391 (not b_next!17391))))

(declare-fun tp!60613 () Bool)

(declare-fun b_and!28457 () Bool)

(assert (=> start!79178 (= tp!60613 b_and!28457)))

(declare-fun b!929467 () Bool)

(declare-fun e!521943 () Bool)

(declare-fun tp_is_empty!19899 () Bool)

(assert (=> b!929467 (= e!521943 tp_is_empty!19899)))

(declare-fun b!929468 () Bool)

(declare-fun res!625909 () Bool)

(declare-fun e!521946 () Bool)

(assert (=> b!929468 (=> (not res!625909) (not e!521946))))

(declare-datatypes ((array!55752 0))(
  ( (array!55753 (arr!26821 (Array (_ BitVec 32) (_ BitVec 64))) (size!27280 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55752)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55752 (_ BitVec 32)) Bool)

(assert (=> b!929468 (= res!625909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929469 () Bool)

(declare-fun res!625908 () Bool)

(assert (=> b!929469 (=> (not res!625908) (not e!521946))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929469 (= res!625908 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27280 _keys!1487))))))

(declare-fun b!929470 () Bool)

(declare-fun res!625902 () Bool)

(declare-fun e!521944 () Bool)

(assert (=> b!929470 (=> (not res!625902) (not e!521944))))

(assert (=> b!929470 (= res!625902 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun res!625903 () Bool)

(assert (=> start!79178 (=> (not res!625903) (not e!521946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79178 (= res!625903 (validMask!0 mask!1881))))

(assert (=> start!79178 e!521946))

(assert (=> start!79178 true))

(assert (=> start!79178 tp_is_empty!19899))

(declare-datatypes ((V!31497 0))(
  ( (V!31498 (val!10000 Int)) )
))
(declare-datatypes ((ValueCell!9468 0))(
  ( (ValueCellFull!9468 (v!12518 V!31497)) (EmptyCell!9468) )
))
(declare-datatypes ((array!55754 0))(
  ( (array!55755 (arr!26822 (Array (_ BitVec 32) ValueCell!9468)) (size!27281 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55754)

(declare-fun e!521945 () Bool)

(declare-fun array_inv!20872 (array!55754) Bool)

(assert (=> start!79178 (and (array_inv!20872 _values!1231) e!521945)))

(assert (=> start!79178 tp!60613))

(declare-fun array_inv!20873 (array!55752) Bool)

(assert (=> start!79178 (array_inv!20873 _keys!1487)))

(declare-fun b!929471 () Bool)

(assert (=> b!929471 (= e!521946 e!521944)))

(declare-fun res!625907 () Bool)

(assert (=> b!929471 (=> (not res!625907) (not e!521944))))

(declare-datatypes ((tuple2!13074 0))(
  ( (tuple2!13075 (_1!6548 (_ BitVec 64)) (_2!6548 V!31497)) )
))
(declare-datatypes ((List!18868 0))(
  ( (Nil!18865) (Cons!18864 (h!20010 tuple2!13074) (t!26925 List!18868)) )
))
(declare-datatypes ((ListLongMap!11771 0))(
  ( (ListLongMap!11772 (toList!5901 List!18868)) )
))
(declare-fun lt!419071 () ListLongMap!11771)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4954 (ListLongMap!11771 (_ BitVec 64)) Bool)

(assert (=> b!929471 (= res!625907 (contains!4954 lt!419071 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31497)

(declare-fun minValue!1173 () V!31497)

(declare-fun getCurrentListMap!3145 (array!55752 array!55754 (_ BitVec 32) (_ BitVec 32) V!31497 V!31497 (_ BitVec 32) Int) ListLongMap!11771)

(assert (=> b!929471 (= lt!419071 (getCurrentListMap!3145 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929472 () Bool)

(declare-fun res!625904 () Bool)

(assert (=> b!929472 (=> (not res!625904) (not e!521944))))

(declare-fun v!791 () V!31497)

(declare-fun apply!727 (ListLongMap!11771 (_ BitVec 64)) V!31497)

(assert (=> b!929472 (= res!625904 (= (apply!727 lt!419071 k0!1099) v!791))))

(declare-fun b!929473 () Bool)

(assert (=> b!929473 (= e!521944 false)))

(declare-fun lt!419070 () Bool)

(assert (=> b!929473 (= lt!419070 (contains!4954 (getCurrentListMap!3145 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929474 () Bool)

(declare-fun e!521942 () Bool)

(declare-fun mapRes!31605 () Bool)

(assert (=> b!929474 (= e!521945 (and e!521942 mapRes!31605))))

(declare-fun condMapEmpty!31605 () Bool)

(declare-fun mapDefault!31605 () ValueCell!9468)

(assert (=> b!929474 (= condMapEmpty!31605 (= (arr!26822 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9468)) mapDefault!31605)))))

(declare-fun mapIsEmpty!31605 () Bool)

(assert (=> mapIsEmpty!31605 mapRes!31605))

(declare-fun b!929475 () Bool)

(declare-fun res!625906 () Bool)

(assert (=> b!929475 (=> (not res!625906) (not e!521946))))

(declare-datatypes ((List!18869 0))(
  ( (Nil!18866) (Cons!18865 (h!20011 (_ BitVec 64)) (t!26926 List!18869)) )
))
(declare-fun arrayNoDuplicates!0 (array!55752 (_ BitVec 32) List!18869) Bool)

(assert (=> b!929475 (= res!625906 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18866))))

(declare-fun b!929476 () Bool)

(declare-fun res!625905 () Bool)

(assert (=> b!929476 (=> (not res!625905) (not e!521946))))

(assert (=> b!929476 (= res!625905 (and (= (size!27281 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27280 _keys!1487) (size!27281 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929477 () Bool)

(assert (=> b!929477 (= e!521942 tp_is_empty!19899)))

(declare-fun mapNonEmpty!31605 () Bool)

(declare-fun tp!60614 () Bool)

(assert (=> mapNonEmpty!31605 (= mapRes!31605 (and tp!60614 e!521943))))

(declare-fun mapKey!31605 () (_ BitVec 32))

(declare-fun mapRest!31605 () (Array (_ BitVec 32) ValueCell!9468))

(declare-fun mapValue!31605 () ValueCell!9468)

(assert (=> mapNonEmpty!31605 (= (arr!26822 _values!1231) (store mapRest!31605 mapKey!31605 mapValue!31605))))

(assert (= (and start!79178 res!625903) b!929476))

(assert (= (and b!929476 res!625905) b!929468))

(assert (= (and b!929468 res!625909) b!929475))

(assert (= (and b!929475 res!625906) b!929469))

(assert (= (and b!929469 res!625908) b!929471))

(assert (= (and b!929471 res!625907) b!929472))

(assert (= (and b!929472 res!625904) b!929470))

(assert (= (and b!929470 res!625902) b!929473))

(assert (= (and b!929474 condMapEmpty!31605) mapIsEmpty!31605))

(assert (= (and b!929474 (not condMapEmpty!31605)) mapNonEmpty!31605))

(get-info :version)

(assert (= (and mapNonEmpty!31605 ((_ is ValueCellFull!9468) mapValue!31605)) b!929467))

(assert (= (and b!929474 ((_ is ValueCellFull!9468) mapDefault!31605)) b!929477))

(assert (= start!79178 b!929474))

(declare-fun m!864019 () Bool)

(assert (=> b!929471 m!864019))

(declare-fun m!864021 () Bool)

(assert (=> b!929471 m!864021))

(declare-fun m!864023 () Bool)

(assert (=> mapNonEmpty!31605 m!864023))

(declare-fun m!864025 () Bool)

(assert (=> b!929473 m!864025))

(assert (=> b!929473 m!864025))

(declare-fun m!864027 () Bool)

(assert (=> b!929473 m!864027))

(declare-fun m!864029 () Bool)

(assert (=> start!79178 m!864029))

(declare-fun m!864031 () Bool)

(assert (=> start!79178 m!864031))

(declare-fun m!864033 () Bool)

(assert (=> start!79178 m!864033))

(declare-fun m!864035 () Bool)

(assert (=> b!929468 m!864035))

(declare-fun m!864037 () Bool)

(assert (=> b!929475 m!864037))

(declare-fun m!864039 () Bool)

(assert (=> b!929472 m!864039))

(check-sat b_and!28457 (not b!929471) (not b_next!17391) (not mapNonEmpty!31605) (not b!929468) (not b!929475) (not b!929473) tp_is_empty!19899 (not b!929472) (not start!79178))
(check-sat b_and!28457 (not b_next!17391))
