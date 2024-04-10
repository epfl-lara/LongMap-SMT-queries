; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111166 () Bool)

(assert start!111166)

(declare-fun b_free!30001 () Bool)

(declare-fun b_next!30001 () Bool)

(assert (=> start!111166 (= b_free!30001 (not b_next!30001))))

(declare-fun tp!105325 () Bool)

(declare-fun b_and!48209 () Bool)

(assert (=> start!111166 (= tp!105325 b_and!48209)))

(declare-fun b!1316264 () Bool)

(declare-fun e!750870 () Bool)

(declare-fun tp_is_empty!35731 () Bool)

(assert (=> b!1316264 (= e!750870 tp_is_empty!35731)))

(declare-fun b!1316265 () Bool)

(declare-fun res!873806 () Bool)

(declare-fun e!750872 () Bool)

(assert (=> b!1316265 (=> (not res!873806) (not e!750872))))

(declare-datatypes ((array!88420 0))(
  ( (array!88421 (arr!42690 (Array (_ BitVec 32) (_ BitVec 64))) (size!43240 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88420)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52745 0))(
  ( (V!52746 (val!17940 Int)) )
))
(declare-datatypes ((ValueCell!16967 0))(
  ( (ValueCellFull!16967 (v!20567 V!52745)) (EmptyCell!16967) )
))
(declare-datatypes ((array!88422 0))(
  ( (array!88423 (arr!42691 (Array (_ BitVec 32) ValueCell!16967)) (size!43241 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88422)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316265 (= res!873806 (and (= (size!43241 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43240 _keys!1628) (size!43241 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316266 () Bool)

(declare-fun e!750871 () Bool)

(assert (=> b!1316266 (= e!750871 tp_is_empty!35731)))

(declare-fun b!1316267 () Bool)

(declare-fun res!873805 () Bool)

(assert (=> b!1316267 (=> (not res!873805) (not e!750872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88420 (_ BitVec 32)) Bool)

(assert (=> b!1316267 (= res!873805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!873803 () Bool)

(assert (=> start!111166 (=> (not res!873803) (not e!750872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111166 (= res!873803 (validMask!0 mask!2040))))

(assert (=> start!111166 e!750872))

(assert (=> start!111166 tp!105325))

(declare-fun array_inv!32241 (array!88420) Bool)

(assert (=> start!111166 (array_inv!32241 _keys!1628)))

(assert (=> start!111166 true))

(assert (=> start!111166 tp_is_empty!35731))

(declare-fun e!750868 () Bool)

(declare-fun array_inv!32242 (array!88422) Bool)

(assert (=> start!111166 (and (array_inv!32242 _values!1354) e!750868)))

(declare-fun b!1316268 () Bool)

(declare-fun mapRes!55225 () Bool)

(assert (=> b!1316268 (= e!750868 (and e!750870 mapRes!55225))))

(declare-fun condMapEmpty!55225 () Bool)

(declare-fun mapDefault!55225 () ValueCell!16967)

