; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37460 () Bool)

(assert start!37460)

(declare-fun b_free!8587 () Bool)

(declare-fun b_next!8587 () Bool)

(assert (=> start!37460 (= b_free!8587 (not b_next!8587))))

(declare-fun tp!30476 () Bool)

(declare-fun b_and!15829 () Bool)

(assert (=> start!37460 (= tp!30476 b_and!15829)))

(declare-fun b!381604 () Bool)

(declare-fun res!216869 () Bool)

(declare-fun e!231986 () Bool)

(assert (=> b!381604 (=> (not res!216869) (not e!231986))))

(declare-datatypes ((array!22383 0))(
  ( (array!22384 (arr!10660 (Array (_ BitVec 32) (_ BitVec 64))) (size!11012 (_ BitVec 32))) )
))
(declare-fun lt!178890 () array!22383)

(declare-datatypes ((List!6093 0))(
  ( (Nil!6090) (Cons!6089 (h!6945 (_ BitVec 64)) (t!11243 List!6093)) )
))
(declare-fun arrayNoDuplicates!0 (array!22383 (_ BitVec 32) List!6093) Bool)

(assert (=> b!381604 (= res!216869 (arrayNoDuplicates!0 lt!178890 #b00000000000000000000000000000000 Nil!6090))))

(declare-fun mapIsEmpty!15417 () Bool)

(declare-fun mapRes!15417 () Bool)

(assert (=> mapIsEmpty!15417 mapRes!15417))

(declare-fun b!381605 () Bool)

(declare-fun res!216875 () Bool)

(declare-fun e!231989 () Bool)

(assert (=> b!381605 (=> (not res!216875) (not e!231989))))

(declare-fun _keys!658 () array!22383)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381605 (= res!216875 (or (= (select (arr!10660 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10660 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381607 () Bool)

(declare-fun res!216870 () Bool)

(assert (=> b!381607 (=> (not res!216870) (not e!231989))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13419 0))(
  ( (V!13420 (val!4662 Int)) )
))
(declare-datatypes ((ValueCell!4274 0))(
  ( (ValueCellFull!4274 (v!6859 V!13419)) (EmptyCell!4274) )
))
(declare-datatypes ((array!22385 0))(
  ( (array!22386 (arr!10661 (Array (_ BitVec 32) ValueCell!4274)) (size!11013 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22385)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!381607 (= res!216870 (and (= (size!11013 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11012 _keys!658) (size!11013 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381608 () Bool)

(declare-fun res!216872 () Bool)

(assert (=> b!381608 (=> (not res!216872) (not e!231989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22383 (_ BitVec 32)) Bool)

(assert (=> b!381608 (= res!216872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381609 () Bool)

(declare-fun e!231983 () Bool)

(assert (=> b!381609 (= e!231983 true)))

(declare-datatypes ((tuple2!6262 0))(
  ( (tuple2!6263 (_1!3142 (_ BitVec 64)) (_2!3142 V!13419)) )
))
(declare-datatypes ((List!6094 0))(
  ( (Nil!6091) (Cons!6090 (h!6946 tuple2!6262) (t!11244 List!6094)) )
))
(declare-datatypes ((ListLongMap!5175 0))(
  ( (ListLongMap!5176 (toList!2603 List!6094)) )
))
(declare-fun lt!178892 () ListLongMap!5175)

(declare-fun lt!178885 () ListLongMap!5175)

(assert (=> b!381609 (= lt!178892 lt!178885)))

(declare-fun b!381610 () Bool)

(declare-fun e!231985 () Bool)

(declare-fun e!231987 () Bool)

(assert (=> b!381610 (= e!231985 (and e!231987 mapRes!15417))))

(declare-fun condMapEmpty!15417 () Bool)

(declare-fun mapDefault!15417 () ValueCell!4274)

