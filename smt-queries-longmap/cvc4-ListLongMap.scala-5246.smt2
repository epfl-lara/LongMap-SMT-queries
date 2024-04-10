; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70580 () Bool)

(assert start!70580)

(declare-fun b_free!12887 () Bool)

(declare-fun b_next!12887 () Bool)

(assert (=> start!70580 (= b_free!12887 (not b_next!12887))))

(declare-fun tp!45397 () Bool)

(declare-fun b_and!21729 () Bool)

(assert (=> start!70580 (= tp!45397 b_and!21729)))

(declare-fun b!819926 () Bool)

(declare-fun res!559480 () Bool)

(declare-fun e!455430 () Bool)

(assert (=> b!819926 (=> (not res!559480) (not e!455430))))

(declare-datatypes ((array!45390 0))(
  ( (array!45391 (arr!21748 (Array (_ BitVec 32) (_ BitVec 64))) (size!22169 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45390)

(declare-datatypes ((List!15496 0))(
  ( (Nil!15493) (Cons!15492 (h!16621 (_ BitVec 64)) (t!21827 List!15496)) )
))
(declare-fun arrayNoDuplicates!0 (array!45390 (_ BitVec 32) List!15496) Bool)

(assert (=> b!819926 (= res!559480 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15493))))

(declare-fun b!819928 () Bool)

(declare-fun e!455435 () Bool)

(declare-fun e!455432 () Bool)

(declare-fun mapRes!23497 () Bool)

(assert (=> b!819928 (= e!455435 (and e!455432 mapRes!23497))))

(declare-fun condMapEmpty!23497 () Bool)

(declare-datatypes ((V!24463 0))(
  ( (V!24464 (val!7346 Int)) )
))
(declare-datatypes ((ValueCell!6883 0))(
  ( (ValueCellFull!6883 (v!9776 V!24463)) (EmptyCell!6883) )
))
(declare-datatypes ((array!45392 0))(
  ( (array!45393 (arr!21749 (Array (_ BitVec 32) ValueCell!6883)) (size!22170 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45392)

(declare-fun mapDefault!23497 () ValueCell!6883)

