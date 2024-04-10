; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43200 () Bool)

(assert start!43200)

(declare-fun mapNonEmpty!22078 () Bool)

(declare-fun mapRes!22078 () Bool)

(declare-fun tp!42553 () Bool)

(declare-fun e!281564 () Bool)

(assert (=> mapNonEmpty!22078 (= mapRes!22078 (and tp!42553 e!281564))))

(declare-datatypes ((V!19189 0))(
  ( (V!19190 (val!6842 Int)) )
))
(declare-datatypes ((ValueCell!6433 0))(
  ( (ValueCellFull!6433 (v!9131 V!19189)) (EmptyCell!6433) )
))
(declare-fun mapRest!22078 () (Array (_ BitVec 32) ValueCell!6433))

(declare-fun mapValue!22078 () ValueCell!6433)

(declare-fun mapKey!22078 () (_ BitVec 32))

(declare-datatypes ((array!30855 0))(
  ( (array!30856 (arr!14835 (Array (_ BitVec 32) ValueCell!6433)) (size!15193 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30855)

(assert (=> mapNonEmpty!22078 (= (arr!14835 _values!1516) (store mapRest!22078 mapKey!22078 mapValue!22078))))

(declare-fun b!478786 () Bool)

(declare-fun res!285641 () Bool)

(declare-fun e!281565 () Bool)

(assert (=> b!478786 (=> (not res!285641) (not e!281565))))

(declare-datatypes ((array!30857 0))(
  ( (array!30858 (arr!14836 (Array (_ BitVec 32) (_ BitVec 64))) (size!15194 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30857)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30857 (_ BitVec 32)) Bool)

(assert (=> b!478786 (= res!285641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478787 () Bool)

(declare-fun e!281566 () Bool)

(declare-fun e!281568 () Bool)

(assert (=> b!478787 (= e!281566 (and e!281568 mapRes!22078))))

(declare-fun condMapEmpty!22078 () Bool)

(declare-fun mapDefault!22078 () ValueCell!6433)

