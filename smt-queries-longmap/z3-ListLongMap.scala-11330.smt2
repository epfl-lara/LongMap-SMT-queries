; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131834 () Bool)

(assert start!131834)

(declare-fun b_free!31597 () Bool)

(declare-fun b_next!31597 () Bool)

(assert (=> start!131834 (= b_free!31597 (not b_next!31597))))

(declare-fun tp!111043 () Bool)

(declare-fun b_and!50989 () Bool)

(assert (=> start!131834 (= tp!111043 b_and!50989)))

(declare-fun bm!68667 () Bool)

(declare-datatypes ((V!58941 0))(
  ( (V!58942 (val!19014 Int)) )
))
(declare-datatypes ((tuple2!24492 0))(
  ( (tuple2!24493 (_1!12257 (_ BitVec 64)) (_2!12257 V!58941)) )
))
(declare-datatypes ((List!35984 0))(
  ( (Nil!35981) (Cons!35980 (h!37426 tuple2!24492) (t!50670 List!35984)) )
))
(declare-datatypes ((ListLongMap!22101 0))(
  ( (ListLongMap!22102 (toList!11066 List!35984)) )
))
(declare-fun call!68671 () ListLongMap!22101)

(declare-fun call!68674 () ListLongMap!22101)

(assert (=> bm!68667 (= call!68671 call!68674)))

(declare-fun b!1543614 () Bool)

(declare-fun e!859169 () Bool)

(declare-fun tp_is_empty!37873 () Bool)

(assert (=> b!1543614 (= e!859169 tp_is_empty!37873)))

(declare-fun b!1543615 () Bool)

(declare-fun res!1059104 () Bool)

(declare-fun e!859167 () Bool)

(assert (=> b!1543615 (=> (not res!1059104) (not e!859167))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!102892 0))(
  ( (array!102893 (arr!49649 (Array (_ BitVec 32) (_ BitVec 64))) (size!50201 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102892)

(assert (=> b!1543615 (= res!1059104 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50201 _keys!618))))))

(declare-fun res!1059105 () Bool)

(assert (=> start!131834 (=> (not res!1059105) (not e!859167))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131834 (= res!1059105 (validMask!0 mask!926))))

(assert (=> start!131834 e!859167))

(declare-fun array_inv!38819 (array!102892) Bool)

(assert (=> start!131834 (array_inv!38819 _keys!618)))

(assert (=> start!131834 tp_is_empty!37873))

(assert (=> start!131834 true))

(assert (=> start!131834 tp!111043))

