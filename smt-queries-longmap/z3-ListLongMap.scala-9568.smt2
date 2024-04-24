; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113494 () Bool)

(assert start!113494)

(declare-fun b_free!31321 () Bool)

(declare-fun b_next!31321 () Bool)

(assert (=> start!113494 (= b_free!31321 (not b_next!31321))))

(declare-fun tp!109767 () Bool)

(declare-fun b_and!50545 () Bool)

(assert (=> start!113494 (= tp!109767 b_and!50545)))

(declare-fun mapIsEmpty!57688 () Bool)

(declare-fun mapRes!57688 () Bool)

(assert (=> mapIsEmpty!57688 mapRes!57688))

(declare-fun b!1345242 () Bool)

(declare-fun e!765731 () Bool)

(declare-fun e!765728 () Bool)

(assert (=> b!1345242 (= e!765731 (and e!765728 mapRes!57688))))

(declare-fun condMapEmpty!57688 () Bool)

(declare-datatypes ((V!54865 0))(
  ( (V!54866 (val!18735 Int)) )
))
(declare-datatypes ((ValueCell!17762 0))(
  ( (ValueCellFull!17762 (v!21378 V!54865)) (EmptyCell!17762) )
))
(declare-datatypes ((array!91597 0))(
  ( (array!91598 (arr!44250 (Array (_ BitVec 32) ValueCell!17762)) (size!44801 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91597)

(declare-fun mapDefault!57688 () ValueCell!17762)

(assert (=> b!1345242 (= condMapEmpty!57688 (= (arr!44250 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17762)) mapDefault!57688)))))

(declare-fun b!1345243 () Bool)

(declare-fun tp_is_empty!37321 () Bool)

(assert (=> b!1345243 (= e!765728 tp_is_empty!37321)))

(declare-fun b!1345244 () Bool)

(declare-fun e!765730 () Bool)

(assert (=> b!1345244 (= e!765730 tp_is_empty!37321)))

(declare-fun b!1345245 () Bool)

(declare-fun res!892204 () Bool)

(declare-fun e!765727 () Bool)

(assert (=> b!1345245 (=> (not res!892204) (not e!765727))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91599 0))(
  ( (array!91600 (arr!44251 (Array (_ BitVec 32) (_ BitVec 64))) (size!44802 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91599)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345245 (= res!892204 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44802 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345246 () Bool)

(declare-fun res!892205 () Bool)

(assert (=> b!1345246 (=> (not res!892205) (not e!765727))))

(declare-datatypes ((List!31330 0))(
  ( (Nil!31327) (Cons!31326 (h!32544 (_ BitVec 64)) (t!45846 List!31330)) )
))
(declare-fun arrayNoDuplicates!0 (array!91599 (_ BitVec 32) List!31330) Bool)

(assert (=> b!1345246 (= res!892205 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31327))))

(declare-fun b!1345247 () Bool)

(declare-fun res!892206 () Bool)

(assert (=> b!1345247 (=> (not res!892206) (not e!765727))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91599 (_ BitVec 32)) Bool)

(assert (=> b!1345247 (= res!892206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345248 () Bool)

(assert (=> b!1345248 (= e!765727 false)))

(declare-fun minValue!1245 () V!54865)

(declare-fun zeroValue!1245 () V!54865)

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!595607 () Bool)

(declare-datatypes ((tuple2!24186 0))(
  ( (tuple2!24187 (_1!12104 (_ BitVec 64)) (_2!12104 V!54865)) )
))
(declare-datatypes ((List!31331 0))(
  ( (Nil!31328) (Cons!31327 (h!32545 tuple2!24186) (t!45847 List!31331)) )
))
(declare-datatypes ((ListLongMap!21851 0))(
  ( (ListLongMap!21852 (toList!10941 List!31331)) )
))
(declare-fun contains!9129 (ListLongMap!21851 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5885 (array!91599 array!91597 (_ BitVec 32) (_ BitVec 32) V!54865 V!54865 (_ BitVec 32) Int) ListLongMap!21851)

(assert (=> b!1345248 (= lt!595607 (contains!9129 (getCurrentListMap!5885 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345249 () Bool)

(declare-fun res!892208 () Bool)

(assert (=> b!1345249 (=> (not res!892208) (not e!765727))))

(assert (=> b!1345249 (= res!892208 (and (= (size!44801 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44802 _keys!1571) (size!44801 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57688 () Bool)

(declare-fun tp!109768 () Bool)

(assert (=> mapNonEmpty!57688 (= mapRes!57688 (and tp!109768 e!765730))))

(declare-fun mapValue!57688 () ValueCell!17762)

(declare-fun mapKey!57688 () (_ BitVec 32))

(declare-fun mapRest!57688 () (Array (_ BitVec 32) ValueCell!17762))

(assert (=> mapNonEmpty!57688 (= (arr!44250 _values!1303) (store mapRest!57688 mapKey!57688 mapValue!57688))))

(declare-fun res!892207 () Bool)

(assert (=> start!113494 (=> (not res!892207) (not e!765727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113494 (= res!892207 (validMask!0 mask!1977))))

(assert (=> start!113494 e!765727))

(assert (=> start!113494 tp_is_empty!37321))

(assert (=> start!113494 true))

(declare-fun array_inv!33623 (array!91599) Bool)

(assert (=> start!113494 (array_inv!33623 _keys!1571)))

(declare-fun array_inv!33624 (array!91597) Bool)

(assert (=> start!113494 (and (array_inv!33624 _values!1303) e!765731)))

(assert (=> start!113494 tp!109767))

(assert (= (and start!113494 res!892207) b!1345249))

(assert (= (and b!1345249 res!892208) b!1345247))

(assert (= (and b!1345247 res!892206) b!1345246))

(assert (= (and b!1345246 res!892205) b!1345245))

(assert (= (and b!1345245 res!892204) b!1345248))

(assert (= (and b!1345242 condMapEmpty!57688) mapIsEmpty!57688))

(assert (= (and b!1345242 (not condMapEmpty!57688)) mapNonEmpty!57688))

(get-info :version)

(assert (= (and mapNonEmpty!57688 ((_ is ValueCellFull!17762) mapValue!57688)) b!1345244))

(assert (= (and b!1345242 ((_ is ValueCellFull!17762) mapDefault!57688)) b!1345243))

(assert (= start!113494 b!1345242))

(declare-fun m!1233309 () Bool)

(assert (=> b!1345248 m!1233309))

(assert (=> b!1345248 m!1233309))

(declare-fun m!1233311 () Bool)

(assert (=> b!1345248 m!1233311))

(declare-fun m!1233313 () Bool)

(assert (=> start!113494 m!1233313))

(declare-fun m!1233315 () Bool)

(assert (=> start!113494 m!1233315))

(declare-fun m!1233317 () Bool)

(assert (=> start!113494 m!1233317))

(declare-fun m!1233319 () Bool)

(assert (=> b!1345247 m!1233319))

(declare-fun m!1233321 () Bool)

(assert (=> mapNonEmpty!57688 m!1233321))

(declare-fun m!1233323 () Bool)

(assert (=> b!1345246 m!1233323))

(check-sat tp_is_empty!37321 (not b!1345247) (not b_next!31321) (not start!113494) (not b!1345248) b_and!50545 (not mapNonEmpty!57688) (not b!1345246))
(check-sat b_and!50545 (not b_next!31321))
