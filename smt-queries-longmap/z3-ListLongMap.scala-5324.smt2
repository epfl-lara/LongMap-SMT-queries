; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71206 () Bool)

(assert start!71206)

(declare-fun b_free!13353 () Bool)

(declare-fun b_next!13353 () Bool)

(assert (=> start!71206 (= b_free!13353 (not b_next!13353))))

(declare-fun tp!46821 () Bool)

(declare-fun b_and!22291 () Bool)

(assert (=> start!71206 (= tp!46821 b_and!22291)))

(declare-fun res!563816 () Bool)

(declare-fun e!460735 () Bool)

(assert (=> start!71206 (=> (not res!563816) (not e!460735))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71206 (= res!563816 (validMask!0 mask!1312))))

(assert (=> start!71206 e!460735))

(declare-fun tp_is_empty!15063 () Bool)

(assert (=> start!71206 tp_is_empty!15063))

(declare-datatypes ((array!46304 0))(
  ( (array!46305 (arr!22196 (Array (_ BitVec 32) (_ BitVec 64))) (size!22617 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46304)

(declare-fun array_inv!17691 (array!46304) Bool)

(assert (=> start!71206 (array_inv!17691 _keys!976)))

(assert (=> start!71206 true))

(declare-datatypes ((V!25085 0))(
  ( (V!25086 (val!7579 Int)) )
))
(declare-datatypes ((ValueCell!7116 0))(
  ( (ValueCellFull!7116 (v!10014 V!25085)) (EmptyCell!7116) )
))
(declare-datatypes ((array!46306 0))(
  ( (array!46307 (arr!22197 (Array (_ BitVec 32) ValueCell!7116)) (size!22618 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46306)

(declare-fun e!460737 () Bool)

(declare-fun array_inv!17692 (array!46306) Bool)

(assert (=> start!71206 (and (array_inv!17692 _values!788) e!460737)))

(assert (=> start!71206 tp!46821))

(declare-fun b!827155 () Bool)

(declare-fun e!460739 () Bool)

(declare-fun mapRes!24223 () Bool)

(assert (=> b!827155 (= e!460737 (and e!460739 mapRes!24223))))

(declare-fun condMapEmpty!24223 () Bool)

(declare-fun mapDefault!24223 () ValueCell!7116)

(assert (=> b!827155 (= condMapEmpty!24223 (= (arr!22197 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7116)) mapDefault!24223)))))

(declare-fun b!827156 () Bool)

(declare-fun res!563815 () Bool)

(assert (=> b!827156 (=> (not res!563815) (not e!460735))))

(declare-datatypes ((List!15844 0))(
  ( (Nil!15841) (Cons!15840 (h!16969 (_ BitVec 64)) (t!22193 List!15844)) )
))
(declare-fun arrayNoDuplicates!0 (array!46304 (_ BitVec 32) List!15844) Bool)

(assert (=> b!827156 (= res!563815 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15841))))

(declare-fun b!827157 () Bool)

(declare-fun res!563813 () Bool)

(assert (=> b!827157 (=> (not res!563813) (not e!460735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46304 (_ BitVec 32)) Bool)

(assert (=> b!827157 (= res!563813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827158 () Bool)

(assert (=> b!827158 (= e!460735 (not true))))

(declare-datatypes ((tuple2!10048 0))(
  ( (tuple2!10049 (_1!5035 (_ BitVec 64)) (_2!5035 V!25085)) )
))
(declare-datatypes ((List!15845 0))(
  ( (Nil!15842) (Cons!15841 (h!16970 tuple2!10048) (t!22194 List!15845)) )
))
(declare-datatypes ((ListLongMap!8871 0))(
  ( (ListLongMap!8872 (toList!4451 List!15845)) )
))
(declare-fun lt!374820 () ListLongMap!8871)

(declare-fun lt!374822 () ListLongMap!8871)

(assert (=> b!827158 (= lt!374820 lt!374822)))

(declare-fun zeroValueBefore!34 () V!25085)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!25085)

(declare-fun minValue!754 () V!25085)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28361 0))(
  ( (Unit!28362) )
))
(declare-fun lt!374821 () Unit!28361)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!563 (array!46304 array!46306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25085 V!25085 V!25085 V!25085 (_ BitVec 32) Int) Unit!28361)

(assert (=> b!827158 (= lt!374821 (lemmaNoChangeToArrayThenSameMapNoExtras!563 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2453 (array!46304 array!46306 (_ BitVec 32) (_ BitVec 32) V!25085 V!25085 (_ BitVec 32) Int) ListLongMap!8871)

(assert (=> b!827158 (= lt!374822 (getCurrentListMapNoExtraKeys!2453 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827158 (= lt!374820 (getCurrentListMapNoExtraKeys!2453 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24223 () Bool)

(assert (=> mapIsEmpty!24223 mapRes!24223))

(declare-fun b!827159 () Bool)

(assert (=> b!827159 (= e!460739 tp_is_empty!15063)))

(declare-fun b!827160 () Bool)

(declare-fun e!460736 () Bool)

(assert (=> b!827160 (= e!460736 tp_is_empty!15063)))

(declare-fun mapNonEmpty!24223 () Bool)

(declare-fun tp!46822 () Bool)

(assert (=> mapNonEmpty!24223 (= mapRes!24223 (and tp!46822 e!460736))))

(declare-fun mapKey!24223 () (_ BitVec 32))

(declare-fun mapRest!24223 () (Array (_ BitVec 32) ValueCell!7116))

(declare-fun mapValue!24223 () ValueCell!7116)

(assert (=> mapNonEmpty!24223 (= (arr!22197 _values!788) (store mapRest!24223 mapKey!24223 mapValue!24223))))

(declare-fun b!827161 () Bool)

(declare-fun res!563814 () Bool)

(assert (=> b!827161 (=> (not res!563814) (not e!460735))))

(assert (=> b!827161 (= res!563814 (and (= (size!22618 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22617 _keys!976) (size!22618 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71206 res!563816) b!827161))

(assert (= (and b!827161 res!563814) b!827157))

(assert (= (and b!827157 res!563813) b!827156))

(assert (= (and b!827156 res!563815) b!827158))

(assert (= (and b!827155 condMapEmpty!24223) mapIsEmpty!24223))

(assert (= (and b!827155 (not condMapEmpty!24223)) mapNonEmpty!24223))

(get-info :version)

(assert (= (and mapNonEmpty!24223 ((_ is ValueCellFull!7116) mapValue!24223)) b!827160))

(assert (= (and b!827155 ((_ is ValueCellFull!7116) mapDefault!24223)) b!827159))

(assert (= start!71206 b!827155))

(declare-fun m!770299 () Bool)

(assert (=> start!71206 m!770299))

(declare-fun m!770301 () Bool)

(assert (=> start!71206 m!770301))

(declare-fun m!770303 () Bool)

(assert (=> start!71206 m!770303))

(declare-fun m!770305 () Bool)

(assert (=> b!827158 m!770305))

(declare-fun m!770307 () Bool)

(assert (=> b!827158 m!770307))

(declare-fun m!770309 () Bool)

(assert (=> b!827158 m!770309))

(declare-fun m!770311 () Bool)

(assert (=> mapNonEmpty!24223 m!770311))

(declare-fun m!770313 () Bool)

(assert (=> b!827156 m!770313))

(declare-fun m!770315 () Bool)

(assert (=> b!827157 m!770315))

(check-sat tp_is_empty!15063 b_and!22291 (not b!827157) (not b!827156) (not b_next!13353) (not mapNonEmpty!24223) (not start!71206) (not b!827158))
(check-sat b_and!22291 (not b_next!13353))
