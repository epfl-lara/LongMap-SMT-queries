; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35782 () Bool)

(assert start!35782)

(declare-fun b!359426 () Bool)

(declare-fun res!199774 () Bool)

(declare-fun e!220142 () Bool)

(assert (=> b!359426 (=> (not res!199774) (not e!220142))))

(declare-datatypes ((array!20027 0))(
  ( (array!20028 (arr!9507 (Array (_ BitVec 32) (_ BitVec 64))) (size!9859 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20027)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20027 (_ BitVec 32)) Bool)

(assert (=> b!359426 (= res!199774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199773 () Bool)

(assert (=> start!35782 (=> (not res!199773) (not e!220142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35782 (= res!199773 (validMask!0 mask!1842))))

(assert (=> start!35782 e!220142))

(assert (=> start!35782 true))

(declare-datatypes ((V!11957 0))(
  ( (V!11958 (val!4162 Int)) )
))
(declare-datatypes ((ValueCell!3774 0))(
  ( (ValueCellFull!3774 (v!6356 V!11957)) (EmptyCell!3774) )
))
(declare-datatypes ((array!20029 0))(
  ( (array!20030 (arr!9508 (Array (_ BitVec 32) ValueCell!3774)) (size!9860 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20029)

(declare-fun e!220140 () Bool)

(declare-fun array_inv!6992 (array!20029) Bool)

(assert (=> start!35782 (and (array_inv!6992 _values!1208) e!220140)))

(declare-fun array_inv!6993 (array!20027) Bool)

(assert (=> start!35782 (array_inv!6993 _keys!1456)))

(declare-fun b!359427 () Bool)

(declare-fun e!220139 () Bool)

(declare-fun tp_is_empty!8235 () Bool)

(assert (=> b!359427 (= e!220139 tp_is_empty!8235)))

(declare-fun b!359428 () Bool)

(assert (=> b!359428 (= e!220142 false)))

(declare-fun lt!166340 () Bool)

(declare-datatypes ((List!5467 0))(
  ( (Nil!5464) (Cons!5463 (h!6319 (_ BitVec 64)) (t!10617 List!5467)) )
))
(declare-fun arrayNoDuplicates!0 (array!20027 (_ BitVec 32) List!5467) Bool)

(assert (=> b!359428 (= lt!166340 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5464))))

(declare-fun mapIsEmpty!13860 () Bool)

(declare-fun mapRes!13860 () Bool)

(assert (=> mapIsEmpty!13860 mapRes!13860))

(declare-fun b!359429 () Bool)

(declare-fun res!199772 () Bool)

(assert (=> b!359429 (=> (not res!199772) (not e!220142))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359429 (= res!199772 (and (= (size!9860 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9859 _keys!1456) (size!9860 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13860 () Bool)

(declare-fun tp!27927 () Bool)

(declare-fun e!220138 () Bool)

(assert (=> mapNonEmpty!13860 (= mapRes!13860 (and tp!27927 e!220138))))

(declare-fun mapRest!13860 () (Array (_ BitVec 32) ValueCell!3774))

(declare-fun mapValue!13860 () ValueCell!3774)

(declare-fun mapKey!13860 () (_ BitVec 32))

(assert (=> mapNonEmpty!13860 (= (arr!9508 _values!1208) (store mapRest!13860 mapKey!13860 mapValue!13860))))

(declare-fun b!359430 () Bool)

(assert (=> b!359430 (= e!220140 (and e!220139 mapRes!13860))))

(declare-fun condMapEmpty!13860 () Bool)

(declare-fun mapDefault!13860 () ValueCell!3774)

(assert (=> b!359430 (= condMapEmpty!13860 (= (arr!9508 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3774)) mapDefault!13860)))))

(declare-fun b!359431 () Bool)

(assert (=> b!359431 (= e!220138 tp_is_empty!8235)))

(assert (= (and start!35782 res!199773) b!359429))

(assert (= (and b!359429 res!199772) b!359426))

(assert (= (and b!359426 res!199774) b!359428))

(assert (= (and b!359430 condMapEmpty!13860) mapIsEmpty!13860))

(assert (= (and b!359430 (not condMapEmpty!13860)) mapNonEmpty!13860))

(get-info :version)

(assert (= (and mapNonEmpty!13860 ((_ is ValueCellFull!3774) mapValue!13860)) b!359431))

(assert (= (and b!359430 ((_ is ValueCellFull!3774) mapDefault!13860)) b!359427))

(assert (= start!35782 b!359430))

(declare-fun m!356935 () Bool)

(assert (=> b!359426 m!356935))

(declare-fun m!356937 () Bool)

(assert (=> start!35782 m!356937))

(declare-fun m!356939 () Bool)

(assert (=> start!35782 m!356939))

(declare-fun m!356941 () Bool)

(assert (=> start!35782 m!356941))

(declare-fun m!356943 () Bool)

(assert (=> b!359428 m!356943))

(declare-fun m!356945 () Bool)

(assert (=> mapNonEmpty!13860 m!356945))

(check-sat (not mapNonEmpty!13860) tp_is_empty!8235 (not b!359428) (not b!359426) (not start!35782))
(check-sat)
