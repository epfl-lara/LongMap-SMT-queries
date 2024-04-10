; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70340 () Bool)

(assert start!70340)

(declare-fun b_free!12697 () Bool)

(declare-fun b_next!12697 () Bool)

(assert (=> start!70340 (= b_free!12697 (not b_next!12697))))

(declare-fun tp!44817 () Bool)

(declare-fun b_and!21509 () Bool)

(assert (=> start!70340 (= tp!44817 b_and!21509)))

(declare-fun res!557827 () Bool)

(declare-fun e!453401 () Bool)

(assert (=> start!70340 (=> (not res!557827) (not e!453401))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70340 (= res!557827 (validMask!0 mask!1312))))

(assert (=> start!70340 e!453401))

(declare-fun tp_is_empty!14407 () Bool)

(assert (=> start!70340 tp_is_empty!14407))

(declare-datatypes ((array!45014 0))(
  ( (array!45015 (arr!21563 (Array (_ BitVec 32) (_ BitVec 64))) (size!21984 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45014)

(declare-fun array_inv!17253 (array!45014) Bool)

(assert (=> start!70340 (array_inv!17253 _keys!976)))

(assert (=> start!70340 true))

(declare-datatypes ((V!24211 0))(
  ( (V!24212 (val!7251 Int)) )
))
(declare-datatypes ((ValueCell!6788 0))(
  ( (ValueCellFull!6788 (v!9680 V!24211)) (EmptyCell!6788) )
))
(declare-datatypes ((array!45016 0))(
  ( (array!45017 (arr!21564 (Array (_ BitVec 32) ValueCell!6788)) (size!21985 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45016)

(declare-fun e!453403 () Bool)

(declare-fun array_inv!17254 (array!45016) Bool)

(assert (=> start!70340 (and (array_inv!17254 _values!788) e!453403)))

(assert (=> start!70340 tp!44817))

(declare-fun b!817173 () Bool)

(declare-fun e!453405 () Bool)

(assert (=> b!817173 (= e!453405 tp_is_empty!14407)))

(declare-fun b!817174 () Bool)

(declare-fun e!453402 () Bool)

(assert (=> b!817174 (= e!453402 tp_is_empty!14407)))

(declare-fun mapIsEmpty!23203 () Bool)

(declare-fun mapRes!23203 () Bool)

(assert (=> mapIsEmpty!23203 mapRes!23203))

(declare-fun b!817175 () Bool)

(assert (=> b!817175 (= e!453403 (and e!453405 mapRes!23203))))

(declare-fun condMapEmpty!23203 () Bool)

(declare-fun mapDefault!23203 () ValueCell!6788)

