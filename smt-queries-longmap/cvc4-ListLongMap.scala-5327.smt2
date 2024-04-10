; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71226 () Bool)

(assert start!71226)

(declare-fun b_free!13373 () Bool)

(declare-fun b_next!13373 () Bool)

(assert (=> start!71226 (= b_free!13373 (not b_next!13373))))

(declare-fun tp!46882 () Bool)

(declare-fun b_and!22311 () Bool)

(assert (=> start!71226 (= tp!46882 b_and!22311)))

(declare-fun b!827365 () Bool)

(declare-fun res!563933 () Bool)

(declare-fun e!460889 () Bool)

(assert (=> b!827365 (=> (not res!563933) (not e!460889))))

(declare-datatypes ((array!46342 0))(
  ( (array!46343 (arr!22215 (Array (_ BitVec 32) (_ BitVec 64))) (size!22636 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46342)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25111 0))(
  ( (V!25112 (val!7589 Int)) )
))
(declare-datatypes ((ValueCell!7126 0))(
  ( (ValueCellFull!7126 (v!10024 V!25111)) (EmptyCell!7126) )
))
(declare-datatypes ((array!46344 0))(
  ( (array!46345 (arr!22216 (Array (_ BitVec 32) ValueCell!7126)) (size!22637 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46344)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827365 (= res!563933 (and (= (size!22637 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22636 _keys!976) (size!22637 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!563935 () Bool)

(assert (=> start!71226 (=> (not res!563935) (not e!460889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71226 (= res!563935 (validMask!0 mask!1312))))

(assert (=> start!71226 e!460889))

(declare-fun tp_is_empty!15083 () Bool)

(assert (=> start!71226 tp_is_empty!15083))

(declare-fun array_inv!17703 (array!46342) Bool)

(assert (=> start!71226 (array_inv!17703 _keys!976)))

(assert (=> start!71226 true))

(declare-fun e!460885 () Bool)

(declare-fun array_inv!17704 (array!46344) Bool)

(assert (=> start!71226 (and (array_inv!17704 _values!788) e!460885)))

(assert (=> start!71226 tp!46882))

(declare-fun mapIsEmpty!24253 () Bool)

(declare-fun mapRes!24253 () Bool)

(assert (=> mapIsEmpty!24253 mapRes!24253))

(declare-fun b!827366 () Bool)

(declare-fun res!563936 () Bool)

(assert (=> b!827366 (=> (not res!563936) (not e!460889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46342 (_ BitVec 32)) Bool)

(assert (=> b!827366 (= res!563936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827367 () Bool)

(declare-fun e!460888 () Bool)

(assert (=> b!827367 (= e!460885 (and e!460888 mapRes!24253))))

(declare-fun condMapEmpty!24253 () Bool)

(declare-fun mapDefault!24253 () ValueCell!7126)

