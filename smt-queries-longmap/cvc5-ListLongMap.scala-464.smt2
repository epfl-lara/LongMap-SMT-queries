; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8568 () Bool)

(assert start!8568)

(declare-fun b!58705 () Bool)

(declare-fun b_free!1957 () Bool)

(declare-fun b_next!1957 () Bool)

(assert (=> b!58705 (= b_free!1957 (not b_next!1957))))

(declare-fun tp!7985 () Bool)

(declare-fun b_and!3543 () Bool)

(assert (=> b!58705 (= tp!7985 b_and!3543)))

(declare-fun b!58707 () Bool)

(declare-fun b_free!1959 () Bool)

(declare-fun b_next!1959 () Bool)

(assert (=> b!58707 (= b_free!1959 (not b_next!1959))))

(declare-fun tp!7984 () Bool)

(declare-fun b_and!3545 () Bool)

(assert (=> b!58707 (= tp!7984 b_and!3545)))

(declare-fun b!58704 () Bool)

(declare-fun e!38627 () Bool)

(declare-fun e!38637 () Bool)

(declare-fun mapRes!2868 () Bool)

(assert (=> b!58704 (= e!38627 (and e!38637 mapRes!2868))))

(declare-fun condMapEmpty!2867 () Bool)

(declare-datatypes ((V!2841 0))(
  ( (V!2842 (val!1242 Int)) )
))
(declare-datatypes ((array!3717 0))(
  ( (array!3718 (arr!1779 (Array (_ BitVec 32) (_ BitVec 64))) (size!2009 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!854 0))(
  ( (ValueCellFull!854 (v!2381 V!2841)) (EmptyCell!854) )
))
(declare-datatypes ((array!3719 0))(
  ( (array!3720 (arr!1780 (Array (_ BitVec 32) ValueCell!854)) (size!2010 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!616 0))(
  ( (LongMapFixedSize!617 (defaultEntry!2042 Int) (mask!5926 (_ BitVec 32)) (extraKeys!1929 (_ BitVec 32)) (zeroValue!1958 V!2841) (minValue!1958 V!2841) (_size!357 (_ BitVec 32)) (_keys!3666 array!3717) (_values!2025 array!3719) (_vacant!357 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!616)

(declare-fun mapDefault!2868 () ValueCell!854)

