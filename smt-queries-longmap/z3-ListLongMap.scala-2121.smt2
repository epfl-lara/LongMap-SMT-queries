; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35896 () Bool)

(assert start!35896)

(declare-fun b!360996 () Bool)

(declare-fun e!220990 () Bool)

(declare-fun e!220991 () Bool)

(declare-fun mapRes!14031 () Bool)

(assert (=> b!360996 (= e!220990 (and e!220991 mapRes!14031))))

(declare-fun condMapEmpty!14031 () Bool)

(declare-datatypes ((V!12107 0))(
  ( (V!12108 (val!4218 Int)) )
))
(declare-datatypes ((ValueCell!3830 0))(
  ( (ValueCellFull!3830 (v!6413 V!12107)) (EmptyCell!3830) )
))
(declare-datatypes ((array!20224 0))(
  ( (array!20225 (arr!9604 (Array (_ BitVec 32) ValueCell!3830)) (size!9956 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20224)

(declare-fun mapDefault!14031 () ValueCell!3830)

(assert (=> b!360996 (= condMapEmpty!14031 (= (arr!9604 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3830)) mapDefault!14031)))))

(declare-fun mapIsEmpty!14031 () Bool)

(assert (=> mapIsEmpty!14031 mapRes!14031))

(declare-fun b!360997 () Bool)

(declare-fun e!220992 () Bool)

(declare-fun tp_is_empty!8347 () Bool)

(assert (=> b!360997 (= e!220992 tp_is_empty!8347)))

(declare-fun mapNonEmpty!14031 () Bool)

(declare-fun tp!28107 () Bool)

(assert (=> mapNonEmpty!14031 (= mapRes!14031 (and tp!28107 e!220992))))

(declare-fun mapValue!14031 () ValueCell!3830)

(declare-fun mapRest!14031 () (Array (_ BitVec 32) ValueCell!3830))

(declare-fun mapKey!14031 () (_ BitVec 32))

(assert (=> mapNonEmpty!14031 (= (arr!9604 _values!1277) (store mapRest!14031 mapKey!14031 mapValue!14031))))

(declare-fun res!200868 () Bool)

(declare-fun e!220988 () Bool)

(assert (=> start!35896 (=> (not res!200868) (not e!220988))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35896 (= res!200868 (validMask!0 mask!1943))))

(assert (=> start!35896 e!220988))

(assert (=> start!35896 true))

(declare-fun array_inv!7096 (array!20224) Bool)

(assert (=> start!35896 (and (array_inv!7096 _values!1277) e!220990)))

(declare-datatypes ((array!20226 0))(
  ( (array!20227 (arr!9605 (Array (_ BitVec 32) (_ BitVec 64))) (size!9957 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20226)

(declare-fun array_inv!7097 (array!20226) Bool)

(assert (=> start!35896 (array_inv!7097 _keys!1541)))

(declare-fun b!360998 () Bool)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!360998 (= e!220988 (and (= (size!9956 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9957 _keys!1541) (size!9956 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011) (= (size!9957 _keys!1541) (bvadd #b00000000000000000000000000000001 mask!1943)) (bvsgt #b00000000000000000000000000000000 (size!9957 _keys!1541))))))

(declare-fun b!360999 () Bool)

(assert (=> b!360999 (= e!220991 tp_is_empty!8347)))

(assert (= (and start!35896 res!200868) b!360998))

(assert (= (and b!360996 condMapEmpty!14031) mapIsEmpty!14031))

(assert (= (and b!360996 (not condMapEmpty!14031)) mapNonEmpty!14031))

(get-info :version)

(assert (= (and mapNonEmpty!14031 ((_ is ValueCellFull!3830) mapValue!14031)) b!360997))

(assert (= (and b!360996 ((_ is ValueCellFull!3830) mapDefault!14031)) b!360999))

(assert (= start!35896 b!360996))

(declare-fun m!358253 () Bool)

(assert (=> mapNonEmpty!14031 m!358253))

(declare-fun m!358255 () Bool)

(assert (=> start!35896 m!358255))

(declare-fun m!358257 () Bool)

(assert (=> start!35896 m!358257))

(declare-fun m!358259 () Bool)

(assert (=> start!35896 m!358259))

(check-sat (not start!35896) (not mapNonEmpty!14031) tp_is_empty!8347)
(check-sat)
(get-model)

(declare-fun d!71909 () Bool)

(assert (=> d!71909 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35896 d!71909))

(declare-fun d!71911 () Bool)

(assert (=> d!71911 (= (array_inv!7096 _values!1277) (bvsge (size!9956 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35896 d!71911))

(declare-fun d!71913 () Bool)

(assert (=> d!71913 (= (array_inv!7097 _keys!1541) (bvsge (size!9957 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35896 d!71913))

(declare-fun mapIsEmpty!14040 () Bool)

(declare-fun mapRes!14040 () Bool)

(assert (=> mapIsEmpty!14040 mapRes!14040))

(declare-fun b!361031 () Bool)

(declare-fun e!221027 () Bool)

(assert (=> b!361031 (= e!221027 tp_is_empty!8347)))

(declare-fun mapNonEmpty!14040 () Bool)

(declare-fun tp!28116 () Bool)

(declare-fun e!221028 () Bool)

(assert (=> mapNonEmpty!14040 (= mapRes!14040 (and tp!28116 e!221028))))

(declare-fun mapValue!14040 () ValueCell!3830)

(declare-fun mapKey!14040 () (_ BitVec 32))

(declare-fun mapRest!14040 () (Array (_ BitVec 32) ValueCell!3830))

(assert (=> mapNonEmpty!14040 (= mapRest!14031 (store mapRest!14040 mapKey!14040 mapValue!14040))))

(declare-fun condMapEmpty!14040 () Bool)

(declare-fun mapDefault!14040 () ValueCell!3830)

(assert (=> mapNonEmpty!14031 (= condMapEmpty!14040 (= mapRest!14031 ((as const (Array (_ BitVec 32) ValueCell!3830)) mapDefault!14040)))))

(assert (=> mapNonEmpty!14031 (= tp!28107 (and e!221027 mapRes!14040))))

(declare-fun b!361030 () Bool)

(assert (=> b!361030 (= e!221028 tp_is_empty!8347)))

(assert (= (and mapNonEmpty!14031 condMapEmpty!14040) mapIsEmpty!14040))

(assert (= (and mapNonEmpty!14031 (not condMapEmpty!14040)) mapNonEmpty!14040))

(assert (= (and mapNonEmpty!14040 ((_ is ValueCellFull!3830) mapValue!14040)) b!361030))

(assert (= (and mapNonEmpty!14031 ((_ is ValueCellFull!3830) mapDefault!14040)) b!361031))

(declare-fun m!358277 () Bool)

(assert (=> mapNonEmpty!14040 m!358277))

(check-sat (not mapNonEmpty!14040) tp_is_empty!8347)
(check-sat)
