; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35514 () Bool)

(assert start!35514)

(declare-fun b!355749 () Bool)

(declare-fun e!217980 () Bool)

(assert (=> b!355749 (= e!217980 false)))

(declare-fun lt!165652 () Bool)

(declare-datatypes ((array!19523 0))(
  ( (array!19524 (arr!9255 (Array (_ BitVec 32) (_ BitVec 64))) (size!9608 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19523)

(declare-datatypes ((List!5328 0))(
  ( (Nil!5325) (Cons!5324 (h!6180 (_ BitVec 64)) (t!10469 List!5328)) )
))
(declare-fun arrayNoDuplicates!0 (array!19523 (_ BitVec 32) List!5328) Bool)

(assert (=> b!355749 (= lt!165652 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5325))))

(declare-fun res!197385 () Bool)

(assert (=> start!35514 (=> (not res!197385) (not e!217980))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35514 (= res!197385 (validMask!0 mask!1842))))

(assert (=> start!35514 e!217980))

(assert (=> start!35514 true))

(declare-datatypes ((V!11619 0))(
  ( (V!11620 (val!4035 Int)) )
))
(declare-datatypes ((ValueCell!3647 0))(
  ( (ValueCellFull!3647 (v!6223 V!11619)) (EmptyCell!3647) )
))
(declare-datatypes ((array!19525 0))(
  ( (array!19526 (arr!9256 (Array (_ BitVec 32) ValueCell!3647)) (size!9609 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19525)

(declare-fun e!217979 () Bool)

(declare-fun array_inv!6844 (array!19525) Bool)

(assert (=> start!35514 (and (array_inv!6844 _values!1208) e!217979)))

(declare-fun array_inv!6845 (array!19523) Bool)

(assert (=> start!35514 (array_inv!6845 _keys!1456)))

(declare-fun b!355750 () Bool)

(declare-fun res!197386 () Bool)

(assert (=> b!355750 (=> (not res!197386) (not e!217980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19523 (_ BitVec 32)) Bool)

(assert (=> b!355750 (= res!197386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355751 () Bool)

(declare-fun res!197384 () Bool)

(assert (=> b!355751 (=> (not res!197384) (not e!217980))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355751 (= res!197384 (and (= (size!9609 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9608 _keys!1456) (size!9609 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355752 () Bool)

(declare-fun e!217976 () Bool)

(declare-fun tp_is_empty!7981 () Bool)

(assert (=> b!355752 (= e!217976 tp_is_empty!7981)))

(declare-fun mapIsEmpty!13479 () Bool)

(declare-fun mapRes!13479 () Bool)

(assert (=> mapIsEmpty!13479 mapRes!13479))

(declare-fun b!355753 () Bool)

(declare-fun e!217977 () Bool)

(assert (=> b!355753 (= e!217977 tp_is_empty!7981)))

(declare-fun mapNonEmpty!13479 () Bool)

(declare-fun tp!27456 () Bool)

(assert (=> mapNonEmpty!13479 (= mapRes!13479 (and tp!27456 e!217976))))

(declare-fun mapRest!13479 () (Array (_ BitVec 32) ValueCell!3647))

(declare-fun mapValue!13479 () ValueCell!3647)

(declare-fun mapKey!13479 () (_ BitVec 32))

(assert (=> mapNonEmpty!13479 (= (arr!9256 _values!1208) (store mapRest!13479 mapKey!13479 mapValue!13479))))

(declare-fun b!355754 () Bool)

(assert (=> b!355754 (= e!217979 (and e!217977 mapRes!13479))))

(declare-fun condMapEmpty!13479 () Bool)

(declare-fun mapDefault!13479 () ValueCell!3647)

(assert (=> b!355754 (= condMapEmpty!13479 (= (arr!9256 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3647)) mapDefault!13479)))))

(assert (= (and start!35514 res!197385) b!355751))

(assert (= (and b!355751 res!197384) b!355750))

(assert (= (and b!355750 res!197386) b!355749))

(assert (= (and b!355754 condMapEmpty!13479) mapIsEmpty!13479))

(assert (= (and b!355754 (not condMapEmpty!13479)) mapNonEmpty!13479))

(get-info :version)

(assert (= (and mapNonEmpty!13479 ((_ is ValueCellFull!3647) mapValue!13479)) b!355752))

(assert (= (and b!355754 ((_ is ValueCellFull!3647) mapDefault!13479)) b!355753))

(assert (= start!35514 b!355754))

(declare-fun m!353835 () Bool)

(assert (=> b!355749 m!353835))

(declare-fun m!353837 () Bool)

(assert (=> start!35514 m!353837))

(declare-fun m!353839 () Bool)

(assert (=> start!35514 m!353839))

(declare-fun m!353841 () Bool)

(assert (=> start!35514 m!353841))

(declare-fun m!353843 () Bool)

(assert (=> b!355750 m!353843))

(declare-fun m!353845 () Bool)

(assert (=> mapNonEmpty!13479 m!353845))

(check-sat (not b!355749) (not b!355750) (not mapNonEmpty!13479) (not start!35514) tp_is_empty!7981)
(check-sat)
