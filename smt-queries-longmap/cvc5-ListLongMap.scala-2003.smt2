; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34998 () Bool)

(assert start!34998)

(declare-fun b_free!7687 () Bool)

(declare-fun b_next!7687 () Bool)

(assert (=> start!34998 (= b_free!7687 (not b_next!7687))))

(declare-fun tp!26639 () Bool)

(declare-fun b_and!14917 () Bool)

(assert (=> start!34998 (= tp!26639 b_and!14917)))

(declare-fun mapNonEmpty!12930 () Bool)

(declare-fun mapRes!12930 () Bool)

(declare-fun tp!26640 () Bool)

(declare-fun e!214738 () Bool)

(assert (=> mapNonEmpty!12930 (= mapRes!12930 (and tp!26640 e!214738))))

(declare-fun mapKey!12930 () (_ BitVec 32))

(declare-datatypes ((V!11163 0))(
  ( (V!11164 (val!3864 Int)) )
))
(declare-datatypes ((ValueCell!3476 0))(
  ( (ValueCellFull!3476 (v!6051 V!11163)) (EmptyCell!3476) )
))
(declare-fun mapValue!12930 () ValueCell!3476)

(declare-fun mapRest!12930 () (Array (_ BitVec 32) ValueCell!3476))

(declare-datatypes ((array!18865 0))(
  ( (array!18866 (arr!8938 (Array (_ BitVec 32) ValueCell!3476)) (size!9290 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18865)

(assert (=> mapNonEmpty!12930 (= (arr!8938 _values!1525) (store mapRest!12930 mapKey!12930 mapValue!12930))))

(declare-fun b!350579 () Bool)

(declare-fun res!194302 () Bool)

(declare-fun e!214741 () Bool)

(assert (=> b!350579 (=> (not res!194302) (not e!214741))))

(declare-datatypes ((array!18867 0))(
  ( (array!18868 (arr!8939 (Array (_ BitVec 32) (_ BitVec 64))) (size!9291 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18867)

(declare-datatypes ((List!5199 0))(
  ( (Nil!5196) (Cons!5195 (h!6051 (_ BitVec 64)) (t!10337 List!5199)) )
))
(declare-fun arrayNoDuplicates!0 (array!18867 (_ BitVec 32) List!5199) Bool)

(assert (=> b!350579 (= res!194302 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5196))))

(declare-fun b!350580 () Bool)

(declare-fun res!194303 () Bool)

(assert (=> b!350580 (=> (not res!194303) (not e!214741))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350580 (= res!194303 (validKeyInArray!0 k!1348))))

(declare-fun b!350581 () Bool)

(declare-fun e!214737 () Bool)

(declare-fun tp_is_empty!7639 () Bool)

(assert (=> b!350581 (= e!214737 tp_is_empty!7639)))

(declare-fun b!350582 () Bool)

(declare-fun e!214736 () Bool)

(assert (=> b!350582 (= e!214736 (and e!214737 mapRes!12930))))

(declare-fun condMapEmpty!12930 () Bool)

(declare-fun mapDefault!12930 () ValueCell!3476)

