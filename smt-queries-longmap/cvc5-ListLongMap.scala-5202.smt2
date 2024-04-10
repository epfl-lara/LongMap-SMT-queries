; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70226 () Bool)

(assert start!70226)

(declare-fun b_free!12619 () Bool)

(declare-fun b_next!12619 () Bool)

(assert (=> start!70226 (= b_free!12619 (not b_next!12619))))

(declare-fun tp!44578 () Bool)

(declare-fun b_and!21407 () Bool)

(assert (=> start!70226 (= tp!44578 b_and!21407)))

(declare-fun mapIsEmpty!23080 () Bool)

(declare-fun mapRes!23080 () Bool)

(assert (=> mapIsEmpty!23080 mapRes!23080))

(declare-fun res!557082 () Bool)

(declare-fun e!452481 () Bool)

(assert (=> start!70226 (=> (not res!557082) (not e!452481))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70226 (= res!557082 (validMask!0 mask!1312))))

(assert (=> start!70226 e!452481))

(declare-fun tp_is_empty!14329 () Bool)

(assert (=> start!70226 tp_is_empty!14329))

(declare-datatypes ((array!44858 0))(
  ( (array!44859 (arr!21487 (Array (_ BitVec 32) (_ BitVec 64))) (size!21908 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44858)

(declare-fun array_inv!17195 (array!44858) Bool)

(assert (=> start!70226 (array_inv!17195 _keys!976)))

(assert (=> start!70226 true))

(declare-datatypes ((V!24107 0))(
  ( (V!24108 (val!7212 Int)) )
))
(declare-datatypes ((ValueCell!6749 0))(
  ( (ValueCellFull!6749 (v!9639 V!24107)) (EmptyCell!6749) )
))
(declare-datatypes ((array!44860 0))(
  ( (array!44861 (arr!21488 (Array (_ BitVec 32) ValueCell!6749)) (size!21909 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44860)

(declare-fun e!452483 () Bool)

(declare-fun array_inv!17196 (array!44860) Bool)

(assert (=> start!70226 (and (array_inv!17196 _values!788) e!452483)))

(assert (=> start!70226 tp!44578))

(declare-fun b!815871 () Bool)

(declare-fun e!452484 () Bool)

(assert (=> b!815871 (= e!452483 (and e!452484 mapRes!23080))))

(declare-fun condMapEmpty!23080 () Bool)

(declare-fun mapDefault!23080 () ValueCell!6749)

