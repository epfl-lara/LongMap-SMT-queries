; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35770 () Bool)

(assert start!35770)

(declare-fun res!199719 () Bool)

(declare-fun e!220052 () Bool)

(assert (=> start!35770 (=> (not res!199719) (not e!220052))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35770 (= res!199719 (validMask!0 mask!1842))))

(assert (=> start!35770 e!220052))

(assert (=> start!35770 true))

(declare-datatypes ((V!11941 0))(
  ( (V!11942 (val!4156 Int)) )
))
(declare-datatypes ((ValueCell!3768 0))(
  ( (ValueCellFull!3768 (v!6350 V!11941)) (EmptyCell!3768) )
))
(declare-datatypes ((array!20005 0))(
  ( (array!20006 (arr!9496 (Array (_ BitVec 32) ValueCell!3768)) (size!9848 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20005)

(declare-fun e!220051 () Bool)

(declare-fun array_inv!6986 (array!20005) Bool)

(assert (=> start!35770 (and (array_inv!6986 _values!1208) e!220051)))

(declare-datatypes ((array!20007 0))(
  ( (array!20008 (arr!9497 (Array (_ BitVec 32) (_ BitVec 64))) (size!9849 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20007)

(declare-fun array_inv!6987 (array!20007) Bool)

(assert (=> start!35770 (array_inv!6987 _keys!1456)))

(declare-fun b!359318 () Bool)

(declare-fun e!220048 () Bool)

(declare-fun tp_is_empty!8223 () Bool)

(assert (=> b!359318 (= e!220048 tp_is_empty!8223)))

(declare-fun b!359319 () Bool)

(declare-fun e!220050 () Bool)

(assert (=> b!359319 (= e!220050 tp_is_empty!8223)))

(declare-fun mapNonEmpty!13842 () Bool)

(declare-fun mapRes!13842 () Bool)

(declare-fun tp!27909 () Bool)

(assert (=> mapNonEmpty!13842 (= mapRes!13842 (and tp!27909 e!220050))))

(declare-fun mapKey!13842 () (_ BitVec 32))

(declare-fun mapValue!13842 () ValueCell!3768)

(declare-fun mapRest!13842 () (Array (_ BitVec 32) ValueCell!3768))

(assert (=> mapNonEmpty!13842 (= (arr!9496 _values!1208) (store mapRest!13842 mapKey!13842 mapValue!13842))))

(declare-fun b!359320 () Bool)

(assert (=> b!359320 (= e!220052 false)))

(declare-fun lt!166322 () Bool)

(declare-datatypes ((List!5463 0))(
  ( (Nil!5460) (Cons!5459 (h!6315 (_ BitVec 64)) (t!10613 List!5463)) )
))
(declare-fun arrayNoDuplicates!0 (array!20007 (_ BitVec 32) List!5463) Bool)

(assert (=> b!359320 (= lt!166322 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5460))))

(declare-fun b!359321 () Bool)

(declare-fun res!199718 () Bool)

(assert (=> b!359321 (=> (not res!199718) (not e!220052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20007 (_ BitVec 32)) Bool)

(assert (=> b!359321 (= res!199718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359322 () Bool)

(assert (=> b!359322 (= e!220051 (and e!220048 mapRes!13842))))

(declare-fun condMapEmpty!13842 () Bool)

(declare-fun mapDefault!13842 () ValueCell!3768)

(assert (=> b!359322 (= condMapEmpty!13842 (= (arr!9496 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3768)) mapDefault!13842)))))

(declare-fun mapIsEmpty!13842 () Bool)

(assert (=> mapIsEmpty!13842 mapRes!13842))

(declare-fun b!359323 () Bool)

(declare-fun res!199720 () Bool)

(assert (=> b!359323 (=> (not res!199720) (not e!220052))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359323 (= res!199720 (and (= (size!9848 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9849 _keys!1456) (size!9848 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35770 res!199719) b!359323))

(assert (= (and b!359323 res!199720) b!359321))

(assert (= (and b!359321 res!199718) b!359320))

(assert (= (and b!359322 condMapEmpty!13842) mapIsEmpty!13842))

(assert (= (and b!359322 (not condMapEmpty!13842)) mapNonEmpty!13842))

(get-info :version)

(assert (= (and mapNonEmpty!13842 ((_ is ValueCellFull!3768) mapValue!13842)) b!359319))

(assert (= (and b!359322 ((_ is ValueCellFull!3768) mapDefault!13842)) b!359318))

(assert (= start!35770 b!359322))

(declare-fun m!356863 () Bool)

(assert (=> start!35770 m!356863))

(declare-fun m!356865 () Bool)

(assert (=> start!35770 m!356865))

(declare-fun m!356867 () Bool)

(assert (=> start!35770 m!356867))

(declare-fun m!356869 () Bool)

(assert (=> mapNonEmpty!13842 m!356869))

(declare-fun m!356871 () Bool)

(assert (=> b!359320 m!356871))

(declare-fun m!356873 () Bool)

(assert (=> b!359321 m!356873))

(check-sat (not b!359321) (not start!35770) (not b!359320) (not mapNonEmpty!13842) tp_is_empty!8223)
(check-sat)
