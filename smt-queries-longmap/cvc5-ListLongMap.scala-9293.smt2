; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111106 () Bool)

(assert start!111106)

(declare-fun b_free!29941 () Bool)

(declare-fun b_next!29941 () Bool)

(assert (=> start!111106 (= b_free!29941 (not b_next!29941))))

(declare-fun tp!105145 () Bool)

(declare-fun b_and!48149 () Bool)

(assert (=> start!111106 (= tp!105145 b_and!48149)))

(declare-fun b!1315502 () Bool)

(declare-fun res!873311 () Bool)

(declare-fun e!750422 () Bool)

(assert (=> b!1315502 (=> (not res!873311) (not e!750422))))

(declare-datatypes ((array!88304 0))(
  ( (array!88305 (arr!42632 (Array (_ BitVec 32) (_ BitVec 64))) (size!43182 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88304)

(declare-datatypes ((List!30241 0))(
  ( (Nil!30238) (Cons!30237 (h!31446 (_ BitVec 64)) (t!43847 List!30241)) )
))
(declare-fun arrayNoDuplicates!0 (array!88304 (_ BitVec 32) List!30241) Bool)

(assert (=> b!1315502 (= res!873311 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30238))))

(declare-fun mapIsEmpty!55135 () Bool)

(declare-fun mapRes!55135 () Bool)

(assert (=> mapIsEmpty!55135 mapRes!55135))

(declare-fun b!1315503 () Bool)

(assert (=> b!1315503 (= e!750422 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52665 0))(
  ( (V!52666 (val!17910 Int)) )
))
(declare-fun minValue!1296 () V!52665)

(declare-datatypes ((ValueCell!16937 0))(
  ( (ValueCellFull!16937 (v!20537 V!52665)) (EmptyCell!16937) )
))
(declare-datatypes ((array!88306 0))(
  ( (array!88307 (arr!42633 (Array (_ BitVec 32) ValueCell!16937)) (size!43183 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88306)

(declare-fun zeroValue!1296 () V!52665)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585921 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23106 0))(
  ( (tuple2!23107 (_1!11564 (_ BitVec 64)) (_2!11564 V!52665)) )
))
(declare-datatypes ((List!30242 0))(
  ( (Nil!30239) (Cons!30238 (h!31447 tuple2!23106) (t!43848 List!30242)) )
))
(declare-datatypes ((ListLongMap!20763 0))(
  ( (ListLongMap!20764 (toList!10397 List!30242)) )
))
(declare-fun contains!8547 (ListLongMap!20763 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5410 (array!88304 array!88306 (_ BitVec 32) (_ BitVec 32) V!52665 V!52665 (_ BitVec 32) Int) ListLongMap!20763)

(assert (=> b!1315503 (= lt!585921 (contains!8547 (getCurrentListMap!5410 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1315504 () Bool)

(declare-fun e!750418 () Bool)

(declare-fun e!750421 () Bool)

(assert (=> b!1315504 (= e!750418 (and e!750421 mapRes!55135))))

(declare-fun condMapEmpty!55135 () Bool)

(declare-fun mapDefault!55135 () ValueCell!16937)

