; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69900 () Bool)

(assert start!69900)

(declare-fun res!555291 () Bool)

(declare-fun e!450183 () Bool)

(assert (=> start!69900 (=> (not res!555291) (not e!450183))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69900 (= res!555291 (validMask!0 mask!1312))))

(assert (=> start!69900 e!450183))

(declare-datatypes ((array!44324 0))(
  ( (array!44325 (arr!21224 (Array (_ BitVec 32) (_ BitVec 64))) (size!21645 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44324)

(declare-fun array_inv!17003 (array!44324) Bool)

(assert (=> start!69900 (array_inv!17003 _keys!976)))

(assert (=> start!69900 true))

(declare-datatypes ((V!23739 0))(
  ( (V!23740 (val!7074 Int)) )
))
(declare-datatypes ((ValueCell!6611 0))(
  ( (ValueCellFull!6611 (v!9501 V!23739)) (EmptyCell!6611) )
))
(declare-datatypes ((array!44326 0))(
  ( (array!44327 (arr!21225 (Array (_ BitVec 32) ValueCell!6611)) (size!21646 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44326)

(declare-fun e!450179 () Bool)

(declare-fun array_inv!17004 (array!44326) Bool)

(assert (=> start!69900 (and (array_inv!17004 _values!788) e!450179)))

(declare-fun mapNonEmpty!22654 () Bool)

(declare-fun mapRes!22654 () Bool)

(declare-fun tp!43762 () Bool)

(declare-fun e!450180 () Bool)

(assert (=> mapNonEmpty!22654 (= mapRes!22654 (and tp!43762 e!450180))))

(declare-fun mapValue!22654 () ValueCell!6611)

(declare-fun mapRest!22654 () (Array (_ BitVec 32) ValueCell!6611))

(declare-fun mapKey!22654 () (_ BitVec 32))

(assert (=> mapNonEmpty!22654 (= (arr!21225 _values!788) (store mapRest!22654 mapKey!22654 mapValue!22654))))

(declare-fun b!812664 () Bool)

(declare-fun res!555289 () Bool)

(assert (=> b!812664 (=> (not res!555289) (not e!450183))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812664 (= res!555289 (and (= (size!21646 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21645 _keys!976) (size!21646 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812665 () Bool)

(declare-fun tp_is_empty!14053 () Bool)

(assert (=> b!812665 (= e!450180 tp_is_empty!14053)))

(declare-fun b!812666 () Bool)

(assert (=> b!812666 (= e!450183 false)))

(declare-fun lt!364176 () Bool)

(declare-datatypes ((List!15103 0))(
  ( (Nil!15100) (Cons!15099 (h!16228 (_ BitVec 64)) (t!21418 List!15103)) )
))
(declare-fun arrayNoDuplicates!0 (array!44324 (_ BitVec 32) List!15103) Bool)

(assert (=> b!812666 (= lt!364176 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15100))))

(declare-fun b!812667 () Bool)

(declare-fun e!450182 () Bool)

(assert (=> b!812667 (= e!450179 (and e!450182 mapRes!22654))))

(declare-fun condMapEmpty!22654 () Bool)

(declare-fun mapDefault!22654 () ValueCell!6611)

