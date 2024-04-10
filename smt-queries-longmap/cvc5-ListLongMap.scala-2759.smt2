; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40406 () Bool)

(assert start!40406)

(declare-fun b!444263 () Bool)

(declare-fun res!263403 () Bool)

(declare-fun e!261292 () Bool)

(assert (=> b!444263 (=> (not res!263403) (not e!261292))))

(declare-datatypes ((array!27391 0))(
  ( (array!27392 (arr!13143 (Array (_ BitVec 32) (_ BitVec 64))) (size!13495 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27391)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16827 0))(
  ( (V!16828 (val!5940 Int)) )
))
(declare-datatypes ((ValueCell!5552 0))(
  ( (ValueCellFull!5552 (v!8191 V!16827)) (EmptyCell!5552) )
))
(declare-datatypes ((array!27393 0))(
  ( (array!27394 (arr!13144 (Array (_ BitVec 32) ValueCell!5552)) (size!13496 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27393)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444263 (= res!263403 (and (= (size!13496 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13495 _keys!709) (size!13496 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444264 () Bool)

(declare-fun res!263408 () Bool)

(assert (=> b!444264 (=> (not res!263408) (not e!261292))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444264 (= res!263408 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19314 () Bool)

(declare-fun mapRes!19314 () Bool)

(assert (=> mapIsEmpty!19314 mapRes!19314))

(declare-fun b!444265 () Bool)

(declare-fun res!263402 () Bool)

(assert (=> b!444265 (=> (not res!263402) (not e!261292))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444265 (= res!263402 (or (= (select (arr!13143 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13143 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!263410 () Bool)

(assert (=> start!40406 (=> (not res!263410) (not e!261292))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40406 (= res!263410 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13495 _keys!709))))))

(assert (=> start!40406 e!261292))

(assert (=> start!40406 true))

(declare-fun e!261295 () Bool)

(declare-fun array_inv!9532 (array!27393) Bool)

(assert (=> start!40406 (and (array_inv!9532 _values!549) e!261295)))

(declare-fun array_inv!9533 (array!27391) Bool)

(assert (=> start!40406 (array_inv!9533 _keys!709)))

(declare-fun b!444266 () Bool)

(declare-fun e!261296 () Bool)

(assert (=> b!444266 (= e!261292 e!261296)))

(declare-fun res!263407 () Bool)

(assert (=> b!444266 (=> (not res!263407) (not e!261296))))

(declare-fun lt!203465 () array!27391)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27391 (_ BitVec 32)) Bool)

(assert (=> b!444266 (= res!263407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203465 mask!1025))))

(assert (=> b!444266 (= lt!203465 (array!27392 (store (arr!13143 _keys!709) i!563 k!794) (size!13495 _keys!709)))))

(declare-fun b!444267 () Bool)

(declare-fun e!261291 () Bool)

(declare-fun tp_is_empty!11791 () Bool)

(assert (=> b!444267 (= e!261291 tp_is_empty!11791)))

(declare-fun b!444268 () Bool)

(declare-fun e!261293 () Bool)

(assert (=> b!444268 (= e!261293 tp_is_empty!11791)))

(declare-fun b!444269 () Bool)

(declare-fun res!263406 () Bool)

(assert (=> b!444269 (=> (not res!263406) (not e!261292))))

(assert (=> b!444269 (= res!263406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444270 () Bool)

(assert (=> b!444270 (= e!261295 (and e!261291 mapRes!19314))))

(declare-fun condMapEmpty!19314 () Bool)

(declare-fun mapDefault!19314 () ValueCell!5552)

