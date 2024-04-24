; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83262 () Bool)

(assert start!83262)

(declare-fun b!970193 () Bool)

(declare-fun res!649111 () Bool)

(declare-fun e!547033 () Bool)

(assert (=> b!970193 (=> (not res!649111) (not e!547033))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34297 0))(
  ( (V!34298 (val!11043 Int)) )
))
(declare-datatypes ((ValueCell!10511 0))(
  ( (ValueCellFull!10511 (v!13599 V!34297)) (EmptyCell!10511) )
))
(declare-datatypes ((array!60050 0))(
  ( (array!60051 (arr!28884 (Array (_ BitVec 32) ValueCell!10511)) (size!29364 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60050)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60052 0))(
  ( (array!60053 (arr!28885 (Array (_ BitVec 32) (_ BitVec 64))) (size!29365 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60052)

(assert (=> b!970193 (= res!649111 (and (= (size!29364 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29365 _keys!1717) (size!29364 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970194 () Bool)

(declare-fun e!547032 () Bool)

(declare-fun tp_is_empty!21985 () Bool)

(assert (=> b!970194 (= e!547032 tp_is_empty!21985)))

(declare-fun mapIsEmpty!34987 () Bool)

(declare-fun mapRes!34987 () Bool)

(assert (=> mapIsEmpty!34987 mapRes!34987))

(declare-fun b!970195 () Bool)

(declare-fun e!547036 () Bool)

(assert (=> b!970195 (= e!547036 (and e!547032 mapRes!34987))))

(declare-fun condMapEmpty!34987 () Bool)

(declare-fun mapDefault!34987 () ValueCell!10511)

(assert (=> b!970195 (= condMapEmpty!34987 (= (arr!28884 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10511)) mapDefault!34987)))))

(declare-fun b!970196 () Bool)

(assert (=> b!970196 (= e!547033 false)))

(declare-fun lt!431988 () Bool)

(declare-datatypes ((List!20014 0))(
  ( (Nil!20011) (Cons!20010 (h!21178 (_ BitVec 64)) (t!28369 List!20014)) )
))
(declare-fun arrayNoDuplicates!0 (array!60052 (_ BitVec 32) List!20014) Bool)

(assert (=> b!970196 (= lt!431988 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20011))))

(declare-fun mapNonEmpty!34987 () Bool)

(declare-fun tp!66556 () Bool)

(declare-fun e!547034 () Bool)

(assert (=> mapNonEmpty!34987 (= mapRes!34987 (and tp!66556 e!547034))))

(declare-fun mapKey!34987 () (_ BitVec 32))

(declare-fun mapValue!34987 () ValueCell!10511)

(declare-fun mapRest!34987 () (Array (_ BitVec 32) ValueCell!10511))

(assert (=> mapNonEmpty!34987 (= (arr!28884 _values!1425) (store mapRest!34987 mapKey!34987 mapValue!34987))))

(declare-fun b!970197 () Bool)

(declare-fun res!649110 () Bool)

(assert (=> b!970197 (=> (not res!649110) (not e!547033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60052 (_ BitVec 32)) Bool)

(assert (=> b!970197 (= res!649110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970198 () Bool)

(assert (=> b!970198 (= e!547034 tp_is_empty!21985)))

(declare-fun res!649112 () Bool)

(assert (=> start!83262 (=> (not res!649112) (not e!547033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83262 (= res!649112 (validMask!0 mask!2147))))

(assert (=> start!83262 e!547033))

(assert (=> start!83262 true))

(declare-fun array_inv!22413 (array!60050) Bool)

(assert (=> start!83262 (and (array_inv!22413 _values!1425) e!547036)))

(declare-fun array_inv!22414 (array!60052) Bool)

(assert (=> start!83262 (array_inv!22414 _keys!1717)))

(assert (= (and start!83262 res!649112) b!970193))

(assert (= (and b!970193 res!649111) b!970197))

(assert (= (and b!970197 res!649110) b!970196))

(assert (= (and b!970195 condMapEmpty!34987) mapIsEmpty!34987))

(assert (= (and b!970195 (not condMapEmpty!34987)) mapNonEmpty!34987))

(get-info :version)

(assert (= (and mapNonEmpty!34987 ((_ is ValueCellFull!10511) mapValue!34987)) b!970198))

(assert (= (and b!970195 ((_ is ValueCellFull!10511) mapDefault!34987)) b!970194))

(assert (= start!83262 b!970195))

(declare-fun m!898637 () Bool)

(assert (=> b!970196 m!898637))

(declare-fun m!898639 () Bool)

(assert (=> mapNonEmpty!34987 m!898639))

(declare-fun m!898641 () Bool)

(assert (=> b!970197 m!898641))

(declare-fun m!898643 () Bool)

(assert (=> start!83262 m!898643))

(declare-fun m!898645 () Bool)

(assert (=> start!83262 m!898645))

(declare-fun m!898647 () Bool)

(assert (=> start!83262 m!898647))

(check-sat (not b!970196) (not start!83262) tp_is_empty!21985 (not mapNonEmpty!34987) (not b!970197))
(check-sat)
