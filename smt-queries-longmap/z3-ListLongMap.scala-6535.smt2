; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83076 () Bool)

(assert start!83076)

(declare-fun b!969051 () Bool)

(declare-fun res!648658 () Bool)

(declare-fun e!546306 () Bool)

(assert (=> b!969051 (=> (not res!648658) (not e!546306))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34297 0))(
  ( (V!34298 (val!11043 Int)) )
))
(declare-datatypes ((ValueCell!10511 0))(
  ( (ValueCellFull!10511 (v!13601 V!34297)) (EmptyCell!10511) )
))
(declare-datatypes ((array!59972 0))(
  ( (array!59973 (arr!28850 (Array (_ BitVec 32) ValueCell!10511)) (size!29331 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59972)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59974 0))(
  ( (array!59975 (arr!28851 (Array (_ BitVec 32) (_ BitVec 64))) (size!29332 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59974)

(assert (=> b!969051 (= res!648658 (and (= (size!29331 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29332 _keys!1717) (size!29331 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969052 () Bool)

(declare-fun e!546303 () Bool)

(declare-fun tp_is_empty!21985 () Bool)

(assert (=> b!969052 (= e!546303 tp_is_empty!21985)))

(declare-fun res!648657 () Bool)

(assert (=> start!83076 (=> (not res!648657) (not e!546306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83076 (= res!648657 (validMask!0 mask!2147))))

(assert (=> start!83076 e!546306))

(assert (=> start!83076 true))

(declare-fun e!546304 () Bool)

(declare-fun array_inv!22399 (array!59972) Bool)

(assert (=> start!83076 (and (array_inv!22399 _values!1425) e!546304)))

(declare-fun array_inv!22400 (array!59974) Bool)

(assert (=> start!83076 (array_inv!22400 _keys!1717)))

(declare-fun b!969053 () Bool)

(declare-fun res!648656 () Bool)

(assert (=> b!969053 (=> (not res!648656) (not e!546306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59974 (_ BitVec 32)) Bool)

(assert (=> b!969053 (= res!648656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!34987 () Bool)

(declare-fun mapRes!34987 () Bool)

(assert (=> mapIsEmpty!34987 mapRes!34987))

(declare-fun b!969054 () Bool)

(assert (=> b!969054 (= e!546306 false)))

(declare-fun lt!431391 () Bool)

(declare-datatypes ((List!20055 0))(
  ( (Nil!20052) (Cons!20051 (h!21213 (_ BitVec 64)) (t!28409 List!20055)) )
))
(declare-fun arrayNoDuplicates!0 (array!59974 (_ BitVec 32) List!20055) Bool)

(assert (=> b!969054 (= lt!431391 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20052))))

(declare-fun b!969055 () Bool)

(declare-fun e!546302 () Bool)

(assert (=> b!969055 (= e!546302 tp_is_empty!21985)))

(declare-fun b!969056 () Bool)

(assert (=> b!969056 (= e!546304 (and e!546302 mapRes!34987))))

(declare-fun condMapEmpty!34987 () Bool)

(declare-fun mapDefault!34987 () ValueCell!10511)

(assert (=> b!969056 (= condMapEmpty!34987 (= (arr!28850 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10511)) mapDefault!34987)))))

(declare-fun mapNonEmpty!34987 () Bool)

(declare-fun tp!66556 () Bool)

(assert (=> mapNonEmpty!34987 (= mapRes!34987 (and tp!66556 e!546303))))

(declare-fun mapValue!34987 () ValueCell!10511)

(declare-fun mapKey!34987 () (_ BitVec 32))

(declare-fun mapRest!34987 () (Array (_ BitVec 32) ValueCell!10511))

(assert (=> mapNonEmpty!34987 (= (arr!28850 _values!1425) (store mapRest!34987 mapKey!34987 mapValue!34987))))

(assert (= (and start!83076 res!648657) b!969051))

(assert (= (and b!969051 res!648658) b!969053))

(assert (= (and b!969053 res!648656) b!969054))

(assert (= (and b!969056 condMapEmpty!34987) mapIsEmpty!34987))

(assert (= (and b!969056 (not condMapEmpty!34987)) mapNonEmpty!34987))

(get-info :version)

(assert (= (and mapNonEmpty!34987 ((_ is ValueCellFull!10511) mapValue!34987)) b!969052))

(assert (= (and b!969056 ((_ is ValueCellFull!10511) mapDefault!34987)) b!969055))

(assert (= start!83076 b!969056))

(declare-fun m!896585 () Bool)

(assert (=> start!83076 m!896585))

(declare-fun m!896587 () Bool)

(assert (=> start!83076 m!896587))

(declare-fun m!896589 () Bool)

(assert (=> start!83076 m!896589))

(declare-fun m!896591 () Bool)

(assert (=> b!969053 m!896591))

(declare-fun m!896593 () Bool)

(assert (=> b!969054 m!896593))

(declare-fun m!896595 () Bool)

(assert (=> mapNonEmpty!34987 m!896595))

(check-sat (not b!969054) (not mapNonEmpty!34987) tp_is_empty!21985 (not b!969053) (not start!83076))
(check-sat)
