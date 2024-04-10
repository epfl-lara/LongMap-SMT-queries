; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37674 () Bool)

(assert start!37674)

(declare-fun b_free!8777 () Bool)

(declare-fun b_next!8777 () Bool)

(assert (=> start!37674 (= b_free!8777 (not b_next!8777))))

(declare-fun tp!31082 () Bool)

(declare-fun b_and!16019 () Bool)

(assert (=> start!37674 (= tp!31082 b_and!16019)))

(declare-fun b!385856 () Bool)

(declare-fun res!220159 () Bool)

(declare-fun e!234163 () Bool)

(assert (=> b!385856 (=> (not res!220159) (not e!234163))))

(declare-datatypes ((array!22797 0))(
  ( (array!22798 (arr!10867 (Array (_ BitVec 32) (_ BitVec 64))) (size!11219 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22797)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385856 (= res!220159 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!385857 () Bool)

(declare-fun res!220166 () Bool)

(assert (=> b!385857 (=> (not res!220166) (not e!234163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385857 (= res!220166 (validKeyInArray!0 k!778))))

(declare-fun b!385858 () Bool)

(declare-fun res!220161 () Bool)

(assert (=> b!385858 (=> (not res!220161) (not e!234163))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22797 (_ BitVec 32)) Bool)

(assert (=> b!385858 (= res!220161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385859 () Bool)

(declare-fun e!234162 () Bool)

(declare-fun tp_is_empty!9449 () Bool)

(assert (=> b!385859 (= e!234162 tp_is_empty!9449)))

(declare-fun b!385860 () Bool)

(declare-fun e!234164 () Bool)

(declare-fun mapRes!15738 () Bool)

(assert (=> b!385860 (= e!234164 (and e!234162 mapRes!15738))))

(declare-fun condMapEmpty!15738 () Bool)

(declare-datatypes ((V!13703 0))(
  ( (V!13704 (val!4769 Int)) )
))
(declare-datatypes ((ValueCell!4381 0))(
  ( (ValueCellFull!4381 (v!6966 V!13703)) (EmptyCell!4381) )
))
(declare-datatypes ((array!22799 0))(
  ( (array!22800 (arr!10868 (Array (_ BitVec 32) ValueCell!4381)) (size!11220 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22799)

(declare-fun mapDefault!15738 () ValueCell!4381)

