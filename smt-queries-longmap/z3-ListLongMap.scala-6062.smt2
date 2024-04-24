; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78618 () Bool)

(assert start!78618)

(declare-fun b!915799 () Bool)

(declare-fun res!617264 () Bool)

(declare-fun e!513928 () Bool)

(assert (=> b!915799 (=> (not res!617264) (not e!513928))))

(declare-datatypes ((array!54459 0))(
  ( (array!54460 (arr!26173 (Array (_ BitVec 32) (_ BitVec 64))) (size!26633 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54459)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30567 0))(
  ( (V!30568 (val!9651 Int)) )
))
(declare-datatypes ((ValueCell!9119 0))(
  ( (ValueCellFull!9119 (v!12165 V!30567)) (EmptyCell!9119) )
))
(declare-datatypes ((array!54461 0))(
  ( (array!54462 (arr!26174 (Array (_ BitVec 32) ValueCell!9119)) (size!26634 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54461)

(assert (=> b!915799 (= res!617264 (and (= (size!26634 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26633 _keys!1487) (size!26634 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915800 () Bool)

(declare-fun e!513925 () Bool)

(declare-fun tp_is_empty!19201 () Bool)

(assert (=> b!915800 (= e!513925 tp_is_empty!19201)))

(declare-fun mapNonEmpty!30549 () Bool)

(declare-fun mapRes!30549 () Bool)

(declare-fun tp!58617 () Bool)

(assert (=> mapNonEmpty!30549 (= mapRes!30549 (and tp!58617 e!513925))))

(declare-fun mapRest!30549 () (Array (_ BitVec 32) ValueCell!9119))

(declare-fun mapValue!30549 () ValueCell!9119)

(declare-fun mapKey!30549 () (_ BitVec 32))

(assert (=> mapNonEmpty!30549 (= (arr!26174 _values!1231) (store mapRest!30549 mapKey!30549 mapValue!30549))))

(declare-fun res!617265 () Bool)

(assert (=> start!78618 (=> (not res!617265) (not e!513928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78618 (= res!617265 (validMask!0 mask!1881))))

(assert (=> start!78618 e!513928))

(assert (=> start!78618 true))

(declare-fun e!513926 () Bool)

(declare-fun array_inv!20530 (array!54461) Bool)

(assert (=> start!78618 (and (array_inv!20530 _values!1231) e!513926)))

(declare-fun array_inv!20531 (array!54459) Bool)

(assert (=> start!78618 (array_inv!20531 _keys!1487)))

(declare-fun mapIsEmpty!30549 () Bool)

(assert (=> mapIsEmpty!30549 mapRes!30549))

(declare-fun b!915801 () Bool)

(assert (=> b!915801 (= e!513928 (and (bvsle #b00000000000000000000000000000000 (size!26633 _keys!1487)) (bvsge (size!26633 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!915802 () Bool)

(declare-fun e!513927 () Bool)

(assert (=> b!915802 (= e!513927 tp_is_empty!19201)))

(declare-fun b!915803 () Bool)

(assert (=> b!915803 (= e!513926 (and e!513927 mapRes!30549))))

(declare-fun condMapEmpty!30549 () Bool)

(declare-fun mapDefault!30549 () ValueCell!9119)

(assert (=> b!915803 (= condMapEmpty!30549 (= (arr!26174 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9119)) mapDefault!30549)))))

(declare-fun b!915804 () Bool)

(declare-fun res!617266 () Bool)

(assert (=> b!915804 (=> (not res!617266) (not e!513928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54459 (_ BitVec 32)) Bool)

(assert (=> b!915804 (= res!617266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78618 res!617265) b!915799))

(assert (= (and b!915799 res!617264) b!915804))

(assert (= (and b!915804 res!617266) b!915801))

(assert (= (and b!915803 condMapEmpty!30549) mapIsEmpty!30549))

(assert (= (and b!915803 (not condMapEmpty!30549)) mapNonEmpty!30549))

(get-info :version)

(assert (= (and mapNonEmpty!30549 ((_ is ValueCellFull!9119) mapValue!30549)) b!915800))

(assert (= (and b!915803 ((_ is ValueCellFull!9119) mapDefault!30549)) b!915802))

(assert (= start!78618 b!915803))

(declare-fun m!850759 () Bool)

(assert (=> mapNonEmpty!30549 m!850759))

(declare-fun m!850761 () Bool)

(assert (=> start!78618 m!850761))

(declare-fun m!850763 () Bool)

(assert (=> start!78618 m!850763))

(declare-fun m!850765 () Bool)

(assert (=> start!78618 m!850765))

(declare-fun m!850767 () Bool)

(assert (=> b!915804 m!850767))

(check-sat (not b!915804) (not start!78618) (not mapNonEmpty!30549) tp_is_empty!19201)
(check-sat)
(get-model)

(declare-fun b!915849 () Bool)

(declare-fun e!513966 () Bool)

(declare-fun e!513967 () Bool)

(assert (=> b!915849 (= e!513966 e!513967)))

(declare-fun c!96327 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!915849 (= c!96327 (validKeyInArray!0 (select (arr!26173 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113037 () Bool)

(declare-fun res!617289 () Bool)

(assert (=> d!113037 (=> res!617289 e!513966)))

(assert (=> d!113037 (= res!617289 (bvsge #b00000000000000000000000000000000 (size!26633 _keys!1487)))))

(assert (=> d!113037 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!513966)))

(declare-fun b!915850 () Bool)

(declare-fun e!513968 () Bool)

(assert (=> b!915850 (= e!513967 e!513968)))

(declare-fun lt!411962 () (_ BitVec 64))

(assert (=> b!915850 (= lt!411962 (select (arr!26173 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30948 0))(
  ( (Unit!30949) )
))
(declare-fun lt!411964 () Unit!30948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54459 (_ BitVec 64) (_ BitVec 32)) Unit!30948)

(assert (=> b!915850 (= lt!411964 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411962 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!915850 (arrayContainsKey!0 _keys!1487 lt!411962 #b00000000000000000000000000000000)))

(declare-fun lt!411963 () Unit!30948)

(assert (=> b!915850 (= lt!411963 lt!411964)))

(declare-fun res!617290 () Bool)

(declare-datatypes ((SeekEntryResult!8927 0))(
  ( (MissingZero!8927 (index!38079 (_ BitVec 32))) (Found!8927 (index!38080 (_ BitVec 32))) (Intermediate!8927 (undefined!9739 Bool) (index!38081 (_ BitVec 32)) (x!78236 (_ BitVec 32))) (Undefined!8927) (MissingVacant!8927 (index!38082 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54459 (_ BitVec 32)) SeekEntryResult!8927)

(assert (=> b!915850 (= res!617290 (= (seekEntryOrOpen!0 (select (arr!26173 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8927 #b00000000000000000000000000000000)))))

(assert (=> b!915850 (=> (not res!617290) (not e!513968))))

(declare-fun b!915851 () Bool)

(declare-fun call!40588 () Bool)

(assert (=> b!915851 (= e!513967 call!40588)))

(declare-fun b!915852 () Bool)

(assert (=> b!915852 (= e!513968 call!40588)))

(declare-fun bm!40585 () Bool)

(assert (=> bm!40585 (= call!40588 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(assert (= (and d!113037 (not res!617289)) b!915849))

(assert (= (and b!915849 c!96327) b!915850))

(assert (= (and b!915849 (not c!96327)) b!915851))

(assert (= (and b!915850 res!617290) b!915852))

(assert (= (or b!915852 b!915851) bm!40585))

(declare-fun m!850789 () Bool)

(assert (=> b!915849 m!850789))

(assert (=> b!915849 m!850789))

(declare-fun m!850791 () Bool)

(assert (=> b!915849 m!850791))

(assert (=> b!915850 m!850789))

(declare-fun m!850793 () Bool)

(assert (=> b!915850 m!850793))

(declare-fun m!850795 () Bool)

(assert (=> b!915850 m!850795))

(assert (=> b!915850 m!850789))

(declare-fun m!850797 () Bool)

(assert (=> b!915850 m!850797))

(declare-fun m!850799 () Bool)

(assert (=> bm!40585 m!850799))

(assert (=> b!915804 d!113037))

(declare-fun d!113039 () Bool)

(assert (=> d!113039 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78618 d!113039))

(declare-fun d!113041 () Bool)

(assert (=> d!113041 (= (array_inv!20530 _values!1231) (bvsge (size!26634 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78618 d!113041))

(declare-fun d!113043 () Bool)

(assert (=> d!113043 (= (array_inv!20531 _keys!1487) (bvsge (size!26633 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78618 d!113043))

(declare-fun b!915859 () Bool)

(declare-fun e!513973 () Bool)

(assert (=> b!915859 (= e!513973 tp_is_empty!19201)))

(declare-fun condMapEmpty!30558 () Bool)

(declare-fun mapDefault!30558 () ValueCell!9119)

(assert (=> mapNonEmpty!30549 (= condMapEmpty!30558 (= mapRest!30549 ((as const (Array (_ BitVec 32) ValueCell!9119)) mapDefault!30558)))))

(declare-fun e!513974 () Bool)

(declare-fun mapRes!30558 () Bool)

(assert (=> mapNonEmpty!30549 (= tp!58617 (and e!513974 mapRes!30558))))

(declare-fun mapNonEmpty!30558 () Bool)

(declare-fun tp!58626 () Bool)

(assert (=> mapNonEmpty!30558 (= mapRes!30558 (and tp!58626 e!513973))))

(declare-fun mapValue!30558 () ValueCell!9119)

(declare-fun mapKey!30558 () (_ BitVec 32))

(declare-fun mapRest!30558 () (Array (_ BitVec 32) ValueCell!9119))

(assert (=> mapNonEmpty!30558 (= mapRest!30549 (store mapRest!30558 mapKey!30558 mapValue!30558))))

(declare-fun mapIsEmpty!30558 () Bool)

(assert (=> mapIsEmpty!30558 mapRes!30558))

(declare-fun b!915860 () Bool)

(assert (=> b!915860 (= e!513974 tp_is_empty!19201)))

(assert (= (and mapNonEmpty!30549 condMapEmpty!30558) mapIsEmpty!30558))

(assert (= (and mapNonEmpty!30549 (not condMapEmpty!30558)) mapNonEmpty!30558))

(assert (= (and mapNonEmpty!30558 ((_ is ValueCellFull!9119) mapValue!30558)) b!915859))

(assert (= (and mapNonEmpty!30549 ((_ is ValueCellFull!9119) mapDefault!30558)) b!915860))

(declare-fun m!850801 () Bool)

(assert (=> mapNonEmpty!30558 m!850801))

(check-sat (not b!915849) (not mapNonEmpty!30558) (not bm!40585) tp_is_empty!19201 (not b!915850))
(check-sat)
