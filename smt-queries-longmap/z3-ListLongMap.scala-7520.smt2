; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95354 () Bool)

(assert start!95354)

(declare-fun b!1077049 () Bool)

(declare-fun e!615793 () Bool)

(declare-fun tp_is_empty!26095 () Bool)

(assert (=> b!1077049 (= e!615793 tp_is_empty!26095)))

(declare-fun b!1077050 () Bool)

(declare-fun e!615792 () Bool)

(declare-datatypes ((List!23265 0))(
  ( (Nil!23262) (Cons!23261 (h!24470 (_ BitVec 64)) (t!32615 List!23265)) )
))
(declare-fun noDuplicate!1587 (List!23265) Bool)

(assert (=> b!1077050 (= e!615792 (not (noDuplicate!1587 Nil!23262)))))

(declare-fun mapIsEmpty!40879 () Bool)

(declare-fun mapRes!40879 () Bool)

(assert (=> mapIsEmpty!40879 mapRes!40879))

(declare-fun mapNonEmpty!40879 () Bool)

(declare-fun tp!78341 () Bool)

(declare-fun e!615795 () Bool)

(assert (=> mapNonEmpty!40879 (= mapRes!40879 (and tp!78341 e!615795))))

(declare-datatypes ((V!39921 0))(
  ( (V!39922 (val!13104 Int)) )
))
(declare-datatypes ((ValueCell!12338 0))(
  ( (ValueCellFull!12338 (v!15722 V!39921)) (EmptyCell!12338) )
))
(declare-fun mapRest!40879 () (Array (_ BitVec 32) ValueCell!12338))

