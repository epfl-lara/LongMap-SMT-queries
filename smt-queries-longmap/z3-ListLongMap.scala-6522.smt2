; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82954 () Bool)

(assert start!82954)

(declare-fun b!968237 () Bool)

(declare-fun e!545624 () Bool)

(declare-fun e!545626 () Bool)

(declare-fun mapRes!34855 () Bool)

(assert (=> b!968237 (= e!545624 (and e!545626 mapRes!34855))))

(declare-fun condMapEmpty!34855 () Bool)

(declare-datatypes ((V!34193 0))(
  ( (V!34194 (val!11004 Int)) )
))
(declare-datatypes ((ValueCell!10472 0))(
  ( (ValueCellFull!10472 (v!13561 V!34193)) (EmptyCell!10472) )
))
(declare-datatypes ((array!59814 0))(
  ( (array!59815 (arr!28776 (Array (_ BitVec 32) ValueCell!10472)) (size!29257 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59814)

(declare-fun mapDefault!34855 () ValueCell!10472)

(assert (=> b!968237 (= condMapEmpty!34855 (= (arr!28776 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10472)) mapDefault!34855)))))

(declare-fun res!648257 () Bool)

(declare-fun e!545623 () Bool)

(assert (=> start!82954 (=> (not res!648257) (not e!545623))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82954 (= res!648257 (validMask!0 mask!2147))))

(assert (=> start!82954 e!545623))

(assert (=> start!82954 true))

(declare-fun array_inv!22341 (array!59814) Bool)

(assert (=> start!82954 (and (array_inv!22341 _values!1425) e!545624)))

(declare-datatypes ((array!59816 0))(
  ( (array!59817 (arr!28777 (Array (_ BitVec 32) (_ BitVec 64))) (size!29258 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59816)

(declare-fun array_inv!22342 (array!59816) Bool)

(assert (=> start!82954 (array_inv!22342 _keys!1717)))

(declare-fun mapIsEmpty!34855 () Bool)

(assert (=> mapIsEmpty!34855 mapRes!34855))

(declare-fun b!968238 () Bool)

(declare-fun e!545622 () Bool)

(declare-fun tp_is_empty!21907 () Bool)

(assert (=> b!968238 (= e!545622 tp_is_empty!21907)))

(declare-fun b!968239 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968239 (= e!545623 (and (= (size!29257 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29258 _keys!1717) (size!29257 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011) (not (= (size!29258 _keys!1717) (bvadd #b00000000000000000000000000000001 mask!2147)))))))

(declare-fun mapNonEmpty!34855 () Bool)

(declare-fun tp!66424 () Bool)

(assert (=> mapNonEmpty!34855 (= mapRes!34855 (and tp!66424 e!545622))))

(declare-fun mapRest!34855 () (Array (_ BitVec 32) ValueCell!10472))

(declare-fun mapKey!34855 () (_ BitVec 32))

(declare-fun mapValue!34855 () ValueCell!10472)

(assert (=> mapNonEmpty!34855 (= (arr!28776 _values!1425) (store mapRest!34855 mapKey!34855 mapValue!34855))))

(declare-fun b!968240 () Bool)

(assert (=> b!968240 (= e!545626 tp_is_empty!21907)))

(assert (= (and start!82954 res!648257) b!968239))

(assert (= (and b!968237 condMapEmpty!34855) mapIsEmpty!34855))

(assert (= (and b!968237 (not condMapEmpty!34855)) mapNonEmpty!34855))

(get-info :version)

(assert (= (and mapNonEmpty!34855 ((_ is ValueCellFull!10472) mapValue!34855)) b!968238))

(assert (= (and b!968237 ((_ is ValueCellFull!10472) mapDefault!34855)) b!968240))

(assert (= start!82954 b!968237))

(declare-fun m!896065 () Bool)

(assert (=> start!82954 m!896065))

(declare-fun m!896067 () Bool)

(assert (=> start!82954 m!896067))

(declare-fun m!896069 () Bool)

(assert (=> start!82954 m!896069))

(declare-fun m!896071 () Bool)

(assert (=> mapNonEmpty!34855 m!896071))

(check-sat (not start!82954) (not mapNonEmpty!34855) tp_is_empty!21907)
(check-sat)
