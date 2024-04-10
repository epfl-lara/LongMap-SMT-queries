; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71242 () Bool)

(assert start!71242)

(declare-fun b_free!13389 () Bool)

(declare-fun b_next!13389 () Bool)

(assert (=> start!71242 (= b_free!13389 (not b_next!13389))))

(declare-fun tp!46930 () Bool)

(declare-fun b_and!22327 () Bool)

(assert (=> start!71242 (= tp!46930 b_and!22327)))

(declare-fun mapIsEmpty!24277 () Bool)

(declare-fun mapRes!24277 () Bool)

(assert (=> mapIsEmpty!24277 mapRes!24277))

(declare-fun b!827533 () Bool)

(declare-fun e!461005 () Bool)

(assert (=> b!827533 (= e!461005 false)))

(declare-datatypes ((array!46370 0))(
  ( (array!46371 (arr!22229 (Array (_ BitVec 32) (_ BitVec 64))) (size!22650 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46370)

(declare-datatypes ((V!25133 0))(
  ( (V!25134 (val!7597 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25133)

(declare-fun minValue!754 () V!25133)

(declare-datatypes ((ValueCell!7134 0))(
  ( (ValueCellFull!7134 (v!10032 V!25133)) (EmptyCell!7134) )
))
(declare-datatypes ((array!46372 0))(
  ( (array!46373 (arr!22230 (Array (_ BitVec 32) ValueCell!7134)) (size!22651 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46372)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!10072 0))(
  ( (tuple2!10073 (_1!5047 (_ BitVec 64)) (_2!5047 V!25133)) )
))
(declare-datatypes ((List!15867 0))(
  ( (Nil!15864) (Cons!15863 (h!16992 tuple2!10072) (t!22216 List!15867)) )
))
(declare-datatypes ((ListLongMap!8895 0))(
  ( (ListLongMap!8896 (toList!4463 List!15867)) )
))
(declare-fun lt!374932 () ListLongMap!8895)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2465 (array!46370 array!46372 (_ BitVec 32) (_ BitVec 32) V!25133 V!25133 (_ BitVec 32) Int) ListLongMap!8895)

(assert (=> b!827533 (= lt!374932 (getCurrentListMapNoExtraKeys!2465 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25133)

(declare-fun lt!374933 () ListLongMap!8895)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!827533 (= lt!374933 (getCurrentListMapNoExtraKeys!2465 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827534 () Bool)

(declare-fun res!564032 () Bool)

(assert (=> b!827534 (=> (not res!564032) (not e!461005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46370 (_ BitVec 32)) Bool)

(assert (=> b!827534 (= res!564032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24277 () Bool)

(declare-fun tp!46929 () Bool)

(declare-fun e!461006 () Bool)

(assert (=> mapNonEmpty!24277 (= mapRes!24277 (and tp!46929 e!461006))))

(declare-fun mapRest!24277 () (Array (_ BitVec 32) ValueCell!7134))

(declare-fun mapKey!24277 () (_ BitVec 32))

(declare-fun mapValue!24277 () ValueCell!7134)

(assert (=> mapNonEmpty!24277 (= (arr!22230 _values!788) (store mapRest!24277 mapKey!24277 mapValue!24277))))

(declare-fun b!827535 () Bool)

(declare-fun res!564030 () Bool)

(assert (=> b!827535 (=> (not res!564030) (not e!461005))))

(assert (=> b!827535 (= res!564030 (and (= (size!22651 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22650 _keys!976) (size!22651 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!564029 () Bool)

(assert (=> start!71242 (=> (not res!564029) (not e!461005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71242 (= res!564029 (validMask!0 mask!1312))))

(assert (=> start!71242 e!461005))

(declare-fun tp_is_empty!15099 () Bool)

(assert (=> start!71242 tp_is_empty!15099))

(declare-fun array_inv!17713 (array!46370) Bool)

(assert (=> start!71242 (array_inv!17713 _keys!976)))

(assert (=> start!71242 true))

(declare-fun e!461007 () Bool)

(declare-fun array_inv!17714 (array!46372) Bool)

(assert (=> start!71242 (and (array_inv!17714 _values!788) e!461007)))

(assert (=> start!71242 tp!46930))

(declare-fun b!827536 () Bool)

(assert (=> b!827536 (= e!461006 tp_is_empty!15099)))

(declare-fun b!827537 () Bool)

(declare-fun e!461009 () Bool)

(assert (=> b!827537 (= e!461007 (and e!461009 mapRes!24277))))

(declare-fun condMapEmpty!24277 () Bool)

(declare-fun mapDefault!24277 () ValueCell!7134)

(assert (=> b!827537 (= condMapEmpty!24277 (= (arr!22230 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7134)) mapDefault!24277)))))

(declare-fun b!827538 () Bool)

(declare-fun res!564031 () Bool)

(assert (=> b!827538 (=> (not res!564031) (not e!461005))))

(declare-datatypes ((List!15868 0))(
  ( (Nil!15865) (Cons!15864 (h!16993 (_ BitVec 64)) (t!22217 List!15868)) )
))
(declare-fun arrayNoDuplicates!0 (array!46370 (_ BitVec 32) List!15868) Bool)

(assert (=> b!827538 (= res!564031 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15865))))

(declare-fun b!827539 () Bool)

(assert (=> b!827539 (= e!461009 tp_is_empty!15099)))

(assert (= (and start!71242 res!564029) b!827535))

(assert (= (and b!827535 res!564030) b!827534))

(assert (= (and b!827534 res!564032) b!827538))

(assert (= (and b!827538 res!564031) b!827533))

(assert (= (and b!827537 condMapEmpty!24277) mapIsEmpty!24277))

(assert (= (and b!827537 (not condMapEmpty!24277)) mapNonEmpty!24277))

(get-info :version)

(assert (= (and mapNonEmpty!24277 ((_ is ValueCellFull!7134) mapValue!24277)) b!827536))

(assert (= (and b!827537 ((_ is ValueCellFull!7134) mapDefault!24277)) b!827539))

(assert (= start!71242 b!827537))

(declare-fun m!770591 () Bool)

(assert (=> b!827538 m!770591))

(declare-fun m!770593 () Bool)

(assert (=> mapNonEmpty!24277 m!770593))

(declare-fun m!770595 () Bool)

(assert (=> b!827534 m!770595))

(declare-fun m!770597 () Bool)

(assert (=> b!827533 m!770597))

(declare-fun m!770599 () Bool)

(assert (=> b!827533 m!770599))

(declare-fun m!770601 () Bool)

(assert (=> start!71242 m!770601))

(declare-fun m!770603 () Bool)

(assert (=> start!71242 m!770603))

(declare-fun m!770605 () Bool)

(assert (=> start!71242 m!770605))

(check-sat (not b!827533) (not b!827538) (not mapNonEmpty!24277) tp_is_empty!15099 b_and!22327 (not b!827534) (not b_next!13389) (not start!71242))
(check-sat b_and!22327 (not b_next!13389))
