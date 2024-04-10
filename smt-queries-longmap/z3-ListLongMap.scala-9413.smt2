; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112076 () Bool)

(assert start!112076)

(declare-fun res!880945 () Bool)

(declare-fun e!756792 () Bool)

(assert (=> start!112076 (=> (not res!880945) (not e!756792))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112076 (= res!880945 (validMask!0 mask!1998))))

(assert (=> start!112076 e!756792))

(assert (=> start!112076 true))

(declare-datatypes ((V!53627 0))(
  ( (V!53628 (val!18271 Int)) )
))
(declare-datatypes ((ValueCell!17298 0))(
  ( (ValueCellFull!17298 (v!20907 V!53627)) (EmptyCell!17298) )
))
(declare-datatypes ((array!89692 0))(
  ( (array!89693 (arr!43313 (Array (_ BitVec 32) ValueCell!17298)) (size!43863 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89692)

(declare-fun e!756790 () Bool)

(declare-fun array_inv!32691 (array!89692) Bool)

(assert (=> start!112076 (and (array_inv!32691 _values!1320) e!756790)))

(declare-datatypes ((array!89694 0))(
  ( (array!89695 (arr!43314 (Array (_ BitVec 32) (_ BitVec 64))) (size!43864 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89694)

(declare-fun array_inv!32692 (array!89694) Bool)

(assert (=> start!112076 (array_inv!32692 _keys!1590)))

(declare-fun b!1327603 () Bool)

(declare-fun e!756789 () Bool)

(declare-fun mapRes!56260 () Bool)

(assert (=> b!1327603 (= e!756790 (and e!756789 mapRes!56260))))

(declare-fun condMapEmpty!56260 () Bool)

(declare-fun mapDefault!56260 () ValueCell!17298)

(assert (=> b!1327603 (= condMapEmpty!56260 (= (arr!43313 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17298)) mapDefault!56260)))))

(declare-fun mapIsEmpty!56260 () Bool)

(assert (=> mapIsEmpty!56260 mapRes!56260))

(declare-fun b!1327604 () Bool)

(declare-fun res!880947 () Bool)

(assert (=> b!1327604 (=> (not res!880947) (not e!756792))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327604 (= res!880947 (and (= (size!43863 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43864 _keys!1590) (size!43863 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327605 () Bool)

(declare-fun res!880944 () Bool)

(assert (=> b!1327605 (=> (not res!880944) (not e!756792))))

(declare-datatypes ((List!30694 0))(
  ( (Nil!30691) (Cons!30690 (h!31899 (_ BitVec 64)) (t!44700 List!30694)) )
))
(declare-fun noDuplicate!2066 (List!30694) Bool)

(assert (=> b!1327605 (= res!880944 (noDuplicate!2066 Nil!30691))))

(declare-fun mapNonEmpty!56260 () Bool)

(declare-fun tp!107167 () Bool)

(declare-fun e!756793 () Bool)

(assert (=> mapNonEmpty!56260 (= mapRes!56260 (and tp!107167 e!756793))))

(declare-fun mapValue!56260 () ValueCell!17298)

(declare-fun mapKey!56260 () (_ BitVec 32))

(declare-fun mapRest!56260 () (Array (_ BitVec 32) ValueCell!17298))

(assert (=> mapNonEmpty!56260 (= (arr!43313 _values!1320) (store mapRest!56260 mapKey!56260 mapValue!56260))))

(declare-fun b!1327606 () Bool)

(declare-fun res!880946 () Bool)

(assert (=> b!1327606 (=> (not res!880946) (not e!756792))))

(assert (=> b!1327606 (= res!880946 (and (bvsle #b00000000000000000000000000000000 (size!43864 _keys!1590)) (bvslt (size!43864 _keys!1590) #b01111111111111111111111111111111)))))

(declare-fun b!1327607 () Bool)

(declare-fun e!756791 () Bool)

(declare-fun contains!8785 (List!30694 (_ BitVec 64)) Bool)

(assert (=> b!1327607 (= e!756791 (contains!8785 Nil!30691 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327608 () Bool)

(assert (=> b!1327608 (= e!756792 e!756791)))

(declare-fun res!880943 () Bool)

(assert (=> b!1327608 (=> res!880943 e!756791)))

(assert (=> b!1327608 (= res!880943 (contains!8785 Nil!30691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327609 () Bool)

(declare-fun tp_is_empty!36393 () Bool)

(assert (=> b!1327609 (= e!756789 tp_is_empty!36393)))

(declare-fun b!1327610 () Bool)

(assert (=> b!1327610 (= e!756793 tp_is_empty!36393)))

(declare-fun b!1327611 () Bool)

(declare-fun res!880948 () Bool)

(assert (=> b!1327611 (=> (not res!880948) (not e!756792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89694 (_ BitVec 32)) Bool)

(assert (=> b!1327611 (= res!880948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112076 res!880945) b!1327604))

(assert (= (and b!1327604 res!880947) b!1327611))

(assert (= (and b!1327611 res!880948) b!1327606))

(assert (= (and b!1327606 res!880946) b!1327605))

(assert (= (and b!1327605 res!880944) b!1327608))

(assert (= (and b!1327608 (not res!880943)) b!1327607))

(assert (= (and b!1327603 condMapEmpty!56260) mapIsEmpty!56260))

(assert (= (and b!1327603 (not condMapEmpty!56260)) mapNonEmpty!56260))

(get-info :version)

(assert (= (and mapNonEmpty!56260 ((_ is ValueCellFull!17298) mapValue!56260)) b!1327610))

(assert (= (and b!1327603 ((_ is ValueCellFull!17298) mapDefault!56260)) b!1327609))

(assert (= start!112076 b!1327603))

(declare-fun m!1216857 () Bool)

(assert (=> b!1327607 m!1216857))

(declare-fun m!1216859 () Bool)

(assert (=> b!1327605 m!1216859))

(declare-fun m!1216861 () Bool)

(assert (=> mapNonEmpty!56260 m!1216861))

(declare-fun m!1216863 () Bool)

(assert (=> b!1327608 m!1216863))

(declare-fun m!1216865 () Bool)

(assert (=> b!1327611 m!1216865))

(declare-fun m!1216867 () Bool)

(assert (=> start!112076 m!1216867))

(declare-fun m!1216869 () Bool)

(assert (=> start!112076 m!1216869))

(declare-fun m!1216871 () Bool)

(assert (=> start!112076 m!1216871))

(check-sat (not start!112076) (not mapNonEmpty!56260) tp_is_empty!36393 (not b!1327605) (not b!1327608) (not b!1327611) (not b!1327607))
(check-sat)
(get-model)

(declare-fun d!143339 () Bool)

(assert (=> d!143339 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112076 d!143339))

(declare-fun d!143341 () Bool)

(assert (=> d!143341 (= (array_inv!32691 _values!1320) (bvsge (size!43863 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112076 d!143341))

(declare-fun d!143343 () Bool)

(assert (=> d!143343 (= (array_inv!32692 _keys!1590) (bvsge (size!43864 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112076 d!143343))

(declare-fun b!1327647 () Bool)

(declare-fun e!756820 () Bool)

(declare-fun call!64822 () Bool)

(assert (=> b!1327647 (= e!756820 call!64822)))

(declare-fun b!1327648 () Bool)

(declare-fun e!756819 () Bool)

(declare-fun e!756821 () Bool)

(assert (=> b!1327648 (= e!756819 e!756821)))

(declare-fun c!125901 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327648 (= c!125901 (validKeyInArray!0 (select (arr!43314 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64819 () Bool)

(assert (=> bm!64819 (= call!64822 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun d!143345 () Bool)

(declare-fun res!880971 () Bool)

(assert (=> d!143345 (=> res!880971 e!756819)))

(assert (=> d!143345 (= res!880971 (bvsge #b00000000000000000000000000000000 (size!43864 _keys!1590)))))

(assert (=> d!143345 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!756819)))

(declare-fun b!1327649 () Bool)

(assert (=> b!1327649 (= e!756821 e!756820)))

(declare-fun lt!590730 () (_ BitVec 64))

(assert (=> b!1327649 (= lt!590730 (select (arr!43314 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43737 0))(
  ( (Unit!43738) )
))
(declare-fun lt!590729 () Unit!43737)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89694 (_ BitVec 64) (_ BitVec 32)) Unit!43737)

(assert (=> b!1327649 (= lt!590729 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!590730 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1327649 (arrayContainsKey!0 _keys!1590 lt!590730 #b00000000000000000000000000000000)))

(declare-fun lt!590728 () Unit!43737)

(assert (=> b!1327649 (= lt!590728 lt!590729)))

(declare-fun res!880972 () Bool)

(declare-datatypes ((SeekEntryResult!10046 0))(
  ( (MissingZero!10046 (index!42555 (_ BitVec 32))) (Found!10046 (index!42556 (_ BitVec 32))) (Intermediate!10046 (undefined!10858 Bool) (index!42557 (_ BitVec 32)) (x!118378 (_ BitVec 32))) (Undefined!10046) (MissingVacant!10046 (index!42558 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89694 (_ BitVec 32)) SeekEntryResult!10046)

(assert (=> b!1327649 (= res!880972 (= (seekEntryOrOpen!0 (select (arr!43314 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10046 #b00000000000000000000000000000000)))))

(assert (=> b!1327649 (=> (not res!880972) (not e!756820))))

(declare-fun b!1327650 () Bool)

(assert (=> b!1327650 (= e!756821 call!64822)))

(assert (= (and d!143345 (not res!880971)) b!1327648))

(assert (= (and b!1327648 c!125901) b!1327649))

(assert (= (and b!1327648 (not c!125901)) b!1327650))

(assert (= (and b!1327649 res!880972) b!1327647))

(assert (= (or b!1327647 b!1327650) bm!64819))

(declare-fun m!1216889 () Bool)

(assert (=> b!1327648 m!1216889))

(assert (=> b!1327648 m!1216889))

(declare-fun m!1216891 () Bool)

(assert (=> b!1327648 m!1216891))

(declare-fun m!1216893 () Bool)

(assert (=> bm!64819 m!1216893))

(assert (=> b!1327649 m!1216889))

(declare-fun m!1216895 () Bool)

(assert (=> b!1327649 m!1216895))

(declare-fun m!1216897 () Bool)

(assert (=> b!1327649 m!1216897))

(assert (=> b!1327649 m!1216889))

(declare-fun m!1216899 () Bool)

(assert (=> b!1327649 m!1216899))

(assert (=> b!1327611 d!143345))

(declare-fun d!143347 () Bool)

(declare-fun lt!590733 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!656 (List!30694) (InoxSet (_ BitVec 64)))

(assert (=> d!143347 (= lt!590733 (select (content!656 Nil!30691) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!756826 () Bool)

(assert (=> d!143347 (= lt!590733 e!756826)))

(declare-fun res!880978 () Bool)

(assert (=> d!143347 (=> (not res!880978) (not e!756826))))

(assert (=> d!143347 (= res!880978 ((_ is Cons!30690) Nil!30691))))

(assert (=> d!143347 (= (contains!8785 Nil!30691 #b0000000000000000000000000000000000000000000000000000000000000000) lt!590733)))

(declare-fun b!1327655 () Bool)

(declare-fun e!756827 () Bool)

(assert (=> b!1327655 (= e!756826 e!756827)))

(declare-fun res!880977 () Bool)

(assert (=> b!1327655 (=> res!880977 e!756827)))

(assert (=> b!1327655 (= res!880977 (= (h!31899 Nil!30691) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327656 () Bool)

(assert (=> b!1327656 (= e!756827 (contains!8785 (t!44700 Nil!30691) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!143347 res!880978) b!1327655))

(assert (= (and b!1327655 (not res!880977)) b!1327656))

(declare-fun m!1216901 () Bool)

(assert (=> d!143347 m!1216901))

(declare-fun m!1216903 () Bool)

(assert (=> d!143347 m!1216903))

(declare-fun m!1216905 () Bool)

(assert (=> b!1327656 m!1216905))

(assert (=> b!1327608 d!143347))

(declare-fun d!143349 () Bool)

(declare-fun lt!590734 () Bool)

(assert (=> d!143349 (= lt!590734 (select (content!656 Nil!30691) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!756828 () Bool)

(assert (=> d!143349 (= lt!590734 e!756828)))

(declare-fun res!880980 () Bool)

(assert (=> d!143349 (=> (not res!880980) (not e!756828))))

(assert (=> d!143349 (= res!880980 ((_ is Cons!30690) Nil!30691))))

(assert (=> d!143349 (= (contains!8785 Nil!30691 #b1000000000000000000000000000000000000000000000000000000000000000) lt!590734)))

(declare-fun b!1327657 () Bool)

(declare-fun e!756829 () Bool)

(assert (=> b!1327657 (= e!756828 e!756829)))

(declare-fun res!880979 () Bool)

(assert (=> b!1327657 (=> res!880979 e!756829)))

(assert (=> b!1327657 (= res!880979 (= (h!31899 Nil!30691) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327658 () Bool)

(assert (=> b!1327658 (= e!756829 (contains!8785 (t!44700 Nil!30691) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!143349 res!880980) b!1327657))

(assert (= (and b!1327657 (not res!880979)) b!1327658))

(assert (=> d!143349 m!1216901))

(declare-fun m!1216907 () Bool)

(assert (=> d!143349 m!1216907))

(declare-fun m!1216909 () Bool)

(assert (=> b!1327658 m!1216909))

(assert (=> b!1327607 d!143349))

(declare-fun d!143351 () Bool)

(declare-fun res!880985 () Bool)

(declare-fun e!756834 () Bool)

(assert (=> d!143351 (=> res!880985 e!756834)))

(assert (=> d!143351 (= res!880985 ((_ is Nil!30691) Nil!30691))))

(assert (=> d!143351 (= (noDuplicate!2066 Nil!30691) e!756834)))

(declare-fun b!1327663 () Bool)

(declare-fun e!756835 () Bool)

(assert (=> b!1327663 (= e!756834 e!756835)))

(declare-fun res!880986 () Bool)

(assert (=> b!1327663 (=> (not res!880986) (not e!756835))))

(assert (=> b!1327663 (= res!880986 (not (contains!8785 (t!44700 Nil!30691) (h!31899 Nil!30691))))))

(declare-fun b!1327664 () Bool)

(assert (=> b!1327664 (= e!756835 (noDuplicate!2066 (t!44700 Nil!30691)))))

(assert (= (and d!143351 (not res!880985)) b!1327663))

(assert (= (and b!1327663 res!880986) b!1327664))

(declare-fun m!1216911 () Bool)

(assert (=> b!1327663 m!1216911))

(declare-fun m!1216913 () Bool)

(assert (=> b!1327664 m!1216913))

(assert (=> b!1327605 d!143351))

(declare-fun condMapEmpty!56266 () Bool)

(declare-fun mapDefault!56266 () ValueCell!17298)

(assert (=> mapNonEmpty!56260 (= condMapEmpty!56266 (= mapRest!56260 ((as const (Array (_ BitVec 32) ValueCell!17298)) mapDefault!56266)))))

(declare-fun e!756841 () Bool)

(declare-fun mapRes!56266 () Bool)

(assert (=> mapNonEmpty!56260 (= tp!107167 (and e!756841 mapRes!56266))))

(declare-fun b!1327672 () Bool)

(assert (=> b!1327672 (= e!756841 tp_is_empty!36393)))

(declare-fun mapIsEmpty!56266 () Bool)

(assert (=> mapIsEmpty!56266 mapRes!56266))

(declare-fun b!1327671 () Bool)

(declare-fun e!756840 () Bool)

(assert (=> b!1327671 (= e!756840 tp_is_empty!36393)))

(declare-fun mapNonEmpty!56266 () Bool)

(declare-fun tp!107173 () Bool)

(assert (=> mapNonEmpty!56266 (= mapRes!56266 (and tp!107173 e!756840))))

(declare-fun mapValue!56266 () ValueCell!17298)

(declare-fun mapRest!56266 () (Array (_ BitVec 32) ValueCell!17298))

(declare-fun mapKey!56266 () (_ BitVec 32))

(assert (=> mapNonEmpty!56266 (= mapRest!56260 (store mapRest!56266 mapKey!56266 mapValue!56266))))

(assert (= (and mapNonEmpty!56260 condMapEmpty!56266) mapIsEmpty!56266))

(assert (= (and mapNonEmpty!56260 (not condMapEmpty!56266)) mapNonEmpty!56266))

(assert (= (and mapNonEmpty!56266 ((_ is ValueCellFull!17298) mapValue!56266)) b!1327671))

(assert (= (and mapNonEmpty!56260 ((_ is ValueCellFull!17298) mapDefault!56266)) b!1327672))

(declare-fun m!1216915 () Bool)

(assert (=> mapNonEmpty!56266 m!1216915))

(check-sat (not d!143347) (not bm!64819) (not b!1327649) (not b!1327663) (not b!1327656) tp_is_empty!36393 (not mapNonEmpty!56266) (not d!143349) (not b!1327658) (not b!1327664) (not b!1327648))
(check-sat)
