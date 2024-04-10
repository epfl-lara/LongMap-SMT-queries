; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35752 () Bool)

(assert start!35752)

(declare-fun mapIsEmpty!13815 () Bool)

(declare-fun mapRes!13815 () Bool)

(assert (=> mapIsEmpty!13815 mapRes!13815))

(declare-fun res!199638 () Bool)

(declare-fun e!219913 () Bool)

(assert (=> start!35752 (=> (not res!199638) (not e!219913))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35752 (= res!199638 (validMask!0 mask!1842))))

(assert (=> start!35752 e!219913))

(assert (=> start!35752 true))

(declare-datatypes ((V!11917 0))(
  ( (V!11918 (val!4147 Int)) )
))
(declare-datatypes ((ValueCell!3759 0))(
  ( (ValueCellFull!3759 (v!6341 V!11917)) (EmptyCell!3759) )
))
(declare-datatypes ((array!19969 0))(
  ( (array!19970 (arr!9478 (Array (_ BitVec 32) ValueCell!3759)) (size!9830 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19969)

(declare-fun e!219917 () Bool)

(declare-fun array_inv!6976 (array!19969) Bool)

(assert (=> start!35752 (and (array_inv!6976 _values!1208) e!219917)))

(declare-datatypes ((array!19971 0))(
  ( (array!19972 (arr!9479 (Array (_ BitVec 32) (_ BitVec 64))) (size!9831 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19971)

(declare-fun array_inv!6977 (array!19971) Bool)

(assert (=> start!35752 (array_inv!6977 _keys!1456)))

(declare-fun b!359156 () Bool)

(declare-fun res!199639 () Bool)

(assert (=> b!359156 (=> (not res!199639) (not e!219913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19971 (_ BitVec 32)) Bool)

(assert (=> b!359156 (= res!199639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13815 () Bool)

(declare-fun tp!27882 () Bool)

(declare-fun e!219915 () Bool)

(assert (=> mapNonEmpty!13815 (= mapRes!13815 (and tp!27882 e!219915))))

(declare-fun mapKey!13815 () (_ BitVec 32))

(declare-fun mapValue!13815 () ValueCell!3759)

(declare-fun mapRest!13815 () (Array (_ BitVec 32) ValueCell!3759))

(assert (=> mapNonEmpty!13815 (= (arr!9478 _values!1208) (store mapRest!13815 mapKey!13815 mapValue!13815))))

(declare-fun b!359157 () Bool)

(declare-fun e!219914 () Bool)

(declare-fun tp_is_empty!8205 () Bool)

(assert (=> b!359157 (= e!219914 tp_is_empty!8205)))

(declare-fun b!359158 () Bool)

(assert (=> b!359158 (= e!219917 (and e!219914 mapRes!13815))))

(declare-fun condMapEmpty!13815 () Bool)

(declare-fun mapDefault!13815 () ValueCell!3759)

(assert (=> b!359158 (= condMapEmpty!13815 (= (arr!9478 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3759)) mapDefault!13815)))))

(declare-fun b!359159 () Bool)

(declare-fun res!199637 () Bool)

(assert (=> b!359159 (=> (not res!199637) (not e!219913))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359159 (= res!199637 (and (= (size!9830 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9831 _keys!1456) (size!9830 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359160 () Bool)

(assert (=> b!359160 (= e!219913 false)))

(declare-fun lt!166295 () Bool)

(declare-datatypes ((List!5458 0))(
  ( (Nil!5455) (Cons!5454 (h!6310 (_ BitVec 64)) (t!10608 List!5458)) )
))
(declare-fun arrayNoDuplicates!0 (array!19971 (_ BitVec 32) List!5458) Bool)

(assert (=> b!359160 (= lt!166295 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5455))))

(declare-fun b!359161 () Bool)

(assert (=> b!359161 (= e!219915 tp_is_empty!8205)))

(assert (= (and start!35752 res!199638) b!359159))

(assert (= (and b!359159 res!199637) b!359156))

(assert (= (and b!359156 res!199639) b!359160))

(assert (= (and b!359158 condMapEmpty!13815) mapIsEmpty!13815))

(assert (= (and b!359158 (not condMapEmpty!13815)) mapNonEmpty!13815))

(get-info :version)

(assert (= (and mapNonEmpty!13815 ((_ is ValueCellFull!3759) mapValue!13815)) b!359161))

(assert (= (and b!359158 ((_ is ValueCellFull!3759) mapDefault!13815)) b!359157))

(assert (= start!35752 b!359158))

(declare-fun m!356755 () Bool)

(assert (=> start!35752 m!356755))

(declare-fun m!356757 () Bool)

(assert (=> start!35752 m!356757))

(declare-fun m!356759 () Bool)

(assert (=> start!35752 m!356759))

(declare-fun m!356761 () Bool)

(assert (=> b!359156 m!356761))

(declare-fun m!356763 () Bool)

(assert (=> mapNonEmpty!13815 m!356763))

(declare-fun m!356765 () Bool)

(assert (=> b!359160 m!356765))

(check-sat (not mapNonEmpty!13815) (not b!359156) (not b!359160) tp_is_empty!8205 (not start!35752))
(check-sat)
