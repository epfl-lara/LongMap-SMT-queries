; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105596 () Bool)

(assert start!105596)

(declare-fun b_free!27211 () Bool)

(declare-fun b_next!27211 () Bool)

(assert (=> start!105596 (= b_free!27211 (not b_next!27211))))

(declare-fun tp!95153 () Bool)

(declare-fun b_and!45077 () Bool)

(assert (=> start!105596 (= tp!95153 b_and!45077)))

(declare-fun res!838476 () Bool)

(declare-fun e!715366 () Bool)

(assert (=> start!105596 (=> (not res!838476) (not e!715366))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105596 (= res!838476 (validMask!0 mask!1466))))

(assert (=> start!105596 e!715366))

(assert (=> start!105596 true))

(assert (=> start!105596 tp!95153))

(declare-fun tp_is_empty!32113 () Bool)

(assert (=> start!105596 tp_is_empty!32113))

(declare-datatypes ((array!81854 0))(
  ( (array!81855 (arr!39484 (Array (_ BitVec 32) (_ BitVec 64))) (size!40020 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81854)

(declare-fun array_inv!30075 (array!81854) Bool)

(assert (=> start!105596 (array_inv!30075 _keys!1118)))

(declare-datatypes ((V!48183 0))(
  ( (V!48184 (val!16119 Int)) )
))
(declare-datatypes ((ValueCell!15293 0))(
  ( (ValueCellFull!15293 (v!18821 V!48183)) (EmptyCell!15293) )
))
(declare-datatypes ((array!81856 0))(
  ( (array!81857 (arr!39485 (Array (_ BitVec 32) ValueCell!15293)) (size!40021 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81856)

(declare-fun e!715362 () Bool)

(declare-fun array_inv!30076 (array!81856) Bool)

(assert (=> start!105596 (and (array_inv!30076 _values!914) e!715362)))

(declare-fun b!1257931 () Bool)

(declare-fun e!715363 () Bool)

(declare-fun mapRes!49960 () Bool)

(assert (=> b!1257931 (= e!715362 (and e!715363 mapRes!49960))))

(declare-fun condMapEmpty!49960 () Bool)

(declare-fun mapDefault!49960 () ValueCell!15293)

