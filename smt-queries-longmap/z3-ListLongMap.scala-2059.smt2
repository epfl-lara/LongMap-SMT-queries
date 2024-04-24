; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35508 () Bool)

(assert start!35508)

(declare-fun b!355917 () Bool)

(declare-fun e!218075 () Bool)

(declare-fun e!218076 () Bool)

(declare-fun mapRes!13470 () Bool)

(assert (=> b!355917 (= e!218075 (and e!218076 mapRes!13470))))

(declare-fun condMapEmpty!13470 () Bool)

(declare-datatypes ((V!11611 0))(
  ( (V!11612 (val!4032 Int)) )
))
(declare-datatypes ((ValueCell!3644 0))(
  ( (ValueCellFull!3644 (v!6227 V!11611)) (EmptyCell!3644) )
))
(declare-datatypes ((array!19512 0))(
  ( (array!19513 (arr!9249 (Array (_ BitVec 32) ValueCell!3644)) (size!9601 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19512)

(declare-fun mapDefault!13470 () ValueCell!3644)

(assert (=> b!355917 (= condMapEmpty!13470 (= (arr!9249 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3644)) mapDefault!13470)))))

(declare-fun b!355918 () Bool)

(declare-fun res!197484 () Bool)

(declare-fun e!218074 () Bool)

(assert (=> b!355918 (=> (not res!197484) (not e!218074))))

(declare-datatypes ((array!19514 0))(
  ( (array!19515 (arr!9250 (Array (_ BitVec 32) (_ BitVec 64))) (size!9602 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19514)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19514 (_ BitVec 32)) Bool)

(assert (=> b!355918 (= res!197484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13470 () Bool)

(assert (=> mapIsEmpty!13470 mapRes!13470))

(declare-fun b!355919 () Bool)

(assert (=> b!355919 (= e!218074 false)))

(declare-fun lt!165896 () Bool)

(declare-datatypes ((List!5263 0))(
  ( (Nil!5260) (Cons!5259 (h!6115 (_ BitVec 64)) (t!10405 List!5263)) )
))
(declare-fun arrayNoDuplicates!0 (array!19514 (_ BitVec 32) List!5263) Bool)

(assert (=> b!355919 (= lt!165896 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5260))))

(declare-fun res!197485 () Bool)

(assert (=> start!35508 (=> (not res!197485) (not e!218074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35508 (= res!197485 (validMask!0 mask!1842))))

(assert (=> start!35508 e!218074))

(assert (=> start!35508 true))

(declare-fun array_inv!6836 (array!19512) Bool)

(assert (=> start!35508 (and (array_inv!6836 _values!1208) e!218075)))

(declare-fun array_inv!6837 (array!19514) Bool)

(assert (=> start!35508 (array_inv!6837 _keys!1456)))

(declare-fun mapNonEmpty!13470 () Bool)

(declare-fun tp!27447 () Bool)

(declare-fun e!218077 () Bool)

(assert (=> mapNonEmpty!13470 (= mapRes!13470 (and tp!27447 e!218077))))

(declare-fun mapValue!13470 () ValueCell!3644)

(declare-fun mapKey!13470 () (_ BitVec 32))

(declare-fun mapRest!13470 () (Array (_ BitVec 32) ValueCell!3644))

(assert (=> mapNonEmpty!13470 (= (arr!9249 _values!1208) (store mapRest!13470 mapKey!13470 mapValue!13470))))

(declare-fun b!355920 () Bool)

(declare-fun tp_is_empty!7975 () Bool)

(assert (=> b!355920 (= e!218077 tp_is_empty!7975)))

(declare-fun b!355921 () Bool)

(declare-fun res!197483 () Bool)

(assert (=> b!355921 (=> (not res!197483) (not e!218074))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355921 (= res!197483 (and (= (size!9601 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9602 _keys!1456) (size!9601 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355922 () Bool)

(assert (=> b!355922 (= e!218076 tp_is_empty!7975)))

(assert (= (and start!35508 res!197485) b!355921))

(assert (= (and b!355921 res!197483) b!355918))

(assert (= (and b!355918 res!197484) b!355919))

(assert (= (and b!355917 condMapEmpty!13470) mapIsEmpty!13470))

(assert (= (and b!355917 (not condMapEmpty!13470)) mapNonEmpty!13470))

(get-info :version)

(assert (= (and mapNonEmpty!13470 ((_ is ValueCellFull!3644) mapValue!13470)) b!355920))

(assert (= (and b!355917 ((_ is ValueCellFull!3644) mapDefault!13470)) b!355922))

(assert (= start!35508 b!355917))

(declare-fun m!354753 () Bool)

(assert (=> b!355918 m!354753))

(declare-fun m!354755 () Bool)

(assert (=> b!355919 m!354755))

(declare-fun m!354757 () Bool)

(assert (=> start!35508 m!354757))

(declare-fun m!354759 () Bool)

(assert (=> start!35508 m!354759))

(declare-fun m!354761 () Bool)

(assert (=> start!35508 m!354761))

(declare-fun m!354763 () Bool)

(assert (=> mapNonEmpty!13470 m!354763))

(check-sat (not mapNonEmpty!13470) (not b!355918) (not b!355919) tp_is_empty!7975 (not start!35508))
(check-sat)
