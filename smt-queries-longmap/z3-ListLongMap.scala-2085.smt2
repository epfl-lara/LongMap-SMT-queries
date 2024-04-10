; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35680 () Bool)

(assert start!35680)

(declare-fun mapNonEmpty!13707 () Bool)

(declare-fun mapRes!13707 () Bool)

(declare-fun tp!27765 () Bool)

(declare-fun e!219377 () Bool)

(assert (=> mapNonEmpty!13707 (= mapRes!13707 (and tp!27765 e!219377))))

(declare-datatypes ((V!11821 0))(
  ( (V!11822 (val!4111 Int)) )
))
(declare-datatypes ((ValueCell!3723 0))(
  ( (ValueCellFull!3723 (v!6305 V!11821)) (EmptyCell!3723) )
))
(declare-fun mapValue!13707 () ValueCell!3723)

(declare-datatypes ((array!19831 0))(
  ( (array!19832 (arr!9409 (Array (_ BitVec 32) ValueCell!3723)) (size!9761 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19831)

(declare-fun mapRest!13707 () (Array (_ BitVec 32) ValueCell!3723))

(declare-fun mapKey!13707 () (_ BitVec 32))

(assert (=> mapNonEmpty!13707 (= (arr!9409 _values!1208) (store mapRest!13707 mapKey!13707 mapValue!13707))))

(declare-fun b!358409 () Bool)

(declare-fun e!219376 () Bool)

(assert (=> b!358409 (= e!219376 false)))

(declare-fun lt!166187 () Bool)

(declare-datatypes ((array!19833 0))(
  ( (array!19834 (arr!9410 (Array (_ BitVec 32) (_ BitVec 64))) (size!9762 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19833)

(declare-datatypes ((List!5429 0))(
  ( (Nil!5426) (Cons!5425 (h!6281 (_ BitVec 64)) (t!10579 List!5429)) )
))
(declare-fun arrayNoDuplicates!0 (array!19833 (_ BitVec 32) List!5429) Bool)

(assert (=> b!358409 (= lt!166187 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5426))))

(declare-fun mapIsEmpty!13707 () Bool)

(assert (=> mapIsEmpty!13707 mapRes!13707))

(declare-fun b!358410 () Bool)

(declare-fun e!219374 () Bool)

(declare-fun tp_is_empty!8133 () Bool)

(assert (=> b!358410 (= e!219374 tp_is_empty!8133)))

(declare-fun res!199214 () Bool)

(assert (=> start!35680 (=> (not res!199214) (not e!219376))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35680 (= res!199214 (validMask!0 mask!1842))))

(assert (=> start!35680 e!219376))

(assert (=> start!35680 true))

(declare-fun e!219375 () Bool)

(declare-fun array_inv!6918 (array!19831) Bool)

(assert (=> start!35680 (and (array_inv!6918 _values!1208) e!219375)))

(declare-fun array_inv!6919 (array!19833) Bool)

(assert (=> start!35680 (array_inv!6919 _keys!1456)))

(declare-fun b!358411 () Bool)

(declare-fun res!199216 () Bool)

(assert (=> b!358411 (=> (not res!199216) (not e!219376))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358411 (= res!199216 (and (= (size!9761 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9762 _keys!1456) (size!9761 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358412 () Bool)

(assert (=> b!358412 (= e!219375 (and e!219374 mapRes!13707))))

(declare-fun condMapEmpty!13707 () Bool)

(declare-fun mapDefault!13707 () ValueCell!3723)

(assert (=> b!358412 (= condMapEmpty!13707 (= (arr!9409 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3723)) mapDefault!13707)))))

(declare-fun b!358413 () Bool)

(assert (=> b!358413 (= e!219377 tp_is_empty!8133)))

(declare-fun b!358414 () Bool)

(declare-fun res!199215 () Bool)

(assert (=> b!358414 (=> (not res!199215) (not e!219376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19833 (_ BitVec 32)) Bool)

(assert (=> b!358414 (= res!199215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35680 res!199214) b!358411))

(assert (= (and b!358411 res!199216) b!358414))

(assert (= (and b!358414 res!199215) b!358409))

(assert (= (and b!358412 condMapEmpty!13707) mapIsEmpty!13707))

(assert (= (and b!358412 (not condMapEmpty!13707)) mapNonEmpty!13707))

(get-info :version)

(assert (= (and mapNonEmpty!13707 ((_ is ValueCellFull!3723) mapValue!13707)) b!358413))

(assert (= (and b!358412 ((_ is ValueCellFull!3723) mapDefault!13707)) b!358410))

(assert (= start!35680 b!358412))

(declare-fun m!356251 () Bool)

(assert (=> mapNonEmpty!13707 m!356251))

(declare-fun m!356253 () Bool)

(assert (=> b!358409 m!356253))

(declare-fun m!356255 () Bool)

(assert (=> start!35680 m!356255))

(declare-fun m!356257 () Bool)

(assert (=> start!35680 m!356257))

(declare-fun m!356259 () Bool)

(assert (=> start!35680 m!356259))

(declare-fun m!356261 () Bool)

(assert (=> b!358414 m!356261))

(check-sat tp_is_empty!8133 (not b!358414) (not start!35680) (not mapNonEmpty!13707) (not b!358409))
(check-sat)
