; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40392 () Bool)

(assert start!40392)

(declare-fun b!443990 () Bool)

(declare-fun res!263198 () Bool)

(declare-fun e!261167 () Bool)

(assert (=> b!443990 (=> (not res!263198) (not e!261167))))

(declare-datatypes ((array!27363 0))(
  ( (array!27364 (arr!13129 (Array (_ BitVec 32) (_ BitVec 64))) (size!13481 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27363)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443990 (= res!263198 (or (= (select (arr!13129 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13129 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443991 () Bool)

(declare-fun res!263191 () Bool)

(assert (=> b!443991 (=> (not res!263191) (not e!261167))))

(declare-datatypes ((List!7865 0))(
  ( (Nil!7862) (Cons!7861 (h!8717 (_ BitVec 64)) (t!13623 List!7865)) )
))
(declare-fun arrayNoDuplicates!0 (array!27363 (_ BitVec 32) List!7865) Bool)

(assert (=> b!443991 (= res!263191 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7862))))

(declare-fun b!443992 () Bool)

(declare-fun res!263200 () Bool)

(assert (=> b!443992 (=> (not res!263200) (not e!261167))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16807 0))(
  ( (V!16808 (val!5933 Int)) )
))
(declare-datatypes ((ValueCell!5545 0))(
  ( (ValueCellFull!5545 (v!8184 V!16807)) (EmptyCell!5545) )
))
(declare-datatypes ((array!27365 0))(
  ( (array!27366 (arr!13130 (Array (_ BitVec 32) ValueCell!5545)) (size!13482 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27365)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443992 (= res!263200 (and (= (size!13482 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13481 _keys!709) (size!13482 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443993 () Bool)

(declare-fun e!261169 () Bool)

(declare-fun tp_is_empty!11777 () Bool)

(assert (=> b!443993 (= e!261169 tp_is_empty!11777)))

(declare-fun b!443994 () Bool)

(declare-fun e!261166 () Bool)

(assert (=> b!443994 (= e!261166 false)))

(declare-fun lt!203423 () Bool)

(declare-fun lt!203422 () array!27363)

(assert (=> b!443994 (= lt!203423 (arrayNoDuplicates!0 lt!203422 #b00000000000000000000000000000000 Nil!7862))))

(declare-fun mapNonEmpty!19293 () Bool)

(declare-fun mapRes!19293 () Bool)

(declare-fun tp!37275 () Bool)

(declare-fun e!261165 () Bool)

(assert (=> mapNonEmpty!19293 (= mapRes!19293 (and tp!37275 e!261165))))

(declare-fun mapRest!19293 () (Array (_ BitVec 32) ValueCell!5545))

(declare-fun mapKey!19293 () (_ BitVec 32))

(declare-fun mapValue!19293 () ValueCell!5545)

(assert (=> mapNonEmpty!19293 (= (arr!13130 _values!549) (store mapRest!19293 mapKey!19293 mapValue!19293))))

(declare-fun b!443995 () Bool)

(declare-fun res!263199 () Bool)

(assert (=> b!443995 (=> (not res!263199) (not e!261167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27363 (_ BitVec 32)) Bool)

(assert (=> b!443995 (= res!263199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443996 () Bool)

(assert (=> b!443996 (= e!261167 e!261166)))

(declare-fun res!263193 () Bool)

(assert (=> b!443996 (=> (not res!263193) (not e!261166))))

(assert (=> b!443996 (= res!263193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203422 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!443996 (= lt!203422 (array!27364 (store (arr!13129 _keys!709) i!563 k!794) (size!13481 _keys!709)))))

(declare-fun mapIsEmpty!19293 () Bool)

(assert (=> mapIsEmpty!19293 mapRes!19293))

(declare-fun b!443997 () Bool)

(declare-fun res!263196 () Bool)

(assert (=> b!443997 (=> (not res!263196) (not e!261167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443997 (= res!263196 (validKeyInArray!0 k!794))))

(declare-fun b!443999 () Bool)

(declare-fun e!261168 () Bool)

(assert (=> b!443999 (= e!261168 (and e!261169 mapRes!19293))))

(declare-fun condMapEmpty!19293 () Bool)

(declare-fun mapDefault!19293 () ValueCell!5545)

