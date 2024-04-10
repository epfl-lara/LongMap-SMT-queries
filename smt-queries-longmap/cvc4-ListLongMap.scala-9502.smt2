; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112682 () Bool)

(assert start!112682)

(declare-fun b_free!31019 () Bool)

(declare-fun b_next!31019 () Bool)

(assert (=> start!112682 (= b_free!31019 (not b_next!31019))))

(declare-fun tp!108698 () Bool)

(declare-fun b_and!49975 () Bool)

(assert (=> start!112682 (= tp!108698 b_and!49975)))

(declare-fun b!1336671 () Bool)

(declare-fun res!887071 () Bool)

(declare-fun e!761170 () Bool)

(assert (=> b!1336671 (=> (not res!887071) (not e!761170))))

(declare-datatypes ((array!90716 0))(
  ( (array!90717 (arr!43823 (Array (_ BitVec 32) (_ BitVec 64))) (size!44373 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90716)

(declare-datatypes ((List!31054 0))(
  ( (Nil!31051) (Cons!31050 (h!32259 (_ BitVec 64)) (t!45354 List!31054)) )
))
(declare-fun arrayNoDuplicates!0 (array!90716 (_ BitVec 32) List!31054) Bool)

(assert (=> b!1336671 (= res!887071 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31051))))

(declare-fun b!1336672 () Bool)

(declare-fun res!887075 () Bool)

(assert (=> b!1336672 (=> (not res!887075) (not e!761170))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1336672 (= res!887075 (not (= (select (arr!43823 _keys!1590) from!1980) k!1153)))))

(declare-fun mapIsEmpty!57071 () Bool)

(declare-fun mapRes!57071 () Bool)

(assert (=> mapIsEmpty!57071 mapRes!57071))

(declare-fun mapNonEmpty!57071 () Bool)

(declare-fun tp!108697 () Bool)

(declare-fun e!761169 () Bool)

(assert (=> mapNonEmpty!57071 (= mapRes!57071 (and tp!108697 e!761169))))

(declare-datatypes ((V!54341 0))(
  ( (V!54342 (val!18539 Int)) )
))
(declare-datatypes ((ValueCell!17566 0))(
  ( (ValueCellFull!17566 (v!21179 V!54341)) (EmptyCell!17566) )
))
(declare-datatypes ((array!90718 0))(
  ( (array!90719 (arr!43824 (Array (_ BitVec 32) ValueCell!17566)) (size!44374 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90718)

(declare-fun mapRest!57071 () (Array (_ BitVec 32) ValueCell!17566))

(declare-fun mapKey!57071 () (_ BitVec 32))

(declare-fun mapValue!57071 () ValueCell!17566)

(assert (=> mapNonEmpty!57071 (= (arr!43824 _values!1320) (store mapRest!57071 mapKey!57071 mapValue!57071))))

(declare-fun res!887076 () Bool)

(assert (=> start!112682 (=> (not res!887076) (not e!761170))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112682 (= res!887076 (validMask!0 mask!1998))))

(assert (=> start!112682 e!761170))

(declare-fun e!761167 () Bool)

(declare-fun array_inv!33049 (array!90718) Bool)

(assert (=> start!112682 (and (array_inv!33049 _values!1320) e!761167)))

(assert (=> start!112682 true))

(declare-fun array_inv!33050 (array!90716) Bool)

(assert (=> start!112682 (array_inv!33050 _keys!1590)))

(assert (=> start!112682 tp!108698))

(declare-fun tp_is_empty!36929 () Bool)

(assert (=> start!112682 tp_is_empty!36929))

(declare-fun b!1336673 () Bool)

(declare-fun res!887073 () Bool)

(assert (=> b!1336673 (=> (not res!887073) (not e!761170))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1336673 (= res!887073 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44373 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336674 () Bool)

(declare-fun e!761168 () Bool)

(assert (=> b!1336674 (= e!761168 tp_is_empty!36929)))

(declare-fun b!1336675 () Bool)

(declare-fun res!887078 () Bool)

(assert (=> b!1336675 (=> (not res!887078) (not e!761170))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54341)

(declare-fun zeroValue!1262 () V!54341)

(declare-datatypes ((tuple2!23912 0))(
  ( (tuple2!23913 (_1!11967 (_ BitVec 64)) (_2!11967 V!54341)) )
))
(declare-datatypes ((List!31055 0))(
  ( (Nil!31052) (Cons!31051 (h!32260 tuple2!23912) (t!45355 List!31055)) )
))
(declare-datatypes ((ListLongMap!21569 0))(
  ( (ListLongMap!21570 (toList!10800 List!31055)) )
))
(declare-fun contains!8965 (ListLongMap!21569 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5772 (array!90716 array!90718 (_ BitVec 32) (_ BitVec 32) V!54341 V!54341 (_ BitVec 32) Int) ListLongMap!21569)

(assert (=> b!1336675 (= res!887078 (contains!8965 (getCurrentListMap!5772 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1336676 () Bool)

(declare-fun res!887074 () Bool)

(assert (=> b!1336676 (=> (not res!887074) (not e!761170))))

(assert (=> b!1336676 (= res!887074 (and (= (size!44374 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44373 _keys!1590) (size!44374 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336677 () Bool)

(declare-fun res!887070 () Bool)

(assert (=> b!1336677 (=> (not res!887070) (not e!761170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336677 (= res!887070 (validKeyInArray!0 (select (arr!43823 _keys!1590) from!1980)))))

(declare-fun b!1336678 () Bool)

(assert (=> b!1336678 (= e!761167 (and e!761168 mapRes!57071))))

(declare-fun condMapEmpty!57071 () Bool)

(declare-fun mapDefault!57071 () ValueCell!17566)

