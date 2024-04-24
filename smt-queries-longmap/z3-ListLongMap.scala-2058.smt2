; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35502 () Bool)

(assert start!35502)

(declare-fun b!355863 () Bool)

(declare-fun res!197456 () Bool)

(declare-fun e!218032 () Bool)

(assert (=> b!355863 (=> (not res!197456) (not e!218032))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19500 0))(
  ( (array!19501 (arr!9243 (Array (_ BitVec 32) (_ BitVec 64))) (size!9595 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19500)

(declare-datatypes ((V!11603 0))(
  ( (V!11604 (val!4029 Int)) )
))
(declare-datatypes ((ValueCell!3641 0))(
  ( (ValueCellFull!3641 (v!6224 V!11603)) (EmptyCell!3641) )
))
(declare-datatypes ((array!19502 0))(
  ( (array!19503 (arr!9244 (Array (_ BitVec 32) ValueCell!3641)) (size!9596 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19502)

(assert (=> b!355863 (= res!197456 (and (= (size!9596 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9595 _keys!1456) (size!9596 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355864 () Bool)

(declare-fun res!197457 () Bool)

(assert (=> b!355864 (=> (not res!197457) (not e!218032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19500 (_ BitVec 32)) Bool)

(assert (=> b!355864 (= res!197457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355865 () Bool)

(declare-fun e!218028 () Bool)

(declare-fun e!218030 () Bool)

(declare-fun mapRes!13461 () Bool)

(assert (=> b!355865 (= e!218028 (and e!218030 mapRes!13461))))

(declare-fun condMapEmpty!13461 () Bool)

(declare-fun mapDefault!13461 () ValueCell!3641)

(assert (=> b!355865 (= condMapEmpty!13461 (= (arr!9244 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3641)) mapDefault!13461)))))

(declare-fun b!355866 () Bool)

(declare-fun tp_is_empty!7969 () Bool)

(assert (=> b!355866 (= e!218030 tp_is_empty!7969)))

(declare-fun b!355867 () Bool)

(assert (=> b!355867 (= e!218032 false)))

(declare-fun lt!165887 () Bool)

(declare-datatypes ((List!5260 0))(
  ( (Nil!5257) (Cons!5256 (h!6112 (_ BitVec 64)) (t!10402 List!5260)) )
))
(declare-fun arrayNoDuplicates!0 (array!19500 (_ BitVec 32) List!5260) Bool)

(assert (=> b!355867 (= lt!165887 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5257))))

(declare-fun mapIsEmpty!13461 () Bool)

(assert (=> mapIsEmpty!13461 mapRes!13461))

(declare-fun mapNonEmpty!13461 () Bool)

(declare-fun tp!27438 () Bool)

(declare-fun e!218031 () Bool)

(assert (=> mapNonEmpty!13461 (= mapRes!13461 (and tp!27438 e!218031))))

(declare-fun mapValue!13461 () ValueCell!3641)

(declare-fun mapKey!13461 () (_ BitVec 32))

(declare-fun mapRest!13461 () (Array (_ BitVec 32) ValueCell!3641))

(assert (=> mapNonEmpty!13461 (= (arr!9244 _values!1208) (store mapRest!13461 mapKey!13461 mapValue!13461))))

(declare-fun res!197458 () Bool)

(assert (=> start!35502 (=> (not res!197458) (not e!218032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35502 (= res!197458 (validMask!0 mask!1842))))

(assert (=> start!35502 e!218032))

(assert (=> start!35502 true))

(declare-fun array_inv!6830 (array!19502) Bool)

(assert (=> start!35502 (and (array_inv!6830 _values!1208) e!218028)))

(declare-fun array_inv!6831 (array!19500) Bool)

(assert (=> start!35502 (array_inv!6831 _keys!1456)))

(declare-fun b!355868 () Bool)

(assert (=> b!355868 (= e!218031 tp_is_empty!7969)))

(assert (= (and start!35502 res!197458) b!355863))

(assert (= (and b!355863 res!197456) b!355864))

(assert (= (and b!355864 res!197457) b!355867))

(assert (= (and b!355865 condMapEmpty!13461) mapIsEmpty!13461))

(assert (= (and b!355865 (not condMapEmpty!13461)) mapNonEmpty!13461))

(get-info :version)

(assert (= (and mapNonEmpty!13461 ((_ is ValueCellFull!3641) mapValue!13461)) b!355868))

(assert (= (and b!355865 ((_ is ValueCellFull!3641) mapDefault!13461)) b!355866))

(assert (= start!35502 b!355865))

(declare-fun m!354717 () Bool)

(assert (=> b!355864 m!354717))

(declare-fun m!354719 () Bool)

(assert (=> b!355867 m!354719))

(declare-fun m!354721 () Bool)

(assert (=> mapNonEmpty!13461 m!354721))

(declare-fun m!354723 () Bool)

(assert (=> start!35502 m!354723))

(declare-fun m!354725 () Bool)

(assert (=> start!35502 m!354725))

(declare-fun m!354727 () Bool)

(assert (=> start!35502 m!354727))

(check-sat tp_is_empty!7969 (not start!35502) (not b!355867) (not mapNonEmpty!13461) (not b!355864))
(check-sat)
