; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83008 () Bool)

(assert start!83008)

(declare-fun b_free!18967 () Bool)

(declare-fun b_next!18967 () Bool)

(assert (=> start!83008 (= b_free!18967 (not b_next!18967))))

(declare-fun tp!66031 () Bool)

(declare-fun b_and!30465 () Bool)

(assert (=> start!83008 (= tp!66031 b_and!30465)))

(declare-fun b!967274 () Bool)

(declare-fun res!647204 () Bool)

(declare-fun e!545347 () Bool)

(assert (=> b!967274 (=> (not res!647204) (not e!545347))))

(declare-datatypes ((array!59648 0))(
  ( (array!59649 (arr!28688 (Array (_ BitVec 32) (_ BitVec 64))) (size!29168 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59648)

(declare-datatypes ((List!19898 0))(
  ( (Nil!19895) (Cons!19894 (h!21062 (_ BitVec 64)) (t!28253 List!19898)) )
))
(declare-fun arrayNoDuplicates!0 (array!59648 (_ BitVec 32) List!19898) Bool)

(assert (=> b!967274 (= res!647204 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19895))))

(declare-fun mapIsEmpty!34657 () Bool)

(declare-fun mapRes!34657 () Bool)

(assert (=> mapIsEmpty!34657 mapRes!34657))

(declare-fun b!967275 () Bool)

(declare-fun e!545344 () Bool)

(declare-fun tp_is_empty!21775 () Bool)

(assert (=> b!967275 (= e!545344 tp_is_empty!21775)))

(declare-fun b!967276 () Bool)

(assert (=> b!967276 (= e!545347 false)))

(declare-datatypes ((V!34017 0))(
  ( (V!34018 (val!10938 Int)) )
))
(declare-datatypes ((ValueCell!10406 0))(
  ( (ValueCellFull!10406 (v!13493 V!34017)) (EmptyCell!10406) )
))
(declare-datatypes ((array!59650 0))(
  ( (array!59651 (arr!28689 (Array (_ BitVec 32) ValueCell!10406)) (size!29169 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59650)

(declare-fun minValue!1342 () V!34017)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!431687 () Bool)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34017)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14050 0))(
  ( (tuple2!14051 (_1!7036 (_ BitVec 64)) (_2!7036 V!34017)) )
))
(declare-datatypes ((List!19899 0))(
  ( (Nil!19896) (Cons!19895 (h!21063 tuple2!14050) (t!28254 List!19899)) )
))
(declare-datatypes ((ListLongMap!12749 0))(
  ( (ListLongMap!12750 (toList!6390 List!19899)) )
))
(declare-fun contains!5502 (ListLongMap!12749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3623 (array!59648 array!59650 (_ BitVec 32) (_ BitVec 32) V!34017 V!34017 (_ BitVec 32) Int) ListLongMap!12749)

(assert (=> b!967276 (= lt!431687 (contains!5502 (getCurrentListMap!3623 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28688 _keys!1686) i!803)))))

(declare-fun b!967277 () Bool)

(declare-fun res!647205 () Bool)

(assert (=> b!967277 (=> (not res!647205) (not e!545347))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967277 (= res!647205 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29168 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29168 _keys!1686))))))

(declare-fun b!967279 () Bool)

(declare-fun res!647200 () Bool)

(assert (=> b!967279 (=> (not res!647200) (not e!545347))))

