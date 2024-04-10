; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41596 () Bool)

(assert start!41596)

(declare-fun b_free!11263 () Bool)

(declare-fun b_next!11263 () Bool)

(assert (=> start!41596 (= b_free!11263 (not b_next!11263))))

(declare-fun tp!39787 () Bool)

(declare-fun b_and!19603 () Bool)

(assert (=> start!41596 (= tp!39787 b_and!19603)))

(declare-fun b!464608 () Bool)

(declare-fun res!277769 () Bool)

(declare-fun e!271421 () Bool)

(assert (=> b!464608 (=> (not res!277769) (not e!271421))))

(declare-datatypes ((array!29167 0))(
  ( (array!29168 (arr!14015 (Array (_ BitVec 32) (_ BitVec 64))) (size!14367 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29167)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29167 (_ BitVec 32)) Bool)

(assert (=> b!464608 (= res!277769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20713 () Bool)

(declare-fun mapRes!20713 () Bool)

(declare-fun tp!39786 () Bool)

(declare-fun e!271419 () Bool)

(assert (=> mapNonEmpty!20713 (= mapRes!20713 (and tp!39786 e!271419))))

(declare-datatypes ((V!18027 0))(
  ( (V!18028 (val!6390 Int)) )
))
(declare-datatypes ((ValueCell!6002 0))(
  ( (ValueCellFull!6002 (v!8677 V!18027)) (EmptyCell!6002) )
))
(declare-datatypes ((array!29169 0))(
  ( (array!29170 (arr!14016 (Array (_ BitVec 32) ValueCell!6002)) (size!14368 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29169)

(declare-fun mapRest!20713 () (Array (_ BitVec 32) ValueCell!6002))

(declare-fun mapKey!20713 () (_ BitVec 32))

(declare-fun mapValue!20713 () ValueCell!6002)

(assert (=> mapNonEmpty!20713 (= (arr!14016 _values!833) (store mapRest!20713 mapKey!20713 mapValue!20713))))

(declare-fun b!464609 () Bool)

(declare-fun e!271420 () Bool)

(declare-fun tp_is_empty!12691 () Bool)

(assert (=> b!464609 (= e!271420 tp_is_empty!12691)))

(declare-fun b!464610 () Bool)

(declare-fun e!271418 () Bool)

(assert (=> b!464610 (= e!271418 (and e!271420 mapRes!20713))))

(declare-fun condMapEmpty!20713 () Bool)

(declare-fun mapDefault!20713 () ValueCell!6002)

