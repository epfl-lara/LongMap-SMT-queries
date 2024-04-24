; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79446 () Bool)

(assert start!79446)

(declare-fun b_free!17491 () Bool)

(declare-fun b_next!17491 () Bool)

(assert (=> start!79446 (= b_free!17491 (not b_next!17491))))

(declare-fun tp!60915 () Bool)

(declare-fun b_and!28567 () Bool)

(assert (=> start!79446 (= tp!60915 b_and!28567)))

(declare-fun b!931908 () Bool)

(declare-fun e!523426 () Bool)

(declare-fun tp_is_empty!19999 () Bool)

(assert (=> b!931908 (= e!523426 tp_is_empty!19999)))

(declare-fun b!931909 () Bool)

(declare-fun res!627334 () Bool)

(declare-fun e!523424 () Bool)

(assert (=> b!931909 (=> (not res!627334) (not e!523424))))

(declare-datatypes ((array!55999 0))(
  ( (array!56000 (arr!26940 (Array (_ BitVec 32) (_ BitVec 64))) (size!27400 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55999)

(declare-datatypes ((List!18940 0))(
  ( (Nil!18937) (Cons!18936 (h!20088 (_ BitVec 64)) (t!26989 List!18940)) )
))
(declare-fun arrayNoDuplicates!0 (array!55999 (_ BitVec 32) List!18940) Bool)

(assert (=> b!931909 (= res!627334 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18937))))

(declare-fun b!931910 () Bool)

(declare-fun e!523429 () Bool)

(declare-fun e!523425 () Bool)

(declare-fun mapRes!31755 () Bool)

(assert (=> b!931910 (= e!523429 (and e!523425 mapRes!31755))))

(declare-fun condMapEmpty!31755 () Bool)

(declare-datatypes ((V!31631 0))(
  ( (V!31632 (val!10050 Int)) )
))
(declare-datatypes ((ValueCell!9518 0))(
  ( (ValueCellFull!9518 (v!12565 V!31631)) (EmptyCell!9518) )
))
(declare-datatypes ((array!56001 0))(
  ( (array!56002 (arr!26941 (Array (_ BitVec 32) ValueCell!9518)) (size!27401 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56001)

(declare-fun mapDefault!31755 () ValueCell!9518)

(assert (=> b!931910 (= condMapEmpty!31755 (= (arr!26941 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9518)) mapDefault!31755)))))

(declare-fun b!931911 () Bool)

(declare-fun res!627335 () Bool)

(assert (=> b!931911 (=> (not res!627335) (not e!523424))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55999 (_ BitVec 32)) Bool)

(assert (=> b!931911 (= res!627335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931912 () Bool)

(assert (=> b!931912 (= e!523425 tp_is_empty!19999)))

(declare-fun res!627339 () Bool)

(assert (=> start!79446 (=> (not res!627339) (not e!523424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79446 (= res!627339 (validMask!0 mask!1881))))

(assert (=> start!79446 e!523424))

(assert (=> start!79446 true))

(declare-fun array_inv!21062 (array!56001) Bool)

(assert (=> start!79446 (and (array_inv!21062 _values!1231) e!523429)))

(assert (=> start!79446 tp!60915))

(declare-fun array_inv!21063 (array!55999) Bool)

(assert (=> start!79446 (array_inv!21063 _keys!1487)))

(assert (=> start!79446 tp_is_empty!19999))

(declare-fun mapNonEmpty!31755 () Bool)

(declare-fun tp!60914 () Bool)

(assert (=> mapNonEmpty!31755 (= mapRes!31755 (and tp!60914 e!523426))))

(declare-fun mapRest!31755 () (Array (_ BitVec 32) ValueCell!9518))

(declare-fun mapValue!31755 () ValueCell!9518)

(declare-fun mapKey!31755 () (_ BitVec 32))

(assert (=> mapNonEmpty!31755 (= (arr!26941 _values!1231) (store mapRest!31755 mapKey!31755 mapValue!31755))))

(declare-fun b!931913 () Bool)

(declare-fun res!627336 () Bool)

(assert (=> b!931913 (=> (not res!627336) (not e!523424))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931913 (= res!627336 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27400 _keys!1487))))))

(declare-fun b!931914 () Bool)

(declare-fun res!627338 () Bool)

(assert (=> b!931914 (=> (not res!627338) (not e!523424))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931914 (= res!627338 (and (= (size!27401 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27400 _keys!1487) (size!27401 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931915 () Bool)

(declare-fun e!523427 () Bool)

(assert (=> b!931915 (= e!523427 false)))

(declare-fun lt!419713 () V!31631)

(declare-datatypes ((tuple2!13152 0))(
  ( (tuple2!13153 (_1!6587 (_ BitVec 64)) (_2!6587 V!31631)) )
))
(declare-datatypes ((List!18941 0))(
  ( (Nil!18938) (Cons!18937 (h!20089 tuple2!13152) (t!26990 List!18941)) )
))
(declare-datatypes ((ListLongMap!11851 0))(
  ( (ListLongMap!11852 (toList!5941 List!18941)) )
))
(declare-fun lt!419714 () ListLongMap!11851)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!775 (ListLongMap!11851 (_ BitVec 64)) V!31631)

(assert (=> b!931915 (= lt!419713 (apply!775 lt!419714 k0!1099))))

(declare-fun b!931916 () Bool)

(assert (=> b!931916 (= e!523424 e!523427)))

(declare-fun res!627337 () Bool)

(assert (=> b!931916 (=> (not res!627337) (not e!523427))))

(declare-fun contains!5006 (ListLongMap!11851 (_ BitVec 64)) Bool)

(assert (=> b!931916 (= res!627337 (contains!5006 lt!419714 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31631)

(declare-fun minValue!1173 () V!31631)

(declare-fun getCurrentListMap!3184 (array!55999 array!56001 (_ BitVec 32) (_ BitVec 32) V!31631 V!31631 (_ BitVec 32) Int) ListLongMap!11851)

(assert (=> b!931916 (= lt!419714 (getCurrentListMap!3184 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31755 () Bool)

(assert (=> mapIsEmpty!31755 mapRes!31755))

(assert (= (and start!79446 res!627339) b!931914))

(assert (= (and b!931914 res!627338) b!931911))

(assert (= (and b!931911 res!627335) b!931909))

(assert (= (and b!931909 res!627334) b!931913))

(assert (= (and b!931913 res!627336) b!931916))

(assert (= (and b!931916 res!627337) b!931915))

(assert (= (and b!931910 condMapEmpty!31755) mapIsEmpty!31755))

(assert (= (and b!931910 (not condMapEmpty!31755)) mapNonEmpty!31755))

(get-info :version)

(assert (= (and mapNonEmpty!31755 ((_ is ValueCellFull!9518) mapValue!31755)) b!931908))

(assert (= (and b!931910 ((_ is ValueCellFull!9518) mapDefault!31755)) b!931912))

(assert (= start!79446 b!931910))

(declare-fun m!866323 () Bool)

(assert (=> b!931915 m!866323))

(declare-fun m!866325 () Bool)

(assert (=> b!931916 m!866325))

(declare-fun m!866327 () Bool)

(assert (=> b!931916 m!866327))

(declare-fun m!866329 () Bool)

(assert (=> mapNonEmpty!31755 m!866329))

(declare-fun m!866331 () Bool)

(assert (=> start!79446 m!866331))

(declare-fun m!866333 () Bool)

(assert (=> start!79446 m!866333))

(declare-fun m!866335 () Bool)

(assert (=> start!79446 m!866335))

(declare-fun m!866337 () Bool)

(assert (=> b!931909 m!866337))

(declare-fun m!866339 () Bool)

(assert (=> b!931911 m!866339))

(check-sat (not mapNonEmpty!31755) (not b!931909) b_and!28567 tp_is_empty!19999 (not b_next!17491) (not b!931911) (not b!931915) (not start!79446) (not b!931916))
(check-sat b_and!28567 (not b_next!17491))
