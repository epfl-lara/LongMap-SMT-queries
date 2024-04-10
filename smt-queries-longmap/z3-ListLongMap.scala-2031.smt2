; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35344 () Bool)

(assert start!35344)

(declare-fun b!353937 () Bool)

(declare-fun e!216837 () Bool)

(assert (=> b!353937 (= e!216837 false)))

(declare-fun lt!165629 () Bool)

(declare-datatypes ((array!19211 0))(
  ( (array!19212 (arr!9100 (Array (_ BitVec 32) (_ BitVec 64))) (size!9452 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19211)

(declare-datatypes ((List!5284 0))(
  ( (Nil!5281) (Cons!5280 (h!6136 (_ BitVec 64)) (t!10434 List!5284)) )
))
(declare-fun arrayNoDuplicates!0 (array!19211 (_ BitVec 32) List!5284) Bool)

(assert (=> b!353937 (= lt!165629 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5281))))

(declare-fun mapIsEmpty!13218 () Bool)

(declare-fun mapRes!13218 () Bool)

(assert (=> mapIsEmpty!13218 mapRes!13218))

(declare-fun b!353938 () Bool)

(declare-fun e!216835 () Bool)

(declare-fun e!216838 () Bool)

(assert (=> b!353938 (= e!216835 (and e!216838 mapRes!13218))))

(declare-fun condMapEmpty!13218 () Bool)

(declare-datatypes ((V!11389 0))(
  ( (V!11390 (val!3949 Int)) )
))
(declare-datatypes ((ValueCell!3561 0))(
  ( (ValueCellFull!3561 (v!6143 V!11389)) (EmptyCell!3561) )
))
(declare-datatypes ((array!19213 0))(
  ( (array!19214 (arr!9101 (Array (_ BitVec 32) ValueCell!3561)) (size!9453 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19213)

(declare-fun mapDefault!13218 () ValueCell!3561)

(assert (=> b!353938 (= condMapEmpty!13218 (= (arr!9101 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3561)) mapDefault!13218)))))

(declare-fun mapNonEmpty!13218 () Bool)

(declare-fun tp!27114 () Bool)

(declare-fun e!216839 () Bool)

(assert (=> mapNonEmpty!13218 (= mapRes!13218 (and tp!27114 e!216839))))

(declare-fun mapValue!13218 () ValueCell!3561)

(declare-fun mapKey!13218 () (_ BitVec 32))

(declare-fun mapRest!13218 () (Array (_ BitVec 32) ValueCell!3561))

(assert (=> mapNonEmpty!13218 (= (arr!9101 _values!1208) (store mapRest!13218 mapKey!13218 mapValue!13218))))

(declare-fun res!196220 () Bool)

(assert (=> start!35344 (=> (not res!196220) (not e!216837))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35344 (= res!196220 (validMask!0 mask!1842))))

(assert (=> start!35344 e!216837))

(assert (=> start!35344 true))

(declare-fun array_inv!6698 (array!19213) Bool)

(assert (=> start!35344 (and (array_inv!6698 _values!1208) e!216835)))

(declare-fun array_inv!6699 (array!19211) Bool)

(assert (=> start!35344 (array_inv!6699 _keys!1456)))

(declare-fun b!353939 () Bool)

(declare-fun tp_is_empty!7809 () Bool)

(assert (=> b!353939 (= e!216838 tp_is_empty!7809)))

(declare-fun b!353940 () Bool)

(declare-fun res!196221 () Bool)

(assert (=> b!353940 (=> (not res!196221) (not e!216837))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353940 (= res!196221 (and (= (size!9453 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9452 _keys!1456) (size!9453 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353941 () Bool)

(declare-fun res!196222 () Bool)

(assert (=> b!353941 (=> (not res!196222) (not e!216837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19211 (_ BitVec 32)) Bool)

(assert (=> b!353941 (= res!196222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353942 () Bool)

(assert (=> b!353942 (= e!216839 tp_is_empty!7809)))

(assert (= (and start!35344 res!196220) b!353940))

(assert (= (and b!353940 res!196221) b!353941))

(assert (= (and b!353941 res!196222) b!353937))

(assert (= (and b!353938 condMapEmpty!13218) mapIsEmpty!13218))

(assert (= (and b!353938 (not condMapEmpty!13218)) mapNonEmpty!13218))

(get-info :version)

(assert (= (and mapNonEmpty!13218 ((_ is ValueCellFull!3561) mapValue!13218)) b!353942))

(assert (= (and b!353938 ((_ is ValueCellFull!3561) mapDefault!13218)) b!353939))

(assert (= start!35344 b!353938))

(declare-fun m!353131 () Bool)

(assert (=> b!353937 m!353131))

(declare-fun m!353133 () Bool)

(assert (=> mapNonEmpty!13218 m!353133))

(declare-fun m!353135 () Bool)

(assert (=> start!35344 m!353135))

(declare-fun m!353137 () Bool)

(assert (=> start!35344 m!353137))

(declare-fun m!353139 () Bool)

(assert (=> start!35344 m!353139))

(declare-fun m!353141 () Bool)

(assert (=> b!353941 m!353141))

(check-sat (not start!35344) (not b!353941) (not b!353937) tp_is_empty!7809 (not mapNonEmpty!13218))
(check-sat)
