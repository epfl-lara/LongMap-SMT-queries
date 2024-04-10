; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41760 () Bool)

(assert start!41760)

(declare-fun b_free!11381 () Bool)

(declare-fun b_next!11381 () Bool)

(assert (=> start!41760 (= b_free!11381 (not b_next!11381))))

(declare-fun tp!40149 () Bool)

(declare-fun b_and!19749 () Bool)

(assert (=> start!41760 (= tp!40149 b_and!19749)))

(declare-fun b!466290 () Bool)

(declare-fun res!278710 () Bool)

(declare-fun e!272612 () Bool)

(assert (=> b!466290 (=> (not res!278710) (not e!272612))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29401 0))(
  ( (array!29402 (arr!14129 (Array (_ BitVec 32) (_ BitVec 64))) (size!14481 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29401)

(declare-datatypes ((V!18183 0))(
  ( (V!18184 (val!6449 Int)) )
))
(declare-datatypes ((ValueCell!6061 0))(
  ( (ValueCellFull!6061 (v!8737 V!18183)) (EmptyCell!6061) )
))
(declare-datatypes ((array!29403 0))(
  ( (array!29404 (arr!14130 (Array (_ BitVec 32) ValueCell!6061)) (size!14482 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29403)

(assert (=> b!466290 (= res!278710 (and (= (size!14482 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14481 _keys!1025) (size!14482 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466292 () Bool)

(declare-fun res!278713 () Bool)

(assert (=> b!466292 (=> (not res!278713) (not e!272612))))

(declare-datatypes ((List!8545 0))(
  ( (Nil!8542) (Cons!8541 (h!9397 (_ BitVec 64)) (t!14497 List!8545)) )
))
(declare-fun arrayNoDuplicates!0 (array!29401 (_ BitVec 32) List!8545) Bool)

(assert (=> b!466292 (= res!278713 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8542))))

(declare-fun b!466293 () Bool)

(declare-fun e!272615 () Bool)

(declare-fun tp_is_empty!12809 () Bool)

(assert (=> b!466293 (= e!272615 tp_is_empty!12809)))

(declare-fun b!466294 () Bool)

(declare-fun e!272617 () Bool)

(declare-fun mapRes!20899 () Bool)

(assert (=> b!466294 (= e!272617 (and e!272615 mapRes!20899))))

(declare-fun condMapEmpty!20899 () Bool)

(declare-fun mapDefault!20899 () ValueCell!6061)

