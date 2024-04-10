; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41656 () Bool)

(assert start!41656)

(declare-fun b_free!11309 () Bool)

(declare-fun b_next!11309 () Bool)

(assert (=> start!41656 (= b_free!11309 (not b_next!11309))))

(declare-fun tp!39928 () Bool)

(declare-fun b_and!19657 () Bool)

(assert (=> start!41656 (= tp!39928 b_and!19657)))

(declare-fun b!465176 () Bool)

(declare-fun e!271822 () Bool)

(declare-fun tp_is_empty!12737 () Bool)

(assert (=> b!465176 (= e!271822 tp_is_empty!12737)))

(declare-fun res!278076 () Bool)

(declare-fun e!271818 () Bool)

(assert (=> start!41656 (=> (not res!278076) (not e!271818))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41656 (= res!278076 (validMask!0 mask!1365))))

(assert (=> start!41656 e!271818))

(assert (=> start!41656 tp_is_empty!12737))

(assert (=> start!41656 tp!39928))

(assert (=> start!41656 true))

(declare-datatypes ((array!29259 0))(
  ( (array!29260 (arr!14060 (Array (_ BitVec 32) (_ BitVec 64))) (size!14412 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29259)

(declare-fun array_inv!10160 (array!29259) Bool)

(assert (=> start!41656 (array_inv!10160 _keys!1025)))

(declare-datatypes ((V!18087 0))(
  ( (V!18088 (val!6413 Int)) )
))
(declare-datatypes ((ValueCell!6025 0))(
  ( (ValueCellFull!6025 (v!8700 V!18087)) (EmptyCell!6025) )
))
(declare-datatypes ((array!29261 0))(
  ( (array!29262 (arr!14061 (Array (_ BitVec 32) ValueCell!6025)) (size!14413 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29261)

(declare-fun e!271819 () Bool)

(declare-fun array_inv!10161 (array!29261) Bool)

(assert (=> start!41656 (and (array_inv!10161 _values!833) e!271819)))

(declare-fun mapNonEmpty!20785 () Bool)

(declare-fun mapRes!20785 () Bool)

(declare-fun tp!39927 () Bool)

(declare-fun e!271820 () Bool)

(assert (=> mapNonEmpty!20785 (= mapRes!20785 (and tp!39927 e!271820))))

(declare-fun mapRest!20785 () (Array (_ BitVec 32) ValueCell!6025))

(declare-fun mapKey!20785 () (_ BitVec 32))

(declare-fun mapValue!20785 () ValueCell!6025)

(assert (=> mapNonEmpty!20785 (= (arr!14061 _values!833) (store mapRest!20785 mapKey!20785 mapValue!20785))))

(declare-fun mapIsEmpty!20785 () Bool)

(assert (=> mapIsEmpty!20785 mapRes!20785))

(declare-fun b!465177 () Bool)

(declare-fun res!278077 () Bool)

(assert (=> b!465177 (=> (not res!278077) (not e!271818))))

(declare-datatypes ((List!8497 0))(
  ( (Nil!8494) (Cons!8493 (h!9349 (_ BitVec 64)) (t!14445 List!8497)) )
))
(declare-fun arrayNoDuplicates!0 (array!29259 (_ BitVec 32) List!8497) Bool)

(assert (=> b!465177 (= res!278077 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8494))))

(declare-fun b!465178 () Bool)

(assert (=> b!465178 (= e!271819 (and e!271822 mapRes!20785))))

(declare-fun condMapEmpty!20785 () Bool)

(declare-fun mapDefault!20785 () ValueCell!6025)

