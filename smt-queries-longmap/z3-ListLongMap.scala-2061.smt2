; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35520 () Bool)

(assert start!35520)

(declare-fun b!355803 () Bool)

(declare-fun e!218024 () Bool)

(declare-fun tp_is_empty!7987 () Bool)

(assert (=> b!355803 (= e!218024 tp_is_empty!7987)))

(declare-fun mapIsEmpty!13488 () Bool)

(declare-fun mapRes!13488 () Bool)

(assert (=> mapIsEmpty!13488 mapRes!13488))

(declare-fun b!355804 () Bool)

(declare-fun res!197411 () Bool)

(declare-fun e!218021 () Bool)

(assert (=> b!355804 (=> (not res!197411) (not e!218021))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19535 0))(
  ( (array!19536 (arr!9261 (Array (_ BitVec 32) (_ BitVec 64))) (size!9614 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19535)

(declare-datatypes ((V!11627 0))(
  ( (V!11628 (val!4038 Int)) )
))
(declare-datatypes ((ValueCell!3650 0))(
  ( (ValueCellFull!3650 (v!6226 V!11627)) (EmptyCell!3650) )
))
(declare-datatypes ((array!19537 0))(
  ( (array!19538 (arr!9262 (Array (_ BitVec 32) ValueCell!3650)) (size!9615 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19537)

(assert (=> b!355804 (= res!197411 (and (= (size!9615 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9614 _keys!1456) (size!9615 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355805 () Bool)

(declare-fun e!218023 () Bool)

(assert (=> b!355805 (= e!218023 (and e!218024 mapRes!13488))))

(declare-fun condMapEmpty!13488 () Bool)

(declare-fun mapDefault!13488 () ValueCell!3650)

(assert (=> b!355805 (= condMapEmpty!13488 (= (arr!9262 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3650)) mapDefault!13488)))))

(declare-fun res!197412 () Bool)

(assert (=> start!35520 (=> (not res!197412) (not e!218021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35520 (= res!197412 (validMask!0 mask!1842))))

(assert (=> start!35520 e!218021))

(assert (=> start!35520 true))

(declare-fun array_inv!6848 (array!19537) Bool)

(assert (=> start!35520 (and (array_inv!6848 _values!1208) e!218023)))

(declare-fun array_inv!6849 (array!19535) Bool)

(assert (=> start!35520 (array_inv!6849 _keys!1456)))

(declare-fun b!355806 () Bool)

(assert (=> b!355806 (= e!218021 false)))

(declare-fun lt!165661 () Bool)

(declare-datatypes ((List!5329 0))(
  ( (Nil!5326) (Cons!5325 (h!6181 (_ BitVec 64)) (t!10470 List!5329)) )
))
(declare-fun arrayNoDuplicates!0 (array!19535 (_ BitVec 32) List!5329) Bool)

(assert (=> b!355806 (= lt!165661 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5326))))

(declare-fun b!355807 () Bool)

(declare-fun e!218022 () Bool)

(assert (=> b!355807 (= e!218022 tp_is_empty!7987)))

(declare-fun b!355808 () Bool)

(declare-fun res!197413 () Bool)

(assert (=> b!355808 (=> (not res!197413) (not e!218021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19535 (_ BitVec 32)) Bool)

(assert (=> b!355808 (= res!197413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13488 () Bool)

(declare-fun tp!27465 () Bool)

(assert (=> mapNonEmpty!13488 (= mapRes!13488 (and tp!27465 e!218022))))

(declare-fun mapValue!13488 () ValueCell!3650)

(declare-fun mapRest!13488 () (Array (_ BitVec 32) ValueCell!3650))

(declare-fun mapKey!13488 () (_ BitVec 32))

(assert (=> mapNonEmpty!13488 (= (arr!9262 _values!1208) (store mapRest!13488 mapKey!13488 mapValue!13488))))

(assert (= (and start!35520 res!197412) b!355804))

(assert (= (and b!355804 res!197411) b!355808))

(assert (= (and b!355808 res!197413) b!355806))

(assert (= (and b!355805 condMapEmpty!13488) mapIsEmpty!13488))

(assert (= (and b!355805 (not condMapEmpty!13488)) mapNonEmpty!13488))

(get-info :version)

(assert (= (and mapNonEmpty!13488 ((_ is ValueCellFull!3650) mapValue!13488)) b!355807))

(assert (= (and b!355805 ((_ is ValueCellFull!3650) mapDefault!13488)) b!355803))

(assert (= start!35520 b!355805))

(declare-fun m!353871 () Bool)

(assert (=> start!35520 m!353871))

(declare-fun m!353873 () Bool)

(assert (=> start!35520 m!353873))

(declare-fun m!353875 () Bool)

(assert (=> start!35520 m!353875))

(declare-fun m!353877 () Bool)

(assert (=> b!355806 m!353877))

(declare-fun m!353879 () Bool)

(assert (=> b!355808 m!353879))

(declare-fun m!353881 () Bool)

(assert (=> mapNonEmpty!13488 m!353881))

(check-sat tp_is_empty!7987 (not b!355808) (not b!355806) (not mapNonEmpty!13488) (not start!35520))
(check-sat)
