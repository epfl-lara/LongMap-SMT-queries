; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41684 () Bool)

(assert start!41684)

(declare-fun b_free!11323 () Bool)

(declare-fun b_next!11323 () Bool)

(assert (=> start!41684 (= b_free!11323 (not b_next!11323))))

(declare-fun tp!39973 () Bool)

(declare-fun b_and!19679 () Bool)

(assert (=> start!41684 (= tp!39973 b_and!19679)))

(declare-fun mapIsEmpty!20809 () Bool)

(declare-fun mapRes!20809 () Bool)

(assert (=> mapIsEmpty!20809 mapRes!20809))

(declare-fun b!465411 () Bool)

(declare-fun res!278196 () Bool)

(declare-fun e!271984 () Bool)

(assert (=> b!465411 (=> (not res!278196) (not e!271984))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29287 0))(
  ( (array!29288 (arr!14073 (Array (_ BitVec 32) (_ BitVec 64))) (size!14425 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29287)

(declare-datatypes ((V!18107 0))(
  ( (V!18108 (val!6420 Int)) )
))
(declare-datatypes ((ValueCell!6032 0))(
  ( (ValueCellFull!6032 (v!8707 V!18107)) (EmptyCell!6032) )
))
(declare-datatypes ((array!29289 0))(
  ( (array!29290 (arr!14074 (Array (_ BitVec 32) ValueCell!6032)) (size!14426 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29289)

(assert (=> b!465411 (= res!278196 (and (= (size!14426 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14425 _keys!1025) (size!14426 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465412 () Bool)

(declare-fun e!271982 () Bool)

(declare-fun tp_is_empty!12751 () Bool)

(assert (=> b!465412 (= e!271982 tp_is_empty!12751)))

(declare-fun b!465413 () Bool)

(declare-fun e!271980 () Bool)

(declare-fun e!271983 () Bool)

(assert (=> b!465413 (= e!271980 (and e!271983 mapRes!20809))))

(declare-fun condMapEmpty!20809 () Bool)

(declare-fun mapDefault!20809 () ValueCell!6032)

