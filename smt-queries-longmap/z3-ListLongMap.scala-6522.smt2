; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83140 () Bool)

(assert start!83140)

(declare-fun b!969379 () Bool)

(declare-fun e!546352 () Bool)

(declare-fun tp_is_empty!21907 () Bool)

(assert (=> b!969379 (= e!546352 tp_is_empty!21907)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34193 0))(
  ( (V!34194 (val!11004 Int)) )
))
(declare-datatypes ((ValueCell!10472 0))(
  ( (ValueCellFull!10472 (v!13559 V!34193)) (EmptyCell!10472) )
))
(declare-datatypes ((array!59900 0))(
  ( (array!59901 (arr!28814 (Array (_ BitVec 32) ValueCell!10472)) (size!29294 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59900)

(declare-fun e!546353 () Bool)

(declare-fun b!969380 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59902 0))(
  ( (array!59903 (arr!28815 (Array (_ BitVec 32) (_ BitVec 64))) (size!29295 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59902)

(assert (=> b!969380 (= e!546353 (and (= (size!29294 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29295 _keys!1717) (size!29294 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011) (not (= (size!29295 _keys!1717) (bvadd #b00000000000000000000000000000001 mask!2147)))))))

(declare-fun mapIsEmpty!34855 () Bool)

(declare-fun mapRes!34855 () Bool)

(assert (=> mapIsEmpty!34855 mapRes!34855))

(declare-fun b!969381 () Bool)

(declare-fun e!546356 () Bool)

(assert (=> b!969381 (= e!546356 (and e!546352 mapRes!34855))))

(declare-fun condMapEmpty!34855 () Bool)

(declare-fun mapDefault!34855 () ValueCell!10472)

(assert (=> b!969381 (= condMapEmpty!34855 (= (arr!28814 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10472)) mapDefault!34855)))))

(declare-fun b!969382 () Bool)

(declare-fun e!546354 () Bool)

(assert (=> b!969382 (= e!546354 tp_is_empty!21907)))

(declare-fun res!648711 () Bool)

(assert (=> start!83140 (=> (not res!648711) (not e!546353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83140 (= res!648711 (validMask!0 mask!2147))))

(assert (=> start!83140 e!546353))

(assert (=> start!83140 true))

(declare-fun array_inv!22367 (array!59900) Bool)

(assert (=> start!83140 (and (array_inv!22367 _values!1425) e!546356)))

(declare-fun array_inv!22368 (array!59902) Bool)

(assert (=> start!83140 (array_inv!22368 _keys!1717)))

(declare-fun mapNonEmpty!34855 () Bool)

(declare-fun tp!66424 () Bool)

(assert (=> mapNonEmpty!34855 (= mapRes!34855 (and tp!66424 e!546354))))

(declare-fun mapRest!34855 () (Array (_ BitVec 32) ValueCell!10472))

(declare-fun mapKey!34855 () (_ BitVec 32))

(declare-fun mapValue!34855 () ValueCell!10472)

(assert (=> mapNonEmpty!34855 (= (arr!28814 _values!1425) (store mapRest!34855 mapKey!34855 mapValue!34855))))

(assert (= (and start!83140 res!648711) b!969380))

(assert (= (and b!969381 condMapEmpty!34855) mapIsEmpty!34855))

(assert (= (and b!969381 (not condMapEmpty!34855)) mapNonEmpty!34855))

(get-info :version)

(assert (= (and mapNonEmpty!34855 ((_ is ValueCellFull!10472) mapValue!34855)) b!969382))

(assert (= (and b!969381 ((_ is ValueCellFull!10472) mapDefault!34855)) b!969379))

(assert (= start!83140 b!969381))

(declare-fun m!898117 () Bool)

(assert (=> start!83140 m!898117))

(declare-fun m!898119 () Bool)

(assert (=> start!83140 m!898119))

(declare-fun m!898121 () Bool)

(assert (=> start!83140 m!898121))

(declare-fun m!898123 () Bool)

(assert (=> mapNonEmpty!34855 m!898123))

(check-sat (not start!83140) (not mapNonEmpty!34855) tp_is_empty!21907)
(check-sat)
