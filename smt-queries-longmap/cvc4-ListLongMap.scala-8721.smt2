; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105802 () Bool)

(assert start!105802)

(declare-fun b_free!27365 () Bool)

(declare-fun b_next!27365 () Bool)

(assert (=> start!105802 (= b_free!27365 (not b_next!27365))))

(declare-fun tp!95624 () Bool)

(declare-fun b_and!45261 () Bool)

(assert (=> start!105802 (= tp!95624 b_and!45261)))

(declare-fun e!717157 () Bool)

(declare-fun b!1260336 () Bool)

(declare-datatypes ((V!48387 0))(
  ( (V!48388 (val!16196 Int)) )
))
(declare-datatypes ((tuple2!20952 0))(
  ( (tuple2!20953 (_1!10487 (_ BitVec 64)) (_2!10487 V!48387)) )
))
(declare-fun lt!571010 () tuple2!20952)

(declare-datatypes ((List!28151 0))(
  ( (Nil!28148) (Cons!28147 (h!29356 tuple2!20952) (t!41648 List!28151)) )
))
(declare-datatypes ((ListLongMap!18825 0))(
  ( (ListLongMap!18826 (toList!9428 List!28151)) )
))
(declare-fun lt!571003 () ListLongMap!18825)

(declare-fun lt!571009 () ListLongMap!18825)

(declare-fun +!4231 (ListLongMap!18825 tuple2!20952) ListLongMap!18825)

(assert (=> b!1260336 (= e!717157 (= lt!571003 (+!4231 lt!571009 lt!571010)))))

(declare-fun b!1260337 () Bool)

(declare-fun e!717154 () Bool)

(declare-fun tp_is_empty!32267 () Bool)

(assert (=> b!1260337 (= e!717154 tp_is_empty!32267)))

(declare-fun res!839942 () Bool)

(declare-fun e!717155 () Bool)

(assert (=> start!105802 (=> (not res!839942) (not e!717155))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105802 (= res!839942 (validMask!0 mask!1466))))

(assert (=> start!105802 e!717155))

(assert (=> start!105802 true))

(assert (=> start!105802 tp!95624))

(assert (=> start!105802 tp_is_empty!32267))

(declare-datatypes ((array!82152 0))(
  ( (array!82153 (arr!39630 (Array (_ BitVec 32) (_ BitVec 64))) (size!40166 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82152)

(declare-fun array_inv!30171 (array!82152) Bool)

(assert (=> start!105802 (array_inv!30171 _keys!1118)))

(declare-datatypes ((ValueCell!15370 0))(
  ( (ValueCellFull!15370 (v!18899 V!48387)) (EmptyCell!15370) )
))
(declare-datatypes ((array!82154 0))(
  ( (array!82155 (arr!39631 (Array (_ BitVec 32) ValueCell!15370)) (size!40167 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82154)

(declare-fun e!717156 () Bool)

(declare-fun array_inv!30172 (array!82154) Bool)

(assert (=> start!105802 (and (array_inv!30172 _values!914) e!717156)))

(declare-fun b!1260338 () Bool)

(declare-fun e!717158 () Bool)

(declare-fun mapRes!50200 () Bool)

(assert (=> b!1260338 (= e!717156 (and e!717158 mapRes!50200))))

(declare-fun condMapEmpty!50200 () Bool)

(declare-fun mapDefault!50200 () ValueCell!15370)

