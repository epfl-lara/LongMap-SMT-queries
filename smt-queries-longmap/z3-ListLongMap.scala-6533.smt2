; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83084 () Bool)

(assert start!83084)

(declare-fun b!969200 () Bool)

(declare-fun res!648721 () Bool)

(declare-fun e!546375 () Bool)

(assert (=> b!969200 (=> (not res!648721) (not e!546375))))

(declare-datatypes ((array!60019 0))(
  ( (array!60020 (arr!28873 (Array (_ BitVec 32) (_ BitVec 64))) (size!29352 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60019)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60019 (_ BitVec 32)) Bool)

(assert (=> b!969200 (= res!648721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!34972 () Bool)

(declare-fun mapRes!34972 () Bool)

(assert (=> mapIsEmpty!34972 mapRes!34972))

(declare-fun b!969201 () Bool)

(declare-fun e!546376 () Bool)

(declare-fun tp_is_empty!21975 () Bool)

(assert (=> b!969201 (= e!546376 tp_is_empty!21975)))

(declare-fun mapNonEmpty!34972 () Bool)

(declare-fun tp!66540 () Bool)

(declare-fun e!546377 () Bool)

(assert (=> mapNonEmpty!34972 (= mapRes!34972 (and tp!66540 e!546377))))

(declare-datatypes ((V!34283 0))(
  ( (V!34284 (val!11038 Int)) )
))
(declare-datatypes ((ValueCell!10506 0))(
  ( (ValueCellFull!10506 (v!13597 V!34283)) (EmptyCell!10506) )
))
(declare-datatypes ((array!60021 0))(
  ( (array!60022 (arr!28874 (Array (_ BitVec 32) ValueCell!10506)) (size!29353 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60021)

(declare-fun mapValue!34972 () ValueCell!10506)

(declare-fun mapKey!34972 () (_ BitVec 32))

(declare-fun mapRest!34972 () (Array (_ BitVec 32) ValueCell!10506))

(assert (=> mapNonEmpty!34972 (= (arr!28874 _values!1425) (store mapRest!34972 mapKey!34972 mapValue!34972))))

(declare-fun b!969202 () Bool)

(declare-fun e!546378 () Bool)

(assert (=> b!969202 (= e!546378 (and e!546376 mapRes!34972))))

(declare-fun condMapEmpty!34972 () Bool)

(declare-fun mapDefault!34972 () ValueCell!10506)

(assert (=> b!969202 (= condMapEmpty!34972 (= (arr!28874 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10506)) mapDefault!34972)))))

(declare-fun res!648723 () Bool)

(assert (=> start!83084 (=> (not res!648723) (not e!546375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83084 (= res!648723 (validMask!0 mask!2147))))

(assert (=> start!83084 e!546375))

(assert (=> start!83084 true))

(declare-fun array_inv!22351 (array!60021) Bool)

(assert (=> start!83084 (and (array_inv!22351 _values!1425) e!546378)))

(declare-fun array_inv!22352 (array!60019) Bool)

(assert (=> start!83084 (array_inv!22352 _keys!1717)))

(declare-fun b!969203 () Bool)

(declare-fun res!648722 () Bool)

(assert (=> b!969203 (=> (not res!648722) (not e!546375))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969203 (= res!648722 (and (= (size!29353 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29352 _keys!1717) (size!29353 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969204 () Bool)

(assert (=> b!969204 (= e!546377 tp_is_empty!21975)))

(declare-fun b!969205 () Bool)

(assert (=> b!969205 (= e!546375 false)))

(declare-fun lt!431612 () Bool)

(declare-datatypes ((List!20018 0))(
  ( (Nil!20015) (Cons!20014 (h!21176 (_ BitVec 64)) (t!28381 List!20018)) )
))
(declare-fun arrayNoDuplicates!0 (array!60019 (_ BitVec 32) List!20018) Bool)

(assert (=> b!969205 (= lt!431612 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20015))))

(assert (= (and start!83084 res!648723) b!969203))

(assert (= (and b!969203 res!648722) b!969200))

(assert (= (and b!969200 res!648721) b!969205))

(assert (= (and b!969202 condMapEmpty!34972) mapIsEmpty!34972))

(assert (= (and b!969202 (not condMapEmpty!34972)) mapNonEmpty!34972))

(get-info :version)

(assert (= (and mapNonEmpty!34972 ((_ is ValueCellFull!10506) mapValue!34972)) b!969204))

(assert (= (and b!969202 ((_ is ValueCellFull!10506) mapDefault!34972)) b!969201))

(assert (= start!83084 b!969202))

(declare-fun m!897283 () Bool)

(assert (=> b!969200 m!897283))

(declare-fun m!897285 () Bool)

(assert (=> mapNonEmpty!34972 m!897285))

(declare-fun m!897287 () Bool)

(assert (=> start!83084 m!897287))

(declare-fun m!897289 () Bool)

(assert (=> start!83084 m!897289))

(declare-fun m!897291 () Bool)

(assert (=> start!83084 m!897291))

(declare-fun m!897293 () Bool)

(assert (=> b!969205 m!897293))

(check-sat (not mapNonEmpty!34972) (not b!969205) (not start!83084) tp_is_empty!21975 (not b!969200))
(check-sat)
