; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70048 () Bool)

(assert start!70048)

(declare-fun b_free!12469 () Bool)

(declare-fun b_next!12469 () Bool)

(assert (=> start!70048 (= b_free!12469 (not b_next!12469))))

(declare-fun tp!44121 () Bool)

(declare-fun b_and!21241 () Bool)

(assert (=> start!70048 (= tp!44121 b_and!21241)))

(declare-fun b!814079 () Bool)

(declare-fun res!556072 () Bool)

(declare-fun e!451203 () Bool)

(assert (=> b!814079 (=> (not res!556072) (not e!451203))))

(declare-datatypes ((array!44564 0))(
  ( (array!44565 (arr!21342 (Array (_ BitVec 32) (_ BitVec 64))) (size!21763 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44564)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44564 (_ BitVec 32)) Bool)

(assert (=> b!814079 (= res!556072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22849 () Bool)

(declare-fun mapRes!22849 () Bool)

(declare-fun tp!44122 () Bool)

(declare-fun e!451200 () Bool)

(assert (=> mapNonEmpty!22849 (= mapRes!22849 (and tp!44122 e!451200))))

(declare-fun mapKey!22849 () (_ BitVec 32))

(declare-datatypes ((V!23907 0))(
  ( (V!23908 (val!7137 Int)) )
))
(declare-datatypes ((ValueCell!6674 0))(
  ( (ValueCellFull!6674 (v!9564 V!23907)) (EmptyCell!6674) )
))
(declare-fun mapValue!22849 () ValueCell!6674)

(declare-datatypes ((array!44566 0))(
  ( (array!44567 (arr!21343 (Array (_ BitVec 32) ValueCell!6674)) (size!21764 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44566)

(declare-fun mapRest!22849 () (Array (_ BitVec 32) ValueCell!6674))

(assert (=> mapNonEmpty!22849 (= (arr!21343 _values!788) (store mapRest!22849 mapKey!22849 mapValue!22849))))

(declare-fun b!814080 () Bool)

(declare-fun e!451202 () Bool)

(declare-fun e!451199 () Bool)

(assert (=> b!814080 (= e!451202 (and e!451199 mapRes!22849))))

(declare-fun condMapEmpty!22849 () Bool)

(declare-fun mapDefault!22849 () ValueCell!6674)

