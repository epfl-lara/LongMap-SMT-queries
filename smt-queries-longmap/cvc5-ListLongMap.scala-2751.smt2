; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40358 () Bool)

(assert start!40358)

(declare-fun b!443327 () Bool)

(declare-fun e!260863 () Bool)

(declare-fun tp_is_empty!11743 () Bool)

(assert (=> b!443327 (= e!260863 tp_is_empty!11743)))

(declare-fun b!443328 () Bool)

(declare-fun res!262688 () Bool)

(declare-fun e!260862 () Bool)

(assert (=> b!443328 (=> (not res!262688) (not e!260862))))

(declare-datatypes ((array!27299 0))(
  ( (array!27300 (arr!13097 (Array (_ BitVec 32) (_ BitVec 64))) (size!13449 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27299)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16763 0))(
  ( (V!16764 (val!5916 Int)) )
))
(declare-datatypes ((ValueCell!5528 0))(
  ( (ValueCellFull!5528 (v!8167 V!16763)) (EmptyCell!5528) )
))
(declare-datatypes ((array!27301 0))(
  ( (array!27302 (arr!13098 (Array (_ BitVec 32) ValueCell!5528)) (size!13450 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27301)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!443328 (= res!262688 (and (= (size!13450 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13449 _keys!709) (size!13450 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443329 () Bool)

(declare-fun res!262681 () Bool)

(assert (=> b!443329 (=> (not res!262681) (not e!260862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27299 (_ BitVec 32)) Bool)

(assert (=> b!443329 (= res!262681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443330 () Bool)

(declare-fun e!260860 () Bool)

(assert (=> b!443330 (= e!260860 tp_is_empty!11743)))

(declare-fun b!443331 () Bool)

(declare-fun res!262682 () Bool)

(assert (=> b!443331 (=> (not res!262682) (not e!260862))))

(declare-datatypes ((List!7853 0))(
  ( (Nil!7850) (Cons!7849 (h!8705 (_ BitVec 64)) (t!13611 List!7853)) )
))
(declare-fun arrayNoDuplicates!0 (array!27299 (_ BitVec 32) List!7853) Bool)

(assert (=> b!443331 (= res!262682 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7850))))

(declare-fun b!443332 () Bool)

(declare-fun res!262684 () Bool)

(assert (=> b!443332 (=> (not res!262684) (not e!260862))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443332 (= res!262684 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!19242 () Bool)

(declare-fun mapRes!19242 () Bool)

(assert (=> mapIsEmpty!19242 mapRes!19242))

(declare-fun b!443333 () Bool)

(declare-fun res!262689 () Bool)

(assert (=> b!443333 (=> (not res!262689) (not e!260862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443333 (= res!262689 (validMask!0 mask!1025))))

(declare-fun b!443334 () Bool)

(declare-fun res!262686 () Bool)

(assert (=> b!443334 (=> (not res!262686) (not e!260862))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443334 (= res!262686 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13449 _keys!709))))))

(declare-fun b!443335 () Bool)

(declare-fun res!262687 () Bool)

(assert (=> b!443335 (=> (not res!262687) (not e!260862))))

(declare-fun arrayContainsKey!0 (array!27299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443335 (= res!262687 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!443336 () Bool)

(declare-fun e!260864 () Bool)

(assert (=> b!443336 (= e!260862 e!260864)))

(declare-fun res!262683 () Bool)

(assert (=> b!443336 (=> (not res!262683) (not e!260864))))

(declare-fun lt!203320 () array!27299)

(assert (=> b!443336 (= res!262683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203320 mask!1025))))

(assert (=> b!443336 (= lt!203320 (array!27300 (store (arr!13097 _keys!709) i!563 k!794) (size!13449 _keys!709)))))

(declare-fun res!262690 () Bool)

(assert (=> start!40358 (=> (not res!262690) (not e!260862))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40358 (= res!262690 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13449 _keys!709))))))

(assert (=> start!40358 e!260862))

(assert (=> start!40358 true))

(declare-fun e!260859 () Bool)

(declare-fun array_inv!9500 (array!27301) Bool)

(assert (=> start!40358 (and (array_inv!9500 _values!549) e!260859)))

(declare-fun array_inv!9501 (array!27299) Bool)

(assert (=> start!40358 (array_inv!9501 _keys!709)))

(declare-fun b!443337 () Bool)

(declare-fun res!262685 () Bool)

(assert (=> b!443337 (=> (not res!262685) (not e!260862))))

(assert (=> b!443337 (= res!262685 (or (= (select (arr!13097 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13097 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443338 () Bool)

(assert (=> b!443338 (= e!260864 false)))

(declare-fun lt!203321 () Bool)

(assert (=> b!443338 (= lt!203321 (arrayNoDuplicates!0 lt!203320 #b00000000000000000000000000000000 Nil!7850))))

(declare-fun mapNonEmpty!19242 () Bool)

(declare-fun tp!37224 () Bool)

(assert (=> mapNonEmpty!19242 (= mapRes!19242 (and tp!37224 e!260863))))

(declare-fun mapKey!19242 () (_ BitVec 32))

(declare-fun mapRest!19242 () (Array (_ BitVec 32) ValueCell!5528))

(declare-fun mapValue!19242 () ValueCell!5528)

(assert (=> mapNonEmpty!19242 (= (arr!13098 _values!549) (store mapRest!19242 mapKey!19242 mapValue!19242))))

(declare-fun b!443339 () Bool)

(assert (=> b!443339 (= e!260859 (and e!260860 mapRes!19242))))

(declare-fun condMapEmpty!19242 () Bool)

(declare-fun mapDefault!19242 () ValueCell!5528)