(assert (=> b!967279 (= res!647200 (and (= (size!29169 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29168 _keys!1686) (size!29169 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967280 () Bool)

(declare-fun e!545346 () Bool)

(assert (=> b!967280 (= e!545346 tp_is_empty!21775)))

(declare-fun b!967281 () Bool)

(declare-fun res!647202 () Bool)

(assert (=> b!967281 (=> (not res!647202) (not e!545347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967281 (= res!647202 (validKeyInArray!0 (select (arr!28688 _keys!1686) i!803)))))

(declare-fun res!647201 () Bool)

(assert (=> start!83008 (=> (not res!647201) (not e!545347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83008 (= res!647201 (validMask!0 mask!2110))))

(assert (=> start!83008 e!545347))

(assert (=> start!83008 true))

(declare-fun e!545348 () Bool)

(declare-fun array_inv!22275 (array!59650) Bool)

(assert (=> start!83008 (and (array_inv!22275 _values!1400) e!545348)))

(declare-fun array_inv!22276 (array!59648) Bool)

(assert (=> start!83008 (array_inv!22276 _keys!1686)))

(assert (=> start!83008 tp!66031))

(assert (=> start!83008 tp_is_empty!21775))

(declare-fun b!967278 () Bool)

(assert (=> b!967278 (= e!545348 (and e!545346 mapRes!34657))))

(declare-fun condMapEmpty!34657 () Bool)

(declare-fun mapDefault!34657 () ValueCell!10406)

(assert (=> b!967278 (= condMapEmpty!34657 (= (arr!28689 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10406)) mapDefault!34657)))))

(declare-fun mapNonEmpty!34657 () Bool)

(declare-fun tp!66030 () Bool)

(assert (=> mapNonEmpty!34657 (= mapRes!34657 (and tp!66030 e!545344))))

(declare-fun mapKey!34657 () (_ BitVec 32))

(declare-fun mapValue!34657 () ValueCell!10406)

(declare-fun mapRest!34657 () (Array (_ BitVec 32) ValueCell!10406))

(assert (=> mapNonEmpty!34657 (= (arr!28689 _values!1400) (store mapRest!34657 mapKey!34657 mapValue!34657))))

(declare-fun b!967282 () Bool)

(declare-fun res!647203 () Bool)

(assert (=> b!967282 (=> (not res!647203) (not e!545347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59648 (_ BitVec 32)) Bool)

(assert (=> b!967282 (= res!647203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!83008 res!647201) b!967279))

(assert (= (and b!967279 res!647200) b!967282))

(assert (= (and b!967282 res!647203) b!967274))

(assert (= (and b!967274 res!647204) b!967277))

(assert (= (and b!967277 res!647205) b!967281))

(assert (= (and b!967281 res!647202) b!967276))

(assert (= (and b!967278 condMapEmpty!34657) mapIsEmpty!34657))

(assert (= (and b!967278 (not condMapEmpty!34657)) mapNonEmpty!34657))

(get-info :version)

(assert (= (and mapNonEmpty!34657 ((_ is ValueCellFull!10406) mapValue!34657)) b!967275))

(assert (= (and b!967278 ((_ is ValueCellFull!10406) mapDefault!34657)) b!967280))

(assert (= start!83008 b!967278))

(declare-fun m!896473 () Bool)

(assert (=> b!967274 m!896473))

(declare-fun m!896475 () Bool)

(assert (=> b!967282 m!896475))

(declare-fun m!896477 () Bool)

(assert (=> b!967276 m!896477))

(declare-fun m!896479 () Bool)

(assert (=> b!967276 m!896479))

(assert (=> b!967276 m!896477))

(assert (=> b!967276 m!896479))

(declare-fun m!896481 () Bool)

(assert (=> b!967276 m!896481))

(assert (=> b!967281 m!896479))

(assert (=> b!967281 m!896479))

(declare-fun m!896483 () Bool)

(assert (=> b!967281 m!896483))

(declare-fun m!896485 () Bool)

(assert (=> mapNonEmpty!34657 m!896485))

(declare-fun m!896487 () Bool)

(assert (=> start!83008 m!896487))

(declare-fun m!896489 () Bool)

(assert (=> start!83008 m!896489))

(declare-fun m!896491 () Bool)

(assert (=> start!83008 m!896491))

(check-sat (not start!83008) b_and!30465 (not mapNonEmpty!34657) (not b!967276) (not b!967281) (not b!967274) (not b_next!18967) tp_is_empty!21775 (not b!967282))
(check-sat b_and!30465 (not b_next!18967))
