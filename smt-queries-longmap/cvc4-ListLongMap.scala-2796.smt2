; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40668 () Bool)

(assert start!40668)

(declare-fun b_free!10679 () Bool)

(declare-fun b_next!10679 () Bool)

(assert (=> start!40668 (= b_free!10679 (not b_next!10679))))

(declare-fun tp!37857 () Bool)

(declare-fun b_and!18687 () Bool)

(assert (=> start!40668 (= tp!37857 b_and!18687)))

(declare-fun b!449447 () Bool)

(declare-fun res!267349 () Bool)

(declare-fun e!263533 () Bool)

(assert (=> b!449447 (=> (not res!267349) (not e!263533))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449447 (= res!267349 (bvsle from!863 i!563))))

(declare-fun b!449448 () Bool)

(declare-fun res!267351 () Bool)

(declare-fun e!263530 () Bool)

(assert (=> b!449448 (=> (not res!267351) (not e!263530))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449448 (= res!267351 (validMask!0 mask!1025))))

(declare-fun b!449449 () Bool)

(declare-fun res!267350 () Bool)

(assert (=> b!449449 (=> (not res!267350) (not e!263530))))

(declare-datatypes ((array!27841 0))(
  ( (array!27842 (arr!13366 (Array (_ BitVec 32) (_ BitVec 64))) (size!13718 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27841)

(declare-datatypes ((List!8015 0))(
  ( (Nil!8012) (Cons!8011 (h!8867 (_ BitVec 64)) (t!13777 List!8015)) )
))
(declare-fun arrayNoDuplicates!0 (array!27841 (_ BitVec 32) List!8015) Bool)

(assert (=> b!449449 (= res!267350 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8012))))

(declare-fun b!449450 () Bool)

(declare-fun res!267344 () Bool)

(assert (=> b!449450 (=> (not res!267344) (not e!263530))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449450 (= res!267344 (validKeyInArray!0 k!794))))

(declare-fun b!449451 () Bool)

(declare-fun res!267341 () Bool)

(assert (=> b!449451 (=> (not res!267341) (not e!263530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27841 (_ BitVec 32)) Bool)

(assert (=> b!449451 (= res!267341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449452 () Bool)

(declare-fun res!267346 () Bool)

(assert (=> b!449452 (=> (not res!267346) (not e!263530))))

(assert (=> b!449452 (= res!267346 (or (= (select (arr!13366 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13366 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449453 () Bool)

(declare-fun res!267343 () Bool)

(assert (=> b!449453 (=> (not res!267343) (not e!263530))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17127 0))(
  ( (V!17128 (val!6053 Int)) )
))
(declare-datatypes ((ValueCell!5665 0))(
  ( (ValueCellFull!5665 (v!8308 V!17127)) (EmptyCell!5665) )
))
(declare-datatypes ((array!27843 0))(
  ( (array!27844 (arr!13367 (Array (_ BitVec 32) ValueCell!5665)) (size!13719 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27843)

(assert (=> b!449453 (= res!267343 (and (= (size!13719 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13718 _keys!709) (size!13719 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449454 () Bool)

(declare-fun e!263531 () Bool)

(declare-fun e!263529 () Bool)

(declare-fun mapRes!19659 () Bool)

(assert (=> b!449454 (= e!263531 (and e!263529 mapRes!19659))))

(declare-fun condMapEmpty!19659 () Bool)

(declare-fun mapDefault!19659 () ValueCell!5665)

