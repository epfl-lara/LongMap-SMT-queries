; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35800 () Bool)

(assert start!35800)

(declare-fun res!199855 () Bool)

(declare-fun e!220274 () Bool)

(assert (=> start!35800 (=> (not res!199855) (not e!220274))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35800 (= res!199855 (validMask!0 mask!1842))))

(assert (=> start!35800 e!220274))

(assert (=> start!35800 true))

(declare-datatypes ((V!11981 0))(
  ( (V!11982 (val!4171 Int)) )
))
(declare-datatypes ((ValueCell!3783 0))(
  ( (ValueCellFull!3783 (v!6365 V!11981)) (EmptyCell!3783) )
))
(declare-datatypes ((array!20061 0))(
  ( (array!20062 (arr!9524 (Array (_ BitVec 32) ValueCell!3783)) (size!9876 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20061)

(declare-fun e!220276 () Bool)

(declare-fun array_inv!7006 (array!20061) Bool)

(assert (=> start!35800 (and (array_inv!7006 _values!1208) e!220276)))

(declare-datatypes ((array!20063 0))(
  ( (array!20064 (arr!9525 (Array (_ BitVec 32) (_ BitVec 64))) (size!9877 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20063)

(declare-fun array_inv!7007 (array!20063) Bool)

(assert (=> start!35800 (array_inv!7007 _keys!1456)))

(declare-fun b!359588 () Bool)

(assert (=> b!359588 (= e!220274 false)))

(declare-fun lt!166367 () Bool)

(declare-datatypes ((List!5473 0))(
  ( (Nil!5470) (Cons!5469 (h!6325 (_ BitVec 64)) (t!10623 List!5473)) )
))
(declare-fun arrayNoDuplicates!0 (array!20063 (_ BitVec 32) List!5473) Bool)

(assert (=> b!359588 (= lt!166367 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5470))))

(declare-fun mapIsEmpty!13887 () Bool)

(declare-fun mapRes!13887 () Bool)

(assert (=> mapIsEmpty!13887 mapRes!13887))

(declare-fun b!359589 () Bool)

(declare-fun res!199853 () Bool)

(assert (=> b!359589 (=> (not res!199853) (not e!220274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20063 (_ BitVec 32)) Bool)

(assert (=> b!359589 (= res!199853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359590 () Bool)

(declare-fun res!199854 () Bool)

(assert (=> b!359590 (=> (not res!199854) (not e!220274))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359590 (= res!199854 (and (= (size!9876 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9877 _keys!1456) (size!9876 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13887 () Bool)

(declare-fun tp!27954 () Bool)

(declare-fun e!220275 () Bool)

(assert (=> mapNonEmpty!13887 (= mapRes!13887 (and tp!27954 e!220275))))

(declare-fun mapRest!13887 () (Array (_ BitVec 32) ValueCell!3783))

(declare-fun mapValue!13887 () ValueCell!3783)

(declare-fun mapKey!13887 () (_ BitVec 32))

(assert (=> mapNonEmpty!13887 (= (arr!9524 _values!1208) (store mapRest!13887 mapKey!13887 mapValue!13887))))

(declare-fun b!359591 () Bool)

(declare-fun e!220273 () Bool)

(declare-fun tp_is_empty!8253 () Bool)

(assert (=> b!359591 (= e!220273 tp_is_empty!8253)))

(declare-fun b!359592 () Bool)

(assert (=> b!359592 (= e!220275 tp_is_empty!8253)))

(declare-fun b!359593 () Bool)

(assert (=> b!359593 (= e!220276 (and e!220273 mapRes!13887))))

(declare-fun condMapEmpty!13887 () Bool)

(declare-fun mapDefault!13887 () ValueCell!3783)

(assert (=> b!359593 (= condMapEmpty!13887 (= (arr!9524 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3783)) mapDefault!13887)))))

(assert (= (and start!35800 res!199855) b!359590))

(assert (= (and b!359590 res!199854) b!359589))

(assert (= (and b!359589 res!199853) b!359588))

(assert (= (and b!359593 condMapEmpty!13887) mapIsEmpty!13887))

(assert (= (and b!359593 (not condMapEmpty!13887)) mapNonEmpty!13887))

(get-info :version)

(assert (= (and mapNonEmpty!13887 ((_ is ValueCellFull!3783) mapValue!13887)) b!359592))

(assert (= (and b!359593 ((_ is ValueCellFull!3783) mapDefault!13887)) b!359591))

(assert (= start!35800 b!359593))

(declare-fun m!357043 () Bool)

(assert (=> start!35800 m!357043))

(declare-fun m!357045 () Bool)

(assert (=> start!35800 m!357045))

(declare-fun m!357047 () Bool)

(assert (=> start!35800 m!357047))

(declare-fun m!357049 () Bool)

(assert (=> b!359588 m!357049))

(declare-fun m!357051 () Bool)

(assert (=> b!359589 m!357051))

(declare-fun m!357053 () Bool)

(assert (=> mapNonEmpty!13887 m!357053))

(check-sat tp_is_empty!8253 (not b!359588) (not start!35800) (not mapNonEmpty!13887) (not b!359589))
(check-sat)
