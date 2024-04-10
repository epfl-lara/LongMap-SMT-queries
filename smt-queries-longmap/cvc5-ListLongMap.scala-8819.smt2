; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107138 () Bool)

(assert start!107138)

(declare-fun b_free!27643 () Bool)

(declare-fun b_next!27643 () Bool)

(assert (=> start!107138 (= b_free!27643 (not b_next!27643))))

(declare-fun tp!97155 () Bool)

(declare-fun b_and!45675 () Bool)

(assert (=> start!107138 (= tp!97155 b_and!45675)))

(declare-fun b!1270251 () Bool)

(declare-fun e!724038 () Bool)

(declare-fun tp_is_empty!32827 () Bool)

(assert (=> b!1270251 (= e!724038 tp_is_empty!32827)))

(declare-fun res!845315 () Bool)

(declare-fun e!724034 () Bool)

(assert (=> start!107138 (=> (not res!845315) (not e!724034))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107138 (= res!845315 (validMask!0 mask!1730))))

(assert (=> start!107138 e!724034))

(declare-datatypes ((V!48963 0))(
  ( (V!48964 (val!16488 Int)) )
))
(declare-datatypes ((ValueCell!15560 0))(
  ( (ValueCellFull!15560 (v!19125 V!48963)) (EmptyCell!15560) )
))
(declare-datatypes ((array!82916 0))(
  ( (array!82917 (arr!39995 (Array (_ BitVec 32) ValueCell!15560)) (size!40531 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82916)

(declare-fun e!724037 () Bool)

(declare-fun array_inv!30419 (array!82916) Bool)

(assert (=> start!107138 (and (array_inv!30419 _values!1134) e!724037)))

(assert (=> start!107138 true))

(declare-datatypes ((array!82918 0))(
  ( (array!82919 (arr!39996 (Array (_ BitVec 32) (_ BitVec 64))) (size!40532 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82918)

(declare-fun array_inv!30420 (array!82918) Bool)

(assert (=> start!107138 (array_inv!30420 _keys!1364)))

(assert (=> start!107138 tp_is_empty!32827))

(assert (=> start!107138 tp!97155))

(declare-fun mapNonEmpty!50821 () Bool)

(declare-fun mapRes!50821 () Bool)

(declare-fun tp!97156 () Bool)

(assert (=> mapNonEmpty!50821 (= mapRes!50821 (and tp!97156 e!724038))))

(declare-fun mapRest!50821 () (Array (_ BitVec 32) ValueCell!15560))

(declare-fun mapKey!50821 () (_ BitVec 32))

(declare-fun mapValue!50821 () ValueCell!15560)

(assert (=> mapNonEmpty!50821 (= (arr!39995 _values!1134) (store mapRest!50821 mapKey!50821 mapValue!50821))))

(declare-fun mapIsEmpty!50821 () Bool)

(assert (=> mapIsEmpty!50821 mapRes!50821))

(declare-fun b!1270252 () Bool)

(declare-fun res!845313 () Bool)

(assert (=> b!1270252 (=> (not res!845313) (not e!724034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82918 (_ BitVec 32)) Bool)

(assert (=> b!1270252 (= res!845313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270253 () Bool)

(declare-fun e!724036 () Bool)

(assert (=> b!1270253 (= e!724037 (and e!724036 mapRes!50821))))

(declare-fun condMapEmpty!50821 () Bool)

(declare-fun mapDefault!50821 () ValueCell!15560)

