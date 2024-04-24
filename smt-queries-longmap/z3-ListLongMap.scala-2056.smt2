; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35490 () Bool)

(assert start!35490)

(declare-fun b!355756 () Bool)

(declare-fun e!217942 () Bool)

(declare-fun tp_is_empty!7957 () Bool)

(assert (=> b!355756 (= e!217942 tp_is_empty!7957)))

(declare-fun b!355757 () Bool)

(declare-fun e!217940 () Bool)

(assert (=> b!355757 (= e!217940 tp_is_empty!7957)))

(declare-fun mapNonEmpty!13443 () Bool)

(declare-fun mapRes!13443 () Bool)

(declare-fun tp!27420 () Bool)

(assert (=> mapNonEmpty!13443 (= mapRes!13443 (and tp!27420 e!217942))))

(declare-fun mapKey!13443 () (_ BitVec 32))

(declare-datatypes ((V!11587 0))(
  ( (V!11588 (val!4023 Int)) )
))
(declare-datatypes ((ValueCell!3635 0))(
  ( (ValueCellFull!3635 (v!6218 V!11587)) (EmptyCell!3635) )
))
(declare-datatypes ((array!19476 0))(
  ( (array!19477 (arr!9231 (Array (_ BitVec 32) ValueCell!3635)) (size!9583 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19476)

(declare-fun mapValue!13443 () ValueCell!3635)

(declare-fun mapRest!13443 () (Array (_ BitVec 32) ValueCell!3635))

(assert (=> mapNonEmpty!13443 (= (arr!9231 _values!1208) (store mapRest!13443 mapKey!13443 mapValue!13443))))

(declare-fun b!355758 () Bool)

(declare-fun e!217941 () Bool)

(assert (=> b!355758 (= e!217941 (and e!217940 mapRes!13443))))

(declare-fun condMapEmpty!13443 () Bool)

(declare-fun mapDefault!13443 () ValueCell!3635)

(assert (=> b!355758 (= condMapEmpty!13443 (= (arr!9231 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3635)) mapDefault!13443)))))

(declare-fun b!355759 () Bool)

(declare-fun e!217938 () Bool)

(assert (=> b!355759 (= e!217938 false)))

(declare-fun lt!165869 () Bool)

(declare-datatypes ((array!19478 0))(
  ( (array!19479 (arr!9232 (Array (_ BitVec 32) (_ BitVec 64))) (size!9584 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19478)

(declare-datatypes ((List!5256 0))(
  ( (Nil!5253) (Cons!5252 (h!6108 (_ BitVec 64)) (t!10398 List!5256)) )
))
(declare-fun arrayNoDuplicates!0 (array!19478 (_ BitVec 32) List!5256) Bool)

(assert (=> b!355759 (= lt!165869 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5253))))

(declare-fun b!355760 () Bool)

(declare-fun res!197404 () Bool)

(assert (=> b!355760 (=> (not res!197404) (not e!217938))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19478 (_ BitVec 32)) Bool)

(assert (=> b!355760 (= res!197404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13443 () Bool)

(assert (=> mapIsEmpty!13443 mapRes!13443))

(declare-fun res!197402 () Bool)

(assert (=> start!35490 (=> (not res!197402) (not e!217938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35490 (= res!197402 (validMask!0 mask!1842))))

(assert (=> start!35490 e!217938))

(assert (=> start!35490 true))

(declare-fun array_inv!6824 (array!19476) Bool)

(assert (=> start!35490 (and (array_inv!6824 _values!1208) e!217941)))

(declare-fun array_inv!6825 (array!19478) Bool)

(assert (=> start!35490 (array_inv!6825 _keys!1456)))

(declare-fun b!355755 () Bool)

(declare-fun res!197403 () Bool)

(assert (=> b!355755 (=> (not res!197403) (not e!217938))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355755 (= res!197403 (and (= (size!9583 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9584 _keys!1456) (size!9583 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35490 res!197402) b!355755))

(assert (= (and b!355755 res!197403) b!355760))

(assert (= (and b!355760 res!197404) b!355759))

(assert (= (and b!355758 condMapEmpty!13443) mapIsEmpty!13443))

(assert (= (and b!355758 (not condMapEmpty!13443)) mapNonEmpty!13443))

(get-info :version)

(assert (= (and mapNonEmpty!13443 ((_ is ValueCellFull!3635) mapValue!13443)) b!355756))

(assert (= (and b!355758 ((_ is ValueCellFull!3635) mapDefault!13443)) b!355757))

(assert (= start!35490 b!355758))

(declare-fun m!354645 () Bool)

(assert (=> mapNonEmpty!13443 m!354645))

(declare-fun m!354647 () Bool)

(assert (=> b!355759 m!354647))

(declare-fun m!354649 () Bool)

(assert (=> b!355760 m!354649))

(declare-fun m!354651 () Bool)

(assert (=> start!35490 m!354651))

(declare-fun m!354653 () Bool)

(assert (=> start!35490 m!354653))

(declare-fun m!354655 () Bool)

(assert (=> start!35490 m!354655))

(check-sat (not start!35490) (not b!355759) tp_is_empty!7957 (not b!355760) (not mapNonEmpty!13443))
(check-sat)
