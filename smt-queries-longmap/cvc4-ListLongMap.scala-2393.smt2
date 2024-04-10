; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37868 () Bool)

(assert start!37868)

(declare-fun b_free!8927 () Bool)

(declare-fun b_next!8927 () Bool)

(assert (=> start!37868 (= b_free!8927 (not b_next!8927))))

(declare-fun tp!31538 () Bool)

(declare-fun b_and!16193 () Bool)

(assert (=> start!37868 (= tp!31538 b_and!16193)))

(declare-fun mapIsEmpty!15969 () Bool)

(declare-fun mapRes!15969 () Bool)

(assert (=> mapIsEmpty!15969 mapRes!15969))

(declare-fun b!389251 () Bool)

(declare-fun e!235831 () Bool)

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!389251 (= e!235831 (not (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235832 () Bool)

(assert (=> b!389251 e!235832))

(declare-fun res!222663 () Bool)

(assert (=> b!389251 (=> (not res!222663) (not e!235832))))

(declare-datatypes ((V!13903 0))(
  ( (V!13904 (val!4844 Int)) )
))
(declare-datatypes ((tuple2!6514 0))(
  ( (tuple2!6515 (_1!3268 (_ BitVec 64)) (_2!3268 V!13903)) )
))
(declare-fun lt!182939 () tuple2!6514)

(declare-datatypes ((List!6367 0))(
  ( (Nil!6364) (Cons!6363 (h!7219 tuple2!6514) (t!11521 List!6367)) )
))
(declare-datatypes ((ListLongMap!5427 0))(
  ( (ListLongMap!5428 (toList!2729 List!6367)) )
))
(declare-fun lt!182941 () ListLongMap!5427)

(declare-fun lt!182945 () tuple2!6514)

(declare-fun lt!182946 () ListLongMap!5427)

(declare-fun +!1024 (ListLongMap!5427 tuple2!6514) ListLongMap!5427)

(assert (=> b!389251 (= res!222663 (= lt!182946 (+!1024 (+!1024 lt!182941 lt!182939) lt!182945)))))

(declare-fun minValue!472 () V!13903)

(assert (=> b!389251 (= lt!182945 (tuple2!6515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun zeroValue!472 () V!13903)

(assert (=> b!389251 (= lt!182939 (tuple2!6515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!389252 () Bool)

(declare-fun e!235830 () Bool)

(assert (=> b!389252 (= e!235830 (not e!235831))))

(declare-fun res!222659 () Bool)

(assert (=> b!389252 (=> res!222659 e!235831)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389252 (= res!222659 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!182947 () ListLongMap!5427)

(declare-datatypes ((ValueCell!4456 0))(
  ( (ValueCellFull!4456 (v!7049 V!13903)) (EmptyCell!4456) )
))
(declare-datatypes ((array!23091 0))(
  ( (array!23092 (arr!11012 (Array (_ BitVec 32) ValueCell!4456)) (size!11364 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23091)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!23093 0))(
  ( (array!23094 (arr!11013 (Array (_ BitVec 32) (_ BitVec 64))) (size!11365 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23093)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!2078 (array!23093 array!23091 (_ BitVec 32) (_ BitVec 32) V!13903 V!13903 (_ BitVec 32) Int) ListLongMap!5427)

(assert (=> b!389252 (= lt!182947 (getCurrentListMap!2078 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182943 () array!23093)

(declare-fun lt!182944 () array!23091)

(assert (=> b!389252 (= lt!182946 (getCurrentListMap!2078 lt!182943 lt!182944 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182942 () ListLongMap!5427)

(assert (=> b!389252 (and (= lt!182941 lt!182942) (= lt!182942 lt!182941))))

(declare-fun lt!182938 () ListLongMap!5427)

(declare-fun v!373 () V!13903)

(assert (=> b!389252 (= lt!182942 (+!1024 lt!182938 (tuple2!6515 k!778 v!373)))))

(declare-datatypes ((Unit!11926 0))(
  ( (Unit!11927) )
))
(declare-fun lt!182940 () Unit!11926)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!242 (array!23093 array!23091 (_ BitVec 32) (_ BitVec 32) V!13903 V!13903 (_ BitVec 32) (_ BitVec 64) V!13903 (_ BitVec 32) Int) Unit!11926)

(assert (=> b!389252 (= lt!182940 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!242 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!958 (array!23093 array!23091 (_ BitVec 32) (_ BitVec 32) V!13903 V!13903 (_ BitVec 32) Int) ListLongMap!5427)

(assert (=> b!389252 (= lt!182941 (getCurrentListMapNoExtraKeys!958 lt!182943 lt!182944 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389252 (= lt!182944 (array!23092 (store (arr!11012 _values!506) i!548 (ValueCellFull!4456 v!373)) (size!11364 _values!506)))))

(assert (=> b!389252 (= lt!182938 (getCurrentListMapNoExtraKeys!958 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389253 () Bool)

(declare-fun res!222665 () Bool)

(assert (=> b!389253 (=> (not res!222665) (not e!235830))))

(declare-datatypes ((List!6368 0))(
  ( (Nil!6365) (Cons!6364 (h!7220 (_ BitVec 64)) (t!11522 List!6368)) )
))
(declare-fun arrayNoDuplicates!0 (array!23093 (_ BitVec 32) List!6368) Bool)

(assert (=> b!389253 (= res!222665 (arrayNoDuplicates!0 lt!182943 #b00000000000000000000000000000000 Nil!6365))))

(declare-fun b!389254 () Bool)

(declare-fun e!235828 () Bool)

(assert (=> b!389254 (= e!235828 e!235830)))

(declare-fun res!222654 () Bool)

(assert (=> b!389254 (=> (not res!222654) (not e!235830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23093 (_ BitVec 32)) Bool)

(assert (=> b!389254 (= res!222654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182943 mask!970))))

(assert (=> b!389254 (= lt!182943 (array!23094 (store (arr!11013 _keys!658) i!548 k!778) (size!11365 _keys!658)))))

(declare-fun b!389255 () Bool)

(declare-fun res!222661 () Bool)

(assert (=> b!389255 (=> (not res!222661) (not e!235828))))

(assert (=> b!389255 (= res!222661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389256 () Bool)

(declare-fun res!222658 () Bool)

(assert (=> b!389256 (=> (not res!222658) (not e!235828))))

(assert (=> b!389256 (= res!222658 (or (= (select (arr!11013 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11013 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389257 () Bool)

(declare-fun e!235829 () Bool)

(declare-fun e!235825 () Bool)

(assert (=> b!389257 (= e!235829 (and e!235825 mapRes!15969))))

(declare-fun condMapEmpty!15969 () Bool)

(declare-fun mapDefault!15969 () ValueCell!4456)

