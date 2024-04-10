; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79370 () Bool)

(assert start!79370)

(declare-fun b_free!17557 () Bool)

(declare-fun b_next!17557 () Bool)

(assert (=> start!79370 (= b_free!17557 (not b_next!17557))))

(declare-fun tp!61114 () Bool)

(declare-fun b_and!28673 () Bool)

(assert (=> start!79370 (= tp!61114 b_and!28673)))

(declare-fun b!932404 () Bool)

(declare-fun res!627958 () Bool)

(declare-fun e!523615 () Bool)

(assert (=> b!932404 (=> (not res!627958) (not e!523615))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56070 0))(
  ( (array!56071 (arr!26979 (Array (_ BitVec 32) (_ BitVec 64))) (size!27438 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56070)

(assert (=> b!932404 (= res!627958 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27438 _keys!1487))))))

(declare-fun b!932405 () Bool)

(declare-fun e!523612 () Bool)

(assert (=> b!932405 (= e!523615 e!523612)))

(declare-fun res!627961 () Bool)

(assert (=> b!932405 (=> (not res!627961) (not e!523612))))

(declare-datatypes ((V!31719 0))(
  ( (V!31720 (val!10083 Int)) )
))
(declare-datatypes ((tuple2!13210 0))(
  ( (tuple2!13211 (_1!6616 (_ BitVec 64)) (_2!6616 V!31719)) )
))
(declare-datatypes ((List!18994 0))(
  ( (Nil!18991) (Cons!18990 (h!20136 tuple2!13210) (t!27095 List!18994)) )
))
(declare-datatypes ((ListLongMap!11907 0))(
  ( (ListLongMap!11908 (toList!5969 List!18994)) )
))
(declare-fun lt!419880 () ListLongMap!11907)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5018 (ListLongMap!11907 (_ BitVec 64)) Bool)

(assert (=> b!932405 (= res!627961 (contains!5018 lt!419880 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9551 0))(
  ( (ValueCellFull!9551 (v!12602 V!31719)) (EmptyCell!9551) )
))
(declare-datatypes ((array!56072 0))(
  ( (array!56073 (arr!26980 (Array (_ BitVec 32) ValueCell!9551)) (size!27439 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56072)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31719)

(declare-fun minValue!1173 () V!31719)

(declare-fun getCurrentListMap!3207 (array!56070 array!56072 (_ BitVec 32) (_ BitVec 32) V!31719 V!31719 (_ BitVec 32) Int) ListLongMap!11907)

(assert (=> b!932405 (= lt!419880 (getCurrentListMap!3207 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932406 () Bool)

(declare-fun res!627957 () Bool)

(assert (=> b!932406 (=> (not res!627957) (not e!523615))))

(declare-datatypes ((List!18995 0))(
  ( (Nil!18992) (Cons!18991 (h!20137 (_ BitVec 64)) (t!27096 List!18995)) )
))
(declare-fun arrayNoDuplicates!0 (array!56070 (_ BitVec 32) List!18995) Bool)

(assert (=> b!932406 (= res!627957 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18992))))

(declare-fun b!932407 () Bool)

(declare-fun res!627955 () Bool)

(assert (=> b!932407 (=> (not res!627955) (not e!523612))))

(assert (=> b!932407 (= res!627955 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932408 () Bool)

(declare-fun e!523614 () Bool)

(declare-fun e!523617 () Bool)

(declare-fun mapRes!31857 () Bool)

(assert (=> b!932408 (= e!523614 (and e!523617 mapRes!31857))))

(declare-fun condMapEmpty!31857 () Bool)

(declare-fun mapDefault!31857 () ValueCell!9551)

