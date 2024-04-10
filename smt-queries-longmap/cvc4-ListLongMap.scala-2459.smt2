; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38576 () Bool)

(assert start!38576)

(declare-fun b_free!9113 () Bool)

(declare-fun b_next!9113 () Bool)

(assert (=> start!38576 (= b_free!9113 (not b_next!9113))))

(declare-fun tp!32463 () Bool)

(declare-fun b_and!16499 () Bool)

(assert (=> start!38576 (= tp!32463 b_and!16499)))

(declare-fun b!399340 () Bool)

(declare-fun res!229612 () Bool)

(declare-fun e!241188 () Bool)

(assert (=> b!399340 (=> (not res!229612) (not e!241188))))

(declare-datatypes ((array!23901 0))(
  ( (array!23902 (arr!11400 (Array (_ BitVec 32) (_ BitVec 64))) (size!11752 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23901)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23901 (_ BitVec 32)) Bool)

(assert (=> b!399340 (= res!229612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399341 () Bool)

(declare-fun e!241190 () Bool)

(declare-fun tp_is_empty!9995 () Bool)

(assert (=> b!399341 (= e!241190 tp_is_empty!9995)))

(declare-fun b!399342 () Bool)

(declare-fun res!229617 () Bool)

(assert (=> b!399342 (=> (not res!229617) (not e!241188))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399342 (= res!229617 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!399343 () Bool)

(declare-fun res!229615 () Bool)

(assert (=> b!399343 (=> (not res!229615) (not e!241188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399343 (= res!229615 (validKeyInArray!0 k!794))))

(declare-fun res!229611 () Bool)

(assert (=> start!38576 (=> (not res!229611) (not e!241188))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38576 (= res!229611 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11752 _keys!709))))))

(assert (=> start!38576 e!241188))

(assert (=> start!38576 tp_is_empty!9995))

(assert (=> start!38576 tp!32463))

(assert (=> start!38576 true))

(declare-datatypes ((V!14431 0))(
  ( (V!14432 (val!5042 Int)) )
))
(declare-datatypes ((ValueCell!4654 0))(
  ( (ValueCellFull!4654 (v!7289 V!14431)) (EmptyCell!4654) )
))
(declare-datatypes ((array!23903 0))(
  ( (array!23904 (arr!11401 (Array (_ BitVec 32) ValueCell!4654)) (size!11753 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23903)

(declare-fun e!241189 () Bool)

(declare-fun array_inv!8354 (array!23903) Bool)

(assert (=> start!38576 (and (array_inv!8354 _values!549) e!241189)))

(declare-fun array_inv!8355 (array!23901) Bool)

(assert (=> start!38576 (array_inv!8355 _keys!709)))

(declare-fun e!241194 () Bool)

(declare-datatypes ((tuple2!6674 0))(
  ( (tuple2!6675 (_1!3348 (_ BitVec 64)) (_2!3348 V!14431)) )
))
(declare-datatypes ((List!6601 0))(
  ( (Nil!6598) (Cons!6597 (h!7453 tuple2!6674) (t!11775 List!6601)) )
))
(declare-datatypes ((ListLongMap!5587 0))(
  ( (ListLongMap!5588 (toList!2809 List!6601)) )
))
(declare-fun call!28004 () ListLongMap!5587)

(declare-fun call!28003 () ListLongMap!5587)

(declare-fun v!412 () V!14431)

(declare-fun b!399344 () Bool)

(declare-fun +!1098 (ListLongMap!5587 tuple2!6674) ListLongMap!5587)

(assert (=> b!399344 (= e!241194 (= call!28003 (+!1098 call!28004 (tuple2!6675 k!794 v!412))))))

(declare-fun b!399345 () Bool)

(declare-fun res!229606 () Bool)

(assert (=> b!399345 (=> (not res!229606) (not e!241188))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!399345 (= res!229606 (and (= (size!11753 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11752 _keys!709) (size!11753 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399346 () Bool)

(declare-fun e!241191 () Bool)

(assert (=> b!399346 (= e!241191 (not true))))

(assert (=> b!399346 e!241194))

(declare-fun c!54626 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399346 (= c!54626 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14431)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14431)

(declare-datatypes ((Unit!12102 0))(
  ( (Unit!12103) )
))
(declare-fun lt!187564 () Unit!12102)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!309 (array!23901 array!23903 (_ BitVec 32) (_ BitVec 32) V!14431 V!14431 (_ BitVec 32) (_ BitVec 64) V!14431 (_ BitVec 32) Int) Unit!12102)

(assert (=> b!399346 (= lt!187564 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!309 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399347 () Bool)

(declare-fun res!229616 () Bool)

(assert (=> b!399347 (=> (not res!229616) (not e!241188))))

(assert (=> b!399347 (= res!229616 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11752 _keys!709))))))

(declare-fun b!399348 () Bool)

(declare-fun res!229608 () Bool)

(assert (=> b!399348 (=> (not res!229608) (not e!241188))))

(declare-datatypes ((List!6602 0))(
  ( (Nil!6599) (Cons!6598 (h!7454 (_ BitVec 64)) (t!11776 List!6602)) )
))
(declare-fun arrayNoDuplicates!0 (array!23901 (_ BitVec 32) List!6602) Bool)

(assert (=> b!399348 (= res!229608 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6599))))

(declare-fun b!399349 () Bool)

(assert (=> b!399349 (= e!241188 e!241191)))

(declare-fun res!229609 () Bool)

(assert (=> b!399349 (=> (not res!229609) (not e!241191))))

(declare-fun lt!187565 () array!23901)

(assert (=> b!399349 (= res!229609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187565 mask!1025))))

(assert (=> b!399349 (= lt!187565 (array!23902 (store (arr!11400 _keys!709) i!563 k!794) (size!11752 _keys!709)))))

(declare-fun bm!28000 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1026 (array!23901 array!23903 (_ BitVec 32) (_ BitVec 32) V!14431 V!14431 (_ BitVec 32) Int) ListLongMap!5587)

(assert (=> bm!28000 (= call!28004 (getCurrentListMapNoExtraKeys!1026 (ite c!54626 _keys!709 lt!187565) (ite c!54626 _values!549 (array!23904 (store (arr!11401 _values!549) i!563 (ValueCellFull!4654 v!412)) (size!11753 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399350 () Bool)

(declare-fun res!229610 () Bool)

(assert (=> b!399350 (=> (not res!229610) (not e!241188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399350 (= res!229610 (validMask!0 mask!1025))))

(declare-fun b!399351 () Bool)

(declare-fun mapRes!16614 () Bool)

(assert (=> b!399351 (= e!241189 (and e!241190 mapRes!16614))))

(declare-fun condMapEmpty!16614 () Bool)

(declare-fun mapDefault!16614 () ValueCell!4654)

