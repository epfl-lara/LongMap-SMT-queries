; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35520 () Bool)

(assert start!35520)

(declare-fun res!197539 () Bool)

(declare-fun e!218165 () Bool)

(assert (=> start!35520 (=> (not res!197539) (not e!218165))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35520 (= res!197539 (validMask!0 mask!1842))))

(assert (=> start!35520 e!218165))

(assert (=> start!35520 true))

(declare-datatypes ((V!11627 0))(
  ( (V!11628 (val!4038 Int)) )
))
(declare-datatypes ((ValueCell!3650 0))(
  ( (ValueCellFull!3650 (v!6233 V!11627)) (EmptyCell!3650) )
))
(declare-datatypes ((array!19534 0))(
  ( (array!19535 (arr!9260 (Array (_ BitVec 32) ValueCell!3650)) (size!9612 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19534)

(declare-fun e!218167 () Bool)

(declare-fun array_inv!6844 (array!19534) Bool)

(assert (=> start!35520 (and (array_inv!6844 _values!1208) e!218167)))

(declare-datatypes ((array!19536 0))(
  ( (array!19537 (arr!9261 (Array (_ BitVec 32) (_ BitVec 64))) (size!9613 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19536)

(declare-fun array_inv!6845 (array!19536) Bool)

(assert (=> start!35520 (array_inv!6845 _keys!1456)))

(declare-fun mapNonEmpty!13488 () Bool)

(declare-fun mapRes!13488 () Bool)

(declare-fun tp!27465 () Bool)

(declare-fun e!218164 () Bool)

(assert (=> mapNonEmpty!13488 (= mapRes!13488 (and tp!27465 e!218164))))

(declare-fun mapRest!13488 () (Array (_ BitVec 32) ValueCell!3650))

(declare-fun mapValue!13488 () ValueCell!3650)

(declare-fun mapKey!13488 () (_ BitVec 32))

(assert (=> mapNonEmpty!13488 (= (arr!9260 _values!1208) (store mapRest!13488 mapKey!13488 mapValue!13488))))

(declare-fun b!356025 () Bool)

(declare-fun tp_is_empty!7987 () Bool)

(assert (=> b!356025 (= e!218164 tp_is_empty!7987)))

(declare-fun b!356026 () Bool)

(declare-fun res!197538 () Bool)

(assert (=> b!356026 (=> (not res!197538) (not e!218165))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356026 (= res!197538 (and (= (size!9612 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9613 _keys!1456) (size!9612 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356027 () Bool)

(assert (=> b!356027 (= e!218165 false)))

(declare-fun lt!165914 () Bool)

(declare-datatypes ((List!5268 0))(
  ( (Nil!5265) (Cons!5264 (h!6120 (_ BitVec 64)) (t!10410 List!5268)) )
))
(declare-fun arrayNoDuplicates!0 (array!19536 (_ BitVec 32) List!5268) Bool)

(assert (=> b!356027 (= lt!165914 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5265))))

(declare-fun b!356028 () Bool)

(declare-fun res!197537 () Bool)

(assert (=> b!356028 (=> (not res!197537) (not e!218165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19536 (_ BitVec 32)) Bool)

(assert (=> b!356028 (= res!197537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13488 () Bool)

(assert (=> mapIsEmpty!13488 mapRes!13488))

(declare-fun b!356029 () Bool)

(declare-fun e!218166 () Bool)

(assert (=> b!356029 (= e!218166 tp_is_empty!7987)))

(declare-fun b!356030 () Bool)

(assert (=> b!356030 (= e!218167 (and e!218166 mapRes!13488))))

(declare-fun condMapEmpty!13488 () Bool)

(declare-fun mapDefault!13488 () ValueCell!3650)

(assert (=> b!356030 (= condMapEmpty!13488 (= (arr!9260 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3650)) mapDefault!13488)))))

(assert (= (and start!35520 res!197539) b!356026))

(assert (= (and b!356026 res!197538) b!356028))

(assert (= (and b!356028 res!197537) b!356027))

(assert (= (and b!356030 condMapEmpty!13488) mapIsEmpty!13488))

(assert (= (and b!356030 (not condMapEmpty!13488)) mapNonEmpty!13488))

(get-info :version)

(assert (= (and mapNonEmpty!13488 ((_ is ValueCellFull!3650) mapValue!13488)) b!356025))

(assert (= (and b!356030 ((_ is ValueCellFull!3650) mapDefault!13488)) b!356029))

(assert (= start!35520 b!356030))

(declare-fun m!354825 () Bool)

(assert (=> start!35520 m!354825))

(declare-fun m!354827 () Bool)

(assert (=> start!35520 m!354827))

(declare-fun m!354829 () Bool)

(assert (=> start!35520 m!354829))

(declare-fun m!354831 () Bool)

(assert (=> mapNonEmpty!13488 m!354831))

(declare-fun m!354833 () Bool)

(assert (=> b!356027 m!354833))

(declare-fun m!354835 () Bool)

(assert (=> b!356028 m!354835))

(check-sat (not b!356027) (not b!356028) tp_is_empty!7987 (not mapNonEmpty!13488) (not start!35520))
(check-sat)
