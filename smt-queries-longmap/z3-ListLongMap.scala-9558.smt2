; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113434 () Bool)

(assert start!113434)

(declare-fun b_free!31261 () Bool)

(declare-fun b_next!31261 () Bool)

(assert (=> start!113434 (= b_free!31261 (not b_next!31261))))

(declare-fun tp!109588 () Bool)

(declare-fun b_and!50431 () Bool)

(assert (=> start!113434 (= tp!109588 b_and!50431)))

(declare-fun b!1344152 () Bool)

(declare-fun res!891441 () Bool)

(declare-fun e!765278 () Bool)

(assert (=> b!1344152 (=> (not res!891441) (not e!765278))))

(declare-datatypes ((V!54785 0))(
  ( (V!54786 (val!18705 Int)) )
))
(declare-fun minValue!1245 () V!54785)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91485 0))(
  ( (array!91486 (arr!44194 (Array (_ BitVec 32) (_ BitVec 64))) (size!44745 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91485)

(declare-fun zeroValue!1245 () V!54785)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17732 0))(
  ( (ValueCellFull!17732 (v!21348 V!54785)) (EmptyCell!17732) )
))
(declare-datatypes ((array!91487 0))(
  ( (array!91488 (arr!44195 (Array (_ BitVec 32) ValueCell!17732)) (size!44746 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91487)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((tuple2!24144 0))(
  ( (tuple2!24145 (_1!12083 (_ BitVec 64)) (_2!12083 V!54785)) )
))
(declare-datatypes ((List!31293 0))(
  ( (Nil!31290) (Cons!31289 (h!32507 tuple2!24144) (t!45757 List!31293)) )
))
(declare-datatypes ((ListLongMap!21809 0))(
  ( (ListLongMap!21810 (toList!10920 List!31293)) )
))
(declare-fun contains!9108 (ListLongMap!21809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5866 (array!91485 array!91487 (_ BitVec 32) (_ BitVec 32) V!54785 V!54785 (_ BitVec 32) Int) ListLongMap!21809)

(assert (=> b!1344152 (= res!891441 (contains!9108 (getCurrentListMap!5866 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344153 () Bool)

(declare-fun res!891439 () Bool)

(assert (=> b!1344153 (=> (not res!891439) (not e!765278))))

(assert (=> b!1344153 (= res!891439 (not (= (select (arr!44194 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapNonEmpty!57598 () Bool)

(declare-fun mapRes!57598 () Bool)

(declare-fun tp!109587 () Bool)

(declare-fun e!765277 () Bool)

(assert (=> mapNonEmpty!57598 (= mapRes!57598 (and tp!109587 e!765277))))

(declare-fun mapValue!57598 () ValueCell!17732)

(declare-fun mapKey!57598 () (_ BitVec 32))

(declare-fun mapRest!57598 () (Array (_ BitVec 32) ValueCell!17732))

(assert (=> mapNonEmpty!57598 (= (arr!44195 _values!1303) (store mapRest!57598 mapKey!57598 mapValue!57598))))

(declare-fun b!1344154 () Bool)

(assert (=> b!1344154 (= e!765278 (not true))))

(declare-fun lt!595126 () ListLongMap!21809)

(declare-fun +!4836 (ListLongMap!21809 tuple2!24144) ListLongMap!21809)

(assert (=> b!1344154 (contains!9108 (+!4836 lt!595126 (tuple2!24145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44012 0))(
  ( (Unit!44013) )
))
(declare-fun lt!595127 () Unit!44012)

(declare-fun addStillContains!1198 (ListLongMap!21809 (_ BitVec 64) V!54785 (_ BitVec 64)) Unit!44012)

(assert (=> b!1344154 (= lt!595127 (addStillContains!1198 lt!595126 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1344154 (contains!9108 lt!595126 k0!1142)))

(declare-fun lt!595125 () Unit!44012)

(declare-fun lt!595123 () V!54785)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!362 ((_ BitVec 64) (_ BitVec 64) V!54785 ListLongMap!21809) Unit!44012)

(assert (=> b!1344154 (= lt!595125 (lemmaInListMapAfterAddingDiffThenInBefore!362 k0!1142 (select (arr!44194 _keys!1571) from!1960) lt!595123 lt!595126))))

(declare-fun lt!595122 () ListLongMap!21809)

(assert (=> b!1344154 (contains!9108 lt!595122 k0!1142)))

(declare-fun lt!595124 () Unit!44012)

(assert (=> b!1344154 (= lt!595124 (lemmaInListMapAfterAddingDiffThenInBefore!362 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595122))))

(assert (=> b!1344154 (= lt!595122 (+!4836 lt!595126 (tuple2!24145 (select (arr!44194 _keys!1571) from!1960) lt!595123)))))

(declare-fun get!22332 (ValueCell!17732 V!54785) V!54785)

(declare-fun dynLambda!3790 (Int (_ BitVec 64)) V!54785)

(assert (=> b!1344154 (= lt!595123 (get!22332 (select (arr!44195 _values!1303) from!1960) (dynLambda!3790 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6485 (array!91485 array!91487 (_ BitVec 32) (_ BitVec 32) V!54785 V!54785 (_ BitVec 32) Int) ListLongMap!21809)

(assert (=> b!1344154 (= lt!595126 (getCurrentListMapNoExtraKeys!6485 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1344155 () Bool)

(declare-fun res!891443 () Bool)

(assert (=> b!1344155 (=> (not res!891443) (not e!765278))))

(assert (=> b!1344155 (= res!891443 (and (= (size!44746 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44745 _keys!1571) (size!44746 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344156 () Bool)

(declare-fun res!891440 () Bool)

(assert (=> b!1344156 (=> (not res!891440) (not e!765278))))

(assert (=> b!1344156 (= res!891440 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44745 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344157 () Bool)

(declare-fun e!765281 () Bool)

(declare-fun e!765279 () Bool)

(assert (=> b!1344157 (= e!765281 (and e!765279 mapRes!57598))))

(declare-fun condMapEmpty!57598 () Bool)

(declare-fun mapDefault!57598 () ValueCell!17732)

(assert (=> b!1344157 (= condMapEmpty!57598 (= (arr!44195 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17732)) mapDefault!57598)))))

(declare-fun b!1344158 () Bool)

(declare-fun res!891442 () Bool)

(assert (=> b!1344158 (=> (not res!891442) (not e!765278))))

(assert (=> b!1344158 (= res!891442 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1344159 () Bool)

(declare-fun tp_is_empty!37261 () Bool)

(assert (=> b!1344159 (= e!765279 tp_is_empty!37261)))

(declare-fun res!891445 () Bool)

(assert (=> start!113434 (=> (not res!891445) (not e!765278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113434 (= res!891445 (validMask!0 mask!1977))))

(assert (=> start!113434 e!765278))

(assert (=> start!113434 tp_is_empty!37261))

(assert (=> start!113434 true))

(declare-fun array_inv!33585 (array!91485) Bool)

(assert (=> start!113434 (array_inv!33585 _keys!1571)))

(declare-fun array_inv!33586 (array!91487) Bool)

(assert (=> start!113434 (and (array_inv!33586 _values!1303) e!765281)))

(assert (=> start!113434 tp!109588))

(declare-fun mapIsEmpty!57598 () Bool)

(assert (=> mapIsEmpty!57598 mapRes!57598))

(declare-fun b!1344160 () Bool)

(assert (=> b!1344160 (= e!765277 tp_is_empty!37261)))

(declare-fun b!1344161 () Bool)

(declare-fun res!891438 () Bool)

(assert (=> b!1344161 (=> (not res!891438) (not e!765278))))

(declare-datatypes ((List!31294 0))(
  ( (Nil!31291) (Cons!31290 (h!32508 (_ BitVec 64)) (t!45758 List!31294)) )
))
(declare-fun arrayNoDuplicates!0 (array!91485 (_ BitVec 32) List!31294) Bool)

(assert (=> b!1344161 (= res!891438 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31291))))

(declare-fun b!1344162 () Bool)

(declare-fun res!891446 () Bool)

(assert (=> b!1344162 (=> (not res!891446) (not e!765278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91485 (_ BitVec 32)) Bool)

(assert (=> b!1344162 (= res!891446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344163 () Bool)

(declare-fun res!891444 () Bool)

(assert (=> b!1344163 (=> (not res!891444) (not e!765278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344163 (= res!891444 (validKeyInArray!0 (select (arr!44194 _keys!1571) from!1960)))))

(assert (= (and start!113434 res!891445) b!1344155))

(assert (= (and b!1344155 res!891443) b!1344162))

(assert (= (and b!1344162 res!891446) b!1344161))

(assert (= (and b!1344161 res!891438) b!1344156))

(assert (= (and b!1344156 res!891440) b!1344152))

(assert (= (and b!1344152 res!891441) b!1344153))

(assert (= (and b!1344153 res!891439) b!1344163))

(assert (= (and b!1344163 res!891444) b!1344158))

(assert (= (and b!1344158 res!891442) b!1344154))

(assert (= (and b!1344157 condMapEmpty!57598) mapIsEmpty!57598))

(assert (= (and b!1344157 (not condMapEmpty!57598)) mapNonEmpty!57598))

(get-info :version)

(assert (= (and mapNonEmpty!57598 ((_ is ValueCellFull!17732) mapValue!57598)) b!1344160))

(assert (= (and b!1344157 ((_ is ValueCellFull!17732) mapDefault!57598)) b!1344159))

(assert (= start!113434 b!1344157))

(declare-fun b_lambda!24431 () Bool)

(assert (=> (not b_lambda!24431) (not b!1344154)))

(declare-fun t!45756 () Bool)

(declare-fun tb!12267 () Bool)

(assert (=> (and start!113434 (= defaultEntry!1306 defaultEntry!1306) t!45756) tb!12267))

(declare-fun result!25633 () Bool)

(assert (=> tb!12267 (= result!25633 tp_is_empty!37261)))

(assert (=> b!1344154 t!45756))

(declare-fun b_and!50433 () Bool)

(assert (= b_and!50431 (and (=> t!45756 result!25633) b_and!50433)))

(declare-fun m!1232073 () Bool)

(assert (=> b!1344154 m!1232073))

(declare-fun m!1232075 () Bool)

(assert (=> b!1344154 m!1232075))

(declare-fun m!1232077 () Bool)

(assert (=> b!1344154 m!1232077))

(declare-fun m!1232079 () Bool)

(assert (=> b!1344154 m!1232079))

(declare-fun m!1232081 () Bool)

(assert (=> b!1344154 m!1232081))

(declare-fun m!1232083 () Bool)

(assert (=> b!1344154 m!1232083))

(assert (=> b!1344154 m!1232073))

(declare-fun m!1232085 () Bool)

(assert (=> b!1344154 m!1232085))

(declare-fun m!1232087 () Bool)

(assert (=> b!1344154 m!1232087))

(assert (=> b!1344154 m!1232081))

(declare-fun m!1232089 () Bool)

(assert (=> b!1344154 m!1232089))

(declare-fun m!1232091 () Bool)

(assert (=> b!1344154 m!1232091))

(declare-fun m!1232093 () Bool)

(assert (=> b!1344154 m!1232093))

(assert (=> b!1344154 m!1232091))

(declare-fun m!1232095 () Bool)

(assert (=> b!1344154 m!1232095))

(declare-fun m!1232097 () Bool)

(assert (=> b!1344154 m!1232097))

(assert (=> b!1344154 m!1232079))

(declare-fun m!1232099 () Bool)

(assert (=> start!113434 m!1232099))

(declare-fun m!1232101 () Bool)

(assert (=> start!113434 m!1232101))

(declare-fun m!1232103 () Bool)

(assert (=> start!113434 m!1232103))

(declare-fun m!1232105 () Bool)

(assert (=> b!1344161 m!1232105))

(declare-fun m!1232107 () Bool)

(assert (=> b!1344162 m!1232107))

(assert (=> b!1344163 m!1232091))

(assert (=> b!1344163 m!1232091))

(declare-fun m!1232109 () Bool)

(assert (=> b!1344163 m!1232109))

(assert (=> b!1344153 m!1232091))

(declare-fun m!1232111 () Bool)

(assert (=> mapNonEmpty!57598 m!1232111))

(declare-fun m!1232113 () Bool)

(assert (=> b!1344152 m!1232113))

(assert (=> b!1344152 m!1232113))

(declare-fun m!1232115 () Bool)

(assert (=> b!1344152 m!1232115))

(check-sat (not b_next!31261) b_and!50433 tp_is_empty!37261 (not b!1344161) (not b!1344154) (not mapNonEmpty!57598) (not b!1344162) (not b!1344152) (not b!1344163) (not b_lambda!24431) (not start!113434))
(check-sat b_and!50433 (not b_next!31261))
