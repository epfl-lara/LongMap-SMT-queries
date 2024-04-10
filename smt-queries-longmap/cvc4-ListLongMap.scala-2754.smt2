; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40380 () Bool)

(assert start!40380)

(declare-fun b!443756 () Bool)

(declare-fun res!263012 () Bool)

(declare-fun e!261058 () Bool)

(assert (=> b!443756 (=> (not res!263012) (not e!261058))))

(declare-datatypes ((array!27339 0))(
  ( (array!27340 (arr!13117 (Array (_ BitVec 32) (_ BitVec 64))) (size!13469 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27339)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443756 (= res!263012 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!443757 () Bool)

(declare-fun e!261060 () Bool)

(declare-fun tp_is_empty!11765 () Bool)

(assert (=> b!443757 (= e!261060 tp_is_empty!11765)))

(declare-fun b!443758 () Bool)

(declare-fun res!263019 () Bool)

(assert (=> b!443758 (=> (not res!263019) (not e!261058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443758 (= res!263019 (validKeyInArray!0 k!794))))

(declare-fun b!443759 () Bool)

(declare-fun res!263013 () Bool)

(assert (=> b!443759 (=> (not res!263013) (not e!261058))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16791 0))(
  ( (V!16792 (val!5927 Int)) )
))
(declare-datatypes ((ValueCell!5539 0))(
  ( (ValueCellFull!5539 (v!8178 V!16791)) (EmptyCell!5539) )
))
(declare-datatypes ((array!27341 0))(
  ( (array!27342 (arr!13118 (Array (_ BitVec 32) ValueCell!5539)) (size!13470 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27341)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443759 (= res!263013 (and (= (size!13470 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13469 _keys!709) (size!13470 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!263015 () Bool)

(assert (=> start!40380 (=> (not res!263015) (not e!261058))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40380 (= res!263015 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13469 _keys!709))))))

(assert (=> start!40380 e!261058))

(assert (=> start!40380 true))

(declare-fun e!261062 () Bool)

(declare-fun array_inv!9516 (array!27341) Bool)

(assert (=> start!40380 (and (array_inv!9516 _values!549) e!261062)))

(declare-fun array_inv!9517 (array!27339) Bool)

(assert (=> start!40380 (array_inv!9517 _keys!709)))

(declare-fun b!443760 () Bool)

(declare-fun res!263014 () Bool)

(assert (=> b!443760 (=> (not res!263014) (not e!261058))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443760 (= res!263014 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13469 _keys!709))))))

(declare-fun mapNonEmpty!19275 () Bool)

(declare-fun mapRes!19275 () Bool)

(declare-fun tp!37257 () Bool)

(declare-fun e!261061 () Bool)

(assert (=> mapNonEmpty!19275 (= mapRes!19275 (and tp!37257 e!261061))))

(declare-fun mapValue!19275 () ValueCell!5539)

(declare-fun mapKey!19275 () (_ BitVec 32))

(declare-fun mapRest!19275 () (Array (_ BitVec 32) ValueCell!5539))

(assert (=> mapNonEmpty!19275 (= (arr!13118 _values!549) (store mapRest!19275 mapKey!19275 mapValue!19275))))

(declare-fun b!443761 () Bool)

(declare-fun e!261057 () Bool)

(assert (=> b!443761 (= e!261058 e!261057)))

(declare-fun res!263011 () Bool)

(assert (=> b!443761 (=> (not res!263011) (not e!261057))))

(declare-fun lt!203387 () array!27339)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27339 (_ BitVec 32)) Bool)

(assert (=> b!443761 (= res!263011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203387 mask!1025))))

(assert (=> b!443761 (= lt!203387 (array!27340 (store (arr!13117 _keys!709) i!563 k!794) (size!13469 _keys!709)))))

(declare-fun b!443762 () Bool)

(declare-fun res!263016 () Bool)

(assert (=> b!443762 (=> (not res!263016) (not e!261058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443762 (= res!263016 (validMask!0 mask!1025))))

(declare-fun b!443763 () Bool)

(assert (=> b!443763 (= e!261062 (and e!261060 mapRes!19275))))

(declare-fun condMapEmpty!19275 () Bool)

(declare-fun mapDefault!19275 () ValueCell!5539)

