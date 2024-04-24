; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78604 () Bool)

(assert start!78604)

(declare-fun b!915725 () Bool)

(declare-fun res!617233 () Bool)

(declare-fun e!513869 () Bool)

(assert (=> b!915725 (=> (not res!617233) (not e!513869))))

(declare-datatypes ((array!54447 0))(
  ( (array!54448 (arr!26168 (Array (_ BitVec 32) (_ BitVec 64))) (size!26628 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54447)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30559 0))(
  ( (V!30560 (val!9648 Int)) )
))
(declare-datatypes ((ValueCell!9116 0))(
  ( (ValueCellFull!9116 (v!12162 V!30559)) (EmptyCell!9116) )
))
(declare-datatypes ((array!54449 0))(
  ( (array!54450 (arr!26169 (Array (_ BitVec 32) ValueCell!9116)) (size!26629 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54449)

(assert (=> b!915725 (= res!617233 (and (= (size!26629 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26628 _keys!1487) (size!26629 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915726 () Bool)

(declare-fun res!617231 () Bool)

(assert (=> b!915726 (=> (not res!617231) (not e!513869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54447 (_ BitVec 32)) Bool)

(assert (=> b!915726 (= res!617231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915727 () Bool)

(declare-fun e!513865 () Bool)

(declare-fun e!513868 () Bool)

(declare-fun mapRes!30537 () Bool)

(assert (=> b!915727 (= e!513865 (and e!513868 mapRes!30537))))

(declare-fun condMapEmpty!30537 () Bool)

(declare-fun mapDefault!30537 () ValueCell!9116)

(assert (=> b!915727 (= condMapEmpty!30537 (= (arr!26169 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9116)) mapDefault!30537)))))

(declare-fun b!915728 () Bool)

(assert (=> b!915728 (= e!513869 (bvsgt #b00000000000000000000000000000000 (size!26628 _keys!1487)))))

(declare-fun mapNonEmpty!30537 () Bool)

(declare-fun tp!58605 () Bool)

(declare-fun e!513867 () Bool)

(assert (=> mapNonEmpty!30537 (= mapRes!30537 (and tp!58605 e!513867))))

(declare-fun mapKey!30537 () (_ BitVec 32))

(declare-fun mapValue!30537 () ValueCell!9116)

(declare-fun mapRest!30537 () (Array (_ BitVec 32) ValueCell!9116))

(assert (=> mapNonEmpty!30537 (= (arr!26169 _values!1231) (store mapRest!30537 mapKey!30537 mapValue!30537))))

(declare-fun b!915729 () Bool)

(declare-fun tp_is_empty!19195 () Bool)

(assert (=> b!915729 (= e!513867 tp_is_empty!19195)))

(declare-fun b!915730 () Bool)

(assert (=> b!915730 (= e!513868 tp_is_empty!19195)))

(declare-fun res!617232 () Bool)

(assert (=> start!78604 (=> (not res!617232) (not e!513869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78604 (= res!617232 (validMask!0 mask!1881))))

(assert (=> start!78604 e!513869))

(assert (=> start!78604 true))

(declare-fun array_inv!20526 (array!54449) Bool)

(assert (=> start!78604 (and (array_inv!20526 _values!1231) e!513865)))

(declare-fun array_inv!20527 (array!54447) Bool)

(assert (=> start!78604 (array_inv!20527 _keys!1487)))

(declare-fun mapIsEmpty!30537 () Bool)

(assert (=> mapIsEmpty!30537 mapRes!30537))

(assert (= (and start!78604 res!617232) b!915725))

(assert (= (and b!915725 res!617233) b!915726))

(assert (= (and b!915726 res!617231) b!915728))

(assert (= (and b!915727 condMapEmpty!30537) mapIsEmpty!30537))

(assert (= (and b!915727 (not condMapEmpty!30537)) mapNonEmpty!30537))

(get-info :version)

(assert (= (and mapNonEmpty!30537 ((_ is ValueCellFull!9116) mapValue!30537)) b!915729))

(assert (= (and b!915727 ((_ is ValueCellFull!9116) mapDefault!30537)) b!915730))

(assert (= start!78604 b!915727))

(declare-fun m!850715 () Bool)

(assert (=> b!915726 m!850715))

(declare-fun m!850717 () Bool)

(assert (=> mapNonEmpty!30537 m!850717))

(declare-fun m!850719 () Bool)

(assert (=> start!78604 m!850719))

(declare-fun m!850721 () Bool)

(assert (=> start!78604 m!850721))

(declare-fun m!850723 () Bool)

(assert (=> start!78604 m!850723))

(check-sat (not start!78604) (not b!915726) (not mapNonEmpty!30537) tp_is_empty!19195)
(check-sat)
(get-model)

(declare-fun d!113027 () Bool)

(assert (=> d!113027 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78604 d!113027))

(declare-fun d!113029 () Bool)

(assert (=> d!113029 (= (array_inv!20526 _values!1231) (bvsge (size!26629 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78604 d!113029))

(declare-fun d!113031 () Bool)

(assert (=> d!113031 (= (array_inv!20527 _keys!1487) (bvsge (size!26628 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78604 d!113031))

(declare-fun b!915775 () Bool)

(declare-fun e!513907 () Bool)

(declare-fun e!513908 () Bool)

(assert (=> b!915775 (= e!513907 e!513908)))

(declare-fun lt!411955 () (_ BitVec 64))

(assert (=> b!915775 (= lt!411955 (select (arr!26168 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30946 0))(
  ( (Unit!30947) )
))
(declare-fun lt!411954 () Unit!30946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54447 (_ BitVec 64) (_ BitVec 32)) Unit!30946)

(assert (=> b!915775 (= lt!411954 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411955 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!915775 (arrayContainsKey!0 _keys!1487 lt!411955 #b00000000000000000000000000000000)))

(declare-fun lt!411953 () Unit!30946)

(assert (=> b!915775 (= lt!411953 lt!411954)))

(declare-fun res!617256 () Bool)

(declare-datatypes ((SeekEntryResult!8926 0))(
  ( (MissingZero!8926 (index!38075 (_ BitVec 32))) (Found!8926 (index!38076 (_ BitVec 32))) (Intermediate!8926 (undefined!9738 Bool) (index!38077 (_ BitVec 32)) (x!78225 (_ BitVec 32))) (Undefined!8926) (MissingVacant!8926 (index!38078 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54447 (_ BitVec 32)) SeekEntryResult!8926)

(assert (=> b!915775 (= res!617256 (= (seekEntryOrOpen!0 (select (arr!26168 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8926 #b00000000000000000000000000000000)))))

(assert (=> b!915775 (=> (not res!617256) (not e!513908))))

(declare-fun d!113033 () Bool)

(declare-fun res!617257 () Bool)

(declare-fun e!513906 () Bool)

(assert (=> d!113033 (=> res!617257 e!513906)))

(assert (=> d!113033 (= res!617257 (bvsge #b00000000000000000000000000000000 (size!26628 _keys!1487)))))

(assert (=> d!113033 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!513906)))

(declare-fun b!915776 () Bool)

(declare-fun call!40585 () Bool)

(assert (=> b!915776 (= e!513907 call!40585)))

(declare-fun b!915777 () Bool)

(assert (=> b!915777 (= e!513908 call!40585)))

(declare-fun bm!40582 () Bool)

(assert (=> bm!40582 (= call!40585 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!915778 () Bool)

(assert (=> b!915778 (= e!513906 e!513907)))

(declare-fun c!96324 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!915778 (= c!96324 (validKeyInArray!0 (select (arr!26168 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!113033 (not res!617257)) b!915778))

(assert (= (and b!915778 c!96324) b!915775))

(assert (= (and b!915778 (not c!96324)) b!915776))

(assert (= (and b!915775 res!617256) b!915777))

(assert (= (or b!915777 b!915776) bm!40582))

(declare-fun m!850745 () Bool)

(assert (=> b!915775 m!850745))

(declare-fun m!850747 () Bool)

(assert (=> b!915775 m!850747))

(declare-fun m!850749 () Bool)

(assert (=> b!915775 m!850749))

(assert (=> b!915775 m!850745))

(declare-fun m!850751 () Bool)

(assert (=> b!915775 m!850751))

(declare-fun m!850753 () Bool)

(assert (=> bm!40582 m!850753))

(assert (=> b!915778 m!850745))

(assert (=> b!915778 m!850745))

(declare-fun m!850755 () Bool)

(assert (=> b!915778 m!850755))

(assert (=> b!915726 d!113033))

(declare-fun mapIsEmpty!30546 () Bool)

(declare-fun mapRes!30546 () Bool)

(assert (=> mapIsEmpty!30546 mapRes!30546))

(declare-fun b!915785 () Bool)

(declare-fun e!513913 () Bool)

(assert (=> b!915785 (= e!513913 tp_is_empty!19195)))

(declare-fun mapNonEmpty!30546 () Bool)

(declare-fun tp!58614 () Bool)

(assert (=> mapNonEmpty!30546 (= mapRes!30546 (and tp!58614 e!513913))))

(declare-fun mapRest!30546 () (Array (_ BitVec 32) ValueCell!9116))

(declare-fun mapValue!30546 () ValueCell!9116)

(declare-fun mapKey!30546 () (_ BitVec 32))

(assert (=> mapNonEmpty!30546 (= mapRest!30537 (store mapRest!30546 mapKey!30546 mapValue!30546))))

(declare-fun condMapEmpty!30546 () Bool)

(declare-fun mapDefault!30546 () ValueCell!9116)

(assert (=> mapNonEmpty!30537 (= condMapEmpty!30546 (= mapRest!30537 ((as const (Array (_ BitVec 32) ValueCell!9116)) mapDefault!30546)))))

(declare-fun e!513914 () Bool)

(assert (=> mapNonEmpty!30537 (= tp!58605 (and e!513914 mapRes!30546))))

(declare-fun b!915786 () Bool)

(assert (=> b!915786 (= e!513914 tp_is_empty!19195)))

(assert (= (and mapNonEmpty!30537 condMapEmpty!30546) mapIsEmpty!30546))

(assert (= (and mapNonEmpty!30537 (not condMapEmpty!30546)) mapNonEmpty!30546))

(assert (= (and mapNonEmpty!30546 ((_ is ValueCellFull!9116) mapValue!30546)) b!915785))

(assert (= (and mapNonEmpty!30537 ((_ is ValueCellFull!9116) mapDefault!30546)) b!915786))

(declare-fun m!850757 () Bool)

(assert (=> mapNonEmpty!30546 m!850757))

(check-sat (not bm!40582) (not b!915778) tp_is_empty!19195 (not b!915775) (not mapNonEmpty!30546))
(check-sat)
