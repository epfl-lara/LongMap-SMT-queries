; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107924 () Bool)

(assert start!107924)

(declare-fun res!847681 () Bool)

(declare-fun e!727965 () Bool)

(assert (=> start!107924 (=> (not res!847681) (not e!727965))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107924 (= res!847681 (validMask!0 mask!1805))))

(assert (=> start!107924 e!727965))

(assert (=> start!107924 true))

(declare-datatypes ((V!49425 0))(
  ( (V!49426 (val!16695 Int)) )
))
(declare-datatypes ((ValueCell!15722 0))(
  ( (ValueCellFull!15722 (v!19291 V!49425)) (EmptyCell!15722) )
))
(declare-datatypes ((array!83590 0))(
  ( (array!83591 (arr!40312 (Array (_ BitVec 32) ValueCell!15722)) (size!40862 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83590)

(declare-fun e!727968 () Bool)

(declare-fun array_inv!30645 (array!83590) Bool)

(assert (=> start!107924 (and (array_inv!30645 _values!1187) e!727968)))

(declare-datatypes ((array!83592 0))(
  ( (array!83593 (arr!40313 (Array (_ BitVec 32) (_ BitVec 64))) (size!40863 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83592)

(declare-fun array_inv!30646 (array!83592) Bool)

(assert (=> start!107924 (array_inv!30646 _keys!1427)))

(declare-fun b!1275276 () Bool)

(declare-fun e!727967 () Bool)

(declare-fun tp_is_empty!33241 () Bool)

(assert (=> b!1275276 (= e!727967 tp_is_empty!33241)))

(declare-fun mapIsEmpty!51374 () Bool)

(declare-fun mapRes!51374 () Bool)

(assert (=> mapIsEmpty!51374 mapRes!51374))

(declare-fun b!1275277 () Bool)

(declare-fun e!727966 () Bool)

(assert (=> b!1275277 (= e!727968 (and e!727966 mapRes!51374))))

(declare-fun condMapEmpty!51374 () Bool)

(declare-fun mapDefault!51374 () ValueCell!15722)

