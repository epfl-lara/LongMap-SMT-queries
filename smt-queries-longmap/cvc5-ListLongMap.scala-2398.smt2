; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37940 () Bool)

(assert start!37940)

(declare-fun b_free!8953 () Bool)

(declare-fun b_next!8953 () Bool)

(assert (=> start!37940 (= b_free!8953 (not b_next!8953))))

(declare-fun tp!31623 () Bool)

(declare-fun b_and!16243 () Bool)

(assert (=> start!37940 (= tp!31623 b_and!16243)))

(declare-fun b!390250 () Bool)

(declare-fun e!236398 () Bool)

(declare-fun e!236397 () Bool)

(assert (=> b!390250 (= e!236398 e!236397)))

(declare-fun res!223314 () Bool)

(assert (=> b!390250 (=> (not res!223314) (not e!236397))))

(declare-datatypes ((array!23147 0))(
  ( (array!23148 (arr!11038 (Array (_ BitVec 32) (_ BitVec 64))) (size!11390 (_ BitVec 32))) )
))
(declare-fun lt!183895 () array!23147)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23147 (_ BitVec 32)) Bool)

(assert (=> b!390250 (= res!223314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183895 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23147)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390250 (= lt!183895 (array!23148 (store (arr!11038 _keys!658) i!548 k!778) (size!11390 _keys!658)))))

(declare-fun b!390251 () Bool)

(declare-fun res!223311 () Bool)

(assert (=> b!390251 (=> (not res!223311) (not e!236397))))

(declare-datatypes ((List!6390 0))(
  ( (Nil!6387) (Cons!6386 (h!7242 (_ BitVec 64)) (t!11548 List!6390)) )
))
(declare-fun arrayNoDuplicates!0 (array!23147 (_ BitVec 32) List!6390) Bool)

(assert (=> b!390251 (= res!223311 (arrayNoDuplicates!0 lt!183895 #b00000000000000000000000000000000 Nil!6387))))

(declare-fun mapNonEmpty!16014 () Bool)

(declare-fun mapRes!16014 () Bool)

(declare-fun tp!31622 () Bool)

(declare-fun e!236402 () Bool)

(assert (=> mapNonEmpty!16014 (= mapRes!16014 (and tp!31622 e!236402))))

(declare-datatypes ((V!13939 0))(
  ( (V!13940 (val!4857 Int)) )
))
(declare-datatypes ((ValueCell!4469 0))(
  ( (ValueCellFull!4469 (v!7070 V!13939)) (EmptyCell!4469) )
))
(declare-datatypes ((array!23149 0))(
  ( (array!23150 (arr!11039 (Array (_ BitVec 32) ValueCell!4469)) (size!11391 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23149)

(declare-fun mapRest!16014 () (Array (_ BitVec 32) ValueCell!4469))

(declare-fun mapKey!16014 () (_ BitVec 32))

(declare-fun mapValue!16014 () ValueCell!4469)

(assert (=> mapNonEmpty!16014 (= (arr!11039 _values!506) (store mapRest!16014 mapKey!16014 mapValue!16014))))

(declare-fun b!390252 () Bool)

(declare-fun res!223315 () Bool)

(assert (=> b!390252 (=> (not res!223315) (not e!236398))))

(assert (=> b!390252 (= res!223315 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11390 _keys!658))))))

(declare-fun b!390253 () Bool)

(declare-fun res!223316 () Bool)

(assert (=> b!390253 (=> (not res!223316) (not e!236398))))

(assert (=> b!390253 (= res!223316 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6387))))

(declare-fun b!390254 () Bool)

(declare-fun e!236400 () Bool)

(declare-fun tp_is_empty!9625 () Bool)

(assert (=> b!390254 (= e!236400 tp_is_empty!9625)))

(declare-fun b!390255 () Bool)

(declare-fun e!236403 () Bool)

(assert (=> b!390255 (= e!236403 (and e!236400 mapRes!16014))))

(declare-fun condMapEmpty!16014 () Bool)

(declare-fun mapDefault!16014 () ValueCell!4469)

