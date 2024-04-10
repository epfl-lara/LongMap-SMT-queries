; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83420 () Bool)

(assert start!83420)

(declare-fun b_free!19413 () Bool)

(declare-fun b_next!19413 () Bool)

(assert (=> start!83420 (= b_free!19413 (not b_next!19413))))

(declare-fun tp!67517 () Bool)

(declare-fun b_and!31015 () Bool)

(assert (=> start!83420 (= tp!67517 b_and!31015)))

(declare-fun b!974284 () Bool)

(declare-fun res!652184 () Bool)

(declare-fun e!549151 () Bool)

(assert (=> b!974284 (=> (not res!652184) (not e!549151))))

(declare-datatypes ((array!60663 0))(
  ( (array!60664 (arr!29195 (Array (_ BitVec 32) (_ BitVec 64))) (size!29674 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60663)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974284 (= res!652184 (validKeyInArray!0 (select (arr!29195 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35476 () Bool)

(declare-fun mapRes!35476 () Bool)

(declare-fun tp!67518 () Bool)

(declare-fun e!549148 () Bool)

(assert (=> mapNonEmpty!35476 (= mapRes!35476 (and tp!67518 e!549148))))

(declare-datatypes ((V!34731 0))(
  ( (V!34732 (val!11206 Int)) )
))
(declare-datatypes ((ValueCell!10674 0))(
  ( (ValueCellFull!10674 (v!13765 V!34731)) (EmptyCell!10674) )
))
(declare-datatypes ((array!60665 0))(
  ( (array!60666 (arr!29196 (Array (_ BitVec 32) ValueCell!10674)) (size!29675 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60665)

(declare-fun mapValue!35476 () ValueCell!10674)

(declare-fun mapRest!35476 () (Array (_ BitVec 32) ValueCell!10674))

(declare-fun mapKey!35476 () (_ BitVec 32))

(assert (=> mapNonEmpty!35476 (= (arr!29196 _values!1425) (store mapRest!35476 mapKey!35476 mapValue!35476))))

(declare-fun mapIsEmpty!35476 () Bool)

(assert (=> mapIsEmpty!35476 mapRes!35476))

(declare-fun b!974285 () Bool)

(declare-fun tp_is_empty!22311 () Bool)

(assert (=> b!974285 (= e!549148 tp_is_empty!22311)))

(declare-fun b!974286 () Bool)

(declare-fun res!652183 () Bool)

(assert (=> b!974286 (=> (not res!652183) (not e!549151))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60663 (_ BitVec 32)) Bool)

(assert (=> b!974286 (= res!652183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974287 () Bool)

(declare-fun e!549150 () Bool)

(assert (=> b!974287 (= e!549150 tp_is_empty!22311)))

(declare-fun b!974288 () Bool)

(assert (=> b!974288 (= e!549151 false)))

(declare-fun zeroValue!1367 () V!34731)

(declare-datatypes ((tuple2!14402 0))(
  ( (tuple2!14403 (_1!7212 (_ BitVec 64)) (_2!7212 V!34731)) )
))
(declare-datatypes ((List!20256 0))(
  ( (Nil!20253) (Cons!20252 (h!21414 tuple2!14402) (t!28733 List!20256)) )
))
(declare-datatypes ((ListLongMap!13099 0))(
  ( (ListLongMap!13100 (toList!6565 List!20256)) )
))
(declare-fun lt!432755 () ListLongMap!13099)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34731)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3798 (array!60663 array!60665 (_ BitVec 32) (_ BitVec 32) V!34731 V!34731 (_ BitVec 32) Int) ListLongMap!13099)

(assert (=> b!974288 (= lt!432755 (getCurrentListMap!3798 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974289 () Bool)

(declare-fun res!652182 () Bool)

(assert (=> b!974289 (=> (not res!652182) (not e!549151))))

(declare-datatypes ((List!20257 0))(
  ( (Nil!20254) (Cons!20253 (h!21415 (_ BitVec 64)) (t!28734 List!20257)) )
))
(declare-fun arrayNoDuplicates!0 (array!60663 (_ BitVec 32) List!20257) Bool)

(assert (=> b!974289 (= res!652182 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20254))))

(declare-fun b!974290 () Bool)

(declare-fun res!652180 () Bool)

(assert (=> b!974290 (=> (not res!652180) (not e!549151))))

(assert (=> b!974290 (= res!652180 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29674 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29674 _keys!1717))))))

(declare-fun res!652185 () Bool)

(assert (=> start!83420 (=> (not res!652185) (not e!549151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83420 (= res!652185 (validMask!0 mask!2147))))

(assert (=> start!83420 e!549151))

(assert (=> start!83420 true))

(declare-fun e!549147 () Bool)

(declare-fun array_inv!22579 (array!60665) Bool)

(assert (=> start!83420 (and (array_inv!22579 _values!1425) e!549147)))

(assert (=> start!83420 tp_is_empty!22311))

(assert (=> start!83420 tp!67517))

(declare-fun array_inv!22580 (array!60663) Bool)

(assert (=> start!83420 (array_inv!22580 _keys!1717)))

(declare-fun b!974291 () Bool)

(declare-fun res!652179 () Bool)

(assert (=> b!974291 (=> (not res!652179) (not e!549151))))

(declare-fun contains!5652 (ListLongMap!13099 (_ BitVec 64)) Bool)

(assert (=> b!974291 (= res!652179 (contains!5652 (getCurrentListMap!3798 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29195 _keys!1717) i!822)))))

(declare-fun b!974292 () Bool)

(declare-fun res!652181 () Bool)

(assert (=> b!974292 (=> (not res!652181) (not e!549151))))

(assert (=> b!974292 (= res!652181 (and (= (size!29675 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29674 _keys!1717) (size!29675 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974293 () Bool)

(assert (=> b!974293 (= e!549147 (and e!549150 mapRes!35476))))

(declare-fun condMapEmpty!35476 () Bool)

(declare-fun mapDefault!35476 () ValueCell!10674)

(assert (=> b!974293 (= condMapEmpty!35476 (= (arr!29196 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10674)) mapDefault!35476)))))

(assert (= (and start!83420 res!652185) b!974292))

(assert (= (and b!974292 res!652181) b!974286))

(assert (= (and b!974286 res!652183) b!974289))

(assert (= (and b!974289 res!652182) b!974290))

(assert (= (and b!974290 res!652180) b!974284))

(assert (= (and b!974284 res!652184) b!974291))

(assert (= (and b!974291 res!652179) b!974288))

(assert (= (and b!974293 condMapEmpty!35476) mapIsEmpty!35476))

(assert (= (and b!974293 (not condMapEmpty!35476)) mapNonEmpty!35476))

(get-info :version)

(assert (= (and mapNonEmpty!35476 ((_ is ValueCellFull!10674) mapValue!35476)) b!974285))

(assert (= (and b!974293 ((_ is ValueCellFull!10674) mapDefault!35476)) b!974287))

(assert (= start!83420 b!974293))

(declare-fun m!901847 () Bool)

(assert (=> b!974288 m!901847))

(declare-fun m!901849 () Bool)

(assert (=> b!974286 m!901849))

(declare-fun m!901851 () Bool)

(assert (=> b!974291 m!901851))

(declare-fun m!901853 () Bool)

(assert (=> b!974291 m!901853))

(assert (=> b!974291 m!901851))

(assert (=> b!974291 m!901853))

(declare-fun m!901855 () Bool)

(assert (=> b!974291 m!901855))

(declare-fun m!901857 () Bool)

(assert (=> mapNonEmpty!35476 m!901857))

(declare-fun m!901859 () Bool)

(assert (=> b!974289 m!901859))

(declare-fun m!901861 () Bool)

(assert (=> start!83420 m!901861))

(declare-fun m!901863 () Bool)

(assert (=> start!83420 m!901863))

(declare-fun m!901865 () Bool)

(assert (=> start!83420 m!901865))

(assert (=> b!974284 m!901853))

(assert (=> b!974284 m!901853))

(declare-fun m!901867 () Bool)

(assert (=> b!974284 m!901867))

(check-sat (not b_next!19413) tp_is_empty!22311 (not start!83420) (not mapNonEmpty!35476) (not b!974286) (not b!974288) (not b!974291) b_and!31015 (not b!974289) (not b!974284))
(check-sat b_and!31015 (not b_next!19413))
