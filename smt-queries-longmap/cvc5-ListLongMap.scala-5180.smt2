; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70066 () Bool)

(assert start!70066)

(declare-fun b_free!12487 () Bool)

(declare-fun b_next!12487 () Bool)

(assert (=> start!70066 (= b_free!12487 (not b_next!12487))))

(declare-fun tp!44176 () Bool)

(declare-fun b_and!21259 () Bool)

(assert (=> start!70066 (= tp!44176 b_and!21259)))

(declare-fun b!814269 () Bool)

(declare-fun e!451334 () Bool)

(declare-fun tp_is_empty!14197 () Bool)

(assert (=> b!814269 (= e!451334 tp_is_empty!14197)))

(declare-fun b!814270 () Bool)

(declare-fun res!556181 () Bool)

(declare-fun e!451337 () Bool)

(assert (=> b!814270 (=> (not res!556181) (not e!451337))))

(declare-datatypes ((array!44598 0))(
  ( (array!44599 (arr!21359 (Array (_ BitVec 32) (_ BitVec 64))) (size!21780 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44598)

(declare-datatypes ((List!15199 0))(
  ( (Nil!15196) (Cons!15195 (h!16324 (_ BitVec 64)) (t!21516 List!15199)) )
))
(declare-fun arrayNoDuplicates!0 (array!44598 (_ BitVec 32) List!15199) Bool)

(assert (=> b!814270 (= res!556181 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15196))))

(declare-fun mapIsEmpty!22876 () Bool)

(declare-fun mapRes!22876 () Bool)

(assert (=> mapIsEmpty!22876 mapRes!22876))

(declare-fun mapNonEmpty!22876 () Bool)

(declare-fun tp!44175 () Bool)

(declare-fun e!451336 () Bool)

(assert (=> mapNonEmpty!22876 (= mapRes!22876 (and tp!44175 e!451336))))

(declare-datatypes ((V!23931 0))(
  ( (V!23932 (val!7146 Int)) )
))
(declare-datatypes ((ValueCell!6683 0))(
  ( (ValueCellFull!6683 (v!9573 V!23931)) (EmptyCell!6683) )
))
(declare-datatypes ((array!44600 0))(
  ( (array!44601 (arr!21360 (Array (_ BitVec 32) ValueCell!6683)) (size!21781 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44600)

(declare-fun mapRest!22876 () (Array (_ BitVec 32) ValueCell!6683))

(declare-fun mapKey!22876 () (_ BitVec 32))

(declare-fun mapValue!22876 () ValueCell!6683)

(assert (=> mapNonEmpty!22876 (= (arr!21360 _values!788) (store mapRest!22876 mapKey!22876 mapValue!22876))))

(declare-fun b!814271 () Bool)

(declare-fun e!451335 () Bool)

(assert (=> b!814271 (= e!451335 (and e!451334 mapRes!22876))))

(declare-fun condMapEmpty!22876 () Bool)

(declare-fun mapDefault!22876 () ValueCell!6683)

