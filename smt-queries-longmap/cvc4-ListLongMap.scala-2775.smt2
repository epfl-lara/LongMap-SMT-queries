; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40526 () Bool)

(assert start!40526)

(declare-fun b!446541 () Bool)

(declare-fun res!265067 () Bool)

(declare-fun e!262331 () Bool)

(assert (=> b!446541 (=> (not res!265067) (not e!262331))))

(declare-datatypes ((array!27589 0))(
  ( (array!27590 (arr!13241 (Array (_ BitVec 32) (_ BitVec 64))) (size!13593 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27589)

(declare-datatypes ((List!7921 0))(
  ( (Nil!7918) (Cons!7917 (h!8773 (_ BitVec 64)) (t!13681 List!7921)) )
))
(declare-fun arrayNoDuplicates!0 (array!27589 (_ BitVec 32) List!7921) Bool)

(assert (=> b!446541 (= res!265067 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7918))))

(declare-fun b!446542 () Bool)

(declare-fun res!265061 () Bool)

(assert (=> b!446542 (=> (not res!265061) (not e!262331))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446542 (= res!265061 (validMask!0 mask!1025))))

(declare-fun b!446543 () Bool)

(declare-fun res!265065 () Bool)

(assert (=> b!446543 (=> (not res!265065) (not e!262331))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446543 (= res!265065 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!265060 () Bool)

(assert (=> start!40526 (=> (not res!265060) (not e!262331))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40526 (= res!265060 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13593 _keys!709))))))

(assert (=> start!40526 e!262331))

(assert (=> start!40526 true))

(declare-datatypes ((V!16959 0))(
  ( (V!16960 (val!5990 Int)) )
))
(declare-datatypes ((ValueCell!5602 0))(
  ( (ValueCellFull!5602 (v!8245 V!16959)) (EmptyCell!5602) )
))
(declare-datatypes ((array!27591 0))(
  ( (array!27592 (arr!13242 (Array (_ BitVec 32) ValueCell!5602)) (size!13594 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27591)

(declare-fun e!262327 () Bool)

(declare-fun array_inv!9602 (array!27591) Bool)

(assert (=> start!40526 (and (array_inv!9602 _values!549) e!262327)))

(declare-fun array_inv!9603 (array!27589) Bool)

(assert (=> start!40526 (array_inv!9603 _keys!709)))

(declare-fun b!446544 () Bool)

(declare-fun e!262330 () Bool)

(assert (=> b!446544 (= e!262330 false)))

(declare-fun lt!203824 () Bool)

(declare-fun lt!203825 () array!27589)

(assert (=> b!446544 (= lt!203824 (arrayNoDuplicates!0 lt!203825 #b00000000000000000000000000000000 Nil!7918))))

(declare-fun b!446545 () Bool)

(declare-fun res!265059 () Bool)

(assert (=> b!446545 (=> (not res!265059) (not e!262331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27589 (_ BitVec 32)) Bool)

(assert (=> b!446545 (= res!265059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446546 () Bool)

(declare-fun e!262328 () Bool)

(declare-fun tp_is_empty!11891 () Bool)

(assert (=> b!446546 (= e!262328 tp_is_empty!11891)))

(declare-fun mapIsEmpty!19467 () Bool)

(declare-fun mapRes!19467 () Bool)

(assert (=> mapIsEmpty!19467 mapRes!19467))

(declare-fun b!446547 () Bool)

(declare-fun res!265064 () Bool)

(assert (=> b!446547 (=> (not res!265064) (not e!262331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446547 (= res!265064 (validKeyInArray!0 k!794))))

(declare-fun b!446548 () Bool)

(assert (=> b!446548 (= e!262331 e!262330)))

(declare-fun res!265068 () Bool)

(assert (=> b!446548 (=> (not res!265068) (not e!262330))))

(assert (=> b!446548 (= res!265068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203825 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446548 (= lt!203825 (array!27590 (store (arr!13241 _keys!709) i!563 k!794) (size!13593 _keys!709)))))

(declare-fun b!446549 () Bool)

(declare-fun res!265066 () Bool)

(assert (=> b!446549 (=> (not res!265066) (not e!262331))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446549 (= res!265066 (and (= (size!13594 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13593 _keys!709) (size!13594 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446550 () Bool)

(declare-fun res!265063 () Bool)

(assert (=> b!446550 (=> (not res!265063) (not e!262331))))

(assert (=> b!446550 (= res!265063 (or (= (select (arr!13241 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13241 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19467 () Bool)

(declare-fun tp!37494 () Bool)

(declare-fun e!262329 () Bool)

(assert (=> mapNonEmpty!19467 (= mapRes!19467 (and tp!37494 e!262329))))

(declare-fun mapKey!19467 () (_ BitVec 32))

(declare-fun mapRest!19467 () (Array (_ BitVec 32) ValueCell!5602))

(declare-fun mapValue!19467 () ValueCell!5602)

(assert (=> mapNonEmpty!19467 (= (arr!13242 _values!549) (store mapRest!19467 mapKey!19467 mapValue!19467))))

(declare-fun b!446551 () Bool)

(assert (=> b!446551 (= e!262327 (and e!262328 mapRes!19467))))

(declare-fun condMapEmpty!19467 () Bool)

(declare-fun mapDefault!19467 () ValueCell!5602)

