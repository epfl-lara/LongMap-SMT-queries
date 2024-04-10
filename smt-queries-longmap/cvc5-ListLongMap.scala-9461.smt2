; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112374 () Bool)

(assert start!112374)

(declare-fun b_free!30769 () Bool)

(declare-fun b_next!30769 () Bool)

(assert (=> start!112374 (= b_free!30769 (not b_next!30769))))

(declare-fun tp!107943 () Bool)

(declare-fun b_and!49593 () Bool)

(assert (=> start!112374 (= tp!107943 b_and!49593)))

(declare-fun b!1332173 () Bool)

(declare-fun res!884045 () Bool)

(declare-fun e!758969 () Bool)

(assert (=> b!1332173 (=> (not res!884045) (not e!758969))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332173 (= res!884045 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!884038 () Bool)

(assert (=> start!112374 (=> (not res!884038) (not e!758969))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112374 (= res!884038 (validMask!0 mask!1998))))

(assert (=> start!112374 e!758969))

(declare-datatypes ((V!54009 0))(
  ( (V!54010 (val!18414 Int)) )
))
(declare-datatypes ((ValueCell!17441 0))(
  ( (ValueCellFull!17441 (v!21051 V!54009)) (EmptyCell!17441) )
))
(declare-datatypes ((array!90238 0))(
  ( (array!90239 (arr!43585 (Array (_ BitVec 32) ValueCell!17441)) (size!44135 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90238)

(declare-fun e!758970 () Bool)

(declare-fun array_inv!32873 (array!90238) Bool)

(assert (=> start!112374 (and (array_inv!32873 _values!1320) e!758970)))

(assert (=> start!112374 true))

(declare-datatypes ((array!90240 0))(
  ( (array!90241 (arr!43586 (Array (_ BitVec 32) (_ BitVec 64))) (size!44136 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90240)

(declare-fun array_inv!32874 (array!90240) Bool)

(assert (=> start!112374 (array_inv!32874 _keys!1590)))

(assert (=> start!112374 tp!107943))

(declare-fun tp_is_empty!36679 () Bool)

(assert (=> start!112374 tp_is_empty!36679))

(declare-fun b!1332174 () Bool)

(declare-fun res!884043 () Bool)

(assert (=> b!1332174 (=> (not res!884043) (not e!758969))))

(assert (=> b!1332174 (= res!884043 (and (= (size!44135 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44136 _keys!1590) (size!44135 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56692 () Bool)

(declare-fun mapRes!56692 () Bool)

(declare-fun tp!107944 () Bool)

(declare-fun e!758967 () Bool)

(assert (=> mapNonEmpty!56692 (= mapRes!56692 (and tp!107944 e!758967))))

(declare-fun mapValue!56692 () ValueCell!17441)

(declare-fun mapKey!56692 () (_ BitVec 32))

(declare-fun mapRest!56692 () (Array (_ BitVec 32) ValueCell!17441))

(assert (=> mapNonEmpty!56692 (= (arr!43585 _values!1320) (store mapRest!56692 mapKey!56692 mapValue!56692))))

(declare-fun b!1332175 () Bool)

(declare-fun res!884041 () Bool)

(assert (=> b!1332175 (=> (not res!884041) (not e!758969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90240 (_ BitVec 32)) Bool)

(assert (=> b!1332175 (= res!884041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332176 () Bool)

(declare-fun res!884039 () Bool)

(assert (=> b!1332176 (=> (not res!884039) (not e!758969))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54009)

(declare-fun zeroValue!1262 () V!54009)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23730 0))(
  ( (tuple2!23731 (_1!11876 (_ BitVec 64)) (_2!11876 V!54009)) )
))
(declare-datatypes ((List!30874 0))(
  ( (Nil!30871) (Cons!30870 (h!32079 tuple2!23730) (t!45056 List!30874)) )
))
(declare-datatypes ((ListLongMap!21387 0))(
  ( (ListLongMap!21388 (toList!10709 List!30874)) )
))
(declare-fun contains!8873 (ListLongMap!21387 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5690 (array!90240 array!90238 (_ BitVec 32) (_ BitVec 32) V!54009 V!54009 (_ BitVec 32) Int) ListLongMap!21387)

(assert (=> b!1332176 (= res!884039 (contains!8873 (getCurrentListMap!5690 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1332177 () Bool)

(declare-fun e!758968 () Bool)

(assert (=> b!1332177 (= e!758970 (and e!758968 mapRes!56692))))

(declare-fun condMapEmpty!56692 () Bool)

(declare-fun mapDefault!56692 () ValueCell!17441)

