; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37200 () Bool)

(assert start!37200)

(declare-fun b_free!8327 () Bool)

(declare-fun b_next!8327 () Bool)

(assert (=> start!37200 (= b_free!8327 (not b_next!8327))))

(declare-fun tp!29697 () Bool)

(declare-fun b_and!15569 () Bool)

(assert (=> start!37200 (= tp!29697 b_and!15569)))

(declare-fun res!212244 () Bool)

(declare-fun e!228926 () Bool)

(assert (=> start!37200 (=> (not res!212244) (not e!228926))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37200 (= res!212244 (validMask!0 mask!970))))

(assert (=> start!37200 e!228926))

(declare-datatypes ((V!13071 0))(
  ( (V!13072 (val!4532 Int)) )
))
(declare-datatypes ((ValueCell!4144 0))(
  ( (ValueCellFull!4144 (v!6729 V!13071)) (EmptyCell!4144) )
))
(declare-datatypes ((array!21885 0))(
  ( (array!21886 (arr!10411 (Array (_ BitVec 32) ValueCell!4144)) (size!10763 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21885)

(declare-fun e!228922 () Bool)

(declare-fun array_inv!7674 (array!21885) Bool)

(assert (=> start!37200 (and (array_inv!7674 _values!506) e!228922)))

(assert (=> start!37200 tp!29697))

(assert (=> start!37200 true))

(declare-fun tp_is_empty!8975 () Bool)

(assert (=> start!37200 tp_is_empty!8975))

(declare-datatypes ((array!21887 0))(
  ( (array!21888 (arr!10412 (Array (_ BitVec 32) (_ BitVec 64))) (size!10764 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21887)

(declare-fun array_inv!7675 (array!21887) Bool)

(assert (=> start!37200 (array_inv!7675 _keys!658)))

(declare-fun b!375800 () Bool)

(declare-fun res!212234 () Bool)

(assert (=> b!375800 (=> (not res!212234) (not e!228926))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375800 (= res!212234 (and (= (size!10763 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10764 _keys!658) (size!10763 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15027 () Bool)

(declare-fun mapRes!15027 () Bool)

(assert (=> mapIsEmpty!15027 mapRes!15027))

(declare-fun b!375801 () Bool)

(declare-fun e!228923 () Bool)

(assert (=> b!375801 (= e!228926 e!228923)))

(declare-fun res!212240 () Bool)

(assert (=> b!375801 (=> (not res!212240) (not e!228923))))

(declare-fun lt!174084 () array!21887)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21887 (_ BitVec 32)) Bool)

(assert (=> b!375801 (= res!212240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174084 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375801 (= lt!174084 (array!21888 (store (arr!10412 _keys!658) i!548 k!778) (size!10764 _keys!658)))))

(declare-fun b!375802 () Bool)

(declare-fun e!228920 () Bool)

(assert (=> b!375802 (= e!228920 tp_is_empty!8975)))

(declare-fun b!375803 () Bool)

(declare-fun res!212237 () Bool)

(assert (=> b!375803 (=> (not res!212237) (not e!228926))))

(assert (=> b!375803 (= res!212237 (or (= (select (arr!10412 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10412 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375804 () Bool)

(declare-fun e!228925 () Bool)

(assert (=> b!375804 (= e!228925 tp_is_empty!8975)))

(declare-fun b!375805 () Bool)

(assert (=> b!375805 (= e!228922 (and e!228925 mapRes!15027))))

(declare-fun condMapEmpty!15027 () Bool)

(declare-fun mapDefault!15027 () ValueCell!4144)

