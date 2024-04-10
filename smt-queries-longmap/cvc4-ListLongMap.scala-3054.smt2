; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43140 () Bool)

(assert start!43140)

(declare-fun b!478400 () Bool)

(declare-fun res!285431 () Bool)

(declare-fun e!281267 () Bool)

(assert (=> b!478400 (=> (not res!285431) (not e!281267))))

(declare-datatypes ((array!30789 0))(
  ( (array!30790 (arr!14805 (Array (_ BitVec 32) (_ BitVec 64))) (size!15163 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30789)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30789 (_ BitVec 32)) Bool)

(assert (=> b!478400 (= res!285431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478401 () Bool)

(declare-fun e!281268 () Bool)

(declare-fun e!281265 () Bool)

(declare-fun mapRes!22024 () Bool)

(assert (=> b!478401 (= e!281268 (and e!281265 mapRes!22024))))

(declare-fun condMapEmpty!22024 () Bool)

(declare-datatypes ((V!19149 0))(
  ( (V!19150 (val!6827 Int)) )
))
(declare-datatypes ((ValueCell!6418 0))(
  ( (ValueCellFull!6418 (v!9115 V!19149)) (EmptyCell!6418) )
))
(declare-datatypes ((array!30791 0))(
  ( (array!30792 (arr!14806 (Array (_ BitVec 32) ValueCell!6418)) (size!15164 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30791)

(declare-fun mapDefault!22024 () ValueCell!6418)

