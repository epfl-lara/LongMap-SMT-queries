; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40458 () Bool)

(assert start!40458)

(declare-fun b!445277 () Bool)

(declare-fun res!264185 () Bool)

(declare-fun e!261759 () Bool)

(assert (=> b!445277 (=> (not res!264185) (not e!261759))))

(declare-datatypes ((array!27493 0))(
  ( (array!27494 (arr!13194 (Array (_ BitVec 32) (_ BitVec 64))) (size!13546 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27493)

(declare-datatypes ((V!16895 0))(
  ( (V!16896 (val!5966 Int)) )
))
(declare-datatypes ((ValueCell!5578 0))(
  ( (ValueCellFull!5578 (v!8217 V!16895)) (EmptyCell!5578) )
))
(declare-datatypes ((array!27495 0))(
  ( (array!27496 (arr!13195 (Array (_ BitVec 32) ValueCell!5578)) (size!13547 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27495)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!445277 (= res!264185 (and (= (size!13547 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13546 _keys!709) (size!13547 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445278 () Bool)

(declare-fun res!264184 () Bool)

(assert (=> b!445278 (=> (not res!264184) (not e!261759))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445278 (= res!264184 (or (= (select (arr!13194 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13194 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445279 () Bool)

(declare-fun res!264181 () Bool)

(assert (=> b!445279 (=> (not res!264181) (not e!261759))))

(assert (=> b!445279 (= res!264181 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13546 _keys!709))))))

(declare-fun b!445280 () Bool)

(declare-fun e!261762 () Bool)

(declare-fun tp_is_empty!11843 () Bool)

(assert (=> b!445280 (= e!261762 tp_is_empty!11843)))

(declare-fun mapNonEmpty!19392 () Bool)

(declare-fun mapRes!19392 () Bool)

(declare-fun tp!37374 () Bool)

(assert (=> mapNonEmpty!19392 (= mapRes!19392 (and tp!37374 e!261762))))

(declare-fun mapRest!19392 () (Array (_ BitVec 32) ValueCell!5578))

(declare-fun mapValue!19392 () ValueCell!5578)

(declare-fun mapKey!19392 () (_ BitVec 32))

(assert (=> mapNonEmpty!19392 (= (arr!13195 _values!549) (store mapRest!19392 mapKey!19392 mapValue!19392))))

(declare-fun b!445281 () Bool)

(declare-fun res!264183 () Bool)

(assert (=> b!445281 (=> (not res!264183) (not e!261759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445281 (= res!264183 (validMask!0 mask!1025))))

(declare-fun res!264182 () Bool)

(assert (=> start!40458 (=> (not res!264182) (not e!261759))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40458 (= res!264182 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13546 _keys!709))))))

(assert (=> start!40458 e!261759))

(assert (=> start!40458 true))

(declare-fun e!261763 () Bool)

(declare-fun array_inv!9566 (array!27495) Bool)

(assert (=> start!40458 (and (array_inv!9566 _values!549) e!261763)))

(declare-fun array_inv!9567 (array!27493) Bool)

(assert (=> start!40458 (array_inv!9567 _keys!709)))

(declare-fun b!445282 () Bool)

(declare-fun res!264186 () Bool)

(assert (=> b!445282 (=> (not res!264186) (not e!261759))))

(declare-datatypes ((List!7888 0))(
  ( (Nil!7885) (Cons!7884 (h!8740 (_ BitVec 64)) (t!13646 List!7888)) )
))
(declare-fun arrayNoDuplicates!0 (array!27493 (_ BitVec 32) List!7888) Bool)

(assert (=> b!445282 (= res!264186 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7885))))

(declare-fun b!445283 () Bool)

(declare-fun e!261761 () Bool)

(assert (=> b!445283 (= e!261761 tp_is_empty!11843)))

(declare-fun b!445284 () Bool)

(declare-fun res!264188 () Bool)

(assert (=> b!445284 (=> (not res!264188) (not e!261759))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445284 (= res!264188 (validKeyInArray!0 k!794))))

(declare-fun b!445285 () Bool)

(declare-fun res!264187 () Bool)

(assert (=> b!445285 (=> (not res!264187) (not e!261759))))

(declare-fun arrayContainsKey!0 (array!27493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445285 (= res!264187 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!445286 () Bool)

(assert (=> b!445286 (= e!261763 (and e!261761 mapRes!19392))))

(declare-fun condMapEmpty!19392 () Bool)

(declare-fun mapDefault!19392 () ValueCell!5578)

