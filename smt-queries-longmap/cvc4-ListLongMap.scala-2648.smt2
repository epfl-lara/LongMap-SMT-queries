; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39710 () Bool)

(assert start!39710)

(declare-fun b_free!9977 () Bool)

(declare-fun b_next!9977 () Bool)

(assert (=> start!39710 (= b_free!9977 (not b_next!9977))))

(declare-fun tp!35459 () Bool)

(declare-fun b_and!17633 () Bool)

(assert (=> start!39710 (= tp!35459 b_and!17633)))

(declare-fun b!426863 () Bool)

(declare-fun res!250249 () Bool)

(declare-fun e!253190 () Bool)

(assert (=> b!426863 (=> (not res!250249) (not e!253190))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26097 0))(
  ( (array!26098 (arr!12498 (Array (_ BitVec 32) (_ BitVec 64))) (size!12850 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26097)

(assert (=> b!426863 (= res!250249 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12850 _keys!709))))))

(declare-fun b!426864 () Bool)

(declare-fun res!250253 () Bool)

(assert (=> b!426864 (=> (not res!250253) (not e!253190))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!15943 0))(
  ( (V!15944 (val!5609 Int)) )
))
(declare-datatypes ((ValueCell!5221 0))(
  ( (ValueCellFull!5221 (v!7856 V!15943)) (EmptyCell!5221) )
))
(declare-datatypes ((array!26099 0))(
  ( (array!26100 (arr!12499 (Array (_ BitVec 32) ValueCell!5221)) (size!12851 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26099)

(assert (=> b!426864 (= res!250253 (and (= (size!12851 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12850 _keys!709) (size!12851 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426865 () Bool)

(declare-fun res!250254 () Bool)

(declare-fun e!253191 () Bool)

(assert (=> b!426865 (=> (not res!250254) (not e!253191))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!426865 (= res!250254 (bvsle from!863 i!563))))

(declare-fun b!426866 () Bool)

(declare-fun res!250252 () Bool)

(assert (=> b!426866 (=> (not res!250252) (not e!253190))))

(declare-datatypes ((List!7387 0))(
  ( (Nil!7384) (Cons!7383 (h!8239 (_ BitVec 64)) (t!12831 List!7387)) )
))
(declare-fun arrayNoDuplicates!0 (array!26097 (_ BitVec 32) List!7387) Bool)

(assert (=> b!426866 (= res!250252 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7384))))

(declare-fun b!426867 () Bool)

(declare-fun e!253187 () Bool)

(declare-fun e!253188 () Bool)

(declare-fun mapRes!18315 () Bool)

(assert (=> b!426867 (= e!253187 (and e!253188 mapRes!18315))))

(declare-fun condMapEmpty!18315 () Bool)

(declare-fun mapDefault!18315 () ValueCell!5221)

