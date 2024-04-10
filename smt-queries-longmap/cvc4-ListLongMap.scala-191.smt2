; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3770 () Bool)

(assert start!3770)

(declare-fun res!15638 () Bool)

(declare-fun e!17126 () Bool)

(assert (=> start!3770 (=> (not res!15638) (not e!17126))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3770 (= res!15638 (validMask!0 mask!2294))))

(assert (=> start!3770 e!17126))

(assert (=> start!3770 true))

(declare-datatypes ((V!1279 0))(
  ( (V!1280 (val!572 Int)) )
))
(declare-datatypes ((ValueCell!346 0))(
  ( (ValueCellFull!346 (v!1658 V!1279)) (EmptyCell!346) )
))
(declare-datatypes ((array!1427 0))(
  ( (array!1428 (arr!671 (Array (_ BitVec 32) ValueCell!346)) (size!772 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1427)

(declare-fun e!17125 () Bool)

(declare-fun array_inv!457 (array!1427) Bool)

(assert (=> start!3770 (and (array_inv!457 _values!1501) e!17125)))

(declare-datatypes ((array!1429 0))(
  ( (array!1430 (arr!672 (Array (_ BitVec 32) (_ BitVec 64))) (size!773 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1429)

(declare-fun array_inv!458 (array!1429) Bool)

(assert (=> start!3770 (array_inv!458 _keys!1833)))

(declare-fun mapNonEmpty!1153 () Bool)

(declare-fun mapRes!1153 () Bool)

(declare-fun tp!3673 () Bool)

(declare-fun e!17129 () Bool)

(assert (=> mapNonEmpty!1153 (= mapRes!1153 (and tp!3673 e!17129))))

(declare-fun mapRest!1153 () (Array (_ BitVec 32) ValueCell!346))

(declare-fun mapValue!1153 () ValueCell!346)

(declare-fun mapKey!1153 () (_ BitVec 32))

(assert (=> mapNonEmpty!1153 (= (arr!671 _values!1501) (store mapRest!1153 mapKey!1153 mapValue!1153))))

(declare-fun b!26324 () Bool)

(declare-fun res!15639 () Bool)

(assert (=> b!26324 (=> (not res!15639) (not e!17126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1429 (_ BitVec 32)) Bool)

(assert (=> b!26324 (= res!15639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26325 () Bool)

(declare-fun res!15637 () Bool)

(assert (=> b!26325 (=> (not res!15637) (not e!17126))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26325 (= res!15637 (and (= (size!772 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!773 _keys!1833) (size!772 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26326 () Bool)

(declare-fun tp_is_empty!1091 () Bool)

(assert (=> b!26326 (= e!17129 tp_is_empty!1091)))

(declare-fun b!26327 () Bool)

(declare-fun e!17128 () Bool)

(assert (=> b!26327 (= e!17125 (and e!17128 mapRes!1153))))

(declare-fun condMapEmpty!1153 () Bool)

(declare-fun mapDefault!1153 () ValueCell!346)

