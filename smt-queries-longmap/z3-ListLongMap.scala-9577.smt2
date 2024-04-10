; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113326 () Bool)

(assert start!113326)

(declare-fun b_free!31377 () Bool)

(declare-fun b_next!31377 () Bool)

(assert (=> start!113326 (= b_free!31377 (not b_next!31377))))

(declare-fun tp!109935 () Bool)

(declare-fun b_and!50607 () Bool)

(assert (=> start!113326 (= tp!109935 b_and!50607)))

(declare-fun b!1344706 () Bool)

(declare-fun res!892190 () Bool)

(declare-fun e!765304 () Bool)

(assert (=> b!1344706 (=> (not res!892190) (not e!765304))))

(declare-datatypes ((array!91594 0))(
  ( (array!91595 (arr!44253 (Array (_ BitVec 32) (_ BitVec 64))) (size!44803 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91594)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344706 (= res!892190 (validKeyInArray!0 (select (arr!44253 _keys!1571) from!1960)))))

(declare-fun b!1344707 () Bool)

(declare-fun res!892196 () Bool)

(assert (=> b!1344707 (=> (not res!892196) (not e!765304))))

(declare-datatypes ((V!54939 0))(
  ( (V!54940 (val!18763 Int)) )
))
(declare-fun minValue!1245 () V!54939)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54939)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17790 0))(
  ( (ValueCellFull!17790 (v!21411 V!54939)) (EmptyCell!17790) )
))
(declare-datatypes ((array!91596 0))(
  ( (array!91597 (arr!44254 (Array (_ BitVec 32) ValueCell!17790)) (size!44804 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91596)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24182 0))(
  ( (tuple2!24183 (_1!12102 (_ BitVec 64)) (_2!12102 V!54939)) )
))
(declare-datatypes ((List!31338 0))(
  ( (Nil!31335) (Cons!31334 (h!32543 tuple2!24182) (t!45872 List!31338)) )
))
(declare-datatypes ((ListLongMap!21839 0))(
  ( (ListLongMap!21840 (toList!10935 List!31338)) )
))
(declare-fun contains!9111 (ListLongMap!21839 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5891 (array!91594 array!91596 (_ BitVec 32) (_ BitVec 32) V!54939 V!54939 (_ BitVec 32) Int) ListLongMap!21839)

(assert (=> b!1344707 (= res!892196 (contains!9111 (getCurrentListMap!5891 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344708 () Bool)

(declare-fun res!892192 () Bool)

(assert (=> b!1344708 (=> (not res!892192) (not e!765304))))

(assert (=> b!1344708 (= res!892192 (and (= (size!44804 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44803 _keys!1571) (size!44804 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344709 () Bool)

(declare-fun res!892189 () Bool)

(assert (=> b!1344709 (=> (not res!892189) (not e!765304))))

(assert (=> b!1344709 (= res!892189 (not (= (select (arr!44253 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapNonEmpty!57772 () Bool)

(declare-fun mapRes!57772 () Bool)

(declare-fun tp!109936 () Bool)

(declare-fun e!765308 () Bool)

(assert (=> mapNonEmpty!57772 (= mapRes!57772 (and tp!109936 e!765308))))

(declare-fun mapValue!57772 () ValueCell!17790)

(declare-fun mapKey!57772 () (_ BitVec 32))

(declare-fun mapRest!57772 () (Array (_ BitVec 32) ValueCell!17790))

(assert (=> mapNonEmpty!57772 (= (arr!44254 _values!1303) (store mapRest!57772 mapKey!57772 mapValue!57772))))

(declare-fun b!1344710 () Bool)

(assert (=> b!1344710 (= e!765304 false)))

(declare-fun lt!595206 () Bool)

(declare-fun +!4821 (ListLongMap!21839 tuple2!24182) ListLongMap!21839)

(declare-fun getCurrentListMapNoExtraKeys!6463 (array!91594 array!91596 (_ BitVec 32) (_ BitVec 32) V!54939 V!54939 (_ BitVec 32) Int) ListLongMap!21839)

(declare-fun get!22352 (ValueCell!17790 V!54939) V!54939)

(declare-fun dynLambda!3760 (Int (_ BitVec 64)) V!54939)

(assert (=> b!1344710 (= lt!595206 (contains!9111 (+!4821 (getCurrentListMapNoExtraKeys!6463 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24183 (select (arr!44253 _keys!1571) from!1960) (get!22352 (select (arr!44254 _values!1303) from!1960) (dynLambda!3760 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142))))

(declare-fun b!1344711 () Bool)

(declare-fun res!892197 () Bool)

(assert (=> b!1344711 (=> (not res!892197) (not e!765304))))

(declare-datatypes ((List!31339 0))(
  ( (Nil!31336) (Cons!31335 (h!32544 (_ BitVec 64)) (t!45873 List!31339)) )
))
(declare-fun arrayNoDuplicates!0 (array!91594 (_ BitVec 32) List!31339) Bool)

(assert (=> b!1344711 (= res!892197 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31336))))

(declare-fun b!1344712 () Bool)

(declare-fun res!892195 () Bool)

(assert (=> b!1344712 (=> (not res!892195) (not e!765304))))

(assert (=> b!1344712 (= res!892195 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!892194 () Bool)

(assert (=> start!113326 (=> (not res!892194) (not e!765304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113326 (= res!892194 (validMask!0 mask!1977))))

(assert (=> start!113326 e!765304))

(declare-fun tp_is_empty!37377 () Bool)

(assert (=> start!113326 tp_is_empty!37377))

(assert (=> start!113326 true))

(declare-fun array_inv!33351 (array!91594) Bool)

(assert (=> start!113326 (array_inv!33351 _keys!1571)))

(declare-fun e!765305 () Bool)

(declare-fun array_inv!33352 (array!91596) Bool)

(assert (=> start!113326 (and (array_inv!33352 _values!1303) e!765305)))

(assert (=> start!113326 tp!109935))

(declare-fun b!1344713 () Bool)

(assert (=> b!1344713 (= e!765308 tp_is_empty!37377)))

(declare-fun b!1344714 () Bool)

(declare-fun e!765307 () Bool)

(assert (=> b!1344714 (= e!765305 (and e!765307 mapRes!57772))))

(declare-fun condMapEmpty!57772 () Bool)

(declare-fun mapDefault!57772 () ValueCell!17790)

(assert (=> b!1344714 (= condMapEmpty!57772 (= (arr!44254 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17790)) mapDefault!57772)))))

(declare-fun b!1344715 () Bool)

(declare-fun res!892193 () Bool)

(assert (=> b!1344715 (=> (not res!892193) (not e!765304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91594 (_ BitVec 32)) Bool)

(assert (=> b!1344715 (= res!892193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344716 () Bool)

(assert (=> b!1344716 (= e!765307 tp_is_empty!37377)))

(declare-fun b!1344717 () Bool)

(declare-fun res!892191 () Bool)

(assert (=> b!1344717 (=> (not res!892191) (not e!765304))))

(assert (=> b!1344717 (= res!892191 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44803 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57772 () Bool)

(assert (=> mapIsEmpty!57772 mapRes!57772))

(assert (= (and start!113326 res!892194) b!1344708))

(assert (= (and b!1344708 res!892192) b!1344715))

(assert (= (and b!1344715 res!892193) b!1344711))

(assert (= (and b!1344711 res!892197) b!1344717))

(assert (= (and b!1344717 res!892191) b!1344707))

(assert (= (and b!1344707 res!892196) b!1344709))

(assert (= (and b!1344709 res!892189) b!1344706))

(assert (= (and b!1344706 res!892190) b!1344712))

(assert (= (and b!1344712 res!892195) b!1344710))

(assert (= (and b!1344714 condMapEmpty!57772) mapIsEmpty!57772))

(assert (= (and b!1344714 (not condMapEmpty!57772)) mapNonEmpty!57772))

(get-info :version)

(assert (= (and mapNonEmpty!57772 ((_ is ValueCellFull!17790) mapValue!57772)) b!1344713))

(assert (= (and b!1344714 ((_ is ValueCellFull!17790) mapDefault!57772)) b!1344716))

(assert (= start!113326 b!1344714))

(declare-fun b_lambda!24499 () Bool)

(assert (=> (not b_lambda!24499) (not b!1344710)))

(declare-fun t!45871 () Bool)

(declare-fun tb!12337 () Bool)

(assert (=> (and start!113326 (= defaultEntry!1306 defaultEntry!1306) t!45871) tb!12337))

(declare-fun result!25765 () Bool)

(assert (=> tb!12337 (= result!25765 tp_is_empty!37377)))

(assert (=> b!1344710 t!45871))

(declare-fun b_and!50609 () Bool)

(assert (= b_and!50607 (and (=> t!45871 result!25765) b_and!50609)))

(declare-fun m!1232235 () Bool)

(assert (=> b!1344711 m!1232235))

(declare-fun m!1232237 () Bool)

(assert (=> start!113326 m!1232237))

(declare-fun m!1232239 () Bool)

(assert (=> start!113326 m!1232239))

(declare-fun m!1232241 () Bool)

(assert (=> start!113326 m!1232241))

(declare-fun m!1232243 () Bool)

(assert (=> mapNonEmpty!57772 m!1232243))

(declare-fun m!1232245 () Bool)

(assert (=> b!1344715 m!1232245))

(declare-fun m!1232247 () Bool)

(assert (=> b!1344707 m!1232247))

(assert (=> b!1344707 m!1232247))

(declare-fun m!1232249 () Bool)

(assert (=> b!1344707 m!1232249))

(declare-fun m!1232251 () Bool)

(assert (=> b!1344706 m!1232251))

(assert (=> b!1344706 m!1232251))

(declare-fun m!1232253 () Bool)

(assert (=> b!1344706 m!1232253))

(declare-fun m!1232255 () Bool)

(assert (=> b!1344710 m!1232255))

(declare-fun m!1232257 () Bool)

(assert (=> b!1344710 m!1232257))

(declare-fun m!1232259 () Bool)

(assert (=> b!1344710 m!1232259))

(declare-fun m!1232261 () Bool)

(assert (=> b!1344710 m!1232261))

(assert (=> b!1344710 m!1232255))

(declare-fun m!1232263 () Bool)

(assert (=> b!1344710 m!1232263))

(assert (=> b!1344710 m!1232257))

(assert (=> b!1344710 m!1232259))

(assert (=> b!1344710 m!1232263))

(declare-fun m!1232265 () Bool)

(assert (=> b!1344710 m!1232265))

(assert (=> b!1344710 m!1232251))

(assert (=> b!1344709 m!1232251))

(check-sat (not b_lambda!24499) (not b!1344715) (not b!1344710) (not start!113326) (not b_next!31377) (not b!1344711) tp_is_empty!37377 (not mapNonEmpty!57772) (not b!1344707) (not b!1344706) b_and!50609)
(check-sat b_and!50609 (not b_next!31377))
