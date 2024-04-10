; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43122 () Bool)

(assert start!43122)

(declare-fun b!478290 () Bool)

(declare-fun e!281175 () Bool)

(declare-fun tp_is_empty!13549 () Bool)

(assert (=> b!478290 (= e!281175 tp_is_empty!13549)))

(declare-fun res!285381 () Bool)

(declare-fun e!281177 () Bool)

(assert (=> start!43122 (=> (not res!285381) (not e!281177))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43122 (= res!285381 (validMask!0 mask!2352))))

(assert (=> start!43122 e!281177))

(assert (=> start!43122 true))

(declare-datatypes ((V!19137 0))(
  ( (V!19138 (val!6822 Int)) )
))
(declare-datatypes ((ValueCell!6413 0))(
  ( (ValueCellFull!6413 (v!9110 V!19137)) (EmptyCell!6413) )
))
(declare-datatypes ((array!30769 0))(
  ( (array!30770 (arr!14796 (Array (_ BitVec 32) ValueCell!6413)) (size!15154 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30769)

(declare-fun e!281176 () Bool)

(declare-fun array_inv!10676 (array!30769) Bool)

(assert (=> start!43122 (and (array_inv!10676 _values!1516) e!281176)))

(declare-datatypes ((array!30771 0))(
  ( (array!30772 (arr!14797 (Array (_ BitVec 32) (_ BitVec 64))) (size!15155 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30771)

(declare-fun array_inv!10677 (array!30771) Bool)

(assert (=> start!43122 (array_inv!10677 _keys!1874)))

(declare-fun b!478291 () Bool)

(assert (=> b!478291 (= e!281177 (bvsgt #b00000000000000000000000000000000 (size!15155 _keys!1874)))))

(declare-fun mapIsEmpty!22006 () Bool)

(declare-fun mapRes!22006 () Bool)

(assert (=> mapIsEmpty!22006 mapRes!22006))

(declare-fun b!478292 () Bool)

(declare-fun e!281178 () Bool)

(assert (=> b!478292 (= e!281178 tp_is_empty!13549)))

(declare-fun b!478293 () Bool)

(assert (=> b!478293 (= e!281176 (and e!281178 mapRes!22006))))

(declare-fun condMapEmpty!22006 () Bool)

(declare-fun mapDefault!22006 () ValueCell!6413)

