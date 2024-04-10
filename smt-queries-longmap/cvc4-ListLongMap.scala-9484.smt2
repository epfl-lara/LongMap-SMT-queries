; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112516 () Bool)

(assert start!112516)

(declare-fun b_free!30911 () Bool)

(declare-fun b_next!30911 () Bool)

(assert (=> start!112516 (= b_free!30911 (not b_next!30911))))

(declare-fun tp!108370 () Bool)

(declare-fun b_and!49819 () Bool)

(assert (=> start!112516 (= tp!108370 b_and!49819)))

(declare-fun b!1334646 () Bool)

(declare-fun e!760115 () Bool)

(declare-fun tp_is_empty!36821 () Bool)

(assert (=> b!1334646 (= e!760115 tp_is_empty!36821)))

(declare-fun b!1334647 () Bool)

(declare-fun res!885791 () Bool)

(declare-fun e!760116 () Bool)

(assert (=> b!1334647 (=> (not res!885791) (not e!760116))))

(declare-datatypes ((V!54197 0))(
  ( (V!54198 (val!18485 Int)) )
))
(declare-datatypes ((ValueCell!17512 0))(
  ( (ValueCellFull!17512 (v!21122 V!54197)) (EmptyCell!17512) )
))
(declare-datatypes ((array!90508 0))(
  ( (array!90509 (arr!43720 (Array (_ BitVec 32) ValueCell!17512)) (size!44270 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90508)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90510 0))(
  ( (array!90511 (arr!43721 (Array (_ BitVec 32) (_ BitVec 64))) (size!44271 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90510)

(assert (=> b!1334647 (= res!885791 (and (= (size!44270 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44271 _keys!1590) (size!44270 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334648 () Bool)

(declare-fun e!760114 () Bool)

(assert (=> b!1334648 (= e!760114 tp_is_empty!36821)))

(declare-fun res!885790 () Bool)

(assert (=> start!112516 (=> (not res!885790) (not e!760116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112516 (= res!885790 (validMask!0 mask!1998))))

(assert (=> start!112516 e!760116))

(declare-fun e!760117 () Bool)

(declare-fun array_inv!32973 (array!90508) Bool)

(assert (=> start!112516 (and (array_inv!32973 _values!1320) e!760117)))

(assert (=> start!112516 true))

(declare-fun array_inv!32974 (array!90510) Bool)

(assert (=> start!112516 (array_inv!32974 _keys!1590)))

(assert (=> start!112516 tp!108370))

(assert (=> start!112516 tp_is_empty!36821))

(declare-fun b!1334649 () Bool)

(declare-fun res!885789 () Bool)

(assert (=> b!1334649 (=> (not res!885789) (not e!760116))))

(declare-datatypes ((List!30975 0))(
  ( (Nil!30972) (Cons!30971 (h!32180 (_ BitVec 64)) (t!45239 List!30975)) )
))
(declare-fun arrayNoDuplicates!0 (array!90510 (_ BitVec 32) List!30975) Bool)

(assert (=> b!1334649 (= res!885789 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30972))))

(declare-fun b!1334650 () Bool)

(assert (=> b!1334650 (= e!760116 false)))

(declare-fun lt!592372 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54197)

(declare-fun zeroValue!1262 () V!54197)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23836 0))(
  ( (tuple2!23837 (_1!11929 (_ BitVec 64)) (_2!11929 V!54197)) )
))
(declare-datatypes ((List!30976 0))(
  ( (Nil!30973) (Cons!30972 (h!32181 tuple2!23836) (t!45240 List!30976)) )
))
(declare-datatypes ((ListLongMap!21493 0))(
  ( (ListLongMap!21494 (toList!10762 List!30976)) )
))
(declare-fun contains!8926 (ListLongMap!21493 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5736 (array!90510 array!90508 (_ BitVec 32) (_ BitVec 32) V!54197 V!54197 (_ BitVec 32) Int) ListLongMap!21493)

(assert (=> b!1334650 (= lt!592372 (contains!8926 (getCurrentListMap!5736 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1334651 () Bool)

(declare-fun res!885788 () Bool)

(assert (=> b!1334651 (=> (not res!885788) (not e!760116))))

(assert (=> b!1334651 (= res!885788 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44271 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56905 () Bool)

(declare-fun mapRes!56905 () Bool)

(assert (=> mapIsEmpty!56905 mapRes!56905))

(declare-fun b!1334652 () Bool)

(assert (=> b!1334652 (= e!760117 (and e!760114 mapRes!56905))))

(declare-fun condMapEmpty!56905 () Bool)

(declare-fun mapDefault!56905 () ValueCell!17512)

