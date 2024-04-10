; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38570 () Bool)

(assert start!38570)

(declare-fun b_free!9107 () Bool)

(declare-fun b_next!9107 () Bool)

(assert (=> start!38570 (= b_free!9107 (not b_next!9107))))

(declare-fun tp!32445 () Bool)

(declare-fun b_and!16493 () Bool)

(assert (=> start!38570 (= tp!32445 b_and!16493)))

(declare-fun b!399187 () Bool)

(declare-fun res!229505 () Bool)

(declare-fun e!241125 () Bool)

(assert (=> b!399187 (=> (not res!229505) (not e!241125))))

(declare-datatypes ((array!23889 0))(
  ( (array!23890 (arr!11394 (Array (_ BitVec 32) (_ BitVec 64))) (size!11746 (_ BitVec 32))) )
))
(declare-fun lt!187547 () array!23889)

(declare-datatypes ((List!6595 0))(
  ( (Nil!6592) (Cons!6591 (h!7447 (_ BitVec 64)) (t!11769 List!6595)) )
))
(declare-fun arrayNoDuplicates!0 (array!23889 (_ BitVec 32) List!6595) Bool)

(assert (=> b!399187 (= res!229505 (arrayNoDuplicates!0 lt!187547 #b00000000000000000000000000000000 Nil!6592))))

(declare-fun b!399188 () Bool)

(declare-fun res!229509 () Bool)

(declare-fun e!241131 () Bool)

(assert (=> b!399188 (=> (not res!229509) (not e!241131))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!23889)

(assert (=> b!399188 (= res!229509 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11746 _keys!709))))))

(declare-fun b!399189 () Bool)

(declare-fun res!229503 () Bool)

(assert (=> b!399189 (=> (not res!229503) (not e!241131))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23889 (_ BitVec 32)) Bool)

(assert (=> b!399189 (= res!229503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!229499 () Bool)

(assert (=> start!38570 (=> (not res!229499) (not e!241131))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38570 (= res!229499 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11746 _keys!709))))))

(assert (=> start!38570 e!241131))

(declare-fun tp_is_empty!9989 () Bool)

(assert (=> start!38570 tp_is_empty!9989))

(assert (=> start!38570 tp!32445))

(assert (=> start!38570 true))

(declare-datatypes ((V!14423 0))(
  ( (V!14424 (val!5039 Int)) )
))
(declare-datatypes ((ValueCell!4651 0))(
  ( (ValueCellFull!4651 (v!7286 V!14423)) (EmptyCell!4651) )
))
(declare-datatypes ((array!23891 0))(
  ( (array!23892 (arr!11395 (Array (_ BitVec 32) ValueCell!4651)) (size!11747 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23891)

(declare-fun e!241128 () Bool)

(declare-fun array_inv!8350 (array!23891) Bool)

(assert (=> start!38570 (and (array_inv!8350 _values!549) e!241128)))

(declare-fun array_inv!8351 (array!23889) Bool)

(assert (=> start!38570 (array_inv!8351 _keys!709)))

(declare-fun b!399190 () Bool)

(declare-fun res!229506 () Bool)

(assert (=> b!399190 (=> (not res!229506) (not e!241131))))

(assert (=> b!399190 (= res!229506 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6592))))

(declare-fun b!399191 () Bool)

(declare-fun res!229507 () Bool)

(assert (=> b!399191 (=> (not res!229507) (not e!241125))))

(assert (=> b!399191 (= res!229507 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11746 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399192 () Bool)

(declare-fun res!229500 () Bool)

(assert (=> b!399192 (=> (not res!229500) (not e!241131))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399192 (= res!229500 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16605 () Bool)

(declare-fun mapRes!16605 () Bool)

(declare-fun tp!32444 () Bool)

(declare-fun e!241130 () Bool)

(assert (=> mapNonEmpty!16605 (= mapRes!16605 (and tp!32444 e!241130))))

(declare-fun mapKey!16605 () (_ BitVec 32))

(declare-fun mapValue!16605 () ValueCell!4651)

(declare-fun mapRest!16605 () (Array (_ BitVec 32) ValueCell!4651))

(assert (=> mapNonEmpty!16605 (= (arr!11395 _values!549) (store mapRest!16605 mapKey!16605 mapValue!16605))))

(declare-fun minValue!515 () V!14423)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!27982 () Bool)

(declare-fun zeroValue!515 () V!14423)

(declare-datatypes ((tuple2!6668 0))(
  ( (tuple2!6669 (_1!3345 (_ BitVec 64)) (_2!3345 V!14423)) )
))
(declare-datatypes ((List!6596 0))(
  ( (Nil!6593) (Cons!6592 (h!7448 tuple2!6668) (t!11770 List!6596)) )
))
(declare-datatypes ((ListLongMap!5581 0))(
  ( (ListLongMap!5582 (toList!2806 List!6596)) )
))
(declare-fun call!27986 () ListLongMap!5581)

(declare-fun c!54617 () Bool)

(declare-fun v!412 () V!14423)

(declare-fun getCurrentListMapNoExtraKeys!1024 (array!23889 array!23891 (_ BitVec 32) (_ BitVec 32) V!14423 V!14423 (_ BitVec 32) Int) ListLongMap!5581)

(assert (=> bm!27982 (= call!27986 (getCurrentListMapNoExtraKeys!1024 (ite c!54617 lt!187547 _keys!709) (ite c!54617 (array!23892 (store (arr!11395 _values!549) i!563 (ValueCellFull!4651 v!412)) (size!11747 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399193 () Bool)

(declare-fun e!241126 () Bool)

(assert (=> b!399193 (= e!241126 tp_is_empty!9989)))

(declare-fun b!399194 () Bool)

(assert (=> b!399194 (= e!241125 (not true))))

(declare-fun e!241129 () Bool)

(assert (=> b!399194 e!241129))

(assert (=> b!399194 (= c!54617 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12098 0))(
  ( (Unit!12099) )
))
(declare-fun lt!187546 () Unit!12098)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!307 (array!23889 array!23891 (_ BitVec 32) (_ BitVec 32) V!14423 V!14423 (_ BitVec 32) (_ BitVec 64) V!14423 (_ BitVec 32) Int) Unit!12098)

(assert (=> b!399194 (= lt!187546 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!307 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399195 () Bool)

(assert (=> b!399195 (= e!241128 (and e!241126 mapRes!16605))))

(declare-fun condMapEmpty!16605 () Bool)

(declare-fun mapDefault!16605 () ValueCell!4651)

