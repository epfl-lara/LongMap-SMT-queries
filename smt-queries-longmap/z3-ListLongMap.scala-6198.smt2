; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79278 () Bool)

(assert start!79278)

(declare-fun b_free!17509 () Bool)

(declare-fun b_next!17509 () Bool)

(assert (=> start!79278 (= b_free!17509 (not b_next!17509))))

(declare-fun tp!60969 () Bool)

(declare-fun b_and!28549 () Bool)

(assert (=> start!79278 (= tp!60969 b_and!28549)))

(declare-fun b!931045 () Bool)

(declare-fun res!627080 () Bool)

(declare-fun e!522857 () Bool)

(assert (=> b!931045 (=> (not res!627080) (not e!522857))))

(declare-datatypes ((array!55943 0))(
  ( (array!55944 (arr!26917 (Array (_ BitVec 32) (_ BitVec 64))) (size!27378 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55943)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31655 0))(
  ( (V!31656 (val!10059 Int)) )
))
(declare-datatypes ((ValueCell!9527 0))(
  ( (ValueCellFull!9527 (v!12576 V!31655)) (EmptyCell!9527) )
))
(declare-datatypes ((array!55945 0))(
  ( (array!55946 (arr!26918 (Array (_ BitVec 32) ValueCell!9527)) (size!27379 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55945)

(assert (=> b!931045 (= res!627080 (and (= (size!27379 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27378 _keys!1487) (size!27379 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!627082 () Bool)

(assert (=> start!79278 (=> (not res!627082) (not e!522857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79278 (= res!627082 (validMask!0 mask!1881))))

(assert (=> start!79278 e!522857))

(assert (=> start!79278 true))

(declare-fun e!522861 () Bool)

(declare-fun array_inv!21016 (array!55945) Bool)

(assert (=> start!79278 (and (array_inv!21016 _values!1231) e!522861)))

(assert (=> start!79278 tp!60969))

(declare-fun array_inv!21017 (array!55943) Bool)

(assert (=> start!79278 (array_inv!21017 _keys!1487)))

(declare-fun tp_is_empty!20017 () Bool)

(assert (=> start!79278 tp_is_empty!20017))

(declare-fun b!931046 () Bool)

(declare-fun e!522858 () Bool)

(assert (=> b!931046 (= e!522858 tp_is_empty!20017)))

(declare-fun b!931047 () Bool)

(declare-fun e!522859 () Bool)

(assert (=> b!931047 (= e!522857 e!522859)))

(declare-fun res!627078 () Bool)

(assert (=> b!931047 (=> (not res!627078) (not e!522859))))

(declare-datatypes ((tuple2!13220 0))(
  ( (tuple2!13221 (_1!6621 (_ BitVec 64)) (_2!6621 V!31655)) )
))
(declare-datatypes ((List!18976 0))(
  ( (Nil!18973) (Cons!18972 (h!20118 tuple2!13220) (t!27024 List!18976)) )
))
(declare-datatypes ((ListLongMap!11907 0))(
  ( (ListLongMap!11908 (toList!5969 List!18976)) )
))
(declare-fun lt!419161 () ListLongMap!11907)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4970 (ListLongMap!11907 (_ BitVec 64)) Bool)

(assert (=> b!931047 (= res!627078 (contains!4970 lt!419161 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31655)

(declare-fun minValue!1173 () V!31655)

(declare-fun getCurrentListMap!3144 (array!55943 array!55945 (_ BitVec 32) (_ BitVec 32) V!31655 V!31655 (_ BitVec 32) Int) ListLongMap!11907)

(assert (=> b!931047 (= lt!419161 (getCurrentListMap!3144 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931048 () Bool)

(declare-fun e!522860 () Bool)

(declare-fun mapRes!31782 () Bool)

(assert (=> b!931048 (= e!522861 (and e!522860 mapRes!31782))))

(declare-fun condMapEmpty!31782 () Bool)

(declare-fun mapDefault!31782 () ValueCell!9527)

(assert (=> b!931048 (= condMapEmpty!31782 (= (arr!26918 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9527)) mapDefault!31782)))))

(declare-fun mapNonEmpty!31782 () Bool)

(declare-fun tp!60968 () Bool)

(assert (=> mapNonEmpty!31782 (= mapRes!31782 (and tp!60968 e!522858))))

(declare-fun mapRest!31782 () (Array (_ BitVec 32) ValueCell!9527))

(declare-fun mapKey!31782 () (_ BitVec 32))

(declare-fun mapValue!31782 () ValueCell!9527)

(assert (=> mapNonEmpty!31782 (= (arr!26918 _values!1231) (store mapRest!31782 mapKey!31782 mapValue!31782))))

(declare-fun mapIsEmpty!31782 () Bool)

(assert (=> mapIsEmpty!31782 mapRes!31782))

(declare-fun b!931049 () Bool)

(assert (=> b!931049 (= e!522860 tp_is_empty!20017)))

(declare-fun b!931050 () Bool)

(declare-fun res!627083 () Bool)

(assert (=> b!931050 (=> (not res!627083) (not e!522857))))

(assert (=> b!931050 (= res!627083 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27378 _keys!1487))))))

(declare-fun b!931051 () Bool)

(assert (=> b!931051 (= e!522859 false)))

(declare-fun lt!419162 () V!31655)

(declare-fun apply!764 (ListLongMap!11907 (_ BitVec 64)) V!31655)

(assert (=> b!931051 (= lt!419162 (apply!764 lt!419161 k0!1099))))

(declare-fun b!931052 () Bool)

(declare-fun res!627079 () Bool)

(assert (=> b!931052 (=> (not res!627079) (not e!522857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55943 (_ BitVec 32)) Bool)

(assert (=> b!931052 (= res!627079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931053 () Bool)

(declare-fun res!627081 () Bool)

(assert (=> b!931053 (=> (not res!627081) (not e!522857))))

(declare-datatypes ((List!18977 0))(
  ( (Nil!18974) (Cons!18973 (h!20119 (_ BitVec 64)) (t!27025 List!18977)) )
))
(declare-fun arrayNoDuplicates!0 (array!55943 (_ BitVec 32) List!18977) Bool)

(assert (=> b!931053 (= res!627081 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18974))))

(assert (= (and start!79278 res!627082) b!931045))

(assert (= (and b!931045 res!627080) b!931052))

(assert (= (and b!931052 res!627079) b!931053))

(assert (= (and b!931053 res!627081) b!931050))

(assert (= (and b!931050 res!627083) b!931047))

(assert (= (and b!931047 res!627078) b!931051))

(assert (= (and b!931048 condMapEmpty!31782) mapIsEmpty!31782))

(assert (= (and b!931048 (not condMapEmpty!31782)) mapNonEmpty!31782))

(get-info :version)

(assert (= (and mapNonEmpty!31782 ((_ is ValueCellFull!9527) mapValue!31782)) b!931046))

(assert (= (and b!931048 ((_ is ValueCellFull!9527) mapDefault!31782)) b!931049))

(assert (= start!79278 b!931048))

(declare-fun m!864451 () Bool)

(assert (=> mapNonEmpty!31782 m!864451))

(declare-fun m!864453 () Bool)

(assert (=> start!79278 m!864453))

(declare-fun m!864455 () Bool)

(assert (=> start!79278 m!864455))

(declare-fun m!864457 () Bool)

(assert (=> start!79278 m!864457))

(declare-fun m!864459 () Bool)

(assert (=> b!931053 m!864459))

(declare-fun m!864461 () Bool)

(assert (=> b!931052 m!864461))

(declare-fun m!864463 () Bool)

(assert (=> b!931047 m!864463))

(declare-fun m!864465 () Bool)

(assert (=> b!931047 m!864465))

(declare-fun m!864467 () Bool)

(assert (=> b!931051 m!864467))

(check-sat (not b!931053) (not b!931051) (not b!931052) (not mapNonEmpty!31782) b_and!28549 (not start!79278) tp_is_empty!20017 (not b!931047) (not b_next!17509))
(check-sat b_and!28549 (not b_next!17509))
