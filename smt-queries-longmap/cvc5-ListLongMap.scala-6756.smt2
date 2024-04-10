; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84740 () Bool)

(assert start!84740)

(declare-fun b_free!20095 () Bool)

(declare-fun b_next!20095 () Bool)

(assert (=> start!84740 (= b_free!20095 (not b_next!20095))))

(declare-fun tp!70084 () Bool)

(declare-fun b_and!32265 () Bool)

(assert (=> start!84740 (= tp!70084 b_and!32265)))

(declare-fun e!558805 () Bool)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36065 0))(
  ( (V!36066 (val!11706 Int)) )
))
(declare-fun minValue!1220 () V!36065)

(declare-datatypes ((ValueCell!11174 0))(
  ( (ValueCellFull!11174 (v!14279 V!36065)) (EmptyCell!11174) )
))
(declare-datatypes ((array!62585 0))(
  ( (array!62586 (arr!30143 (Array (_ BitVec 32) ValueCell!11174)) (size!30622 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62585)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!36065)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun b!990978 () Bool)

(declare-datatypes ((array!62587 0))(
  ( (array!62588 (arr!30144 (Array (_ BitVec 32) (_ BitVec 64))) (size!30623 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62587)

(declare-datatypes ((tuple2!14928 0))(
  ( (tuple2!14929 (_1!7475 (_ BitVec 64)) (_2!7475 V!36065)) )
))
(declare-datatypes ((List!20856 0))(
  ( (Nil!20853) (Cons!20852 (h!22014 tuple2!14928) (t!29835 List!20856)) )
))
(declare-datatypes ((ListLongMap!13625 0))(
  ( (ListLongMap!13626 (toList!6828 List!20856)) )
))
(declare-fun getCurrentListMap!3878 (array!62587 array!62585 (_ BitVec 32) (_ BitVec 32) V!36065 V!36065 (_ BitVec 32) Int) ListLongMap!13625)

(declare-fun +!3094 (ListLongMap!13625 tuple2!14928) ListLongMap!13625)

(declare-fun get!15651 (ValueCell!11174 V!36065) V!36065)

(declare-fun dynLambda!1875 (Int (_ BitVec 64)) V!36065)

(assert (=> b!990978 (= e!558805 (not (= (getCurrentListMap!3878 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3094 (getCurrentListMap!3878 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) (get!15651 (select (arr!30143 _values!1278) from!1932) (dynLambda!1875 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!990979 () Bool)

(declare-fun res!662548 () Bool)

(declare-fun e!558806 () Bool)

(assert (=> b!990979 (=> (not res!662548) (not e!558806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990979 (= res!662548 (validKeyInArray!0 (select (arr!30144 _keys!1544) from!1932)))))

(declare-fun res!662547 () Bool)

(assert (=> start!84740 (=> (not res!662547) (not e!558806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84740 (= res!662547 (validMask!0 mask!1948))))

(assert (=> start!84740 e!558806))

(assert (=> start!84740 true))

(declare-fun tp_is_empty!23311 () Bool)

(assert (=> start!84740 tp_is_empty!23311))

(declare-fun e!558807 () Bool)

(declare-fun array_inv!23277 (array!62585) Bool)

(assert (=> start!84740 (and (array_inv!23277 _values!1278) e!558807)))

(assert (=> start!84740 tp!70084))

(declare-fun array_inv!23278 (array!62587) Bool)

(assert (=> start!84740 (array_inv!23278 _keys!1544)))

(declare-fun b!990980 () Bool)

(declare-fun e!558804 () Bool)

(declare-fun mapRes!37019 () Bool)

(assert (=> b!990980 (= e!558807 (and e!558804 mapRes!37019))))

(declare-fun condMapEmpty!37019 () Bool)

(declare-fun mapDefault!37019 () ValueCell!11174)

