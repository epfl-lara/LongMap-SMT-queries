; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20816 () Bool)

(assert start!20816)

(declare-fun b_free!5469 () Bool)

(declare-fun b_next!5469 () Bool)

(assert (=> start!20816 (= b_free!5469 (not b_next!5469))))

(declare-fun tp!19447 () Bool)

(declare-fun b_and!12215 () Bool)

(assert (=> start!20816 (= tp!19447 b_and!12215)))

(declare-fun b!208700 () Bool)

(declare-fun res!101580 () Bool)

(declare-fun e!136078 () Bool)

(assert (=> b!208700 (=> (not res!101580) (not e!136078))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208700 (= res!101580 (validKeyInArray!0 k0!843))))

(declare-fun b!208701 () Bool)

(declare-fun res!101581 () Bool)

(assert (=> b!208701 (=> (not res!101581) (not e!136078))))

(declare-datatypes ((array!9865 0))(
  ( (array!9866 (arr!4683 (Array (_ BitVec 32) (_ BitVec 64))) (size!5008 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9865)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208701 (= res!101581 (= (select (arr!4683 _keys!825) i!601) k0!843))))

(declare-fun b!208702 () Bool)

(declare-fun e!136077 () Bool)

(declare-fun tp_is_empty!5331 () Bool)

(assert (=> b!208702 (= e!136077 tp_is_empty!5331)))

(declare-fun b!208703 () Bool)

(declare-fun e!136079 () Bool)

(declare-fun e!136075 () Bool)

(declare-fun mapRes!9065 () Bool)

(assert (=> b!208703 (= e!136079 (and e!136075 mapRes!9065))))

(declare-fun condMapEmpty!9065 () Bool)

(declare-datatypes ((V!6755 0))(
  ( (V!6756 (val!2710 Int)) )
))
(declare-datatypes ((ValueCell!2322 0))(
  ( (ValueCellFull!2322 (v!4680 V!6755)) (EmptyCell!2322) )
))
(declare-datatypes ((array!9867 0))(
  ( (array!9868 (arr!4684 (Array (_ BitVec 32) ValueCell!2322)) (size!5009 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9867)

(declare-fun mapDefault!9065 () ValueCell!2322)

(assert (=> b!208703 (= condMapEmpty!9065 (= (arr!4684 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2322)) mapDefault!9065)))))

(declare-fun b!208704 () Bool)

(declare-fun res!101582 () Bool)

(assert (=> b!208704 (=> (not res!101582) (not e!136078))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9865 (_ BitVec 32)) Bool)

(assert (=> b!208704 (= res!101582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208705 () Bool)

(assert (=> b!208705 (= e!136078 false)))

(declare-fun v!520 () V!6755)

(declare-fun zeroValue!615 () V!6755)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6755)

(declare-datatypes ((tuple2!4104 0))(
  ( (tuple2!4105 (_1!2063 (_ BitVec 64)) (_2!2063 V!6755)) )
))
(declare-datatypes ((List!3000 0))(
  ( (Nil!2997) (Cons!2996 (h!3638 tuple2!4104) (t!7931 List!3000)) )
))
(declare-datatypes ((ListLongMap!3017 0))(
  ( (ListLongMap!3018 (toList!1524 List!3000)) )
))
(declare-fun lt!106838 () ListLongMap!3017)

(declare-fun getCurrentListMapNoExtraKeys!465 (array!9865 array!9867 (_ BitVec 32) (_ BitVec 32) V!6755 V!6755 (_ BitVec 32) Int) ListLongMap!3017)

(assert (=> b!208705 (= lt!106838 (getCurrentListMapNoExtraKeys!465 _keys!825 (array!9868 (store (arr!4684 _values!649) i!601 (ValueCellFull!2322 v!520)) (size!5009 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106839 () ListLongMap!3017)

(assert (=> b!208705 (= lt!106839 (getCurrentListMapNoExtraKeys!465 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208706 () Bool)

(declare-fun res!101583 () Bool)

(assert (=> b!208706 (=> (not res!101583) (not e!136078))))

(assert (=> b!208706 (= res!101583 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5008 _keys!825))))))

(declare-fun b!208707 () Bool)

(declare-fun res!101584 () Bool)

(assert (=> b!208707 (=> (not res!101584) (not e!136078))))

(declare-datatypes ((List!3001 0))(
  ( (Nil!2998) (Cons!2997 (h!3639 (_ BitVec 64)) (t!7932 List!3001)) )
))
(declare-fun arrayNoDuplicates!0 (array!9865 (_ BitVec 32) List!3001) Bool)

(assert (=> b!208707 (= res!101584 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2998))))

(declare-fun b!208708 () Bool)

(declare-fun res!101578 () Bool)

(assert (=> b!208708 (=> (not res!101578) (not e!136078))))

(assert (=> b!208708 (= res!101578 (and (= (size!5009 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5008 _keys!825) (size!5009 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208709 () Bool)

(assert (=> b!208709 (= e!136075 tp_is_empty!5331)))

(declare-fun mapNonEmpty!9065 () Bool)

(declare-fun tp!19448 () Bool)

(assert (=> mapNonEmpty!9065 (= mapRes!9065 (and tp!19448 e!136077))))

(declare-fun mapRest!9065 () (Array (_ BitVec 32) ValueCell!2322))

(declare-fun mapKey!9065 () (_ BitVec 32))

(declare-fun mapValue!9065 () ValueCell!2322)

(assert (=> mapNonEmpty!9065 (= (arr!4684 _values!649) (store mapRest!9065 mapKey!9065 mapValue!9065))))

(declare-fun res!101579 () Bool)

(assert (=> start!20816 (=> (not res!101579) (not e!136078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20816 (= res!101579 (validMask!0 mask!1149))))

(assert (=> start!20816 e!136078))

(declare-fun array_inv!3109 (array!9867) Bool)

(assert (=> start!20816 (and (array_inv!3109 _values!649) e!136079)))

(assert (=> start!20816 true))

(assert (=> start!20816 tp_is_empty!5331))

(declare-fun array_inv!3110 (array!9865) Bool)

(assert (=> start!20816 (array_inv!3110 _keys!825)))

(assert (=> start!20816 tp!19447))

(declare-fun mapIsEmpty!9065 () Bool)

(assert (=> mapIsEmpty!9065 mapRes!9065))

(assert (= (and start!20816 res!101579) b!208708))

(assert (= (and b!208708 res!101578) b!208704))

(assert (= (and b!208704 res!101582) b!208707))

(assert (= (and b!208707 res!101584) b!208706))

(assert (= (and b!208706 res!101583) b!208700))

(assert (= (and b!208700 res!101580) b!208701))

(assert (= (and b!208701 res!101581) b!208705))

(assert (= (and b!208703 condMapEmpty!9065) mapIsEmpty!9065))

(assert (= (and b!208703 (not condMapEmpty!9065)) mapNonEmpty!9065))

(get-info :version)

(assert (= (and mapNonEmpty!9065 ((_ is ValueCellFull!2322) mapValue!9065)) b!208702))

(assert (= (and b!208703 ((_ is ValueCellFull!2322) mapDefault!9065)) b!208709))

(assert (= start!20816 b!208703))

(declare-fun m!236261 () Bool)

(assert (=> mapNonEmpty!9065 m!236261))

(declare-fun m!236263 () Bool)

(assert (=> b!208700 m!236263))

(declare-fun m!236265 () Bool)

(assert (=> b!208704 m!236265))

(declare-fun m!236267 () Bool)

(assert (=> b!208701 m!236267))

(declare-fun m!236269 () Bool)

(assert (=> b!208705 m!236269))

(declare-fun m!236271 () Bool)

(assert (=> b!208705 m!236271))

(declare-fun m!236273 () Bool)

(assert (=> b!208705 m!236273))

(declare-fun m!236275 () Bool)

(assert (=> start!20816 m!236275))

(declare-fun m!236277 () Bool)

(assert (=> start!20816 m!236277))

(declare-fun m!236279 () Bool)

(assert (=> start!20816 m!236279))

(declare-fun m!236281 () Bool)

(assert (=> b!208707 m!236281))

(check-sat (not start!20816) b_and!12215 tp_is_empty!5331 (not b!208704) (not b!208707) (not b!208700) (not b_next!5469) (not b!208705) (not mapNonEmpty!9065))
(check-sat b_and!12215 (not b_next!5469))
