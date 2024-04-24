; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35730 () Bool)

(assert start!35730)

(declare-fun res!199600 () Bool)

(declare-fun e!219819 () Bool)

(assert (=> start!35730 (=> (not res!199600) (not e!219819))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35730 (= res!199600 (validMask!0 mask!1842))))

(assert (=> start!35730 e!219819))

(assert (=> start!35730 true))

(declare-datatypes ((V!11907 0))(
  ( (V!11908 (val!4143 Int)) )
))
(declare-datatypes ((ValueCell!3755 0))(
  ( (ValueCellFull!3755 (v!6338 V!11907)) (EmptyCell!3755) )
))
(declare-datatypes ((array!19932 0))(
  ( (array!19933 (arr!9459 (Array (_ BitVec 32) ValueCell!3755)) (size!9811 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19932)

(declare-fun e!219820 () Bool)

(declare-fun array_inv!6992 (array!19932) Bool)

(assert (=> start!35730 (and (array_inv!6992 _values!1208) e!219820)))

(declare-datatypes ((array!19934 0))(
  ( (array!19935 (arr!9460 (Array (_ BitVec 32) (_ BitVec 64))) (size!9812 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19934)

(declare-fun array_inv!6993 (array!19934) Bool)

(assert (=> start!35730 (array_inv!6993 _keys!1456)))

(declare-fun b!359031 () Bool)

(declare-fun e!219822 () Bool)

(declare-fun tp_is_empty!8197 () Bool)

(assert (=> b!359031 (= e!219822 tp_is_empty!8197)))

(declare-fun mapNonEmpty!13803 () Bool)

(declare-fun mapRes!13803 () Bool)

(declare-fun tp!27870 () Bool)

(declare-fun e!219823 () Bool)

(assert (=> mapNonEmpty!13803 (= mapRes!13803 (and tp!27870 e!219823))))

(declare-fun mapRest!13803 () (Array (_ BitVec 32) ValueCell!3755))

(declare-fun mapValue!13803 () ValueCell!3755)

(declare-fun mapKey!13803 () (_ BitVec 32))

(assert (=> mapNonEmpty!13803 (= (arr!9459 _values!1208) (store mapRest!13803 mapKey!13803 mapValue!13803))))

(declare-fun b!359032 () Bool)

(assert (=> b!359032 (= e!219819 false)))

(declare-fun lt!166301 () Bool)

(declare-datatypes ((List!5363 0))(
  ( (Nil!5360) (Cons!5359 (h!6215 (_ BitVec 64)) (t!10505 List!5363)) )
))
(declare-fun arrayNoDuplicates!0 (array!19934 (_ BitVec 32) List!5363) Bool)

(assert (=> b!359032 (= lt!166301 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5360))))

(declare-fun mapIsEmpty!13803 () Bool)

(assert (=> mapIsEmpty!13803 mapRes!13803))

(declare-fun b!359033 () Bool)

(declare-fun res!199599 () Bool)

(assert (=> b!359033 (=> (not res!199599) (not e!219819))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359033 (= res!199599 (and (= (size!9811 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9812 _keys!1456) (size!9811 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359034 () Bool)

(declare-fun res!199598 () Bool)

(assert (=> b!359034 (=> (not res!199598) (not e!219819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19934 (_ BitVec 32)) Bool)

(assert (=> b!359034 (= res!199598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359035 () Bool)

(assert (=> b!359035 (= e!219823 tp_is_empty!8197)))

(declare-fun b!359036 () Bool)

(assert (=> b!359036 (= e!219820 (and e!219822 mapRes!13803))))

(declare-fun condMapEmpty!13803 () Bool)

(declare-fun mapDefault!13803 () ValueCell!3755)

(assert (=> b!359036 (= condMapEmpty!13803 (= (arr!9459 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3755)) mapDefault!13803)))))

(assert (= (and start!35730 res!199600) b!359033))

(assert (= (and b!359033 res!199599) b!359034))

(assert (= (and b!359034 res!199598) b!359032))

(assert (= (and b!359036 condMapEmpty!13803) mapIsEmpty!13803))

(assert (= (and b!359036 (not condMapEmpty!13803)) mapNonEmpty!13803))

(get-info :version)

(assert (= (and mapNonEmpty!13803 ((_ is ValueCellFull!3755) mapValue!13803)) b!359035))

(assert (= (and b!359036 ((_ is ValueCellFull!3755) mapDefault!13803)) b!359031))

(assert (= start!35730 b!359036))

(declare-fun m!356931 () Bool)

(assert (=> start!35730 m!356931))

(declare-fun m!356933 () Bool)

(assert (=> start!35730 m!356933))

(declare-fun m!356935 () Bool)

(assert (=> start!35730 m!356935))

(declare-fun m!356937 () Bool)

(assert (=> mapNonEmpty!13803 m!356937))

(declare-fun m!356939 () Bool)

(assert (=> b!359032 m!356939))

(declare-fun m!356941 () Bool)

(assert (=> b!359034 m!356941))

(check-sat (not b!359034) (not b!359032) (not mapNonEmpty!13803) (not start!35730) tp_is_empty!8197)
(check-sat)
