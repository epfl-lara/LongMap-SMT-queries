; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111136 () Bool)

(assert start!111136)

(declare-fun b_free!29971 () Bool)

(declare-fun b_next!29971 () Bool)

(assert (=> start!111136 (= b_free!29971 (not b_next!29971))))

(declare-fun tp!105234 () Bool)

(declare-fun b_and!48179 () Bool)

(assert (=> start!111136 (= tp!105234 b_and!48179)))

(declare-fun b!1315863 () Bool)

(declare-fun res!873540 () Bool)

(declare-fun e!750647 () Bool)

(assert (=> b!1315863 (=> (not res!873540) (not e!750647))))

(declare-datatypes ((array!88362 0))(
  ( (array!88363 (arr!42661 (Array (_ BitVec 32) (_ BitVec 64))) (size!43211 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88362)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88362 (_ BitVec 32)) Bool)

(assert (=> b!1315863 (= res!873540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315864 () Bool)

(declare-fun res!873536 () Bool)

(assert (=> b!1315864 (=> (not res!873536) (not e!750647))))

(declare-datatypes ((List!30265 0))(
  ( (Nil!30262) (Cons!30261 (h!31470 (_ BitVec 64)) (t!43871 List!30265)) )
))
(declare-fun arrayNoDuplicates!0 (array!88362 (_ BitVec 32) List!30265) Bool)

(assert (=> b!1315864 (= res!873536 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30262))))

(declare-fun mapNonEmpty!55180 () Bool)

(declare-fun mapRes!55180 () Bool)

(declare-fun tp!105235 () Bool)

(declare-fun e!750643 () Bool)

(assert (=> mapNonEmpty!55180 (= mapRes!55180 (and tp!105235 e!750643))))

(declare-datatypes ((V!52705 0))(
  ( (V!52706 (val!17925 Int)) )
))
(declare-datatypes ((ValueCell!16952 0))(
  ( (ValueCellFull!16952 (v!20552 V!52705)) (EmptyCell!16952) )
))
(declare-fun mapRest!55180 () (Array (_ BitVec 32) ValueCell!16952))

(declare-fun mapValue!55180 () ValueCell!16952)

(declare-datatypes ((array!88364 0))(
  ( (array!88365 (arr!42662 (Array (_ BitVec 32) ValueCell!16952)) (size!43212 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88364)

(declare-fun mapKey!55180 () (_ BitVec 32))

(assert (=> mapNonEmpty!55180 (= (arr!42662 _values!1354) (store mapRest!55180 mapKey!55180 mapValue!55180))))

(declare-fun b!1315865 () Bool)

(declare-fun res!873538 () Bool)

(assert (=> b!1315865 (=> (not res!873538) (not e!750647))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315865 (= res!873538 (and (= (size!43212 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43211 _keys!1628) (size!43212 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315866 () Bool)

(declare-fun res!873539 () Bool)

(assert (=> b!1315866 (=> (not res!873539) (not e!750647))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315866 (= res!873539 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43211 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315867 () Bool)

(declare-fun tp_is_empty!35701 () Bool)

(assert (=> b!1315867 (= e!750643 tp_is_empty!35701)))

(declare-fun b!1315868 () Bool)

(declare-fun e!750644 () Bool)

(declare-fun e!750646 () Bool)

(assert (=> b!1315868 (= e!750644 (and e!750646 mapRes!55180))))

(declare-fun condMapEmpty!55180 () Bool)

(declare-fun mapDefault!55180 () ValueCell!16952)

