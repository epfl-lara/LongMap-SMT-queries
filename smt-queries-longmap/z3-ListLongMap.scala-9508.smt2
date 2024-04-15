; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112798 () Bool)

(assert start!112798)

(declare-fun b_free!31051 () Bool)

(declare-fun b_next!31051 () Bool)

(assert (=> start!112798 (= b_free!31051 (not b_next!31051))))

(declare-fun tp!108802 () Bool)

(declare-fun b_and!50031 () Bool)

(assert (=> start!112798 (= tp!108802 b_and!50031)))

(declare-fun b!1337702 () Bool)

(declare-fun e!761722 () Bool)

(declare-fun tp_is_empty!36961 () Bool)

(assert (=> b!1337702 (= e!761722 tp_is_empty!36961)))

(declare-fun b!1337703 () Bool)

(declare-fun res!887667 () Bool)

(declare-fun e!761724 () Bool)

(assert (=> b!1337703 (=> (not res!887667) (not e!761724))))

(declare-datatypes ((array!90725 0))(
  ( (array!90726 (arr!43826 (Array (_ BitVec 32) (_ BitVec 64))) (size!44378 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90725)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337703 (= res!887667 (validKeyInArray!0 (select (arr!43826 _keys!1590) from!1980)))))

(declare-fun b!1337704 () Bool)

(declare-fun res!887662 () Bool)

(assert (=> b!1337704 (=> (not res!887662) (not e!761724))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90725 (_ BitVec 32)) Bool)

(assert (=> b!1337704 (= res!887662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337705 () Bool)

(declare-fun res!887661 () Bool)

(assert (=> b!1337705 (=> (not res!887661) (not e!761724))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1337705 (= res!887661 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1337706 () Bool)

(declare-fun res!887668 () Bool)

(assert (=> b!1337706 (=> (not res!887668) (not e!761724))))

(declare-datatypes ((List!31122 0))(
  ( (Nil!31119) (Cons!31118 (h!32327 (_ BitVec 64)) (t!45434 List!31122)) )
))
(declare-fun arrayNoDuplicates!0 (array!90725 (_ BitVec 32) List!31122) Bool)

(assert (=> b!1337706 (= res!887668 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31119))))

(declare-fun b!1337707 () Bool)

(declare-fun res!887660 () Bool)

(assert (=> b!1337707 (=> (not res!887660) (not e!761724))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1337707 (= res!887660 (not (= (select (arr!43826 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1337708 () Bool)

(declare-fun res!887663 () Bool)

(assert (=> b!1337708 (=> (not res!887663) (not e!761724))))

(assert (=> b!1337708 (= res!887663 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44378 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57126 () Bool)

(declare-fun mapRes!57126 () Bool)

(assert (=> mapIsEmpty!57126 mapRes!57126))

(declare-fun mapNonEmpty!57126 () Bool)

(declare-fun tp!108801 () Bool)

(assert (=> mapNonEmpty!57126 (= mapRes!57126 (and tp!108801 e!761722))))

(declare-datatypes ((V!54385 0))(
  ( (V!54386 (val!18555 Int)) )
))
(declare-datatypes ((ValueCell!17582 0))(
  ( (ValueCellFull!17582 (v!21198 V!54385)) (EmptyCell!17582) )
))
(declare-datatypes ((array!90727 0))(
  ( (array!90728 (arr!43827 (Array (_ BitVec 32) ValueCell!17582)) (size!44379 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90727)

(declare-fun mapRest!57126 () (Array (_ BitVec 32) ValueCell!17582))

(declare-fun mapKey!57126 () (_ BitVec 32))

(declare-fun mapValue!57126 () ValueCell!17582)

(assert (=> mapNonEmpty!57126 (= (arr!43827 _values!1320) (store mapRest!57126 mapKey!57126 mapValue!57126))))

(declare-fun b!1337710 () Bool)

(declare-fun e!761723 () Bool)

(declare-fun e!761725 () Bool)

(assert (=> b!1337710 (= e!761723 (and e!761725 mapRes!57126))))

(declare-fun condMapEmpty!57126 () Bool)

(declare-fun mapDefault!57126 () ValueCell!17582)

(assert (=> b!1337710 (= condMapEmpty!57126 (= (arr!43827 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17582)) mapDefault!57126)))))

(declare-fun res!887665 () Bool)

(assert (=> start!112798 (=> (not res!887665) (not e!761724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112798 (= res!887665 (validMask!0 mask!1998))))

(assert (=> start!112798 e!761724))

(declare-fun array_inv!33245 (array!90727) Bool)

(assert (=> start!112798 (and (array_inv!33245 _values!1320) e!761723)))

(assert (=> start!112798 true))

(declare-fun array_inv!33246 (array!90725) Bool)

(assert (=> start!112798 (array_inv!33246 _keys!1590)))

(assert (=> start!112798 tp!108802))

(assert (=> start!112798 tp_is_empty!36961))

(declare-fun b!1337709 () Bool)

(assert (=> b!1337709 (= e!761725 tp_is_empty!36961)))

(declare-fun b!1337711 () Bool)

(declare-fun res!887664 () Bool)

(assert (=> b!1337711 (=> (not res!887664) (not e!761724))))

(assert (=> b!1337711 (= res!887664 (and (= (size!44379 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44378 _keys!1590) (size!44379 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337712 () Bool)

(assert (=> b!1337712 (= e!761724 (= k0!1153 (select (arr!43826 _keys!1590) from!1980)))))

(declare-fun b!1337713 () Bool)

(declare-fun res!887666 () Bool)

(assert (=> b!1337713 (=> (not res!887666) (not e!761724))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54385)

(declare-fun zeroValue!1262 () V!54385)

(declare-datatypes ((tuple2!23992 0))(
  ( (tuple2!23993 (_1!12007 (_ BitVec 64)) (_2!12007 V!54385)) )
))
(declare-datatypes ((List!31123 0))(
  ( (Nil!31120) (Cons!31119 (h!32328 tuple2!23992) (t!45435 List!31123)) )
))
(declare-datatypes ((ListLongMap!21649 0))(
  ( (ListLongMap!21650 (toList!10840 List!31123)) )
))
(declare-fun contains!8938 (ListLongMap!21649 (_ BitVec 64)) Bool)

(declare-fun +!4770 (ListLongMap!21649 tuple2!23992) ListLongMap!21649)

(declare-fun getCurrentListMapNoExtraKeys!6413 (array!90725 array!90727 (_ BitVec 32) (_ BitVec 32) V!54385 V!54385 (_ BitVec 32) Int) ListLongMap!21649)

(declare-fun get!22125 (ValueCell!17582 V!54385) V!54385)

(declare-fun dynLambda!3700 (Int (_ BitVec 64)) V!54385)

(assert (=> b!1337713 (= res!887666 (contains!8938 (+!4770 (getCurrentListMapNoExtraKeys!6413 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23993 (select (arr!43826 _keys!1590) from!1980) (get!22125 (select (arr!43827 _values!1320) from!1980) (dynLambda!3700 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153))))

(declare-fun b!1337714 () Bool)

(declare-fun res!887669 () Bool)

(assert (=> b!1337714 (=> (not res!887669) (not e!761724))))

(declare-fun getCurrentListMap!5693 (array!90725 array!90727 (_ BitVec 32) (_ BitVec 32) V!54385 V!54385 (_ BitVec 32) Int) ListLongMap!21649)

(assert (=> b!1337714 (= res!887669 (contains!8938 (getCurrentListMap!5693 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112798 res!887665) b!1337711))

(assert (= (and b!1337711 res!887664) b!1337704))

(assert (= (and b!1337704 res!887662) b!1337706))

(assert (= (and b!1337706 res!887668) b!1337708))

(assert (= (and b!1337708 res!887663) b!1337714))

(assert (= (and b!1337714 res!887669) b!1337707))

(assert (= (and b!1337707 res!887660) b!1337703))

(assert (= (and b!1337703 res!887667) b!1337705))

(assert (= (and b!1337705 res!887661) b!1337713))

(assert (= (and b!1337713 res!887666) b!1337712))

(assert (= (and b!1337710 condMapEmpty!57126) mapIsEmpty!57126))

(assert (= (and b!1337710 (not condMapEmpty!57126)) mapNonEmpty!57126))

(get-info :version)

(assert (= (and mapNonEmpty!57126 ((_ is ValueCellFull!17582) mapValue!57126)) b!1337702))

(assert (= (and b!1337710 ((_ is ValueCellFull!17582) mapDefault!57126)) b!1337709))

(assert (= start!112798 b!1337710))

(declare-fun b_lambda!24235 () Bool)

(assert (=> (not b_lambda!24235) (not b!1337713)))

(declare-fun t!45433 () Bool)

(declare-fun tb!12115 () Bool)

(assert (=> (and start!112798 (= defaultEntry!1323 defaultEntry!1323) t!45433) tb!12115))

(declare-fun result!25315 () Bool)

(assert (=> tb!12115 (= result!25315 tp_is_empty!36961)))

(assert (=> b!1337713 t!45433))

(declare-fun b_and!50033 () Bool)

(assert (= b_and!50031 (and (=> t!45433 result!25315) b_and!50033)))

(declare-fun m!1225425 () Bool)

(assert (=> b!1337712 m!1225425))

(declare-fun m!1225427 () Bool)

(assert (=> mapNonEmpty!57126 m!1225427))

(declare-fun m!1225429 () Bool)

(assert (=> b!1337713 m!1225429))

(declare-fun m!1225431 () Bool)

(assert (=> b!1337713 m!1225431))

(declare-fun m!1225433 () Bool)

(assert (=> b!1337713 m!1225433))

(declare-fun m!1225435 () Bool)

(assert (=> b!1337713 m!1225435))

(assert (=> b!1337713 m!1225429))

(declare-fun m!1225437 () Bool)

(assert (=> b!1337713 m!1225437))

(assert (=> b!1337713 m!1225433))

(declare-fun m!1225439 () Bool)

(assert (=> b!1337713 m!1225439))

(assert (=> b!1337713 m!1225431))

(assert (=> b!1337713 m!1225435))

(assert (=> b!1337713 m!1225425))

(declare-fun m!1225441 () Bool)

(assert (=> b!1337714 m!1225441))

(assert (=> b!1337714 m!1225441))

(declare-fun m!1225443 () Bool)

(assert (=> b!1337714 m!1225443))

(declare-fun m!1225445 () Bool)

(assert (=> start!112798 m!1225445))

(declare-fun m!1225447 () Bool)

(assert (=> start!112798 m!1225447))

(declare-fun m!1225449 () Bool)

(assert (=> start!112798 m!1225449))

(assert (=> b!1337703 m!1225425))

(assert (=> b!1337703 m!1225425))

(declare-fun m!1225451 () Bool)

(assert (=> b!1337703 m!1225451))

(declare-fun m!1225453 () Bool)

(assert (=> b!1337706 m!1225453))

(declare-fun m!1225455 () Bool)

(assert (=> b!1337704 m!1225455))

(assert (=> b!1337707 m!1225425))

(check-sat (not b_next!31051) (not mapNonEmpty!57126) b_and!50033 (not b!1337706) (not b!1337714) (not b!1337704) (not b_lambda!24235) tp_is_empty!36961 (not start!112798) (not b!1337713) (not b!1337703))
(check-sat b_and!50033 (not b_next!31051))
