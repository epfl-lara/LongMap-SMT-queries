; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79122 () Bool)

(assert start!79122)

(declare-fun b_free!17335 () Bool)

(declare-fun b_next!17335 () Bool)

(assert (=> start!79122 (= b_free!17335 (not b_next!17335))))

(declare-fun tp!60445 () Bool)

(declare-fun b_and!28401 () Bool)

(assert (=> start!79122 (= tp!60445 b_and!28401)))

(declare-fun res!625362 () Bool)

(declare-fun e!521443 () Bool)

(assert (=> start!79122 (=> (not res!625362) (not e!521443))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79122 (= res!625362 (validMask!0 mask!1881))))

(assert (=> start!79122 e!521443))

(assert (=> start!79122 true))

(declare-datatypes ((V!31423 0))(
  ( (V!31424 (val!9972 Int)) )
))
(declare-datatypes ((ValueCell!9440 0))(
  ( (ValueCellFull!9440 (v!12490 V!31423)) (EmptyCell!9440) )
))
(declare-datatypes ((array!55644 0))(
  ( (array!55645 (arr!26767 (Array (_ BitVec 32) ValueCell!9440)) (size!27226 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55644)

(declare-fun e!521438 () Bool)

(declare-fun array_inv!20838 (array!55644) Bool)

(assert (=> start!79122 (and (array_inv!20838 _values!1231) e!521438)))

(assert (=> start!79122 tp!60445))

(declare-datatypes ((array!55646 0))(
  ( (array!55647 (arr!26768 (Array (_ BitVec 32) (_ BitVec 64))) (size!27227 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55646)

(declare-fun array_inv!20839 (array!55646) Bool)

(assert (=> start!79122 (array_inv!20839 _keys!1487)))

(declare-fun tp_is_empty!19843 () Bool)

(assert (=> start!79122 tp_is_empty!19843))

(declare-fun b!928674 () Bool)

(declare-fun e!521442 () Bool)

(assert (=> b!928674 (= e!521442 tp_is_empty!19843)))

(declare-fun b!928675 () Bool)

(declare-fun res!625365 () Bool)

(assert (=> b!928675 (=> (not res!625365) (not e!521443))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!928675 (= res!625365 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27227 _keys!1487))))))

(declare-fun b!928676 () Bool)

(declare-fun e!521440 () Bool)

(assert (=> b!928676 (= e!521440 false)))

(declare-fun lt!418911 () V!31423)

(declare-datatypes ((tuple2!13030 0))(
  ( (tuple2!13031 (_1!6526 (_ BitVec 64)) (_2!6526 V!31423)) )
))
(declare-datatypes ((List!18828 0))(
  ( (Nil!18825) (Cons!18824 (h!19970 tuple2!13030) (t!26885 List!18828)) )
))
(declare-datatypes ((ListLongMap!11727 0))(
  ( (ListLongMap!11728 (toList!5879 List!18828)) )
))
(declare-fun lt!418912 () ListLongMap!11727)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!708 (ListLongMap!11727 (_ BitVec 64)) V!31423)

(assert (=> b!928676 (= lt!418911 (apply!708 lt!418912 k!1099))))

(declare-fun b!928677 () Bool)

(assert (=> b!928677 (= e!521443 e!521440)))

(declare-fun res!625363 () Bool)

(assert (=> b!928677 (=> (not res!625363) (not e!521440))))

(declare-fun contains!4936 (ListLongMap!11727 (_ BitVec 64)) Bool)

(assert (=> b!928677 (= res!625363 (contains!4936 lt!418912 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31423)

(declare-fun minValue!1173 () V!31423)

(declare-fun getCurrentListMap!3127 (array!55646 array!55644 (_ BitVec 32) (_ BitVec 32) V!31423 V!31423 (_ BitVec 32) Int) ListLongMap!11727)

(assert (=> b!928677 (= lt!418912 (getCurrentListMap!3127 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928678 () Bool)

(declare-fun res!625366 () Bool)

(assert (=> b!928678 (=> (not res!625366) (not e!521443))))

(declare-datatypes ((List!18829 0))(
  ( (Nil!18826) (Cons!18825 (h!19971 (_ BitVec 64)) (t!26886 List!18829)) )
))
(declare-fun arrayNoDuplicates!0 (array!55646 (_ BitVec 32) List!18829) Bool)

(assert (=> b!928678 (= res!625366 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18826))))

(declare-fun b!928679 () Bool)

(declare-fun res!625361 () Bool)

(assert (=> b!928679 (=> (not res!625361) (not e!521443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55646 (_ BitVec 32)) Bool)

(assert (=> b!928679 (= res!625361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31521 () Bool)

(declare-fun mapRes!31521 () Bool)

(assert (=> mapIsEmpty!31521 mapRes!31521))

(declare-fun b!928680 () Bool)

(declare-fun res!625364 () Bool)

(assert (=> b!928680 (=> (not res!625364) (not e!521443))))

(assert (=> b!928680 (= res!625364 (and (= (size!27226 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27227 _keys!1487) (size!27226 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928681 () Bool)

(declare-fun e!521441 () Bool)

(assert (=> b!928681 (= e!521438 (and e!521441 mapRes!31521))))

(declare-fun condMapEmpty!31521 () Bool)

(declare-fun mapDefault!31521 () ValueCell!9440)

