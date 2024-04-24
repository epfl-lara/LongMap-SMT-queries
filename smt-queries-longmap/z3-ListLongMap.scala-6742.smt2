; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84684 () Bool)

(assert start!84684)

(declare-fun b_free!20011 () Bool)

(declare-fun b_next!20011 () Bool)

(assert (=> start!84684 (= b_free!20011 (not b_next!20011))))

(declare-fun tp!69818 () Bool)

(declare-fun b_and!32115 () Bool)

(assert (=> start!84684 (= tp!69818 b_and!32115)))

(declare-fun b!989395 () Bool)

(declare-fun res!661478 () Bool)

(declare-fun e!557984 () Bool)

(assert (=> b!989395 (=> (not res!661478) (not e!557984))))

(declare-datatypes ((array!62460 0))(
  ( (array!62461 (arr!30080 (Array (_ BitVec 32) (_ BitVec 64))) (size!30560 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62460)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62460 (_ BitVec 32)) Bool)

(assert (=> b!989395 (= res!661478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989396 () Bool)

(declare-fun e!557986 () Bool)

(declare-fun tp_is_empty!23227 () Bool)

(assert (=> b!989396 (= e!557986 tp_is_empty!23227)))

(declare-fun mapIsEmpty!36879 () Bool)

(declare-fun mapRes!36879 () Bool)

(assert (=> mapIsEmpty!36879 mapRes!36879))

(declare-fun mapNonEmpty!36879 () Bool)

(declare-fun tp!69819 () Bool)

(assert (=> mapNonEmpty!36879 (= mapRes!36879 (and tp!69819 e!557986))))

(declare-datatypes ((V!35953 0))(
  ( (V!35954 (val!11664 Int)) )
))
(declare-datatypes ((ValueCell!11132 0))(
  ( (ValueCellFull!11132 (v!14228 V!35953)) (EmptyCell!11132) )
))
(declare-fun mapValue!36879 () ValueCell!11132)

(declare-datatypes ((array!62462 0))(
  ( (array!62463 (arr!30081 (Array (_ BitVec 32) ValueCell!11132)) (size!30561 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62462)

(declare-fun mapRest!36879 () (Array (_ BitVec 32) ValueCell!11132))

(declare-fun mapKey!36879 () (_ BitVec 32))

(assert (=> mapNonEmpty!36879 (= (arr!30081 _values!1278) (store mapRest!36879 mapKey!36879 mapValue!36879))))

(declare-fun b!989397 () Bool)

(declare-fun res!661479 () Bool)

(assert (=> b!989397 (=> (not res!661479) (not e!557984))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989397 (= res!661479 (and (= (size!30561 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30560 _keys!1544) (size!30561 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989398 () Bool)

(declare-fun res!661481 () Bool)

(assert (=> b!989398 (=> (not res!661481) (not e!557984))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!989398 (= res!661481 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30560 _keys!1544))))))

(declare-fun b!989399 () Bool)

(declare-fun res!661483 () Bool)

(assert (=> b!989399 (=> (not res!661483) (not e!557984))))

(assert (=> b!989399 (= res!661483 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!989401 () Bool)

(assert (=> b!989401 (= e!557984 false)))

(declare-fun minValue!1220 () V!35953)

(declare-fun zeroValue!1220 () V!35953)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14886 0))(
  ( (tuple2!14887 (_1!7454 (_ BitVec 64)) (_2!7454 V!35953)) )
))
(declare-datatypes ((List!20792 0))(
  ( (Nil!20789) (Cons!20788 (h!21956 tuple2!14886) (t!29721 List!20792)) )
))
(declare-datatypes ((ListLongMap!13585 0))(
  ( (ListLongMap!13586 (toList!6808 List!20792)) )
))
(declare-fun lt!438884 () ListLongMap!13585)

(declare-fun getCurrentListMapNoExtraKeys!3536 (array!62460 array!62462 (_ BitVec 32) (_ BitVec 32) V!35953 V!35953 (_ BitVec 32) Int) ListLongMap!13585)

(assert (=> b!989401 (= lt!438884 (getCurrentListMapNoExtraKeys!3536 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989402 () Bool)

(declare-fun res!661482 () Bool)

(assert (=> b!989402 (=> (not res!661482) (not e!557984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989402 (= res!661482 (validKeyInArray!0 (select (arr!30080 _keys!1544) from!1932)))))

(declare-fun b!989403 () Bool)

(declare-fun e!557985 () Bool)

(assert (=> b!989403 (= e!557985 tp_is_empty!23227)))

(declare-fun b!989404 () Bool)

(declare-fun e!557982 () Bool)

(assert (=> b!989404 (= e!557982 (and e!557985 mapRes!36879))))

(declare-fun condMapEmpty!36879 () Bool)

(declare-fun mapDefault!36879 () ValueCell!11132)

(assert (=> b!989404 (= condMapEmpty!36879 (= (arr!30081 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11132)) mapDefault!36879)))))

(declare-fun res!661484 () Bool)

(assert (=> start!84684 (=> (not res!661484) (not e!557984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84684 (= res!661484 (validMask!0 mask!1948))))

(assert (=> start!84684 e!557984))

(assert (=> start!84684 true))

(assert (=> start!84684 tp_is_empty!23227))

(declare-fun array_inv!23265 (array!62462) Bool)

(assert (=> start!84684 (and (array_inv!23265 _values!1278) e!557982)))

(assert (=> start!84684 tp!69818))

(declare-fun array_inv!23266 (array!62460) Bool)

(assert (=> start!84684 (array_inv!23266 _keys!1544)))

(declare-fun b!989400 () Bool)

(declare-fun res!661480 () Bool)

(assert (=> b!989400 (=> (not res!661480) (not e!557984))))

(declare-datatypes ((List!20793 0))(
  ( (Nil!20790) (Cons!20789 (h!21957 (_ BitVec 64)) (t!29722 List!20793)) )
))
(declare-fun arrayNoDuplicates!0 (array!62460 (_ BitVec 32) List!20793) Bool)

(assert (=> b!989400 (= res!661480 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20790))))

(assert (= (and start!84684 res!661484) b!989397))

(assert (= (and b!989397 res!661479) b!989395))

(assert (= (and b!989395 res!661478) b!989400))

(assert (= (and b!989400 res!661480) b!989398))

(assert (= (and b!989398 res!661481) b!989402))

(assert (= (and b!989402 res!661482) b!989399))

(assert (= (and b!989399 res!661483) b!989401))

(assert (= (and b!989404 condMapEmpty!36879) mapIsEmpty!36879))

(assert (= (and b!989404 (not condMapEmpty!36879)) mapNonEmpty!36879))

(get-info :version)

(assert (= (and mapNonEmpty!36879 ((_ is ValueCellFull!11132) mapValue!36879)) b!989396))

(assert (= (and b!989404 ((_ is ValueCellFull!11132) mapDefault!36879)) b!989403))

(assert (= start!84684 b!989404))

(declare-fun m!917027 () Bool)

(assert (=> b!989401 m!917027))

(declare-fun m!917029 () Bool)

(assert (=> start!84684 m!917029))

(declare-fun m!917031 () Bool)

(assert (=> start!84684 m!917031))

(declare-fun m!917033 () Bool)

(assert (=> start!84684 m!917033))

(declare-fun m!917035 () Bool)

(assert (=> b!989400 m!917035))

(declare-fun m!917037 () Bool)

(assert (=> mapNonEmpty!36879 m!917037))

(declare-fun m!917039 () Bool)

(assert (=> b!989402 m!917039))

(assert (=> b!989402 m!917039))

(declare-fun m!917041 () Bool)

(assert (=> b!989402 m!917041))

(declare-fun m!917043 () Bool)

(assert (=> b!989395 m!917043))

(check-sat (not b_next!20011) (not b!989402) b_and!32115 tp_is_empty!23227 (not b!989401) (not b!989395) (not b!989400) (not start!84684) (not mapNonEmpty!36879))
(check-sat b_and!32115 (not b_next!20011))
