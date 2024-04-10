; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40364 () Bool)

(assert start!40364)

(declare-fun b!443444 () Bool)

(declare-fun res!262772 () Bool)

(declare-fun e!260916 () Bool)

(assert (=> b!443444 (=> (not res!262772) (not e!260916))))

(declare-datatypes ((array!27311 0))(
  ( (array!27312 (arr!13103 (Array (_ BitVec 32) (_ BitVec 64))) (size!13455 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27311)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443444 (= res!262772 (or (= (select (arr!13103 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13103 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443445 () Bool)

(declare-fun res!262774 () Bool)

(assert (=> b!443445 (=> (not res!262774) (not e!260916))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27311 (_ BitVec 32)) Bool)

(assert (=> b!443445 (= res!262774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443446 () Bool)

(declare-fun e!260917 () Bool)

(declare-fun tp_is_empty!11749 () Bool)

(assert (=> b!443446 (= e!260917 tp_is_empty!11749)))

(declare-fun b!443447 () Bool)

(declare-fun e!260913 () Bool)

(assert (=> b!443447 (= e!260916 e!260913)))

(declare-fun res!262773 () Bool)

(assert (=> b!443447 (=> (not res!262773) (not e!260913))))

(declare-fun lt!203339 () array!27311)

(assert (=> b!443447 (= res!262773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203339 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!443447 (= lt!203339 (array!27312 (store (arr!13103 _keys!709) i!563 k!794) (size!13455 _keys!709)))))

(declare-fun mapNonEmpty!19251 () Bool)

(declare-fun mapRes!19251 () Bool)

(declare-fun tp!37233 () Bool)

(assert (=> mapNonEmpty!19251 (= mapRes!19251 (and tp!37233 e!260917))))

(declare-datatypes ((V!16771 0))(
  ( (V!16772 (val!5919 Int)) )
))
(declare-datatypes ((ValueCell!5531 0))(
  ( (ValueCellFull!5531 (v!8170 V!16771)) (EmptyCell!5531) )
))
(declare-datatypes ((array!27313 0))(
  ( (array!27314 (arr!13104 (Array (_ BitVec 32) ValueCell!5531)) (size!13456 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27313)

(declare-fun mapKey!19251 () (_ BitVec 32))

(declare-fun mapValue!19251 () ValueCell!5531)

(declare-fun mapRest!19251 () (Array (_ BitVec 32) ValueCell!5531))

(assert (=> mapNonEmpty!19251 (= (arr!13104 _values!549) (store mapRest!19251 mapKey!19251 mapValue!19251))))

(declare-fun b!443449 () Bool)

(declare-fun res!262771 () Bool)

(assert (=> b!443449 (=> (not res!262771) (not e!260916))))

(declare-fun arrayContainsKey!0 (array!27311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443449 (= res!262771 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!443450 () Bool)

(declare-fun res!262776 () Bool)

(assert (=> b!443450 (=> (not res!262776) (not e!260916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443450 (= res!262776 (validKeyInArray!0 k!794))))

(declare-fun b!443451 () Bool)

(declare-fun res!262779 () Bool)

(assert (=> b!443451 (=> (not res!262779) (not e!260916))))

(declare-datatypes ((List!7856 0))(
  ( (Nil!7853) (Cons!7852 (h!8708 (_ BitVec 64)) (t!13614 List!7856)) )
))
(declare-fun arrayNoDuplicates!0 (array!27311 (_ BitVec 32) List!7856) Bool)

(assert (=> b!443451 (= res!262779 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7853))))

(declare-fun mapIsEmpty!19251 () Bool)

(assert (=> mapIsEmpty!19251 mapRes!19251))

(declare-fun b!443452 () Bool)

(declare-fun res!262780 () Bool)

(assert (=> b!443452 (=> (not res!262780) (not e!260916))))

(assert (=> b!443452 (= res!262780 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13455 _keys!709))))))

(declare-fun b!443453 () Bool)

(assert (=> b!443453 (= e!260913 false)))

(declare-fun lt!203338 () Bool)

(assert (=> b!443453 (= lt!203338 (arrayNoDuplicates!0 lt!203339 #b00000000000000000000000000000000 Nil!7853))))

(declare-fun b!443454 () Bool)

(declare-fun res!262775 () Bool)

(assert (=> b!443454 (=> (not res!262775) (not e!260916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443454 (= res!262775 (validMask!0 mask!1025))))

(declare-fun res!262778 () Bool)

(assert (=> start!40364 (=> (not res!262778) (not e!260916))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40364 (= res!262778 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13455 _keys!709))))))

(assert (=> start!40364 e!260916))

(assert (=> start!40364 true))

(declare-fun e!260915 () Bool)

(declare-fun array_inv!9506 (array!27313) Bool)

(assert (=> start!40364 (and (array_inv!9506 _values!549) e!260915)))

(declare-fun array_inv!9507 (array!27311) Bool)

(assert (=> start!40364 (array_inv!9507 _keys!709)))

(declare-fun b!443448 () Bool)

(declare-fun res!262777 () Bool)

(assert (=> b!443448 (=> (not res!262777) (not e!260916))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443448 (= res!262777 (and (= (size!13456 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13455 _keys!709) (size!13456 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443455 () Bool)

(declare-fun e!260914 () Bool)

(assert (=> b!443455 (= e!260915 (and e!260914 mapRes!19251))))

(declare-fun condMapEmpty!19251 () Bool)

(declare-fun mapDefault!19251 () ValueCell!5531)

