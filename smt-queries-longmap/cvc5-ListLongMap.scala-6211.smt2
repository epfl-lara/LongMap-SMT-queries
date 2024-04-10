; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79400 () Bool)

(assert start!79400)

(declare-fun b_free!17587 () Bool)

(declare-fun b_next!17587 () Bool)

(assert (=> start!79400 (= b_free!17587 (not b_next!17587))))

(declare-fun tp!61205 () Bool)

(declare-fun b_and!28733 () Bool)

(assert (=> start!79400 (= tp!61205 b_and!28733)))

(declare-fun b!933019 () Bool)

(declare-fun e!523926 () Bool)

(declare-fun e!523931 () Bool)

(assert (=> b!933019 (= e!523926 e!523931)))

(declare-fun res!628408 () Bool)

(assert (=> b!933019 (=> (not res!628408) (not e!523931))))

(declare-datatypes ((V!31759 0))(
  ( (V!31760 (val!10098 Int)) )
))
(declare-datatypes ((tuple2!13234 0))(
  ( (tuple2!13235 (_1!6628 (_ BitVec 64)) (_2!6628 V!31759)) )
))
(declare-datatypes ((List!19016 0))(
  ( (Nil!19013) (Cons!19012 (h!20158 tuple2!13234) (t!27147 List!19016)) )
))
(declare-datatypes ((ListLongMap!11931 0))(
  ( (ListLongMap!11932 (toList!5981 List!19016)) )
))
(declare-fun lt!420190 () ListLongMap!11931)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5030 (ListLongMap!11931 (_ BitVec 64)) Bool)

(assert (=> b!933019 (= res!628408 (contains!5030 lt!420190 k!1099))))

(declare-datatypes ((array!56126 0))(
  ( (array!56127 (arr!27007 (Array (_ BitVec 32) (_ BitVec 64))) (size!27466 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56126)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9566 0))(
  ( (ValueCellFull!9566 (v!12617 V!31759)) (EmptyCell!9566) )
))
(declare-datatypes ((array!56128 0))(
  ( (array!56129 (arr!27008 (Array (_ BitVec 32) ValueCell!9566)) (size!27467 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56128)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31759)

(declare-fun minValue!1173 () V!31759)

(declare-fun getCurrentListMap!3219 (array!56126 array!56128 (_ BitVec 32) (_ BitVec 32) V!31759 V!31759 (_ BitVec 32) Int) ListLongMap!11931)

(assert (=> b!933019 (= lt!420190 (getCurrentListMap!3219 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!628413 () Bool)

(assert (=> start!79400 (=> (not res!628413) (not e!523926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79400 (= res!628413 (validMask!0 mask!1881))))

(assert (=> start!79400 e!523926))

(assert (=> start!79400 true))

(declare-fun tp_is_empty!20095 () Bool)

(assert (=> start!79400 tp_is_empty!20095))

(declare-fun e!523932 () Bool)

(declare-fun array_inv!21020 (array!56128) Bool)

(assert (=> start!79400 (and (array_inv!21020 _values!1231) e!523932)))

(assert (=> start!79400 tp!61205))

(declare-fun array_inv!21021 (array!56126) Bool)

(assert (=> start!79400 (array_inv!21021 _keys!1487)))

(declare-fun b!933020 () Bool)

(declare-fun res!628410 () Bool)

(assert (=> b!933020 (=> (not res!628410) (not e!523931))))

(declare-fun v!791 () V!31759)

(declare-fun apply!794 (ListLongMap!11931 (_ BitVec 64)) V!31759)

(assert (=> b!933020 (= res!628410 (= (apply!794 lt!420190 k!1099) v!791))))

(declare-fun b!933021 () Bool)

(declare-fun e!523927 () Bool)

(declare-fun mapRes!31902 () Bool)

(assert (=> b!933021 (= e!523932 (and e!523927 mapRes!31902))))

(declare-fun condMapEmpty!31902 () Bool)

(declare-fun mapDefault!31902 () ValueCell!9566)

