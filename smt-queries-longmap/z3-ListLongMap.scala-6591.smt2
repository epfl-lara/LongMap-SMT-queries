; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83412 () Bool)

(assert start!83412)

(declare-fun b_free!19423 () Bool)

(declare-fun b_next!19423 () Bool)

(assert (=> start!83412 (= b_free!19423 (not b_next!19423))))

(declare-fun tp!67549 () Bool)

(declare-fun b_and!30999 () Bool)

(assert (=> start!83412 (= tp!67549 b_and!30999)))

(declare-fun b!974195 () Bool)

(declare-fun e!549075 () Bool)

(declare-fun e!549076 () Bool)

(declare-fun mapRes!35491 () Bool)

(assert (=> b!974195 (= e!549075 (and e!549076 mapRes!35491))))

(declare-fun condMapEmpty!35491 () Bool)

(declare-datatypes ((V!34745 0))(
  ( (V!34746 (val!11211 Int)) )
))
(declare-datatypes ((ValueCell!10679 0))(
  ( (ValueCellFull!10679 (v!13769 V!34745)) (EmptyCell!10679) )
))
(declare-datatypes ((array!60608 0))(
  ( (array!60609 (arr!29168 (Array (_ BitVec 32) ValueCell!10679)) (size!29649 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60608)

(declare-fun mapDefault!35491 () ValueCell!10679)

(assert (=> b!974195 (= condMapEmpty!35491 (= (arr!29168 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10679)) mapDefault!35491)))))

(declare-fun b!974197 () Bool)

(declare-fun tp_is_empty!22321 () Bool)

(assert (=> b!974197 (= e!549076 tp_is_empty!22321)))

(declare-fun b!974198 () Bool)

(declare-fun res!652180 () Bool)

(declare-fun e!549077 () Bool)

(assert (=> b!974198 (=> (not res!652180) (not e!549077))))

(declare-datatypes ((array!60610 0))(
  ( (array!60611 (arr!29169 (Array (_ BitVec 32) (_ BitVec 64))) (size!29650 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60610)

(declare-datatypes ((List!20283 0))(
  ( (Nil!20280) (Cons!20279 (h!21441 (_ BitVec 64)) (t!28751 List!20283)) )
))
(declare-fun arrayNoDuplicates!0 (array!60610 (_ BitVec 32) List!20283) Bool)

(assert (=> b!974198 (= res!652180 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20280))))

(declare-fun b!974199 () Bool)

(declare-fun res!652179 () Bool)

(assert (=> b!974199 (=> (not res!652179) (not e!549077))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974199 (= res!652179 (and (= (size!29649 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29650 _keys!1717) (size!29649 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974200 () Bool)

(declare-fun res!652174 () Bool)

(assert (=> b!974200 (=> (not res!652174) (not e!549077))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974200 (= res!652174 (validKeyInArray!0 (select (arr!29169 _keys!1717) i!822)))))

(declare-fun b!974201 () Bool)

(declare-fun res!652175 () Bool)

(assert (=> b!974201 (=> (not res!652175) (not e!549077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60610 (_ BitVec 32)) Bool)

(assert (=> b!974201 (= res!652175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35491 () Bool)

(assert (=> mapIsEmpty!35491 mapRes!35491))

(declare-fun b!974202 () Bool)

(assert (=> b!974202 (= e!549077 false)))

(declare-datatypes ((tuple2!14478 0))(
  ( (tuple2!14479 (_1!7250 (_ BitVec 64)) (_2!7250 V!34745)) )
))
(declare-datatypes ((List!20284 0))(
  ( (Nil!20281) (Cons!20280 (h!21442 tuple2!14478) (t!28752 List!20284)) )
))
(declare-datatypes ((ListLongMap!13165 0))(
  ( (ListLongMap!13166 (toList!6598 List!20284)) )
))
(declare-fun lt!432534 () ListLongMap!13165)

(declare-fun zeroValue!1367 () V!34745)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34745)

(declare-fun getCurrentListMap!3760 (array!60610 array!60608 (_ BitVec 32) (_ BitVec 32) V!34745 V!34745 (_ BitVec 32) Int) ListLongMap!13165)

(assert (=> b!974202 (= lt!432534 (getCurrentListMap!3760 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35491 () Bool)

(declare-fun tp!67548 () Bool)

(declare-fun e!549074 () Bool)

(assert (=> mapNonEmpty!35491 (= mapRes!35491 (and tp!67548 e!549074))))

(declare-fun mapKey!35491 () (_ BitVec 32))

(declare-fun mapRest!35491 () (Array (_ BitVec 32) ValueCell!10679))

(declare-fun mapValue!35491 () ValueCell!10679)

(assert (=> mapNonEmpty!35491 (= (arr!29168 _values!1425) (store mapRest!35491 mapKey!35491 mapValue!35491))))

(declare-fun b!974203 () Bool)

(declare-fun res!652176 () Bool)

(assert (=> b!974203 (=> (not res!652176) (not e!549077))))

(declare-fun contains!5636 (ListLongMap!13165 (_ BitVec 64)) Bool)

(assert (=> b!974203 (= res!652176 (contains!5636 (getCurrentListMap!3760 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29169 _keys!1717) i!822)))))

(declare-fun b!974204 () Bool)

(assert (=> b!974204 (= e!549074 tp_is_empty!22321)))

(declare-fun b!974196 () Bool)

(declare-fun res!652178 () Bool)

(assert (=> b!974196 (=> (not res!652178) (not e!549077))))

(assert (=> b!974196 (= res!652178 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29650 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29650 _keys!1717))))))

(declare-fun res!652177 () Bool)

(assert (=> start!83412 (=> (not res!652177) (not e!549077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83412 (= res!652177 (validMask!0 mask!2147))))

(assert (=> start!83412 e!549077))

(assert (=> start!83412 true))

(declare-fun array_inv!22615 (array!60608) Bool)

(assert (=> start!83412 (and (array_inv!22615 _values!1425) e!549075)))

(assert (=> start!83412 tp_is_empty!22321))

(assert (=> start!83412 tp!67549))

(declare-fun array_inv!22616 (array!60610) Bool)

(assert (=> start!83412 (array_inv!22616 _keys!1717)))

(assert (= (and start!83412 res!652177) b!974199))

(assert (= (and b!974199 res!652179) b!974201))

(assert (= (and b!974201 res!652175) b!974198))

(assert (= (and b!974198 res!652180) b!974196))

(assert (= (and b!974196 res!652178) b!974200))

(assert (= (and b!974200 res!652174) b!974203))

(assert (= (and b!974203 res!652176) b!974202))

(assert (= (and b!974195 condMapEmpty!35491) mapIsEmpty!35491))

(assert (= (and b!974195 (not condMapEmpty!35491)) mapNonEmpty!35491))

(get-info :version)

(assert (= (and mapNonEmpty!35491 ((_ is ValueCellFull!10679) mapValue!35491)) b!974204))

(assert (= (and b!974195 ((_ is ValueCellFull!10679) mapDefault!35491)) b!974197))

(assert (= start!83412 b!974195))

(declare-fun m!901199 () Bool)

(assert (=> b!974203 m!901199))

(declare-fun m!901201 () Bool)

(assert (=> b!974203 m!901201))

(assert (=> b!974203 m!901199))

(assert (=> b!974203 m!901201))

(declare-fun m!901203 () Bool)

(assert (=> b!974203 m!901203))

(declare-fun m!901205 () Bool)

(assert (=> b!974201 m!901205))

(assert (=> b!974200 m!901201))

(assert (=> b!974200 m!901201))

(declare-fun m!901207 () Bool)

(assert (=> b!974200 m!901207))

(declare-fun m!901209 () Bool)

(assert (=> b!974202 m!901209))

(declare-fun m!901211 () Bool)

(assert (=> mapNonEmpty!35491 m!901211))

(declare-fun m!901213 () Bool)

(assert (=> b!974198 m!901213))

(declare-fun m!901215 () Bool)

(assert (=> start!83412 m!901215))

(declare-fun m!901217 () Bool)

(assert (=> start!83412 m!901217))

(declare-fun m!901219 () Bool)

(assert (=> start!83412 m!901219))

(check-sat (not mapNonEmpty!35491) (not b_next!19423) (not b!974200) (not b!974203) b_and!30999 tp_is_empty!22321 (not b!974202) (not b!974198) (not start!83412) (not b!974201))
(check-sat b_and!30999 (not b_next!19423))
