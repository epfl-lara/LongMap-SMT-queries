; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39380 () Bool)

(assert start!39380)

(declare-fun b_free!9647 () Bool)

(declare-fun b_next!9647 () Bool)

(assert (=> start!39380 (= b_free!9647 (not b_next!9647))))

(declare-fun tp!34470 () Bool)

(declare-fun b_and!17169 () Bool)

(assert (=> start!39380 (= tp!34470 b_and!17169)))

(declare-fun b!418374 () Bool)

(declare-fun res!243778 () Bool)

(declare-fun e!249484 () Bool)

(assert (=> b!418374 (=> (not res!243778) (not e!249484))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418374 (= res!243778 (validKeyInArray!0 k!794))))

(declare-fun b!418375 () Bool)

(declare-fun e!249489 () Bool)

(declare-fun tp_is_empty!10799 () Bool)

(assert (=> b!418375 (= e!249489 tp_is_empty!10799)))

(declare-datatypes ((V!15503 0))(
  ( (V!15504 (val!5444 Int)) )
))
(declare-fun minValue!515 () V!15503)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!29116 () Bool)

(declare-fun zeroValue!515 () V!15503)

(declare-fun c!55184 () Bool)

(declare-datatypes ((array!25449 0))(
  ( (array!25450 (arr!12174 (Array (_ BitVec 32) (_ BitVec 64))) (size!12526 (_ BitVec 32))) )
))
(declare-fun lt!191758 () array!25449)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25449)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7118 0))(
  ( (tuple2!7119 (_1!3570 (_ BitVec 64)) (_2!3570 V!15503)) )
))
(declare-datatypes ((List!7131 0))(
  ( (Nil!7128) (Cons!7127 (h!7983 tuple2!7118) (t!12443 List!7131)) )
))
(declare-datatypes ((ListLongMap!6031 0))(
  ( (ListLongMap!6032 (toList!3031 List!7131)) )
))
(declare-fun call!29119 () ListLongMap!6031)

(declare-datatypes ((ValueCell!5056 0))(
  ( (ValueCellFull!5056 (v!7691 V!15503)) (EmptyCell!5056) )
))
(declare-datatypes ((array!25451 0))(
  ( (array!25452 (arr!12175 (Array (_ BitVec 32) ValueCell!5056)) (size!12527 (_ BitVec 32))) )
))
(declare-fun lt!191754 () array!25451)

(declare-fun _values!549 () array!25451)

(declare-fun getCurrentListMapNoExtraKeys!1236 (array!25449 array!25451 (_ BitVec 32) (_ BitVec 32) V!15503 V!15503 (_ BitVec 32) Int) ListLongMap!6031)

(assert (=> bm!29116 (= call!29119 (getCurrentListMapNoExtraKeys!1236 (ite c!55184 _keys!709 lt!191758) (ite c!55184 _values!549 lt!191754) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418376 () Bool)

(declare-fun e!249490 () Bool)

(assert (=> b!418376 (= e!249484 e!249490)))

(declare-fun res!243770 () Bool)

(assert (=> b!418376 (=> (not res!243770) (not e!249490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25449 (_ BitVec 32)) Bool)

(assert (=> b!418376 (= res!243770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191758 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418376 (= lt!191758 (array!25450 (store (arr!12174 _keys!709) i!563 k!794) (size!12526 _keys!709)))))

(declare-fun b!418377 () Bool)

(declare-fun e!249491 () Bool)

(assert (=> b!418377 (= e!249490 e!249491)))

(declare-fun res!243779 () Bool)

(assert (=> b!418377 (=> (not res!243779) (not e!249491))))

(assert (=> b!418377 (= res!243779 (= from!863 i!563))))

(declare-fun lt!191750 () ListLongMap!6031)

(assert (=> b!418377 (= lt!191750 (getCurrentListMapNoExtraKeys!1236 lt!191758 lt!191754 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15503)

(assert (=> b!418377 (= lt!191754 (array!25452 (store (arr!12175 _values!549) i!563 (ValueCellFull!5056 v!412)) (size!12527 _values!549)))))

(declare-fun lt!191756 () ListLongMap!6031)

(assert (=> b!418377 (= lt!191756 (getCurrentListMapNoExtraKeys!1236 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418378 () Bool)

(declare-fun res!243774 () Bool)

(assert (=> b!418378 (=> (not res!243774) (not e!249484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418378 (= res!243774 (validMask!0 mask!1025))))

(declare-fun b!418379 () Bool)

(declare-fun res!243782 () Bool)

(assert (=> b!418379 (=> (not res!243782) (not e!249484))))

(assert (=> b!418379 (= res!243782 (or (= (select (arr!12174 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12174 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418380 () Bool)

(declare-fun res!243771 () Bool)

(assert (=> b!418380 (=> (not res!243771) (not e!249484))))

(declare-fun arrayContainsKey!0 (array!25449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418380 (= res!243771 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!243773 () Bool)

(assert (=> start!39380 (=> (not res!243773) (not e!249484))))

(assert (=> start!39380 (= res!243773 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12526 _keys!709))))))

(assert (=> start!39380 e!249484))

(assert (=> start!39380 tp_is_empty!10799))

(assert (=> start!39380 tp!34470))

(assert (=> start!39380 true))

(declare-fun e!249487 () Bool)

(declare-fun array_inv!8874 (array!25451) Bool)

(assert (=> start!39380 (and (array_inv!8874 _values!549) e!249487)))

(declare-fun array_inv!8875 (array!25449) Bool)

(assert (=> start!39380 (array_inv!8875 _keys!709)))

(declare-fun b!418381 () Bool)

(declare-fun res!243781 () Bool)

(assert (=> b!418381 (=> (not res!243781) (not e!249484))))

(assert (=> b!418381 (= res!243781 (and (= (size!12527 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12526 _keys!709) (size!12527 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418382 () Bool)

(declare-fun res!243775 () Bool)

(assert (=> b!418382 (=> (not res!243775) (not e!249490))))

(declare-datatypes ((List!7132 0))(
  ( (Nil!7129) (Cons!7128 (h!7984 (_ BitVec 64)) (t!12444 List!7132)) )
))
(declare-fun arrayNoDuplicates!0 (array!25449 (_ BitVec 32) List!7132) Bool)

(assert (=> b!418382 (= res!243775 (arrayNoDuplicates!0 lt!191758 #b00000000000000000000000000000000 Nil!7129))))

(declare-fun b!418383 () Bool)

(declare-fun mapRes!17820 () Bool)

(assert (=> b!418383 (= e!249487 (and e!249489 mapRes!17820))))

(declare-fun condMapEmpty!17820 () Bool)

(declare-fun mapDefault!17820 () ValueCell!5056)

