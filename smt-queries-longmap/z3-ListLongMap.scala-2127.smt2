; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35976 () Bool)

(assert start!35976)

(declare-fun b!361450 () Bool)

(declare-fun e!221355 () Bool)

(declare-fun e!221353 () Bool)

(declare-fun mapRes!14100 () Bool)

(assert (=> b!361450 (= e!221355 (and e!221353 mapRes!14100))))

(declare-fun condMapEmpty!14100 () Bool)

(declare-datatypes ((V!12155 0))(
  ( (V!12156 (val!4236 Int)) )
))
(declare-datatypes ((ValueCell!3848 0))(
  ( (ValueCellFull!3848 (v!6432 V!12155)) (EmptyCell!3848) )
))
(declare-datatypes ((array!20304 0))(
  ( (array!20305 (arr!9639 (Array (_ BitVec 32) ValueCell!3848)) (size!9991 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20304)

(declare-fun mapDefault!14100 () ValueCell!3848)

(assert (=> b!361450 (= condMapEmpty!14100 (= (arr!9639 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3848)) mapDefault!14100)))))

(declare-fun b!361451 () Bool)

(declare-fun e!221356 () Bool)

(declare-fun tp_is_empty!8383 () Bool)

(assert (=> b!361451 (= e!221356 tp_is_empty!8383)))

(declare-fun b!361452 () Bool)

(declare-fun res!201098 () Bool)

(declare-fun e!221354 () Bool)

(assert (=> b!361452 (=> (not res!201098) (not e!221354))))

(declare-datatypes ((array!20306 0))(
  ( (array!20307 (arr!9640 (Array (_ BitVec 32) (_ BitVec 64))) (size!9992 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20306)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(assert (=> b!361452 (= res!201098 (and (= (size!9991 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9992 _keys!1541) (size!9991 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14100 () Bool)

(assert (=> mapIsEmpty!14100 mapRes!14100))

(declare-fun b!361453 () Bool)

(assert (=> b!361453 (= e!221354 false)))

(declare-fun lt!166587 () Bool)

(declare-datatypes ((List!5420 0))(
  ( (Nil!5417) (Cons!5416 (h!6272 (_ BitVec 64)) (t!10562 List!5420)) )
))
(declare-fun arrayNoDuplicates!0 (array!20306 (_ BitVec 32) List!5420) Bool)

(assert (=> b!361453 (= lt!166587 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5417))))

(declare-fun b!361454 () Bool)

(declare-fun res!201097 () Bool)

(assert (=> b!361454 (=> (not res!201097) (not e!221354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20306 (_ BitVec 32)) Bool)

(assert (=> b!361454 (= res!201097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun res!201096 () Bool)

(assert (=> start!35976 (=> (not res!201096) (not e!221354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35976 (= res!201096 (validMask!0 mask!1943))))

(assert (=> start!35976 e!221354))

(assert (=> start!35976 true))

(declare-fun array_inv!7118 (array!20304) Bool)

(assert (=> start!35976 (and (array_inv!7118 _values!1277) e!221355)))

(declare-fun array_inv!7119 (array!20306) Bool)

(assert (=> start!35976 (array_inv!7119 _keys!1541)))

(declare-fun mapNonEmpty!14100 () Bool)

(declare-fun tp!28176 () Bool)

(assert (=> mapNonEmpty!14100 (= mapRes!14100 (and tp!28176 e!221356))))

(declare-fun mapRest!14100 () (Array (_ BitVec 32) ValueCell!3848))

(declare-fun mapValue!14100 () ValueCell!3848)

(declare-fun mapKey!14100 () (_ BitVec 32))

(assert (=> mapNonEmpty!14100 (= (arr!9639 _values!1277) (store mapRest!14100 mapKey!14100 mapValue!14100))))

(declare-fun b!361455 () Bool)

(assert (=> b!361455 (= e!221353 tp_is_empty!8383)))

(assert (= (and start!35976 res!201096) b!361452))

(assert (= (and b!361452 res!201098) b!361454))

(assert (= (and b!361454 res!201097) b!361453))

(assert (= (and b!361450 condMapEmpty!14100) mapIsEmpty!14100))

(assert (= (and b!361450 (not condMapEmpty!14100)) mapNonEmpty!14100))

(get-info :version)

(assert (= (and mapNonEmpty!14100 ((_ is ValueCellFull!3848) mapValue!14100)) b!361451))

(assert (= (and b!361450 ((_ is ValueCellFull!3848) mapDefault!14100)) b!361455))

(assert (= start!35976 b!361450))

(declare-fun m!358533 () Bool)

(assert (=> b!361453 m!358533))

(declare-fun m!358535 () Bool)

(assert (=> b!361454 m!358535))

(declare-fun m!358537 () Bool)

(assert (=> start!35976 m!358537))

(declare-fun m!358539 () Bool)

(assert (=> start!35976 m!358539))

(declare-fun m!358541 () Bool)

(assert (=> start!35976 m!358541))

(declare-fun m!358543 () Bool)

(assert (=> mapNonEmpty!14100 m!358543))

(check-sat (not mapNonEmpty!14100) (not start!35976) (not b!361454) tp_is_empty!8383 (not b!361453))
(check-sat)
