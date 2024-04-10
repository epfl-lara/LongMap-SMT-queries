; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4324 () Bool)

(assert start!4324)

(declare-fun b_free!1165 () Bool)

(declare-fun b_next!1165 () Bool)

(assert (=> start!4324 (= b_free!1165 (not b_next!1165))))

(declare-fun tp!4924 () Bool)

(declare-fun b_and!1981 () Bool)

(assert (=> start!4324 (= tp!4924 b_and!1981)))

(declare-fun b!33252 () Bool)

(declare-fun res!20198 () Bool)

(declare-fun e!21125 () Bool)

(assert (=> b!33252 (=> (not res!20198) (not e!21125))))

(declare-datatypes ((array!2253 0))(
  ( (array!2254 (arr!1077 (Array (_ BitVec 32) (_ BitVec 64))) (size!1178 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2253)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2253 (_ BitVec 32)) Bool)

(assert (=> b!33252 (= res!20198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33253 () Bool)

(declare-fun e!21126 () Bool)

(assert (=> b!33253 (= e!21125 e!21126)))

(declare-fun res!20202 () Bool)

(assert (=> b!33253 (=> (not res!20202) (not e!21126))))

(declare-datatypes ((V!1851 0))(
  ( (V!1852 (val!786 Int)) )
))
(declare-datatypes ((tuple2!1282 0))(
  ( (tuple2!1283 (_1!652 (_ BitVec 64)) (_2!652 V!1851)) )
))
(declare-datatypes ((List!873 0))(
  ( (Nil!870) (Cons!869 (h!1436 tuple2!1282) (t!3572 List!873)) )
))
(declare-datatypes ((ListLongMap!859 0))(
  ( (ListLongMap!860 (toList!445 List!873)) )
))
(declare-fun lt!12094 () ListLongMap!859)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!388 (ListLongMap!859 (_ BitVec 64)) Bool)

(assert (=> b!33253 (= res!20202 (not (contains!388 lt!12094 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!560 0))(
  ( (ValueCellFull!560 (v!1878 V!1851)) (EmptyCell!560) )
))
(declare-datatypes ((array!2255 0))(
  ( (array!2256 (arr!1078 (Array (_ BitVec 32) ValueCell!560)) (size!1179 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2255)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1851)

(declare-fun minValue!1443 () V!1851)

(declare-fun getCurrentListMap!272 (array!2253 array!2255 (_ BitVec 32) (_ BitVec 32) V!1851 V!1851 (_ BitVec 32) Int) ListLongMap!859)

(assert (=> b!33253 (= lt!12094 (getCurrentListMap!272 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1816 () Bool)

(declare-fun mapRes!1816 () Bool)

(declare-fun tp!4923 () Bool)

(declare-fun e!21123 () Bool)

(assert (=> mapNonEmpty!1816 (= mapRes!1816 (and tp!4923 e!21123))))

(declare-fun mapKey!1816 () (_ BitVec 32))

(declare-fun mapValue!1816 () ValueCell!560)

(declare-fun mapRest!1816 () (Array (_ BitVec 32) ValueCell!560))

(assert (=> mapNonEmpty!1816 (= (arr!1078 _values!1501) (store mapRest!1816 mapKey!1816 mapValue!1816))))

(declare-fun b!33254 () Bool)

(declare-fun e!21124 () Bool)

(declare-fun e!21122 () Bool)

(assert (=> b!33254 (= e!21124 (and e!21122 mapRes!1816))))

(declare-fun condMapEmpty!1816 () Bool)

(declare-fun mapDefault!1816 () ValueCell!560)

