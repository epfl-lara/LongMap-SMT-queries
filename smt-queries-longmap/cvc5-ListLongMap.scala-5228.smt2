; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70432 () Bool)

(assert start!70432)

(declare-fun b_free!12775 () Bool)

(declare-fun b_next!12775 () Bool)

(assert (=> start!70432 (= b_free!12775 (not b_next!12775))))

(declare-fun tp!45054 () Bool)

(declare-fun b_and!21595 () Bool)

(assert (=> start!70432 (= tp!45054 b_and!21595)))

(declare-fun b!818115 () Bool)

(declare-fun res!558366 () Bool)

(declare-fun e!454081 () Bool)

(assert (=> b!818115 (=> (not res!558366) (not e!454081))))

(declare-datatypes ((array!45170 0))(
  ( (array!45171 (arr!21640 (Array (_ BitVec 32) (_ BitVec 64))) (size!22061 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45170)

(declare-datatypes ((List!15411 0))(
  ( (Nil!15408) (Cons!15407 (h!16536 (_ BitVec 64)) (t!21738 List!15411)) )
))
(declare-fun arrayNoDuplicates!0 (array!45170 (_ BitVec 32) List!15411) Bool)

(assert (=> b!818115 (= res!558366 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15408))))

(declare-fun b!818116 () Bool)

(declare-fun e!454082 () Bool)

(declare-fun e!454080 () Bool)

(declare-fun mapRes!23323 () Bool)

(assert (=> b!818116 (= e!454082 (and e!454080 mapRes!23323))))

(declare-fun condMapEmpty!23323 () Bool)

(declare-datatypes ((V!24315 0))(
  ( (V!24316 (val!7290 Int)) )
))
(declare-datatypes ((ValueCell!6827 0))(
  ( (ValueCellFull!6827 (v!9719 V!24315)) (EmptyCell!6827) )
))
(declare-datatypes ((array!45172 0))(
  ( (array!45173 (arr!21641 (Array (_ BitVec 32) ValueCell!6827)) (size!22062 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45172)

(declare-fun mapDefault!23323 () ValueCell!6827)

