; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38324 () Bool)

(assert start!38324)

(declare-fun b!395297 () Bool)

(declare-fun res!226637 () Bool)

(declare-fun e!239330 () Bool)

(assert (=> b!395297 (=> (not res!226637) (not e!239330))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14179 0))(
  ( (V!14180 (val!4947 Int)) )
))
(declare-datatypes ((ValueCell!4559 0))(
  ( (ValueCellFull!4559 (v!7194 V!14179)) (EmptyCell!4559) )
))
(declare-datatypes ((array!23512 0))(
  ( (array!23513 (arr!11208 (Array (_ BitVec 32) ValueCell!4559)) (size!11560 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23512)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23514 0))(
  ( (array!23515 (arr!11209 (Array (_ BitVec 32) (_ BitVec 64))) (size!11561 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23514)

(assert (=> b!395297 (= res!226637 (and (= (size!11560 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11561 _keys!709) (size!11560 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395298 () Bool)

(assert (=> b!395298 (= e!239330 false)))

(declare-fun lt!187097 () Bool)

(declare-datatypes ((List!6372 0))(
  ( (Nil!6369) (Cons!6368 (h!7224 (_ BitVec 64)) (t!11538 List!6372)) )
))
(declare-fun arrayNoDuplicates!0 (array!23514 (_ BitVec 32) List!6372) Bool)

(assert (=> b!395298 (= lt!187097 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6369))))

(declare-fun b!395299 () Bool)

(declare-fun e!239328 () Bool)

(declare-fun e!239327 () Bool)

(declare-fun mapRes!16320 () Bool)

(assert (=> b!395299 (= e!239328 (and e!239327 mapRes!16320))))

(declare-fun condMapEmpty!16320 () Bool)

(declare-fun mapDefault!16320 () ValueCell!4559)

(assert (=> b!395299 (= condMapEmpty!16320 (= (arr!11208 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4559)) mapDefault!16320)))))

(declare-fun mapIsEmpty!16320 () Bool)

(assert (=> mapIsEmpty!16320 mapRes!16320))

(declare-fun mapNonEmpty!16320 () Bool)

(declare-fun tp!32115 () Bool)

(declare-fun e!239326 () Bool)

(assert (=> mapNonEmpty!16320 (= mapRes!16320 (and tp!32115 e!239326))))

(declare-fun mapValue!16320 () ValueCell!4559)

(declare-fun mapKey!16320 () (_ BitVec 32))

(declare-fun mapRest!16320 () (Array (_ BitVec 32) ValueCell!4559))

(assert (=> mapNonEmpty!16320 (= (arr!11208 _values!549) (store mapRest!16320 mapKey!16320 mapValue!16320))))

(declare-fun b!395300 () Bool)

(declare-fun tp_is_empty!9805 () Bool)

(assert (=> b!395300 (= e!239326 tp_is_empty!9805)))

(declare-fun b!395301 () Bool)

(declare-fun res!226636 () Bool)

(assert (=> b!395301 (=> (not res!226636) (not e!239330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395301 (= res!226636 (validMask!0 mask!1025))))

(declare-fun b!395303 () Bool)

(declare-fun res!226638 () Bool)

(assert (=> b!395303 (=> (not res!226638) (not e!239330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23514 (_ BitVec 32)) Bool)

(assert (=> b!395303 (= res!226638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!226639 () Bool)

(assert (=> start!38324 (=> (not res!226639) (not e!239330))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38324 (= res!226639 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11561 _keys!709))))))

(assert (=> start!38324 e!239330))

(assert (=> start!38324 true))

(declare-fun array_inv!8288 (array!23512) Bool)

(assert (=> start!38324 (and (array_inv!8288 _values!549) e!239328)))

(declare-fun array_inv!8289 (array!23514) Bool)

(assert (=> start!38324 (array_inv!8289 _keys!709)))

(declare-fun b!395302 () Bool)

(assert (=> b!395302 (= e!239327 tp_is_empty!9805)))

(assert (= (and start!38324 res!226639) b!395301))

(assert (= (and b!395301 res!226636) b!395297))

(assert (= (and b!395297 res!226637) b!395303))

(assert (= (and b!395303 res!226638) b!395298))

(assert (= (and b!395299 condMapEmpty!16320) mapIsEmpty!16320))

(assert (= (and b!395299 (not condMapEmpty!16320)) mapNonEmpty!16320))

(get-info :version)

(assert (= (and mapNonEmpty!16320 ((_ is ValueCellFull!4559) mapValue!16320)) b!395300))

(assert (= (and b!395299 ((_ is ValueCellFull!4559) mapDefault!16320)) b!395302))

(assert (= start!38324 b!395299))

(declare-fun m!391671 () Bool)

(assert (=> start!38324 m!391671))

(declare-fun m!391673 () Bool)

(assert (=> start!38324 m!391673))

(declare-fun m!391675 () Bool)

(assert (=> mapNonEmpty!16320 m!391675))

(declare-fun m!391677 () Bool)

(assert (=> b!395298 m!391677))

(declare-fun m!391679 () Bool)

(assert (=> b!395301 m!391679))

(declare-fun m!391681 () Bool)

(assert (=> b!395303 m!391681))

(check-sat tp_is_empty!9805 (not b!395298) (not b!395301) (not start!38324) (not mapNonEmpty!16320) (not b!395303))
(check-sat)
