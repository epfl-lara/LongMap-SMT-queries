; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84524 () Bool)

(assert start!84524)

(declare-fun b_free!20019 () Bool)

(declare-fun b_next!20019 () Bool)

(assert (=> start!84524 (= b_free!20019 (not b_next!20019))))

(declare-fun tp!69841 () Bool)

(declare-fun b_and!32113 () Bool)

(assert (=> start!84524 (= tp!69841 b_and!32113)))

(declare-fun b!988612 () Bool)

(declare-fun e!557464 () Bool)

(declare-fun e!557461 () Bool)

(declare-fun mapRes!36891 () Bool)

(assert (=> b!988612 (= e!557464 (and e!557461 mapRes!36891))))

(declare-fun condMapEmpty!36891 () Bool)

(declare-datatypes ((V!35963 0))(
  ( (V!35964 (val!11668 Int)) )
))
(declare-datatypes ((ValueCell!11136 0))(
  ( (ValueCellFull!11136 (v!14235 V!35963)) (EmptyCell!11136) )
))
(declare-datatypes ((array!62429 0))(
  ( (array!62430 (arr!30069 (Array (_ BitVec 32) ValueCell!11136)) (size!30548 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62429)

(declare-fun mapDefault!36891 () ValueCell!11136)

(assert (=> b!988612 (= condMapEmpty!36891 (= (arr!30069 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11136)) mapDefault!36891)))))

(declare-fun b!988613 () Bool)

(declare-fun e!557460 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!988613 (= e!557460 (bvsge from!1932 (size!30548 _values!1278)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35963)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14866 0))(
  ( (tuple2!14867 (_1!7444 (_ BitVec 64)) (_2!7444 V!35963)) )
))
(declare-datatypes ((List!20797 0))(
  ( (Nil!20794) (Cons!20793 (h!21955 tuple2!14866) (t!29734 List!20797)) )
))
(declare-datatypes ((ListLongMap!13563 0))(
  ( (ListLongMap!13564 (toList!6797 List!20797)) )
))
(declare-fun lt!438535 () ListLongMap!13563)

(declare-fun zeroValue!1220 () V!35963)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((array!62431 0))(
  ( (array!62432 (arr!30070 (Array (_ BitVec 32) (_ BitVec 64))) (size!30549 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62431)

(declare-fun getCurrentListMapNoExtraKeys!3488 (array!62431 array!62429 (_ BitVec 32) (_ BitVec 32) V!35963 V!35963 (_ BitVec 32) Int) ListLongMap!13563)

(assert (=> b!988613 (= lt!438535 (getCurrentListMapNoExtraKeys!3488 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988614 () Bool)

(declare-fun res!661224 () Bool)

(assert (=> b!988614 (=> (not res!661224) (not e!557460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62431 (_ BitVec 32)) Bool)

(assert (=> b!988614 (= res!661224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36891 () Bool)

(assert (=> mapIsEmpty!36891 mapRes!36891))

(declare-fun b!988615 () Bool)

(declare-fun tp_is_empty!23235 () Bool)

(assert (=> b!988615 (= e!557461 tp_is_empty!23235)))

(declare-fun b!988616 () Bool)

(declare-fun res!661220 () Bool)

(assert (=> b!988616 (=> (not res!661220) (not e!557460))))

(assert (=> b!988616 (= res!661220 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30549 _keys!1544))))))

(declare-fun b!988617 () Bool)

(declare-fun res!661219 () Bool)

(assert (=> b!988617 (=> (not res!661219) (not e!557460))))

(assert (=> b!988617 (= res!661219 (and (= (size!30548 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30549 _keys!1544) (size!30548 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36891 () Bool)

(declare-fun tp!69842 () Bool)

(declare-fun e!557462 () Bool)

(assert (=> mapNonEmpty!36891 (= mapRes!36891 (and tp!69842 e!557462))))

(declare-fun mapKey!36891 () (_ BitVec 32))

(declare-fun mapRest!36891 () (Array (_ BitVec 32) ValueCell!11136))

(declare-fun mapValue!36891 () ValueCell!11136)

(assert (=> mapNonEmpty!36891 (= (arr!30069 _values!1278) (store mapRest!36891 mapKey!36891 mapValue!36891))))

(declare-fun res!661223 () Bool)

(assert (=> start!84524 (=> (not res!661223) (not e!557460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84524 (= res!661223 (validMask!0 mask!1948))))

(assert (=> start!84524 e!557460))

(assert (=> start!84524 true))

(assert (=> start!84524 tp_is_empty!23235))

(declare-fun array_inv!23235 (array!62429) Bool)

(assert (=> start!84524 (and (array_inv!23235 _values!1278) e!557464)))

(assert (=> start!84524 tp!69841))

(declare-fun array_inv!23236 (array!62431) Bool)

(assert (=> start!84524 (array_inv!23236 _keys!1544)))

(declare-fun b!988618 () Bool)

(assert (=> b!988618 (= e!557462 tp_is_empty!23235)))

(declare-fun b!988619 () Bool)

(declare-fun res!661221 () Bool)

(assert (=> b!988619 (=> (not res!661221) (not e!557460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988619 (= res!661221 (validKeyInArray!0 (select (arr!30070 _keys!1544) from!1932)))))

(declare-fun b!988620 () Bool)

(declare-fun res!661218 () Bool)

(assert (=> b!988620 (=> (not res!661218) (not e!557460))))

(assert (=> b!988620 (= res!661218 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988621 () Bool)

(declare-fun res!661222 () Bool)

(assert (=> b!988621 (=> (not res!661222) (not e!557460))))

(declare-datatypes ((List!20798 0))(
  ( (Nil!20795) (Cons!20794 (h!21956 (_ BitVec 64)) (t!29735 List!20798)) )
))
(declare-fun arrayNoDuplicates!0 (array!62431 (_ BitVec 32) List!20798) Bool)

(assert (=> b!988621 (= res!661222 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20795))))

(assert (= (and start!84524 res!661223) b!988617))

(assert (= (and b!988617 res!661219) b!988614))

(assert (= (and b!988614 res!661224) b!988621))

(assert (= (and b!988621 res!661222) b!988616))

(assert (= (and b!988616 res!661220) b!988619))

(assert (= (and b!988619 res!661221) b!988620))

(assert (= (and b!988620 res!661218) b!988613))

(assert (= (and b!988612 condMapEmpty!36891) mapIsEmpty!36891))

(assert (= (and b!988612 (not condMapEmpty!36891)) mapNonEmpty!36891))

(get-info :version)

(assert (= (and mapNonEmpty!36891 ((_ is ValueCellFull!11136) mapValue!36891)) b!988618))

(assert (= (and b!988612 ((_ is ValueCellFull!11136) mapDefault!36891)) b!988615))

(assert (= start!84524 b!988612))

(declare-fun m!915805 () Bool)

(assert (=> b!988614 m!915805))

(declare-fun m!915807 () Bool)

(assert (=> b!988619 m!915807))

(assert (=> b!988619 m!915807))

(declare-fun m!915809 () Bool)

(assert (=> b!988619 m!915809))

(declare-fun m!915811 () Bool)

(assert (=> mapNonEmpty!36891 m!915811))

(declare-fun m!915813 () Bool)

(assert (=> start!84524 m!915813))

(declare-fun m!915815 () Bool)

(assert (=> start!84524 m!915815))

(declare-fun m!915817 () Bool)

(assert (=> start!84524 m!915817))

(declare-fun m!915819 () Bool)

(assert (=> b!988613 m!915819))

(declare-fun m!915821 () Bool)

(assert (=> b!988621 m!915821))

(check-sat b_and!32113 (not b!988613) (not b!988614) tp_is_empty!23235 (not b_next!20019) (not b!988619) (not mapNonEmpty!36891) (not b!988621) (not start!84524))
(check-sat b_and!32113 (not b_next!20019))
