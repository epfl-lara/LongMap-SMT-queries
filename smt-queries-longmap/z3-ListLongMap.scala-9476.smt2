; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112466 () Bool)

(assert start!112466)

(declare-fun b_free!30861 () Bool)

(declare-fun b_next!30861 () Bool)

(assert (=> start!112466 (= b_free!30861 (not b_next!30861))))

(declare-fun tp!108220 () Bool)

(declare-fun b_and!49723 () Bool)

(assert (=> start!112466 (= tp!108220 b_and!49723)))

(declare-fun mapNonEmpty!56830 () Bool)

(declare-fun mapRes!56830 () Bool)

(declare-fun tp!108219 () Bool)

(declare-fun e!759673 () Bool)

(assert (=> mapNonEmpty!56830 (= mapRes!56830 (and tp!108219 e!759673))))

(declare-datatypes ((V!54131 0))(
  ( (V!54132 (val!18460 Int)) )
))
(declare-datatypes ((ValueCell!17487 0))(
  ( (ValueCellFull!17487 (v!21097 V!54131)) (EmptyCell!17487) )
))
(declare-datatypes ((array!90414 0))(
  ( (array!90415 (arr!43673 (Array (_ BitVec 32) ValueCell!17487)) (size!44223 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90414)

(declare-fun mapKey!56830 () (_ BitVec 32))

(declare-fun mapRest!56830 () (Array (_ BitVec 32) ValueCell!17487))

(declare-fun mapValue!56830 () ValueCell!17487)

(assert (=> mapNonEmpty!56830 (= (arr!43673 _values!1320) (store mapRest!56830 mapKey!56830 mapValue!56830))))

(declare-fun mapIsEmpty!56830 () Bool)

(assert (=> mapIsEmpty!56830 mapRes!56830))

(declare-fun b!1333598 () Bool)

(declare-fun res!885020 () Bool)

(declare-fun e!759672 () Bool)

(assert (=> b!1333598 (=> (not res!885020) (not e!759672))))

(declare-datatypes ((array!90416 0))(
  ( (array!90417 (arr!43674 (Array (_ BitVec 32) (_ BitVec 64))) (size!44224 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90416)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1333598 (= res!885020 (not (= k0!1153 (select (arr!43674 _keys!1590) from!1980))))))

(declare-fun b!1333599 () Bool)

(declare-fun e!759674 () Bool)

(assert (=> b!1333599 (= e!759674 e!759672)))

(declare-fun res!885019 () Bool)

(assert (=> b!1333599 (=> (not res!885019) (not e!759672))))

(declare-datatypes ((tuple2!23796 0))(
  ( (tuple2!23797 (_1!11909 (_ BitVec 64)) (_2!11909 V!54131)) )
))
(declare-datatypes ((List!30940 0))(
  ( (Nil!30937) (Cons!30936 (h!32145 tuple2!23796) (t!45160 List!30940)) )
))
(declare-datatypes ((ListLongMap!21453 0))(
  ( (ListLongMap!21454 (toList!10742 List!30940)) )
))
(declare-fun lt!592165 () ListLongMap!21453)

(declare-fun lt!592164 () V!54131)

(declare-fun contains!8906 (ListLongMap!21453 (_ BitVec 64)) Bool)

(declare-fun +!4714 (ListLongMap!21453 tuple2!23796) ListLongMap!21453)

(assert (=> b!1333599 (= res!885019 (contains!8906 (+!4714 lt!592165 (tuple2!23797 (select (arr!43674 _keys!1590) from!1980) lt!592164)) k0!1153))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54131)

(declare-fun zeroValue!1262 () V!54131)

(declare-fun getCurrentListMapNoExtraKeys!6352 (array!90416 array!90414 (_ BitVec 32) (_ BitVec 32) V!54131 V!54131 (_ BitVec 32) Int) ListLongMap!21453)

(assert (=> b!1333599 (= lt!592165 (getCurrentListMapNoExtraKeys!6352 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22030 (ValueCell!17487 V!54131) V!54131)

(declare-fun dynLambda!3653 (Int (_ BitVec 64)) V!54131)

(assert (=> b!1333599 (= lt!592164 (get!22030 (select (arr!43673 _values!1320) from!1980) (dynLambda!3653 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1333600 () Bool)

(declare-fun res!885013 () Bool)

(assert (=> b!1333600 (=> (not res!885013) (not e!759674))))

(declare-datatypes ((List!30941 0))(
  ( (Nil!30938) (Cons!30937 (h!32146 (_ BitVec 64)) (t!45161 List!30941)) )
))
(declare-fun arrayNoDuplicates!0 (array!90416 (_ BitVec 32) List!30941) Bool)

(assert (=> b!1333600 (= res!885013 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30938))))

(declare-fun b!1333601 () Bool)

(declare-fun e!759676 () Bool)

(declare-fun tp_is_empty!36771 () Bool)

(assert (=> b!1333601 (= e!759676 tp_is_empty!36771)))

(declare-fun b!1333602 () Bool)

(declare-fun res!885018 () Bool)

(assert (=> b!1333602 (=> (not res!885018) (not e!759674))))

(assert (=> b!1333602 (= res!885018 (and (= (size!44223 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44224 _keys!1590) (size!44223 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333603 () Bool)

(declare-fun res!885015 () Bool)

(assert (=> b!1333603 (=> (not res!885015) (not e!759674))))

(declare-fun getCurrentListMap!5722 (array!90416 array!90414 (_ BitVec 32) (_ BitVec 32) V!54131 V!54131 (_ BitVec 32) Int) ListLongMap!21453)

(assert (=> b!1333603 (= res!885015 (contains!8906 (getCurrentListMap!5722 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333604 () Bool)

(declare-fun res!885011 () Bool)

(assert (=> b!1333604 (=> (not res!885011) (not e!759674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90416 (_ BitVec 32)) Bool)

(assert (=> b!1333604 (= res!885011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333605 () Bool)

(declare-fun res!885021 () Bool)

(assert (=> b!1333605 (=> (not res!885021) (not e!759674))))

(assert (=> b!1333605 (= res!885021 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333606 () Bool)

(declare-fun e!759671 () Bool)

(assert (=> b!1333606 (= e!759671 (and e!759676 mapRes!56830))))

(declare-fun condMapEmpty!56830 () Bool)

(declare-fun mapDefault!56830 () ValueCell!17487)

(assert (=> b!1333606 (= condMapEmpty!56830 (= (arr!43673 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17487)) mapDefault!56830)))))

(declare-fun b!1333607 () Bool)

(declare-fun res!885012 () Bool)

(assert (=> b!1333607 (=> (not res!885012) (not e!759674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333607 (= res!885012 (validKeyInArray!0 (select (arr!43674 _keys!1590) from!1980)))))

(declare-fun b!1333608 () Bool)

(declare-fun res!885014 () Bool)

(assert (=> b!1333608 (=> (not res!885014) (not e!759674))))

(assert (=> b!1333608 (= res!885014 (not (= (select (arr!43674 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333609 () Bool)

(assert (=> b!1333609 (= e!759672 (not true))))

(assert (=> b!1333609 (contains!8906 lt!592165 k0!1153)))

(declare-datatypes ((Unit!43871 0))(
  ( (Unit!43872) )
))
(declare-fun lt!592163 () Unit!43871)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!298 ((_ BitVec 64) (_ BitVec 64) V!54131 ListLongMap!21453) Unit!43871)

(assert (=> b!1333609 (= lt!592163 (lemmaInListMapAfterAddingDiffThenInBefore!298 k0!1153 (select (arr!43674 _keys!1590) from!1980) lt!592164 lt!592165))))

(declare-fun b!1333610 () Bool)

(declare-fun res!885016 () Bool)

(assert (=> b!1333610 (=> (not res!885016) (not e!759674))))

(assert (=> b!1333610 (= res!885016 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44224 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333611 () Bool)

(assert (=> b!1333611 (= e!759673 tp_is_empty!36771)))

(declare-fun res!885017 () Bool)

(assert (=> start!112466 (=> (not res!885017) (not e!759674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112466 (= res!885017 (validMask!0 mask!1998))))

(assert (=> start!112466 e!759674))

(declare-fun array_inv!32939 (array!90414) Bool)

(assert (=> start!112466 (and (array_inv!32939 _values!1320) e!759671)))

(assert (=> start!112466 true))

(declare-fun array_inv!32940 (array!90416) Bool)

(assert (=> start!112466 (array_inv!32940 _keys!1590)))

(assert (=> start!112466 tp!108220))

(assert (=> start!112466 tp_is_empty!36771))

(assert (= (and start!112466 res!885017) b!1333602))

(assert (= (and b!1333602 res!885018) b!1333604))

(assert (= (and b!1333604 res!885011) b!1333600))

(assert (= (and b!1333600 res!885013) b!1333610))

(assert (= (and b!1333610 res!885016) b!1333603))

(assert (= (and b!1333603 res!885015) b!1333608))

(assert (= (and b!1333608 res!885014) b!1333607))

(assert (= (and b!1333607 res!885012) b!1333605))

(assert (= (and b!1333605 res!885021) b!1333599))

(assert (= (and b!1333599 res!885019) b!1333598))

(assert (= (and b!1333598 res!885020) b!1333609))

(assert (= (and b!1333606 condMapEmpty!56830) mapIsEmpty!56830))

(assert (= (and b!1333606 (not condMapEmpty!56830)) mapNonEmpty!56830))

(get-info :version)

(assert (= (and mapNonEmpty!56830 ((_ is ValueCellFull!17487) mapValue!56830)) b!1333611))

(assert (= (and b!1333606 ((_ is ValueCellFull!17487) mapDefault!56830)) b!1333601))

(assert (= start!112466 b!1333606))

(declare-fun b_lambda!24067 () Bool)

(assert (=> (not b_lambda!24067) (not b!1333599)))

(declare-fun t!45159 () Bool)

(declare-fun tb!12023 () Bool)

(assert (=> (and start!112466 (= defaultEntry!1323 defaultEntry!1323) t!45159) tb!12023))

(declare-fun result!25117 () Bool)

(assert (=> tb!12023 (= result!25117 tp_is_empty!36771)))

(assert (=> b!1333599 t!45159))

(declare-fun b_and!49725 () Bool)

(assert (= b_and!49723 (and (=> t!45159 result!25117) b_and!49725)))

(declare-fun m!1222119 () Bool)

(assert (=> mapNonEmpty!56830 m!1222119))

(declare-fun m!1222121 () Bool)

(assert (=> b!1333600 m!1222121))

(declare-fun m!1222123 () Bool)

(assert (=> b!1333599 m!1222123))

(declare-fun m!1222125 () Bool)

(assert (=> b!1333599 m!1222125))

(assert (=> b!1333599 m!1222123))

(declare-fun m!1222127 () Bool)

(assert (=> b!1333599 m!1222127))

(declare-fun m!1222129 () Bool)

(assert (=> b!1333599 m!1222129))

(declare-fun m!1222131 () Bool)

(assert (=> b!1333599 m!1222131))

(declare-fun m!1222133 () Bool)

(assert (=> b!1333599 m!1222133))

(declare-fun m!1222135 () Bool)

(assert (=> b!1333599 m!1222135))

(assert (=> b!1333599 m!1222125))

(assert (=> b!1333599 m!1222131))

(declare-fun m!1222137 () Bool)

(assert (=> b!1333604 m!1222137))

(assert (=> b!1333598 m!1222135))

(assert (=> b!1333608 m!1222135))

(declare-fun m!1222139 () Bool)

(assert (=> b!1333609 m!1222139))

(assert (=> b!1333609 m!1222135))

(assert (=> b!1333609 m!1222135))

(declare-fun m!1222141 () Bool)

(assert (=> b!1333609 m!1222141))

(declare-fun m!1222143 () Bool)

(assert (=> start!112466 m!1222143))

(declare-fun m!1222145 () Bool)

(assert (=> start!112466 m!1222145))

(declare-fun m!1222147 () Bool)

(assert (=> start!112466 m!1222147))

(declare-fun m!1222149 () Bool)

(assert (=> b!1333603 m!1222149))

(assert (=> b!1333603 m!1222149))

(declare-fun m!1222151 () Bool)

(assert (=> b!1333603 m!1222151))

(assert (=> b!1333607 m!1222135))

(assert (=> b!1333607 m!1222135))

(declare-fun m!1222153 () Bool)

(assert (=> b!1333607 m!1222153))

(check-sat (not b_lambda!24067) (not start!112466) (not b!1333599) (not b!1333603) tp_is_empty!36771 (not b!1333607) (not mapNonEmpty!56830) (not b!1333600) b_and!49725 (not b_next!30861) (not b!1333604) (not b!1333609))
(check-sat b_and!49725 (not b_next!30861))
