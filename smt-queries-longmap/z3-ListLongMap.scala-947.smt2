; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20782 () Bool)

(assert start!20782)

(declare-fun b_free!5431 () Bool)

(declare-fun b_next!5431 () Bool)

(assert (=> start!20782 (= b_free!5431 (not b_next!5431))))

(declare-fun tp!19334 () Bool)

(declare-fun b_and!12191 () Bool)

(assert (=> start!20782 (= tp!19334 b_and!12191)))

(declare-fun b!208177 () Bool)

(declare-fun res!101203 () Bool)

(declare-fun e!135817 () Bool)

(assert (=> b!208177 (=> (not res!101203) (not e!135817))))

(declare-datatypes ((array!9787 0))(
  ( (array!9788 (arr!4644 (Array (_ BitVec 32) (_ BitVec 64))) (size!4969 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9787)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6705 0))(
  ( (V!6706 (val!2691 Int)) )
))
(declare-datatypes ((ValueCell!2303 0))(
  ( (ValueCellFull!2303 (v!4662 V!6705)) (EmptyCell!2303) )
))
(declare-datatypes ((array!9789 0))(
  ( (array!9790 (arr!4645 (Array (_ BitVec 32) ValueCell!2303)) (size!4970 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9789)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!208177 (= res!101203 (and (= (size!4970 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4969 _keys!825) (size!4970 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9008 () Bool)

(declare-fun mapRes!9008 () Bool)

(assert (=> mapIsEmpty!9008 mapRes!9008))

(declare-fun mapNonEmpty!9008 () Bool)

(declare-fun tp!19333 () Bool)

(declare-fun e!135815 () Bool)

(assert (=> mapNonEmpty!9008 (= mapRes!9008 (and tp!19333 e!135815))))

(declare-fun mapValue!9008 () ValueCell!2303)

(declare-fun mapKey!9008 () (_ BitVec 32))

(declare-fun mapRest!9008 () (Array (_ BitVec 32) ValueCell!2303))

(assert (=> mapNonEmpty!9008 (= (arr!4645 _values!649) (store mapRest!9008 mapKey!9008 mapValue!9008))))

(declare-fun b!208178 () Bool)

(declare-fun tp_is_empty!5293 () Bool)

(assert (=> b!208178 (= e!135815 tp_is_empty!5293)))

(declare-fun b!208179 () Bool)

(declare-fun res!101206 () Bool)

(assert (=> b!208179 (=> (not res!101206) (not e!135817))))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!208179 (= res!101206 (= (select (arr!4644 _keys!825) i!601) k0!843))))

(declare-fun b!208180 () Bool)

(declare-fun res!101201 () Bool)

(assert (=> b!208180 (=> (not res!101201) (not e!135817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9787 (_ BitVec 32)) Bool)

(assert (=> b!208180 (= res!101201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208181 () Bool)

(declare-fun res!101202 () Bool)

(assert (=> b!208181 (=> (not res!101202) (not e!135817))))

(declare-datatypes ((List!2911 0))(
  ( (Nil!2908) (Cons!2907 (h!3549 (_ BitVec 64)) (t!7834 List!2911)) )
))
(declare-fun arrayNoDuplicates!0 (array!9787 (_ BitVec 32) List!2911) Bool)

(assert (=> b!208181 (= res!101202 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2908))))

(declare-fun res!101204 () Bool)

(assert (=> start!20782 (=> (not res!101204) (not e!135817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20782 (= res!101204 (validMask!0 mask!1149))))

(assert (=> start!20782 e!135817))

(declare-fun e!135816 () Bool)

(declare-fun array_inv!3045 (array!9789) Bool)

(assert (=> start!20782 (and (array_inv!3045 _values!649) e!135816)))

(assert (=> start!20782 true))

(assert (=> start!20782 tp_is_empty!5293))

(declare-fun array_inv!3046 (array!9787) Bool)

(assert (=> start!20782 (array_inv!3046 _keys!825)))

(assert (=> start!20782 tp!19334))

(declare-fun b!208182 () Bool)

(declare-fun res!101205 () Bool)

(assert (=> b!208182 (=> (not res!101205) (not e!135817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208182 (= res!101205 (validKeyInArray!0 k0!843))))

(declare-fun b!208183 () Bool)

(declare-fun e!135814 () Bool)

(assert (=> b!208183 (= e!135814 tp_is_empty!5293)))

(declare-fun b!208184 () Bool)

(assert (=> b!208184 (= e!135817 (bvsge i!601 (size!4970 _values!649)))))

(declare-fun zeroValue!615 () V!6705)

(declare-datatypes ((tuple2!4020 0))(
  ( (tuple2!4021 (_1!2021 (_ BitVec 64)) (_2!2021 V!6705)) )
))
(declare-datatypes ((List!2912 0))(
  ( (Nil!2909) (Cons!2908 (h!3550 tuple2!4020) (t!7835 List!2912)) )
))
(declare-datatypes ((ListLongMap!2935 0))(
  ( (ListLongMap!2936 (toList!1483 List!2912)) )
))
(declare-fun lt!106790 () ListLongMap!2935)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6705)

(declare-fun getCurrentListMapNoExtraKeys!446 (array!9787 array!9789 (_ BitVec 32) (_ BitVec 32) V!6705 V!6705 (_ BitVec 32) Int) ListLongMap!2935)

(assert (=> b!208184 (= lt!106790 (getCurrentListMapNoExtraKeys!446 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208185 () Bool)

(assert (=> b!208185 (= e!135816 (and e!135814 mapRes!9008))))

(declare-fun condMapEmpty!9008 () Bool)

(declare-fun mapDefault!9008 () ValueCell!2303)

(assert (=> b!208185 (= condMapEmpty!9008 (= (arr!4645 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2303)) mapDefault!9008)))))

(declare-fun b!208186 () Bool)

(declare-fun res!101200 () Bool)

(assert (=> b!208186 (=> (not res!101200) (not e!135817))))

(assert (=> b!208186 (= res!101200 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4969 _keys!825))))))

(assert (= (and start!20782 res!101204) b!208177))

(assert (= (and b!208177 res!101203) b!208180))

(assert (= (and b!208180 res!101201) b!208181))

(assert (= (and b!208181 res!101202) b!208186))

(assert (= (and b!208186 res!101200) b!208182))

(assert (= (and b!208182 res!101205) b!208179))

(assert (= (and b!208179 res!101206) b!208184))

(assert (= (and b!208185 condMapEmpty!9008) mapIsEmpty!9008))

(assert (= (and b!208185 (not condMapEmpty!9008)) mapNonEmpty!9008))

(get-info :version)

(assert (= (and mapNonEmpty!9008 ((_ is ValueCellFull!2303) mapValue!9008)) b!208178))

(assert (= (and b!208185 ((_ is ValueCellFull!2303) mapDefault!9008)) b!208183))

(assert (= start!20782 b!208185))

(declare-fun m!236037 () Bool)

(assert (=> b!208184 m!236037))

(declare-fun m!236039 () Bool)

(assert (=> b!208181 m!236039))

(declare-fun m!236041 () Bool)

(assert (=> b!208182 m!236041))

(declare-fun m!236043 () Bool)

(assert (=> mapNonEmpty!9008 m!236043))

(declare-fun m!236045 () Bool)

(assert (=> b!208179 m!236045))

(declare-fun m!236047 () Bool)

(assert (=> start!20782 m!236047))

(declare-fun m!236049 () Bool)

(assert (=> start!20782 m!236049))

(declare-fun m!236051 () Bool)

(assert (=> start!20782 m!236051))

(declare-fun m!236053 () Bool)

(assert (=> b!208180 m!236053))

(check-sat tp_is_empty!5293 b_and!12191 (not b!208182) (not mapNonEmpty!9008) (not start!20782) (not b!208184) (not b!208181) (not b_next!5431) (not b!208180))
(check-sat b_and!12191 (not b_next!5431))
