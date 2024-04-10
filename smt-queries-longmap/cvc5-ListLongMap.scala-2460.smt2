; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38578 () Bool)

(assert start!38578)

(declare-fun b_free!9115 () Bool)

(declare-fun b_next!9115 () Bool)

(assert (=> start!38578 (= b_free!9115 (not b_next!9115))))

(declare-fun tp!32468 () Bool)

(declare-fun b_and!16501 () Bool)

(assert (=> start!38578 (= tp!32468 b_and!16501)))

(declare-fun b!399391 () Bool)

(declare-fun e!241213 () Bool)

(assert (=> b!399391 (= e!241213 (not true))))

(declare-fun e!241215 () Bool)

(assert (=> b!399391 e!241215))

(declare-fun c!54629 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399391 (= c!54629 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14435 0))(
  ( (V!14436 (val!5043 Int)) )
))
(declare-fun minValue!515 () V!14435)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4655 0))(
  ( (ValueCellFull!4655 (v!7290 V!14435)) (EmptyCell!4655) )
))
(declare-datatypes ((array!23905 0))(
  ( (array!23906 (arr!11402 (Array (_ BitVec 32) ValueCell!4655)) (size!11754 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23905)

(declare-fun zeroValue!515 () V!14435)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12104 0))(
  ( (Unit!12105) )
))
(declare-fun lt!187570 () Unit!12104)

(declare-fun v!412 () V!14435)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23907 0))(
  ( (array!23908 (arr!11403 (Array (_ BitVec 32) (_ BitVec 64))) (size!11755 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23907)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!310 (array!23907 array!23905 (_ BitVec 32) (_ BitVec 32) V!14435 V!14435 (_ BitVec 32) (_ BitVec 64) V!14435 (_ BitVec 32) Int) Unit!12104)

(assert (=> b!399391 (= lt!187570 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!310 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!187571 () array!23907)

(declare-fun bm!28006 () Bool)

(declare-datatypes ((tuple2!6676 0))(
  ( (tuple2!6677 (_1!3349 (_ BitVec 64)) (_2!3349 V!14435)) )
))
(declare-datatypes ((List!6603 0))(
  ( (Nil!6600) (Cons!6599 (h!7455 tuple2!6676) (t!11777 List!6603)) )
))
(declare-datatypes ((ListLongMap!5589 0))(
  ( (ListLongMap!5590 (toList!2810 List!6603)) )
))
(declare-fun call!28009 () ListLongMap!5589)

(declare-fun getCurrentListMapNoExtraKeys!1027 (array!23907 array!23905 (_ BitVec 32) (_ BitVec 32) V!14435 V!14435 (_ BitVec 32) Int) ListLongMap!5589)

(assert (=> bm!28006 (= call!28009 (getCurrentListMapNoExtraKeys!1027 (ite c!54629 lt!187571 _keys!709) (ite c!54629 (array!23906 (store (arr!11402 _values!549) i!563 (ValueCellFull!4655 v!412)) (size!11754 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399392 () Bool)

(declare-fun res!229652 () Bool)

(declare-fun e!241209 () Bool)

(assert (=> b!399392 (=> (not res!229652) (not e!241209))))

(assert (=> b!399392 (= res!229652 (or (= (select (arr!11403 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11403 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399393 () Bool)

(declare-fun res!229651 () Bool)

(assert (=> b!399393 (=> (not res!229651) (not e!241213))))

(declare-datatypes ((List!6604 0))(
  ( (Nil!6601) (Cons!6600 (h!7456 (_ BitVec 64)) (t!11778 List!6604)) )
))
(declare-fun arrayNoDuplicates!0 (array!23907 (_ BitVec 32) List!6604) Bool)

(assert (=> b!399393 (= res!229651 (arrayNoDuplicates!0 lt!187571 #b00000000000000000000000000000000 Nil!6601))))

(declare-fun b!399394 () Bool)

(declare-fun res!229650 () Bool)

(assert (=> b!399394 (=> (not res!229650) (not e!241209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23907 (_ BitVec 32)) Bool)

(assert (=> b!399394 (= res!229650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16617 () Bool)

(declare-fun mapRes!16617 () Bool)

(declare-fun tp!32469 () Bool)

(declare-fun e!241211 () Bool)

(assert (=> mapNonEmpty!16617 (= mapRes!16617 (and tp!32469 e!241211))))

(declare-fun mapValue!16617 () ValueCell!4655)

(declare-fun mapRest!16617 () (Array (_ BitVec 32) ValueCell!4655))

(declare-fun mapKey!16617 () (_ BitVec 32))

(assert (=> mapNonEmpty!16617 (= (arr!11402 _values!549) (store mapRest!16617 mapKey!16617 mapValue!16617))))

(declare-fun b!399395 () Bool)

(declare-fun call!28010 () ListLongMap!5589)

(assert (=> b!399395 (= e!241215 (= call!28010 call!28009))))

(declare-fun b!399397 () Bool)

(declare-fun res!229648 () Bool)

(assert (=> b!399397 (=> (not res!229648) (not e!241209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399397 (= res!229648 (validKeyInArray!0 k!794))))

(declare-fun b!399398 () Bool)

(declare-fun res!229642 () Bool)

(assert (=> b!399398 (=> (not res!229642) (not e!241209))))

(declare-fun arrayContainsKey!0 (array!23907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399398 (= res!229642 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!399399 () Bool)

(declare-fun res!229649 () Bool)

(assert (=> b!399399 (=> (not res!229649) (not e!241213))))

(assert (=> b!399399 (= res!229649 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11755 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399400 () Bool)

(declare-fun res!229645 () Bool)

(assert (=> b!399400 (=> (not res!229645) (not e!241209))))

(assert (=> b!399400 (= res!229645 (and (= (size!11754 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11755 _keys!709) (size!11754 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399401 () Bool)

(declare-fun e!241214 () Bool)

(declare-fun tp_is_empty!9997 () Bool)

(assert (=> b!399401 (= e!241214 tp_is_empty!9997)))

(declare-fun b!399402 () Bool)

(declare-fun res!229647 () Bool)

(assert (=> b!399402 (=> (not res!229647) (not e!241209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399402 (= res!229647 (validMask!0 mask!1025))))

(declare-fun b!399403 () Bool)

(declare-fun +!1099 (ListLongMap!5589 tuple2!6676) ListLongMap!5589)

(assert (=> b!399403 (= e!241215 (= call!28009 (+!1099 call!28010 (tuple2!6677 k!794 v!412))))))

(declare-fun b!399404 () Bool)

(declare-fun res!229646 () Bool)

(assert (=> b!399404 (=> (not res!229646) (not e!241209))))

(assert (=> b!399404 (= res!229646 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11755 _keys!709))))))

(declare-fun b!399405 () Bool)

(assert (=> b!399405 (= e!241209 e!241213)))

(declare-fun res!229653 () Bool)

(assert (=> b!399405 (=> (not res!229653) (not e!241213))))

(assert (=> b!399405 (= res!229653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187571 mask!1025))))

(assert (=> b!399405 (= lt!187571 (array!23908 (store (arr!11403 _keys!709) i!563 k!794) (size!11755 _keys!709)))))

(declare-fun mapIsEmpty!16617 () Bool)

(assert (=> mapIsEmpty!16617 mapRes!16617))

(declare-fun b!399406 () Bool)

(declare-fun e!241212 () Bool)

(assert (=> b!399406 (= e!241212 (and e!241214 mapRes!16617))))

(declare-fun condMapEmpty!16617 () Bool)

(declare-fun mapDefault!16617 () ValueCell!4655)

