; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111074 () Bool)

(assert start!111074)

(declare-fun b_free!29909 () Bool)

(declare-fun b_next!29909 () Bool)

(assert (=> start!111074 (= b_free!29909 (not b_next!29909))))

(declare-fun tp!105049 () Bool)

(declare-fun b_and!48117 () Bool)

(assert (=> start!111074 (= tp!105049 b_and!48117)))

(declare-fun b!1315082 () Bool)

(declare-fun res!873035 () Bool)

(declare-fun e!750178 () Bool)

(assert (=> b!1315082 (=> (not res!873035) (not e!750178))))

(declare-datatypes ((array!88242 0))(
  ( (array!88243 (arr!42601 (Array (_ BitVec 32) (_ BitVec 64))) (size!43151 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88242)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52621 0))(
  ( (V!52622 (val!17894 Int)) )
))
(declare-datatypes ((ValueCell!16921 0))(
  ( (ValueCellFull!16921 (v!20521 V!52621)) (EmptyCell!16921) )
))
(declare-datatypes ((array!88244 0))(
  ( (array!88245 (arr!42602 (Array (_ BitVec 32) ValueCell!16921)) (size!43152 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88244)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315082 (= res!873035 (and (= (size!43152 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43151 _keys!1628) (size!43152 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315083 () Bool)

(declare-fun res!873037 () Bool)

(assert (=> b!1315083 (=> (not res!873037) (not e!750178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88242 (_ BitVec 32)) Bool)

(assert (=> b!1315083 (= res!873037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315084 () Bool)

(declare-fun e!750180 () Bool)

(declare-fun e!750181 () Bool)

(declare-fun mapRes!55087 () Bool)

(assert (=> b!1315084 (= e!750180 (and e!750181 mapRes!55087))))

(declare-fun condMapEmpty!55087 () Bool)

(declare-fun mapDefault!55087 () ValueCell!16921)

