; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84518 () Bool)

(assert start!84518)

(declare-fun b_free!20013 () Bool)

(declare-fun b_next!20013 () Bool)

(assert (=> start!84518 (= b_free!20013 (not b_next!20013))))

(declare-fun tp!69824 () Bool)

(declare-fun b_and!32107 () Bool)

(assert (=> start!84518 (= tp!69824 b_and!32107)))

(declare-fun b!988522 () Bool)

(declare-fun e!557415 () Bool)

(assert (=> b!988522 (= e!557415 false)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35955 0))(
  ( (V!35956 (val!11665 Int)) )
))
(declare-fun minValue!1220 () V!35955)

(declare-datatypes ((ValueCell!11133 0))(
  ( (ValueCellFull!11133 (v!14232 V!35955)) (EmptyCell!11133) )
))
(declare-datatypes ((array!62417 0))(
  ( (array!62418 (arr!30063 (Array (_ BitVec 32) ValueCell!11133)) (size!30542 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62417)

(declare-fun zeroValue!1220 () V!35955)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62419 0))(
  ( (array!62420 (arr!30064 (Array (_ BitVec 32) (_ BitVec 64))) (size!30543 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62419)

(declare-datatypes ((tuple2!14862 0))(
  ( (tuple2!14863 (_1!7442 (_ BitVec 64)) (_2!7442 V!35955)) )
))
(declare-datatypes ((List!20793 0))(
  ( (Nil!20790) (Cons!20789 (h!21951 tuple2!14862) (t!29730 List!20793)) )
))
(declare-datatypes ((ListLongMap!13559 0))(
  ( (ListLongMap!13560 (toList!6795 List!20793)) )
))
(declare-fun lt!438526 () ListLongMap!13559)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3486 (array!62419 array!62417 (_ BitVec 32) (_ BitVec 32) V!35955 V!35955 (_ BitVec 32) Int) ListLongMap!13559)

(assert (=> b!988522 (= lt!438526 (getCurrentListMapNoExtraKeys!3486 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!661158 () Bool)

(assert (=> start!84518 (=> (not res!661158) (not e!557415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84518 (= res!661158 (validMask!0 mask!1948))))

(assert (=> start!84518 e!557415))

(assert (=> start!84518 true))

(declare-fun tp_is_empty!23229 () Bool)

(assert (=> start!84518 tp_is_empty!23229))

(declare-fun e!557417 () Bool)

(declare-fun array_inv!23231 (array!62417) Bool)

(assert (=> start!84518 (and (array_inv!23231 _values!1278) e!557417)))

(assert (=> start!84518 tp!69824))

(declare-fun array_inv!23232 (array!62419) Bool)

(assert (=> start!84518 (array_inv!23232 _keys!1544)))

(declare-fun mapNonEmpty!36882 () Bool)

(declare-fun mapRes!36882 () Bool)

(declare-fun tp!69823 () Bool)

(declare-fun e!557418 () Bool)

(assert (=> mapNonEmpty!36882 (= mapRes!36882 (and tp!69823 e!557418))))

(declare-fun mapValue!36882 () ValueCell!11133)

(declare-fun mapKey!36882 () (_ BitVec 32))

(declare-fun mapRest!36882 () (Array (_ BitVec 32) ValueCell!11133))

(assert (=> mapNonEmpty!36882 (= (arr!30063 _values!1278) (store mapRest!36882 mapKey!36882 mapValue!36882))))

(declare-fun b!988523 () Bool)

(assert (=> b!988523 (= e!557418 tp_is_empty!23229)))

(declare-fun b!988524 () Bool)

(declare-fun res!661161 () Bool)

(assert (=> b!988524 (=> (not res!661161) (not e!557415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988524 (= res!661161 (validKeyInArray!0 (select (arr!30064 _keys!1544) from!1932)))))

(declare-fun b!988525 () Bool)

(declare-fun res!661159 () Bool)

(assert (=> b!988525 (=> (not res!661159) (not e!557415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62419 (_ BitVec 32)) Bool)

(assert (=> b!988525 (= res!661159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988526 () Bool)

(declare-fun res!661157 () Bool)

(assert (=> b!988526 (=> (not res!661157) (not e!557415))))

(declare-datatypes ((List!20794 0))(
  ( (Nil!20791) (Cons!20790 (h!21952 (_ BitVec 64)) (t!29731 List!20794)) )
))
(declare-fun arrayNoDuplicates!0 (array!62419 (_ BitVec 32) List!20794) Bool)

(assert (=> b!988526 (= res!661157 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20791))))

(declare-fun mapIsEmpty!36882 () Bool)

(assert (=> mapIsEmpty!36882 mapRes!36882))

(declare-fun b!988527 () Bool)

(declare-fun e!557416 () Bool)

(assert (=> b!988527 (= e!557416 tp_is_empty!23229)))

(declare-fun b!988528 () Bool)

(declare-fun res!661156 () Bool)

(assert (=> b!988528 (=> (not res!661156) (not e!557415))))

(assert (=> b!988528 (= res!661156 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30543 _keys!1544))))))

(declare-fun b!988529 () Bool)

(declare-fun res!661160 () Bool)

(assert (=> b!988529 (=> (not res!661160) (not e!557415))))

(assert (=> b!988529 (= res!661160 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988530 () Bool)

(declare-fun res!661155 () Bool)

(assert (=> b!988530 (=> (not res!661155) (not e!557415))))

(assert (=> b!988530 (= res!661155 (and (= (size!30542 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30543 _keys!1544) (size!30542 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988531 () Bool)

(assert (=> b!988531 (= e!557417 (and e!557416 mapRes!36882))))

(declare-fun condMapEmpty!36882 () Bool)

(declare-fun mapDefault!36882 () ValueCell!11133)

(assert (=> b!988531 (= condMapEmpty!36882 (= (arr!30063 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11133)) mapDefault!36882)))))

(assert (= (and start!84518 res!661158) b!988530))

(assert (= (and b!988530 res!661155) b!988525))

(assert (= (and b!988525 res!661159) b!988526))

(assert (= (and b!988526 res!661157) b!988528))

(assert (= (and b!988528 res!661156) b!988524))

(assert (= (and b!988524 res!661161) b!988529))

(assert (= (and b!988529 res!661160) b!988522))

(assert (= (and b!988531 condMapEmpty!36882) mapIsEmpty!36882))

(assert (= (and b!988531 (not condMapEmpty!36882)) mapNonEmpty!36882))

(get-info :version)

(assert (= (and mapNonEmpty!36882 ((_ is ValueCellFull!11133) mapValue!36882)) b!988523))

(assert (= (and b!988531 ((_ is ValueCellFull!11133) mapDefault!36882)) b!988527))

(assert (= start!84518 b!988531))

(declare-fun m!915751 () Bool)

(assert (=> b!988524 m!915751))

(assert (=> b!988524 m!915751))

(declare-fun m!915753 () Bool)

(assert (=> b!988524 m!915753))

(declare-fun m!915755 () Bool)

(assert (=> b!988522 m!915755))

(declare-fun m!915757 () Bool)

(assert (=> start!84518 m!915757))

(declare-fun m!915759 () Bool)

(assert (=> start!84518 m!915759))

(declare-fun m!915761 () Bool)

(assert (=> start!84518 m!915761))

(declare-fun m!915763 () Bool)

(assert (=> mapNonEmpty!36882 m!915763))

(declare-fun m!915765 () Bool)

(assert (=> b!988526 m!915765))

(declare-fun m!915767 () Bool)

(assert (=> b!988525 m!915767))

(check-sat (not b!988526) (not b!988524) (not start!84518) tp_is_empty!23229 (not b!988525) (not b!988522) b_and!32107 (not mapNonEmpty!36882) (not b_next!20013))
(check-sat b_and!32107 (not b_next!20013))
