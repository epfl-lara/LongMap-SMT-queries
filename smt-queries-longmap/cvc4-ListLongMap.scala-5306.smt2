; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71060 () Bool)

(assert start!71060)

(declare-fun b_free!13247 () Bool)

(declare-fun b_next!13247 () Bool)

(assert (=> start!71060 (= b_free!13247 (not b_next!13247))))

(declare-fun tp!46497 () Bool)

(declare-fun b_and!22161 () Bool)

(assert (=> start!71060 (= tp!46497 b_and!22161)))

(declare-fun b!825169 () Bool)

(declare-fun res!562512 () Bool)

(declare-fun e!459224 () Bool)

(assert (=> b!825169 (=> (not res!562512) (not e!459224))))

(declare-datatypes ((array!46102 0))(
  ( (array!46103 (arr!22097 (Array (_ BitVec 32) (_ BitVec 64))) (size!22518 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46102)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24943 0))(
  ( (V!24944 (val!7526 Int)) )
))
(declare-datatypes ((ValueCell!7063 0))(
  ( (ValueCellFull!7063 (v!9959 V!24943)) (EmptyCell!7063) )
))
(declare-datatypes ((array!46104 0))(
  ( (array!46105 (arr!22098 (Array (_ BitVec 32) ValueCell!7063)) (size!22519 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46104)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825169 (= res!562512 (and (= (size!22519 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22518 _keys!976) (size!22519 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9962 0))(
  ( (tuple2!9963 (_1!4992 (_ BitVec 64)) (_2!4992 V!24943)) )
))
(declare-fun lt!372300 () tuple2!9962)

(declare-fun e!459221 () Bool)

(declare-datatypes ((List!15768 0))(
  ( (Nil!15765) (Cons!15764 (h!16893 tuple2!9962) (t!22113 List!15768)) )
))
(declare-datatypes ((ListLongMap!8785 0))(
  ( (ListLongMap!8786 (toList!4408 List!15768)) )
))
(declare-fun lt!372294 () ListLongMap!8785)

(declare-fun lt!372306 () ListLongMap!8785)

(declare-fun lt!372301 () tuple2!9962)

(declare-fun b!825170 () Bool)

(declare-fun +!1917 (ListLongMap!8785 tuple2!9962) ListLongMap!8785)

(assert (=> b!825170 (= e!459221 (= lt!372294 (+!1917 (+!1917 lt!372306 lt!372300) lt!372301)))))

(declare-fun b!825171 () Bool)

(declare-fun e!459222 () Bool)

(assert (=> b!825171 (= e!459224 (not e!459222))))

(declare-fun res!562513 () Bool)

(assert (=> b!825171 (=> res!562513 e!459222)))

(assert (=> b!825171 (= res!562513 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372299 () ListLongMap!8785)

(assert (=> b!825171 (= lt!372299 lt!372306)))

(declare-fun zeroValueBefore!34 () V!24943)

(declare-fun zeroValueAfter!34 () V!24943)

(declare-fun minValue!754 () V!24943)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28281 0))(
  ( (Unit!28282) )
))
(declare-fun lt!372304 () Unit!28281)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!531 (array!46102 array!46104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24943 V!24943 V!24943 V!24943 (_ BitVec 32) Int) Unit!28281)

(assert (=> b!825171 (= lt!372304 (lemmaNoChangeToArrayThenSameMapNoExtras!531 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2421 (array!46102 array!46104 (_ BitVec 32) (_ BitVec 32) V!24943 V!24943 (_ BitVec 32) Int) ListLongMap!8785)

(assert (=> b!825171 (= lt!372306 (getCurrentListMapNoExtraKeys!2421 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825171 (= lt!372299 (getCurrentListMapNoExtraKeys!2421 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825172 () Bool)

(declare-fun res!562509 () Bool)

(assert (=> b!825172 (=> (not res!562509) (not e!459224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46102 (_ BitVec 32)) Bool)

(assert (=> b!825172 (= res!562509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825173 () Bool)

(declare-fun e!459218 () Bool)

(declare-fun tp_is_empty!14957 () Bool)

(assert (=> b!825173 (= e!459218 tp_is_empty!14957)))

(declare-fun mapNonEmpty!24058 () Bool)

(declare-fun mapRes!24058 () Bool)

(declare-fun tp!46498 () Bool)

(assert (=> mapNonEmpty!24058 (= mapRes!24058 (and tp!46498 e!459218))))

(declare-fun mapKey!24058 () (_ BitVec 32))

(declare-fun mapRest!24058 () (Array (_ BitVec 32) ValueCell!7063))

(declare-fun mapValue!24058 () ValueCell!7063)

(assert (=> mapNonEmpty!24058 (= (arr!22098 _values!788) (store mapRest!24058 mapKey!24058 mapValue!24058))))

(declare-fun mapIsEmpty!24058 () Bool)

(assert (=> mapIsEmpty!24058 mapRes!24058))

(declare-fun b!825174 () Bool)

(declare-fun e!459225 () Bool)

(declare-fun e!459219 () Bool)

(assert (=> b!825174 (= e!459225 (and e!459219 mapRes!24058))))

(declare-fun condMapEmpty!24058 () Bool)

(declare-fun mapDefault!24058 () ValueCell!7063)

