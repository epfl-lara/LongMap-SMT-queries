; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105696 () Bool)

(assert start!105696)

(declare-fun b_free!27281 () Bool)

(declare-fun b_next!27281 () Bool)

(assert (=> start!105696 (= b_free!27281 (not b_next!27281))))

(declare-fun tp!95369 () Bool)

(declare-fun b_and!45165 () Bool)

(assert (=> start!105696 (= tp!95369 b_and!45165)))

(declare-fun b!1259014 () Bool)

(declare-fun e!716156 () Bool)

(declare-fun e!716157 () Bool)

(declare-fun mapRes!50071 () Bool)

(assert (=> b!1259014 (= e!716156 (and e!716157 mapRes!50071))))

(declare-fun condMapEmpty!50071 () Bool)

(declare-datatypes ((V!48275 0))(
  ( (V!48276 (val!16154 Int)) )
))
(declare-datatypes ((ValueCell!15328 0))(
  ( (ValueCellFull!15328 (v!18856 V!48275)) (EmptyCell!15328) )
))
(declare-datatypes ((array!81986 0))(
  ( (array!81987 (arr!39548 (Array (_ BitVec 32) ValueCell!15328)) (size!40084 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81986)

(declare-fun mapDefault!50071 () ValueCell!15328)