(declare-datatypes ((ValueCell!18026 0))(
  ( (ValueCellFull!18026 (v!21811 V!58941)) (EmptyCell!18026) )
))
(declare-datatypes ((array!102894 0))(
  ( (array!102895 (arr!49650 (Array (_ BitVec 32) ValueCell!18026)) (size!50202 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102894)

(declare-fun e!859165 () Bool)

(declare-fun array_inv!38820 (array!102894) Bool)

(assert (=> start!131834 (and (array_inv!38820 _values!470) e!859165)))

(declare-fun b!1543616 () Bool)

(declare-fun e!859163 () Bool)

(declare-fun mapRes!58513 () Bool)

(assert (=> b!1543616 (= e!859165 (and e!859163 mapRes!58513))))

(declare-fun condMapEmpty!58513 () Bool)

(declare-fun mapDefault!58513 () ValueCell!18026)

(assert (=> b!1543616 (= condMapEmpty!58513 (= (arr!49650 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18026)) mapDefault!58513)))))

(declare-fun b!1543617 () Bool)

(declare-fun e!859164 () ListLongMap!22101)

(declare-fun call!68673 () ListLongMap!22101)

(assert (=> b!1543617 (= e!859164 call!68673)))

(declare-fun bm!68668 () Bool)

(declare-fun call!68670 () ListLongMap!22101)

(assert (=> bm!68668 (= call!68670 call!68671)))

(declare-fun b!1543618 () Bool)

(declare-fun res!1059107 () Bool)

(assert (=> b!1543618 (=> (not res!1059107) (not e!859167))))

(declare-datatypes ((List!35985 0))(
  ( (Nil!35982) (Cons!35981 (h!37427 (_ BitVec 64)) (t!50671 List!35985)) )
))
(declare-fun arrayNoDuplicates!0 (array!102892 (_ BitVec 32) List!35985) Bool)

(assert (=> b!1543618 (= res!1059107 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35982))))

(declare-fun b!1543619 () Bool)

(declare-fun res!1059106 () Bool)

(assert (=> b!1543619 (=> (not res!1059106) (not e!859167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102892 (_ BitVec 32)) Bool)

(assert (=> b!1543619 (= res!1059106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!68669 () Bool)

(declare-fun call!68672 () ListLongMap!22101)

(assert (=> bm!68669 (= call!68673 call!68672)))

(declare-fun b!1543620 () Bool)

(declare-fun c!141226 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!665778 () Bool)

(assert (=> b!1543620 (= c!141226 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665778))))

(declare-fun e!859170 () ListLongMap!22101)

(assert (=> b!1543620 (= e!859164 e!859170)))

(declare-fun b!1543621 () Bool)

(assert (=> b!1543621 (= e!859163 tp_is_empty!37873)))

(declare-fun b!1543622 () Bool)

(declare-fun e!859168 () ListLongMap!22101)

(assert (=> b!1543622 (= e!859168 e!859164)))

(declare-fun c!141228 () Bool)

(assert (=> b!1543622 (= c!141228 (and (not lt!665778) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1543623 () Bool)

(assert (=> b!1543623 (= e!859170 call!68673)))

(declare-fun b!1543624 () Bool)

(declare-fun res!1059108 () Bool)

(assert (=> b!1543624 (=> (not res!1059108) (not e!859167))))

(assert (=> b!1543624 (= res!1059108 (and (= (size!50202 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50201 _keys!618) (size!50202 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!436 () V!58941)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!68670 () Bool)

(declare-fun minValue!436 () V!58941)

(declare-fun getCurrentListMapNoExtraKeys!6537 (array!102892 array!102894 (_ BitVec 32) (_ BitVec 32) V!58941 V!58941 (_ BitVec 32) Int) ListLongMap!22101)

(assert (=> bm!68670 (= call!68674 (getCurrentListMapNoExtraKeys!6537 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58513 () Bool)

(declare-fun tp!111044 () Bool)

(assert (=> mapNonEmpty!58513 (= mapRes!58513 (and tp!111044 e!859169))))

(declare-fun mapKey!58513 () (_ BitVec 32))

(declare-fun mapValue!58513 () ValueCell!18026)

(declare-fun mapRest!58513 () (Array (_ BitVec 32) ValueCell!18026))

(assert (=> mapNonEmpty!58513 (= (arr!49650 _values!470) (store mapRest!58513 mapKey!58513 mapValue!58513))))

(declare-fun b!1543625 () Bool)

(declare-fun +!4901 (ListLongMap!22101 tuple2!24492) ListLongMap!22101)

(assert (=> b!1543625 (= e!859168 (+!4901 call!68672 (tuple2!24493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun c!141227 () Bool)

(declare-fun bm!68671 () Bool)

(assert (=> bm!68671 (= call!68672 (+!4901 (ite c!141227 call!68674 (ite c!141228 call!68671 call!68670)) (ite (or c!141227 c!141228) (tuple2!24493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1543626 () Bool)

(assert (=> b!1543626 (= e!859167 false)))

(declare-fun lt!665779 () ListLongMap!22101)

(assert (=> b!1543626 (= lt!665779 e!859168)))

(assert (=> b!1543626 (= c!141227 (and (not lt!665778) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1543626 (= lt!665778 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1543627 () Bool)

(assert (=> b!1543627 (= e!859170 call!68670)))

(declare-fun mapIsEmpty!58513 () Bool)

(assert (=> mapIsEmpty!58513 mapRes!58513))

(assert (= (and start!131834 res!1059105) b!1543624))

(assert (= (and b!1543624 res!1059108) b!1543619))

(assert (= (and b!1543619 res!1059106) b!1543618))

(assert (= (and b!1543618 res!1059107) b!1543615))

(assert (= (and b!1543615 res!1059104) b!1543626))

(assert (= (and b!1543626 c!141227) b!1543625))

(assert (= (and b!1543626 (not c!141227)) b!1543622))

(assert (= (and b!1543622 c!141228) b!1543617))

(assert (= (and b!1543622 (not c!141228)) b!1543620))

(assert (= (and b!1543620 c!141226) b!1543623))

(assert (= (and b!1543620 (not c!141226)) b!1543627))

(assert (= (or b!1543623 b!1543627) bm!68668))

(assert (= (or b!1543617 bm!68668) bm!68667))

(assert (= (or b!1543617 b!1543623) bm!68669))

(assert (= (or b!1543625 bm!68667) bm!68670))

(assert (= (or b!1543625 bm!68669) bm!68671))

(assert (= (and b!1543616 condMapEmpty!58513) mapIsEmpty!58513))

(assert (= (and b!1543616 (not condMapEmpty!58513)) mapNonEmpty!58513))

(get-info :version)

(assert (= (and mapNonEmpty!58513 ((_ is ValueCellFull!18026) mapValue!58513)) b!1543614))

(assert (= (and b!1543616 ((_ is ValueCellFull!18026) mapDefault!58513)) b!1543621))

(assert (= start!131834 b!1543616))

(declare-fun m!1424169 () Bool)

(assert (=> b!1543618 m!1424169))

(declare-fun m!1424171 () Bool)

(assert (=> b!1543619 m!1424171))

(declare-fun m!1424173 () Bool)

(assert (=> bm!68671 m!1424173))

(declare-fun m!1424175 () Bool)

(assert (=> bm!68670 m!1424175))

(declare-fun m!1424177 () Bool)

(assert (=> b!1543625 m!1424177))

(declare-fun m!1424179 () Bool)

(assert (=> start!131834 m!1424179))

(declare-fun m!1424181 () Bool)

(assert (=> start!131834 m!1424181))

(declare-fun m!1424183 () Bool)

(assert (=> start!131834 m!1424183))

(declare-fun m!1424185 () Bool)

(assert (=> mapNonEmpty!58513 m!1424185))

(check-sat b_and!50989 (not mapNonEmpty!58513) (not b_next!31597) tp_is_empty!37873 (not b!1543625) (not bm!68670) (not b!1543619) (not start!131834) (not b!1543618) (not bm!68671))
(check-sat b_and!50989 (not b_next!31597))
