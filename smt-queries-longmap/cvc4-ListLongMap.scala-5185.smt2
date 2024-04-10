; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70100 () Bool)

(assert start!70100)

(declare-fun b_free!12521 () Bool)

(declare-fun b_next!12521 () Bool)

(assert (=> start!70100 (= b_free!12521 (not b_next!12521))))

(declare-fun tp!44277 () Bool)

(declare-fun b_and!21293 () Bool)

(assert (=> start!70100 (= tp!44277 b_and!21293)))

(declare-fun mapNonEmpty!22927 () Bool)

(declare-fun mapRes!22927 () Bool)

(declare-fun tp!44278 () Bool)

(declare-fun e!451591 () Bool)

(assert (=> mapNonEmpty!22927 (= mapRes!22927 (and tp!44278 e!451591))))

(declare-datatypes ((V!23975 0))(
  ( (V!23976 (val!7163 Int)) )
))
(declare-datatypes ((ValueCell!6700 0))(
  ( (ValueCellFull!6700 (v!9590 V!23975)) (EmptyCell!6700) )
))
(declare-datatypes ((array!44664 0))(
  ( (array!44665 (arr!21392 (Array (_ BitVec 32) ValueCell!6700)) (size!21813 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44664)

(declare-fun mapValue!22927 () ValueCell!6700)

(declare-fun mapKey!22927 () (_ BitVec 32))

(declare-fun mapRest!22927 () (Array (_ BitVec 32) ValueCell!6700))

(assert (=> mapNonEmpty!22927 (= (arr!21392 _values!788) (store mapRest!22927 mapKey!22927 mapValue!22927))))

(declare-fun b!814625 () Bool)

(declare-fun res!556383 () Bool)

(declare-fun e!451590 () Bool)

(assert (=> b!814625 (=> (not res!556383) (not e!451590))))

(declare-datatypes ((array!44666 0))(
  ( (array!44667 (arr!21393 (Array (_ BitVec 32) (_ BitVec 64))) (size!21814 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44666)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44666 (_ BitVec 32)) Bool)

(assert (=> b!814625 (= res!556383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814626 () Bool)

(declare-fun res!556384 () Bool)

(assert (=> b!814626 (=> (not res!556384) (not e!451590))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814626 (= res!556384 (and (= (size!21813 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21814 _keys!976) (size!21813 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814627 () Bool)

(declare-fun e!451593 () Bool)

(declare-fun e!451592 () Bool)

(assert (=> b!814627 (= e!451593 (and e!451592 mapRes!22927))))

(declare-fun condMapEmpty!22927 () Bool)

(declare-fun mapDefault!22927 () ValueCell!6700)

