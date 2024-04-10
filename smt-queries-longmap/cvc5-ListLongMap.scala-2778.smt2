; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40540 () Bool)

(assert start!40540)

(declare-fun b_free!10567 () Bool)

(declare-fun b_next!10567 () Bool)

(assert (=> start!40540 (= b_free!10567 (not b_next!10567))))

(declare-fun tp!37518 () Bool)

(declare-fun b_and!18567 () Bool)

(assert (=> start!40540 (= tp!37518 b_and!18567)))

(declare-fun b!446827 () Bool)

(declare-fun e!262455 () Bool)

(declare-fun e!262456 () Bool)

(assert (=> b!446827 (= e!262455 e!262456)))

(declare-fun res!265289 () Bool)

(assert (=> b!446827 (=> (not res!265289) (not e!262456))))

(declare-datatypes ((array!27615 0))(
  ( (array!27616 (arr!13254 (Array (_ BitVec 32) (_ BitVec 64))) (size!13606 (_ BitVec 32))) )
))
(declare-fun lt!203855 () array!27615)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27615 (_ BitVec 32)) Bool)

(assert (=> b!446827 (= res!265289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203855 mask!1025))))

(declare-fun _keys!709 () array!27615)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446827 (= lt!203855 (array!27616 (store (arr!13254 _keys!709) i!563 k!794) (size!13606 _keys!709)))))

(declare-fun b!446828 () Bool)

(declare-fun res!265286 () Bool)

(assert (=> b!446828 (=> (not res!265286) (not e!262456))))

(declare-datatypes ((List!7927 0))(
  ( (Nil!7924) (Cons!7923 (h!8779 (_ BitVec 64)) (t!13687 List!7927)) )
))
(declare-fun arrayNoDuplicates!0 (array!27615 (_ BitVec 32) List!7927) Bool)

(assert (=> b!446828 (= res!265286 (arrayNoDuplicates!0 lt!203855 #b00000000000000000000000000000000 Nil!7924))))

(declare-fun b!446829 () Bool)

(declare-fun res!265293 () Bool)

(assert (=> b!446829 (=> (not res!265293) (not e!262455))))

(assert (=> b!446829 (= res!265293 (or (= (select (arr!13254 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13254 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446830 () Bool)

(declare-fun res!265288 () Bool)

(assert (=> b!446830 (=> (not res!265288) (not e!262455))))

(assert (=> b!446830 (= res!265288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446831 () Bool)

(declare-fun res!265292 () Bool)

(assert (=> b!446831 (=> (not res!265292) (not e!262455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446831 (= res!265292 (validMask!0 mask!1025))))

(declare-fun b!446832 () Bool)

(declare-fun e!262458 () Bool)

(declare-fun tp_is_empty!11905 () Bool)

(assert (=> b!446832 (= e!262458 tp_is_empty!11905)))

(declare-fun b!446833 () Bool)

(declare-fun e!262454 () Bool)

(declare-fun mapRes!19488 () Bool)

(assert (=> b!446833 (= e!262454 (and e!262458 mapRes!19488))))

(declare-fun condMapEmpty!19488 () Bool)

(declare-datatypes ((V!16979 0))(
  ( (V!16980 (val!5997 Int)) )
))
(declare-datatypes ((ValueCell!5609 0))(
  ( (ValueCellFull!5609 (v!8252 V!16979)) (EmptyCell!5609) )
))
(declare-datatypes ((array!27617 0))(
  ( (array!27618 (arr!13255 (Array (_ BitVec 32) ValueCell!5609)) (size!13607 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27617)

(declare-fun mapDefault!19488 () ValueCell!5609)

