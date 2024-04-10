; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39338 () Bool)

(assert start!39338)

(declare-fun b_free!9605 () Bool)

(declare-fun b_next!9605 () Bool)

(assert (=> start!39338 (= b_free!9605 (not b_next!9605))))

(declare-fun tp!34343 () Bool)

(declare-fun b_and!17085 () Bool)

(assert (=> start!39338 (= tp!34343 b_and!17085)))

(declare-datatypes ((V!15447 0))(
  ( (V!15448 (val!5423 Int)) )
))
(declare-datatypes ((tuple2!7078 0))(
  ( (tuple2!7079 (_1!3550 (_ BitVec 64)) (_2!3550 V!15447)) )
))
(declare-datatypes ((List!7096 0))(
  ( (Nil!7093) (Cons!7092 (h!7948 tuple2!7078) (t!12366 List!7096)) )
))
(declare-datatypes ((ListLongMap!5991 0))(
  ( (ListLongMap!5992 (toList!3011 List!7096)) )
))
(declare-fun call!28993 () ListLongMap!5991)

(declare-fun call!28994 () ListLongMap!5991)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun b!417135 () Bool)

(declare-fun e!248917 () Bool)

(declare-fun v!412 () V!15447)

(declare-fun +!1213 (ListLongMap!5991 tuple2!7078) ListLongMap!5991)

(assert (=> b!417135 (= e!248917 (= call!28994 (+!1213 call!28993 (tuple2!7079 k!794 v!412))))))

(declare-fun b!417136 () Bool)

(declare-fun res!242893 () Bool)

(declare-fun e!248923 () Bool)

(assert (=> b!417136 (=> (not res!242893) (not e!248923))))

(declare-datatypes ((array!25367 0))(
  ( (array!25368 (arr!12133 (Array (_ BitVec 32) (_ BitVec 64))) (size!12485 (_ BitVec 32))) )
))
(declare-fun lt!191057 () array!25367)

(declare-datatypes ((List!7097 0))(
  ( (Nil!7094) (Cons!7093 (h!7949 (_ BitVec 64)) (t!12367 List!7097)) )
))
(declare-fun arrayNoDuplicates!0 (array!25367 (_ BitVec 32) List!7097) Bool)

