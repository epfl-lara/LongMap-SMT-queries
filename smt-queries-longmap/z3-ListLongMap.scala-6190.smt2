; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79230 () Bool)

(assert start!79230)

(declare-fun b_free!17461 () Bool)

(declare-fun b_next!17461 () Bool)

(assert (=> start!79230 (= b_free!17461 (not b_next!17461))))

(declare-fun tp!60825 () Bool)

(declare-fun b_and!28501 () Bool)

(assert (=> start!79230 (= tp!60825 b_and!28501)))

(declare-fun b!930361 () Bool)

(declare-fun e!522425 () Bool)

(declare-fun e!522429 () Bool)

(assert (=> b!930361 (= e!522425 e!522429)))

(declare-fun res!626614 () Bool)

(assert (=> b!930361 (=> (not res!626614) (not e!522429))))

(declare-datatypes ((V!31591 0))(
  ( (V!31592 (val!10035 Int)) )
))
(declare-datatypes ((tuple2!13186 0))(
  ( (tuple2!13187 (_1!6604 (_ BitVec 64)) (_2!6604 V!31591)) )
))
(declare-datatypes ((List!18941 0))(
  ( (Nil!18938) (Cons!18937 (h!20083 tuple2!13186) (t!26989 List!18941)) )
))
(declare-datatypes ((ListLongMap!11873 0))(
  ( (ListLongMap!11874 (toList!5952 List!18941)) )
))
(declare-fun lt!419027 () ListLongMap!11873)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4955 (ListLongMap!11873 (_ BitVec 64)) Bool)

(assert (=> b!930361 (= res!626614 (contains!4955 lt!419027 k0!1099))))

