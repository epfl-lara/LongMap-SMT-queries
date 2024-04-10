; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105884 () Bool)

(assert start!105884)

(declare-fun b_free!27425 () Bool)

(declare-fun b_next!27425 () Bool)

(assert (=> start!105884 (= b_free!27425 (not b_next!27425))))

(declare-fun tp!95806 () Bool)

(declare-fun b_and!45333 () Bool)

(assert (=> start!105884 (= tp!95806 b_and!45333)))

(declare-fun b!1261210 () Bool)

(declare-fun e!717782 () Bool)

(declare-fun tp_is_empty!32327 () Bool)

(assert (=> b!1261210 (= e!717782 tp_is_empty!32327)))

(declare-fun res!840444 () Bool)

(declare-fun e!717783 () Bool)

(assert (=> start!105884 (=> (not res!840444) (not e!717783))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105884 (= res!840444 (validMask!0 mask!1466))))

(assert (=> start!105884 e!717783))

(assert (=> start!105884 true))

(assert (=> start!105884 tp!95806))

(assert (=> start!105884 tp_is_empty!32327))

(declare-datatypes ((array!82268 0))(
  ( (array!82269 (arr!39687 (Array (_ BitVec 32) (_ BitVec 64))) (size!40223 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82268)

(declare-fun array_inv!30215 (array!82268) Bool)

(assert (=> start!105884 (array_inv!30215 _keys!1118)))

(declare-datatypes ((V!48467 0))(
  ( (V!48468 (val!16226 Int)) )
))
(declare-datatypes ((ValueCell!15400 0))(
  ( (ValueCellFull!15400 (v!18930 V!48467)) (EmptyCell!15400) )
))
(declare-datatypes ((array!82270 0))(
  ( (array!82271 (arr!39688 (Array (_ BitVec 32) ValueCell!15400)) (size!40224 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82270)

(declare-fun e!717784 () Bool)

(declare-fun array_inv!30216 (array!82270) Bool)

(assert (=> start!105884 (and (array_inv!30216 _values!914) e!717784)))

(declare-fun b!1261211 () Bool)

(declare-fun e!717781 () Bool)

(declare-fun mapRes!50293 () Bool)

(assert (=> b!1261211 (= e!717784 (and e!717781 mapRes!50293))))

(declare-fun condMapEmpty!50293 () Bool)

(declare-fun mapDefault!50293 () ValueCell!15400)