(declare-datatypes ((array!69072 0))(
  ( (array!69073 (arr!33216 (Array (_ BitVec 32) ValueCell!12338)) (size!33754 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69072)

(declare-fun mapKey!40879 () (_ BitVec 32))

(declare-fun mapValue!40879 () ValueCell!12338)

(assert (=> mapNonEmpty!40879 (= (arr!33216 _values!874) (store mapRest!40879 mapKey!40879 mapValue!40879))))

(declare-fun b!1077051 () Bool)

(declare-fun res!717717 () Bool)

(assert (=> b!1077051 (=> (not res!717717) (not e!615792))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69074 0))(
  ( (array!69075 (arr!33217 (Array (_ BitVec 32) (_ BitVec 64))) (size!33755 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69074)

(assert (=> b!1077051 (= res!717717 (and (= (size!33754 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33755 _keys!1070) (size!33754 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077052 () Bool)

(declare-fun res!717714 () Bool)

(assert (=> b!1077052 (=> (not res!717714) (not e!615792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69074 (_ BitVec 32)) Bool)

(assert (=> b!1077052 (= res!717714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077053 () Bool)

(declare-fun e!615791 () Bool)

(assert (=> b!1077053 (= e!615791 (and e!615793 mapRes!40879))))

(declare-fun condMapEmpty!40879 () Bool)

(declare-fun mapDefault!40879 () ValueCell!12338)

(assert (=> b!1077053 (= condMapEmpty!40879 (= (arr!33216 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12338)) mapDefault!40879)))))

(declare-fun b!1077054 () Bool)

(declare-fun res!717715 () Bool)

(assert (=> b!1077054 (=> (not res!717715) (not e!615792))))

(assert (=> b!1077054 (= res!717715 (and (bvsle #b00000000000000000000000000000000 (size!33755 _keys!1070)) (bvslt (size!33755 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun res!717716 () Bool)

(assert (=> start!95354 (=> (not res!717716) (not e!615792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95354 (= res!717716 (validMask!0 mask!1414))))

(assert (=> start!95354 e!615792))

(assert (=> start!95354 true))

(declare-fun array_inv!25694 (array!69072) Bool)

(assert (=> start!95354 (and (array_inv!25694 _values!874) e!615791)))

(declare-fun array_inv!25695 (array!69074) Bool)

(assert (=> start!95354 (array_inv!25695 _keys!1070)))

(declare-fun b!1077055 () Bool)

(assert (=> b!1077055 (= e!615795 tp_is_empty!26095)))

(assert (= (and start!95354 res!717716) b!1077051))

(assert (= (and b!1077051 res!717717) b!1077052))

(assert (= (and b!1077052 res!717714) b!1077054))

(assert (= (and b!1077054 res!717715) b!1077050))

(assert (= (and b!1077053 condMapEmpty!40879) mapIsEmpty!40879))

(assert (= (and b!1077053 (not condMapEmpty!40879)) mapNonEmpty!40879))

(get-info :version)

(assert (= (and mapNonEmpty!40879 ((_ is ValueCellFull!12338) mapValue!40879)) b!1077055))

(assert (= (and b!1077053 ((_ is ValueCellFull!12338) mapDefault!40879)) b!1077049))

(assert (= start!95354 b!1077053))

(declare-fun m!995519 () Bool)

(assert (=> b!1077050 m!995519))

(declare-fun m!995521 () Bool)

(assert (=> mapNonEmpty!40879 m!995521))

(declare-fun m!995523 () Bool)

(assert (=> b!1077052 m!995523))

(declare-fun m!995525 () Bool)

(assert (=> start!95354 m!995525))

(declare-fun m!995527 () Bool)

(assert (=> start!95354 m!995527))

(declare-fun m!995529 () Bool)

(assert (=> start!95354 m!995529))

(check-sat (not b!1077052) tp_is_empty!26095 (not mapNonEmpty!40879) (not start!95354) (not b!1077050))
(check-sat)
(get-model)

(declare-fun b!1077106 () Bool)

(declare-fun e!615832 () Bool)

(declare-fun call!45693 () Bool)

(assert (=> b!1077106 (= e!615832 call!45693)))

(declare-fun bm!45690 () Bool)

(assert (=> bm!45690 (= call!45693 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1077107 () Bool)

(declare-fun e!615833 () Bool)

(assert (=> b!1077107 (= e!615833 call!45693)))

(declare-fun b!1077108 () Bool)

(assert (=> b!1077108 (= e!615832 e!615833)))

(declare-fun lt!478325 () (_ BitVec 64))

(assert (=> b!1077108 (= lt!478325 (select (arr!33217 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35299 0))(
  ( (Unit!35300) )
))
(declare-fun lt!478324 () Unit!35299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69074 (_ BitVec 64) (_ BitVec 32)) Unit!35299)

(assert (=> b!1077108 (= lt!478324 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478325 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077108 (arrayContainsKey!0 _keys!1070 lt!478325 #b00000000000000000000000000000000)))

(declare-fun lt!478326 () Unit!35299)

(assert (=> b!1077108 (= lt!478326 lt!478324)))

(declare-fun res!717747 () Bool)

(declare-datatypes ((SeekEntryResult!9897 0))(
  ( (MissingZero!9897 (index!41959 (_ BitVec 32))) (Found!9897 (index!41960 (_ BitVec 32))) (Intermediate!9897 (undefined!10709 Bool) (index!41961 (_ BitVec 32)) (x!96557 (_ BitVec 32))) (Undefined!9897) (MissingVacant!9897 (index!41962 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69074 (_ BitVec 32)) SeekEntryResult!9897)

(assert (=> b!1077108 (= res!717747 (= (seekEntryOrOpen!0 (select (arr!33217 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9897 #b00000000000000000000000000000000)))))

(assert (=> b!1077108 (=> (not res!717747) (not e!615833))))

(declare-fun b!1077109 () Bool)

(declare-fun e!615834 () Bool)

(assert (=> b!1077109 (= e!615834 e!615832)))

(declare-fun c!108271 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077109 (= c!108271 (validKeyInArray!0 (select (arr!33217 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!129669 () Bool)

(declare-fun res!717746 () Bool)

(assert (=> d!129669 (=> res!717746 e!615834)))

(assert (=> d!129669 (= res!717746 (bvsge #b00000000000000000000000000000000 (size!33755 _keys!1070)))))

(assert (=> d!129669 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!615834)))

(assert (= (and d!129669 (not res!717746)) b!1077109))

(assert (= (and b!1077109 c!108271) b!1077108))

(assert (= (and b!1077109 (not c!108271)) b!1077106))

(assert (= (and b!1077108 res!717747) b!1077107))

(assert (= (or b!1077107 b!1077106) bm!45690))

(declare-fun m!995555 () Bool)

(assert (=> bm!45690 m!995555))

(declare-fun m!995557 () Bool)

(assert (=> b!1077108 m!995557))

(declare-fun m!995559 () Bool)

(assert (=> b!1077108 m!995559))

(declare-fun m!995561 () Bool)

(assert (=> b!1077108 m!995561))

(assert (=> b!1077108 m!995557))

(declare-fun m!995563 () Bool)

(assert (=> b!1077108 m!995563))

(assert (=> b!1077109 m!995557))

(assert (=> b!1077109 m!995557))

(declare-fun m!995565 () Bool)

(assert (=> b!1077109 m!995565))

(assert (=> b!1077052 d!129669))

(declare-fun d!129671 () Bool)

(assert (=> d!129671 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95354 d!129671))

(declare-fun d!129673 () Bool)

(assert (=> d!129673 (= (array_inv!25694 _values!874) (bvsge (size!33754 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95354 d!129673))

(declare-fun d!129675 () Bool)

(assert (=> d!129675 (= (array_inv!25695 _keys!1070) (bvsge (size!33755 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95354 d!129675))

(declare-fun d!129677 () Bool)

(declare-fun res!717752 () Bool)

(declare-fun e!615839 () Bool)

(assert (=> d!129677 (=> res!717752 e!615839)))

(assert (=> d!129677 (= res!717752 ((_ is Nil!23262) Nil!23262))))

(assert (=> d!129677 (= (noDuplicate!1587 Nil!23262) e!615839)))

(declare-fun b!1077114 () Bool)

(declare-fun e!615840 () Bool)

(assert (=> b!1077114 (= e!615839 e!615840)))

(declare-fun res!717753 () Bool)

(assert (=> b!1077114 (=> (not res!717753) (not e!615840))))

(declare-fun contains!6335 (List!23265 (_ BitVec 64)) Bool)

(assert (=> b!1077114 (= res!717753 (not (contains!6335 (t!32615 Nil!23262) (h!24470 Nil!23262))))))

(declare-fun b!1077115 () Bool)

(assert (=> b!1077115 (= e!615840 (noDuplicate!1587 (t!32615 Nil!23262)))))

(assert (= (and d!129677 (not res!717752)) b!1077114))

(assert (= (and b!1077114 res!717753) b!1077115))

(declare-fun m!995567 () Bool)

(assert (=> b!1077114 m!995567))

(declare-fun m!995569 () Bool)

(assert (=> b!1077115 m!995569))

(assert (=> b!1077050 d!129677))

(declare-fun b!1077123 () Bool)

(declare-fun e!615845 () Bool)

(assert (=> b!1077123 (= e!615845 tp_is_empty!26095)))

(declare-fun condMapEmpty!40888 () Bool)

(declare-fun mapDefault!40888 () ValueCell!12338)

(assert (=> mapNonEmpty!40879 (= condMapEmpty!40888 (= mapRest!40879 ((as const (Array (_ BitVec 32) ValueCell!12338)) mapDefault!40888)))))

(declare-fun mapRes!40888 () Bool)

(assert (=> mapNonEmpty!40879 (= tp!78341 (and e!615845 mapRes!40888))))

(declare-fun b!1077122 () Bool)

(declare-fun e!615846 () Bool)

(assert (=> b!1077122 (= e!615846 tp_is_empty!26095)))

(declare-fun mapIsEmpty!40888 () Bool)

(assert (=> mapIsEmpty!40888 mapRes!40888))

(declare-fun mapNonEmpty!40888 () Bool)

(declare-fun tp!78350 () Bool)

(assert (=> mapNonEmpty!40888 (= mapRes!40888 (and tp!78350 e!615846))))

(declare-fun mapRest!40888 () (Array (_ BitVec 32) ValueCell!12338))

(declare-fun mapValue!40888 () ValueCell!12338)

(declare-fun mapKey!40888 () (_ BitVec 32))

(assert (=> mapNonEmpty!40888 (= mapRest!40879 (store mapRest!40888 mapKey!40888 mapValue!40888))))

(assert (= (and mapNonEmpty!40879 condMapEmpty!40888) mapIsEmpty!40888))

(assert (= (and mapNonEmpty!40879 (not condMapEmpty!40888)) mapNonEmpty!40888))

(assert (= (and mapNonEmpty!40888 ((_ is ValueCellFull!12338) mapValue!40888)) b!1077122))

(assert (= (and mapNonEmpty!40879 ((_ is ValueCellFull!12338) mapDefault!40888)) b!1077123))

(declare-fun m!995571 () Bool)

(assert (=> mapNonEmpty!40888 m!995571))

(check-sat tp_is_empty!26095 (not b!1077114) (not b!1077115) (not b!1077108) (not b!1077109) (not bm!45690) (not mapNonEmpty!40888))
(check-sat)
