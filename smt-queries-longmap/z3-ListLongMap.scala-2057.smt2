; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35512 () Bool)

(assert start!35512)

(declare-fun b!355880 () Bool)

(declare-fun e!218036 () Bool)

(assert (=> b!355880 (= e!218036 false)))

(declare-fun lt!165863 () Bool)

(declare-datatypes ((array!19507 0))(
  ( (array!19508 (arr!9247 (Array (_ BitVec 32) (_ BitVec 64))) (size!9599 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19507)

(declare-datatypes ((List!5351 0))(
  ( (Nil!5348) (Cons!5347 (h!6203 (_ BitVec 64)) (t!10501 List!5351)) )
))
(declare-fun arrayNoDuplicates!0 (array!19507 (_ BitVec 32) List!5351) Bool)

(assert (=> b!355880 (= lt!165863 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5348))))

(declare-fun mapNonEmpty!13455 () Bool)

(declare-fun mapRes!13455 () Bool)

(declare-fun tp!27432 () Bool)

(declare-fun e!218035 () Bool)

(assert (=> mapNonEmpty!13455 (= mapRes!13455 (and tp!27432 e!218035))))

(declare-datatypes ((V!11597 0))(
  ( (V!11598 (val!4027 Int)) )
))
(declare-datatypes ((ValueCell!3639 0))(
  ( (ValueCellFull!3639 (v!6221 V!11597)) (EmptyCell!3639) )
))
(declare-fun mapRest!13455 () (Array (_ BitVec 32) ValueCell!3639))

(declare-fun mapValue!13455 () ValueCell!3639)

(declare-datatypes ((array!19509 0))(
  ( (array!19510 (arr!9248 (Array (_ BitVec 32) ValueCell!3639)) (size!9600 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19509)

(declare-fun mapKey!13455 () (_ BitVec 32))

(assert (=> mapNonEmpty!13455 (= (arr!9248 _values!1208) (store mapRest!13455 mapKey!13455 mapValue!13455))))

(declare-fun b!355881 () Bool)

(declare-fun res!197443 () Bool)

(assert (=> b!355881 (=> (not res!197443) (not e!218036))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19507 (_ BitVec 32)) Bool)

(assert (=> b!355881 (= res!197443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!197442 () Bool)

(assert (=> start!35512 (=> (not res!197442) (not e!218036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35512 (= res!197442 (validMask!0 mask!1842))))

(assert (=> start!35512 e!218036))

(assert (=> start!35512 true))

(declare-fun e!218033 () Bool)

(declare-fun array_inv!6796 (array!19509) Bool)

(assert (=> start!35512 (and (array_inv!6796 _values!1208) e!218033)))

(declare-fun array_inv!6797 (array!19507) Bool)

(assert (=> start!35512 (array_inv!6797 _keys!1456)))

(declare-fun b!355882 () Bool)

(declare-fun tp_is_empty!7965 () Bool)

(assert (=> b!355882 (= e!218035 tp_is_empty!7965)))

(declare-fun b!355883 () Bool)

(declare-fun e!218034 () Bool)

(assert (=> b!355883 (= e!218034 tp_is_empty!7965)))

(declare-fun mapIsEmpty!13455 () Bool)

(assert (=> mapIsEmpty!13455 mapRes!13455))

(declare-fun b!355884 () Bool)

(assert (=> b!355884 (= e!218033 (and e!218034 mapRes!13455))))

(declare-fun condMapEmpty!13455 () Bool)

(declare-fun mapDefault!13455 () ValueCell!3639)

(assert (=> b!355884 (= condMapEmpty!13455 (= (arr!9248 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3639)) mapDefault!13455)))))

(declare-fun b!355885 () Bool)

(declare-fun res!197441 () Bool)

(assert (=> b!355885 (=> (not res!197441) (not e!218036))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355885 (= res!197441 (and (= (size!9600 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9599 _keys!1456) (size!9600 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35512 res!197442) b!355885))

(assert (= (and b!355885 res!197441) b!355881))

(assert (= (and b!355881 res!197443) b!355880))

(assert (= (and b!355884 condMapEmpty!13455) mapIsEmpty!13455))

(assert (= (and b!355884 (not condMapEmpty!13455)) mapNonEmpty!13455))

(get-info :version)

(assert (= (and mapNonEmpty!13455 ((_ is ValueCellFull!3639) mapValue!13455)) b!355882))

(assert (= (and b!355884 ((_ is ValueCellFull!3639) mapDefault!13455)) b!355883))

(assert (= start!35512 b!355884))

(declare-fun m!354469 () Bool)

(assert (=> b!355880 m!354469))

(declare-fun m!354471 () Bool)

(assert (=> mapNonEmpty!13455 m!354471))

(declare-fun m!354473 () Bool)

(assert (=> b!355881 m!354473))

(declare-fun m!354475 () Bool)

(assert (=> start!35512 m!354475))

(declare-fun m!354477 () Bool)

(assert (=> start!35512 m!354477))

(declare-fun m!354479 () Bool)

(assert (=> start!35512 m!354479))

(check-sat (not mapNonEmpty!13455) tp_is_empty!7965 (not start!35512) (not b!355881) (not b!355880))
(check-sat)
