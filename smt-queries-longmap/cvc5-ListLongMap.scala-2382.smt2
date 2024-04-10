; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37754 () Bool)

(assert start!37754)

(declare-fun b_free!8857 () Bool)

(declare-fun b_next!8857 () Bool)

(assert (=> start!37754 (= b_free!8857 (not b_next!8857))))

(declare-fun tp!31323 () Bool)

(declare-fun b_and!16099 () Bool)

(assert (=> start!37754 (= tp!31323 b_and!16099)))

(declare-fun b!387416 () Bool)

(declare-fun res!221357 () Bool)

(declare-fun e!234881 () Bool)

(assert (=> b!387416 (=> (not res!221357) (not e!234881))))

(declare-datatypes ((array!22949 0))(
  ( (array!22950 (arr!10943 (Array (_ BitVec 32) (_ BitVec 64))) (size!11295 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22949)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22949 (_ BitVec 32)) Bool)

(assert (=> b!387416 (= res!221357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387417 () Bool)

(declare-fun res!221359 () Bool)

(declare-fun e!234880 () Bool)

(assert (=> b!387417 (=> (not res!221359) (not e!234880))))

(declare-fun lt!182034 () array!22949)

(declare-datatypes ((List!6314 0))(
  ( (Nil!6311) (Cons!6310 (h!7166 (_ BitVec 64)) (t!11464 List!6314)) )
))
(declare-fun arrayNoDuplicates!0 (array!22949 (_ BitVec 32) List!6314) Bool)

(assert (=> b!387417 (= res!221359 (arrayNoDuplicates!0 lt!182034 #b00000000000000000000000000000000 Nil!6311))))

(declare-fun b!387418 () Bool)

(declare-fun e!234883 () Bool)

(declare-fun e!234882 () Bool)

(declare-fun mapRes!15858 () Bool)

(assert (=> b!387418 (= e!234883 (and e!234882 mapRes!15858))))

(declare-fun condMapEmpty!15858 () Bool)

(declare-datatypes ((V!13811 0))(
  ( (V!13812 (val!4809 Int)) )
))
(declare-datatypes ((ValueCell!4421 0))(
  ( (ValueCellFull!4421 (v!7006 V!13811)) (EmptyCell!4421) )
))
(declare-datatypes ((array!22951 0))(
  ( (array!22952 (arr!10944 (Array (_ BitVec 32) ValueCell!4421)) (size!11296 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22951)

(declare-fun mapDefault!15858 () ValueCell!4421)

