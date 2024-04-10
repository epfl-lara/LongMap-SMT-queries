; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42576 () Bool)

(assert start!42576)

(declare-fun b_free!12011 () Bool)

(declare-fun b_next!12011 () Bool)

(assert (=> start!42576 (= b_free!12011 (not b_next!12011))))

(declare-fun tp!42073 () Bool)

(declare-fun b_and!20491 () Bool)

(assert (=> start!42576 (= tp!42073 b_and!20491)))

(declare-fun b!475004 () Bool)

(declare-fun res!283683 () Bool)

(declare-fun e!278866 () Bool)

(assert (=> b!475004 (=> (not res!283683) (not e!278866))))

(declare-datatypes ((array!30619 0))(
  ( (array!30620 (arr!14727 (Array (_ BitVec 32) (_ BitVec 64))) (size!15079 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30619)

(declare-datatypes ((List!8999 0))(
  ( (Nil!8996) (Cons!8995 (h!9851 (_ BitVec 64)) (t!14973 List!8999)) )
))
(declare-fun arrayNoDuplicates!0 (array!30619 (_ BitVec 32) List!8999) Bool)

(assert (=> b!475004 (= res!283683 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8996))))

(declare-fun b!475005 () Bool)

(declare-fun e!278864 () Bool)

(declare-fun e!278868 () Bool)

(declare-fun mapRes!21877 () Bool)

(assert (=> b!475005 (= e!278864 (and e!278868 mapRes!21877))))

(declare-fun condMapEmpty!21877 () Bool)

(declare-datatypes ((V!19023 0))(
  ( (V!19024 (val!6764 Int)) )
))
(declare-datatypes ((ValueCell!6376 0))(
  ( (ValueCellFull!6376 (v!9057 V!19023)) (EmptyCell!6376) )
))
(declare-datatypes ((array!30621 0))(
  ( (array!30622 (arr!14728 (Array (_ BitVec 32) ValueCell!6376)) (size!15080 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30621)

(declare-fun mapDefault!21877 () ValueCell!6376)

