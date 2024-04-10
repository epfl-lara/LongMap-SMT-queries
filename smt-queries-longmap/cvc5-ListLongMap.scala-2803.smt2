; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40706 () Bool)

(assert start!40706)

(declare-fun b_free!10717 () Bool)

(declare-fun b_next!10717 () Bool)

(assert (=> start!40706 (= b_free!10717 (not b_next!10717))))

(declare-fun tp!37971 () Bool)

(declare-fun b_and!18725 () Bool)

(assert (=> start!40706 (= tp!37971 b_and!18725)))

(declare-fun b!450398 () Bool)

(declare-fun e!263941 () Bool)

(declare-datatypes ((V!17179 0))(
  ( (V!17180 (val!6072 Int)) )
))
(declare-datatypes ((tuple2!7974 0))(
  ( (tuple2!7975 (_1!3998 (_ BitVec 64)) (_2!3998 V!17179)) )
))
(declare-datatypes ((List!8042 0))(
  ( (Nil!8039) (Cons!8038 (h!8894 tuple2!7974) (t!13804 List!8042)) )
))
(declare-datatypes ((ListLongMap!6887 0))(
  ( (ListLongMap!6888 (toList!3459 List!8042)) )
))
(declare-fun call!29743 () ListLongMap!6887)

(declare-fun call!29744 () ListLongMap!6887)

(assert (=> b!450398 (= e!263941 (= call!29743 call!29744))))

(declare-fun b!450399 () Bool)

(declare-fun e!263943 () Bool)

(declare-fun e!263945 () Bool)

(assert (=> b!450399 (= e!263943 e!263945)))

(declare-fun res!268074 () Bool)

(assert (=> b!450399 (=> (not res!268074) (not e!263945))))

(declare-datatypes ((array!27917 0))(
  ( (array!27918 (arr!13404 (Array (_ BitVec 32) (_ BitVec 64))) (size!13756 (_ BitVec 32))) )
))
(declare-fun lt!204599 () array!27917)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27917 (_ BitVec 32)) Bool)

(assert (=> b!450399 (= res!268074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204599 mask!1025))))

(declare-fun _keys!709 () array!27917)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450399 (= lt!204599 (array!27918 (store (arr!13404 _keys!709) i!563 k!794) (size!13756 _keys!709)))))

(declare-fun b!450400 () Bool)

(declare-fun res!268064 () Bool)

(assert (=> b!450400 (=> (not res!268064) (not e!263943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450400 (= res!268064 (validMask!0 mask!1025))))

(declare-fun b!450401 () Bool)

(declare-fun res!268071 () Bool)

(assert (=> b!450401 (=> (not res!268071) (not e!263943))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5684 0))(
  ( (ValueCellFull!5684 (v!8327 V!17179)) (EmptyCell!5684) )
))
(declare-datatypes ((array!27919 0))(
  ( (array!27920 (arr!13405 (Array (_ BitVec 32) ValueCell!5684)) (size!13757 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27919)

(assert (=> b!450401 (= res!268071 (and (= (size!13757 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13756 _keys!709) (size!13757 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450402 () Bool)

(declare-fun e!263942 () Bool)

(declare-fun e!263939 () Bool)

(declare-fun mapRes!19716 () Bool)

(assert (=> b!450402 (= e!263942 (and e!263939 mapRes!19716))))

(declare-fun condMapEmpty!19716 () Bool)

(declare-fun mapDefault!19716 () ValueCell!5684)

