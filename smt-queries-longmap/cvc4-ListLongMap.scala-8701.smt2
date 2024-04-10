; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105644 () Bool)

(assert start!105644)

(declare-fun b_free!27245 () Bool)

(declare-fun b_next!27245 () Bool)

(assert (=> start!105644 (= b_free!27245 (not b_next!27245))))

(declare-fun tp!95258 () Bool)

(declare-fun b_and!45119 () Bool)

(assert (=> start!105644 (= tp!95258 b_and!45119)))

(declare-fun b!1258417 () Bool)

(declare-fun e!715720 () Bool)

(declare-fun tp_is_empty!32147 () Bool)

(assert (=> b!1258417 (= e!715720 tp_is_empty!32147)))

(declare-fun b!1258418 () Bool)

(declare-fun e!715721 () Bool)

(declare-fun mapRes!50014 () Bool)

(assert (=> b!1258418 (= e!715721 (and e!715720 mapRes!50014))))

(declare-fun condMapEmpty!50014 () Bool)

(declare-datatypes ((V!48227 0))(
  ( (V!48228 (val!16136 Int)) )
))
(declare-datatypes ((ValueCell!15310 0))(
  ( (ValueCellFull!15310 (v!18838 V!48227)) (EmptyCell!15310) )
))
(declare-datatypes ((array!81916 0))(
  ( (array!81917 (arr!39514 (Array (_ BitVec 32) ValueCell!15310)) (size!40050 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81916)

(declare-fun mapDefault!50014 () ValueCell!15310)

