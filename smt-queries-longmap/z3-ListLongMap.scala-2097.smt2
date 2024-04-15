; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35736 () Bool)

(assert start!35736)

(declare-fun b!358863 () Bool)

(declare-fun e!219724 () Bool)

(declare-fun e!219725 () Bool)

(declare-fun mapRes!13812 () Bool)

(assert (=> b!358863 (= e!219724 (and e!219725 mapRes!13812))))

(declare-fun condMapEmpty!13812 () Bool)

(declare-datatypes ((V!11915 0))(
  ( (V!11916 (val!4146 Int)) )
))
(declare-datatypes ((ValueCell!3758 0))(
  ( (ValueCellFull!3758 (v!6334 V!11915)) (EmptyCell!3758) )
))
(declare-datatypes ((array!19943 0))(
  ( (array!19944 (arr!9465 (Array (_ BitVec 32) ValueCell!3758)) (size!9818 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19943)

(declare-fun mapDefault!13812 () ValueCell!3758)

(assert (=> b!358863 (= condMapEmpty!13812 (= (arr!9465 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3758)) mapDefault!13812)))))

(declare-fun res!199499 () Bool)

(declare-fun e!219726 () Bool)

(assert (=> start!35736 (=> (not res!199499) (not e!219726))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35736 (= res!199499 (validMask!0 mask!1842))))

(assert (=> start!35736 e!219726))

(assert (=> start!35736 true))

(declare-fun array_inv!6986 (array!19943) Bool)

(assert (=> start!35736 (and (array_inv!6986 _values!1208) e!219724)))

(declare-datatypes ((array!19945 0))(
  ( (array!19946 (arr!9466 (Array (_ BitVec 32) (_ BitVec 64))) (size!9819 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19945)

(declare-fun array_inv!6987 (array!19945) Bool)

(assert (=> start!35736 (array_inv!6987 _keys!1456)))

(declare-fun b!358864 () Bool)

(declare-fun tp_is_empty!8203 () Bool)

(assert (=> b!358864 (= e!219725 tp_is_empty!8203)))

(declare-fun b!358865 () Bool)

(assert (=> b!358865 (= e!219726 false)))

(declare-fun lt!166057 () Bool)

(declare-datatypes ((List!5419 0))(
  ( (Nil!5416) (Cons!5415 (h!6271 (_ BitVec 64)) (t!10560 List!5419)) )
))
(declare-fun arrayNoDuplicates!0 (array!19945 (_ BitVec 32) List!5419) Bool)

(assert (=> b!358865 (= lt!166057 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5416))))

(declare-fun b!358866 () Bool)

(declare-fun res!199500 () Bool)

(assert (=> b!358866 (=> (not res!199500) (not e!219726))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358866 (= res!199500 (and (= (size!9818 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9819 _keys!1456) (size!9818 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358867 () Bool)

(declare-fun e!219722 () Bool)

(assert (=> b!358867 (= e!219722 tp_is_empty!8203)))

(declare-fun b!358868 () Bool)

(declare-fun res!199501 () Bool)

(assert (=> b!358868 (=> (not res!199501) (not e!219726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19945 (_ BitVec 32)) Bool)

(assert (=> b!358868 (= res!199501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13812 () Bool)

(declare-fun tp!27879 () Bool)

(assert (=> mapNonEmpty!13812 (= mapRes!13812 (and tp!27879 e!219722))))

(declare-fun mapValue!13812 () ValueCell!3758)

(declare-fun mapKey!13812 () (_ BitVec 32))

(declare-fun mapRest!13812 () (Array (_ BitVec 32) ValueCell!3758))

(assert (=> mapNonEmpty!13812 (= (arr!9465 _values!1208) (store mapRest!13812 mapKey!13812 mapValue!13812))))

(declare-fun mapIsEmpty!13812 () Bool)

(assert (=> mapIsEmpty!13812 mapRes!13812))

(assert (= (and start!35736 res!199499) b!358866))

(assert (= (and b!358866 res!199500) b!358868))

(assert (= (and b!358868 res!199501) b!358865))

(assert (= (and b!358863 condMapEmpty!13812) mapIsEmpty!13812))

(assert (= (and b!358863 (not condMapEmpty!13812)) mapNonEmpty!13812))

(get-info :version)

(assert (= (and mapNonEmpty!13812 ((_ is ValueCellFull!3758) mapValue!13812)) b!358867))

(assert (= (and b!358863 ((_ is ValueCellFull!3758) mapDefault!13812)) b!358864))

(assert (= start!35736 b!358863))

(declare-fun m!356013 () Bool)

(assert (=> start!35736 m!356013))

(declare-fun m!356015 () Bool)

(assert (=> start!35736 m!356015))

(declare-fun m!356017 () Bool)

(assert (=> start!35736 m!356017))

(declare-fun m!356019 () Bool)

(assert (=> b!358865 m!356019))

(declare-fun m!356021 () Bool)

(assert (=> b!358868 m!356021))

(declare-fun m!356023 () Bool)

(assert (=> mapNonEmpty!13812 m!356023))

(check-sat (not b!358868) (not start!35736) tp_is_empty!8203 (not mapNonEmpty!13812) (not b!358865))
(check-sat)
