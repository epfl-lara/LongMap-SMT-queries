; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37206 () Bool)

(assert start!37206)

(declare-fun b_free!8333 () Bool)

(declare-fun b_next!8333 () Bool)

(assert (=> start!37206 (= b_free!8333 (not b_next!8333))))

(declare-fun tp!29714 () Bool)

(declare-fun b_and!15575 () Bool)

(assert (=> start!37206 (= tp!29714 b_and!15575)))

(declare-fun b!375936 () Bool)

(declare-fun res!212349 () Bool)

(declare-fun e!228998 () Bool)

(assert (=> b!375936 (=> (not res!212349) (not e!228998))))

(declare-datatypes ((array!21895 0))(
  ( (array!21896 (arr!10416 (Array (_ BitVec 32) (_ BitVec 64))) (size!10768 (_ BitVec 32))) )
))
(declare-fun lt!174204 () array!21895)

(declare-datatypes ((List!5879 0))(
  ( (Nil!5876) (Cons!5875 (h!6731 (_ BitVec 64)) (t!11029 List!5879)) )
))
(declare-fun arrayNoDuplicates!0 (array!21895 (_ BitVec 32) List!5879) Bool)

(assert (=> b!375936 (= res!212349 (arrayNoDuplicates!0 lt!174204 #b00000000000000000000000000000000 Nil!5876))))

(declare-fun b!375937 () Bool)

(declare-fun res!212343 () Bool)

(declare-fun e!228991 () Bool)

(assert (=> b!375937 (=> (not res!212343) (not e!228991))))

(declare-fun _keys!658 () array!21895)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21895 (_ BitVec 32)) Bool)

(assert (=> b!375937 (= res!212343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375938 () Bool)

(declare-fun res!212347 () Bool)

(assert (=> b!375938 (=> (not res!212347) (not e!228991))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13079 0))(
  ( (V!13080 (val!4535 Int)) )
))
(declare-datatypes ((ValueCell!4147 0))(
  ( (ValueCellFull!4147 (v!6732 V!13079)) (EmptyCell!4147) )
))
(declare-datatypes ((array!21897 0))(
  ( (array!21898 (arr!10417 (Array (_ BitVec 32) ValueCell!4147)) (size!10769 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21897)

(assert (=> b!375938 (= res!212347 (and (= (size!10769 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10768 _keys!658) (size!10769 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!212348 () Bool)

(assert (=> start!37206 (=> (not res!212348) (not e!228991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37206 (= res!212348 (validMask!0 mask!970))))

(assert (=> start!37206 e!228991))

(declare-fun e!228996 () Bool)

(declare-fun array_inv!7678 (array!21897) Bool)

(assert (=> start!37206 (and (array_inv!7678 _values!506) e!228996)))

(assert (=> start!37206 tp!29714))

(assert (=> start!37206 true))

(declare-fun tp_is_empty!8981 () Bool)

(assert (=> start!37206 tp_is_empty!8981))

(declare-fun array_inv!7679 (array!21895) Bool)

(assert (=> start!37206 (array_inv!7679 _keys!658)))

(declare-fun b!375939 () Bool)

(declare-fun e!228992 () Bool)

(declare-fun mapRes!15036 () Bool)

(assert (=> b!375939 (= e!228996 (and e!228992 mapRes!15036))))

(declare-fun condMapEmpty!15036 () Bool)

(declare-fun mapDefault!15036 () ValueCell!4147)

