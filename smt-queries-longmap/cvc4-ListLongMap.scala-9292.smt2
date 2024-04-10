; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111104 () Bool)

(assert start!111104)

(declare-fun b_free!29939 () Bool)

(declare-fun b_next!29939 () Bool)

(assert (=> start!111104 (= b_free!29939 (not b_next!29939))))

(declare-fun tp!105139 () Bool)

(declare-fun b_and!48147 () Bool)

(assert (=> start!111104 (= tp!105139 b_and!48147)))

(declare-fun b!1315478 () Bool)

(declare-fun res!873298 () Bool)

(declare-fun e!750404 () Bool)

(assert (=> b!1315478 (=> (not res!873298) (not e!750404))))

(declare-datatypes ((array!88300 0))(
  ( (array!88301 (arr!42630 (Array (_ BitVec 32) (_ BitVec 64))) (size!43180 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88300)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88300 (_ BitVec 32)) Bool)

(assert (=> b!1315478 (= res!873298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315479 () Bool)

(declare-fun res!873296 () Bool)

(assert (=> b!1315479 (=> (not res!873296) (not e!750404))))

(declare-datatypes ((V!52661 0))(
  ( (V!52662 (val!17909 Int)) )
))
(declare-datatypes ((ValueCell!16936 0))(
  ( (ValueCellFull!16936 (v!20536 V!52661)) (EmptyCell!16936) )
))
(declare-datatypes ((array!88302 0))(
  ( (array!88303 (arr!42631 (Array (_ BitVec 32) ValueCell!16936)) (size!43181 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88302)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315479 (= res!873296 (and (= (size!43181 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43180 _keys!1628) (size!43181 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315480 () Bool)

(declare-fun res!873297 () Bool)

(assert (=> b!1315480 (=> (not res!873297) (not e!750404))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315480 (= res!873297 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43180 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315481 () Bool)

(declare-fun e!750403 () Bool)

(declare-fun e!750405 () Bool)

(declare-fun mapRes!55132 () Bool)

(assert (=> b!1315481 (= e!750403 (and e!750405 mapRes!55132))))

(declare-fun condMapEmpty!55132 () Bool)

(declare-fun mapDefault!55132 () ValueCell!16936)

