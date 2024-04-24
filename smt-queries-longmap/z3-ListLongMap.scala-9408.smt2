; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112236 () Bool)

(assert start!112236)

(declare-fun b!1328548 () Bool)

(declare-fun e!757330 () Bool)

(declare-fun tp_is_empty!36361 () Bool)

(assert (=> b!1328548 (= e!757330 tp_is_empty!36361)))

(declare-fun b!1328549 () Bool)

(declare-datatypes ((V!53585 0))(
  ( (V!53586 (val!18255 Int)) )
))
(declare-datatypes ((ValueCell!17282 0))(
  ( (ValueCellFull!17282 (v!20886 V!53585)) (EmptyCell!17282) )
))
(declare-datatypes ((array!89725 0))(
  ( (array!89726 (arr!43329 (Array (_ BitVec 32) ValueCell!17282)) (size!43880 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89725)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89727 0))(
  ( (array!89728 (arr!43330 (Array (_ BitVec 32) (_ BitVec 64))) (size!43881 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89727)

(declare-fun e!757332 () Bool)

(assert (=> b!1328549 (= e!757332 (and (= (size!43880 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43881 _keys!1590) (size!43880 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011) (not (= (size!43881 _keys!1590) (bvadd #b00000000000000000000000000000001 mask!1998)))))))

(declare-fun b!1328550 () Bool)

(declare-fun e!757331 () Bool)

(declare-fun mapRes!56200 () Bool)

(assert (=> b!1328550 (= e!757331 (and e!757330 mapRes!56200))))

(declare-fun condMapEmpty!56200 () Bool)

(declare-fun mapDefault!56200 () ValueCell!17282)

(assert (=> b!1328550 (= condMapEmpty!56200 (= (arr!43329 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17282)) mapDefault!56200)))))

(declare-fun mapIsEmpty!56200 () Bool)

(assert (=> mapIsEmpty!56200 mapRes!56200))

(declare-fun b!1328551 () Bool)

(declare-fun e!757333 () Bool)

(assert (=> b!1328551 (= e!757333 tp_is_empty!36361)))

(declare-fun res!881301 () Bool)

(assert (=> start!112236 (=> (not res!881301) (not e!757332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112236 (= res!881301 (validMask!0 mask!1998))))

(assert (=> start!112236 e!757332))

(assert (=> start!112236 true))

(declare-fun array_inv!32965 (array!89725) Bool)

(assert (=> start!112236 (and (array_inv!32965 _values!1320) e!757331)))

(declare-fun array_inv!32966 (array!89727) Bool)

(assert (=> start!112236 (array_inv!32966 _keys!1590)))

(declare-fun mapNonEmpty!56200 () Bool)

(declare-fun tp!107107 () Bool)

(assert (=> mapNonEmpty!56200 (= mapRes!56200 (and tp!107107 e!757333))))

(declare-fun mapKey!56200 () (_ BitVec 32))

(declare-fun mapRest!56200 () (Array (_ BitVec 32) ValueCell!17282))

(declare-fun mapValue!56200 () ValueCell!17282)

(assert (=> mapNonEmpty!56200 (= (arr!43329 _values!1320) (store mapRest!56200 mapKey!56200 mapValue!56200))))

(assert (= (and start!112236 res!881301) b!1328549))

(assert (= (and b!1328550 condMapEmpty!56200) mapIsEmpty!56200))

(assert (= (and b!1328550 (not condMapEmpty!56200)) mapNonEmpty!56200))

(get-info :version)

(assert (= (and mapNonEmpty!56200 ((_ is ValueCellFull!17282) mapValue!56200)) b!1328551))

(assert (= (and b!1328550 ((_ is ValueCellFull!17282) mapDefault!56200)) b!1328548))

(assert (= start!112236 b!1328550))

(declare-fun m!1218247 () Bool)

(assert (=> start!112236 m!1218247))

(declare-fun m!1218249 () Bool)

(assert (=> start!112236 m!1218249))

(declare-fun m!1218251 () Bool)

(assert (=> start!112236 m!1218251))

(declare-fun m!1218253 () Bool)

(assert (=> mapNonEmpty!56200 m!1218253))

(check-sat (not start!112236) (not mapNonEmpty!56200) tp_is_empty!36361)
(check-sat)
