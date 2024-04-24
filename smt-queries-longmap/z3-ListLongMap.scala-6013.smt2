; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78114 () Bool)

(assert start!78114)

(declare-fun b_free!16489 () Bool)

(declare-fun b_next!16489 () Bool)

(assert (=> start!78114 (= b_free!16489 (not b_next!16489))))

(declare-fun tp!57736 () Bool)

(declare-fun b_and!27069 () Bool)

(assert (=> start!78114 (= tp!57736 b_and!27069)))

(declare-fun b!910925 () Bool)

(declare-fun res!614480 () Bool)

(declare-fun e!510761 () Bool)

(assert (=> b!910925 (=> (not res!614480) (not e!510761))))

(declare-datatypes ((array!53885 0))(
  ( (array!53886 (arr!25895 (Array (_ BitVec 32) (_ BitVec 64))) (size!26355 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53885)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53885 (_ BitVec 32)) Bool)

(assert (=> b!910925 (= res!614480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910926 () Bool)

(declare-fun res!614479 () Bool)

(assert (=> b!910926 (=> (not res!614479) (not e!510761))))

(declare-datatypes ((List!18162 0))(
  ( (Nil!18159) (Cons!18158 (h!19310 (_ BitVec 64)) (t!25737 List!18162)) )
))
(declare-fun arrayNoDuplicates!0 (array!53885 (_ BitVec 32) List!18162) Bool)

(assert (=> b!910926 (= res!614479 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18159))))

(declare-fun res!614478 () Bool)

(assert (=> start!78114 (=> (not res!614478) (not e!510761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78114 (= res!614478 (validMask!0 mask!1756))))

(assert (=> start!78114 e!510761))

(declare-datatypes ((V!30175 0))(
  ( (V!30176 (val!9504 Int)) )
))
(declare-datatypes ((ValueCell!8972 0))(
  ( (ValueCellFull!8972 (v!12009 V!30175)) (EmptyCell!8972) )
))
(declare-datatypes ((array!53887 0))(
  ( (array!53888 (arr!25896 (Array (_ BitVec 32) ValueCell!8972)) (size!26356 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53887)

(declare-fun e!510765 () Bool)

(declare-fun array_inv!20320 (array!53887) Bool)

(assert (=> start!78114 (and (array_inv!20320 _values!1152) e!510765)))

(assert (=> start!78114 tp!57736))

(assert (=> start!78114 true))

(declare-fun tp_is_empty!18907 () Bool)

(assert (=> start!78114 tp_is_empty!18907))

(declare-fun array_inv!20321 (array!53885) Bool)

(assert (=> start!78114 (array_inv!20321 _keys!1386)))

(declare-fun b!910927 () Bool)

(assert (=> b!910927 (= e!510761 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30175)

(declare-fun lt!410499 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30175)

(declare-datatypes ((tuple2!12344 0))(
  ( (tuple2!12345 (_1!6183 (_ BitVec 64)) (_2!6183 V!30175)) )
))
(declare-datatypes ((List!18163 0))(
  ( (Nil!18160) (Cons!18159 (h!19311 tuple2!12344) (t!25738 List!18163)) )
))
(declare-datatypes ((ListLongMap!11043 0))(
  ( (ListLongMap!11044 (toList!5537 List!18163)) )
))
(declare-fun contains!4589 (ListLongMap!11043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2798 (array!53885 array!53887 (_ BitVec 32) (_ BitVec 32) V!30175 V!30175 (_ BitVec 32) Int) ListLongMap!11043)

(assert (=> b!910927 (= lt!410499 (contains!4589 (getCurrentListMap!2798 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910928 () Bool)

(declare-fun e!510763 () Bool)

(declare-fun mapRes!30079 () Bool)

(assert (=> b!910928 (= e!510765 (and e!510763 mapRes!30079))))

(declare-fun condMapEmpty!30079 () Bool)

(declare-fun mapDefault!30079 () ValueCell!8972)

(assert (=> b!910928 (= condMapEmpty!30079 (= (arr!25896 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8972)) mapDefault!30079)))))

(declare-fun b!910929 () Bool)

(declare-fun res!614477 () Bool)

(assert (=> b!910929 (=> (not res!614477) (not e!510761))))

(assert (=> b!910929 (= res!614477 (and (= (size!26356 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26355 _keys!1386) (size!26356 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30079 () Bool)

(assert (=> mapIsEmpty!30079 mapRes!30079))

(declare-fun b!910930 () Bool)

(assert (=> b!910930 (= e!510763 tp_is_empty!18907)))

(declare-fun mapNonEmpty!30079 () Bool)

(declare-fun tp!57735 () Bool)

(declare-fun e!510764 () Bool)

(assert (=> mapNonEmpty!30079 (= mapRes!30079 (and tp!57735 e!510764))))

(declare-fun mapValue!30079 () ValueCell!8972)

(declare-fun mapKey!30079 () (_ BitVec 32))

(declare-fun mapRest!30079 () (Array (_ BitVec 32) ValueCell!8972))

(assert (=> mapNonEmpty!30079 (= (arr!25896 _values!1152) (store mapRest!30079 mapKey!30079 mapValue!30079))))

(declare-fun b!910931 () Bool)

(assert (=> b!910931 (= e!510764 tp_is_empty!18907)))

(assert (= (and start!78114 res!614478) b!910929))

(assert (= (and b!910929 res!614477) b!910925))

(assert (= (and b!910925 res!614480) b!910926))

(assert (= (and b!910926 res!614479) b!910927))

(assert (= (and b!910928 condMapEmpty!30079) mapIsEmpty!30079))

(assert (= (and b!910928 (not condMapEmpty!30079)) mapNonEmpty!30079))

(get-info :version)

(assert (= (and mapNonEmpty!30079 ((_ is ValueCellFull!8972) mapValue!30079)) b!910931))

(assert (= (and b!910928 ((_ is ValueCellFull!8972) mapDefault!30079)) b!910930))

(assert (= start!78114 b!910928))

(declare-fun m!846419 () Bool)

(assert (=> start!78114 m!846419))

(declare-fun m!846421 () Bool)

(assert (=> start!78114 m!846421))

(declare-fun m!846423 () Bool)

(assert (=> start!78114 m!846423))

(declare-fun m!846425 () Bool)

(assert (=> b!910925 m!846425))

(declare-fun m!846427 () Bool)

(assert (=> mapNonEmpty!30079 m!846427))

(declare-fun m!846429 () Bool)

(assert (=> b!910927 m!846429))

(assert (=> b!910927 m!846429))

(declare-fun m!846431 () Bool)

(assert (=> b!910927 m!846431))

(declare-fun m!846433 () Bool)

(assert (=> b!910926 m!846433))

(check-sat tp_is_empty!18907 (not b!910926) (not mapNonEmpty!30079) (not start!78114) (not b!910925) (not b!910927) (not b_next!16489) b_and!27069)
(check-sat b_and!27069 (not b_next!16489))
