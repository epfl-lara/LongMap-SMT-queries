; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112418 () Bool)

(assert start!112418)

(declare-fun b_free!30589 () Bool)

(declare-fun b_next!30589 () Bool)

(assert (=> start!112418 (= b_free!30589 (not b_next!30589))))

(declare-fun tp!107403 () Bool)

(declare-fun b_and!49241 () Bool)

(assert (=> start!112418 (= tp!107403 b_and!49241)))

(declare-fun b!1330065 () Bool)

(declare-fun e!758462 () Bool)

(declare-fun e!758464 () Bool)

(declare-fun mapRes!56422 () Bool)

(assert (=> b!1330065 (= e!758462 (and e!758464 mapRes!56422))))

(declare-fun condMapEmpty!56422 () Bool)

(declare-datatypes ((V!53769 0))(
  ( (V!53770 (val!18324 Int)) )
))
(declare-datatypes ((ValueCell!17351 0))(
  ( (ValueCellFull!17351 (v!20956 V!53769)) (EmptyCell!17351) )
))
(declare-datatypes ((array!89999 0))(
  ( (array!90000 (arr!43461 (Array (_ BitVec 32) ValueCell!17351)) (size!44012 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89999)

(declare-fun mapDefault!56422 () ValueCell!17351)

(assert (=> b!1330065 (= condMapEmpty!56422 (= (arr!43461 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17351)) mapDefault!56422)))))

(declare-fun mapNonEmpty!56422 () Bool)

(declare-fun tp!107404 () Bool)

(declare-fun e!758460 () Bool)

(assert (=> mapNonEmpty!56422 (= mapRes!56422 (and tp!107404 e!758460))))

(declare-fun mapRest!56422 () (Array (_ BitVec 32) ValueCell!17351))

(declare-fun mapKey!56422 () (_ BitVec 32))

(declare-fun mapValue!56422 () ValueCell!17351)

(assert (=> mapNonEmpty!56422 (= (arr!43461 _values!1320) (store mapRest!56422 mapKey!56422 mapValue!56422))))

(declare-fun b!1330066 () Bool)

(declare-fun res!882133 () Bool)

(declare-fun e!758461 () Bool)

(assert (=> b!1330066 (=> (not res!882133) (not e!758461))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90001 0))(
  ( (array!90002 (arr!43462 (Array (_ BitVec 32) (_ BitVec 64))) (size!44013 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90001)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53769)

(declare-fun zeroValue!1262 () V!53769)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23614 0))(
  ( (tuple2!23615 (_1!11818 (_ BitVec 64)) (_2!11818 V!53769)) )
))
(declare-datatypes ((List!30789 0))(
  ( (Nil!30786) (Cons!30785 (h!32003 tuple2!23614) (t!44787 List!30789)) )
))
(declare-datatypes ((ListLongMap!21279 0))(
  ( (ListLongMap!21280 (toList!10655 List!30789)) )
))
(declare-fun contains!8831 (ListLongMap!21279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5632 (array!90001 array!89999 (_ BitVec 32) (_ BitVec 32) V!53769 V!53769 (_ BitVec 32) Int) ListLongMap!21279)

(assert (=> b!1330066 (= res!882133 (contains!8831 (getCurrentListMap!5632 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330067 () Bool)

(assert (=> b!1330067 (= e!758461 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun b!1330068 () Bool)

(declare-fun res!882140 () Bool)

(assert (=> b!1330068 (=> (not res!882140) (not e!758461))))

(assert (=> b!1330068 (= res!882140 (and (= (size!44012 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44013 _keys!1590) (size!44012 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!882137 () Bool)

(assert (=> start!112418 (=> (not res!882137) (not e!758461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112418 (= res!882137 (validMask!0 mask!1998))))

(assert (=> start!112418 e!758461))

(declare-fun array_inv!33073 (array!89999) Bool)

(assert (=> start!112418 (and (array_inv!33073 _values!1320) e!758462)))

(assert (=> start!112418 true))

(declare-fun array_inv!33074 (array!90001) Bool)

(assert (=> start!112418 (array_inv!33074 _keys!1590)))

(assert (=> start!112418 tp!107403))

(declare-fun tp_is_empty!36499 () Bool)

(assert (=> start!112418 tp_is_empty!36499))

(declare-fun b!1330069 () Bool)

(assert (=> b!1330069 (= e!758464 tp_is_empty!36499)))

(declare-fun b!1330070 () Bool)

(declare-fun res!882139 () Bool)

(assert (=> b!1330070 (=> (not res!882139) (not e!758461))))

(assert (=> b!1330070 (= res!882139 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44013 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330071 () Bool)

(declare-fun res!882135 () Bool)

(assert (=> b!1330071 (=> (not res!882135) (not e!758461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330071 (= res!882135 (validKeyInArray!0 (select (arr!43462 _keys!1590) from!1980)))))

(declare-fun b!1330072 () Bool)

(declare-fun res!882136 () Bool)

(assert (=> b!1330072 (=> (not res!882136) (not e!758461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90001 (_ BitVec 32)) Bool)

(assert (=> b!1330072 (= res!882136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330073 () Bool)

(declare-fun res!882134 () Bool)

(assert (=> b!1330073 (=> (not res!882134) (not e!758461))))

(declare-datatypes ((List!30790 0))(
  ( (Nil!30787) (Cons!30786 (h!32004 (_ BitVec 64)) (t!44788 List!30790)) )
))
(declare-fun arrayNoDuplicates!0 (array!90001 (_ BitVec 32) List!30790) Bool)

(assert (=> b!1330073 (= res!882134 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30787))))

(declare-fun b!1330074 () Bool)

(assert (=> b!1330074 (= e!758460 tp_is_empty!36499)))

(declare-fun mapIsEmpty!56422 () Bool)

(assert (=> mapIsEmpty!56422 mapRes!56422))

(declare-fun b!1330075 () Bool)

(declare-fun res!882138 () Bool)

(assert (=> b!1330075 (=> (not res!882138) (not e!758461))))

(assert (=> b!1330075 (= res!882138 (not (= (select (arr!43462 _keys!1590) from!1980) k0!1153)))))

(assert (= (and start!112418 res!882137) b!1330068))

(assert (= (and b!1330068 res!882140) b!1330072))

(assert (= (and b!1330072 res!882136) b!1330073))

(assert (= (and b!1330073 res!882134) b!1330070))

(assert (= (and b!1330070 res!882139) b!1330066))

(assert (= (and b!1330066 res!882133) b!1330075))

(assert (= (and b!1330075 res!882138) b!1330071))

(assert (= (and b!1330071 res!882135) b!1330067))

(assert (= (and b!1330065 condMapEmpty!56422) mapIsEmpty!56422))

(assert (= (and b!1330065 (not condMapEmpty!56422)) mapNonEmpty!56422))

(get-info :version)

(assert (= (and mapNonEmpty!56422 ((_ is ValueCellFull!17351) mapValue!56422)) b!1330074))

(assert (= (and b!1330065 ((_ is ValueCellFull!17351) mapDefault!56422)) b!1330069))

(assert (= start!112418 b!1330065))

(declare-fun m!1219223 () Bool)

(assert (=> b!1330072 m!1219223))

(declare-fun m!1219225 () Bool)

(assert (=> start!112418 m!1219225))

(declare-fun m!1219227 () Bool)

(assert (=> start!112418 m!1219227))

(declare-fun m!1219229 () Bool)

(assert (=> start!112418 m!1219229))

(declare-fun m!1219231 () Bool)

(assert (=> b!1330071 m!1219231))

(assert (=> b!1330071 m!1219231))

(declare-fun m!1219233 () Bool)

(assert (=> b!1330071 m!1219233))

(declare-fun m!1219235 () Bool)

(assert (=> b!1330066 m!1219235))

(assert (=> b!1330066 m!1219235))

(declare-fun m!1219237 () Bool)

(assert (=> b!1330066 m!1219237))

(assert (=> b!1330075 m!1219231))

(declare-fun m!1219239 () Bool)

(assert (=> b!1330073 m!1219239))

(declare-fun m!1219241 () Bool)

(assert (=> mapNonEmpty!56422 m!1219241))

(check-sat (not b!1330073) (not mapNonEmpty!56422) (not start!112418) b_and!49241 (not b_next!30589) (not b!1330071) (not b!1330072) tp_is_empty!36499 (not b!1330066))
(check-sat b_and!49241 (not b_next!30589))
