; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84660 () Bool)

(assert start!84660)

(declare-fun b_free!20071 () Bool)

(declare-fun b_next!20071 () Bool)

(assert (=> start!84660 (= b_free!20071 (not b_next!20071))))

(declare-fun tp!70008 () Bool)

(declare-fun b_and!32213 () Bool)

(assert (=> start!84660 (= tp!70008 b_and!32213)))

(declare-fun b!990095 () Bool)

(declare-fun res!662068 () Bool)

(declare-fun e!558290 () Bool)

(assert (=> b!990095 (=> (not res!662068) (not e!558290))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36033 0))(
  ( (V!36034 (val!11694 Int)) )
))
(declare-datatypes ((ValueCell!11162 0))(
  ( (ValueCellFull!11162 (v!14264 V!36033)) (EmptyCell!11162) )
))
(declare-datatypes ((array!62535 0))(
  ( (array!62536 (arr!30119 (Array (_ BitVec 32) ValueCell!11162)) (size!30598 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62535)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62537 0))(
  ( (array!62538 (arr!30120 (Array (_ BitVec 32) (_ BitVec 64))) (size!30599 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62537)

(assert (=> b!990095 (= res!662068 (and (= (size!30598 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30599 _keys!1544) (size!30598 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!662071 () Bool)

(assert (=> start!84660 (=> (not res!662071) (not e!558290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84660 (= res!662071 (validMask!0 mask!1948))))

(assert (=> start!84660 e!558290))

(assert (=> start!84660 true))

(declare-fun tp_is_empty!23287 () Bool)

(assert (=> start!84660 tp_is_empty!23287))

(declare-fun e!558288 () Bool)

(declare-fun array_inv!23261 (array!62535) Bool)

(assert (=> start!84660 (and (array_inv!23261 _values!1278) e!558288)))

(assert (=> start!84660 tp!70008))

(declare-fun array_inv!23262 (array!62537) Bool)

(assert (=> start!84660 (array_inv!23262 _keys!1544)))

(declare-fun mapIsEmpty!36979 () Bool)

(declare-fun mapRes!36979 () Bool)

(assert (=> mapIsEmpty!36979 mapRes!36979))

(declare-fun b!990096 () Bool)

(declare-fun res!662073 () Bool)

(assert (=> b!990096 (=> (not res!662073) (not e!558290))))

(declare-datatypes ((List!20839 0))(
  ( (Nil!20836) (Cons!20835 (h!21997 (_ BitVec 64)) (t!29806 List!20839)) )
))
(declare-fun arrayNoDuplicates!0 (array!62537 (_ BitVec 32) List!20839) Bool)

(assert (=> b!990096 (= res!662073 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20836))))

(declare-fun b!990097 () Bool)

(declare-fun e!558289 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!990097 (= e!558289 (not (bvslt from!1932 (size!30598 _values!1278))))))

(declare-fun minValue!1220 () V!36033)

(declare-fun zeroValue!1220 () V!36033)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14910 0))(
  ( (tuple2!14911 (_1!7466 (_ BitVec 64)) (_2!7466 V!36033)) )
))
(declare-datatypes ((List!20840 0))(
  ( (Nil!20837) (Cons!20836 (h!21998 tuple2!14910) (t!29807 List!20840)) )
))
(declare-datatypes ((ListLongMap!13607 0))(
  ( (ListLongMap!13608 (toList!6819 List!20840)) )
))
(declare-fun lt!439223 () ListLongMap!13607)

(declare-fun getCurrentListMap!3869 (array!62537 array!62535 (_ BitVec 32) (_ BitVec 32) V!36033 V!36033 (_ BitVec 32) Int) ListLongMap!13607)

(assert (=> b!990097 (= lt!439223 (getCurrentListMap!3869 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439222 () ListLongMap!13607)

(declare-fun lt!439224 () tuple2!14910)

(declare-fun lt!439221 () tuple2!14910)

(declare-fun +!3089 (ListLongMap!13607 tuple2!14910) ListLongMap!13607)

(assert (=> b!990097 (= (+!3089 (+!3089 lt!439222 lt!439224) lt!439221) (+!3089 (+!3089 lt!439222 lt!439221) lt!439224))))

(declare-fun lt!439220 () V!36033)

(assert (=> b!990097 (= lt!439221 (tuple2!14911 (select (arr!30120 _keys!1544) from!1932) lt!439220))))

(assert (=> b!990097 (= lt!439224 (tuple2!14911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32852 0))(
  ( (Unit!32853) )
))
(declare-fun lt!439219 () Unit!32852)

(declare-fun addCommutativeForDiffKeys!711 (ListLongMap!13607 (_ BitVec 64) V!36033 (_ BitVec 64) V!36033) Unit!32852)

(assert (=> b!990097 (= lt!439219 (addCommutativeForDiffKeys!711 lt!439222 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30120 _keys!1544) from!1932) lt!439220))))

(declare-fun b!990098 () Bool)

(declare-fun res!662070 () Bool)

(assert (=> b!990098 (=> (not res!662070) (not e!558290))))

(assert (=> b!990098 (= res!662070 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!990099 () Bool)

(declare-fun res!662067 () Bool)

(assert (=> b!990099 (=> (not res!662067) (not e!558290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990099 (= res!662067 (validKeyInArray!0 (select (arr!30120 _keys!1544) from!1932)))))

(declare-fun b!990100 () Bool)

(declare-fun e!558291 () Bool)

(assert (=> b!990100 (= e!558291 tp_is_empty!23287)))

(declare-fun mapNonEmpty!36979 () Bool)

(declare-fun tp!70007 () Bool)

(declare-fun e!558286 () Bool)

(assert (=> mapNonEmpty!36979 (= mapRes!36979 (and tp!70007 e!558286))))

(declare-fun mapKey!36979 () (_ BitVec 32))

(declare-fun mapValue!36979 () ValueCell!11162)

(declare-fun mapRest!36979 () (Array (_ BitVec 32) ValueCell!11162))

(assert (=> mapNonEmpty!36979 (= (arr!30119 _values!1278) (store mapRest!36979 mapKey!36979 mapValue!36979))))

(declare-fun b!990101 () Bool)

(assert (=> b!990101 (= e!558288 (and e!558291 mapRes!36979))))

(declare-fun condMapEmpty!36979 () Bool)

(declare-fun mapDefault!36979 () ValueCell!11162)

