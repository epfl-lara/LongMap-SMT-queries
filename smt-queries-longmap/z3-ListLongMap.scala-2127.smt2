; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35976 () Bool)

(assert start!35976)

(declare-fun mapIsEmpty!14100 () Bool)

(declare-fun mapRes!14100 () Bool)

(assert (=> mapIsEmpty!14100 mapRes!14100))

(declare-fun mapNonEmpty!14100 () Bool)

(declare-fun tp!28176 () Bool)

(declare-fun e!221215 () Bool)

(assert (=> mapNonEmpty!14100 (= mapRes!14100 (and tp!28176 e!221215))))

(declare-datatypes ((V!12155 0))(
  ( (V!12156 (val!4236 Int)) )
))
(declare-datatypes ((ValueCell!3848 0))(
  ( (ValueCellFull!3848 (v!6425 V!12155)) (EmptyCell!3848) )
))
(declare-datatypes ((array!20299 0))(
  ( (array!20300 (arr!9637 (Array (_ BitVec 32) ValueCell!3848)) (size!9990 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20299)

(declare-fun mapKey!14100 () (_ BitVec 32))

(declare-fun mapRest!14100 () (Array (_ BitVec 32) ValueCell!3848))

(declare-fun mapValue!14100 () ValueCell!3848)

(assert (=> mapNonEmpty!14100 (= (arr!9637 _values!1277) (store mapRest!14100 mapKey!14100 mapValue!14100))))

(declare-fun res!200970 () Bool)

(declare-fun e!221211 () Bool)

(assert (=> start!35976 (=> (not res!200970) (not e!221211))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35976 (= res!200970 (validMask!0 mask!1943))))

(assert (=> start!35976 e!221211))

(assert (=> start!35976 true))

(declare-fun e!221213 () Bool)

(declare-fun array_inv!7100 (array!20299) Bool)

(assert (=> start!35976 (and (array_inv!7100 _values!1277) e!221213)))

(declare-datatypes ((array!20301 0))(
  ( (array!20302 (arr!9638 (Array (_ BitVec 32) (_ BitVec 64))) (size!9991 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20301)

(declare-fun array_inv!7101 (array!20301) Bool)

(assert (=> start!35976 (array_inv!7101 _keys!1541)))

(declare-fun b!361228 () Bool)

(assert (=> b!361228 (= e!221211 false)))

(declare-fun lt!166334 () Bool)

(declare-datatypes ((List!5475 0))(
  ( (Nil!5472) (Cons!5471 (h!6327 (_ BitVec 64)) (t!10616 List!5475)) )
))
(declare-fun arrayNoDuplicates!0 (array!20301 (_ BitVec 32) List!5475) Bool)

(assert (=> b!361228 (= lt!166334 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5472))))

(declare-fun b!361229 () Bool)

(declare-fun res!200971 () Bool)

(assert (=> b!361229 (=> (not res!200971) (not e!221211))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361229 (= res!200971 (and (= (size!9990 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9991 _keys!1541) (size!9990 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361230 () Bool)

(declare-fun tp_is_empty!8383 () Bool)

(assert (=> b!361230 (= e!221215 tp_is_empty!8383)))

(declare-fun b!361231 () Bool)

(declare-fun e!221212 () Bool)

(assert (=> b!361231 (= e!221212 tp_is_empty!8383)))

(declare-fun b!361232 () Bool)

(declare-fun res!200972 () Bool)

(assert (=> b!361232 (=> (not res!200972) (not e!221211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20301 (_ BitVec 32)) Bool)

(assert (=> b!361232 (= res!200972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361233 () Bool)

(assert (=> b!361233 (= e!221213 (and e!221212 mapRes!14100))))

(declare-fun condMapEmpty!14100 () Bool)

(declare-fun mapDefault!14100 () ValueCell!3848)

(assert (=> b!361233 (= condMapEmpty!14100 (= (arr!9637 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3848)) mapDefault!14100)))))

(assert (= (and start!35976 res!200970) b!361229))

(assert (= (and b!361229 res!200971) b!361232))

(assert (= (and b!361232 res!200972) b!361228))

(assert (= (and b!361233 condMapEmpty!14100) mapIsEmpty!14100))

(assert (= (and b!361233 (not condMapEmpty!14100)) mapNonEmpty!14100))

(get-info :version)

(assert (= (and mapNonEmpty!14100 ((_ is ValueCellFull!3848) mapValue!14100)) b!361230))

(assert (= (and b!361233 ((_ is ValueCellFull!3848) mapDefault!14100)) b!361231))

(assert (= start!35976 b!361233))

(declare-fun m!357579 () Bool)

(assert (=> mapNonEmpty!14100 m!357579))

(declare-fun m!357581 () Bool)

(assert (=> start!35976 m!357581))

(declare-fun m!357583 () Bool)

(assert (=> start!35976 m!357583))

(declare-fun m!357585 () Bool)

(assert (=> start!35976 m!357585))

(declare-fun m!357587 () Bool)

(assert (=> b!361228 m!357587))

(declare-fun m!357589 () Bool)

(assert (=> b!361232 m!357589))

(check-sat (not start!35976) tp_is_empty!8383 (not mapNonEmpty!14100) (not b!361232) (not b!361228))
(check-sat)
