; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70718 () Bool)

(assert start!70718)

(declare-fun b_free!12991 () Bool)

(declare-fun b_next!12991 () Bool)

(assert (=> start!70718 (= b_free!12991 (not b_next!12991))))

(declare-fun tp!45714 () Bool)

(declare-fun b_and!21853 () Bool)

(assert (=> start!70718 (= tp!45714 b_and!21853)))

(declare-fun b!821409 () Bool)

(declare-fun e!456502 () Bool)

(declare-fun tp_is_empty!14701 () Bool)

(assert (=> b!821409 (= e!456502 tp_is_empty!14701)))

(declare-fun b!821410 () Bool)

(declare-fun res!560339 () Bool)

(declare-fun e!456506 () Bool)

(assert (=> b!821410 (=> (not res!560339) (not e!456506))))

(declare-datatypes ((array!45598 0))(
  ( (array!45599 (arr!21850 (Array (_ BitVec 32) (_ BitVec 64))) (size!22271 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45598)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24603 0))(
  ( (V!24604 (val!7398 Int)) )
))
(declare-datatypes ((ValueCell!6935 0))(
  ( (ValueCellFull!6935 (v!9829 V!24603)) (EmptyCell!6935) )
))
(declare-datatypes ((array!45600 0))(
  ( (array!45601 (arr!21851 (Array (_ BitVec 32) ValueCell!6935)) (size!22272 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45600)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821410 (= res!560339 (and (= (size!22272 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22271 _keys!976) (size!22272 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821411 () Bool)

(declare-fun e!456503 () Bool)

(declare-fun e!456505 () Bool)

(declare-fun mapRes!23659 () Bool)

(assert (=> b!821411 (= e!456503 (and e!456505 mapRes!23659))))

(declare-fun condMapEmpty!23659 () Bool)

(declare-fun mapDefault!23659 () ValueCell!6935)

