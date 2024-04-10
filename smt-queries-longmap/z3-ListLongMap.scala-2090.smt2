; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35710 () Bool)

(assert start!35710)

(declare-fun mapNonEmpty!13752 () Bool)

(declare-fun mapRes!13752 () Bool)

(declare-fun tp!27810 () Bool)

(declare-fun e!219602 () Bool)

(assert (=> mapNonEmpty!13752 (= mapRes!13752 (and tp!27810 e!219602))))

(declare-datatypes ((V!11861 0))(
  ( (V!11862 (val!4126 Int)) )
))
(declare-datatypes ((ValueCell!3738 0))(
  ( (ValueCellFull!3738 (v!6320 V!11861)) (EmptyCell!3738) )
))
(declare-fun mapRest!13752 () (Array (_ BitVec 32) ValueCell!3738))

(declare-fun mapKey!13752 () (_ BitVec 32))

(declare-fun mapValue!13752 () ValueCell!3738)

(declare-datatypes ((array!19891 0))(
  ( (array!19892 (arr!9439 (Array (_ BitVec 32) ValueCell!3738)) (size!9791 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19891)

(assert (=> mapNonEmpty!13752 (= (arr!9439 _values!1208) (store mapRest!13752 mapKey!13752 mapValue!13752))))

(declare-fun b!358679 () Bool)

(declare-fun e!219600 () Bool)

(assert (=> b!358679 (= e!219600 false)))

(declare-fun lt!166232 () Bool)

(declare-datatypes ((array!19893 0))(
  ( (array!19894 (arr!9440 (Array (_ BitVec 32) (_ BitVec 64))) (size!9792 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19893)

(declare-datatypes ((List!5440 0))(
  ( (Nil!5437) (Cons!5436 (h!6292 (_ BitVec 64)) (t!10590 List!5440)) )
))
(declare-fun arrayNoDuplicates!0 (array!19893 (_ BitVec 32) List!5440) Bool)

(assert (=> b!358679 (= lt!166232 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5437))))

(declare-fun b!358680 () Bool)

(declare-fun res!199350 () Bool)

(assert (=> b!358680 (=> (not res!199350) (not e!219600))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!358680 (= res!199350 (and (= (size!9791 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9792 _keys!1456) (size!9791 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13752 () Bool)

(assert (=> mapIsEmpty!13752 mapRes!13752))

(declare-fun b!358681 () Bool)

(declare-fun tp_is_empty!8163 () Bool)

(assert (=> b!358681 (= e!219602 tp_is_empty!8163)))

(declare-fun b!358682 () Bool)

(declare-fun e!219598 () Bool)

(assert (=> b!358682 (= e!219598 tp_is_empty!8163)))

(declare-fun b!358683 () Bool)

(declare-fun res!199349 () Bool)

(assert (=> b!358683 (=> (not res!199349) (not e!219600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19893 (_ BitVec 32)) Bool)

(assert (=> b!358683 (= res!199349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358684 () Bool)

(declare-fun e!219601 () Bool)

(assert (=> b!358684 (= e!219601 (and e!219598 mapRes!13752))))

(declare-fun condMapEmpty!13752 () Bool)

(declare-fun mapDefault!13752 () ValueCell!3738)

(assert (=> b!358684 (= condMapEmpty!13752 (= (arr!9439 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3738)) mapDefault!13752)))))

(declare-fun res!199351 () Bool)

(assert (=> start!35710 (=> (not res!199351) (not e!219600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35710 (= res!199351 (validMask!0 mask!1842))))

(assert (=> start!35710 e!219600))

(assert (=> start!35710 true))

(declare-fun array_inv!6942 (array!19891) Bool)

(assert (=> start!35710 (and (array_inv!6942 _values!1208) e!219601)))

(declare-fun array_inv!6943 (array!19893) Bool)

(assert (=> start!35710 (array_inv!6943 _keys!1456)))

(assert (= (and start!35710 res!199351) b!358680))

(assert (= (and b!358680 res!199350) b!358683))

(assert (= (and b!358683 res!199349) b!358679))

(assert (= (and b!358684 condMapEmpty!13752) mapIsEmpty!13752))

(assert (= (and b!358684 (not condMapEmpty!13752)) mapNonEmpty!13752))

(get-info :version)

(assert (= (and mapNonEmpty!13752 ((_ is ValueCellFull!3738) mapValue!13752)) b!358681))

(assert (= (and b!358684 ((_ is ValueCellFull!3738) mapDefault!13752)) b!358682))

(assert (= start!35710 b!358684))

(declare-fun m!356431 () Bool)

(assert (=> mapNonEmpty!13752 m!356431))

(declare-fun m!356433 () Bool)

(assert (=> b!358679 m!356433))

(declare-fun m!356435 () Bool)

(assert (=> b!358683 m!356435))

(declare-fun m!356437 () Bool)

(assert (=> start!35710 m!356437))

(declare-fun m!356439 () Bool)

(assert (=> start!35710 m!356439))

(declare-fun m!356441 () Bool)

(assert (=> start!35710 m!356441))

(check-sat (not mapNonEmpty!13752) (not b!358679) (not b!358683) (not start!35710) tp_is_empty!8163)
(check-sat)
