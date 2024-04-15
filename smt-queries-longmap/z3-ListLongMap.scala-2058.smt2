; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35502 () Bool)

(assert start!35502)

(declare-fun b!355641 () Bool)

(declare-fun res!197332 () Bool)

(declare-fun e!217886 () Bool)

(assert (=> b!355641 (=> (not res!197332) (not e!217886))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19499 0))(
  ( (array!19500 (arr!9243 (Array (_ BitVec 32) (_ BitVec 64))) (size!9596 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19499)

(declare-datatypes ((V!11603 0))(
  ( (V!11604 (val!4029 Int)) )
))
(declare-datatypes ((ValueCell!3641 0))(
  ( (ValueCellFull!3641 (v!6217 V!11603)) (EmptyCell!3641) )
))
(declare-datatypes ((array!19501 0))(
  ( (array!19502 (arr!9244 (Array (_ BitVec 32) ValueCell!3641)) (size!9597 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19501)

(assert (=> b!355641 (= res!197332 (and (= (size!9597 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9596 _keys!1456) (size!9597 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355642 () Bool)

(assert (=> b!355642 (= e!217886 false)))

(declare-fun lt!165634 () Bool)

(declare-datatypes ((List!5325 0))(
  ( (Nil!5322) (Cons!5321 (h!6177 (_ BitVec 64)) (t!10466 List!5325)) )
))
(declare-fun arrayNoDuplicates!0 (array!19499 (_ BitVec 32) List!5325) Bool)

(assert (=> b!355642 (= lt!165634 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5322))))

(declare-fun res!197330 () Bool)

(assert (=> start!35502 (=> (not res!197330) (not e!217886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35502 (= res!197330 (validMask!0 mask!1842))))

(assert (=> start!35502 e!217886))

(assert (=> start!35502 true))

(declare-fun e!217889 () Bool)

(declare-fun array_inv!6834 (array!19501) Bool)

(assert (=> start!35502 (and (array_inv!6834 _values!1208) e!217889)))

(declare-fun array_inv!6835 (array!19499) Bool)

(assert (=> start!35502 (array_inv!6835 _keys!1456)))

(declare-fun b!355643 () Bool)

(declare-fun res!197331 () Bool)

(assert (=> b!355643 (=> (not res!197331) (not e!217886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19499 (_ BitVec 32)) Bool)

(assert (=> b!355643 (= res!197331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355644 () Bool)

(declare-fun e!217888 () Bool)

(declare-fun mapRes!13461 () Bool)

(assert (=> b!355644 (= e!217889 (and e!217888 mapRes!13461))))

(declare-fun condMapEmpty!13461 () Bool)

(declare-fun mapDefault!13461 () ValueCell!3641)

(assert (=> b!355644 (= condMapEmpty!13461 (= (arr!9244 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3641)) mapDefault!13461)))))

(declare-fun b!355645 () Bool)

(declare-fun tp_is_empty!7969 () Bool)

(assert (=> b!355645 (= e!217888 tp_is_empty!7969)))

(declare-fun mapIsEmpty!13461 () Bool)

(assert (=> mapIsEmpty!13461 mapRes!13461))

(declare-fun mapNonEmpty!13461 () Bool)

(declare-fun tp!27438 () Bool)

(declare-fun e!217887 () Bool)

(assert (=> mapNonEmpty!13461 (= mapRes!13461 (and tp!27438 e!217887))))

(declare-fun mapKey!13461 () (_ BitVec 32))

(declare-fun mapValue!13461 () ValueCell!3641)

(declare-fun mapRest!13461 () (Array (_ BitVec 32) ValueCell!3641))

(assert (=> mapNonEmpty!13461 (= (arr!9244 _values!1208) (store mapRest!13461 mapKey!13461 mapValue!13461))))

(declare-fun b!355646 () Bool)

(assert (=> b!355646 (= e!217887 tp_is_empty!7969)))

(assert (= (and start!35502 res!197330) b!355641))

(assert (= (and b!355641 res!197332) b!355643))

(assert (= (and b!355643 res!197331) b!355642))

(assert (= (and b!355644 condMapEmpty!13461) mapIsEmpty!13461))

(assert (= (and b!355644 (not condMapEmpty!13461)) mapNonEmpty!13461))

(get-info :version)

(assert (= (and mapNonEmpty!13461 ((_ is ValueCellFull!3641) mapValue!13461)) b!355646))

(assert (= (and b!355644 ((_ is ValueCellFull!3641) mapDefault!13461)) b!355645))

(assert (= start!35502 b!355644))

(declare-fun m!353763 () Bool)

(assert (=> b!355642 m!353763))

(declare-fun m!353765 () Bool)

(assert (=> start!35502 m!353765))

(declare-fun m!353767 () Bool)

(assert (=> start!35502 m!353767))

(declare-fun m!353769 () Bool)

(assert (=> start!35502 m!353769))

(declare-fun m!353771 () Bool)

(assert (=> b!355643 m!353771))

(declare-fun m!353773 () Bool)

(assert (=> mapNonEmpty!13461 m!353773))

(check-sat (not b!355643) (not b!355642) tp_is_empty!7969 (not start!35502) (not mapNonEmpty!13461))
(check-sat)
