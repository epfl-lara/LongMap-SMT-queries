; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71214 () Bool)

(assert start!71214)

(declare-fun b_free!13381 () Bool)

(declare-fun b_next!13381 () Bool)

(assert (=> start!71214 (= b_free!13381 (not b_next!13381))))

(declare-fun tp!46905 () Bool)

(declare-fun b_and!22293 () Bool)

(assert (=> start!71214 (= tp!46905 b_and!22293)))

(declare-fun mapIsEmpty!24265 () Bool)

(declare-fun mapRes!24265 () Bool)

(assert (=> mapIsEmpty!24265 mapRes!24265))

(declare-fun b!827203 () Bool)

(declare-fun e!460798 () Bool)

(declare-fun e!460795 () Bool)

(assert (=> b!827203 (= e!460798 (and e!460795 mapRes!24265))))

(declare-fun condMapEmpty!24265 () Bool)

(declare-datatypes ((V!25123 0))(
  ( (V!25124 (val!7593 Int)) )
))
(declare-datatypes ((ValueCell!7130 0))(
  ( (ValueCellFull!7130 (v!10022 V!25123)) (EmptyCell!7130) )
))
(declare-datatypes ((array!46323 0))(
  ( (array!46324 (arr!22206 (Array (_ BitVec 32) ValueCell!7130)) (size!22627 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46323)

(declare-fun mapDefault!24265 () ValueCell!7130)

(assert (=> b!827203 (= condMapEmpty!24265 (= (arr!22206 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7130)) mapDefault!24265)))))

(declare-fun b!827204 () Bool)

(declare-fun res!563876 () Bool)

(declare-fun e!460796 () Bool)

(assert (=> b!827204 (=> (not res!563876) (not e!460796))))

(declare-datatypes ((array!46325 0))(
  ( (array!46326 (arr!22207 (Array (_ BitVec 32) (_ BitVec 64))) (size!22628 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46325)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46325 (_ BitVec 32)) Bool)

(assert (=> b!827204 (= res!563876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827205 () Bool)

(declare-fun tp_is_empty!15091 () Bool)

(assert (=> b!827205 (= e!460795 tp_is_empty!15091)))

(declare-fun b!827206 () Bool)

(declare-fun res!563875 () Bool)

(assert (=> b!827206 (=> (not res!563875) (not e!460796))))

(declare-datatypes ((List!15864 0))(
  ( (Nil!15861) (Cons!15860 (h!16989 (_ BitVec 64)) (t!22204 List!15864)) )
))
(declare-fun arrayNoDuplicates!0 (array!46325 (_ BitVec 32) List!15864) Bool)

(assert (=> b!827206 (= res!563875 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15861))))

(declare-fun b!827207 () Bool)

(assert (=> b!827207 (= e!460796 false)))

(declare-fun zeroValueAfter!34 () V!25123)

(declare-fun minValue!754 () V!25123)

(declare-datatypes ((tuple2!10076 0))(
  ( (tuple2!10077 (_1!5049 (_ BitVec 64)) (_2!5049 V!25123)) )
))
(declare-datatypes ((List!15865 0))(
  ( (Nil!15862) (Cons!15861 (h!16990 tuple2!10076) (t!22205 List!15865)) )
))
(declare-datatypes ((ListLongMap!8889 0))(
  ( (ListLongMap!8890 (toList!4460 List!15865)) )
))
(declare-fun lt!374665 () ListLongMap!8889)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2492 (array!46325 array!46323 (_ BitVec 32) (_ BitVec 32) V!25123 V!25123 (_ BitVec 32) Int) ListLongMap!8889)

(assert (=> b!827207 (= lt!374665 (getCurrentListMapNoExtraKeys!2492 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374666 () ListLongMap!8889)

(declare-fun zeroValueBefore!34 () V!25123)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!827207 (= lt!374666 (getCurrentListMapNoExtraKeys!2492 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24265 () Bool)

(declare-fun tp!46906 () Bool)

(declare-fun e!460797 () Bool)

(assert (=> mapNonEmpty!24265 (= mapRes!24265 (and tp!46906 e!460797))))

(declare-fun mapValue!24265 () ValueCell!7130)

(declare-fun mapRest!24265 () (Array (_ BitVec 32) ValueCell!7130))

(declare-fun mapKey!24265 () (_ BitVec 32))

(assert (=> mapNonEmpty!24265 (= (arr!22206 _values!788) (store mapRest!24265 mapKey!24265 mapValue!24265))))

(declare-fun b!827208 () Bool)

(assert (=> b!827208 (= e!460797 tp_is_empty!15091)))

(declare-fun b!827209 () Bool)

(declare-fun res!563878 () Bool)

(assert (=> b!827209 (=> (not res!563878) (not e!460796))))

(assert (=> b!827209 (= res!563878 (and (= (size!22627 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22628 _keys!976) (size!22627 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!563877 () Bool)

(assert (=> start!71214 (=> (not res!563877) (not e!460796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71214 (= res!563877 (validMask!0 mask!1312))))

(assert (=> start!71214 e!460796))

(assert (=> start!71214 tp_is_empty!15091))

(declare-fun array_inv!17761 (array!46325) Bool)

(assert (=> start!71214 (array_inv!17761 _keys!976)))

(assert (=> start!71214 true))

(declare-fun array_inv!17762 (array!46323) Bool)

(assert (=> start!71214 (and (array_inv!17762 _values!788) e!460798)))

(assert (=> start!71214 tp!46905))

(assert (= (and start!71214 res!563877) b!827209))

(assert (= (and b!827209 res!563878) b!827204))

(assert (= (and b!827204 res!563876) b!827206))

(assert (= (and b!827206 res!563875) b!827207))

(assert (= (and b!827203 condMapEmpty!24265) mapIsEmpty!24265))

(assert (= (and b!827203 (not condMapEmpty!24265)) mapNonEmpty!24265))

(get-info :version)

(assert (= (and mapNonEmpty!24265 ((_ is ValueCellFull!7130) mapValue!24265)) b!827208))

(assert (= (and b!827203 ((_ is ValueCellFull!7130) mapDefault!24265)) b!827205))

(assert (= start!71214 b!827203))

(declare-fun m!769775 () Bool)

(assert (=> start!71214 m!769775))

(declare-fun m!769777 () Bool)

(assert (=> start!71214 m!769777))

(declare-fun m!769779 () Bool)

(assert (=> start!71214 m!769779))

(declare-fun m!769781 () Bool)

(assert (=> b!827206 m!769781))

(declare-fun m!769783 () Bool)

(assert (=> b!827204 m!769783))

(declare-fun m!769785 () Bool)

(assert (=> mapNonEmpty!24265 m!769785))

(declare-fun m!769787 () Bool)

(assert (=> b!827207 m!769787))

(declare-fun m!769789 () Bool)

(assert (=> b!827207 m!769789))

(check-sat tp_is_empty!15091 (not start!71214) (not mapNonEmpty!24265) (not b!827207) (not b!827204) (not b_next!13381) b_and!22293 (not b!827206))
(check-sat b_and!22293 (not b_next!13381))
