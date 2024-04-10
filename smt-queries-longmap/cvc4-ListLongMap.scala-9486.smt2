; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112528 () Bool)

(assert start!112528)

(declare-fun b_free!30923 () Bool)

(declare-fun b_next!30923 () Bool)

(assert (=> start!112528 (= b_free!30923 (not b_next!30923))))

(declare-fun tp!108406 () Bool)

(declare-fun b_and!49831 () Bool)

(assert (=> start!112528 (= tp!108406 b_and!49831)))

(declare-fun b!1334790 () Bool)

(declare-fun e!760204 () Bool)

(assert (=> b!1334790 (= e!760204 false)))

(declare-fun lt!592390 () Bool)

(declare-datatypes ((V!54213 0))(
  ( (V!54214 (val!18491 Int)) )
))
(declare-datatypes ((ValueCell!17518 0))(
  ( (ValueCellFull!17518 (v!21128 V!54213)) (EmptyCell!17518) )
))
(declare-datatypes ((array!90528 0))(
  ( (array!90529 (arr!43730 (Array (_ BitVec 32) ValueCell!17518)) (size!44280 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90528)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90530 0))(
  ( (array!90531 (arr!43731 (Array (_ BitVec 32) (_ BitVec 64))) (size!44281 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90530)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54213)

(declare-fun zeroValue!1262 () V!54213)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23842 0))(
  ( (tuple2!23843 (_1!11932 (_ BitVec 64)) (_2!11932 V!54213)) )
))
(declare-datatypes ((List!30981 0))(
  ( (Nil!30978) (Cons!30977 (h!32186 tuple2!23842) (t!45245 List!30981)) )
))
(declare-datatypes ((ListLongMap!21499 0))(
  ( (ListLongMap!21500 (toList!10765 List!30981)) )
))
(declare-fun contains!8929 (ListLongMap!21499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5739 (array!90530 array!90528 (_ BitVec 32) (_ BitVec 32) V!54213 V!54213 (_ BitVec 32) Int) ListLongMap!21499)

(assert (=> b!1334790 (= lt!592390 (contains!8929 (getCurrentListMap!5739 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1334791 () Bool)

(declare-fun e!760207 () Bool)

(declare-fun tp_is_empty!36833 () Bool)

(assert (=> b!1334791 (= e!760207 tp_is_empty!36833)))

(declare-fun b!1334792 () Bool)

(declare-fun res!885881 () Bool)

(assert (=> b!1334792 (=> (not res!885881) (not e!760204))))

(assert (=> b!1334792 (= res!885881 (and (= (size!44280 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44281 _keys!1590) (size!44280 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334793 () Bool)

(declare-fun e!760205 () Bool)

(declare-fun e!760203 () Bool)

(declare-fun mapRes!56923 () Bool)

(assert (=> b!1334793 (= e!760205 (and e!760203 mapRes!56923))))

(declare-fun condMapEmpty!56923 () Bool)

(declare-fun mapDefault!56923 () ValueCell!17518)

