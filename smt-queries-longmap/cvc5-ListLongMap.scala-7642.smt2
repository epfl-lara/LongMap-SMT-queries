; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96172 () Bool)

(assert start!96172)

(declare-fun b_free!22825 () Bool)

(declare-fun b_next!22825 () Bool)

(assert (=> start!96172 (= b_free!22825 (not b_next!22825))))

(declare-fun tp!80323 () Bool)

(declare-fun b_and!36325 () Bool)

(assert (=> start!96172 (= tp!80323 b_and!36325)))

(declare-fun mapNonEmpty!41995 () Bool)

(declare-fun mapRes!41995 () Bool)

(declare-fun tp!80324 () Bool)

(declare-fun e!623587 () Bool)

(assert (=> mapNonEmpty!41995 (= mapRes!41995 (and tp!80324 e!623587))))

(declare-fun mapKey!41995 () (_ BitVec 32))

(declare-datatypes ((V!40897 0))(
  ( (V!40898 (val!13470 Int)) )
))
(declare-datatypes ((ValueCell!12704 0))(
  ( (ValueCellFull!12704 (v!16091 V!40897)) (EmptyCell!12704) )
))
(declare-fun mapRest!41995 () (Array (_ BitVec 32) ValueCell!12704))

(declare-datatypes ((array!70573 0))(
  ( (array!70574 (arr!33960 (Array (_ BitVec 32) ValueCell!12704)) (size!34496 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70573)

(declare-fun mapValue!41995 () ValueCell!12704)

(assert (=> mapNonEmpty!41995 (= (arr!33960 _values!874) (store mapRest!41995 mapKey!41995 mapValue!41995))))

(declare-fun b!1091899 () Bool)

(declare-fun res!728555 () Bool)

(declare-fun e!623594 () Bool)

(assert (=> b!1091899 (=> (not res!728555) (not e!623594))))

(declare-datatypes ((array!70575 0))(
  ( (array!70576 (arr!33961 (Array (_ BitVec 32) (_ BitVec 64))) (size!34497 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70575)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091899 (= res!728555 (= (select (arr!33961 _keys!1070) i!650) k!904))))

(declare-fun b!1091900 () Bool)

(declare-fun e!623592 () Bool)

(declare-fun e!623588 () Bool)

(assert (=> b!1091900 (= e!623592 (and e!623588 mapRes!41995))))

(declare-fun condMapEmpty!41995 () Bool)

(declare-fun mapDefault!41995 () ValueCell!12704)

