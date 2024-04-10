; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36782 () Bool)

(assert start!36782)

(declare-fun b!367290 () Bool)

(declare-fun res!205612 () Bool)

(declare-fun e!224792 () Bool)

(assert (=> b!367290 (=> (not res!205612) (not e!224792))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12515 0))(
  ( (V!12516 (val!4323 Int)) )
))
(declare-datatypes ((ValueCell!3935 0))(
  ( (ValueCellFull!3935 (v!6520 V!12515)) (EmptyCell!3935) )
))
(declare-datatypes ((array!21073 0))(
  ( (array!21074 (arr!10005 (Array (_ BitVec 32) ValueCell!3935)) (size!10357 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21073)

(declare-datatypes ((array!21075 0))(
  ( (array!21076 (arr!10006 (Array (_ BitVec 32) (_ BitVec 64))) (size!10358 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21075)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367290 (= res!205612 (and (= (size!10357 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10358 _keys!658) (size!10357 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!205613 () Bool)

(assert (=> start!36782 (=> (not res!205613) (not e!224792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36782 (= res!205613 (validMask!0 mask!970))))

(assert (=> start!36782 e!224792))

(assert (=> start!36782 true))

(declare-fun e!224795 () Bool)

(declare-fun array_inv!7398 (array!21073) Bool)

(assert (=> start!36782 (and (array_inv!7398 _values!506) e!224795)))

(declare-fun array_inv!7399 (array!21075) Bool)

(assert (=> start!36782 (array_inv!7399 _keys!658)))

(declare-fun b!367291 () Bool)

(declare-fun e!224790 () Bool)

(declare-fun mapRes!14400 () Bool)

(assert (=> b!367291 (= e!224795 (and e!224790 mapRes!14400))))

(declare-fun condMapEmpty!14400 () Bool)

(declare-fun mapDefault!14400 () ValueCell!3935)

