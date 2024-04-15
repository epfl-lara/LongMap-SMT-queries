; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78446 () Bool)

(assert start!78446)

(declare-fun b!914733 () Bool)

(declare-fun e!513258 () Bool)

(declare-datatypes ((List!18394 0))(
  ( (Nil!18391) (Cons!18390 (h!19536 (_ BitVec 64)) (t!25998 List!18394)) )
))
(declare-fun noDuplicate!1333 (List!18394) Bool)

(assert (=> b!914733 (= e!513258 (not (noDuplicate!1333 Nil!18391)))))

(declare-fun res!616845 () Bool)

(assert (=> start!78446 (=> (not res!616845) (not e!513258))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78446 (= res!616845 (validMask!0 mask!1881))))

(assert (=> start!78446 e!513258))

(assert (=> start!78446 true))

(declare-datatypes ((V!30575 0))(
  ( (V!30576 (val!9654 Int)) )
))
(declare-datatypes ((ValueCell!9122 0))(
  ( (ValueCellFull!9122 (v!12170 V!30575)) (EmptyCell!9122) )
))
(declare-datatypes ((array!54411 0))(
  ( (array!54412 (arr!26153 (Array (_ BitVec 32) ValueCell!9122)) (size!26614 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54411)

(declare-fun e!513257 () Bool)

(declare-fun array_inv!20502 (array!54411) Bool)

(assert (=> start!78446 (and (array_inv!20502 _values!1231) e!513257)))

(declare-datatypes ((array!54413 0))(
  ( (array!54414 (arr!26154 (Array (_ BitVec 32) (_ BitVec 64))) (size!26615 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54413)

(declare-fun array_inv!20503 (array!54413) Bool)

(assert (=> start!78446 (array_inv!20503 _keys!1487)))

(declare-fun b!914734 () Bool)

(declare-fun res!616848 () Bool)

(assert (=> b!914734 (=> (not res!616848) (not e!513258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54413 (_ BitVec 32)) Bool)

(assert (=> b!914734 (= res!616848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30561 () Bool)

(declare-fun mapRes!30561 () Bool)

(declare-fun tp!58629 () Bool)

(declare-fun e!513256 () Bool)

(assert (=> mapNonEmpty!30561 (= mapRes!30561 (and tp!58629 e!513256))))

(declare-fun mapValue!30561 () ValueCell!9122)

(declare-fun mapRest!30561 () (Array (_ BitVec 32) ValueCell!9122))

(declare-fun mapKey!30561 () (_ BitVec 32))

(assert (=> mapNonEmpty!30561 (= (arr!26153 _values!1231) (store mapRest!30561 mapKey!30561 mapValue!30561))))

(declare-fun b!914735 () Bool)

(declare-fun res!616846 () Bool)

(assert (=> b!914735 (=> (not res!616846) (not e!513258))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914735 (= res!616846 (and (= (size!26614 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26615 _keys!1487) (size!26614 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!914736 () Bool)

(declare-fun e!513255 () Bool)

(assert (=> b!914736 (= e!513257 (and e!513255 mapRes!30561))))

(declare-fun condMapEmpty!30561 () Bool)

(declare-fun mapDefault!30561 () ValueCell!9122)

(assert (=> b!914736 (= condMapEmpty!30561 (= (arr!26153 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9122)) mapDefault!30561)))))

(declare-fun b!914737 () Bool)

(declare-fun res!616847 () Bool)

(assert (=> b!914737 (=> (not res!616847) (not e!513258))))

(assert (=> b!914737 (= res!616847 (and (bvsle #b00000000000000000000000000000000 (size!26615 _keys!1487)) (bvslt (size!26615 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!914738 () Bool)

(declare-fun tp_is_empty!19207 () Bool)

(assert (=> b!914738 (= e!513255 tp_is_empty!19207)))

(declare-fun b!914739 () Bool)

(assert (=> b!914739 (= e!513256 tp_is_empty!19207)))

(declare-fun mapIsEmpty!30561 () Bool)

(assert (=> mapIsEmpty!30561 mapRes!30561))

(assert (= (and start!78446 res!616845) b!914735))

(assert (= (and b!914735 res!616846) b!914734))

(assert (= (and b!914734 res!616848) b!914737))

(assert (= (and b!914737 res!616847) b!914733))

(assert (= (and b!914736 condMapEmpty!30561) mapIsEmpty!30561))

(assert (= (and b!914736 (not condMapEmpty!30561)) mapNonEmpty!30561))

(get-info :version)

(assert (= (and mapNonEmpty!30561 ((_ is ValueCellFull!9122) mapValue!30561)) b!914739))

(assert (= (and b!914736 ((_ is ValueCellFull!9122) mapDefault!30561)) b!914738))

(assert (= start!78446 b!914736))

(declare-fun m!848751 () Bool)

(assert (=> b!914733 m!848751))

(declare-fun m!848753 () Bool)

(assert (=> start!78446 m!848753))

(declare-fun m!848755 () Bool)

(assert (=> start!78446 m!848755))

(declare-fun m!848757 () Bool)

(assert (=> start!78446 m!848757))

(declare-fun m!848759 () Bool)

(assert (=> b!914734 m!848759))

(declare-fun m!848761 () Bool)

(assert (=> mapNonEmpty!30561 m!848761))

(check-sat tp_is_empty!19207 (not start!78446) (not b!914734) (not b!914733) (not mapNonEmpty!30561))
(check-sat)
(get-model)

(declare-fun d!112527 () Bool)

(assert (=> d!112527 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78446 d!112527))

(declare-fun d!112529 () Bool)

(assert (=> d!112529 (= (array_inv!20502 _values!1231) (bvsge (size!26614 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78446 d!112529))

(declare-fun d!112531 () Bool)

(assert (=> d!112531 (= (array_inv!20503 _keys!1487) (bvsge (size!26615 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78446 d!112531))

(declare-fun b!914790 () Bool)

(declare-fun e!513298 () Bool)

(declare-fun e!513297 () Bool)

(assert (=> b!914790 (= e!513298 e!513297)))

(declare-fun c!95983 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914790 (= c!95983 (validKeyInArray!0 (select (arr!26154 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!112533 () Bool)

(declare-fun res!616878 () Bool)

(assert (=> d!112533 (=> res!616878 e!513298)))

(assert (=> d!112533 (= res!616878 (bvsge #b00000000000000000000000000000000 (size!26615 _keys!1487)))))

(assert (=> d!112533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!513298)))

(declare-fun bm!40517 () Bool)

(declare-fun call!40520 () Bool)

(assert (=> bm!40517 (= call!40520 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!914791 () Bool)

(assert (=> b!914791 (= e!513297 call!40520)))

(declare-fun b!914792 () Bool)

(declare-fun e!513296 () Bool)

(assert (=> b!914792 (= e!513296 call!40520)))

(declare-fun b!914793 () Bool)

(assert (=> b!914793 (= e!513297 e!513296)))

(declare-fun lt!411374 () (_ BitVec 64))

(assert (=> b!914793 (= lt!411374 (select (arr!26154 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30882 0))(
  ( (Unit!30883) )
))
(declare-fun lt!411375 () Unit!30882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54413 (_ BitVec 64) (_ BitVec 32)) Unit!30882)

(assert (=> b!914793 (= lt!411375 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411374 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914793 (arrayContainsKey!0 _keys!1487 lt!411374 #b00000000000000000000000000000000)))

(declare-fun lt!411376 () Unit!30882)

(assert (=> b!914793 (= lt!411376 lt!411375)))

(declare-fun res!616877 () Bool)

(declare-datatypes ((SeekEntryResult!8974 0))(
  ( (MissingZero!8974 (index!38267 (_ BitVec 32))) (Found!8974 (index!38268 (_ BitVec 32))) (Intermediate!8974 (undefined!9786 Bool) (index!38269 (_ BitVec 32)) (x!78274 (_ BitVec 32))) (Undefined!8974) (MissingVacant!8974 (index!38270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54413 (_ BitVec 32)) SeekEntryResult!8974)

(assert (=> b!914793 (= res!616877 (= (seekEntryOrOpen!0 (select (arr!26154 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8974 #b00000000000000000000000000000000)))))

(assert (=> b!914793 (=> (not res!616877) (not e!513296))))

(assert (= (and d!112533 (not res!616878)) b!914790))

(assert (= (and b!914790 c!95983) b!914793))

(assert (= (and b!914790 (not c!95983)) b!914791))

(assert (= (and b!914793 res!616877) b!914792))

(assert (= (or b!914792 b!914791) bm!40517))

(declare-fun m!848787 () Bool)

(assert (=> b!914790 m!848787))

(assert (=> b!914790 m!848787))

(declare-fun m!848789 () Bool)

(assert (=> b!914790 m!848789))

(declare-fun m!848791 () Bool)

(assert (=> bm!40517 m!848791))

(assert (=> b!914793 m!848787))

(declare-fun m!848793 () Bool)

(assert (=> b!914793 m!848793))

(declare-fun m!848795 () Bool)

(assert (=> b!914793 m!848795))

(assert (=> b!914793 m!848787))

(declare-fun m!848797 () Bool)

(assert (=> b!914793 m!848797))

(assert (=> b!914734 d!112533))

(declare-fun d!112535 () Bool)

(declare-fun res!616883 () Bool)

(declare-fun e!513303 () Bool)

(assert (=> d!112535 (=> res!616883 e!513303)))

(assert (=> d!112535 (= res!616883 ((_ is Nil!18391) Nil!18391))))

(assert (=> d!112535 (= (noDuplicate!1333 Nil!18391) e!513303)))

(declare-fun b!914798 () Bool)

(declare-fun e!513304 () Bool)

(assert (=> b!914798 (= e!513303 e!513304)))

(declare-fun res!616884 () Bool)

(assert (=> b!914798 (=> (not res!616884) (not e!513304))))

(declare-fun contains!4674 (List!18394 (_ BitVec 64)) Bool)

(assert (=> b!914798 (= res!616884 (not (contains!4674 (t!25998 Nil!18391) (h!19536 Nil!18391))))))

(declare-fun b!914799 () Bool)

(assert (=> b!914799 (= e!513304 (noDuplicate!1333 (t!25998 Nil!18391)))))

(assert (= (and d!112535 (not res!616883)) b!914798))

(assert (= (and b!914798 res!616884) b!914799))

(declare-fun m!848799 () Bool)

(assert (=> b!914798 m!848799))

(declare-fun m!848801 () Bool)

(assert (=> b!914799 m!848801))

(assert (=> b!914733 d!112535))

(declare-fun mapNonEmpty!30570 () Bool)

(declare-fun mapRes!30570 () Bool)

(declare-fun tp!58638 () Bool)

(declare-fun e!513309 () Bool)

(assert (=> mapNonEmpty!30570 (= mapRes!30570 (and tp!58638 e!513309))))

(declare-fun mapRest!30570 () (Array (_ BitVec 32) ValueCell!9122))

(declare-fun mapKey!30570 () (_ BitVec 32))

(declare-fun mapValue!30570 () ValueCell!9122)

(assert (=> mapNonEmpty!30570 (= mapRest!30561 (store mapRest!30570 mapKey!30570 mapValue!30570))))

(declare-fun b!914807 () Bool)

(declare-fun e!513310 () Bool)

(assert (=> b!914807 (= e!513310 tp_is_empty!19207)))

(declare-fun condMapEmpty!30570 () Bool)

(declare-fun mapDefault!30570 () ValueCell!9122)

(assert (=> mapNonEmpty!30561 (= condMapEmpty!30570 (= mapRest!30561 ((as const (Array (_ BitVec 32) ValueCell!9122)) mapDefault!30570)))))

(assert (=> mapNonEmpty!30561 (= tp!58629 (and e!513310 mapRes!30570))))

(declare-fun mapIsEmpty!30570 () Bool)

(assert (=> mapIsEmpty!30570 mapRes!30570))

(declare-fun b!914806 () Bool)

(assert (=> b!914806 (= e!513309 tp_is_empty!19207)))

(assert (= (and mapNonEmpty!30561 condMapEmpty!30570) mapIsEmpty!30570))

(assert (= (and mapNonEmpty!30561 (not condMapEmpty!30570)) mapNonEmpty!30570))

(assert (= (and mapNonEmpty!30570 ((_ is ValueCellFull!9122) mapValue!30570)) b!914806))

(assert (= (and mapNonEmpty!30561 ((_ is ValueCellFull!9122) mapDefault!30570)) b!914807))

(declare-fun m!848803 () Bool)

(assert (=> mapNonEmpty!30570 m!848803))

(check-sat (not b!914790) tp_is_empty!19207 (not mapNonEmpty!30570) (not bm!40517) (not b!914793) (not b!914798) (not b!914799))
(check-sat)
