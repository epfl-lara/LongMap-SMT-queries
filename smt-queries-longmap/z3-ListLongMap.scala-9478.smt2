; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112476 () Bool)

(assert start!112476)

(declare-fun b_free!30871 () Bool)

(declare-fun b_next!30871 () Bool)

(assert (=> start!112476 (= b_free!30871 (not b_next!30871))))

(declare-fun tp!108250 () Bool)

(declare-fun b_and!49725 () Bool)

(assert (=> start!112476 (= tp!108250 b_and!49725)))

(declare-fun b!1333748 () Bool)

(declare-fun res!885147 () Bool)

(declare-fun e!759731 () Bool)

(assert (=> b!1333748 (=> (not res!885147) (not e!759731))))

(declare-datatypes ((array!90375 0))(
  ( (array!90376 (arr!43654 (Array (_ BitVec 32) (_ BitVec 64))) (size!44206 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90375)

(declare-datatypes ((List!31006 0))(
  ( (Nil!31003) (Cons!31002 (h!32211 (_ BitVec 64)) (t!45228 List!31006)) )
))
(declare-fun arrayNoDuplicates!0 (array!90375 (_ BitVec 32) List!31006) Bool)

(assert (=> b!1333748 (= res!885147 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31003))))

(declare-fun b!1333749 () Bool)

(declare-fun res!885148 () Bool)

(assert (=> b!1333749 (=> (not res!885148) (not e!759731))))

(declare-datatypes ((V!54145 0))(
  ( (V!54146 (val!18465 Int)) )
))
(declare-datatypes ((ValueCell!17492 0))(
  ( (ValueCellFull!17492 (v!21101 V!54145)) (EmptyCell!17492) )
))
(declare-datatypes ((array!90377 0))(
  ( (array!90378 (arr!43655 (Array (_ BitVec 32) ValueCell!17492)) (size!44207 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90377)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333749 (= res!885148 (and (= (size!44207 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44206 _keys!1590) (size!44207 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333751 () Bool)

(declare-fun e!759729 () Bool)

(assert (=> b!1333751 (= e!759729 (not true))))

(declare-datatypes ((tuple2!23866 0))(
  ( (tuple2!23867 (_1!11944 (_ BitVec 64)) (_2!11944 V!54145)) )
))
(declare-datatypes ((List!31007 0))(
  ( (Nil!31004) (Cons!31003 (h!32212 tuple2!23866) (t!45229 List!31007)) )
))
(declare-datatypes ((ListLongMap!21523 0))(
  ( (ListLongMap!21524 (toList!10777 List!31007)) )
))
(declare-fun lt!592022 () ListLongMap!21523)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8869 (ListLongMap!21523 (_ BitVec 64)) Bool)

(assert (=> b!1333751 (contains!8869 lt!592022 k0!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!592023 () V!54145)

(declare-datatypes ((Unit!43680 0))(
  ( (Unit!43681) )
))
(declare-fun lt!592024 () Unit!43680)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!290 ((_ BitVec 64) (_ BitVec 64) V!54145 ListLongMap!21523) Unit!43680)

(assert (=> b!1333751 (= lt!592024 (lemmaInListMapAfterAddingDiffThenInBefore!290 k0!1153 (select (arr!43654 _keys!1590) from!1980) lt!592023 lt!592022))))

(declare-fun b!1333752 () Bool)

(declare-fun res!885157 () Bool)

(assert (=> b!1333752 (=> (not res!885157) (not e!759731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333752 (= res!885157 (validKeyInArray!0 (select (arr!43654 _keys!1590) from!1980)))))

(declare-fun b!1333753 () Bool)

(declare-fun res!885152 () Bool)

(assert (=> b!1333753 (=> (not res!885152) (not e!759731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90375 (_ BitVec 32)) Bool)

(assert (=> b!1333753 (= res!885152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56845 () Bool)

(declare-fun mapRes!56845 () Bool)

(declare-fun tp!108251 () Bool)

(declare-fun e!759733 () Bool)

(assert (=> mapNonEmpty!56845 (= mapRes!56845 (and tp!108251 e!759733))))

(declare-fun mapRest!56845 () (Array (_ BitVec 32) ValueCell!17492))

(declare-fun mapKey!56845 () (_ BitVec 32))

(declare-fun mapValue!56845 () ValueCell!17492)

(assert (=> mapNonEmpty!56845 (= (arr!43655 _values!1320) (store mapRest!56845 mapKey!56845 mapValue!56845))))

(declare-fun b!1333754 () Bool)

(declare-fun res!885156 () Bool)

(assert (=> b!1333754 (=> (not res!885156) (not e!759731))))

(assert (=> b!1333754 (= res!885156 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44206 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333755 () Bool)

(declare-fun res!885150 () Bool)

(assert (=> b!1333755 (=> (not res!885150) (not e!759731))))

(assert (=> b!1333755 (= res!885150 (not (= (select (arr!43654 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333756 () Bool)

(declare-fun res!885149 () Bool)

(assert (=> b!1333756 (=> (not res!885149) (not e!759729))))

(assert (=> b!1333756 (= res!885149 (not (= k0!1153 (select (arr!43654 _keys!1590) from!1980))))))

(declare-fun mapIsEmpty!56845 () Bool)

(assert (=> mapIsEmpty!56845 mapRes!56845))

(declare-fun b!1333757 () Bool)

(declare-fun tp_is_empty!36781 () Bool)

(assert (=> b!1333757 (= e!759733 tp_is_empty!36781)))

(declare-fun res!885153 () Bool)

(assert (=> start!112476 (=> (not res!885153) (not e!759731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112476 (= res!885153 (validMask!0 mask!1998))))

(assert (=> start!112476 e!759731))

(declare-fun e!759730 () Bool)

(declare-fun array_inv!33121 (array!90377) Bool)

(assert (=> start!112476 (and (array_inv!33121 _values!1320) e!759730)))

(assert (=> start!112476 true))

(declare-fun array_inv!33122 (array!90375) Bool)

(assert (=> start!112476 (array_inv!33122 _keys!1590)))

(assert (=> start!112476 tp!108250))

(assert (=> start!112476 tp_is_empty!36781))

(declare-fun b!1333750 () Bool)

(declare-fun e!759732 () Bool)

(assert (=> b!1333750 (= e!759732 tp_is_empty!36781)))

(declare-fun b!1333758 () Bool)

(declare-fun res!885154 () Bool)

(assert (=> b!1333758 (=> (not res!885154) (not e!759731))))

(assert (=> b!1333758 (= res!885154 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333759 () Bool)

(assert (=> b!1333759 (= e!759731 e!759729)))

(declare-fun res!885155 () Bool)

(assert (=> b!1333759 (=> (not res!885155) (not e!759729))))

(declare-fun +!4740 (ListLongMap!21523 tuple2!23866) ListLongMap!21523)

(assert (=> b!1333759 (= res!885155 (contains!8869 (+!4740 lt!592022 (tuple2!23867 (select (arr!43654 _keys!1590) from!1980) lt!592023)) k0!1153))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54145)

(declare-fun zeroValue!1262 () V!54145)

(declare-fun getCurrentListMapNoExtraKeys!6378 (array!90375 array!90377 (_ BitVec 32) (_ BitVec 32) V!54145 V!54145 (_ BitVec 32) Int) ListLongMap!21523)

(assert (=> b!1333759 (= lt!592022 (getCurrentListMapNoExtraKeys!6378 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22027 (ValueCell!17492 V!54145) V!54145)

(declare-fun dynLambda!3670 (Int (_ BitVec 64)) V!54145)

(assert (=> b!1333759 (= lt!592023 (get!22027 (select (arr!43655 _values!1320) from!1980) (dynLambda!3670 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1333760 () Bool)

(declare-fun res!885151 () Bool)

(assert (=> b!1333760 (=> (not res!885151) (not e!759731))))

(declare-fun getCurrentListMap!5632 (array!90375 array!90377 (_ BitVec 32) (_ BitVec 32) V!54145 V!54145 (_ BitVec 32) Int) ListLongMap!21523)

(assert (=> b!1333760 (= res!885151 (contains!8869 (getCurrentListMap!5632 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333761 () Bool)

(assert (=> b!1333761 (= e!759730 (and e!759732 mapRes!56845))))

(declare-fun condMapEmpty!56845 () Bool)

(declare-fun mapDefault!56845 () ValueCell!17492)

(assert (=> b!1333761 (= condMapEmpty!56845 (= (arr!43655 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17492)) mapDefault!56845)))))

(assert (= (and start!112476 res!885153) b!1333749))

(assert (= (and b!1333749 res!885148) b!1333753))

(assert (= (and b!1333753 res!885152) b!1333748))

(assert (= (and b!1333748 res!885147) b!1333754))

(assert (= (and b!1333754 res!885156) b!1333760))

(assert (= (and b!1333760 res!885151) b!1333755))

(assert (= (and b!1333755 res!885150) b!1333752))

(assert (= (and b!1333752 res!885157) b!1333758))

(assert (= (and b!1333758 res!885154) b!1333759))

(assert (= (and b!1333759 res!885155) b!1333756))

(assert (= (and b!1333756 res!885149) b!1333751))

(assert (= (and b!1333761 condMapEmpty!56845) mapIsEmpty!56845))

(assert (= (and b!1333761 (not condMapEmpty!56845)) mapNonEmpty!56845))

(get-info :version)

(assert (= (and mapNonEmpty!56845 ((_ is ValueCellFull!17492) mapValue!56845)) b!1333757))

(assert (= (and b!1333761 ((_ is ValueCellFull!17492) mapDefault!56845)) b!1333750))

(assert (= start!112476 b!1333761))

(declare-fun b_lambda!24067 () Bool)

(assert (=> (not b_lambda!24067) (not b!1333759)))

(declare-fun t!45227 () Bool)

(declare-fun tb!12025 () Bool)

(assert (=> (and start!112476 (= defaultEntry!1323 defaultEntry!1323) t!45227) tb!12025))

(declare-fun result!25129 () Bool)

(assert (=> tb!12025 (= result!25129 tp_is_empty!36781)))

(assert (=> b!1333759 t!45227))

(declare-fun b_and!49727 () Bool)

(assert (= b_and!49725 (and (=> t!45227 result!25129) b_and!49727)))

(declare-fun m!1221783 () Bool)

(assert (=> b!1333755 m!1221783))

(declare-fun m!1221785 () Bool)

(assert (=> b!1333753 m!1221785))

(declare-fun m!1221787 () Bool)

(assert (=> b!1333760 m!1221787))

(assert (=> b!1333760 m!1221787))

(declare-fun m!1221789 () Bool)

(assert (=> b!1333760 m!1221789))

(declare-fun m!1221791 () Bool)

(assert (=> start!112476 m!1221791))

(declare-fun m!1221793 () Bool)

(assert (=> start!112476 m!1221793))

(declare-fun m!1221795 () Bool)

(assert (=> start!112476 m!1221795))

(declare-fun m!1221797 () Bool)

(assert (=> b!1333759 m!1221797))

(declare-fun m!1221799 () Bool)

(assert (=> b!1333759 m!1221799))

(assert (=> b!1333759 m!1221797))

(declare-fun m!1221801 () Bool)

(assert (=> b!1333759 m!1221801))

(declare-fun m!1221803 () Bool)

(assert (=> b!1333759 m!1221803))

(declare-fun m!1221805 () Bool)

(assert (=> b!1333759 m!1221805))

(declare-fun m!1221807 () Bool)

(assert (=> b!1333759 m!1221807))

(assert (=> b!1333759 m!1221803))

(assert (=> b!1333759 m!1221799))

(assert (=> b!1333759 m!1221783))

(declare-fun m!1221809 () Bool)

(assert (=> b!1333748 m!1221809))

(declare-fun m!1221811 () Bool)

(assert (=> b!1333751 m!1221811))

(assert (=> b!1333751 m!1221783))

(assert (=> b!1333751 m!1221783))

(declare-fun m!1221813 () Bool)

(assert (=> b!1333751 m!1221813))

(assert (=> b!1333756 m!1221783))

(declare-fun m!1221815 () Bool)

(assert (=> mapNonEmpty!56845 m!1221815))

(assert (=> b!1333752 m!1221783))

(assert (=> b!1333752 m!1221783))

(declare-fun m!1221817 () Bool)

(assert (=> b!1333752 m!1221817))

(check-sat b_and!49727 (not b_lambda!24067) (not b!1333760) (not b!1333748) (not b!1333753) (not mapNonEmpty!56845) (not b_next!30871) (not start!112476) (not b!1333751) (not b!1333752) (not b!1333759) tp_is_empty!36781)
(check-sat b_and!49727 (not b_next!30871))
