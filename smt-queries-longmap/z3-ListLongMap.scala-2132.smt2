; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36056 () Bool)

(assert start!36056)

(declare-fun res!201390 () Bool)

(declare-fun e!221721 () Bool)

(assert (=> start!36056 (=> (not res!201390) (not e!221721))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36056 (= res!201390 (validMask!0 mask!1943))))

(assert (=> start!36056 e!221721))

(assert (=> start!36056 true))

(declare-datatypes ((V!12197 0))(
  ( (V!12198 (val!4252 Int)) )
))
(declare-datatypes ((ValueCell!3864 0))(
  ( (ValueCellFull!3864 (v!6447 V!12197)) (EmptyCell!3864) )
))
(declare-datatypes ((array!20387 0))(
  ( (array!20388 (arr!9678 (Array (_ BitVec 32) ValueCell!3864)) (size!10030 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20387)

(declare-fun e!221723 () Bool)

(declare-fun array_inv!7122 (array!20387) Bool)

(assert (=> start!36056 (and (array_inv!7122 _values!1277) e!221723)))

(declare-datatypes ((array!20389 0))(
  ( (array!20390 (arr!9679 (Array (_ BitVec 32) (_ BitVec 64))) (size!10031 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20389)

(declare-fun array_inv!7123 (array!20389) Bool)

(assert (=> start!36056 (array_inv!7123 _keys!1541)))

(declare-fun b!361998 () Bool)

(declare-fun res!201392 () Bool)

(assert (=> b!361998 (=> (not res!201392) (not e!221721))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361998 (= res!201392 (and (= (size!10030 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10031 _keys!1541) (size!10030 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361999 () Bool)

(declare-fun e!221720 () Bool)

(declare-fun mapRes!14157 () Bool)

(assert (=> b!361999 (= e!221723 (and e!221720 mapRes!14157))))

(declare-fun condMapEmpty!14157 () Bool)

(declare-fun mapDefault!14157 () ValueCell!3864)

(assert (=> b!361999 (= condMapEmpty!14157 (= (arr!9678 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3864)) mapDefault!14157)))))

(declare-fun mapIsEmpty!14157 () Bool)

(assert (=> mapIsEmpty!14157 mapRes!14157))

(declare-fun b!362000 () Bool)

(declare-fun res!201391 () Bool)

(assert (=> b!362000 (=> (not res!201391) (not e!221721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20389 (_ BitVec 32)) Bool)

(assert (=> b!362000 (= res!201391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!362001 () Bool)

(assert (=> b!362001 (= e!221721 false)))

(declare-fun lt!166608 () Bool)

(declare-datatypes ((List!5521 0))(
  ( (Nil!5518) (Cons!5517 (h!6373 (_ BitVec 64)) (t!10671 List!5521)) )
))
(declare-fun arrayNoDuplicates!0 (array!20389 (_ BitVec 32) List!5521) Bool)

(assert (=> b!362001 (= lt!166608 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5518))))

(declare-fun b!362002 () Bool)

(declare-fun tp_is_empty!8415 () Bool)

(assert (=> b!362002 (= e!221720 tp_is_empty!8415)))

(declare-fun mapNonEmpty!14157 () Bool)

(declare-fun tp!28233 () Bool)

(declare-fun e!221724 () Bool)

(assert (=> mapNonEmpty!14157 (= mapRes!14157 (and tp!28233 e!221724))))

(declare-fun mapKey!14157 () (_ BitVec 32))

(declare-fun mapValue!14157 () ValueCell!3864)

(declare-fun mapRest!14157 () (Array (_ BitVec 32) ValueCell!3864))

(assert (=> mapNonEmpty!14157 (= (arr!9678 _values!1277) (store mapRest!14157 mapKey!14157 mapValue!14157))))

(declare-fun b!362003 () Bool)

(assert (=> b!362003 (= e!221724 tp_is_empty!8415)))

(assert (= (and start!36056 res!201390) b!361998))

(assert (= (and b!361998 res!201392) b!362000))

(assert (= (and b!362000 res!201391) b!362001))

(assert (= (and b!361999 condMapEmpty!14157) mapIsEmpty!14157))

(assert (= (and b!361999 (not condMapEmpty!14157)) mapNonEmpty!14157))

(get-info :version)

(assert (= (and mapNonEmpty!14157 ((_ is ValueCellFull!3864) mapValue!14157)) b!362003))

(assert (= (and b!361999 ((_ is ValueCellFull!3864) mapDefault!14157)) b!362002))

(assert (= start!36056 b!361999))

(declare-fun m!358595 () Bool)

(assert (=> start!36056 m!358595))

(declare-fun m!358597 () Bool)

(assert (=> start!36056 m!358597))

(declare-fun m!358599 () Bool)

(assert (=> start!36056 m!358599))

(declare-fun m!358601 () Bool)

(assert (=> b!362000 m!358601))

(declare-fun m!358603 () Bool)

(assert (=> b!362001 m!358603))

(declare-fun m!358605 () Bool)

(assert (=> mapNonEmpty!14157 m!358605))

(check-sat (not start!36056) (not mapNonEmpty!14157) tp_is_empty!8415 (not b!362001) (not b!362000))
(check-sat)
