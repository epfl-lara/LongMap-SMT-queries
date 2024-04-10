; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83072 () Bool)

(assert start!83072)

(declare-fun b!969092 () Bool)

(declare-fun e!546285 () Bool)

(declare-fun e!546287 () Bool)

(declare-fun mapRes!34954 () Bool)

(assert (=> b!969092 (= e!546285 (and e!546287 mapRes!34954))))

(declare-fun condMapEmpty!34954 () Bool)

(declare-datatypes ((V!34267 0))(
  ( (V!34268 (val!11032 Int)) )
))
(declare-datatypes ((ValueCell!10500 0))(
  ( (ValueCellFull!10500 (v!13591 V!34267)) (EmptyCell!10500) )
))
(declare-datatypes ((array!59999 0))(
  ( (array!60000 (arr!28863 (Array (_ BitVec 32) ValueCell!10500)) (size!29342 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59999)

(declare-fun mapDefault!34954 () ValueCell!10500)

(assert (=> b!969092 (= condMapEmpty!34954 (= (arr!28863 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10500)) mapDefault!34954)))))

(declare-fun b!969093 () Bool)

(declare-fun res!648667 () Bool)

(declare-fun e!546289 () Bool)

(assert (=> b!969093 (=> (not res!648667) (not e!546289))))

(declare-datatypes ((array!60001 0))(
  ( (array!60002 (arr!28864 (Array (_ BitVec 32) (_ BitVec 64))) (size!29343 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60001)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60001 (_ BitVec 32)) Bool)

(assert (=> b!969093 (= res!648667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!34954 () Bool)

(assert (=> mapIsEmpty!34954 mapRes!34954))

(declare-fun b!969095 () Bool)

(declare-fun res!648669 () Bool)

(assert (=> b!969095 (=> (not res!648669) (not e!546289))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969095 (= res!648669 (and (= (size!29342 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29343 _keys!1717) (size!29342 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969096 () Bool)

(declare-fun tp_is_empty!21963 () Bool)

(assert (=> b!969096 (= e!546287 tp_is_empty!21963)))

(declare-fun b!969097 () Bool)

(assert (=> b!969097 (= e!546289 false)))

(declare-fun lt!431594 () Bool)

(declare-datatypes ((List!20015 0))(
  ( (Nil!20012) (Cons!20011 (h!21173 (_ BitVec 64)) (t!28378 List!20015)) )
))
(declare-fun arrayNoDuplicates!0 (array!60001 (_ BitVec 32) List!20015) Bool)

(assert (=> b!969097 (= lt!431594 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20012))))

(declare-fun mapNonEmpty!34954 () Bool)

(declare-fun tp!66522 () Bool)

(declare-fun e!546286 () Bool)

(assert (=> mapNonEmpty!34954 (= mapRes!34954 (and tp!66522 e!546286))))

(declare-fun mapRest!34954 () (Array (_ BitVec 32) ValueCell!10500))

(declare-fun mapKey!34954 () (_ BitVec 32))

(declare-fun mapValue!34954 () ValueCell!10500)

(assert (=> mapNonEmpty!34954 (= (arr!28863 _values!1425) (store mapRest!34954 mapKey!34954 mapValue!34954))))

(declare-fun res!648668 () Bool)

(assert (=> start!83072 (=> (not res!648668) (not e!546289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83072 (= res!648668 (validMask!0 mask!2147))))

(assert (=> start!83072 e!546289))

(assert (=> start!83072 true))

(declare-fun array_inv!22345 (array!59999) Bool)

(assert (=> start!83072 (and (array_inv!22345 _values!1425) e!546285)))

(declare-fun array_inv!22346 (array!60001) Bool)

(assert (=> start!83072 (array_inv!22346 _keys!1717)))

(declare-fun b!969094 () Bool)

(assert (=> b!969094 (= e!546286 tp_is_empty!21963)))

(assert (= (and start!83072 res!648668) b!969095))

(assert (= (and b!969095 res!648669) b!969093))

(assert (= (and b!969093 res!648667) b!969097))

(assert (= (and b!969092 condMapEmpty!34954) mapIsEmpty!34954))

(assert (= (and b!969092 (not condMapEmpty!34954)) mapNonEmpty!34954))

(get-info :version)

(assert (= (and mapNonEmpty!34954 ((_ is ValueCellFull!10500) mapValue!34954)) b!969094))

(assert (= (and b!969092 ((_ is ValueCellFull!10500) mapDefault!34954)) b!969096))

(assert (= start!83072 b!969092))

(declare-fun m!897211 () Bool)

(assert (=> b!969093 m!897211))

(declare-fun m!897213 () Bool)

(assert (=> b!969097 m!897213))

(declare-fun m!897215 () Bool)

(assert (=> mapNonEmpty!34954 m!897215))

(declare-fun m!897217 () Bool)

(assert (=> start!83072 m!897217))

(declare-fun m!897219 () Bool)

(assert (=> start!83072 m!897219))

(declare-fun m!897221 () Bool)

(assert (=> start!83072 m!897221))

(check-sat (not mapNonEmpty!34954) (not b!969097) (not start!83072) (not b!969093) tp_is_empty!21963)
(check-sat)
