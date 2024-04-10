; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79138 () Bool)

(assert start!79138)

(declare-fun b_free!17351 () Bool)

(declare-fun b_next!17351 () Bool)

(assert (=> start!79138 (= b_free!17351 (not b_next!17351))))

(declare-fun tp!60493 () Bool)

(declare-fun b_and!28417 () Bool)

(assert (=> start!79138 (= tp!60493 b_and!28417)))

(declare-fun mapNonEmpty!31545 () Bool)

(declare-fun mapRes!31545 () Bool)

(declare-fun tp!60494 () Bool)

(declare-fun e!521585 () Bool)

(assert (=> mapNonEmpty!31545 (= mapRes!31545 (and tp!60494 e!521585))))

(declare-datatypes ((V!31443 0))(
  ( (V!31444 (val!9980 Int)) )
))
(declare-datatypes ((ValueCell!9448 0))(
  ( (ValueCellFull!9448 (v!12498 V!31443)) (EmptyCell!9448) )
))
(declare-fun mapValue!31545 () ValueCell!9448)

(declare-datatypes ((array!55672 0))(
  ( (array!55673 (arr!26781 (Array (_ BitVec 32) ValueCell!9448)) (size!27240 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55672)

(declare-fun mapRest!31545 () (Array (_ BitVec 32) ValueCell!9448))

(declare-fun mapKey!31545 () (_ BitVec 32))

(assert (=> mapNonEmpty!31545 (= (arr!26781 _values!1231) (store mapRest!31545 mapKey!31545 mapValue!31545))))

(declare-fun b!928890 () Bool)

(declare-fun tp_is_empty!19859 () Bool)

(assert (=> b!928890 (= e!521585 tp_is_empty!19859)))

(declare-fun b!928891 () Bool)

(declare-fun res!625508 () Bool)

(declare-fun e!521587 () Bool)

(assert (=> b!928891 (=> (not res!625508) (not e!521587))))

(declare-datatypes ((array!55674 0))(
  ( (array!55675 (arr!26782 (Array (_ BitVec 32) (_ BitVec 64))) (size!27241 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55674)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!928891 (= res!625508 (and (= (size!27240 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27241 _keys!1487) (size!27240 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928892 () Bool)

(declare-fun res!625507 () Bool)

(assert (=> b!928892 (=> (not res!625507) (not e!521587))))

(declare-datatypes ((List!18839 0))(
  ( (Nil!18836) (Cons!18835 (h!19981 (_ BitVec 64)) (t!26896 List!18839)) )
))
(declare-fun arrayNoDuplicates!0 (array!55674 (_ BitVec 32) List!18839) Bool)

(assert (=> b!928892 (= res!625507 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18836))))

(declare-fun b!928893 () Bool)

(declare-fun res!625506 () Bool)

(assert (=> b!928893 (=> (not res!625506) (not e!521587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55674 (_ BitVec 32)) Bool)

(assert (=> b!928893 (= res!625506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928894 () Bool)

(declare-fun e!521583 () Bool)

(assert (=> b!928894 (= e!521587 e!521583)))

(declare-fun res!625505 () Bool)

(assert (=> b!928894 (=> (not res!625505) (not e!521583))))

(declare-datatypes ((tuple2!13042 0))(
  ( (tuple2!13043 (_1!6532 (_ BitVec 64)) (_2!6532 V!31443)) )
))
(declare-datatypes ((List!18840 0))(
  ( (Nil!18837) (Cons!18836 (h!19982 tuple2!13042) (t!26897 List!18840)) )
))
(declare-datatypes ((ListLongMap!11739 0))(
  ( (ListLongMap!11740 (toList!5885 List!18840)) )
))
(declare-fun lt!418959 () ListLongMap!11739)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4941 (ListLongMap!11739 (_ BitVec 64)) Bool)

(assert (=> b!928894 (= res!625505 (contains!4941 lt!418959 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31443)

(declare-fun minValue!1173 () V!31443)

(declare-fun getCurrentListMap!3132 (array!55674 array!55672 (_ BitVec 32) (_ BitVec 32) V!31443 V!31443 (_ BitVec 32) Int) ListLongMap!11739)

(assert (=> b!928894 (= lt!418959 (getCurrentListMap!3132 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31545 () Bool)

(assert (=> mapIsEmpty!31545 mapRes!31545))

(declare-fun b!928895 () Bool)

(declare-fun res!625510 () Bool)

(assert (=> b!928895 (=> (not res!625510) (not e!521587))))

(assert (=> b!928895 (= res!625510 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27241 _keys!1487))))))

(declare-fun res!625509 () Bool)

(assert (=> start!79138 (=> (not res!625509) (not e!521587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79138 (= res!625509 (validMask!0 mask!1881))))

(assert (=> start!79138 e!521587))

(assert (=> start!79138 true))

(declare-fun e!521582 () Bool)

(declare-fun array_inv!20846 (array!55672) Bool)

(assert (=> start!79138 (and (array_inv!20846 _values!1231) e!521582)))

(assert (=> start!79138 tp!60493))

(declare-fun array_inv!20847 (array!55674) Bool)

(assert (=> start!79138 (array_inv!20847 _keys!1487)))

(assert (=> start!79138 tp_is_empty!19859))

(declare-fun b!928896 () Bool)

(assert (=> b!928896 (= e!521583 false)))

(declare-fun lt!418960 () V!31443)

(declare-fun apply!714 (ListLongMap!11739 (_ BitVec 64)) V!31443)

(assert (=> b!928896 (= lt!418960 (apply!714 lt!418959 k!1099))))

(declare-fun b!928897 () Bool)

(declare-fun e!521584 () Bool)

(assert (=> b!928897 (= e!521582 (and e!521584 mapRes!31545))))

(declare-fun condMapEmpty!31545 () Bool)

(declare-fun mapDefault!31545 () ValueCell!9448)

