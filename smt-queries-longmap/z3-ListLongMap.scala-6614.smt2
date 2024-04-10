; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83614 () Bool)

(assert start!83614)

(declare-fun b!976914 () Bool)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!34931 0))(
  ( (V!34932 (val!11281 Int)) )
))
(declare-datatypes ((ValueCell!10749 0))(
  ( (ValueCellFull!10749 (v!13842 V!34931)) (EmptyCell!10749) )
))
(declare-datatypes ((array!60949 0))(
  ( (array!60950 (arr!29337 (Array (_ BitVec 32) ValueCell!10749)) (size!29816 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60949)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!60951 0))(
  ( (array!60952 (arr!29338 (Array (_ BitVec 32) (_ BitVec 64))) (size!29817 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60951)

(declare-fun e!550587 () Bool)

(assert (=> b!976914 (= e!550587 (and (= (size!29816 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29817 _keys!1544) (size!29816 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011) (not (= (size!29817 _keys!1544) (bvadd #b00000000000000000000000000000001 mask!1948)))))))

(declare-fun res!653922 () Bool)

(assert (=> start!83614 (=> (not res!653922) (not e!550587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83614 (= res!653922 (validMask!0 mask!1948))))

(assert (=> start!83614 e!550587))

(assert (=> start!83614 true))

(declare-fun e!550590 () Bool)

(declare-fun array_inv!22679 (array!60949) Bool)

(assert (=> start!83614 (and (array_inv!22679 _values!1278) e!550590)))

(declare-fun array_inv!22680 (array!60951) Bool)

(assert (=> start!83614 (array_inv!22680 _keys!1544)))

(declare-fun b!976915 () Bool)

(declare-fun e!550591 () Bool)

(declare-fun tp_is_empty!22461 () Bool)

(assert (=> b!976915 (= e!550591 tp_is_empty!22461)))

(declare-fun mapNonEmpty!35705 () Bool)

(declare-fun mapRes!35705 () Bool)

(declare-fun tp!67957 () Bool)

(declare-fun e!550588 () Bool)

(assert (=> mapNonEmpty!35705 (= mapRes!35705 (and tp!67957 e!550588))))

(declare-fun mapRest!35705 () (Array (_ BitVec 32) ValueCell!10749))

(declare-fun mapKey!35705 () (_ BitVec 32))

(declare-fun mapValue!35705 () ValueCell!10749)

(assert (=> mapNonEmpty!35705 (= (arr!29337 _values!1278) (store mapRest!35705 mapKey!35705 mapValue!35705))))

(declare-fun b!976916 () Bool)

(assert (=> b!976916 (= e!550590 (and e!550591 mapRes!35705))))

(declare-fun condMapEmpty!35705 () Bool)

(declare-fun mapDefault!35705 () ValueCell!10749)

(assert (=> b!976916 (= condMapEmpty!35705 (= (arr!29337 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10749)) mapDefault!35705)))))

(declare-fun b!976917 () Bool)

(assert (=> b!976917 (= e!550588 tp_is_empty!22461)))

(declare-fun mapIsEmpty!35705 () Bool)

(assert (=> mapIsEmpty!35705 mapRes!35705))

(assert (= (and start!83614 res!653922) b!976914))

(assert (= (and b!976916 condMapEmpty!35705) mapIsEmpty!35705))

(assert (= (and b!976916 (not condMapEmpty!35705)) mapNonEmpty!35705))

(get-info :version)

(assert (= (and mapNonEmpty!35705 ((_ is ValueCellFull!10749) mapValue!35705)) b!976917))

(assert (= (and b!976916 ((_ is ValueCellFull!10749) mapDefault!35705)) b!976915))

(assert (= start!83614 b!976916))

(declare-fun m!904379 () Bool)

(assert (=> start!83614 m!904379))

(declare-fun m!904381 () Bool)

(assert (=> start!83614 m!904381))

(declare-fun m!904383 () Bool)

(assert (=> start!83614 m!904383))

(declare-fun m!904385 () Bool)

(assert (=> mapNonEmpty!35705 m!904385))

(check-sat (not start!83614) (not mapNonEmpty!35705) tp_is_empty!22461)
(check-sat)
