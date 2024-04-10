; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39728 () Bool)

(assert start!39728)

(declare-fun b_free!9995 () Bool)

(declare-fun b_next!9995 () Bool)

(assert (=> start!39728 (= b_free!9995 (not b_next!9995))))

(declare-fun tp!35513 () Bool)

(declare-fun b_and!17651 () Bool)

(assert (=> start!39728 (= tp!35513 b_and!17651)))

(declare-fun b!427303 () Bool)

(declare-fun res!250608 () Bool)

(declare-fun e!253389 () Bool)

(assert (=> b!427303 (=> (not res!250608) (not e!253389))))

(declare-datatypes ((array!26131 0))(
  ( (array!26132 (arr!12515 (Array (_ BitVec 32) (_ BitVec 64))) (size!12867 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26131)

(declare-datatypes ((List!7398 0))(
  ( (Nil!7395) (Cons!7394 (h!8250 (_ BitVec 64)) (t!12842 List!7398)) )
))
(declare-fun arrayNoDuplicates!0 (array!26131 (_ BitVec 32) List!7398) Bool)

(assert (=> b!427303 (= res!250608 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7395))))

(declare-fun res!250602 () Bool)

(assert (=> start!39728 (=> (not res!250602) (not e!253389))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39728 (= res!250602 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12867 _keys!709))))))

(assert (=> start!39728 e!253389))

(declare-fun tp_is_empty!11147 () Bool)

(assert (=> start!39728 tp_is_empty!11147))

(assert (=> start!39728 tp!35513))

(assert (=> start!39728 true))

(declare-datatypes ((V!15967 0))(
  ( (V!15968 (val!5618 Int)) )
))
(declare-datatypes ((ValueCell!5230 0))(
  ( (ValueCellFull!5230 (v!7865 V!15967)) (EmptyCell!5230) )
))
(declare-datatypes ((array!26133 0))(
  ( (array!26134 (arr!12516 (Array (_ BitVec 32) ValueCell!5230)) (size!12868 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26133)

(declare-fun e!253383 () Bool)

(declare-fun array_inv!9120 (array!26133) Bool)

(assert (=> start!39728 (and (array_inv!9120 _values!549) e!253383)))

(declare-fun array_inv!9121 (array!26131) Bool)

(assert (=> start!39728 (array_inv!9121 _keys!709)))

(declare-fun b!427304 () Bool)

(declare-fun e!253382 () Bool)

(declare-fun e!253387 () Bool)

(assert (=> b!427304 (= e!253382 (not e!253387))))

(declare-fun res!250614 () Bool)

(assert (=> b!427304 (=> res!250614 e!253387)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427304 (= res!250614 (not (validKeyInArray!0 (select (arr!12515 _keys!709) from!863))))))

(declare-fun minValue!515 () V!15967)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15967)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!15967)

(declare-fun lt!195232 () array!26131)

(declare-fun defaultEntry!557 () Int)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!195233 () array!26133)

(declare-datatypes ((tuple2!7382 0))(
  ( (tuple2!7383 (_1!3702 (_ BitVec 64)) (_2!3702 V!15967)) )
))
(declare-datatypes ((List!7399 0))(
  ( (Nil!7396) (Cons!7395 (h!8251 tuple2!7382) (t!12843 List!7399)) )
))
(declare-datatypes ((ListLongMap!6295 0))(
  ( (ListLongMap!6296 (toList!3163 List!7399)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1367 (array!26131 array!26133 (_ BitVec 32) (_ BitVec 32) V!15967 V!15967 (_ BitVec 32) Int) ListLongMap!6295)

(declare-fun +!1318 (ListLongMap!6295 tuple2!7382) ListLongMap!6295)

(assert (=> b!427304 (= (getCurrentListMapNoExtraKeys!1367 lt!195232 lt!195233 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1318 (getCurrentListMapNoExtraKeys!1367 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7383 k!794 v!412)))))

(declare-datatypes ((Unit!12538 0))(
  ( (Unit!12539) )
))
(declare-fun lt!195230 () Unit!12538)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!513 (array!26131 array!26133 (_ BitVec 32) (_ BitVec 32) V!15967 V!15967 (_ BitVec 32) (_ BitVec 64) V!15967 (_ BitVec 32) Int) Unit!12538)

(assert (=> b!427304 (= lt!195230 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!513 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427305 () Bool)

(declare-fun res!250604 () Bool)

(assert (=> b!427305 (=> (not res!250604) (not e!253389))))

(assert (=> b!427305 (= res!250604 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12867 _keys!709))))))

(declare-fun b!427306 () Bool)

(assert (=> b!427306 (= e!253387 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12867 _keys!709))))))

(declare-fun b!427307 () Bool)

(declare-fun e!253385 () Bool)

(assert (=> b!427307 (= e!253389 e!253385)))

(declare-fun res!250612 () Bool)

(assert (=> b!427307 (=> (not res!250612) (not e!253385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26131 (_ BitVec 32)) Bool)

(assert (=> b!427307 (= res!250612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195232 mask!1025))))

(assert (=> b!427307 (= lt!195232 (array!26132 (store (arr!12515 _keys!709) i!563 k!794) (size!12867 _keys!709)))))

(declare-fun b!427308 () Bool)

(declare-fun e!253388 () Bool)

(declare-fun mapRes!18342 () Bool)

(assert (=> b!427308 (= e!253383 (and e!253388 mapRes!18342))))

(declare-fun condMapEmpty!18342 () Bool)

(declare-fun mapDefault!18342 () ValueCell!5230)

