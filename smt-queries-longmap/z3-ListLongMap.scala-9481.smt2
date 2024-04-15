; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112494 () Bool)

(assert start!112494)

(declare-fun b_free!30889 () Bool)

(declare-fun b_next!30889 () Bool)

(assert (=> start!112494 (= b_free!30889 (not b_next!30889))))

(declare-fun tp!108305 () Bool)

(declare-fun b_and!49761 () Bool)

(assert (=> start!112494 (= tp!108305 b_and!49761)))

(declare-fun b!1334144 () Bool)

(declare-fun res!885454 () Bool)

(declare-fun e!759891 () Bool)

(assert (=> b!1334144 (=> (not res!885454) (not e!759891))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90411 0))(
  ( (array!90412 (arr!43672 (Array (_ BitVec 32) (_ BitVec 64))) (size!44224 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90411)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334144 (= res!885454 (not (= k0!1153 (select (arr!43672 _keys!1590) from!1980))))))

(declare-fun res!885447 () Bool)

(declare-fun e!759894 () Bool)

(assert (=> start!112494 (=> (not res!885447) (not e!759894))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112494 (= res!885447 (validMask!0 mask!1998))))

(assert (=> start!112494 e!759894))

(declare-datatypes ((V!54169 0))(
  ( (V!54170 (val!18474 Int)) )
))
(declare-datatypes ((ValueCell!17501 0))(
  ( (ValueCellFull!17501 (v!21110 V!54169)) (EmptyCell!17501) )
))
(declare-datatypes ((array!90413 0))(
  ( (array!90414 (arr!43673 (Array (_ BitVec 32) ValueCell!17501)) (size!44225 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90413)

(declare-fun e!759892 () Bool)

(declare-fun array_inv!33133 (array!90413) Bool)

(assert (=> start!112494 (and (array_inv!33133 _values!1320) e!759892)))

(assert (=> start!112494 true))

(declare-fun array_inv!33134 (array!90411) Bool)

(assert (=> start!112494 (array_inv!33134 _keys!1590)))

(assert (=> start!112494 tp!108305))

(declare-fun tp_is_empty!36799 () Bool)

(assert (=> start!112494 tp_is_empty!36799))

(declare-fun b!1334145 () Bool)

(assert (=> b!1334145 (= e!759894 e!759891)))

(declare-fun res!885450 () Bool)

(assert (=> b!1334145 (=> (not res!885450) (not e!759891))))

(declare-datatypes ((tuple2!23882 0))(
  ( (tuple2!23883 (_1!11952 (_ BitVec 64)) (_2!11952 V!54169)) )
))
(declare-datatypes ((List!31020 0))(
  ( (Nil!31017) (Cons!31016 (h!32225 tuple2!23882) (t!45260 List!31020)) )
))
(declare-datatypes ((ListLongMap!21539 0))(
  ( (ListLongMap!21540 (toList!10785 List!31020)) )
))
(declare-fun lt!592105 () ListLongMap!21539)

(declare-fun lt!592104 () V!54169)

(declare-fun contains!8877 (ListLongMap!21539 (_ BitVec 64)) Bool)

(declare-fun +!4746 (ListLongMap!21539 tuple2!23882) ListLongMap!21539)

(assert (=> b!1334145 (= res!885450 (contains!8877 (+!4746 lt!592105 (tuple2!23883 (select (arr!43672 _keys!1590) from!1980) lt!592104)) k0!1153))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54169)

(declare-fun zeroValue!1262 () V!54169)

(declare-fun getCurrentListMapNoExtraKeys!6384 (array!90411 array!90413 (_ BitVec 32) (_ BitVec 32) V!54169 V!54169 (_ BitVec 32) Int) ListLongMap!21539)

(assert (=> b!1334145 (= lt!592105 (getCurrentListMapNoExtraKeys!6384 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22039 (ValueCell!17501 V!54169) V!54169)

(declare-fun dynLambda!3676 (Int (_ BitVec 64)) V!54169)

(assert (=> b!1334145 (= lt!592104 (get!22039 (select (arr!43673 _values!1320) from!1980) (dynLambda!3676 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334146 () Bool)

(declare-fun res!885445 () Bool)

(assert (=> b!1334146 (=> (not res!885445) (not e!759894))))

(assert (=> b!1334146 (= res!885445 (and (= (size!44225 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44224 _keys!1590) (size!44225 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334147 () Bool)

(declare-fun res!885453 () Bool)

(assert (=> b!1334147 (=> (not res!885453) (not e!759894))))

(assert (=> b!1334147 (= res!885453 (not (= (select (arr!43672 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1334148 () Bool)

(declare-fun e!759895 () Bool)

(assert (=> b!1334148 (= e!759895 tp_is_empty!36799)))

(declare-fun b!1334149 () Bool)

(declare-fun res!885444 () Bool)

(assert (=> b!1334149 (=> (not res!885444) (not e!759894))))

(declare-datatypes ((List!31021 0))(
  ( (Nil!31018) (Cons!31017 (h!32226 (_ BitVec 64)) (t!45261 List!31021)) )
))
(declare-fun arrayNoDuplicates!0 (array!90411 (_ BitVec 32) List!31021) Bool)

(assert (=> b!1334149 (= res!885444 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31018))))

(declare-fun b!1334150 () Bool)

(declare-fun res!885452 () Bool)

(assert (=> b!1334150 (=> (not res!885452) (not e!759894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334150 (= res!885452 (validKeyInArray!0 (select (arr!43672 _keys!1590) from!1980)))))

(declare-fun b!1334151 () Bool)

(declare-fun res!885448 () Bool)

(assert (=> b!1334151 (=> (not res!885448) (not e!759894))))

(assert (=> b!1334151 (= res!885448 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!56872 () Bool)

(declare-fun mapRes!56872 () Bool)

(declare-fun tp!108304 () Bool)

(assert (=> mapNonEmpty!56872 (= mapRes!56872 (and tp!108304 e!759895))))

(declare-fun mapRest!56872 () (Array (_ BitVec 32) ValueCell!17501))

(declare-fun mapKey!56872 () (_ BitVec 32))

(declare-fun mapValue!56872 () ValueCell!17501)

(assert (=> mapNonEmpty!56872 (= (arr!43673 _values!1320) (store mapRest!56872 mapKey!56872 mapValue!56872))))

(declare-fun b!1334152 () Bool)

(declare-fun res!885451 () Bool)

(assert (=> b!1334152 (=> (not res!885451) (not e!759894))))

(assert (=> b!1334152 (= res!885451 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44224 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334153 () Bool)

(declare-fun res!885449 () Bool)

(assert (=> b!1334153 (=> (not res!885449) (not e!759894))))

(declare-fun getCurrentListMap!5639 (array!90411 array!90413 (_ BitVec 32) (_ BitVec 32) V!54169 V!54169 (_ BitVec 32) Int) ListLongMap!21539)

(assert (=> b!1334153 (= res!885449 (contains!8877 (getCurrentListMap!5639 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1334154 () Bool)

(declare-fun e!759890 () Bool)

(assert (=> b!1334154 (= e!759892 (and e!759890 mapRes!56872))))

(declare-fun condMapEmpty!56872 () Bool)

(declare-fun mapDefault!56872 () ValueCell!17501)

(assert (=> b!1334154 (= condMapEmpty!56872 (= (arr!43673 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17501)) mapDefault!56872)))))

(declare-fun b!1334155 () Bool)

(declare-fun res!885446 () Bool)

(assert (=> b!1334155 (=> (not res!885446) (not e!759894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90411 (_ BitVec 32)) Bool)

(assert (=> b!1334155 (= res!885446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334156 () Bool)

(assert (=> b!1334156 (= e!759891 (not true))))

(assert (=> b!1334156 (contains!8877 lt!592105 k0!1153)))

(declare-datatypes ((Unit!43690 0))(
  ( (Unit!43691) )
))
(declare-fun lt!592103 () Unit!43690)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!295 ((_ BitVec 64) (_ BitVec 64) V!54169 ListLongMap!21539) Unit!43690)

(assert (=> b!1334156 (= lt!592103 (lemmaInListMapAfterAddingDiffThenInBefore!295 k0!1153 (select (arr!43672 _keys!1590) from!1980) lt!592104 lt!592105))))

(declare-fun mapIsEmpty!56872 () Bool)

(assert (=> mapIsEmpty!56872 mapRes!56872))

(declare-fun b!1334157 () Bool)

(assert (=> b!1334157 (= e!759890 tp_is_empty!36799)))

(assert (= (and start!112494 res!885447) b!1334146))

(assert (= (and b!1334146 res!885445) b!1334155))

(assert (= (and b!1334155 res!885446) b!1334149))

(assert (= (and b!1334149 res!885444) b!1334152))

(assert (= (and b!1334152 res!885451) b!1334153))

(assert (= (and b!1334153 res!885449) b!1334147))

(assert (= (and b!1334147 res!885453) b!1334150))

(assert (= (and b!1334150 res!885452) b!1334151))

(assert (= (and b!1334151 res!885448) b!1334145))

(assert (= (and b!1334145 res!885450) b!1334144))

(assert (= (and b!1334144 res!885454) b!1334156))

(assert (= (and b!1334154 condMapEmpty!56872) mapIsEmpty!56872))

(assert (= (and b!1334154 (not condMapEmpty!56872)) mapNonEmpty!56872))

(get-info :version)

(assert (= (and mapNonEmpty!56872 ((_ is ValueCellFull!17501) mapValue!56872)) b!1334148))

(assert (= (and b!1334154 ((_ is ValueCellFull!17501) mapDefault!56872)) b!1334157))

(assert (= start!112494 b!1334154))

(declare-fun b_lambda!24085 () Bool)

(assert (=> (not b_lambda!24085) (not b!1334145)))

(declare-fun t!45259 () Bool)

(declare-fun tb!12043 () Bool)

(assert (=> (and start!112494 (= defaultEntry!1323 defaultEntry!1323) t!45259) tb!12043))

(declare-fun result!25165 () Bool)

(assert (=> tb!12043 (= result!25165 tp_is_empty!36799)))

(assert (=> b!1334145 t!45259))

(declare-fun b_and!49763 () Bool)

(assert (= b_and!49761 (and (=> t!45259 result!25165) b_and!49763)))

(declare-fun m!1222107 () Bool)

(assert (=> b!1334153 m!1222107))

(assert (=> b!1334153 m!1222107))

(declare-fun m!1222109 () Bool)

(assert (=> b!1334153 m!1222109))

(declare-fun m!1222111 () Bool)

(assert (=> b!1334145 m!1222111))

(declare-fun m!1222113 () Bool)

(assert (=> b!1334145 m!1222113))

(assert (=> b!1334145 m!1222111))

(declare-fun m!1222115 () Bool)

(assert (=> b!1334145 m!1222115))

(declare-fun m!1222117 () Bool)

(assert (=> b!1334145 m!1222117))

(assert (=> b!1334145 m!1222117))

(declare-fun m!1222119 () Bool)

(assert (=> b!1334145 m!1222119))

(declare-fun m!1222121 () Bool)

(assert (=> b!1334145 m!1222121))

(assert (=> b!1334145 m!1222113))

(declare-fun m!1222123 () Bool)

(assert (=> b!1334145 m!1222123))

(assert (=> b!1334144 m!1222123))

(declare-fun m!1222125 () Bool)

(assert (=> start!112494 m!1222125))

(declare-fun m!1222127 () Bool)

(assert (=> start!112494 m!1222127))

(declare-fun m!1222129 () Bool)

(assert (=> start!112494 m!1222129))

(declare-fun m!1222131 () Bool)

(assert (=> mapNonEmpty!56872 m!1222131))

(declare-fun m!1222133 () Bool)

(assert (=> b!1334156 m!1222133))

(assert (=> b!1334156 m!1222123))

(assert (=> b!1334156 m!1222123))

(declare-fun m!1222135 () Bool)

(assert (=> b!1334156 m!1222135))

(declare-fun m!1222137 () Bool)

(assert (=> b!1334149 m!1222137))

(declare-fun m!1222139 () Bool)

(assert (=> b!1334155 m!1222139))

(assert (=> b!1334150 m!1222123))

(assert (=> b!1334150 m!1222123))

(declare-fun m!1222141 () Bool)

(assert (=> b!1334150 m!1222141))

(assert (=> b!1334147 m!1222123))

(check-sat (not b!1334155) (not b!1334156) tp_is_empty!36799 (not mapNonEmpty!56872) (not start!112494) b_and!49763 (not b!1334150) (not b!1334149) (not b!1334145) (not b!1334153) (not b_lambda!24085) (not b_next!30889))
(check-sat b_and!49763 (not b_next!30889))
