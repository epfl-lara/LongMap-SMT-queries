; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105810 () Bool)

(assert start!105810)

(declare-fun b_free!27373 () Bool)

(declare-fun b_next!27373 () Bool)

(assert (=> start!105810 (= b_free!27373 (not b_next!27373))))

(declare-fun tp!95647 () Bool)

(declare-fun b_and!45269 () Bool)

(assert (=> start!105810 (= tp!95647 b_and!45269)))

(declare-fun b!1260444 () Bool)

(declare-fun res!840012 () Bool)

(declare-fun e!717243 () Bool)

(assert (=> b!1260444 (=> (not res!840012) (not e!717243))))

(declare-datatypes ((array!82168 0))(
  ( (array!82169 (arr!39638 (Array (_ BitVec 32) (_ BitVec 64))) (size!40174 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82168)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82168 (_ BitVec 32)) Bool)

(assert (=> b!1260444 (= res!840012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260445 () Bool)

(declare-fun e!717240 () Bool)

(declare-fun tp_is_empty!32275 () Bool)

(assert (=> b!1260445 (= e!717240 tp_is_empty!32275)))

(declare-fun b!1260446 () Bool)

(declare-fun e!717242 () Bool)

(declare-fun mapRes!50212 () Bool)

(assert (=> b!1260446 (= e!717242 (and e!717240 mapRes!50212))))

(declare-fun condMapEmpty!50212 () Bool)

(declare-datatypes ((V!48399 0))(
  ( (V!48400 (val!16200 Int)) )
))
(declare-datatypes ((ValueCell!15374 0))(
  ( (ValueCellFull!15374 (v!18903 V!48399)) (EmptyCell!15374) )
))
(declare-datatypes ((array!82170 0))(
  ( (array!82171 (arr!39639 (Array (_ BitVec 32) ValueCell!15374)) (size!40175 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82170)

(declare-fun mapDefault!50212 () ValueCell!15374)

