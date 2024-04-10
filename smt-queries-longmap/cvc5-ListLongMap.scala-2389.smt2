; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37796 () Bool)

(assert start!37796)

(declare-fun b_free!8899 () Bool)

(declare-fun b_next!8899 () Bool)

(assert (=> start!37796 (= b_free!8899 (not b_next!8899))))

(declare-fun tp!31449 () Bool)

(declare-fun b_and!16141 () Bool)

(assert (=> start!37796 (= tp!31449 b_and!16141)))

(declare-fun b!388235 () Bool)

(declare-fun res!221992 () Bool)

(declare-fun e!235262 () Bool)

(assert (=> b!388235 (=> (not res!221992) (not e!235262))))

(declare-datatypes ((array!23033 0))(
  ( (array!23034 (arr!10985 (Array (_ BitVec 32) (_ BitVec 64))) (size!11337 (_ BitVec 32))) )
))
(declare-fun lt!182262 () array!23033)

(declare-datatypes ((List!6346 0))(
  ( (Nil!6343) (Cons!6342 (h!7198 (_ BitVec 64)) (t!11496 List!6346)) )
))
(declare-fun arrayNoDuplicates!0 (array!23033 (_ BitVec 32) List!6346) Bool)

(assert (=> b!388235 (= res!221992 (arrayNoDuplicates!0 lt!182262 #b00000000000000000000000000000000 Nil!6343))))

(declare-fun b!388236 () Bool)

(declare-fun res!221987 () Bool)

(declare-fun e!235259 () Bool)

(assert (=> b!388236 (=> (not res!221987) (not e!235259))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!23033)

(assert (=> b!388236 (= res!221987 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11337 _keys!658))))))

(declare-fun b!388237 () Bool)

(declare-fun res!221990 () Bool)

(assert (=> b!388237 (=> (not res!221990) (not e!235259))))

(assert (=> b!388237 (= res!221990 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6343))))

(declare-fun b!388238 () Bool)

(declare-fun e!235258 () Bool)

(declare-fun tp_is_empty!9571 () Bool)

(assert (=> b!388238 (= e!235258 tp_is_empty!9571)))

(declare-fun b!388240 () Bool)

(declare-fun e!235261 () Bool)

(assert (=> b!388240 (= e!235261 tp_is_empty!9571)))

(declare-fun b!388241 () Bool)

(declare-fun res!221996 () Bool)

(assert (=> b!388241 (=> (not res!221996) (not e!235259))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388241 (= res!221996 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!15921 () Bool)

(declare-fun mapRes!15921 () Bool)

(declare-fun tp!31448 () Bool)

(assert (=> mapNonEmpty!15921 (= mapRes!15921 (and tp!31448 e!235261))))

(declare-fun mapKey!15921 () (_ BitVec 32))

(declare-datatypes ((V!13867 0))(
  ( (V!13868 (val!4830 Int)) )
))
(declare-datatypes ((ValueCell!4442 0))(
  ( (ValueCellFull!4442 (v!7027 V!13867)) (EmptyCell!4442) )
))
(declare-fun mapRest!15921 () (Array (_ BitVec 32) ValueCell!4442))

(declare-fun mapValue!15921 () ValueCell!4442)

(declare-datatypes ((array!23035 0))(
  ( (array!23036 (arr!10986 (Array (_ BitVec 32) ValueCell!4442)) (size!11338 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23035)

(assert (=> mapNonEmpty!15921 (= (arr!10986 _values!506) (store mapRest!15921 mapKey!15921 mapValue!15921))))

(declare-fun b!388242 () Bool)

(declare-fun res!221994 () Bool)

(assert (=> b!388242 (=> (not res!221994) (not e!235259))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!388242 (= res!221994 (and (= (size!11338 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11337 _keys!658) (size!11338 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388243 () Bool)

(declare-fun e!235257 () Bool)

(assert (=> b!388243 (= e!235257 (and e!235258 mapRes!15921))))

(declare-fun condMapEmpty!15921 () Bool)

(declare-fun mapDefault!15921 () ValueCell!4442)