(declare-datatypes ((array!55851 0))(
  ( (array!55852 (arr!26871 (Array (_ BitVec 32) (_ BitVec 64))) (size!27332 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55851)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9503 0))(
  ( (ValueCellFull!9503 (v!12552 V!31591)) (EmptyCell!9503) )
))
(declare-datatypes ((array!55853 0))(
  ( (array!55854 (arr!26872 (Array (_ BitVec 32) ValueCell!9503)) (size!27333 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55853)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31591)

(declare-fun minValue!1173 () V!31591)

(declare-fun getCurrentListMap!3129 (array!55851 array!55853 (_ BitVec 32) (_ BitVec 32) V!31591 V!31591 (_ BitVec 32) Int) ListLongMap!11873)

(assert (=> b!930361 (= lt!419027 (getCurrentListMap!3129 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930362 () Bool)

(declare-fun res!626610 () Bool)

(assert (=> b!930362 (=> (not res!626610) (not e!522425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55851 (_ BitVec 32)) Bool)

(assert (=> b!930362 (= res!626610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930363 () Bool)

(declare-fun e!522428 () Bool)

(declare-fun e!522426 () Bool)

(declare-fun mapRes!31710 () Bool)

(assert (=> b!930363 (= e!522428 (and e!522426 mapRes!31710))))

(declare-fun condMapEmpty!31710 () Bool)

(declare-fun mapDefault!31710 () ValueCell!9503)

(assert (=> b!930363 (= condMapEmpty!31710 (= (arr!26872 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9503)) mapDefault!31710)))))

(declare-fun mapNonEmpty!31710 () Bool)

(declare-fun tp!60824 () Bool)

(declare-fun e!522424 () Bool)

(assert (=> mapNonEmpty!31710 (= mapRes!31710 (and tp!60824 e!522424))))

(declare-fun mapValue!31710 () ValueCell!9503)

(declare-fun mapKey!31710 () (_ BitVec 32))

(declare-fun mapRest!31710 () (Array (_ BitVec 32) ValueCell!9503))

(assert (=> mapNonEmpty!31710 (= (arr!26872 _values!1231) (store mapRest!31710 mapKey!31710 mapValue!31710))))

(declare-fun b!930364 () Bool)

(declare-fun tp_is_empty!19969 () Bool)

(assert (=> b!930364 (= e!522426 tp_is_empty!19969)))

(declare-fun b!930365 () Bool)

(declare-fun res!626613 () Bool)

(assert (=> b!930365 (=> (not res!626613) (not e!522425))))

(assert (=> b!930365 (= res!626613 (and (= (size!27333 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27332 _keys!1487) (size!27333 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930367 () Bool)

(declare-fun res!626612 () Bool)

(assert (=> b!930367 (=> (not res!626612) (not e!522425))))

(declare-datatypes ((List!18942 0))(
  ( (Nil!18939) (Cons!18938 (h!20084 (_ BitVec 64)) (t!26990 List!18942)) )
))
(declare-fun arrayNoDuplicates!0 (array!55851 (_ BitVec 32) List!18942) Bool)

(assert (=> b!930367 (= res!626612 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18939))))

(declare-fun b!930368 () Bool)

(assert (=> b!930368 (= e!522424 tp_is_empty!19969)))

(declare-fun b!930369 () Bool)

(declare-fun res!626615 () Bool)

(assert (=> b!930369 (=> (not res!626615) (not e!522425))))

(assert (=> b!930369 (= res!626615 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27332 _keys!1487))))))

(declare-fun mapIsEmpty!31710 () Bool)

(assert (=> mapIsEmpty!31710 mapRes!31710))

(declare-fun res!626611 () Bool)

(assert (=> start!79230 (=> (not res!626611) (not e!522425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79230 (= res!626611 (validMask!0 mask!1881))))

(assert (=> start!79230 e!522425))

(assert (=> start!79230 true))

(declare-fun array_inv!20990 (array!55853) Bool)

(assert (=> start!79230 (and (array_inv!20990 _values!1231) e!522428)))

(assert (=> start!79230 tp!60825))

(declare-fun array_inv!20991 (array!55851) Bool)

(assert (=> start!79230 (array_inv!20991 _keys!1487)))

(assert (=> start!79230 tp_is_empty!19969))

(declare-fun b!930366 () Bool)

(assert (=> b!930366 (= e!522429 false)))

(declare-fun lt!419026 () V!31591)

(declare-fun apply!749 (ListLongMap!11873 (_ BitVec 64)) V!31591)

(assert (=> b!930366 (= lt!419026 (apply!749 lt!419027 k0!1099))))

(assert (= (and start!79230 res!626611) b!930365))

(assert (= (and b!930365 res!626613) b!930362))

(assert (= (and b!930362 res!626610) b!930367))

(assert (= (and b!930367 res!626612) b!930369))

(assert (= (and b!930369 res!626615) b!930361))

(assert (= (and b!930361 res!626614) b!930366))

(assert (= (and b!930363 condMapEmpty!31710) mapIsEmpty!31710))

(assert (= (and b!930363 (not condMapEmpty!31710)) mapNonEmpty!31710))

(get-info :version)

(assert (= (and mapNonEmpty!31710 ((_ is ValueCellFull!9503) mapValue!31710)) b!930368))

(assert (= (and b!930363 ((_ is ValueCellFull!9503) mapDefault!31710)) b!930364))

(assert (= start!79230 b!930363))

(declare-fun m!864001 () Bool)

(assert (=> b!930367 m!864001))

(declare-fun m!864003 () Bool)

(assert (=> start!79230 m!864003))

(declare-fun m!864005 () Bool)

(assert (=> start!79230 m!864005))

(declare-fun m!864007 () Bool)

(assert (=> start!79230 m!864007))

(declare-fun m!864009 () Bool)

(assert (=> mapNonEmpty!31710 m!864009))

(declare-fun m!864011 () Bool)

(assert (=> b!930362 m!864011))

(declare-fun m!864013 () Bool)

(assert (=> b!930361 m!864013))

(declare-fun m!864015 () Bool)

(assert (=> b!930361 m!864015))

(declare-fun m!864017 () Bool)

(assert (=> b!930366 m!864017))

(check-sat (not start!79230) (not b!930366) (not b_next!17461) b_and!28501 (not b!930367) (not b!930362) (not b!930361) (not mapNonEmpty!31710) tp_is_empty!19969)
(check-sat b_and!28501 (not b_next!17461))