(assert (=> b!417136 (= res!242893 (arrayNoDuplicates!0 lt!191057 #b00000000000000000000000000000000 Nil!7094))))

(declare-fun minValue!515 () V!15447)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5035 0))(
  ( (ValueCellFull!5035 (v!7670 V!15447)) (EmptyCell!5035) )
))
(declare-datatypes ((array!25369 0))(
  ( (array!25370 (arr!12134 (Array (_ BitVec 32) ValueCell!5035)) (size!12486 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25369)

(declare-fun bm!28990 () Bool)

(declare-fun _keys!709 () array!25367)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15447)

(declare-fun c!55121 () Bool)

(declare-fun lt!191058 () array!25369)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1216 (array!25367 array!25369 (_ BitVec 32) (_ BitVec 32) V!15447 V!15447 (_ BitVec 32) Int) ListLongMap!5991)

(assert (=> bm!28990 (= call!28993 (getCurrentListMapNoExtraKeys!1216 (ite c!55121 _keys!709 lt!191057) (ite c!55121 _values!549 lt!191058) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417137 () Bool)

(declare-fun e!248922 () Bool)

(declare-fun tp_is_empty!10757 () Bool)

(assert (=> b!417137 (= e!248922 tp_is_empty!10757)))

(declare-fun b!417138 () Bool)

(declare-fun res!242895 () Bool)

(declare-fun e!248920 () Bool)

(assert (=> b!417138 (=> (not res!242895) (not e!248920))))

(assert (=> b!417138 (= res!242895 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7094))))

(declare-fun mapNonEmpty!17757 () Bool)

(declare-fun mapRes!17757 () Bool)

(declare-fun tp!34344 () Bool)

(assert (=> mapNonEmpty!17757 (= mapRes!17757 (and tp!34344 e!248922))))

(declare-fun mapKey!17757 () (_ BitVec 32))

(declare-fun mapValue!17757 () ValueCell!5035)

(declare-fun mapRest!17757 () (Array (_ BitVec 32) ValueCell!5035))

(assert (=> mapNonEmpty!17757 (= (arr!12134 _values!549) (store mapRest!17757 mapKey!17757 mapValue!17757))))

(declare-fun b!417139 () Bool)

(declare-fun res!242890 () Bool)

(assert (=> b!417139 (=> (not res!242890) (not e!248920))))

(assert (=> b!417139 (= res!242890 (and (= (size!12486 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12485 _keys!709) (size!12486 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417140 () Bool)

(assert (=> b!417140 (= e!248920 e!248923)))

(declare-fun res!242889 () Bool)

(assert (=> b!417140 (=> (not res!242889) (not e!248923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25367 (_ BitVec 32)) Bool)

(assert (=> b!417140 (= res!242889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191057 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417140 (= lt!191057 (array!25368 (store (arr!12133 _keys!709) i!563 k!794) (size!12485 _keys!709)))))

(declare-fun bm!28991 () Bool)

(assert (=> bm!28991 (= call!28994 (getCurrentListMapNoExtraKeys!1216 (ite c!55121 lt!191057 _keys!709) (ite c!55121 lt!191058 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417141 () Bool)

(declare-fun res!242899 () Bool)

(assert (=> b!417141 (=> (not res!242899) (not e!248920))))

(assert (=> b!417141 (= res!242899 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12485 _keys!709))))))

(declare-fun b!417142 () Bool)

(declare-fun e!248925 () Bool)

(assert (=> b!417142 (= e!248923 e!248925)))

(declare-fun res!242900 () Bool)

(assert (=> b!417142 (=> (not res!242900) (not e!248925))))

(assert (=> b!417142 (= res!242900 (= from!863 i!563))))

(declare-fun lt!191056 () ListLongMap!5991)

(assert (=> b!417142 (= lt!191056 (getCurrentListMapNoExtraKeys!1216 lt!191057 lt!191058 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417142 (= lt!191058 (array!25370 (store (arr!12134 _values!549) i!563 (ValueCellFull!5035 v!412)) (size!12486 _values!549)))))

(declare-fun lt!191063 () ListLongMap!5991)

(assert (=> b!417142 (= lt!191063 (getCurrentListMapNoExtraKeys!1216 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417143 () Bool)

(assert (=> b!417143 (= e!248917 (= call!28993 call!28994))))

(declare-fun b!417144 () Bool)

(declare-fun res!242888 () Bool)

(assert (=> b!417144 (=> (not res!242888) (not e!248920))))

(assert (=> b!417144 (= res!242888 (or (= (select (arr!12133 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12133 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417145 () Bool)

(declare-fun e!248918 () Bool)

(assert (=> b!417145 (= e!248925 (not e!248918))))

(declare-fun res!242894 () Bool)

(assert (=> b!417145 (=> res!242894 e!248918)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417145 (= res!242894 (validKeyInArray!0 (select (arr!12133 _keys!709) from!863)))))

(assert (=> b!417145 e!248917))

(assert (=> b!417145 (= c!55121 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12328 0))(
  ( (Unit!12329) )
))
(declare-fun lt!191066 () Unit!12328)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!420 (array!25367 array!25369 (_ BitVec 32) (_ BitVec 32) V!15447 V!15447 (_ BitVec 32) (_ BitVec 64) V!15447 (_ BitVec 32) Int) Unit!12328)

(assert (=> b!417145 (= lt!191066 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!420 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417146 () Bool)

(declare-fun res!242896 () Bool)

(assert (=> b!417146 (=> (not res!242896) (not e!248920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417146 (= res!242896 (validMask!0 mask!1025))))

(declare-fun b!417147 () Bool)

(declare-fun e!248921 () Bool)

(assert (=> b!417147 (= e!248921 tp_is_empty!10757)))

(declare-fun b!417148 () Bool)

(declare-fun res!242892 () Bool)

(assert (=> b!417148 (=> (not res!242892) (not e!248920))))

(declare-fun arrayContainsKey!0 (array!25367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417148 (= res!242892 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!242901 () Bool)

(assert (=> start!39338 (=> (not res!242901) (not e!248920))))

(assert (=> start!39338 (= res!242901 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12485 _keys!709))))))

(assert (=> start!39338 e!248920))

(assert (=> start!39338 tp_is_empty!10757))

(assert (=> start!39338 tp!34343))

(assert (=> start!39338 true))

(declare-fun e!248919 () Bool)

(declare-fun array_inv!8848 (array!25369) Bool)

(assert (=> start!39338 (and (array_inv!8848 _values!549) e!248919)))

(declare-fun array_inv!8849 (array!25367) Bool)

(assert (=> start!39338 (array_inv!8849 _keys!709)))

(declare-fun b!417149 () Bool)

(assert (=> b!417149 (= e!248919 (and e!248921 mapRes!17757))))

(declare-fun condMapEmpty!17757 () Bool)

(declare-fun mapDefault!17757 () ValueCell!5035)

