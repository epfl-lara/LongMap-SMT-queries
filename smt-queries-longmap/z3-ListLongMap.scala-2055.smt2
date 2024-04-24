; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35484 () Bool)

(assert start!35484)

(declare-fun mapIsEmpty!13434 () Bool)

(declare-fun mapRes!13434 () Bool)

(assert (=> mapIsEmpty!13434 mapRes!13434))

(declare-fun b!355701 () Bool)

(declare-fun e!217894 () Bool)

(declare-fun tp_is_empty!7951 () Bool)

(assert (=> b!355701 (= e!217894 tp_is_empty!7951)))

(declare-fun mapNonEmpty!13434 () Bool)

(declare-fun tp!27411 () Bool)

(assert (=> mapNonEmpty!13434 (= mapRes!13434 (and tp!27411 e!217894))))

(declare-fun mapKey!13434 () (_ BitVec 32))

(declare-datatypes ((V!11579 0))(
  ( (V!11580 (val!4020 Int)) )
))
(declare-datatypes ((ValueCell!3632 0))(
  ( (ValueCellFull!3632 (v!6215 V!11579)) (EmptyCell!3632) )
))
(declare-fun mapValue!13434 () ValueCell!3632)

(declare-datatypes ((array!19466 0))(
  ( (array!19467 (arr!9226 (Array (_ BitVec 32) ValueCell!3632)) (size!9578 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19466)

(declare-fun mapRest!13434 () (Array (_ BitVec 32) ValueCell!3632))

(assert (=> mapNonEmpty!13434 (= (arr!9226 _values!1208) (store mapRest!13434 mapKey!13434 mapValue!13434))))

(declare-fun b!355703 () Bool)

(declare-fun res!197375 () Bool)

(declare-fun e!217895 () Bool)

(assert (=> b!355703 (=> (not res!197375) (not e!217895))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((array!19468 0))(
  ( (array!19469 (arr!9227 (Array (_ BitVec 32) (_ BitVec 64))) (size!9579 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19468)

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!355703 (= res!197375 (and (= (size!9578 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9579 _keys!1456) (size!9578 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355704 () Bool)

(declare-fun res!197376 () Bool)

(assert (=> b!355704 (=> (not res!197376) (not e!217895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19468 (_ BitVec 32)) Bool)

(assert (=> b!355704 (= res!197376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355702 () Bool)

(declare-fun e!217893 () Bool)

(assert (=> b!355702 (= e!217893 tp_is_empty!7951)))

(declare-fun res!197377 () Bool)

(assert (=> start!35484 (=> (not res!197377) (not e!217895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35484 (= res!197377 (validMask!0 mask!1842))))

(assert (=> start!35484 e!217895))

(assert (=> start!35484 true))

(declare-fun e!217896 () Bool)

(declare-fun array_inv!6820 (array!19466) Bool)

(assert (=> start!35484 (and (array_inv!6820 _values!1208) e!217896)))

(declare-fun array_inv!6821 (array!19468) Bool)

(assert (=> start!35484 (array_inv!6821 _keys!1456)))

(declare-fun b!355705 () Bool)

(assert (=> b!355705 (= e!217896 (and e!217893 mapRes!13434))))

(declare-fun condMapEmpty!13434 () Bool)

(declare-fun mapDefault!13434 () ValueCell!3632)

(assert (=> b!355705 (= condMapEmpty!13434 (= (arr!9226 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3632)) mapDefault!13434)))))

(declare-fun b!355706 () Bool)

(assert (=> b!355706 (= e!217895 false)))

(declare-fun lt!165860 () Bool)

(declare-datatypes ((List!5254 0))(
  ( (Nil!5251) (Cons!5250 (h!6106 (_ BitVec 64)) (t!10396 List!5254)) )
))
(declare-fun arrayNoDuplicates!0 (array!19468 (_ BitVec 32) List!5254) Bool)

(assert (=> b!355706 (= lt!165860 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5251))))

(assert (= (and start!35484 res!197377) b!355703))

(assert (= (and b!355703 res!197375) b!355704))

(assert (= (and b!355704 res!197376) b!355706))

(assert (= (and b!355705 condMapEmpty!13434) mapIsEmpty!13434))

(assert (= (and b!355705 (not condMapEmpty!13434)) mapNonEmpty!13434))

(get-info :version)

(assert (= (and mapNonEmpty!13434 ((_ is ValueCellFull!3632) mapValue!13434)) b!355701))

(assert (= (and b!355705 ((_ is ValueCellFull!3632) mapDefault!13434)) b!355702))

(assert (= start!35484 b!355705))

(declare-fun m!354609 () Bool)

(assert (=> mapNonEmpty!13434 m!354609))

(declare-fun m!354611 () Bool)

(assert (=> b!355704 m!354611))

(declare-fun m!354613 () Bool)

(assert (=> start!35484 m!354613))

(declare-fun m!354615 () Bool)

(assert (=> start!35484 m!354615))

(declare-fun m!354617 () Bool)

(assert (=> start!35484 m!354617))

(declare-fun m!354619 () Bool)

(assert (=> b!355706 m!354619))

(check-sat (not mapNonEmpty!13434) (not b!355706) tp_is_empty!7951 (not b!355704) (not start!35484))
(check-sat)
