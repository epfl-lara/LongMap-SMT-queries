; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79294 () Bool)

(assert start!79294)

(declare-fun b_free!17507 () Bool)

(declare-fun b_next!17507 () Bool)

(assert (=> start!79294 (= b_free!17507 (not b_next!17507))))

(declare-fun tp!60961 () Bool)

(declare-fun b_and!28573 () Bool)

(assert (=> start!79294 (= tp!60961 b_and!28573)))

(declare-fun b!931253 () Bool)

(declare-fun e!522986 () Bool)

(declare-fun tp_is_empty!20015 () Bool)

(assert (=> b!931253 (= e!522986 tp_is_empty!20015)))

(declare-fun b!931254 () Bool)

(declare-fun res!627174 () Bool)

(declare-fun e!522990 () Bool)

(assert (=> b!931254 (=> (not res!627174) (not e!522990))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931254 (= res!627174 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931255 () Bool)

(declare-datatypes ((array!55970 0))(
  ( (array!55971 (arr!26930 (Array (_ BitVec 32) (_ BitVec 64))) (size!27389 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55970)

(assert (=> b!931255 (= e!522990 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27389 _keys!1487)))))

(declare-fun b!931256 () Bool)

(declare-fun res!627166 () Bool)

(declare-fun e!522988 () Bool)

(assert (=> b!931256 (=> (not res!627166) (not e!522988))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31651 0))(
  ( (V!31652 (val!10058 Int)) )
))
(declare-datatypes ((ValueCell!9526 0))(
  ( (ValueCellFull!9526 (v!12576 V!31651)) (EmptyCell!9526) )
))
(declare-datatypes ((array!55972 0))(
  ( (array!55973 (arr!26931 (Array (_ BitVec 32) ValueCell!9526)) (size!27390 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55972)

(assert (=> b!931256 (= res!627166 (and (= (size!27390 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27389 _keys!1487) (size!27390 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!627170 () Bool)

(assert (=> start!79294 (=> (not res!627170) (not e!522988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79294 (= res!627170 (validMask!0 mask!1881))))

(assert (=> start!79294 e!522988))

(assert (=> start!79294 true))

(assert (=> start!79294 tp_is_empty!20015))

(declare-fun e!522989 () Bool)

(declare-fun array_inv!20962 (array!55972) Bool)

(assert (=> start!79294 (and (array_inv!20962 _values!1231) e!522989)))

(assert (=> start!79294 tp!60961))

(declare-fun array_inv!20963 (array!55970) Bool)

(assert (=> start!79294 (array_inv!20963 _keys!1487)))

(declare-fun b!931257 () Bool)

(declare-fun res!627168 () Bool)

(assert (=> b!931257 (=> (not res!627168) (not e!522990))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931257 (= res!627168 (validKeyInArray!0 k!1099))))

(declare-fun b!931258 () Bool)

(declare-fun res!627172 () Bool)

(assert (=> b!931258 (=> (not res!627172) (not e!522988))))

(declare-datatypes ((List!18959 0))(
  ( (Nil!18956) (Cons!18955 (h!20101 (_ BitVec 64)) (t!27016 List!18959)) )
))
(declare-fun arrayNoDuplicates!0 (array!55970 (_ BitVec 32) List!18959) Bool)

(assert (=> b!931258 (= res!627172 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18956))))

(declare-fun b!931259 () Bool)

(assert (=> b!931259 (= e!522988 e!522990)))

(declare-fun res!627169 () Bool)

(assert (=> b!931259 (=> (not res!627169) (not e!522990))))

(declare-datatypes ((tuple2!13174 0))(
  ( (tuple2!13175 (_1!6598 (_ BitVec 64)) (_2!6598 V!31651)) )
))
(declare-datatypes ((List!18960 0))(
  ( (Nil!18957) (Cons!18956 (h!20102 tuple2!13174) (t!27017 List!18960)) )
))
(declare-datatypes ((ListLongMap!11871 0))(
  ( (ListLongMap!11872 (toList!5951 List!18960)) )
))
(declare-fun lt!419392 () ListLongMap!11871)

(declare-fun contains!4998 (ListLongMap!11871 (_ BitVec 64)) Bool)

(assert (=> b!931259 (= res!627169 (contains!4998 lt!419392 k!1099))))

(declare-fun zeroValue!1173 () V!31651)

(declare-fun minValue!1173 () V!31651)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3189 (array!55970 array!55972 (_ BitVec 32) (_ BitVec 32) V!31651 V!31651 (_ BitVec 32) Int) ListLongMap!11871)

(assert (=> b!931259 (= lt!419392 (getCurrentListMap!3189 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31779 () Bool)

(declare-fun mapRes!31779 () Bool)

(assert (=> mapIsEmpty!31779 mapRes!31779))

(declare-fun b!931260 () Bool)

(assert (=> b!931260 (= e!522989 (and e!522986 mapRes!31779))))

(declare-fun condMapEmpty!31779 () Bool)

(declare-fun mapDefault!31779 () ValueCell!9526)

