; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35494 () Bool)

(assert start!35494)

(declare-fun b!355718 () Bool)

(declare-fun res!197362 () Bool)

(declare-fun e!217900 () Bool)

(assert (=> b!355718 (=> (not res!197362) (not e!217900))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19471 0))(
  ( (array!19472 (arr!9229 (Array (_ BitVec 32) (_ BitVec 64))) (size!9581 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19471)

(declare-datatypes ((V!11573 0))(
  ( (V!11574 (val!4018 Int)) )
))
(declare-datatypes ((ValueCell!3630 0))(
  ( (ValueCellFull!3630 (v!6212 V!11573)) (EmptyCell!3630) )
))
(declare-datatypes ((array!19473 0))(
  ( (array!19474 (arr!9230 (Array (_ BitVec 32) ValueCell!3630)) (size!9582 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19473)

(assert (=> b!355718 (= res!197362 (and (= (size!9582 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9581 _keys!1456) (size!9582 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!197360 () Bool)

(assert (=> start!35494 (=> (not res!197360) (not e!217900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35494 (= res!197360 (validMask!0 mask!1842))))

(assert (=> start!35494 e!217900))

(assert (=> start!35494 true))

(declare-fun e!217899 () Bool)

(declare-fun array_inv!6782 (array!19473) Bool)

(assert (=> start!35494 (and (array_inv!6782 _values!1208) e!217899)))

(declare-fun array_inv!6783 (array!19471) Bool)

(assert (=> start!35494 (array_inv!6783 _keys!1456)))

(declare-fun b!355719 () Bool)

(assert (=> b!355719 (= e!217900 false)))

(declare-fun lt!165836 () Bool)

(declare-datatypes ((List!5346 0))(
  ( (Nil!5343) (Cons!5342 (h!6198 (_ BitVec 64)) (t!10496 List!5346)) )
))
(declare-fun arrayNoDuplicates!0 (array!19471 (_ BitVec 32) List!5346) Bool)

(assert (=> b!355719 (= lt!165836 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5343))))

(declare-fun b!355720 () Bool)

(declare-fun e!217897 () Bool)

(declare-fun mapRes!13428 () Bool)

(assert (=> b!355720 (= e!217899 (and e!217897 mapRes!13428))))

(declare-fun condMapEmpty!13428 () Bool)

(declare-fun mapDefault!13428 () ValueCell!3630)

(assert (=> b!355720 (= condMapEmpty!13428 (= (arr!9230 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3630)) mapDefault!13428)))))

(declare-fun b!355721 () Bool)

(declare-fun e!217898 () Bool)

(declare-fun tp_is_empty!7947 () Bool)

(assert (=> b!355721 (= e!217898 tp_is_empty!7947)))

(declare-fun mapNonEmpty!13428 () Bool)

(declare-fun tp!27405 () Bool)

(assert (=> mapNonEmpty!13428 (= mapRes!13428 (and tp!27405 e!217898))))

(declare-fun mapRest!13428 () (Array (_ BitVec 32) ValueCell!3630))

(declare-fun mapKey!13428 () (_ BitVec 32))

(declare-fun mapValue!13428 () ValueCell!3630)

(assert (=> mapNonEmpty!13428 (= (arr!9230 _values!1208) (store mapRest!13428 mapKey!13428 mapValue!13428))))

(declare-fun b!355722 () Bool)

(assert (=> b!355722 (= e!217897 tp_is_empty!7947)))

(declare-fun b!355723 () Bool)

(declare-fun res!197361 () Bool)

(assert (=> b!355723 (=> (not res!197361) (not e!217900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19471 (_ BitVec 32)) Bool)

(assert (=> b!355723 (= res!197361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13428 () Bool)

(assert (=> mapIsEmpty!13428 mapRes!13428))

(assert (= (and start!35494 res!197360) b!355718))

(assert (= (and b!355718 res!197362) b!355723))

(assert (= (and b!355723 res!197361) b!355719))

(assert (= (and b!355720 condMapEmpty!13428) mapIsEmpty!13428))

(assert (= (and b!355720 (not condMapEmpty!13428)) mapNonEmpty!13428))

(get-info :version)

(assert (= (and mapNonEmpty!13428 ((_ is ValueCellFull!3630) mapValue!13428)) b!355721))

(assert (= (and b!355720 ((_ is ValueCellFull!3630) mapDefault!13428)) b!355722))

(assert (= start!35494 b!355720))

(declare-fun m!354361 () Bool)

(assert (=> start!35494 m!354361))

(declare-fun m!354363 () Bool)

(assert (=> start!35494 m!354363))

(declare-fun m!354365 () Bool)

(assert (=> start!35494 m!354365))

(declare-fun m!354367 () Bool)

(assert (=> b!355719 m!354367))

(declare-fun m!354369 () Bool)

(assert (=> mapNonEmpty!13428 m!354369))

(declare-fun m!354371 () Bool)

(assert (=> b!355723 m!354371))

(check-sat (not b!355723) (not start!35494) (not mapNonEmpty!13428) tp_is_empty!7947 (not b!355719))
(check-sat)
