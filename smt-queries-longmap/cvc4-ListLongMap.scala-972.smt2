; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21054 () Bool)

(assert start!21054)

(declare-fun b_free!5585 () Bool)

(declare-fun b_next!5585 () Bool)

(assert (=> start!21054 (= b_free!5585 (not b_next!5585))))

(declare-fun tp!19814 () Bool)

(declare-fun b_and!12403 () Bool)

(assert (=> start!21054 (= tp!19814 b_and!12403)))

(declare-fun b!211756 () Bool)

(declare-fun res!103468 () Bool)

(declare-fun e!137818 () Bool)

(assert (=> b!211756 (=> (not res!103468) (not e!137818))))

(declare-datatypes ((array!10095 0))(
  ( (array!10096 (arr!4792 (Array (_ BitVec 32) (_ BitVec 64))) (size!5117 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10095)

(declare-datatypes ((List!3078 0))(
  ( (Nil!3075) (Cons!3074 (h!3716 (_ BitVec 64)) (t!8021 List!3078)) )
))
(declare-fun arrayNoDuplicates!0 (array!10095 (_ BitVec 32) List!3078) Bool)

(assert (=> b!211756 (= res!103468 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3075))))

(declare-fun b!211757 () Bool)

(declare-fun e!137817 () Bool)

(declare-fun e!137819 () Bool)

(declare-fun mapRes!9257 () Bool)

(assert (=> b!211757 (= e!137817 (and e!137819 mapRes!9257))))

(declare-fun condMapEmpty!9257 () Bool)

(declare-datatypes ((V!6909 0))(
  ( (V!6910 (val!2768 Int)) )
))
(declare-datatypes ((ValueCell!2380 0))(
  ( (ValueCellFull!2380 (v!4762 V!6909)) (EmptyCell!2380) )
))
(declare-datatypes ((array!10097 0))(
  ( (array!10098 (arr!4793 (Array (_ BitVec 32) ValueCell!2380)) (size!5118 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10097)

(declare-fun mapDefault!9257 () ValueCell!2380)

