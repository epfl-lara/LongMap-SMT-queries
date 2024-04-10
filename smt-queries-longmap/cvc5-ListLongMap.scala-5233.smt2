; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70478 () Bool)

(assert start!70478)

(declare-fun b_free!12805 () Bool)

(declare-fun b_next!12805 () Bool)

(assert (=> start!70478 (= b_free!12805 (not b_next!12805))))

(declare-fun tp!45147 () Bool)

(declare-fun b_and!21635 () Bool)

(assert (=> start!70478 (= tp!45147 b_and!21635)))

(declare-fun mapNonEmpty!23371 () Bool)

(declare-fun mapRes!23371 () Bool)

(declare-fun tp!45148 () Bool)

(declare-fun e!454448 () Bool)

(assert (=> mapNonEmpty!23371 (= mapRes!23371 (and tp!45148 e!454448))))

(declare-fun mapKey!23371 () (_ BitVec 32))

(declare-datatypes ((V!24355 0))(
  ( (V!24356 (val!7305 Int)) )
))
(declare-datatypes ((ValueCell!6842 0))(
  ( (ValueCellFull!6842 (v!9734 V!24355)) (EmptyCell!6842) )
))
(declare-fun mapRest!23371 () (Array (_ BitVec 32) ValueCell!6842))

(declare-datatypes ((array!45228 0))(
  ( (array!45229 (arr!21668 (Array (_ BitVec 32) ValueCell!6842)) (size!22089 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45228)

(declare-fun mapValue!23371 () ValueCell!6842)

(assert (=> mapNonEmpty!23371 (= (arr!21668 _values!788) (store mapRest!23371 mapKey!23371 mapValue!23371))))

(declare-fun b!818626 () Bool)

(declare-fun res!558654 () Bool)

(declare-fun e!454451 () Bool)

(assert (=> b!818626 (=> (not res!558654) (not e!454451))))

(declare-datatypes ((array!45230 0))(
  ( (array!45231 (arr!21669 (Array (_ BitVec 32) (_ BitVec 64))) (size!22090 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45230)

(declare-datatypes ((List!15433 0))(
  ( (Nil!15430) (Cons!15429 (h!16558 (_ BitVec 64)) (t!21762 List!15433)) )
))
(declare-fun arrayNoDuplicates!0 (array!45230 (_ BitVec 32) List!15433) Bool)

(assert (=> b!818626 (= res!558654 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15430))))

(declare-fun b!818627 () Bool)

(declare-fun res!558649 () Bool)

(assert (=> b!818627 (=> (not res!558649) (not e!454451))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45230 (_ BitVec 32)) Bool)

(assert (=> b!818627 (= res!558649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818628 () Bool)

(declare-fun e!454447 () Bool)

(declare-fun e!454449 () Bool)

(assert (=> b!818628 (= e!454447 (and e!454449 mapRes!23371))))

(declare-fun condMapEmpty!23371 () Bool)

(declare-fun mapDefault!23371 () ValueCell!6842)

