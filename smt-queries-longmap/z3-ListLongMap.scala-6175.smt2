; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79140 () Bool)

(assert start!79140)

(declare-fun b_free!17371 () Bool)

(declare-fun b_next!17371 () Bool)

(assert (=> start!79140 (= b_free!17371 (not b_next!17371))))

(declare-fun tp!60555 () Bool)

(declare-fun b_and!28411 () Bool)

(assert (=> start!79140 (= tp!60555 b_and!28411)))

(declare-fun b!928921 () Bool)

(declare-fun e!521615 () Bool)

(declare-fun e!521614 () Bool)

(declare-fun mapRes!31575 () Bool)

(assert (=> b!928921 (= e!521615 (and e!521614 mapRes!31575))))

(declare-fun condMapEmpty!31575 () Bool)

(declare-datatypes ((V!31471 0))(
  ( (V!31472 (val!9990 Int)) )
))
(declare-datatypes ((ValueCell!9458 0))(
  ( (ValueCellFull!9458 (v!12507 V!31471)) (EmptyCell!9458) )
))
(declare-datatypes ((array!55683 0))(
  ( (array!55684 (arr!26787 (Array (_ BitVec 32) ValueCell!9458)) (size!27248 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55683)

(declare-fun mapDefault!31575 () ValueCell!9458)

(assert (=> b!928921 (= condMapEmpty!31575 (= (arr!26787 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9458)) mapDefault!31575)))))

(declare-fun b!928922 () Bool)

(declare-fun e!521618 () Bool)

(declare-fun tp_is_empty!19879 () Bool)

(assert (=> b!928922 (= e!521618 tp_is_empty!19879)))

(declare-fun b!928923 () Bool)

(declare-fun res!625579 () Bool)

(declare-fun e!521617 () Bool)

(assert (=> b!928923 (=> (not res!625579) (not e!521617))))

(declare-datatypes ((array!55685 0))(
  ( (array!55686 (arr!26788 (Array (_ BitVec 32) (_ BitVec 64))) (size!27249 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55685)

(declare-datatypes ((List!18874 0))(
  ( (Nil!18871) (Cons!18870 (h!20016 (_ BitVec 64)) (t!26922 List!18874)) )
))
(declare-fun arrayNoDuplicates!0 (array!55685 (_ BitVec 32) List!18874) Bool)

(assert (=> b!928923 (= res!625579 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18871))))

(declare-fun b!928924 () Bool)

(declare-fun e!521619 () Bool)

(assert (=> b!928924 (= e!521619 false)))

(declare-fun lt!418783 () V!31471)

(declare-datatypes ((tuple2!13108 0))(
  ( (tuple2!13109 (_1!6565 (_ BitVec 64)) (_2!6565 V!31471)) )
))
(declare-datatypes ((List!18875 0))(
  ( (Nil!18872) (Cons!18871 (h!20017 tuple2!13108) (t!26923 List!18875)) )
))
(declare-datatypes ((ListLongMap!11795 0))(
  ( (ListLongMap!11796 (toList!5913 List!18875)) )
))
(declare-fun lt!418784 () ListLongMap!11795)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!721 (ListLongMap!11795 (_ BitVec 64)) V!31471)

(assert (=> b!928924 (= lt!418783 (apply!721 lt!418784 k0!1099))))

(declare-fun b!928925 () Bool)

(declare-fun res!625580 () Bool)

(assert (=> b!928925 (=> (not res!625580) (not e!521617))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!928925 (= res!625580 (and (= (size!27248 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27249 _keys!1487) (size!27248 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!625576 () Bool)

(assert (=> start!79140 (=> (not res!625576) (not e!521617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79140 (= res!625576 (validMask!0 mask!1881))))

(assert (=> start!79140 e!521617))

(assert (=> start!79140 true))

(declare-fun array_inv!20940 (array!55683) Bool)

(assert (=> start!79140 (and (array_inv!20940 _values!1231) e!521615)))

(assert (=> start!79140 tp!60555))

(declare-fun array_inv!20941 (array!55685) Bool)

(assert (=> start!79140 (array_inv!20941 _keys!1487)))

(assert (=> start!79140 tp_is_empty!19879))

(declare-fun b!928926 () Bool)

(assert (=> b!928926 (= e!521617 e!521619)))

(declare-fun res!625575 () Bool)

(assert (=> b!928926 (=> (not res!625575) (not e!521619))))

(declare-fun contains!4921 (ListLongMap!11795 (_ BitVec 64)) Bool)

(assert (=> b!928926 (= res!625575 (contains!4921 lt!418784 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31471)

(declare-fun minValue!1173 () V!31471)

(declare-fun getCurrentListMap!3095 (array!55685 array!55683 (_ BitVec 32) (_ BitVec 32) V!31471 V!31471 (_ BitVec 32) Int) ListLongMap!11795)

(assert (=> b!928926 (= lt!418784 (getCurrentListMap!3095 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31575 () Bool)

(declare-fun tp!60554 () Bool)

(assert (=> mapNonEmpty!31575 (= mapRes!31575 (and tp!60554 e!521618))))

(declare-fun mapKey!31575 () (_ BitVec 32))

(declare-fun mapRest!31575 () (Array (_ BitVec 32) ValueCell!9458))

(declare-fun mapValue!31575 () ValueCell!9458)

(assert (=> mapNonEmpty!31575 (= (arr!26787 _values!1231) (store mapRest!31575 mapKey!31575 mapValue!31575))))

(declare-fun b!928927 () Bool)

(declare-fun res!625577 () Bool)

(assert (=> b!928927 (=> (not res!625577) (not e!521617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55685 (_ BitVec 32)) Bool)

(assert (=> b!928927 (= res!625577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928928 () Bool)

(assert (=> b!928928 (= e!521614 tp_is_empty!19879)))

(declare-fun mapIsEmpty!31575 () Bool)

(assert (=> mapIsEmpty!31575 mapRes!31575))

(declare-fun b!928929 () Bool)

(declare-fun res!625578 () Bool)

(assert (=> b!928929 (=> (not res!625578) (not e!521617))))

(assert (=> b!928929 (= res!625578 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27249 _keys!1487))))))

(assert (= (and start!79140 res!625576) b!928925))

(assert (= (and b!928925 res!625580) b!928927))

(assert (= (and b!928927 res!625577) b!928923))

(assert (= (and b!928923 res!625579) b!928929))

(assert (= (and b!928929 res!625578) b!928926))

(assert (= (and b!928926 res!625575) b!928924))

(assert (= (and b!928921 condMapEmpty!31575) mapIsEmpty!31575))

(assert (= (and b!928921 (not condMapEmpty!31575)) mapNonEmpty!31575))

(get-info :version)

(assert (= (and mapNonEmpty!31575 ((_ is ValueCellFull!9458) mapValue!31575)) b!928922))

(assert (= (and b!928921 ((_ is ValueCellFull!9458) mapDefault!31575)) b!928928))

(assert (= start!79140 b!928921))

(declare-fun m!863065 () Bool)

(assert (=> start!79140 m!863065))

(declare-fun m!863067 () Bool)

(assert (=> start!79140 m!863067))

(declare-fun m!863069 () Bool)

(assert (=> start!79140 m!863069))

(declare-fun m!863071 () Bool)

(assert (=> b!928926 m!863071))

(declare-fun m!863073 () Bool)

(assert (=> b!928926 m!863073))

(declare-fun m!863075 () Bool)

(assert (=> b!928923 m!863075))

(declare-fun m!863077 () Bool)

(assert (=> b!928927 m!863077))

(declare-fun m!863079 () Bool)

(assert (=> b!928924 m!863079))

(declare-fun m!863081 () Bool)

(assert (=> mapNonEmpty!31575 m!863081))

(check-sat (not b!928923) tp_is_empty!19879 (not b_next!17371) (not mapNonEmpty!31575) (not b!928924) (not b!928926) b_and!28411 (not start!79140) (not b!928927))
(check-sat b_and!28411 (not b_next!17371))
