; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41062 () Bool)

(assert start!41062)

(declare-fun b_free!10975 () Bool)

(declare-fun b_next!10975 () Bool)

(assert (=> start!41062 (= b_free!10975 (not b_next!10975))))

(declare-fun tp!38755 () Bool)

(declare-fun b_and!19157 () Bool)

(assert (=> start!41062 (= tp!38755 b_and!19157)))

(declare-fun b!457879 () Bool)

(declare-fun res!273484 () Bool)

(declare-fun e!267378 () Bool)

(assert (=> b!457879 (=> (not res!273484) (not e!267378))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457879 (= res!273484 (bvsle from!863 i!563))))

(declare-fun b!457880 () Bool)

(declare-fun res!273483 () Bool)

(declare-fun e!267372 () Bool)

(assert (=> b!457880 (=> (not res!273483) (not e!267372))))

(declare-datatypes ((array!28427 0))(
  ( (array!28428 (arr!13656 (Array (_ BitVec 32) (_ BitVec 64))) (size!14008 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28427)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457880 (= res!273483 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!457881 () Bool)

(declare-fun e!267376 () Bool)

(declare-fun tp_is_empty!12313 () Bool)

(assert (=> b!457881 (= e!267376 tp_is_empty!12313)))

(declare-fun b!457882 () Bool)

(declare-fun res!273475 () Bool)

(assert (=> b!457882 (=> (not res!273475) (not e!267372))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17523 0))(
  ( (V!17524 (val!6201 Int)) )
))
(declare-datatypes ((ValueCell!5813 0))(
  ( (ValueCellFull!5813 (v!8471 V!17523)) (EmptyCell!5813) )
))
(declare-datatypes ((array!28429 0))(
  ( (array!28430 (arr!13657 (Array (_ BitVec 32) ValueCell!5813)) (size!14009 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28429)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!457882 (= res!273475 (and (= (size!14009 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14008 _keys!709) (size!14009 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457883 () Bool)

(declare-fun res!273476 () Bool)

(assert (=> b!457883 (=> (not res!273476) (not e!267372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28427 (_ BitVec 32)) Bool)

(assert (=> b!457883 (= res!273476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457884 () Bool)

(declare-fun e!267374 () Bool)

(declare-fun mapRes!20113 () Bool)

(assert (=> b!457884 (= e!267374 (and e!267376 mapRes!20113))))

(declare-fun condMapEmpty!20113 () Bool)

(declare-fun mapDefault!20113 () ValueCell!5813)

