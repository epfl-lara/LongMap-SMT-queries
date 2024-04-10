; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36668 () Bool)

(assert start!36668)

(declare-fun b!365962 () Bool)

(declare-fun res!204641 () Bool)

(declare-fun e!224113 () Bool)

(assert (=> b!365962 (=> (not res!204641) (not e!224113))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12427 0))(
  ( (V!12428 (val!4290 Int)) )
))
(declare-datatypes ((ValueCell!3902 0))(
  ( (ValueCellFull!3902 (v!6486 V!12427)) (EmptyCell!3902) )
))
(declare-datatypes ((array!20935 0))(
  ( (array!20936 (arr!9939 (Array (_ BitVec 32) ValueCell!3902)) (size!10291 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20935)

(declare-datatypes ((array!20937 0))(
  ( (array!20938 (arr!9940 (Array (_ BitVec 32) (_ BitVec 64))) (size!10292 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20937)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365962 (= res!204641 (and (= (size!10291 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10292 _keys!658) (size!10291 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365963 () Bool)

(assert (=> b!365963 (= e!224113 false)))

(declare-fun lt!169217 () Bool)

(declare-datatypes ((List!5539 0))(
  ( (Nil!5536) (Cons!5535 (h!6391 (_ BitVec 64)) (t!10689 List!5539)) )
))
(declare-fun arrayNoDuplicates!0 (array!20937 (_ BitVec 32) List!5539) Bool)

(assert (=> b!365963 (= lt!169217 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5536))))

(declare-fun mapIsEmpty!14292 () Bool)

(declare-fun mapRes!14292 () Bool)

(assert (=> mapIsEmpty!14292 mapRes!14292))

(declare-fun b!365964 () Bool)

(declare-fun e!224115 () Bool)

(declare-fun e!224111 () Bool)

(assert (=> b!365964 (= e!224115 (and e!224111 mapRes!14292))))

(declare-fun condMapEmpty!14292 () Bool)

(declare-fun mapDefault!14292 () ValueCell!3902)

