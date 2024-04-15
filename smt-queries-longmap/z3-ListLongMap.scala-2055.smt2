; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35484 () Bool)

(assert start!35484)

(declare-fun b!355479 () Bool)

(declare-fun e!217752 () Bool)

(declare-fun tp_is_empty!7951 () Bool)

(assert (=> b!355479 (= e!217752 tp_is_empty!7951)))

(declare-fun b!355480 () Bool)

(declare-fun res!197249 () Bool)

(declare-fun e!217753 () Bool)

(assert (=> b!355480 (=> (not res!197249) (not e!217753))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19463 0))(
  ( (array!19464 (arr!9225 (Array (_ BitVec 32) (_ BitVec 64))) (size!9578 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19463)

(declare-datatypes ((V!11579 0))(
  ( (V!11580 (val!4020 Int)) )
))
(declare-datatypes ((ValueCell!3632 0))(
  ( (ValueCellFull!3632 (v!6208 V!11579)) (EmptyCell!3632) )
))
(declare-datatypes ((array!19465 0))(
  ( (array!19466 (arr!9226 (Array (_ BitVec 32) ValueCell!3632)) (size!9579 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19465)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355480 (= res!197249 (and (= (size!9579 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9578 _keys!1456) (size!9579 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355481 () Bool)

(declare-fun res!197251 () Bool)

(assert (=> b!355481 (=> (not res!197251) (not e!217753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19463 (_ BitVec 32)) Bool)

(assert (=> b!355481 (= res!197251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355482 () Bool)

(assert (=> b!355482 (= e!217753 false)))

(declare-fun lt!165607 () Bool)

(declare-datatypes ((List!5317 0))(
  ( (Nil!5314) (Cons!5313 (h!6169 (_ BitVec 64)) (t!10458 List!5317)) )
))
(declare-fun arrayNoDuplicates!0 (array!19463 (_ BitVec 32) List!5317) Bool)

(assert (=> b!355482 (= lt!165607 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5314))))

(declare-fun b!355483 () Bool)

(declare-fun e!217754 () Bool)

(assert (=> b!355483 (= e!217754 tp_is_empty!7951)))

(declare-fun mapNonEmpty!13434 () Bool)

(declare-fun mapRes!13434 () Bool)

(declare-fun tp!27411 () Bool)

(assert (=> mapNonEmpty!13434 (= mapRes!13434 (and tp!27411 e!217752))))

(declare-fun mapKey!13434 () (_ BitVec 32))

(declare-fun mapRest!13434 () (Array (_ BitVec 32) ValueCell!3632))

(declare-fun mapValue!13434 () ValueCell!3632)

(assert (=> mapNonEmpty!13434 (= (arr!9226 _values!1208) (store mapRest!13434 mapKey!13434 mapValue!13434))))

(declare-fun b!355484 () Bool)

(declare-fun e!217751 () Bool)

(assert (=> b!355484 (= e!217751 (and e!217754 mapRes!13434))))

(declare-fun condMapEmpty!13434 () Bool)

(declare-fun mapDefault!13434 () ValueCell!3632)

(assert (=> b!355484 (= condMapEmpty!13434 (= (arr!9226 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3632)) mapDefault!13434)))))

(declare-fun res!197250 () Bool)

(assert (=> start!35484 (=> (not res!197250) (not e!217753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35484 (= res!197250 (validMask!0 mask!1842))))

(assert (=> start!35484 e!217753))

(assert (=> start!35484 true))

(declare-fun array_inv!6824 (array!19465) Bool)

(assert (=> start!35484 (and (array_inv!6824 _values!1208) e!217751)))

(declare-fun array_inv!6825 (array!19463) Bool)

(assert (=> start!35484 (array_inv!6825 _keys!1456)))

(declare-fun mapIsEmpty!13434 () Bool)

(assert (=> mapIsEmpty!13434 mapRes!13434))

(assert (= (and start!35484 res!197250) b!355480))

(assert (= (and b!355480 res!197249) b!355481))

(assert (= (and b!355481 res!197251) b!355482))

(assert (= (and b!355484 condMapEmpty!13434) mapIsEmpty!13434))

(assert (= (and b!355484 (not condMapEmpty!13434)) mapNonEmpty!13434))

(get-info :version)

(assert (= (and mapNonEmpty!13434 ((_ is ValueCellFull!3632) mapValue!13434)) b!355479))

(assert (= (and b!355484 ((_ is ValueCellFull!3632) mapDefault!13434)) b!355483))

(assert (= start!35484 b!355484))

(declare-fun m!353655 () Bool)

(assert (=> b!355481 m!353655))

(declare-fun m!353657 () Bool)

(assert (=> b!355482 m!353657))

(declare-fun m!353659 () Bool)

(assert (=> mapNonEmpty!13434 m!353659))

(declare-fun m!353661 () Bool)

(assert (=> start!35484 m!353661))

(declare-fun m!353663 () Bool)

(assert (=> start!35484 m!353663))

(declare-fun m!353665 () Bool)

(assert (=> start!35484 m!353665))

(check-sat tp_is_empty!7951 (not b!355482) (not start!35484) (not b!355481) (not mapNonEmpty!13434))
(check-sat)
