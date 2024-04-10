; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83066 () Bool)

(assert start!83066)

(declare-fun mapNonEmpty!34945 () Bool)

(declare-fun mapRes!34945 () Bool)

(declare-fun tp!66513 () Bool)

(declare-fun e!546243 () Bool)

(assert (=> mapNonEmpty!34945 (= mapRes!34945 (and tp!66513 e!546243))))

(declare-datatypes ((V!34259 0))(
  ( (V!34260 (val!11029 Int)) )
))
(declare-datatypes ((ValueCell!10497 0))(
  ( (ValueCellFull!10497 (v!13588 V!34259)) (EmptyCell!10497) )
))
(declare-datatypes ((array!59987 0))(
  ( (array!59988 (arr!28857 (Array (_ BitVec 32) ValueCell!10497)) (size!29336 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59987)

(declare-fun mapKey!34945 () (_ BitVec 32))

(declare-fun mapRest!34945 () (Array (_ BitVec 32) ValueCell!10497))

(declare-fun mapValue!34945 () ValueCell!10497)

(assert (=> mapNonEmpty!34945 (= (arr!28857 _values!1425) (store mapRest!34945 mapKey!34945 mapValue!34945))))

(declare-fun mapIsEmpty!34945 () Bool)

(assert (=> mapIsEmpty!34945 mapRes!34945))

(declare-fun b!969038 () Bool)

(declare-fun e!546241 () Bool)

(declare-fun e!546244 () Bool)

(assert (=> b!969038 (= e!546241 (and e!546244 mapRes!34945))))

(declare-fun condMapEmpty!34945 () Bool)

(declare-fun mapDefault!34945 () ValueCell!10497)

(assert (=> b!969038 (= condMapEmpty!34945 (= (arr!28857 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10497)) mapDefault!34945)))))

(declare-fun b!969039 () Bool)

(declare-fun tp_is_empty!21957 () Bool)

(assert (=> b!969039 (= e!546243 tp_is_empty!21957)))

(declare-fun b!969040 () Bool)

(declare-fun e!546240 () Bool)

(assert (=> b!969040 (= e!546240 false)))

(declare-fun lt!431585 () Bool)

(declare-datatypes ((array!59989 0))(
  ( (array!59990 (arr!28858 (Array (_ BitVec 32) (_ BitVec 64))) (size!29337 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59989)

(declare-datatypes ((List!20012 0))(
  ( (Nil!20009) (Cons!20008 (h!21170 (_ BitVec 64)) (t!28375 List!20012)) )
))
(declare-fun arrayNoDuplicates!0 (array!59989 (_ BitVec 32) List!20012) Bool)

(assert (=> b!969040 (= lt!431585 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20009))))

(declare-fun b!969041 () Bool)

(declare-fun res!648642 () Bool)

(assert (=> b!969041 (=> (not res!648642) (not e!546240))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59989 (_ BitVec 32)) Bool)

(assert (=> b!969041 (= res!648642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!648641 () Bool)

(assert (=> start!83066 (=> (not res!648641) (not e!546240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83066 (= res!648641 (validMask!0 mask!2147))))

(assert (=> start!83066 e!546240))

(assert (=> start!83066 true))

(declare-fun array_inv!22339 (array!59987) Bool)

(assert (=> start!83066 (and (array_inv!22339 _values!1425) e!546241)))

(declare-fun array_inv!22340 (array!59989) Bool)

(assert (=> start!83066 (array_inv!22340 _keys!1717)))

(declare-fun b!969042 () Bool)

(assert (=> b!969042 (= e!546244 tp_is_empty!21957)))

(declare-fun b!969043 () Bool)

(declare-fun res!648640 () Bool)

(assert (=> b!969043 (=> (not res!648640) (not e!546240))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969043 (= res!648640 (and (= (size!29336 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29337 _keys!1717) (size!29336 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83066 res!648641) b!969043))

(assert (= (and b!969043 res!648640) b!969041))

(assert (= (and b!969041 res!648642) b!969040))

(assert (= (and b!969038 condMapEmpty!34945) mapIsEmpty!34945))

(assert (= (and b!969038 (not condMapEmpty!34945)) mapNonEmpty!34945))

(get-info :version)

(assert (= (and mapNonEmpty!34945 ((_ is ValueCellFull!10497) mapValue!34945)) b!969039))

(assert (= (and b!969038 ((_ is ValueCellFull!10497) mapDefault!34945)) b!969042))

(assert (= start!83066 b!969038))

(declare-fun m!897175 () Bool)

(assert (=> mapNonEmpty!34945 m!897175))

(declare-fun m!897177 () Bool)

(assert (=> b!969040 m!897177))

(declare-fun m!897179 () Bool)

(assert (=> b!969041 m!897179))

(declare-fun m!897181 () Bool)

(assert (=> start!83066 m!897181))

(declare-fun m!897183 () Bool)

(assert (=> start!83066 m!897183))

(declare-fun m!897185 () Bool)

(assert (=> start!83066 m!897185))

(check-sat (not start!83066) tp_is_empty!21957 (not b!969040) (not mapNonEmpty!34945) (not b!969041))
(check-sat)
