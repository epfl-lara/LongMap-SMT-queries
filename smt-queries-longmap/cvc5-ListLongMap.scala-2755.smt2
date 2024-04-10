; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40382 () Bool)

(assert start!40382)

(declare-fun b!443795 () Bool)

(declare-fun res!263049 () Bool)

(declare-fun e!261076 () Bool)

(assert (=> b!443795 (=> (not res!263049) (not e!261076))))

(declare-datatypes ((array!27343 0))(
  ( (array!27344 (arr!13119 (Array (_ BitVec 32) (_ BitVec 64))) (size!13471 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27343)

(declare-datatypes ((List!7861 0))(
  ( (Nil!7858) (Cons!7857 (h!8713 (_ BitVec 64)) (t!13619 List!7861)) )
))
(declare-fun arrayNoDuplicates!0 (array!27343 (_ BitVec 32) List!7861) Bool)

(assert (=> b!443795 (= res!263049 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7858))))

(declare-fun mapIsEmpty!19278 () Bool)

(declare-fun mapRes!19278 () Bool)

(assert (=> mapIsEmpty!19278 mapRes!19278))

(declare-fun b!443796 () Bool)

(declare-fun e!261079 () Bool)

(assert (=> b!443796 (= e!261076 e!261079)))

(declare-fun res!263044 () Bool)

(assert (=> b!443796 (=> (not res!263044) (not e!261079))))

(declare-fun lt!203393 () array!27343)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27343 (_ BitVec 32)) Bool)

(assert (=> b!443796 (= res!263044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203393 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443796 (= lt!203393 (array!27344 (store (arr!13119 _keys!709) i!563 k!794) (size!13471 _keys!709)))))

(declare-fun mapNonEmpty!19278 () Bool)

(declare-fun tp!37260 () Bool)

(declare-fun e!261077 () Bool)

(assert (=> mapNonEmpty!19278 (= mapRes!19278 (and tp!37260 e!261077))))

(declare-datatypes ((V!16795 0))(
  ( (V!16796 (val!5928 Int)) )
))
(declare-datatypes ((ValueCell!5540 0))(
  ( (ValueCellFull!5540 (v!8179 V!16795)) (EmptyCell!5540) )
))
(declare-fun mapRest!19278 () (Array (_ BitVec 32) ValueCell!5540))

(declare-datatypes ((array!27345 0))(
  ( (array!27346 (arr!13120 (Array (_ BitVec 32) ValueCell!5540)) (size!13472 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27345)

(declare-fun mapKey!19278 () (_ BitVec 32))

(declare-fun mapValue!19278 () ValueCell!5540)

(assert (=> mapNonEmpty!19278 (= (arr!13120 _values!549) (store mapRest!19278 mapKey!19278 mapValue!19278))))

(declare-fun b!443797 () Bool)

(declare-fun res!263046 () Bool)

(assert (=> b!443797 (=> (not res!263046) (not e!261076))))

(declare-fun arrayContainsKey!0 (array!27343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443797 (= res!263046 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!443798 () Bool)

(declare-fun e!261078 () Bool)

(declare-fun tp_is_empty!11767 () Bool)

(assert (=> b!443798 (= e!261078 tp_is_empty!11767)))

(declare-fun b!443799 () Bool)

(assert (=> b!443799 (= e!261077 tp_is_empty!11767)))

(declare-fun res!263042 () Bool)

(assert (=> start!40382 (=> (not res!263042) (not e!261076))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40382 (= res!263042 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13471 _keys!709))))))

(assert (=> start!40382 e!261076))

(assert (=> start!40382 true))

(declare-fun e!261080 () Bool)

(declare-fun array_inv!9518 (array!27345) Bool)

(assert (=> start!40382 (and (array_inv!9518 _values!549) e!261080)))

(declare-fun array_inv!9519 (array!27343) Bool)

(assert (=> start!40382 (array_inv!9519 _keys!709)))

(declare-fun b!443800 () Bool)

(declare-fun res!263047 () Bool)

(assert (=> b!443800 (=> (not res!263047) (not e!261076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443800 (= res!263047 (validKeyInArray!0 k!794))))

(declare-fun b!443801 () Bool)

(declare-fun res!263041 () Bool)

(assert (=> b!443801 (=> (not res!263041) (not e!261076))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443801 (= res!263041 (and (= (size!13472 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13471 _keys!709) (size!13472 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443802 () Bool)

(assert (=> b!443802 (= e!261079 false)))

(declare-fun lt!203392 () Bool)

(assert (=> b!443802 (= lt!203392 (arrayNoDuplicates!0 lt!203393 #b00000000000000000000000000000000 Nil!7858))))

(declare-fun b!443803 () Bool)

(declare-fun res!263048 () Bool)

(assert (=> b!443803 (=> (not res!263048) (not e!261076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443803 (= res!263048 (validMask!0 mask!1025))))

(declare-fun b!443804 () Bool)

(declare-fun res!263050 () Bool)

(assert (=> b!443804 (=> (not res!263050) (not e!261076))))

(assert (=> b!443804 (= res!263050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443805 () Bool)

(assert (=> b!443805 (= e!261080 (and e!261078 mapRes!19278))))

(declare-fun condMapEmpty!19278 () Bool)

(declare-fun mapDefault!19278 () ValueCell!5540)

