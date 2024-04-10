; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41714 () Bool)

(assert start!41714)

(declare-fun b_free!11353 () Bool)

(declare-fun b_next!11353 () Bool)

(assert (=> start!41714 (= b_free!11353 (not b_next!11353))))

(declare-fun tp!40063 () Bool)

(declare-fun b_and!19709 () Bool)

(assert (=> start!41714 (= tp!40063 b_and!19709)))

(declare-fun b!465770 () Bool)

(declare-fun res!278418 () Bool)

(declare-fun e!272255 () Bool)

(assert (=> b!465770 (=> (not res!278418) (not e!272255))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29343 0))(
  ( (array!29344 (arr!14101 (Array (_ BitVec 32) (_ BitVec 64))) (size!14453 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29343)

(declare-datatypes ((V!18147 0))(
  ( (V!18148 (val!6435 Int)) )
))
(declare-datatypes ((ValueCell!6047 0))(
  ( (ValueCellFull!6047 (v!8722 V!18147)) (EmptyCell!6047) )
))
(declare-datatypes ((array!29345 0))(
  ( (array!29346 (arr!14102 (Array (_ BitVec 32) ValueCell!6047)) (size!14454 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29345)

(assert (=> b!465770 (= res!278418 (and (= (size!14454 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14453 _keys!1025) (size!14454 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20854 () Bool)

(declare-fun mapRes!20854 () Bool)

(declare-fun tp!40062 () Bool)

(declare-fun e!272252 () Bool)

(assert (=> mapNonEmpty!20854 (= mapRes!20854 (and tp!40062 e!272252))))

(declare-fun mapRest!20854 () (Array (_ BitVec 32) ValueCell!6047))

(declare-fun mapValue!20854 () ValueCell!6047)

(declare-fun mapKey!20854 () (_ BitVec 32))

(assert (=> mapNonEmpty!20854 (= (arr!14102 _values!833) (store mapRest!20854 mapKey!20854 mapValue!20854))))

(declare-fun b!465771 () Bool)

(declare-fun e!272253 () Bool)

(declare-fun tp_is_empty!12781 () Bool)

(assert (=> b!465771 (= e!272253 tp_is_empty!12781)))

(declare-fun mapIsEmpty!20854 () Bool)

(assert (=> mapIsEmpty!20854 mapRes!20854))

(declare-fun b!465772 () Bool)

(assert (=> b!465772 (= e!272252 tp_is_empty!12781)))

(declare-fun b!465773 () Bool)

(declare-fun res!278421 () Bool)

(assert (=> b!465773 (=> (not res!278421) (not e!272255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29343 (_ BitVec 32)) Bool)

(assert (=> b!465773 (= res!278421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465774 () Bool)

(declare-fun e!272250 () Bool)

(assert (=> b!465774 (= e!272250 (and e!272253 mapRes!20854))))

(declare-fun condMapEmpty!20854 () Bool)

(declare-fun mapDefault!20854 () ValueCell!6047)

