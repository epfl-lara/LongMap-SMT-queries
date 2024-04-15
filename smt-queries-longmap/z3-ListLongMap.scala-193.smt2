; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3768 () Bool)

(assert start!3768)

(declare-fun b!26342 () Bool)

(declare-fun e!17144 () Bool)

(assert (=> b!26342 (= e!17144 false)))

(declare-fun lt!10354 () Bool)

(declare-datatypes ((array!1419 0))(
  ( (array!1420 (arr!667 (Array (_ BitVec 32) (_ BitVec 64))) (size!768 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1419)

(declare-datatypes ((List!584 0))(
  ( (Nil!581) (Cons!580 (h!1147 (_ BitVec 64)) (t!3264 List!584)) )
))
(declare-fun arrayNoDuplicates!0 (array!1419 (_ BitVec 32) List!584) Bool)

(assert (=> b!26342 (= lt!10354 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!581))))

(declare-fun mapNonEmpty!1165 () Bool)

(declare-fun mapRes!1165 () Bool)

(declare-fun tp!3685 () Bool)

(declare-fun e!17142 () Bool)

(assert (=> mapNonEmpty!1165 (= mapRes!1165 (and tp!3685 e!17142))))

(declare-datatypes ((V!1291 0))(
  ( (V!1292 (val!576 Int)) )
))
(declare-datatypes ((ValueCell!350 0))(
  ( (ValueCellFull!350 (v!1661 V!1291)) (EmptyCell!350) )
))
(declare-datatypes ((array!1421 0))(
  ( (array!1422 (arr!668 (Array (_ BitVec 32) ValueCell!350)) (size!769 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1421)

(declare-fun mapKey!1165 () (_ BitVec 32))

(declare-fun mapRest!1165 () (Array (_ BitVec 32) ValueCell!350))

(declare-fun mapValue!1165 () ValueCell!350)

(assert (=> mapNonEmpty!1165 (= (arr!668 _values!1501) (store mapRest!1165 mapKey!1165 mapValue!1165))))

(declare-fun b!26343 () Bool)

(declare-fun res!15641 () Bool)

(assert (=> b!26343 (=> (not res!15641) (not e!17144))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26343 (= res!15641 (and (= (size!769 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!768 _keys!1833) (size!769 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26344 () Bool)

(declare-fun res!15642 () Bool)

(assert (=> b!26344 (=> (not res!15642) (not e!17144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1419 (_ BitVec 32)) Bool)

(assert (=> b!26344 (= res!15642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26346 () Bool)

(declare-fun e!17145 () Bool)

(declare-fun e!17143 () Bool)

(assert (=> b!26346 (= e!17145 (and e!17143 mapRes!1165))))

(declare-fun condMapEmpty!1165 () Bool)

(declare-fun mapDefault!1165 () ValueCell!350)

(assert (=> b!26346 (= condMapEmpty!1165 (= (arr!668 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!350)) mapDefault!1165)))))

(declare-fun b!26347 () Bool)

(declare-fun tp_is_empty!1099 () Bool)

(assert (=> b!26347 (= e!17143 tp_is_empty!1099)))

(declare-fun mapIsEmpty!1165 () Bool)

(assert (=> mapIsEmpty!1165 mapRes!1165))

(declare-fun b!26345 () Bool)

(assert (=> b!26345 (= e!17142 tp_is_empty!1099)))

(declare-fun res!15643 () Bool)

(assert (=> start!3768 (=> (not res!15643) (not e!17144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3768 (= res!15643 (validMask!0 mask!2294))))

(assert (=> start!3768 e!17144))

(assert (=> start!3768 true))

(declare-fun array_inv!469 (array!1421) Bool)

(assert (=> start!3768 (and (array_inv!469 _values!1501) e!17145)))

(declare-fun array_inv!470 (array!1419) Bool)

(assert (=> start!3768 (array_inv!470 _keys!1833)))

(assert (= (and start!3768 res!15643) b!26343))

(assert (= (and b!26343 res!15641) b!26344))

(assert (= (and b!26344 res!15642) b!26342))

(assert (= (and b!26346 condMapEmpty!1165) mapIsEmpty!1165))

(assert (= (and b!26346 (not condMapEmpty!1165)) mapNonEmpty!1165))

(get-info :version)

(assert (= (and mapNonEmpty!1165 ((_ is ValueCellFull!350) mapValue!1165)) b!26345))

(assert (= (and b!26346 ((_ is ValueCellFull!350) mapDefault!1165)) b!26347))

(assert (= start!3768 b!26346))

(declare-fun m!21115 () Bool)

(assert (=> b!26342 m!21115))

(declare-fun m!21117 () Bool)

(assert (=> mapNonEmpty!1165 m!21117))

(declare-fun m!21119 () Bool)

(assert (=> b!26344 m!21119))

(declare-fun m!21121 () Bool)

(assert (=> start!3768 m!21121))

(declare-fun m!21123 () Bool)

(assert (=> start!3768 m!21123))

(declare-fun m!21125 () Bool)

(assert (=> start!3768 m!21125))

(check-sat tp_is_empty!1099 (not b!26342) (not b!26344) (not mapNonEmpty!1165) (not start!3768))
(check-sat)
