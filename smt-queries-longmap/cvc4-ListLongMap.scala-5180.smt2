; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70070 () Bool)

(assert start!70070)

(declare-fun b_free!12491 () Bool)

(declare-fun b_next!12491 () Bool)

(assert (=> start!70070 (= b_free!12491 (not b_next!12491))))

(declare-fun tp!44188 () Bool)

(declare-fun b_and!21263 () Bool)

(assert (=> start!70070 (= tp!44188 b_and!21263)))

(declare-fun mapNonEmpty!22882 () Bool)

(declare-fun mapRes!22882 () Bool)

(declare-fun tp!44187 () Bool)

(declare-fun e!451368 () Bool)

(assert (=> mapNonEmpty!22882 (= mapRes!22882 (and tp!44187 e!451368))))

(declare-datatypes ((V!23935 0))(
  ( (V!23936 (val!7148 Int)) )
))
(declare-datatypes ((ValueCell!6685 0))(
  ( (ValueCellFull!6685 (v!9575 V!23935)) (EmptyCell!6685) )
))
(declare-fun mapValue!22882 () ValueCell!6685)

(declare-fun mapKey!22882 () (_ BitVec 32))

(declare-datatypes ((array!44606 0))(
  ( (array!44607 (arr!21363 (Array (_ BitVec 32) ValueCell!6685)) (size!21784 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44606)

(declare-fun mapRest!22882 () (Array (_ BitVec 32) ValueCell!6685))

(assert (=> mapNonEmpty!22882 (= (arr!21363 _values!788) (store mapRest!22882 mapKey!22882 mapValue!22882))))

(declare-fun b!814310 () Bool)

(declare-fun res!556206 () Bool)

(declare-fun e!451366 () Bool)

(assert (=> b!814310 (=> (not res!556206) (not e!451366))))

(declare-datatypes ((array!44608 0))(
  ( (array!44609 (arr!21364 (Array (_ BitVec 32) (_ BitVec 64))) (size!21785 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44608)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!814310 (= res!556206 (and (= (size!21784 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21785 _keys!976) (size!21784 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814311 () Bool)

(declare-fun res!556205 () Bool)

(assert (=> b!814311 (=> (not res!556205) (not e!451366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44608 (_ BitVec 32)) Bool)

(assert (=> b!814311 (= res!556205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814312 () Bool)

(declare-fun e!451364 () Bool)

(declare-fun e!451365 () Bool)

(assert (=> b!814312 (= e!451364 (and e!451365 mapRes!22882))))

(declare-fun condMapEmpty!22882 () Bool)

(declare-fun mapDefault!22882 () ValueCell!6685)

