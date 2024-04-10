; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37010 () Bool)

(assert start!37010)

(declare-fun b_free!8137 () Bool)

(declare-fun b_next!8137 () Bool)

(assert (=> start!37010 (= b_free!8137 (not b_next!8137))))

(declare-fun tp!29126 () Bool)

(declare-fun b_and!15379 () Bool)

(assert (=> start!37010 (= tp!29126 b_and!15379)))

(declare-fun mapIsEmpty!14742 () Bool)

(declare-fun mapRes!14742 () Bool)

(assert (=> mapIsEmpty!14742 mapRes!14742))

(declare-fun b!371711 () Bool)

(declare-fun res!209009 () Bool)

(declare-fun e!226844 () Bool)

(assert (=> b!371711 (=> (not res!209009) (not e!226844))))

(declare-datatypes ((array!21511 0))(
  ( (array!21512 (arr!10224 (Array (_ BitVec 32) (_ BitVec 64))) (size!10576 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21511)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371711 (= res!209009 (or (= (select (arr!10224 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10224 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371712 () Bool)

(declare-fun e!226847 () Bool)

(declare-fun tp_is_empty!8785 () Bool)

(assert (=> b!371712 (= e!226847 tp_is_empty!8785)))

(declare-fun b!371713 () Bool)

(declare-fun res!209008 () Bool)

(assert (=> b!371713 (=> (not res!209008) (not e!226844))))

(assert (=> b!371713 (= res!209008 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10576 _keys!658))))))

(declare-fun mapNonEmpty!14742 () Bool)

(declare-fun tp!29127 () Bool)

(assert (=> mapNonEmpty!14742 (= mapRes!14742 (and tp!29127 e!226847))))

(declare-datatypes ((V!12819 0))(
  ( (V!12820 (val!4437 Int)) )
))
(declare-datatypes ((ValueCell!4049 0))(
  ( (ValueCellFull!4049 (v!6634 V!12819)) (EmptyCell!4049) )
))
(declare-datatypes ((array!21513 0))(
  ( (array!21514 (arr!10225 (Array (_ BitVec 32) ValueCell!4049)) (size!10577 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21513)

(declare-fun mapRest!14742 () (Array (_ BitVec 32) ValueCell!4049))

(declare-fun mapValue!14742 () ValueCell!4049)

(declare-fun mapKey!14742 () (_ BitVec 32))

(assert (=> mapNonEmpty!14742 (= (arr!10225 _values!506) (store mapRest!14742 mapKey!14742 mapValue!14742))))

(declare-fun b!371714 () Bool)

(declare-fun res!209006 () Bool)

(assert (=> b!371714 (=> (not res!209006) (not e!226844))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371714 (= res!209006 (validKeyInArray!0 k!778))))

(declare-fun b!371715 () Bool)

(declare-fun e!226843 () Bool)

(assert (=> b!371715 (= e!226844 e!226843)))

(declare-fun res!209002 () Bool)

(assert (=> b!371715 (=> (not res!209002) (not e!226843))))

(declare-fun lt!170390 () array!21511)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21511 (_ BitVec 32)) Bool)

(assert (=> b!371715 (= res!209002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170390 mask!970))))

(assert (=> b!371715 (= lt!170390 (array!21512 (store (arr!10224 _keys!658) i!548 k!778) (size!10576 _keys!658)))))

(declare-fun b!371717 () Bool)

(declare-fun res!209003 () Bool)

(assert (=> b!371717 (=> (not res!209003) (not e!226844))))

(declare-datatypes ((List!5728 0))(
  ( (Nil!5725) (Cons!5724 (h!6580 (_ BitVec 64)) (t!10878 List!5728)) )
))
(declare-fun arrayNoDuplicates!0 (array!21511 (_ BitVec 32) List!5728) Bool)

(assert (=> b!371717 (= res!209003 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5725))))

(declare-fun b!371718 () Bool)

(declare-fun e!226845 () Bool)

(declare-fun e!226842 () Bool)

(assert (=> b!371718 (= e!226845 (and e!226842 mapRes!14742))))

(declare-fun condMapEmpty!14742 () Bool)

(declare-fun mapDefault!14742 () ValueCell!4049)

