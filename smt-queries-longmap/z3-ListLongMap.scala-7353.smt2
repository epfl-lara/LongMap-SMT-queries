; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93824 () Bool)

(assert start!93824)

(declare-fun b_free!21297 () Bool)

(declare-fun b_next!21297 () Bool)

(assert (=> start!93824 (= b_free!21297 (not b_next!21297))))

(declare-fun tp!75313 () Bool)

(declare-fun b_and!34011 () Bool)

(assert (=> start!93824 (= tp!75313 b_and!34011)))

(declare-fun b!1061180 () Bool)

(declare-fun e!604261 () Bool)

(declare-fun tp_is_empty!25107 () Bool)

(assert (=> b!1061180 (= e!604261 tp_is_empty!25107)))

(declare-fun b!1061181 () Bool)

(declare-fun e!604263 () Bool)

(declare-fun e!604262 () Bool)

(declare-fun mapRes!39331 () Bool)

(assert (=> b!1061181 (= e!604263 (and e!604262 mapRes!39331))))

(declare-fun condMapEmpty!39331 () Bool)

(declare-datatypes ((V!38611 0))(
  ( (V!38612 (val!12604 Int)) )
))
(declare-datatypes ((ValueCell!11850 0))(
  ( (ValueCellFull!11850 (v!15214 V!38611)) (EmptyCell!11850) )
))
(declare-datatypes ((array!67217 0))(
  ( (array!67218 (arr!32316 (Array (_ BitVec 32) ValueCell!11850)) (size!32852 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67217)

(declare-fun mapDefault!39331 () ValueCell!11850)

(assert (=> b!1061181 (= condMapEmpty!39331 (= (arr!32316 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11850)) mapDefault!39331)))))

(declare-fun b!1061183 () Bool)

(assert (=> b!1061183 (= e!604262 tp_is_empty!25107)))

(declare-fun mapNonEmpty!39331 () Bool)

(declare-fun tp!75314 () Bool)

(assert (=> mapNonEmpty!39331 (= mapRes!39331 (and tp!75314 e!604261))))

(declare-fun mapValue!39331 () ValueCell!11850)

(declare-fun mapRest!39331 () (Array (_ BitVec 32) ValueCell!11850))

(declare-fun mapKey!39331 () (_ BitVec 32))

(assert (=> mapNonEmpty!39331 (= (arr!32316 _values!955) (store mapRest!39331 mapKey!39331 mapValue!39331))))

(declare-fun b!1061184 () Bool)

(declare-fun res!708673 () Bool)

(declare-fun e!604260 () Bool)

(assert (=> b!1061184 (=> (not res!708673) (not e!604260))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67219 0))(
  ( (array!67220 (arr!32317 (Array (_ BitVec 32) (_ BitVec 64))) (size!32853 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67219)

(assert (=> b!1061184 (= res!708673 (and (= (size!32852 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32853 _keys!1163) (size!32852 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061185 () Bool)

(assert (=> b!1061185 (= e!604260 false)))

(declare-datatypes ((tuple2!15926 0))(
  ( (tuple2!15927 (_1!7974 (_ BitVec 64)) (_2!7974 V!38611)) )
))
(declare-datatypes ((List!22512 0))(
  ( (Nil!22509) (Cons!22508 (h!23717 tuple2!15926) (t!31821 List!22512)) )
))
(declare-datatypes ((ListLongMap!13895 0))(
  ( (ListLongMap!13896 (toList!6963 List!22512)) )
))
(declare-fun lt!467490 () ListLongMap!13895)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38611)

(declare-fun minValue!907 () V!38611)

(declare-fun getCurrentListMapNoExtraKeys!3565 (array!67219 array!67217 (_ BitVec 32) (_ BitVec 32) V!38611 V!38611 (_ BitVec 32) Int) ListLongMap!13895)

(assert (=> b!1061185 (= lt!467490 (getCurrentListMapNoExtraKeys!3565 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38611)

(declare-fun lt!467491 () ListLongMap!13895)

(assert (=> b!1061185 (= lt!467491 (getCurrentListMapNoExtraKeys!3565 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061186 () Bool)

(declare-fun res!708674 () Bool)

(assert (=> b!1061186 (=> (not res!708674) (not e!604260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67219 (_ BitVec 32)) Bool)

(assert (=> b!1061186 (= res!708674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39331 () Bool)

(assert (=> mapIsEmpty!39331 mapRes!39331))

(declare-fun res!708676 () Bool)

(assert (=> start!93824 (=> (not res!708676) (not e!604260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93824 (= res!708676 (validMask!0 mask!1515))))

(assert (=> start!93824 e!604260))

(assert (=> start!93824 true))

(assert (=> start!93824 tp_is_empty!25107))

(declare-fun array_inv!25044 (array!67217) Bool)

(assert (=> start!93824 (and (array_inv!25044 _values!955) e!604263)))

(assert (=> start!93824 tp!75313))

(declare-fun array_inv!25045 (array!67219) Bool)

(assert (=> start!93824 (array_inv!25045 _keys!1163)))

(declare-fun b!1061182 () Bool)

(declare-fun res!708675 () Bool)

(assert (=> b!1061182 (=> (not res!708675) (not e!604260))))

(declare-datatypes ((List!22513 0))(
  ( (Nil!22510) (Cons!22509 (h!23718 (_ BitVec 64)) (t!31822 List!22513)) )
))
(declare-fun arrayNoDuplicates!0 (array!67219 (_ BitVec 32) List!22513) Bool)

(assert (=> b!1061182 (= res!708675 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22510))))

(assert (= (and start!93824 res!708676) b!1061184))

(assert (= (and b!1061184 res!708673) b!1061186))

(assert (= (and b!1061186 res!708674) b!1061182))

(assert (= (and b!1061182 res!708675) b!1061185))

(assert (= (and b!1061181 condMapEmpty!39331) mapIsEmpty!39331))

(assert (= (and b!1061181 (not condMapEmpty!39331)) mapNonEmpty!39331))

(get-info :version)

(assert (= (and mapNonEmpty!39331 ((_ is ValueCellFull!11850) mapValue!39331)) b!1061180))

(assert (= (and b!1061181 ((_ is ValueCellFull!11850) mapDefault!39331)) b!1061183))

(assert (= start!93824 b!1061181))

(declare-fun m!980071 () Bool)

(assert (=> b!1061182 m!980071))

(declare-fun m!980073 () Bool)

(assert (=> b!1061185 m!980073))

(declare-fun m!980075 () Bool)

(assert (=> b!1061185 m!980075))

(declare-fun m!980077 () Bool)

(assert (=> start!93824 m!980077))

(declare-fun m!980079 () Bool)

(assert (=> start!93824 m!980079))

(declare-fun m!980081 () Bool)

(assert (=> start!93824 m!980081))

(declare-fun m!980083 () Bool)

(assert (=> mapNonEmpty!39331 m!980083))

(declare-fun m!980085 () Bool)

(assert (=> b!1061186 m!980085))

(check-sat (not b!1061182) (not b_next!21297) tp_is_empty!25107 b_and!34011 (not start!93824) (not b!1061185) (not b!1061186) (not mapNonEmpty!39331))
(check-sat b_and!34011 (not b_next!21297))
