; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84736 () Bool)

(assert start!84736)

(declare-fun b_free!20091 () Bool)

(declare-fun b_next!20091 () Bool)

(assert (=> start!84736 (= b_free!20091 (not b_next!20091))))

(declare-fun tp!70072 () Bool)

(declare-fun b_and!32261 () Bool)

(assert (=> start!84736 (= tp!70072 b_and!32261)))

(declare-fun mapIsEmpty!37013 () Bool)

(declare-fun mapRes!37013 () Bool)

(assert (=> mapIsEmpty!37013 mapRes!37013))

(declare-fun b!990918 () Bool)

(declare-fun res!662506 () Bool)

(declare-fun e!558770 () Bool)

(assert (=> b!990918 (=> (not res!662506) (not e!558770))))

(declare-datatypes ((array!62577 0))(
  ( (array!62578 (arr!30139 (Array (_ BitVec 32) (_ BitVec 64))) (size!30618 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62577)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62577 (_ BitVec 32)) Bool)

(assert (=> b!990918 (= res!662506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!990919 () Bool)

(declare-fun e!558771 () Bool)

(assert (=> b!990919 (= e!558770 e!558771)))

(declare-fun res!662505 () Bool)

(assert (=> b!990919 (=> (not res!662505) (not e!558771))))

(declare-fun lt!439700 () Bool)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!990919 (= res!662505 (and (or lt!439700 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!439700 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!439700))))))

(assert (=> b!990919 (= lt!439700 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!990920 () Bool)

(declare-fun e!558768 () Bool)

(declare-fun e!558772 () Bool)

(assert (=> b!990920 (= e!558768 (and e!558772 mapRes!37013))))

(declare-fun condMapEmpty!37013 () Bool)

(declare-datatypes ((V!36059 0))(
  ( (V!36060 (val!11704 Int)) )
))
(declare-datatypes ((ValueCell!11172 0))(
  ( (ValueCellFull!11172 (v!14277 V!36059)) (EmptyCell!11172) )
))
(declare-datatypes ((array!62579 0))(
  ( (array!62580 (arr!30140 (Array (_ BitVec 32) ValueCell!11172)) (size!30619 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62579)

(declare-fun mapDefault!37013 () ValueCell!11172)

(assert (=> b!990920 (= condMapEmpty!37013 (= (arr!30140 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11172)) mapDefault!37013)))))

(declare-fun b!990921 () Bool)

(declare-fun res!662503 () Bool)

(assert (=> b!990921 (=> (not res!662503) (not e!558770))))

(declare-datatypes ((List!20853 0))(
  ( (Nil!20850) (Cons!20849 (h!22011 (_ BitVec 64)) (t!29830 List!20853)) )
))
(declare-fun arrayNoDuplicates!0 (array!62577 (_ BitVec 32) List!20853) Bool)

(assert (=> b!990921 (= res!662503 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20850))))

(declare-fun b!990922 () Bool)

(declare-fun res!662507 () Bool)

(assert (=> b!990922 (=> (not res!662507) (not e!558770))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!990922 (= res!662507 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30618 _keys!1544))))))

(declare-fun b!990923 () Bool)

(declare-fun tp_is_empty!23307 () Bool)

(assert (=> b!990923 (= e!558772 tp_is_empty!23307)))

(declare-fun b!990924 () Bool)

(declare-fun res!662502 () Bool)

(assert (=> b!990924 (=> (not res!662502) (not e!558770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990924 (= res!662502 (validKeyInArray!0 (select (arr!30139 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!37013 () Bool)

(declare-fun tp!70071 () Bool)

(declare-fun e!558769 () Bool)

(assert (=> mapNonEmpty!37013 (= mapRes!37013 (and tp!70071 e!558769))))

(declare-fun mapValue!37013 () ValueCell!11172)

(declare-fun mapRest!37013 () (Array (_ BitVec 32) ValueCell!11172))

(declare-fun mapKey!37013 () (_ BitVec 32))

(assert (=> mapNonEmpty!37013 (= (arr!30140 _values!1278) (store mapRest!37013 mapKey!37013 mapValue!37013))))

(declare-fun res!662504 () Bool)

(assert (=> start!84736 (=> (not res!662504) (not e!558770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84736 (= res!662504 (validMask!0 mask!1948))))

(assert (=> start!84736 e!558770))

(assert (=> start!84736 true))

(assert (=> start!84736 tp_is_empty!23307))

(declare-fun array_inv!23275 (array!62579) Bool)

(assert (=> start!84736 (and (array_inv!23275 _values!1278) e!558768)))

(assert (=> start!84736 tp!70072))

(declare-fun array_inv!23276 (array!62577) Bool)

(assert (=> start!84736 (array_inv!23276 _keys!1544)))

(declare-fun b!990925 () Bool)

(declare-fun res!662508 () Bool)

(assert (=> b!990925 (=> (not res!662508) (not e!558770))))

(assert (=> b!990925 (= res!662508 (and (= (size!30619 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30618 _keys!1544) (size!30619 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990926 () Bool)

(assert (=> b!990926 (= e!558771 (bvsge from!1932 (size!30619 _values!1278)))))

(declare-fun minValue!1220 () V!36059)

(declare-datatypes ((tuple2!14924 0))(
  ( (tuple2!14925 (_1!7473 (_ BitVec 64)) (_2!7473 V!36059)) )
))
(declare-datatypes ((List!20854 0))(
  ( (Nil!20851) (Cons!20850 (h!22012 tuple2!14924) (t!29831 List!20854)) )
))
(declare-datatypes ((ListLongMap!13621 0))(
  ( (ListLongMap!13622 (toList!6826 List!20854)) )
))
(declare-fun lt!439699 () ListLongMap!13621)

(declare-fun zeroValue!1220 () V!36059)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMap!3876 (array!62577 array!62579 (_ BitVec 32) (_ BitVec 32) V!36059 V!36059 (_ BitVec 32) Int) ListLongMap!13621)

(assert (=> b!990926 (= lt!439699 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990927 () Bool)

(assert (=> b!990927 (= e!558769 tp_is_empty!23307)))

(assert (= (and start!84736 res!662504) b!990925))

(assert (= (and b!990925 res!662508) b!990918))

(assert (= (and b!990918 res!662506) b!990921))

(assert (= (and b!990921 res!662503) b!990922))

(assert (= (and b!990922 res!662507) b!990924))

(assert (= (and b!990924 res!662502) b!990919))

(assert (= (and b!990919 res!662505) b!990926))

(assert (= (and b!990920 condMapEmpty!37013) mapIsEmpty!37013))

(assert (= (and b!990920 (not condMapEmpty!37013)) mapNonEmpty!37013))

(get-info :version)

(assert (= (and mapNonEmpty!37013 ((_ is ValueCellFull!11172) mapValue!37013)) b!990927))

(assert (= (and b!990920 ((_ is ValueCellFull!11172) mapDefault!37013)) b!990923))

(assert (= start!84736 b!990920))

(declare-fun m!918693 () Bool)

(assert (=> b!990924 m!918693))

(assert (=> b!990924 m!918693))

(declare-fun m!918695 () Bool)

(assert (=> b!990924 m!918695))

(declare-fun m!918697 () Bool)

(assert (=> b!990921 m!918697))

(declare-fun m!918699 () Bool)

(assert (=> start!84736 m!918699))

(declare-fun m!918701 () Bool)

(assert (=> start!84736 m!918701))

(declare-fun m!918703 () Bool)

(assert (=> start!84736 m!918703))

(declare-fun m!918705 () Bool)

(assert (=> b!990918 m!918705))

(declare-fun m!918707 () Bool)

(assert (=> mapNonEmpty!37013 m!918707))

(declare-fun m!918709 () Bool)

(assert (=> b!990926 m!918709))

(check-sat tp_is_empty!23307 (not mapNonEmpty!37013) (not start!84736) (not b!990926) b_and!32261 (not b!990918) (not b!990921) (not b!990924) (not b_next!20091))
(check-sat b_and!32261 (not b_next!20091))
