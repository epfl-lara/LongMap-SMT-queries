; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41444 () Bool)

(assert start!41444)

(declare-fun b_free!11137 () Bool)

(declare-fun b_next!11137 () Bool)

(assert (=> start!41444 (= b_free!11137 (not b_next!11137))))

(declare-fun tp!39406 () Bool)

(declare-fun b_and!19483 () Bool)

(assert (=> start!41444 (= tp!39406 b_and!19483)))

(declare-fun b!463151 () Bool)

(declare-fun e!270387 () Bool)

(declare-fun tp_is_empty!12565 () Bool)

(assert (=> b!463151 (= e!270387 tp_is_empty!12565)))

(declare-fun b!463152 () Bool)

(declare-fun e!270386 () Bool)

(declare-fun e!270389 () Bool)

(declare-fun mapRes!20521 () Bool)

(assert (=> b!463152 (= e!270386 (and e!270389 mapRes!20521))))

(declare-fun condMapEmpty!20521 () Bool)

(declare-datatypes ((V!17859 0))(
  ( (V!17860 (val!6327 Int)) )
))
(declare-datatypes ((ValueCell!5939 0))(
  ( (ValueCellFull!5939 (v!8615 V!17859)) (EmptyCell!5939) )
))
(declare-datatypes ((array!28926 0))(
  ( (array!28927 (arr!13895 (Array (_ BitVec 32) ValueCell!5939)) (size!14247 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28926)

(declare-fun mapDefault!20521 () ValueCell!5939)

(assert (=> b!463152 (= condMapEmpty!20521 (= (arr!13895 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5939)) mapDefault!20521)))))

(declare-fun b!463153 () Bool)

(declare-fun res!276981 () Bool)

(declare-fun e!270390 () Bool)

(assert (=> b!463153 (=> (not res!276981) (not e!270390))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28928 0))(
  ( (array!28929 (arr!13896 (Array (_ BitVec 32) (_ BitVec 64))) (size!14248 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28928)

(assert (=> b!463153 (= res!276981 (and (= (size!14247 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14248 _keys!1025) (size!14247 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20521 () Bool)

(assert (=> mapIsEmpty!20521 mapRes!20521))

(declare-fun b!463154 () Bool)

(declare-fun res!276980 () Bool)

(assert (=> b!463154 (=> (not res!276980) (not e!270390))))

(declare-datatypes ((List!8308 0))(
  ( (Nil!8305) (Cons!8304 (h!9160 (_ BitVec 64)) (t!14244 List!8308)) )
))
(declare-fun arrayNoDuplicates!0 (array!28928 (_ BitVec 32) List!8308) Bool)

(assert (=> b!463154 (= res!276980 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8305))))

(declare-fun res!276982 () Bool)

(assert (=> start!41444 (=> (not res!276982) (not e!270390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41444 (= res!276982 (validMask!0 mask!1365))))

(assert (=> start!41444 e!270390))

(assert (=> start!41444 tp_is_empty!12565))

(assert (=> start!41444 tp!39406))

(assert (=> start!41444 true))

(declare-fun array_inv!10128 (array!28928) Bool)

(assert (=> start!41444 (array_inv!10128 _keys!1025)))

(declare-fun array_inv!10129 (array!28926) Bool)

(assert (=> start!41444 (and (array_inv!10129 _values!833) e!270386)))

(declare-fun b!463155 () Bool)

(assert (=> b!463155 (= e!270390 false)))

(declare-fun minValueBefore!38 () V!17859)

(declare-fun zeroValue!794 () V!17859)

(declare-datatypes ((tuple2!8226 0))(
  ( (tuple2!8227 (_1!4124 (_ BitVec 64)) (_2!4124 V!17859)) )
))
(declare-datatypes ((List!8309 0))(
  ( (Nil!8306) (Cons!8305 (h!9161 tuple2!8226) (t!14245 List!8309)) )
))
(declare-datatypes ((ListLongMap!7141 0))(
  ( (ListLongMap!7142 (toList!3586 List!8309)) )
))
(declare-fun lt!209333 () ListLongMap!7141)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1813 (array!28928 array!28926 (_ BitVec 32) (_ BitVec 32) V!17859 V!17859 (_ BitVec 32) Int) ListLongMap!7141)

(assert (=> b!463155 (= lt!209333 (getCurrentListMapNoExtraKeys!1813 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463156 () Bool)

(declare-fun res!276979 () Bool)

(assert (=> b!463156 (=> (not res!276979) (not e!270390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28928 (_ BitVec 32)) Bool)

(assert (=> b!463156 (= res!276979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463157 () Bool)

(assert (=> b!463157 (= e!270389 tp_is_empty!12565)))

(declare-fun mapNonEmpty!20521 () Bool)

(declare-fun tp!39405 () Bool)

(assert (=> mapNonEmpty!20521 (= mapRes!20521 (and tp!39405 e!270387))))

(declare-fun mapKey!20521 () (_ BitVec 32))

(declare-fun mapValue!20521 () ValueCell!5939)

(declare-fun mapRest!20521 () (Array (_ BitVec 32) ValueCell!5939))

(assert (=> mapNonEmpty!20521 (= (arr!13895 _values!833) (store mapRest!20521 mapKey!20521 mapValue!20521))))

(assert (= (and start!41444 res!276982) b!463153))

(assert (= (and b!463153 res!276981) b!463156))

(assert (= (and b!463156 res!276979) b!463154))

(assert (= (and b!463154 res!276980) b!463155))

(assert (= (and b!463152 condMapEmpty!20521) mapIsEmpty!20521))

(assert (= (and b!463152 (not condMapEmpty!20521)) mapNonEmpty!20521))

(get-info :version)

(assert (= (and mapNonEmpty!20521 ((_ is ValueCellFull!5939) mapValue!20521)) b!463151))

(assert (= (and b!463152 ((_ is ValueCellFull!5939) mapDefault!20521)) b!463157))

(assert (= start!41444 b!463152))

(declare-fun m!446063 () Bool)

(assert (=> b!463154 m!446063))

(declare-fun m!446065 () Bool)

(assert (=> b!463155 m!446065))

(declare-fun m!446067 () Bool)

(assert (=> b!463156 m!446067))

(declare-fun m!446069 () Bool)

(assert (=> start!41444 m!446069))

(declare-fun m!446071 () Bool)

(assert (=> start!41444 m!446071))

(declare-fun m!446073 () Bool)

(assert (=> start!41444 m!446073))

(declare-fun m!446075 () Bool)

(assert (=> mapNonEmpty!20521 m!446075))

(check-sat b_and!19483 (not b!463156) (not start!41444) (not mapNonEmpty!20521) (not b!463155) (not b!463154) tp_is_empty!12565 (not b_next!11137))
(check-sat b_and!19483 (not b_next!11137))
