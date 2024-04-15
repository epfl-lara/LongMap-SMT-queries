; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112470 () Bool)

(assert start!112470)

(declare-fun b_free!30865 () Bool)

(declare-fun b_next!30865 () Bool)

(assert (=> start!112470 (= b_free!30865 (not b_next!30865))))

(declare-fun tp!108232 () Bool)

(declare-fun b_and!49713 () Bool)

(assert (=> start!112470 (= tp!108232 b_and!49713)))

(declare-fun b!1333616 () Bool)

(declare-fun res!885054 () Bool)

(declare-fun e!759679 () Bool)

(assert (=> b!1333616 (=> (not res!885054) (not e!759679))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333616 (= res!885054 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!56836 () Bool)

(declare-fun mapRes!56836 () Bool)

(assert (=> mapIsEmpty!56836 mapRes!56836))

(declare-fun b!1333617 () Bool)

(declare-fun res!885058 () Bool)

(assert (=> b!1333617 (=> (not res!885058) (not e!759679))))

(declare-datatypes ((V!54137 0))(
  ( (V!54138 (val!18462 Int)) )
))
(declare-datatypes ((ValueCell!17489 0))(
  ( (ValueCellFull!17489 (v!21098 V!54137)) (EmptyCell!17489) )
))
(declare-datatypes ((array!90363 0))(
  ( (array!90364 (arr!43648 (Array (_ BitVec 32) ValueCell!17489)) (size!44200 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90363)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90365 0))(
  ( (array!90366 (arr!43649 (Array (_ BitVec 32) (_ BitVec 64))) (size!44201 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90365)

(assert (=> b!1333617 (= res!885058 (and (= (size!44200 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44201 _keys!1590) (size!44200 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333618 () Bool)

(declare-fun res!885049 () Bool)

(assert (=> b!1333618 (=> (not res!885049) (not e!759679))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333618 (= res!885049 (not (= (select (arr!43649 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333619 () Bool)

(declare-fun res!885052 () Bool)

(assert (=> b!1333619 (=> (not res!885052) (not e!759679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333619 (= res!885052 (validKeyInArray!0 (select (arr!43649 _keys!1590) from!1980)))))

(declare-fun b!1333620 () Bool)

(declare-fun res!885051 () Bool)

(assert (=> b!1333620 (=> (not res!885051) (not e!759679))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54137)

(declare-fun zeroValue!1262 () V!54137)

(declare-datatypes ((tuple2!23864 0))(
  ( (tuple2!23865 (_1!11943 (_ BitVec 64)) (_2!11943 V!54137)) )
))
(declare-datatypes ((List!31002 0))(
  ( (Nil!30999) (Cons!30998 (h!32207 tuple2!23864) (t!45218 List!31002)) )
))
(declare-datatypes ((ListLongMap!21521 0))(
  ( (ListLongMap!21522 (toList!10776 List!31002)) )
))
(declare-fun contains!8868 (ListLongMap!21521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5631 (array!90365 array!90363 (_ BitVec 32) (_ BitVec 32) V!54137 V!54137 (_ BitVec 32) Int) ListLongMap!21521)

(assert (=> b!1333620 (= res!885051 (contains!8868 (getCurrentListMap!5631 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333621 () Bool)

(declare-fun e!759677 () Bool)

(assert (=> b!1333621 (= e!759677 (not true))))

(declare-fun lt!591995 () ListLongMap!21521)

(assert (=> b!1333621 (contains!8868 lt!591995 k0!1153)))

(declare-fun lt!591996 () V!54137)

(declare-datatypes ((Unit!43678 0))(
  ( (Unit!43679) )
))
(declare-fun lt!591997 () Unit!43678)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!289 ((_ BitVec 64) (_ BitVec 64) V!54137 ListLongMap!21521) Unit!43678)

(assert (=> b!1333621 (= lt!591997 (lemmaInListMapAfterAddingDiffThenInBefore!289 k0!1153 (select (arr!43649 _keys!1590) from!1980) lt!591996 lt!591995))))

(declare-fun res!885048 () Bool)

(assert (=> start!112470 (=> (not res!885048) (not e!759679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112470 (= res!885048 (validMask!0 mask!1998))))

(assert (=> start!112470 e!759679))

(declare-fun e!759676 () Bool)

(declare-fun array_inv!33117 (array!90363) Bool)

(assert (=> start!112470 (and (array_inv!33117 _values!1320) e!759676)))

(assert (=> start!112470 true))

(declare-fun array_inv!33118 (array!90365) Bool)

(assert (=> start!112470 (array_inv!33118 _keys!1590)))

(assert (=> start!112470 tp!108232))

(declare-fun tp_is_empty!36775 () Bool)

(assert (=> start!112470 tp_is_empty!36775))

(declare-fun mapNonEmpty!56836 () Bool)

(declare-fun tp!108233 () Bool)

(declare-fun e!759678 () Bool)

(assert (=> mapNonEmpty!56836 (= mapRes!56836 (and tp!108233 e!759678))))

(declare-fun mapValue!56836 () ValueCell!17489)

(declare-fun mapRest!56836 () (Array (_ BitVec 32) ValueCell!17489))

(declare-fun mapKey!56836 () (_ BitVec 32))

(assert (=> mapNonEmpty!56836 (= (arr!43648 _values!1320) (store mapRest!56836 mapKey!56836 mapValue!56836))))

(declare-fun b!1333622 () Bool)

(declare-fun res!885050 () Bool)

(assert (=> b!1333622 (=> (not res!885050) (not e!759677))))

(assert (=> b!1333622 (= res!885050 (not (= k0!1153 (select (arr!43649 _keys!1590) from!1980))))))

(declare-fun b!1333623 () Bool)

(declare-fun e!759675 () Bool)

(assert (=> b!1333623 (= e!759675 tp_is_empty!36775)))

(declare-fun b!1333624 () Bool)

(declare-fun res!885056 () Bool)

(assert (=> b!1333624 (=> (not res!885056) (not e!759679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90365 (_ BitVec 32)) Bool)

(assert (=> b!1333624 (= res!885056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333625 () Bool)

(declare-fun res!885053 () Bool)

(assert (=> b!1333625 (=> (not res!885053) (not e!759679))))

(assert (=> b!1333625 (= res!885053 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44201 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333626 () Bool)

(assert (=> b!1333626 (= e!759678 tp_is_empty!36775)))

(declare-fun b!1333627 () Bool)

(assert (=> b!1333627 (= e!759676 (and e!759675 mapRes!56836))))

(declare-fun condMapEmpty!56836 () Bool)

(declare-fun mapDefault!56836 () ValueCell!17489)

(assert (=> b!1333627 (= condMapEmpty!56836 (= (arr!43648 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17489)) mapDefault!56836)))))

(declare-fun b!1333628 () Bool)

(declare-fun res!885057 () Bool)

(assert (=> b!1333628 (=> (not res!885057) (not e!759679))))

(declare-datatypes ((List!31003 0))(
  ( (Nil!31000) (Cons!30999 (h!32208 (_ BitVec 64)) (t!45219 List!31003)) )
))
(declare-fun arrayNoDuplicates!0 (array!90365 (_ BitVec 32) List!31003) Bool)

(assert (=> b!1333628 (= res!885057 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31000))))

(declare-fun b!1333629 () Bool)

(assert (=> b!1333629 (= e!759679 e!759677)))

(declare-fun res!885055 () Bool)

(assert (=> b!1333629 (=> (not res!885055) (not e!759677))))

(declare-fun +!4739 (ListLongMap!21521 tuple2!23864) ListLongMap!21521)

(assert (=> b!1333629 (= res!885055 (contains!8868 (+!4739 lt!591995 (tuple2!23865 (select (arr!43649 _keys!1590) from!1980) lt!591996)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6377 (array!90365 array!90363 (_ BitVec 32) (_ BitVec 32) V!54137 V!54137 (_ BitVec 32) Int) ListLongMap!21521)

(assert (=> b!1333629 (= lt!591995 (getCurrentListMapNoExtraKeys!6377 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22024 (ValueCell!17489 V!54137) V!54137)

(declare-fun dynLambda!3669 (Int (_ BitVec 64)) V!54137)

(assert (=> b!1333629 (= lt!591996 (get!22024 (select (arr!43648 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!112470 res!885048) b!1333617))

(assert (= (and b!1333617 res!885058) b!1333624))

(assert (= (and b!1333624 res!885056) b!1333628))

(assert (= (and b!1333628 res!885057) b!1333625))

(assert (= (and b!1333625 res!885053) b!1333620))

(assert (= (and b!1333620 res!885051) b!1333618))

(assert (= (and b!1333618 res!885049) b!1333619))

(assert (= (and b!1333619 res!885052) b!1333616))

(assert (= (and b!1333616 res!885054) b!1333629))

(assert (= (and b!1333629 res!885055) b!1333622))

(assert (= (and b!1333622 res!885050) b!1333621))

(assert (= (and b!1333627 condMapEmpty!56836) mapIsEmpty!56836))

(assert (= (and b!1333627 (not condMapEmpty!56836)) mapNonEmpty!56836))

(get-info :version)

(assert (= (and mapNonEmpty!56836 ((_ is ValueCellFull!17489) mapValue!56836)) b!1333626))

(assert (= (and b!1333627 ((_ is ValueCellFull!17489) mapDefault!56836)) b!1333623))

(assert (= start!112470 b!1333627))

(declare-fun b_lambda!24061 () Bool)

(assert (=> (not b_lambda!24061) (not b!1333629)))

(declare-fun t!45217 () Bool)

(declare-fun tb!12019 () Bool)

(assert (=> (and start!112470 (= defaultEntry!1323 defaultEntry!1323) t!45217) tb!12019))

(declare-fun result!25117 () Bool)

(assert (=> tb!12019 (= result!25117 tp_is_empty!36775)))

(assert (=> b!1333629 t!45217))

(declare-fun b_and!49715 () Bool)

(assert (= b_and!49713 (and (=> t!45217 result!25117) b_and!49715)))

(declare-fun m!1221675 () Bool)

(assert (=> b!1333624 m!1221675))

(declare-fun m!1221677 () Bool)

(assert (=> b!1333620 m!1221677))

(assert (=> b!1333620 m!1221677))

(declare-fun m!1221679 () Bool)

(assert (=> b!1333620 m!1221679))

(declare-fun m!1221681 () Bool)

(assert (=> b!1333622 m!1221681))

(assert (=> b!1333619 m!1221681))

(assert (=> b!1333619 m!1221681))

(declare-fun m!1221683 () Bool)

(assert (=> b!1333619 m!1221683))

(assert (=> b!1333618 m!1221681))

(declare-fun m!1221685 () Bool)

(assert (=> mapNonEmpty!56836 m!1221685))

(declare-fun m!1221687 () Bool)

(assert (=> start!112470 m!1221687))

(declare-fun m!1221689 () Bool)

(assert (=> start!112470 m!1221689))

(declare-fun m!1221691 () Bool)

(assert (=> start!112470 m!1221691))

(declare-fun m!1221693 () Bool)

(assert (=> b!1333628 m!1221693))

(declare-fun m!1221695 () Bool)

(assert (=> b!1333621 m!1221695))

(assert (=> b!1333621 m!1221681))

(assert (=> b!1333621 m!1221681))

(declare-fun m!1221697 () Bool)

(assert (=> b!1333621 m!1221697))

(declare-fun m!1221699 () Bool)

(assert (=> b!1333629 m!1221699))

(declare-fun m!1221701 () Bool)

(assert (=> b!1333629 m!1221701))

(assert (=> b!1333629 m!1221699))

(declare-fun m!1221703 () Bool)

(assert (=> b!1333629 m!1221703))

(declare-fun m!1221705 () Bool)

(assert (=> b!1333629 m!1221705))

(declare-fun m!1221707 () Bool)

(assert (=> b!1333629 m!1221707))

(declare-fun m!1221709 () Bool)

(assert (=> b!1333629 m!1221709))

(assert (=> b!1333629 m!1221705))

(assert (=> b!1333629 m!1221701))

(assert (=> b!1333629 m!1221681))

(check-sat (not b!1333629) (not start!112470) (not b_next!30865) (not b!1333621) (not b_lambda!24061) tp_is_empty!36775 b_and!49715 (not mapNonEmpty!56836) (not b!1333620) (not b!1333628) (not b!1333619) (not b!1333624))
(check-sat b_and!49715 (not b_next!30865))
