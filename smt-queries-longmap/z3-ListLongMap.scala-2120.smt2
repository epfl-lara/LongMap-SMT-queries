; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35890 () Bool)

(assert start!35890)

(declare-fun mapNonEmpty!14022 () Bool)

(declare-fun mapRes!14022 () Bool)

(declare-fun tp!28098 () Bool)

(declare-fun e!220801 () Bool)

(assert (=> mapNonEmpty!14022 (= mapRes!14022 (and tp!28098 e!220801))))

(declare-datatypes ((V!12099 0))(
  ( (V!12100 (val!4215 Int)) )
))
(declare-datatypes ((ValueCell!3827 0))(
  ( (ValueCellFull!3827 (v!6403 V!12099)) (EmptyCell!3827) )
))
(declare-fun mapRest!14022 () (Array (_ BitVec 32) ValueCell!3827))

(declare-datatypes ((array!20209 0))(
  ( (array!20210 (arr!9597 (Array (_ BitVec 32) ValueCell!3827)) (size!9950 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20209)

(declare-fun mapValue!14022 () ValueCell!3827)

(declare-fun mapKey!14022 () (_ BitVec 32))

(assert (=> mapNonEmpty!14022 (= (arr!9597 _values!1277) (store mapRest!14022 mapKey!14022 mapValue!14022))))

(declare-fun b!360738 () Bool)

(declare-fun tp_is_empty!8341 () Bool)

(assert (=> b!360738 (= e!220801 tp_is_empty!8341)))

(declare-fun b!360739 () Bool)

(declare-fun e!220805 () Bool)

(declare-fun e!220802 () Bool)

(assert (=> b!360739 (= e!220805 (and e!220802 mapRes!14022))))

(declare-fun condMapEmpty!14022 () Bool)

(declare-fun mapDefault!14022 () ValueCell!3827)

(assert (=> b!360739 (= condMapEmpty!14022 (= (arr!9597 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3827)) mapDefault!14022)))))

(declare-fun b!360740 () Bool)

(assert (=> b!360740 (= e!220802 tp_is_empty!8341)))

(declare-fun mapIsEmpty!14022 () Bool)

(assert (=> mapIsEmpty!14022 mapRes!14022))

(declare-datatypes ((array!20211 0))(
  ( (array!20212 (arr!9598 (Array (_ BitVec 32) (_ BitVec 64))) (size!9951 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20211)

(declare-fun e!220803 () Bool)

(declare-fun b!360741 () Bool)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(assert (=> b!360741 (= e!220803 (and (= (size!9950 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9951 _keys!1541) (size!9950 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011) (not (= (size!9951 _keys!1541) (bvadd #b00000000000000000000000000000001 mask!1943)))))))

(declare-fun res!200733 () Bool)

(assert (=> start!35890 (=> (not res!200733) (not e!220803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35890 (= res!200733 (validMask!0 mask!1943))))

(assert (=> start!35890 e!220803))

(assert (=> start!35890 true))

(declare-fun array_inv!7070 (array!20209) Bool)

(assert (=> start!35890 (and (array_inv!7070 _values!1277) e!220805)))

(declare-fun array_inv!7071 (array!20211) Bool)

(assert (=> start!35890 (array_inv!7071 _keys!1541)))

(assert (= (and start!35890 res!200733) b!360741))

(assert (= (and b!360739 condMapEmpty!14022) mapIsEmpty!14022))

(assert (= (and b!360739 (not condMapEmpty!14022)) mapNonEmpty!14022))

(get-info :version)

(assert (= (and mapNonEmpty!14022 ((_ is ValueCellFull!3827) mapValue!14022)) b!360738))

(assert (= (and b!360739 ((_ is ValueCellFull!3827) mapDefault!14022)) b!360740))

(assert (= start!35890 b!360739))

(declare-fun m!357275 () Bool)

(assert (=> mapNonEmpty!14022 m!357275))

(declare-fun m!357277 () Bool)

(assert (=> start!35890 m!357277))

(declare-fun m!357279 () Bool)

(assert (=> start!35890 m!357279))

(declare-fun m!357281 () Bool)

(assert (=> start!35890 m!357281))

(check-sat (not start!35890) (not mapNonEmpty!14022) tp_is_empty!8341)
(check-sat)
