; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35896 () Bool)

(assert start!35896)

(declare-fun b!360774 () Bool)

(declare-fun e!220849 () Bool)

(declare-fun e!220850 () Bool)

(declare-fun mapRes!14031 () Bool)

(assert (=> b!360774 (= e!220849 (and e!220850 mapRes!14031))))

(declare-fun condMapEmpty!14031 () Bool)

(declare-datatypes ((V!12107 0))(
  ( (V!12108 (val!4218 Int)) )
))
(declare-datatypes ((ValueCell!3830 0))(
  ( (ValueCellFull!3830 (v!6406 V!12107)) (EmptyCell!3830) )
))
(declare-datatypes ((array!20219 0))(
  ( (array!20220 (arr!9602 (Array (_ BitVec 32) ValueCell!3830)) (size!9955 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20219)

(declare-fun mapDefault!14031 () ValueCell!3830)

(assert (=> b!360774 (= condMapEmpty!14031 (= (arr!9602 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3830)) mapDefault!14031)))))

(declare-datatypes ((array!20221 0))(
  ( (array!20222 (arr!9603 (Array (_ BitVec 32) (_ BitVec 64))) (size!9956 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20221)

(declare-fun b!360775 () Bool)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun e!220846 () Bool)

(declare-fun mask!1943 () (_ BitVec 32))

(assert (=> b!360775 (= e!220846 (and (= (size!9955 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9956 _keys!1541) (size!9955 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011) (= (size!9956 _keys!1541) (bvadd #b00000000000000000000000000000001 mask!1943)) (bvsgt #b00000000000000000000000000000000 (size!9956 _keys!1541))))))

(declare-fun b!360776 () Bool)

(declare-fun tp_is_empty!8347 () Bool)

(assert (=> b!360776 (= e!220850 tp_is_empty!8347)))

(declare-fun b!360777 () Bool)

(declare-fun e!220847 () Bool)

(assert (=> b!360777 (= e!220847 tp_is_empty!8347)))

(declare-fun mapIsEmpty!14031 () Bool)

(assert (=> mapIsEmpty!14031 mapRes!14031))

(declare-fun mapNonEmpty!14031 () Bool)

(declare-fun tp!28107 () Bool)

(assert (=> mapNonEmpty!14031 (= mapRes!14031 (and tp!28107 e!220847))))

(declare-fun mapRest!14031 () (Array (_ BitVec 32) ValueCell!3830))

(declare-fun mapKey!14031 () (_ BitVec 32))

(declare-fun mapValue!14031 () ValueCell!3830)

(assert (=> mapNonEmpty!14031 (= (arr!9602 _values!1277) (store mapRest!14031 mapKey!14031 mapValue!14031))))

(declare-fun res!200742 () Bool)

(assert (=> start!35896 (=> (not res!200742) (not e!220846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35896 (= res!200742 (validMask!0 mask!1943))))

(assert (=> start!35896 e!220846))

(assert (=> start!35896 true))

(declare-fun array_inv!7074 (array!20219) Bool)

(assert (=> start!35896 (and (array_inv!7074 _values!1277) e!220849)))

(declare-fun array_inv!7075 (array!20221) Bool)

(assert (=> start!35896 (array_inv!7075 _keys!1541)))

(assert (= (and start!35896 res!200742) b!360775))

(assert (= (and b!360774 condMapEmpty!14031) mapIsEmpty!14031))

(assert (= (and b!360774 (not condMapEmpty!14031)) mapNonEmpty!14031))

(get-info :version)

(assert (= (and mapNonEmpty!14031 ((_ is ValueCellFull!3830) mapValue!14031)) b!360777))

(assert (= (and b!360774 ((_ is ValueCellFull!3830) mapDefault!14031)) b!360776))

(assert (= start!35896 b!360774))

(declare-fun m!357299 () Bool)

(assert (=> mapNonEmpty!14031 m!357299))

(declare-fun m!357301 () Bool)

(assert (=> start!35896 m!357301))

(declare-fun m!357303 () Bool)

(assert (=> start!35896 m!357303))

(declare-fun m!357305 () Bool)

(assert (=> start!35896 m!357305))

(check-sat (not start!35896) (not mapNonEmpty!14031) tp_is_empty!8347)
(check-sat)
(get-model)

(declare-fun d!71675 () Bool)

(assert (=> d!71675 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35896 d!71675))

(declare-fun d!71677 () Bool)

(assert (=> d!71677 (= (array_inv!7074 _values!1277) (bvsge (size!9955 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35896 d!71677))

(declare-fun d!71679 () Bool)

(assert (=> d!71679 (= (array_inv!7075 _keys!1541) (bvsge (size!9956 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35896 d!71679))

(declare-fun condMapEmpty!14040 () Bool)

(declare-fun mapDefault!14040 () ValueCell!3830)

(assert (=> mapNonEmpty!14031 (= condMapEmpty!14040 (= mapRest!14031 ((as const (Array (_ BitVec 32) ValueCell!3830)) mapDefault!14040)))))

(declare-fun e!220886 () Bool)

(declare-fun mapRes!14040 () Bool)

(assert (=> mapNonEmpty!14031 (= tp!28107 (and e!220886 mapRes!14040))))

(declare-fun mapNonEmpty!14040 () Bool)

(declare-fun tp!28116 () Bool)

(declare-fun e!220885 () Bool)

(assert (=> mapNonEmpty!14040 (= mapRes!14040 (and tp!28116 e!220885))))

(declare-fun mapValue!14040 () ValueCell!3830)

(declare-fun mapKey!14040 () (_ BitVec 32))

(declare-fun mapRest!14040 () (Array (_ BitVec 32) ValueCell!3830))

(assert (=> mapNonEmpty!14040 (= mapRest!14031 (store mapRest!14040 mapKey!14040 mapValue!14040))))

(declare-fun b!360808 () Bool)

(assert (=> b!360808 (= e!220885 tp_is_empty!8347)))

(declare-fun mapIsEmpty!14040 () Bool)

(assert (=> mapIsEmpty!14040 mapRes!14040))

(declare-fun b!360809 () Bool)

(assert (=> b!360809 (= e!220886 tp_is_empty!8347)))

(assert (= (and mapNonEmpty!14031 condMapEmpty!14040) mapIsEmpty!14040))

(assert (= (and mapNonEmpty!14031 (not condMapEmpty!14040)) mapNonEmpty!14040))

(assert (= (and mapNonEmpty!14040 ((_ is ValueCellFull!3830) mapValue!14040)) b!360808))

(assert (= (and mapNonEmpty!14031 ((_ is ValueCellFull!3830) mapDefault!14040)) b!360809))

(declare-fun m!357323 () Bool)

(assert (=> mapNonEmpty!14040 m!357323))

(check-sat (not mapNonEmpty!14040) tp_is_empty!8347)
(check-sat)
