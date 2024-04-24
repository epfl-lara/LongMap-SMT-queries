; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20038 () Bool)

(assert start!20038)

(declare-fun res!92616 () Bool)

(declare-fun e!129200 () Bool)

(assert (=> start!20038 (=> (not res!92616) (not e!129200))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20038 (= res!92616 (validMask!0 mask!1149))))

(assert (=> start!20038 e!129200))

(assert (=> start!20038 true))

(declare-datatypes ((V!5713 0))(
  ( (V!5714 (val!2319 Int)) )
))
(declare-datatypes ((ValueCell!1931 0))(
  ( (ValueCellFull!1931 (v!4290 V!5713)) (EmptyCell!1931) )
))
(declare-datatypes ((array!8349 0))(
  ( (array!8350 (arr!3925 (Array (_ BitVec 32) ValueCell!1931)) (size!4250 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8349)

(declare-fun e!129202 () Bool)

(declare-fun array_inv!2545 (array!8349) Bool)

(assert (=> start!20038 (and (array_inv!2545 _values!649) e!129202)))

(declare-datatypes ((array!8351 0))(
  ( (array!8352 (arr!3926 (Array (_ BitVec 32) (_ BitVec 64))) (size!4251 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8351)

(declare-fun array_inv!2546 (array!8351) Bool)

(assert (=> start!20038 (array_inv!2546 _keys!825)))

(declare-fun b!196244 () Bool)

(declare-fun e!129203 () Bool)

(declare-fun tp_is_empty!4549 () Bool)

(assert (=> b!196244 (= e!129203 tp_is_empty!4549)))

(declare-fun b!196245 () Bool)

(declare-fun mapRes!7892 () Bool)

(assert (=> b!196245 (= e!129202 (and e!129203 mapRes!7892))))

(declare-fun condMapEmpty!7892 () Bool)

(declare-fun mapDefault!7892 () ValueCell!1931)

(assert (=> b!196245 (= condMapEmpty!7892 (= (arr!3925 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1931)) mapDefault!7892)))))

(declare-fun mapIsEmpty!7892 () Bool)

(assert (=> mapIsEmpty!7892 mapRes!7892))

(declare-fun b!196246 () Bool)

(declare-fun res!92617 () Bool)

(assert (=> b!196246 (=> (not res!92617) (not e!129200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8351 (_ BitVec 32)) Bool)

(assert (=> b!196246 (= res!92617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196247 () Bool)

(declare-fun e!129199 () Bool)

(assert (=> b!196247 (= e!129199 tp_is_empty!4549)))

(declare-fun b!196248 () Bool)

(declare-fun res!92615 () Bool)

(assert (=> b!196248 (=> (not res!92615) (not e!129200))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196248 (= res!92615 (and (= (size!4250 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4251 _keys!825) (size!4250 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196249 () Bool)

(assert (=> b!196249 (= e!129200 false)))

(declare-fun lt!97637 () Bool)

(declare-datatypes ((List!2420 0))(
  ( (Nil!2417) (Cons!2416 (h!3058 (_ BitVec 64)) (t!7343 List!2420)) )
))
(declare-fun arrayNoDuplicates!0 (array!8351 (_ BitVec 32) List!2420) Bool)

(assert (=> b!196249 (= lt!97637 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2417))))

(declare-fun mapNonEmpty!7892 () Bool)

(declare-fun tp!17180 () Bool)

(assert (=> mapNonEmpty!7892 (= mapRes!7892 (and tp!17180 e!129199))))

(declare-fun mapValue!7892 () ValueCell!1931)

(declare-fun mapKey!7892 () (_ BitVec 32))

(declare-fun mapRest!7892 () (Array (_ BitVec 32) ValueCell!1931))

(assert (=> mapNonEmpty!7892 (= (arr!3925 _values!649) (store mapRest!7892 mapKey!7892 mapValue!7892))))

(assert (= (and start!20038 res!92616) b!196248))

(assert (= (and b!196248 res!92615) b!196246))

(assert (= (and b!196246 res!92617) b!196249))

(assert (= (and b!196245 condMapEmpty!7892) mapIsEmpty!7892))

(assert (= (and b!196245 (not condMapEmpty!7892)) mapNonEmpty!7892))

(get-info :version)

(assert (= (and mapNonEmpty!7892 ((_ is ValueCellFull!1931) mapValue!7892)) b!196247))

(assert (= (and b!196245 ((_ is ValueCellFull!1931) mapDefault!7892)) b!196244))

(assert (= start!20038 b!196245))

(declare-fun m!223737 () Bool)

(assert (=> start!20038 m!223737))

(declare-fun m!223739 () Bool)

(assert (=> start!20038 m!223739))

(declare-fun m!223741 () Bool)

(assert (=> start!20038 m!223741))

(declare-fun m!223743 () Bool)

(assert (=> b!196246 m!223743))

(declare-fun m!223745 () Bool)

(assert (=> b!196249 m!223745))

(declare-fun m!223747 () Bool)

(assert (=> mapNonEmpty!7892 m!223747))

(check-sat (not start!20038) (not b!196249) (not mapNonEmpty!7892) (not b!196246) tp_is_empty!4549)
(check-sat)
