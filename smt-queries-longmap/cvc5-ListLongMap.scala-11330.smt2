; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131884 () Bool)

(assert start!131884)

(declare-fun b_free!31597 () Bool)

(declare-fun b_next!31597 () Bool)

(assert (=> start!131884 (= b_free!31597 (not b_next!31597))))

(declare-fun tp!111043 () Bool)

(declare-fun b_and!51007 () Bool)

(assert (=> start!131884 (= tp!111043 b_and!51007)))

(declare-fun mapIsEmpty!58513 () Bool)

(declare-fun mapRes!58513 () Bool)

(assert (=> mapIsEmpty!58513 mapRes!58513))

(declare-fun b!1543927 () Bool)

(declare-datatypes ((V!58941 0))(
  ( (V!58942 (val!19014 Int)) )
))
(declare-datatypes ((tuple2!24418 0))(
  ( (tuple2!24419 (_1!12220 (_ BitVec 64)) (_2!12220 V!58941)) )
))
(declare-datatypes ((List!35935 0))(
  ( (Nil!35932) (Cons!35931 (h!37376 tuple2!24418) (t!50629 List!35935)) )
))
(declare-datatypes ((ListLongMap!22027 0))(
  ( (ListLongMap!22028 (toList!11029 List!35935)) )
))
(declare-fun e!859364 () ListLongMap!22027)

(declare-fun call!68706 () ListLongMap!22027)

(assert (=> b!1543927 (= e!859364 call!68706)))

(declare-fun b!1543928 () Bool)

(declare-fun e!859367 () Bool)

(declare-fun tp_is_empty!37873 () Bool)

(assert (=> b!1543928 (= e!859367 tp_is_empty!37873)))

(declare-fun b!1543929 () Bool)

(declare-fun res!1059233 () Bool)

(declare-fun e!859362 () Bool)

(assert (=> b!1543929 (=> (not res!1059233) (not e!859362))))

(declare-datatypes ((array!102960 0))(
  ( (array!102961 (arr!49682 (Array (_ BitVec 32) (_ BitVec 64))) (size!50232 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102960)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102960 (_ BitVec 32)) Bool)

(assert (=> b!1543929 (= res!1059233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!68702 () Bool)

(declare-fun call!68708 () ListLongMap!22027)

(declare-fun call!68707 () ListLongMap!22027)

(assert (=> bm!68702 (= call!68708 call!68707)))

(declare-fun bm!68703 () Bool)

(declare-fun call!68709 () ListLongMap!22027)

(assert (=> bm!68703 (= call!68706 call!68709)))

(declare-fun res!1059234 () Bool)

(assert (=> start!131884 (=> (not res!1059234) (not e!859362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131884 (= res!1059234 (validMask!0 mask!926))))

(assert (=> start!131884 e!859362))

(declare-fun array_inv!38647 (array!102960) Bool)

(assert (=> start!131884 (array_inv!38647 _keys!618)))

(assert (=> start!131884 tp_is_empty!37873))

(assert (=> start!131884 true))

(assert (=> start!131884 tp!111043))

(declare-datatypes ((ValueCell!18026 0))(
  ( (ValueCellFull!18026 (v!21815 V!58941)) (EmptyCell!18026) )
))
(declare-datatypes ((array!102962 0))(
  ( (array!102963 (arr!49683 (Array (_ BitVec 32) ValueCell!18026)) (size!50233 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102962)

(declare-fun e!859365 () Bool)

(declare-fun array_inv!38648 (array!102962) Bool)

(assert (=> start!131884 (and (array_inv!38648 _values!470) e!859365)))

(declare-fun c!141317 () Bool)

(declare-fun zeroValue!436 () V!58941)

(declare-fun call!68705 () ListLongMap!22027)

(declare-fun minValue!436 () V!58941)

(declare-fun bm!68704 () Bool)

(declare-fun c!141315 () Bool)

(declare-fun +!4868 (ListLongMap!22027 tuple2!24418) ListLongMap!22027)

(assert (=> bm!68704 (= call!68709 (+!4868 (ite c!141317 call!68705 (ite c!141315 call!68707 call!68708)) (ite (or c!141317 c!141315) (tuple2!24419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1543930 () Bool)

(declare-fun res!1059236 () Bool)

(assert (=> b!1543930 (=> (not res!1059236) (not e!859362))))

(declare-datatypes ((List!35936 0))(
  ( (Nil!35933) (Cons!35932 (h!37377 (_ BitVec 64)) (t!50630 List!35936)) )
))
(declare-fun arrayNoDuplicates!0 (array!102960 (_ BitVec 32) List!35936) Bool)

(assert (=> b!1543930 (= res!1059236 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35933))))

(declare-fun b!1543931 () Bool)

(declare-fun res!1059237 () Bool)

(assert (=> b!1543931 (=> (not res!1059237) (not e!859362))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543931 (= res!1059237 (and (= (size!50233 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50232 _keys!618) (size!50233 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543932 () Bool)

(declare-fun e!859363 () Bool)

(assert (=> b!1543932 (= e!859365 (and e!859363 mapRes!58513))))

(declare-fun condMapEmpty!58513 () Bool)

(declare-fun mapDefault!58513 () ValueCell!18026)

