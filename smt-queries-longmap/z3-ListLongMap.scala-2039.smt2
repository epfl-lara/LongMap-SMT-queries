; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35388 () Bool)

(assert start!35388)

(declare-fun b!354129 () Bool)

(declare-fun e!217035 () Bool)

(assert (=> b!354129 (= e!217035 false)))

(declare-fun lt!165463 () Bool)

(declare-datatypes ((array!19277 0))(
  ( (array!19278 (arr!9132 (Array (_ BitVec 32) (_ BitVec 64))) (size!9485 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19277)

(declare-datatypes ((List!5268 0))(
  ( (Nil!5265) (Cons!5264 (h!6120 (_ BitVec 64)) (t!10409 List!5268)) )
))
(declare-fun arrayNoDuplicates!0 (array!19277 (_ BitVec 32) List!5268) Bool)

(assert (=> b!354129 (= lt!165463 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5265))))

(declare-fun res!196333 () Bool)

(assert (=> start!35388 (=> (not res!196333) (not e!217035))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35388 (= res!196333 (validMask!0 mask!1842))))

(assert (=> start!35388 e!217035))

(assert (=> start!35388 true))

(declare-datatypes ((V!11451 0))(
  ( (V!11452 (val!3972 Int)) )
))
(declare-datatypes ((ValueCell!3584 0))(
  ( (ValueCellFull!3584 (v!6160 V!11451)) (EmptyCell!3584) )
))
(declare-datatypes ((array!19279 0))(
  ( (array!19280 (arr!9133 (Array (_ BitVec 32) ValueCell!3584)) (size!9486 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19279)

(declare-fun e!217031 () Bool)

(declare-fun array_inv!6764 (array!19279) Bool)

(assert (=> start!35388 (and (array_inv!6764 _values!1208) e!217031)))

(declare-fun array_inv!6765 (array!19277) Bool)

(assert (=> start!35388 (array_inv!6765 _keys!1456)))

(declare-fun b!354130 () Bool)

(declare-fun e!217034 () Bool)

(declare-fun tp_is_empty!7855 () Bool)

(assert (=> b!354130 (= e!217034 tp_is_empty!7855)))

(declare-fun b!354131 () Bool)

(declare-fun res!196332 () Bool)

(assert (=> b!354131 (=> (not res!196332) (not e!217035))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354131 (= res!196332 (and (= (size!9486 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9485 _keys!1456) (size!9486 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13290 () Bool)

(declare-fun mapRes!13290 () Bool)

(declare-fun tp!27186 () Bool)

(assert (=> mapNonEmpty!13290 (= mapRes!13290 (and tp!27186 e!217034))))

(declare-fun mapKey!13290 () (_ BitVec 32))

(declare-fun mapRest!13290 () (Array (_ BitVec 32) ValueCell!3584))

(declare-fun mapValue!13290 () ValueCell!3584)

(assert (=> mapNonEmpty!13290 (= (arr!9133 _values!1208) (store mapRest!13290 mapKey!13290 mapValue!13290))))

(declare-fun b!354132 () Bool)

(declare-fun e!217033 () Bool)

(assert (=> b!354132 (= e!217031 (and e!217033 mapRes!13290))))

(declare-fun condMapEmpty!13290 () Bool)

(declare-fun mapDefault!13290 () ValueCell!3584)

(assert (=> b!354132 (= condMapEmpty!13290 (= (arr!9133 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3584)) mapDefault!13290)))))

(declare-fun b!354133 () Bool)

(assert (=> b!354133 (= e!217033 tp_is_empty!7855)))

(declare-fun b!354134 () Bool)

(declare-fun res!196331 () Bool)

(assert (=> b!354134 (=> (not res!196331) (not e!217035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19277 (_ BitVec 32)) Bool)

(assert (=> b!354134 (= res!196331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13290 () Bool)

(assert (=> mapIsEmpty!13290 mapRes!13290))

(assert (= (and start!35388 res!196333) b!354131))

(assert (= (and b!354131 res!196332) b!354134))

(assert (= (and b!354134 res!196331) b!354129))

(assert (= (and b!354132 condMapEmpty!13290) mapIsEmpty!13290))

(assert (= (and b!354132 (not condMapEmpty!13290)) mapNonEmpty!13290))

(get-info :version)

(assert (= (and mapNonEmpty!13290 ((_ is ValueCellFull!3584) mapValue!13290)) b!354130))

(assert (= (and b!354132 ((_ is ValueCellFull!3584) mapDefault!13290)) b!354133))

(assert (= start!35388 b!354132))

(declare-fun m!352701 () Bool)

(assert (=> b!354129 m!352701))

(declare-fun m!352703 () Bool)

(assert (=> start!35388 m!352703))

(declare-fun m!352705 () Bool)

(assert (=> start!35388 m!352705))

(declare-fun m!352707 () Bool)

(assert (=> start!35388 m!352707))

(declare-fun m!352709 () Bool)

(assert (=> mapNonEmpty!13290 m!352709))

(declare-fun m!352711 () Bool)

(assert (=> b!354134 m!352711))

(check-sat (not mapNonEmpty!13290) (not start!35388) tp_is_empty!7855 (not b!354129) (not b!354134))
(check-sat)
