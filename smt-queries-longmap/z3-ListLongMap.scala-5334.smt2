; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71266 () Bool)

(assert start!71266)

(declare-fun b_free!13413 () Bool)

(declare-fun b_next!13413 () Bool)

(assert (=> start!71266 (= b_free!13413 (not b_next!13413))))

(declare-fun tp!47001 () Bool)

(declare-fun b_and!22351 () Bool)

(assert (=> start!71266 (= tp!47001 b_and!22351)))

(declare-fun b!827785 () Bool)

(declare-fun e!461187 () Bool)

(declare-fun e!461188 () Bool)

(declare-fun mapRes!24313 () Bool)

(assert (=> b!827785 (= e!461187 (and e!461188 mapRes!24313))))

(declare-fun condMapEmpty!24313 () Bool)

(declare-datatypes ((V!25165 0))(
  ( (V!25166 (val!7609 Int)) )
))
(declare-datatypes ((ValueCell!7146 0))(
  ( (ValueCellFull!7146 (v!10044 V!25165)) (EmptyCell!7146) )
))
(declare-datatypes ((array!46410 0))(
  ( (array!46411 (arr!22249 (Array (_ BitVec 32) ValueCell!7146)) (size!22670 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46410)

(declare-fun mapDefault!24313 () ValueCell!7146)

(assert (=> b!827785 (= condMapEmpty!24313 (= (arr!22249 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7146)) mapDefault!24313)))))

(declare-fun b!827786 () Bool)

(declare-fun tp_is_empty!15123 () Bool)

(assert (=> b!827786 (= e!461188 tp_is_empty!15123)))

(declare-fun b!827787 () Bool)

(declare-fun e!461186 () Bool)

(assert (=> b!827787 (= e!461186 false)))

(declare-datatypes ((tuple2!10086 0))(
  ( (tuple2!10087 (_1!5054 (_ BitVec 64)) (_2!5054 V!25165)) )
))
(declare-datatypes ((List!15879 0))(
  ( (Nil!15876) (Cons!15875 (h!17004 tuple2!10086) (t!22228 List!15879)) )
))
(declare-datatypes ((ListLongMap!8909 0))(
  ( (ListLongMap!8910 (toList!4470 List!15879)) )
))
(declare-fun lt!375005 () ListLongMap!8909)

(declare-fun zeroValueAfter!34 () V!25165)

(declare-fun minValue!754 () V!25165)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((array!46412 0))(
  ( (array!46413 (arr!22250 (Array (_ BitVec 32) (_ BitVec 64))) (size!22671 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46412)

(declare-fun getCurrentListMapNoExtraKeys!2472 (array!46412 array!46410 (_ BitVec 32) (_ BitVec 32) V!25165 V!25165 (_ BitVec 32) Int) ListLongMap!8909)

(assert (=> b!827787 (= lt!375005 (getCurrentListMapNoExtraKeys!2472 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25165)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!375004 () ListLongMap!8909)

(assert (=> b!827787 (= lt!375004 (getCurrentListMapNoExtraKeys!2472 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827788 () Bool)

(declare-fun res!564174 () Bool)

(assert (=> b!827788 (=> (not res!564174) (not e!461186))))

(declare-datatypes ((List!15880 0))(
  ( (Nil!15877) (Cons!15876 (h!17005 (_ BitVec 64)) (t!22229 List!15880)) )
))
(declare-fun arrayNoDuplicates!0 (array!46412 (_ BitVec 32) List!15880) Bool)

(assert (=> b!827788 (= res!564174 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15877))))

(declare-fun mapNonEmpty!24313 () Bool)

(declare-fun tp!47002 () Bool)

(declare-fun e!461189 () Bool)

(assert (=> mapNonEmpty!24313 (= mapRes!24313 (and tp!47002 e!461189))))

(declare-fun mapValue!24313 () ValueCell!7146)

(declare-fun mapKey!24313 () (_ BitVec 32))

(declare-fun mapRest!24313 () (Array (_ BitVec 32) ValueCell!7146))

(assert (=> mapNonEmpty!24313 (= (arr!22249 _values!788) (store mapRest!24313 mapKey!24313 mapValue!24313))))

(declare-fun b!827789 () Bool)

(declare-fun res!564173 () Bool)

(assert (=> b!827789 (=> (not res!564173) (not e!461186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46412 (_ BitVec 32)) Bool)

(assert (=> b!827789 (= res!564173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24313 () Bool)

(assert (=> mapIsEmpty!24313 mapRes!24313))

(declare-fun res!564176 () Bool)

(assert (=> start!71266 (=> (not res!564176) (not e!461186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71266 (= res!564176 (validMask!0 mask!1312))))

(assert (=> start!71266 e!461186))

(assert (=> start!71266 tp_is_empty!15123))

(declare-fun array_inv!17727 (array!46412) Bool)

(assert (=> start!71266 (array_inv!17727 _keys!976)))

(assert (=> start!71266 true))

(declare-fun array_inv!17728 (array!46410) Bool)

(assert (=> start!71266 (and (array_inv!17728 _values!788) e!461187)))

(assert (=> start!71266 tp!47001))

(declare-fun b!827790 () Bool)

(assert (=> b!827790 (= e!461189 tp_is_empty!15123)))

(declare-fun b!827791 () Bool)

(declare-fun res!564175 () Bool)

(assert (=> b!827791 (=> (not res!564175) (not e!461186))))

(assert (=> b!827791 (= res!564175 (and (= (size!22670 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22671 _keys!976) (size!22670 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71266 res!564176) b!827791))

(assert (= (and b!827791 res!564175) b!827789))

(assert (= (and b!827789 res!564173) b!827788))

(assert (= (and b!827788 res!564174) b!827787))

(assert (= (and b!827785 condMapEmpty!24313) mapIsEmpty!24313))

(assert (= (and b!827785 (not condMapEmpty!24313)) mapNonEmpty!24313))

(get-info :version)

(assert (= (and mapNonEmpty!24313 ((_ is ValueCellFull!7146) mapValue!24313)) b!827790))

(assert (= (and b!827785 ((_ is ValueCellFull!7146) mapDefault!24313)) b!827786))

(assert (= start!71266 b!827785))

(declare-fun m!770783 () Bool)

(assert (=> mapNonEmpty!24313 m!770783))

(declare-fun m!770785 () Bool)

(assert (=> b!827787 m!770785))

(declare-fun m!770787 () Bool)

(assert (=> b!827787 m!770787))

(declare-fun m!770789 () Bool)

(assert (=> start!71266 m!770789))

(declare-fun m!770791 () Bool)

(assert (=> start!71266 m!770791))

(declare-fun m!770793 () Bool)

(assert (=> start!71266 m!770793))

(declare-fun m!770795 () Bool)

(assert (=> b!827789 m!770795))

(declare-fun m!770797 () Bool)

(assert (=> b!827788 m!770797))

(check-sat (not b!827789) (not b!827787) b_and!22351 tp_is_empty!15123 (not b!827788) (not mapNonEmpty!24313) (not b_next!13413) (not start!71266))
(check-sat b_and!22351 (not b_next!13413))
