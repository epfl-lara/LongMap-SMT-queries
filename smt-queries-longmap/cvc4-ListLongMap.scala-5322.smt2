; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71176 () Bool)

(assert start!71176)

(declare-fun b_free!13343 () Bool)

(declare-fun b_next!13343 () Bool)

(assert (=> start!71176 (= b_free!13343 (not b_next!13343))))

(declare-fun tp!46788 () Bool)

(declare-fun b_and!22269 () Bool)

(assert (=> start!71176 (= tp!46788 b_and!22269)))

(declare-fun b!826814 () Bool)

(declare-fun res!563624 () Bool)

(declare-fun e!460500 () Bool)

(assert (=> b!826814 (=> (not res!563624) (not e!460500))))

(declare-datatypes ((array!46284 0))(
  ( (array!46285 (arr!22187 (Array (_ BitVec 32) (_ BitVec 64))) (size!22608 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46284)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25071 0))(
  ( (V!25072 (val!7574 Int)) )
))
(declare-datatypes ((ValueCell!7111 0))(
  ( (ValueCellFull!7111 (v!10008 V!25071)) (EmptyCell!7111) )
))
(declare-datatypes ((array!46286 0))(
  ( (array!46287 (arr!22188 (Array (_ BitVec 32) ValueCell!7111)) (size!22609 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46286)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!826814 (= res!563624 (and (= (size!22609 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22608 _keys!976) (size!22609 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24205 () Bool)

(declare-fun mapRes!24205 () Bool)

(assert (=> mapIsEmpty!24205 mapRes!24205))

(declare-fun b!826815 () Bool)

(declare-fun e!460506 () Bool)

(declare-fun tp_is_empty!15053 () Bool)

(assert (=> b!826815 (= e!460506 tp_is_empty!15053)))

(declare-fun mapNonEmpty!24205 () Bool)

(declare-fun tp!46789 () Bool)

(declare-fun e!460505 () Bool)

(assert (=> mapNonEmpty!24205 (= mapRes!24205 (and tp!46789 e!460505))))

(declare-fun mapKey!24205 () (_ BitVec 32))

(declare-fun mapRest!24205 () (Array (_ BitVec 32) ValueCell!7111))

(declare-fun mapValue!24205 () ValueCell!7111)

(assert (=> mapNonEmpty!24205 (= (arr!22188 _values!788) (store mapRest!24205 mapKey!24205 mapValue!24205))))

(declare-fun b!826816 () Bool)

(declare-fun res!563621 () Bool)

(assert (=> b!826816 (=> (not res!563621) (not e!460500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46284 (_ BitVec 32)) Bool)

(assert (=> b!826816 (= res!563621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun e!460503 () Bool)

(declare-datatypes ((tuple2!10038 0))(
  ( (tuple2!10039 (_1!5030 (_ BitVec 64)) (_2!5030 V!25071)) )
))
(declare-fun lt!374495 () tuple2!10038)

(declare-fun lt!374494 () tuple2!10038)

(declare-datatypes ((List!15836 0))(
  ( (Nil!15833) (Cons!15832 (h!16961 tuple2!10038) (t!22183 List!15836)) )
))
(declare-datatypes ((ListLongMap!8861 0))(
  ( (ListLongMap!8862 (toList!4446 List!15836)) )
))
(declare-fun lt!374492 () ListLongMap!8861)

(declare-fun b!826817 () Bool)

(declare-fun lt!374488 () ListLongMap!8861)

(declare-fun +!1953 (ListLongMap!8861 tuple2!10038) ListLongMap!8861)

(assert (=> b!826817 (= e!460503 (= lt!374488 (+!1953 (+!1953 lt!374492 lt!374494) lt!374495)))))

(declare-fun res!563619 () Bool)

(assert (=> start!71176 (=> (not res!563619) (not e!460500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71176 (= res!563619 (validMask!0 mask!1312))))

(assert (=> start!71176 e!460500))

(assert (=> start!71176 tp_is_empty!15053))

(declare-fun array_inv!17683 (array!46284) Bool)

(assert (=> start!71176 (array_inv!17683 _keys!976)))

(assert (=> start!71176 true))

(declare-fun e!460501 () Bool)

(declare-fun array_inv!17684 (array!46286) Bool)

(assert (=> start!71176 (and (array_inv!17684 _values!788) e!460501)))

(assert (=> start!71176 tp!46788))

(declare-fun b!826818 () Bool)

(declare-fun res!563622 () Bool)

(assert (=> b!826818 (=> (not res!563622) (not e!460500))))

(declare-datatypes ((List!15837 0))(
  ( (Nil!15834) (Cons!15833 (h!16962 (_ BitVec 64)) (t!22184 List!15837)) )
))
(declare-fun arrayNoDuplicates!0 (array!46284 (_ BitVec 32) List!15837) Bool)

(assert (=> b!826818 (= res!563622 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15834))))

(declare-fun b!826819 () Bool)

(declare-fun zeroValueAfter!34 () V!25071)

(declare-fun e!460507 () Bool)

(assert (=> b!826819 (= e!460507 (= lt!374488 (+!1953 (+!1953 lt!374492 (tuple2!10039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374494)))))

(declare-fun b!826820 () Bool)

(assert (=> b!826820 (= e!460501 (and e!460506 mapRes!24205))))

(declare-fun condMapEmpty!24205 () Bool)

(declare-fun mapDefault!24205 () ValueCell!7111)

