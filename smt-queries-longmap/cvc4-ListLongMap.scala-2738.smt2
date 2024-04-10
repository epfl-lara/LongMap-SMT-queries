; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40250 () Bool)

(assert start!40250)

(declare-fun b_free!10517 () Bool)

(declare-fun b_next!10517 () Bool)

(assert (=> start!40250 (= b_free!10517 (not b_next!10517))))

(declare-fun tp!37079 () Bool)

(declare-fun b_and!18485 () Bool)

(assert (=> start!40250 (= tp!37079 b_and!18485)))

(declare-fun b!441764 () Bool)

(declare-fun res!261582 () Bool)

(declare-fun e!260075 () Bool)

(assert (=> b!441764 (=> (not res!261582) (not e!260075))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441764 (= res!261582 (bvsle from!863 i!563))))

(declare-fun b!441765 () Bool)

(declare-fun e!260071 () Bool)

(assert (=> b!441765 (= e!260071 (not true))))

(declare-datatypes ((array!27149 0))(
  ( (array!27150 (arr!13024 (Array (_ BitVec 32) (_ BitVec 64))) (size!13376 (_ BitVec 32))) )
))
(declare-fun lt!203000 () array!27149)

(declare-datatypes ((V!16663 0))(
  ( (V!16664 (val!5879 Int)) )
))
(declare-fun minValue!515 () V!16663)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16663)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((ValueCell!5491 0))(
  ( (ValueCellFull!5491 (v!8126 V!16663)) (EmptyCell!5491) )
))
(declare-datatypes ((array!27151 0))(
  ( (array!27152 (arr!13025 (Array (_ BitVec 32) ValueCell!5491)) (size!13377 (_ BitVec 32))) )
))
(declare-fun lt!202999 () array!27151)

(declare-fun v!412 () V!16663)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27149)

(declare-fun _values!549 () array!27151)

(declare-datatypes ((tuple2!7824 0))(
  ( (tuple2!7825 (_1!3923 (_ BitVec 64)) (_2!3923 V!16663)) )
))
(declare-datatypes ((List!7820 0))(
  ( (Nil!7817) (Cons!7816 (h!8672 tuple2!7824) (t!13576 List!7820)) )
))
(declare-datatypes ((ListLongMap!6737 0))(
  ( (ListLongMap!6738 (toList!3384 List!7820)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1573 (array!27149 array!27151 (_ BitVec 32) (_ BitVec 32) V!16663 V!16663 (_ BitVec 32) Int) ListLongMap!6737)

(declare-fun +!1520 (ListLongMap!6737 tuple2!7824) ListLongMap!6737)

(assert (=> b!441765 (= (getCurrentListMapNoExtraKeys!1573 lt!203000 lt!202999 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1520 (getCurrentListMapNoExtraKeys!1573 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7825 k!794 v!412)))))

(declare-datatypes ((Unit!13144 0))(
  ( (Unit!13145) )
))
(declare-fun lt!202998 () Unit!13144)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!689 (array!27149 array!27151 (_ BitVec 32) (_ BitVec 32) V!16663 V!16663 (_ BitVec 32) (_ BitVec 64) V!16663 (_ BitVec 32) Int) Unit!13144)

(assert (=> b!441765 (= lt!202998 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!689 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441766 () Bool)

(declare-fun res!261577 () Bool)

(declare-fun e!260070 () Bool)

(assert (=> b!441766 (=> (not res!261577) (not e!260070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27149 (_ BitVec 32)) Bool)

(assert (=> b!441766 (= res!261577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19125 () Bool)

(declare-fun mapRes!19125 () Bool)

(assert (=> mapIsEmpty!19125 mapRes!19125))

(declare-fun b!441767 () Bool)

(assert (=> b!441767 (= e!260075 e!260071)))

(declare-fun res!261580 () Bool)

(assert (=> b!441767 (=> (not res!261580) (not e!260071))))

(assert (=> b!441767 (= res!261580 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202997 () ListLongMap!6737)

(assert (=> b!441767 (= lt!202997 (getCurrentListMapNoExtraKeys!1573 lt!203000 lt!202999 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441767 (= lt!202999 (array!27152 (store (arr!13025 _values!549) i!563 (ValueCellFull!5491 v!412)) (size!13377 _values!549)))))

(declare-fun lt!202996 () ListLongMap!6737)

(assert (=> b!441767 (= lt!202996 (getCurrentListMapNoExtraKeys!1573 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441768 () Bool)

(declare-fun res!261585 () Bool)

(assert (=> b!441768 (=> (not res!261585) (not e!260070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441768 (= res!261585 (validMask!0 mask!1025))))

(declare-fun b!441769 () Bool)

(declare-fun e!260076 () Bool)

(declare-fun tp_is_empty!11669 () Bool)

(assert (=> b!441769 (= e!260076 tp_is_empty!11669)))

(declare-fun res!261583 () Bool)

(assert (=> start!40250 (=> (not res!261583) (not e!260070))))

(assert (=> start!40250 (= res!261583 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13376 _keys!709))))))

(assert (=> start!40250 e!260070))

(assert (=> start!40250 tp_is_empty!11669))

(assert (=> start!40250 tp!37079))

(assert (=> start!40250 true))

(declare-fun e!260072 () Bool)

(declare-fun array_inv!9452 (array!27151) Bool)

(assert (=> start!40250 (and (array_inv!9452 _values!549) e!260072)))

(declare-fun array_inv!9453 (array!27149) Bool)

(assert (=> start!40250 (array_inv!9453 _keys!709)))

(declare-fun b!441770 () Bool)

(declare-fun res!261581 () Bool)

(assert (=> b!441770 (=> (not res!261581) (not e!260070))))

(assert (=> b!441770 (= res!261581 (or (= (select (arr!13024 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13024 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441771 () Bool)

(assert (=> b!441771 (= e!260072 (and e!260076 mapRes!19125))))

(declare-fun condMapEmpty!19125 () Bool)

(declare-fun mapDefault!19125 () ValueCell!5491)

