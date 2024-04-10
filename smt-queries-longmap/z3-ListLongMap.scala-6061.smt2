; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78438 () Bool)

(assert start!78438)

(declare-fun b!914840 () Bool)

(declare-fun e!513299 () Bool)

(declare-fun tp_is_empty!19197 () Bool)

(assert (=> b!914840 (= e!513299 tp_is_empty!19197)))

(declare-fun res!616898 () Bool)

(declare-fun e!513298 () Bool)

(assert (=> start!78438 (=> (not res!616898) (not e!513298))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78438 (= res!616898 (validMask!0 mask!1881))))

(assert (=> start!78438 e!513298))

(assert (=> start!78438 true))

(declare-datatypes ((V!30561 0))(
  ( (V!30562 (val!9649 Int)) )
))
(declare-datatypes ((ValueCell!9117 0))(
  ( (ValueCellFull!9117 (v!12166 V!30561)) (EmptyCell!9117) )
))
(declare-datatypes ((array!54386 0))(
  ( (array!54387 (arr!26142 (Array (_ BitVec 32) ValueCell!9117)) (size!26601 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54386)

(declare-fun e!513301 () Bool)

(declare-fun array_inv!20416 (array!54386) Bool)

(assert (=> start!78438 (and (array_inv!20416 _values!1231) e!513301)))

(declare-datatypes ((array!54388 0))(
  ( (array!54389 (arr!26143 (Array (_ BitVec 32) (_ BitVec 64))) (size!26602 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54388)

(declare-fun array_inv!20417 (array!54388) Bool)

(assert (=> start!78438 (array_inv!20417 _keys!1487)))

(declare-fun b!914841 () Bool)

(declare-fun e!513302 () Bool)

(declare-fun mapRes!30540 () Bool)

(assert (=> b!914841 (= e!513301 (and e!513302 mapRes!30540))))

(declare-fun condMapEmpty!30540 () Bool)

(declare-fun mapDefault!30540 () ValueCell!9117)

(assert (=> b!914841 (= condMapEmpty!30540 (= (arr!26142 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9117)) mapDefault!30540)))))

(declare-fun b!914842 () Bool)

(declare-fun res!616897 () Bool)

(assert (=> b!914842 (=> (not res!616897) (not e!513298))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914842 (= res!616897 (and (= (size!26601 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26602 _keys!1487) (size!26601 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!914843 () Bool)

(assert (=> b!914843 (= e!513298 (bvsgt #b00000000000000000000000000000000 (size!26602 _keys!1487)))))

(declare-fun b!914844 () Bool)

(assert (=> b!914844 (= e!513302 tp_is_empty!19197)))

(declare-fun mapNonEmpty!30540 () Bool)

(declare-fun tp!58607 () Bool)

(assert (=> mapNonEmpty!30540 (= mapRes!30540 (and tp!58607 e!513299))))

(declare-fun mapValue!30540 () ValueCell!9117)

(declare-fun mapRest!30540 () (Array (_ BitVec 32) ValueCell!9117))

(declare-fun mapKey!30540 () (_ BitVec 32))

(assert (=> mapNonEmpty!30540 (= (arr!26142 _values!1231) (store mapRest!30540 mapKey!30540 mapValue!30540))))

(declare-fun b!914845 () Bool)

(declare-fun res!616896 () Bool)

(assert (=> b!914845 (=> (not res!616896) (not e!513298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54388 (_ BitVec 32)) Bool)

(assert (=> b!914845 (= res!616896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30540 () Bool)

(assert (=> mapIsEmpty!30540 mapRes!30540))

(assert (= (and start!78438 res!616898) b!914842))

(assert (= (and b!914842 res!616897) b!914845))

(assert (= (and b!914845 res!616896) b!914843))

(assert (= (and b!914841 condMapEmpty!30540) mapIsEmpty!30540))

(assert (= (and b!914841 (not condMapEmpty!30540)) mapNonEmpty!30540))

(get-info :version)

(assert (= (and mapNonEmpty!30540 ((_ is ValueCellFull!9117) mapValue!30540)) b!914840))

(assert (= (and b!914841 ((_ is ValueCellFull!9117) mapDefault!30540)) b!914844))

(assert (= start!78438 b!914841))

(declare-fun m!849431 () Bool)

(assert (=> start!78438 m!849431))

(declare-fun m!849433 () Bool)

(assert (=> start!78438 m!849433))

(declare-fun m!849435 () Bool)

(assert (=> start!78438 m!849435))

(declare-fun m!849437 () Bool)

(assert (=> mapNonEmpty!30540 m!849437))

(declare-fun m!849439 () Bool)

(assert (=> b!914845 m!849439))

(check-sat (not start!78438) (not b!914845) (not mapNonEmpty!30540) tp_is_empty!19197)
(check-sat)
(get-model)

(declare-fun d!112705 () Bool)

(assert (=> d!112705 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78438 d!112705))

(declare-fun d!112707 () Bool)

(assert (=> d!112707 (= (array_inv!20416 _values!1231) (bvsge (size!26601 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78438 d!112707))

(declare-fun d!112709 () Bool)

(assert (=> d!112709 (= (array_inv!20417 _keys!1487) (bvsge (size!26602 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78438 d!112709))

(declare-fun b!914872 () Bool)

(declare-fun e!513325 () Bool)

(declare-fun call!40540 () Bool)

(assert (=> b!914872 (= e!513325 call!40540)))

(declare-fun bm!40537 () Bool)

(assert (=> bm!40537 (= call!40540 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!914873 () Bool)

(declare-fun e!513326 () Bool)

(assert (=> b!914873 (= e!513326 call!40540)))

(declare-fun d!112711 () Bool)

(declare-fun res!616912 () Bool)

(declare-fun e!513324 () Bool)

(assert (=> d!112711 (=> res!616912 e!513324)))

(assert (=> d!112711 (= res!616912 (bvsge #b00000000000000000000000000000000 (size!26602 _keys!1487)))))

(assert (=> d!112711 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!513324)))

(declare-fun b!914874 () Bool)

(assert (=> b!914874 (= e!513324 e!513325)))

(declare-fun c!96042 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914874 (= c!96042 (validKeyInArray!0 (select (arr!26143 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!914875 () Bool)

(assert (=> b!914875 (= e!513325 e!513326)))

(declare-fun lt!411592 () (_ BitVec 64))

(assert (=> b!914875 (= lt!411592 (select (arr!26143 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30962 0))(
  ( (Unit!30963) )
))
(declare-fun lt!411594 () Unit!30962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54388 (_ BitVec 64) (_ BitVec 32)) Unit!30962)

(assert (=> b!914875 (= lt!411594 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411592 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914875 (arrayContainsKey!0 _keys!1487 lt!411592 #b00000000000000000000000000000000)))

(declare-fun lt!411593 () Unit!30962)

(assert (=> b!914875 (= lt!411593 lt!411594)))

(declare-fun res!616913 () Bool)

(declare-datatypes ((SeekEntryResult!8972 0))(
  ( (MissingZero!8972 (index!38259 (_ BitVec 32))) (Found!8972 (index!38260 (_ BitVec 32))) (Intermediate!8972 (undefined!9784 Bool) (index!38261 (_ BitVec 32)) (x!78257 (_ BitVec 32))) (Undefined!8972) (MissingVacant!8972 (index!38262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54388 (_ BitVec 32)) SeekEntryResult!8972)

(assert (=> b!914875 (= res!616913 (= (seekEntryOrOpen!0 (select (arr!26143 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8972 #b00000000000000000000000000000000)))))

(assert (=> b!914875 (=> (not res!616913) (not e!513326))))

(assert (= (and d!112711 (not res!616912)) b!914874))

(assert (= (and b!914874 c!96042) b!914875))

(assert (= (and b!914874 (not c!96042)) b!914872))

(assert (= (and b!914875 res!616913) b!914873))

(assert (= (or b!914873 b!914872) bm!40537))

(declare-fun m!849451 () Bool)

(assert (=> bm!40537 m!849451))

(declare-fun m!849453 () Bool)

(assert (=> b!914874 m!849453))

(assert (=> b!914874 m!849453))

(declare-fun m!849455 () Bool)

(assert (=> b!914874 m!849455))

(assert (=> b!914875 m!849453))

(declare-fun m!849457 () Bool)

(assert (=> b!914875 m!849457))

(declare-fun m!849459 () Bool)

(assert (=> b!914875 m!849459))

(assert (=> b!914875 m!849453))

(declare-fun m!849461 () Bool)

(assert (=> b!914875 m!849461))

(assert (=> b!914845 d!112711))

(declare-fun condMapEmpty!30546 () Bool)

(declare-fun mapDefault!30546 () ValueCell!9117)

(assert (=> mapNonEmpty!30540 (= condMapEmpty!30546 (= mapRest!30540 ((as const (Array (_ BitVec 32) ValueCell!9117)) mapDefault!30546)))))

(declare-fun e!513332 () Bool)

(declare-fun mapRes!30546 () Bool)

(assert (=> mapNonEmpty!30540 (= tp!58607 (and e!513332 mapRes!30546))))

(declare-fun mapIsEmpty!30546 () Bool)

(assert (=> mapIsEmpty!30546 mapRes!30546))

(declare-fun b!914883 () Bool)

(assert (=> b!914883 (= e!513332 tp_is_empty!19197)))

(declare-fun b!914882 () Bool)

(declare-fun e!513331 () Bool)

(assert (=> b!914882 (= e!513331 tp_is_empty!19197)))

(declare-fun mapNonEmpty!30546 () Bool)

(declare-fun tp!58613 () Bool)

(assert (=> mapNonEmpty!30546 (= mapRes!30546 (and tp!58613 e!513331))))

(declare-fun mapRest!30546 () (Array (_ BitVec 32) ValueCell!9117))

(declare-fun mapValue!30546 () ValueCell!9117)

(declare-fun mapKey!30546 () (_ BitVec 32))

(assert (=> mapNonEmpty!30546 (= mapRest!30540 (store mapRest!30546 mapKey!30546 mapValue!30546))))

(assert (= (and mapNonEmpty!30540 condMapEmpty!30546) mapIsEmpty!30546))

(assert (= (and mapNonEmpty!30540 (not condMapEmpty!30546)) mapNonEmpty!30546))

(assert (= (and mapNonEmpty!30546 ((_ is ValueCellFull!9117) mapValue!30546)) b!914882))

(assert (= (and mapNonEmpty!30540 ((_ is ValueCellFull!9117) mapDefault!30546)) b!914883))

(declare-fun m!849463 () Bool)

(assert (=> mapNonEmpty!30546 m!849463))

(check-sat (not mapNonEmpty!30546) (not b!914875) (not bm!40537) tp_is_empty!19197 (not b!914874))
(check-sat)
