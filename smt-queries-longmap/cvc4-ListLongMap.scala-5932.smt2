; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77368 () Bool)

(assert start!77368)

(declare-fun mapNonEmpty!29332 () Bool)

(declare-fun mapRes!29332 () Bool)

(declare-fun tp!56391 () Bool)

(declare-fun e!505179 () Bool)

(assert (=> mapNonEmpty!29332 (= mapRes!29332 (and tp!56391 e!505179))))

(declare-datatypes ((V!29531 0))(
  ( (V!29532 (val!9263 Int)) )
))
(declare-datatypes ((ValueCell!8731 0))(
  ( (ValueCellFull!8731 (v!11767 V!29531)) (EmptyCell!8731) )
))
(declare-datatypes ((array!52912 0))(
  ( (array!52913 (arr!25421 (Array (_ BitVec 32) ValueCell!8731)) (size!25880 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52912)

(declare-fun mapKey!29332 () (_ BitVec 32))

(declare-fun mapValue!29332 () ValueCell!8731)

(declare-fun mapRest!29332 () (Array (_ BitVec 32) ValueCell!8731))

(assert (=> mapNonEmpty!29332 (= (arr!25421 _values!1152) (store mapRest!29332 mapKey!29332 mapValue!29332))))

(declare-fun mapIsEmpty!29332 () Bool)

(assert (=> mapIsEmpty!29332 mapRes!29332))

(declare-fun res!608880 () Bool)

(declare-fun e!505181 () Bool)

(assert (=> start!77368 (=> (not res!608880) (not e!505181))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77368 (= res!608880 (validMask!0 mask!1756))))

(assert (=> start!77368 e!505181))

(assert (=> start!77368 true))

(declare-fun e!505180 () Bool)

(declare-fun array_inv!19936 (array!52912) Bool)

(assert (=> start!77368 (and (array_inv!19936 _values!1152) e!505180)))

(declare-datatypes ((array!52914 0))(
  ( (array!52915 (arr!25422 (Array (_ BitVec 32) (_ BitVec 64))) (size!25881 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52914)

(declare-fun array_inv!19937 (array!52914) Bool)

(assert (=> start!77368 (array_inv!19937 _keys!1386)))

(declare-fun b!902166 () Bool)

(declare-fun tp_is_empty!18425 () Bool)

(assert (=> b!902166 (= e!505179 tp_is_empty!18425)))

(declare-fun b!902167 () Bool)

(declare-fun e!505182 () Bool)

(assert (=> b!902167 (= e!505180 (and e!505182 mapRes!29332))))

(declare-fun condMapEmpty!29332 () Bool)

(declare-fun mapDefault!29332 () ValueCell!8731)

