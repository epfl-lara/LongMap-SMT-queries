; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70768 () Bool)

(assert start!70768)

(declare-fun b_free!13025 () Bool)

(declare-fun b_next!13025 () Bool)

(assert (=> start!70768 (= b_free!13025 (not b_next!13025))))

(declare-fun tp!45820 () Bool)

(declare-fun b_and!21897 () Bool)

(assert (=> start!70768 (= tp!45820 b_and!21897)))

(declare-datatypes ((V!24647 0))(
  ( (V!24648 (val!7415 Int)) )
))
(declare-datatypes ((tuple2!9788 0))(
  ( (tuple2!9789 (_1!4905 (_ BitVec 64)) (_2!4905 V!24647)) )
))
(declare-datatypes ((List!15603 0))(
  ( (Nil!15600) (Cons!15599 (h!16728 tuple2!9788) (t!21940 List!15603)) )
))
(declare-datatypes ((ListLongMap!8611 0))(
  ( (ListLongMap!8612 (toList!4321 List!15603)) )
))
(declare-fun lt!369533 () ListLongMap!8611)

(declare-fun lt!369537 () tuple2!9788)

(declare-fun b!821973 () Bool)

(declare-fun zeroValueAfter!34 () V!24647)

(declare-fun lt!369532 () ListLongMap!8611)

(declare-fun e!456909 () Bool)

(declare-fun +!1873 (ListLongMap!8611 tuple2!9788) ListLongMap!8611)

(assert (=> b!821973 (= e!456909 (= lt!369533 (+!1873 (+!1873 lt!369532 (tuple2!9789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!369537)))))

(declare-fun b!821974 () Bool)

(declare-fun res!560662 () Bool)

(declare-fun e!456914 () Bool)

(assert (=> b!821974 (=> (not res!560662) (not e!456914))))

(declare-datatypes ((array!45666 0))(
  ( (array!45667 (arr!21883 (Array (_ BitVec 32) (_ BitVec 64))) (size!22304 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45666)

(declare-datatypes ((List!15604 0))(
  ( (Nil!15601) (Cons!15600 (h!16729 (_ BitVec 64)) (t!21941 List!15604)) )
))
(declare-fun arrayNoDuplicates!0 (array!45666 (_ BitVec 32) List!15604) Bool)

(assert (=> b!821974 (= res!560662 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15601))))

(declare-fun b!821975 () Bool)

(declare-fun e!456912 () Bool)

(declare-fun e!456913 () Bool)

(declare-fun mapRes!23713 () Bool)

(assert (=> b!821975 (= e!456912 (and e!456913 mapRes!23713))))

(declare-fun condMapEmpty!23713 () Bool)

(declare-datatypes ((ValueCell!6952 0))(
  ( (ValueCellFull!6952 (v!9846 V!24647)) (EmptyCell!6952) )
))
(declare-datatypes ((array!45668 0))(
  ( (array!45669 (arr!21884 (Array (_ BitVec 32) ValueCell!6952)) (size!22305 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45668)

(declare-fun mapDefault!23713 () ValueCell!6952)

