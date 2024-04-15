; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71208 () Bool)

(assert start!71208)

(declare-fun b_free!13375 () Bool)

(declare-fun b_next!13375 () Bool)

(assert (=> start!71208 (= b_free!13375 (not b_next!13375))))

(declare-fun tp!46888 () Bool)

(declare-fun b_and!22287 () Bool)

(assert (=> start!71208 (= tp!46888 b_and!22287)))

(declare-fun res!563841 () Bool)

(declare-fun e!460754 () Bool)

(assert (=> start!71208 (=> (not res!563841) (not e!460754))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71208 (= res!563841 (validMask!0 mask!1312))))

(assert (=> start!71208 e!460754))

(declare-fun tp_is_empty!15085 () Bool)

(assert (=> start!71208 tp_is_empty!15085))

(declare-datatypes ((array!46313 0))(
  ( (array!46314 (arr!22201 (Array (_ BitVec 32) (_ BitVec 64))) (size!22622 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46313)

(declare-fun array_inv!17757 (array!46313) Bool)

(assert (=> start!71208 (array_inv!17757 _keys!976)))

(assert (=> start!71208 true))

(declare-datatypes ((V!25115 0))(
  ( (V!25116 (val!7590 Int)) )
))
(declare-datatypes ((ValueCell!7127 0))(
  ( (ValueCellFull!7127 (v!10019 V!25115)) (EmptyCell!7127) )
))
(declare-datatypes ((array!46315 0))(
  ( (array!46316 (arr!22202 (Array (_ BitVec 32) ValueCell!7127)) (size!22623 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46315)

(declare-fun e!460752 () Bool)

(declare-fun array_inv!17758 (array!46315) Bool)

(assert (=> start!71208 (and (array_inv!17758 _values!788) e!460752)))

(assert (=> start!71208 tp!46888))

(declare-fun mapIsEmpty!24256 () Bool)

(declare-fun mapRes!24256 () Bool)

(assert (=> mapIsEmpty!24256 mapRes!24256))

(declare-fun b!827140 () Bool)

(declare-fun e!460753 () Bool)

(assert (=> b!827140 (= e!460752 (and e!460753 mapRes!24256))))

(declare-fun condMapEmpty!24256 () Bool)

(declare-fun mapDefault!24256 () ValueCell!7127)

(assert (=> b!827140 (= condMapEmpty!24256 (= (arr!22202 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7127)) mapDefault!24256)))))

(declare-fun b!827141 () Bool)

(assert (=> b!827141 (= e!460754 false)))

(declare-fun zeroValueAfter!34 () V!25115)

(declare-fun minValue!754 () V!25115)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!10072 0))(
  ( (tuple2!10073 (_1!5047 (_ BitVec 64)) (_2!5047 V!25115)) )
))
(declare-datatypes ((List!15861 0))(
  ( (Nil!15858) (Cons!15857 (h!16986 tuple2!10072) (t!22201 List!15861)) )
))
(declare-datatypes ((ListLongMap!8885 0))(
  ( (ListLongMap!8886 (toList!4458 List!15861)) )
))
(declare-fun lt!374647 () ListLongMap!8885)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2490 (array!46313 array!46315 (_ BitVec 32) (_ BitVec 32) V!25115 V!25115 (_ BitVec 32) Int) ListLongMap!8885)

(assert (=> b!827141 (= lt!374647 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueBefore!34 () V!25115)

(declare-fun lt!374648 () ListLongMap!8885)

(assert (=> b!827141 (= lt!374648 (getCurrentListMapNoExtraKeys!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827142 () Bool)

(declare-fun res!563842 () Bool)

(assert (=> b!827142 (=> (not res!563842) (not e!460754))))

(assert (=> b!827142 (= res!563842 (and (= (size!22623 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22622 _keys!976) (size!22623 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827143 () Bool)

(declare-fun e!460750 () Bool)

(assert (=> b!827143 (= e!460750 tp_is_empty!15085)))

(declare-fun mapNonEmpty!24256 () Bool)

(declare-fun tp!46887 () Bool)

(assert (=> mapNonEmpty!24256 (= mapRes!24256 (and tp!46887 e!460750))))

(declare-fun mapRest!24256 () (Array (_ BitVec 32) ValueCell!7127))

(declare-fun mapValue!24256 () ValueCell!7127)

(declare-fun mapKey!24256 () (_ BitVec 32))

(assert (=> mapNonEmpty!24256 (= (arr!22202 _values!788) (store mapRest!24256 mapKey!24256 mapValue!24256))))

(declare-fun b!827144 () Bool)

(assert (=> b!827144 (= e!460753 tp_is_empty!15085)))

(declare-fun b!827145 () Bool)

(declare-fun res!563840 () Bool)

(assert (=> b!827145 (=> (not res!563840) (not e!460754))))

(declare-datatypes ((List!15862 0))(
  ( (Nil!15859) (Cons!15858 (h!16987 (_ BitVec 64)) (t!22202 List!15862)) )
))
(declare-fun arrayNoDuplicates!0 (array!46313 (_ BitVec 32) List!15862) Bool)

(assert (=> b!827145 (= res!563840 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15859))))

(declare-fun b!827146 () Bool)

(declare-fun res!563839 () Bool)

(assert (=> b!827146 (=> (not res!563839) (not e!460754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46313 (_ BitVec 32)) Bool)

(assert (=> b!827146 (= res!563839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71208 res!563841) b!827142))

(assert (= (and b!827142 res!563842) b!827146))

(assert (= (and b!827146 res!563839) b!827145))

(assert (= (and b!827145 res!563840) b!827141))

(assert (= (and b!827140 condMapEmpty!24256) mapIsEmpty!24256))

(assert (= (and b!827140 (not condMapEmpty!24256)) mapNonEmpty!24256))

(get-info :version)

(assert (= (and mapNonEmpty!24256 ((_ is ValueCellFull!7127) mapValue!24256)) b!827143))

(assert (= (and b!827140 ((_ is ValueCellFull!7127) mapDefault!24256)) b!827144))

(assert (= start!71208 b!827140))

(declare-fun m!769727 () Bool)

(assert (=> b!827146 m!769727))

(declare-fun m!769729 () Bool)

(assert (=> b!827141 m!769729))

(declare-fun m!769731 () Bool)

(assert (=> b!827141 m!769731))

(declare-fun m!769733 () Bool)

(assert (=> start!71208 m!769733))

(declare-fun m!769735 () Bool)

(assert (=> start!71208 m!769735))

(declare-fun m!769737 () Bool)

(assert (=> start!71208 m!769737))

(declare-fun m!769739 () Bool)

(assert (=> mapNonEmpty!24256 m!769739))

(declare-fun m!769741 () Bool)

(assert (=> b!827145 m!769741))

(check-sat (not mapNonEmpty!24256) (not b!827146) (not b_next!13375) (not start!71208) (not b!827145) tp_is_empty!15085 (not b!827141) b_and!22287)
(check-sat b_and!22287 (not b_next!13375))
