; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79416 () Bool)

(assert start!79416)

(declare-fun b_free!17461 () Bool)

(declare-fun b_next!17461 () Bool)

(assert (=> start!79416 (= b_free!17461 (not b_next!17461))))

(declare-fun tp!60825 () Bool)

(declare-fun b_and!28537 () Bool)

(assert (=> start!79416 (= tp!60825 b_and!28537)))

(declare-fun b!931503 () Bool)

(declare-fun res!627069 () Bool)

(declare-fun e!523155 () Bool)

(assert (=> b!931503 (=> (not res!627069) (not e!523155))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55943 0))(
  ( (array!55944 (arr!26912 (Array (_ BitVec 32) (_ BitVec 64))) (size!27372 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55943)

(assert (=> b!931503 (= res!627069 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27372 _keys!1487))))))

(declare-fun b!931504 () Bool)

(declare-fun e!523157 () Bool)

(assert (=> b!931504 (= e!523155 e!523157)))

(declare-fun res!627065 () Bool)

(assert (=> b!931504 (=> (not res!627065) (not e!523157))))

(declare-datatypes ((V!31591 0))(
  ( (V!31592 (val!10035 Int)) )
))
(declare-datatypes ((tuple2!13128 0))(
  ( (tuple2!13129 (_1!6575 (_ BitVec 64)) (_2!6575 V!31591)) )
))
(declare-datatypes ((List!18916 0))(
  ( (Nil!18913) (Cons!18912 (h!20064 tuple2!13128) (t!26965 List!18916)) )
))
(declare-datatypes ((ListLongMap!11827 0))(
  ( (ListLongMap!11828 (toList!5929 List!18916)) )
))
(declare-fun lt!419624 () ListLongMap!11827)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4995 (ListLongMap!11827 (_ BitVec 64)) Bool)

