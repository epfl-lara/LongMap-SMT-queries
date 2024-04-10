; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35912 () Bool)

(assert start!35912)

(declare-fun res!200874 () Bool)

(declare-fun e!221041 () Bool)

(assert (=> start!35912 (=> (not res!200874) (not e!221041))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35912 (= res!200874 (validMask!0 mask!1943))))

(assert (=> start!35912 e!221041))

(assert (=> start!35912 true))

(declare-datatypes ((V!12109 0))(
  ( (V!12110 (val!4219 Int)) )
))
(declare-datatypes ((ValueCell!3831 0))(
  ( (ValueCellFull!3831 (v!6413 V!12109)) (EmptyCell!3831) )
))
(declare-datatypes ((array!20245 0))(
  ( (array!20246 (arr!9615 (Array (_ BitVec 32) ValueCell!3831)) (size!9967 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20245)

(declare-fun e!221038 () Bool)

(declare-fun array_inv!7072 (array!20245) Bool)

(assert (=> start!35912 (and (array_inv!7072 _values!1277) e!221038)))

(declare-datatypes ((array!20247 0))(
  ( (array!20248 (arr!9616 (Array (_ BitVec 32) (_ BitVec 64))) (size!9968 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20247)

(declare-fun array_inv!7073 (array!20247) Bool)

(assert (=> start!35912 (array_inv!7073 _keys!1541)))

(declare-fun b!361061 () Bool)

(declare-fun e!221040 () Bool)

(declare-fun tp_is_empty!8349 () Bool)

(assert (=> b!361061 (= e!221040 tp_is_empty!8349)))

(declare-fun b!361062 () Bool)

(declare-fun e!221037 () Bool)

(declare-fun mapRes!14034 () Bool)

(assert (=> b!361062 (= e!221038 (and e!221037 mapRes!14034))))

(declare-fun condMapEmpty!14034 () Bool)

(declare-fun mapDefault!14034 () ValueCell!3831)

(assert (=> b!361062 (= condMapEmpty!14034 (= (arr!9615 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3831)) mapDefault!14034)))))

(declare-fun mapNonEmpty!14034 () Bool)

(declare-fun tp!28110 () Bool)

(assert (=> mapNonEmpty!14034 (= mapRes!14034 (and tp!28110 e!221040))))

(declare-fun mapRest!14034 () (Array (_ BitVec 32) ValueCell!3831))

(declare-fun mapKey!14034 () (_ BitVec 32))

(declare-fun mapValue!14034 () ValueCell!3831)

(assert (=> mapNonEmpty!14034 (= (arr!9615 _values!1277) (store mapRest!14034 mapKey!14034 mapValue!14034))))

(declare-fun b!361063 () Bool)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361063 (= e!221041 (and (= (size!9967 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9968 _keys!1541) (size!9967 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011) (= (size!9968 _keys!1541) (bvadd #b00000000000000000000000000000001 mask!1943)) (bvsgt #b00000000000000000000000000000000 (size!9968 _keys!1541))))))

(declare-fun mapIsEmpty!14034 () Bool)

(assert (=> mapIsEmpty!14034 mapRes!14034))

(declare-fun b!361064 () Bool)

(assert (=> b!361064 (= e!221037 tp_is_empty!8349)))

(assert (= (and start!35912 res!200874) b!361063))

(assert (= (and b!361062 condMapEmpty!14034) mapIsEmpty!14034))

(assert (= (and b!361062 (not condMapEmpty!14034)) mapNonEmpty!14034))

(get-info :version)

(assert (= (and mapNonEmpty!14034 ((_ is ValueCellFull!3831) mapValue!14034)) b!361061))

(assert (= (and b!361062 ((_ is ValueCellFull!3831) mapDefault!14034)) b!361064))

(assert (= start!35912 b!361062))

(declare-fun m!358037 () Bool)

(assert (=> start!35912 m!358037))

(declare-fun m!358039 () Bool)

(assert (=> start!35912 m!358039))

(declare-fun m!358041 () Bool)

(assert (=> start!35912 m!358041))

(declare-fun m!358043 () Bool)

(assert (=> mapNonEmpty!14034 m!358043))

(check-sat (not start!35912) (not mapNonEmpty!14034) tp_is_empty!8349)
(check-sat)
(get-model)

(declare-fun d!71881 () Bool)

(assert (=> d!71881 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35912 d!71881))

(declare-fun d!71883 () Bool)

(assert (=> d!71883 (= (array_inv!7072 _values!1277) (bvsge (size!9967 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35912 d!71883))

(declare-fun d!71885 () Bool)

(assert (=> d!71885 (= (array_inv!7073 _keys!1541) (bvsge (size!9968 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35912 d!71885))

(declare-fun condMapEmpty!14040 () Bool)

(declare-fun mapDefault!14040 () ValueCell!3831)

(assert (=> mapNonEmpty!14034 (= condMapEmpty!14040 (= mapRest!14034 ((as const (Array (_ BitVec 32) ValueCell!3831)) mapDefault!14040)))))

(declare-fun e!221061 () Bool)

(declare-fun mapRes!14040 () Bool)

(assert (=> mapNonEmpty!14034 (= tp!28110 (and e!221061 mapRes!14040))))

(declare-fun b!361084 () Bool)

(assert (=> b!361084 (= e!221061 tp_is_empty!8349)))

(declare-fun mapNonEmpty!14040 () Bool)

(declare-fun tp!28116 () Bool)

(declare-fun e!221062 () Bool)

(assert (=> mapNonEmpty!14040 (= mapRes!14040 (and tp!28116 e!221062))))

(declare-fun mapKey!14040 () (_ BitVec 32))

(declare-fun mapRest!14040 () (Array (_ BitVec 32) ValueCell!3831))

(declare-fun mapValue!14040 () ValueCell!3831)

(assert (=> mapNonEmpty!14040 (= mapRest!14034 (store mapRest!14040 mapKey!14040 mapValue!14040))))

(declare-fun mapIsEmpty!14040 () Bool)

(assert (=> mapIsEmpty!14040 mapRes!14040))

(declare-fun b!361083 () Bool)

(assert (=> b!361083 (= e!221062 tp_is_empty!8349)))

(assert (= (and mapNonEmpty!14034 condMapEmpty!14040) mapIsEmpty!14040))

(assert (= (and mapNonEmpty!14034 (not condMapEmpty!14040)) mapNonEmpty!14040))

(assert (= (and mapNonEmpty!14040 ((_ is ValueCellFull!3831) mapValue!14040)) b!361083))

(assert (= (and mapNonEmpty!14034 ((_ is ValueCellFull!3831) mapDefault!14040)) b!361084))

(declare-fun m!358053 () Bool)

(assert (=> mapNonEmpty!14040 m!358053))

(check-sat (not mapNonEmpty!14040) tp_is_empty!8349)
(check-sat)
