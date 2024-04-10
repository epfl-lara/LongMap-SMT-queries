; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37256 () Bool)

(assert start!37256)

(declare-fun b_free!8383 () Bool)

(declare-fun b_next!8383 () Bool)

(assert (=> start!37256 (= b_free!8383 (not b_next!8383))))

(declare-fun tp!29865 () Bool)

(declare-fun b_and!15625 () Bool)

(assert (=> start!37256 (= tp!29865 b_and!15625)))

(declare-fun b!377061 () Bool)

(declare-fun e!229596 () Bool)

(declare-fun e!229592 () Bool)

(assert (=> b!377061 (= e!229596 e!229592)))

(declare-fun res!213251 () Bool)

(assert (=> b!377061 (=> (not res!213251) (not e!229592))))

(declare-datatypes ((array!21991 0))(
  ( (array!21992 (arr!10464 (Array (_ BitVec 32) (_ BitVec 64))) (size!10816 (_ BitVec 32))) )
))
(declare-fun lt!175169 () array!21991)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21991 (_ BitVec 32)) Bool)

(assert (=> b!377061 (= res!213251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175169 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21991)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377061 (= lt!175169 (array!21992 (store (arr!10464 _keys!658) i!548 k!778) (size!10816 _keys!658)))))

(declare-fun mapIsEmpty!15111 () Bool)

(declare-fun mapRes!15111 () Bool)

(assert (=> mapIsEmpty!15111 mapRes!15111))

(declare-fun mapNonEmpty!15111 () Bool)

(declare-fun tp!29864 () Bool)

(declare-fun e!229598 () Bool)

(assert (=> mapNonEmpty!15111 (= mapRes!15111 (and tp!29864 e!229598))))

(declare-datatypes ((V!13147 0))(
  ( (V!13148 (val!4560 Int)) )
))
(declare-datatypes ((ValueCell!4172 0))(
  ( (ValueCellFull!4172 (v!6757 V!13147)) (EmptyCell!4172) )
))
(declare-datatypes ((array!21993 0))(
  ( (array!21994 (arr!10465 (Array (_ BitVec 32) ValueCell!4172)) (size!10817 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21993)

(declare-fun mapRest!15111 () (Array (_ BitVec 32) ValueCell!4172))

(declare-fun mapValue!15111 () ValueCell!4172)

(declare-fun mapKey!15111 () (_ BitVec 32))

(assert (=> mapNonEmpty!15111 (= (arr!10465 _values!506) (store mapRest!15111 mapKey!15111 mapValue!15111))))

(declare-fun b!377063 () Bool)

(declare-fun res!213253 () Bool)

(assert (=> b!377063 (=> (not res!213253) (not e!229596))))

(declare-datatypes ((List!5917 0))(
  ( (Nil!5914) (Cons!5913 (h!6769 (_ BitVec 64)) (t!11067 List!5917)) )
))
(declare-fun arrayNoDuplicates!0 (array!21991 (_ BitVec 32) List!5917) Bool)

(assert (=> b!377063 (= res!213253 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5914))))

(declare-fun b!377064 () Bool)

(declare-fun res!213245 () Bool)

(assert (=> b!377064 (=> (not res!213245) (not e!229596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377064 (= res!213245 (validKeyInArray!0 k!778))))

(declare-fun b!377065 () Bool)

(declare-fun res!213247 () Bool)

(assert (=> b!377065 (=> (not res!213247) (not e!229596))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377065 (= res!213247 (and (= (size!10817 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10816 _keys!658) (size!10817 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377066 () Bool)

(declare-fun e!229597 () Bool)

(declare-fun e!229594 () Bool)

(assert (=> b!377066 (= e!229597 (and e!229594 mapRes!15111))))

(declare-fun condMapEmpty!15111 () Bool)

(declare-fun mapDefault!15111 () ValueCell!4172)