(assert (=> b!931504 (= res!627065 (contains!4995 lt!419624 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9503 0))(
  ( (ValueCellFull!9503 (v!12550 V!31591)) (EmptyCell!9503) )
))
(declare-datatypes ((array!55945 0))(
  ( (array!55946 (arr!26913 (Array (_ BitVec 32) ValueCell!9503)) (size!27373 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55945)

(declare-fun zeroValue!1173 () V!31591)

(declare-fun minValue!1173 () V!31591)

(declare-fun getCurrentListMap!3173 (array!55943 array!55945 (_ BitVec 32) (_ BitVec 32) V!31591 V!31591 (_ BitVec 32) Int) ListLongMap!11827)

(assert (=> b!931504 (= lt!419624 (getCurrentListMap!3173 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31710 () Bool)

(declare-fun mapRes!31710 () Bool)

(declare-fun tp!60824 () Bool)

(declare-fun e!523156 () Bool)

(assert (=> mapNonEmpty!31710 (= mapRes!31710 (and tp!60824 e!523156))))

(declare-fun mapRest!31710 () (Array (_ BitVec 32) ValueCell!9503))

(declare-fun mapValue!31710 () ValueCell!9503)

(declare-fun mapKey!31710 () (_ BitVec 32))

(assert (=> mapNonEmpty!31710 (= (arr!26913 _values!1231) (store mapRest!31710 mapKey!31710 mapValue!31710))))

(declare-fun mapIsEmpty!31710 () Bool)

(assert (=> mapIsEmpty!31710 mapRes!31710))

(declare-fun b!931505 () Bool)

(assert (=> b!931505 (= e!523157 false)))

(declare-fun lt!419623 () V!31591)

(declare-fun apply!765 (ListLongMap!11827 (_ BitVec 64)) V!31591)

(assert (=> b!931505 (= lt!419623 (apply!765 lt!419624 k0!1099))))

(declare-fun b!931506 () Bool)

(declare-fun e!523158 () Bool)

(declare-fun e!523159 () Bool)

(assert (=> b!931506 (= e!523158 (and e!523159 mapRes!31710))))

(declare-fun condMapEmpty!31710 () Bool)

(declare-fun mapDefault!31710 () ValueCell!9503)

(assert (=> b!931506 (= condMapEmpty!31710 (= (arr!26913 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9503)) mapDefault!31710)))))

(declare-fun b!931507 () Bool)

(declare-fun res!627066 () Bool)

(assert (=> b!931507 (=> (not res!627066) (not e!523155))))

(declare-datatypes ((List!18917 0))(
  ( (Nil!18914) (Cons!18913 (h!20065 (_ BitVec 64)) (t!26966 List!18917)) )
))
(declare-fun arrayNoDuplicates!0 (array!55943 (_ BitVec 32) List!18917) Bool)

(assert (=> b!931507 (= res!627066 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18914))))

(declare-fun b!931508 () Bool)

(declare-fun tp_is_empty!19969 () Bool)

(assert (=> b!931508 (= e!523156 tp_is_empty!19969)))

(declare-fun b!931509 () Bool)

(assert (=> b!931509 (= e!523159 tp_is_empty!19969)))

(declare-fun res!627067 () Bool)

(assert (=> start!79416 (=> (not res!627067) (not e!523155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79416 (= res!627067 (validMask!0 mask!1881))))

(assert (=> start!79416 e!523155))

(assert (=> start!79416 true))

(declare-fun array_inv!21044 (array!55945) Bool)

(assert (=> start!79416 (and (array_inv!21044 _values!1231) e!523158)))

(assert (=> start!79416 tp!60825))

(declare-fun array_inv!21045 (array!55943) Bool)

(assert (=> start!79416 (array_inv!21045 _keys!1487)))

(assert (=> start!79416 tp_is_empty!19969))

(declare-fun b!931510 () Bool)

(declare-fun res!627064 () Bool)

(assert (=> b!931510 (=> (not res!627064) (not e!523155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55943 (_ BitVec 32)) Bool)

(assert (=> b!931510 (= res!627064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931511 () Bool)

(declare-fun res!627068 () Bool)

(assert (=> b!931511 (=> (not res!627068) (not e!523155))))

(assert (=> b!931511 (= res!627068 (and (= (size!27373 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27372 _keys!1487) (size!27373 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79416 res!627067) b!931511))

(assert (= (and b!931511 res!627068) b!931510))

(assert (= (and b!931510 res!627064) b!931507))

(assert (= (and b!931507 res!627066) b!931503))

(assert (= (and b!931503 res!627069) b!931504))

(assert (= (and b!931504 res!627065) b!931505))

(assert (= (and b!931506 condMapEmpty!31710) mapIsEmpty!31710))

(assert (= (and b!931506 (not condMapEmpty!31710)) mapNonEmpty!31710))

(get-info :version)

(assert (= (and mapNonEmpty!31710 ((_ is ValueCellFull!9503) mapValue!31710)) b!931508))

(assert (= (and b!931506 ((_ is ValueCellFull!9503) mapDefault!31710)) b!931509))

(assert (= start!79416 b!931506))

(declare-fun m!866053 () Bool)

(assert (=> mapNonEmpty!31710 m!866053))

(declare-fun m!866055 () Bool)

(assert (=> b!931510 m!866055))

(declare-fun m!866057 () Bool)

(assert (=> b!931505 m!866057))

(declare-fun m!866059 () Bool)

(assert (=> b!931504 m!866059))

(declare-fun m!866061 () Bool)

(assert (=> b!931504 m!866061))

(declare-fun m!866063 () Bool)

(assert (=> b!931507 m!866063))

(declare-fun m!866065 () Bool)

(assert (=> start!79416 m!866065))

(declare-fun m!866067 () Bool)

(assert (=> start!79416 m!866067))

(declare-fun m!866069 () Bool)

(assert (=> start!79416 m!866069))

(check-sat (not mapNonEmpty!31710) b_and!28537 (not start!79416) tp_is_empty!19969 (not b!931505) (not b_next!17461) (not b!931510) (not b!931504) (not b!931507))
(check-sat b_and!28537 (not b_next!17461))
