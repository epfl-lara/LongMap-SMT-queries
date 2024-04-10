; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19980 () Bool)

(assert start!19980)

(declare-fun b!195865 () Bool)

(declare-fun e!128923 () Bool)

(declare-fun tp_is_empty!4525 () Bool)

(assert (=> b!195865 (= e!128923 tp_is_empty!4525)))

(declare-fun b!195866 () Bool)

(declare-fun res!92413 () Bool)

(declare-fun e!128922 () Bool)

(assert (=> b!195866 (=> (not res!92413) (not e!128922))))

(declare-datatypes ((array!8307 0))(
  ( (array!8308 (arr!3907 (Array (_ BitVec 32) (_ BitVec 64))) (size!4232 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8307)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8307 (_ BitVec 32)) Bool)

(assert (=> b!195866 (= res!92413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!195867 () Bool)

(assert (=> b!195867 (= e!128922 (and (bvsle #b00000000000000000000000000000000 (size!4232 _keys!825)) (bvsge (size!4232 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun b!195868 () Bool)

(declare-fun e!128921 () Bool)

(assert (=> b!195868 (= e!128921 tp_is_empty!4525)))

(declare-fun b!195869 () Bool)

(declare-fun res!92414 () Bool)

(assert (=> b!195869 (=> (not res!92414) (not e!128922))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5681 0))(
  ( (V!5682 (val!2307 Int)) )
))
(declare-datatypes ((ValueCell!1919 0))(
  ( (ValueCellFull!1919 (v!4276 V!5681)) (EmptyCell!1919) )
))
(declare-datatypes ((array!8309 0))(
  ( (array!8310 (arr!3908 (Array (_ BitVec 32) ValueCell!1919)) (size!4233 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8309)

(assert (=> b!195869 (= res!92414 (and (= (size!4233 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4232 _keys!825) (size!4233 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!195870 () Bool)

(declare-fun e!128925 () Bool)

(declare-fun mapRes!7847 () Bool)

(assert (=> b!195870 (= e!128925 (and e!128921 mapRes!7847))))

(declare-fun condMapEmpty!7847 () Bool)

(declare-fun mapDefault!7847 () ValueCell!1919)

