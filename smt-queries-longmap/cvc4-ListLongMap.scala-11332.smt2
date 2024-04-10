; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131900 () Bool)

(assert start!131900)

(declare-fun b_free!31613 () Bool)

(declare-fun b_next!31613 () Bool)

(assert (=> start!131900 (= b_free!31613 (not b_next!31613))))

(declare-fun tp!111091 () Bool)

(declare-fun b_and!51023 () Bool)

(assert (=> start!131900 (= tp!111091 b_and!51023)))

(declare-datatypes ((array!102992 0))(
  ( (array!102993 (arr!49698 (Array (_ BitVec 32) (_ BitVec 64))) (size!50248 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102992)

(declare-datatypes ((V!58961 0))(
  ( (V!58962 (val!19022 Int)) )
))
(declare-fun zeroValue!436 () V!58961)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18034 0))(
  ( (ValueCellFull!18034 (v!21823 V!58961)) (EmptyCell!18034) )
))
(declare-datatypes ((array!102994 0))(
  ( (array!102995 (arr!49699 (Array (_ BitVec 32) ValueCell!18034)) (size!50249 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102994)

(declare-fun minValue!436 () V!58961)

(declare-fun bm!68822 () Bool)

(declare-datatypes ((tuple2!24434 0))(
  ( (tuple2!24435 (_1!12228 (_ BitVec 64)) (_2!12228 V!58961)) )
))
(declare-datatypes ((List!35951 0))(
  ( (Nil!35948) (Cons!35947 (h!37392 tuple2!24434) (t!50645 List!35951)) )
))
(declare-datatypes ((ListLongMap!22043 0))(
  ( (ListLongMap!22044 (toList!11037 List!35951)) )
))
(declare-fun call!68829 () ListLongMap!22043)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6509 (array!102992 array!102994 (_ BitVec 32) (_ BitVec 32) V!58961 V!58961 (_ BitVec 32) Int) ListLongMap!22043)

(assert (=> bm!68822 (= call!68829 (getCurrentListMapNoExtraKeys!6509 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544263 () Bool)

(declare-fun e!859558 () Bool)

(declare-fun e!859556 () Bool)

(declare-fun mapRes!58537 () Bool)

(assert (=> b!1544263 (= e!859558 (and e!859556 mapRes!58537))))

(declare-fun condMapEmpty!58537 () Bool)

(declare-fun mapDefault!58537 () ValueCell!18034)

