; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104836 () Bool)

(assert start!104836)

(declare-fun b_free!26641 () Bool)

(declare-fun b_next!26641 () Bool)

(assert (=> start!104836 (= b_free!26641 (not b_next!26641))))

(declare-fun tp!93412 () Bool)

(declare-fun b_and!44409 () Bool)

(assert (=> start!104836 (= tp!93412 b_and!44409)))

(declare-fun mapIsEmpty!49075 () Bool)

(declare-fun mapRes!49075 () Bool)

(assert (=> mapIsEmpty!49075 mapRes!49075))

(declare-fun b!1249620 () Bool)

(declare-fun res!833570 () Bool)

(declare-fun e!709267 () Bool)

(assert (=> b!1249620 (=> (not res!833570) (not e!709267))))

(declare-datatypes ((array!80764 0))(
  ( (array!80765 (arr!38949 (Array (_ BitVec 32) (_ BitVec 64))) (size!39485 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80764)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80764 (_ BitVec 32)) Bool)

(assert (=> b!1249620 (= res!833570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249621 () Bool)

(declare-fun e!709264 () Bool)

(declare-fun e!709266 () Bool)

(assert (=> b!1249621 (= e!709264 (and e!709266 mapRes!49075))))

(declare-fun condMapEmpty!49075 () Bool)

(declare-datatypes ((V!47423 0))(
  ( (V!47424 (val!15834 Int)) )
))
(declare-datatypes ((ValueCell!15008 0))(
  ( (ValueCellFull!15008 (v!18530 V!47423)) (EmptyCell!15008) )
))
(declare-datatypes ((array!80766 0))(
  ( (array!80767 (arr!38950 (Array (_ BitVec 32) ValueCell!15008)) (size!39486 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80766)

(declare-fun mapDefault!49075 () ValueCell!15008)

