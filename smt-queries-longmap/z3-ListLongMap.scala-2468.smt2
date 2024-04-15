; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38612 () Bool)

(assert start!38612)

(declare-fun b_free!9163 () Bool)

(declare-fun b_next!9163 () Bool)

(assert (=> start!38612 (= b_free!9163 (not b_next!9163))))

(declare-fun tp!32613 () Bool)

(declare-fun b_and!16523 () Bool)

(assert (=> start!38612 (= tp!32613 b_and!16523)))

(declare-fun b!400344 () Bool)

(declare-fun res!230381 () Bool)

(declare-fun e!241542 () Bool)

(assert (=> b!400344 (=> (not res!230381) (not e!241542))))

(declare-datatypes ((array!23979 0))(
  ( (array!23980 (arr!11439 (Array (_ BitVec 32) (_ BitVec 64))) (size!11792 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23979)

(declare-datatypes ((List!6603 0))(
  ( (Nil!6600) (Cons!6599 (h!7455 (_ BitVec 64)) (t!11768 List!6603)) )
))
(declare-fun arrayNoDuplicates!0 (array!23979 (_ BitVec 32) List!6603) Bool)

(assert (=> b!400344 (= res!230381 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6600))))

(declare-fun mapNonEmpty!16689 () Bool)

(declare-fun mapRes!16689 () Bool)

(declare-fun tp!32612 () Bool)

(declare-fun e!241545 () Bool)

(assert (=> mapNonEmpty!16689 (= mapRes!16689 (and tp!32612 e!241545))))

(declare-datatypes ((V!14499 0))(
  ( (V!14500 (val!5067 Int)) )
))
(declare-datatypes ((ValueCell!4679 0))(
  ( (ValueCellFull!4679 (v!7308 V!14499)) (EmptyCell!4679) )
))
(declare-datatypes ((array!23981 0))(
  ( (array!23982 (arr!11440 (Array (_ BitVec 32) ValueCell!4679)) (size!11793 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23981)

(declare-fun mapValue!16689 () ValueCell!4679)

(declare-fun mapKey!16689 () (_ BitVec 32))

(declare-fun mapRest!16689 () (Array (_ BitVec 32) ValueCell!4679))

(assert (=> mapNonEmpty!16689 (= (arr!11440 _values!549) (store mapRest!16689 mapKey!16689 mapValue!16689))))

(declare-fun b!400345 () Bool)

(declare-fun res!230387 () Bool)

(assert (=> b!400345 (=> (not res!230387) (not e!241542))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400345 (= res!230387 (validKeyInArray!0 k0!794))))

(declare-fun b!400346 () Bool)

(declare-fun e!241540 () Bool)

(assert (=> b!400346 (= e!241542 e!241540)))

(declare-fun res!230383 () Bool)

(assert (=> b!400346 (=> (not res!230383) (not e!241540))))

(declare-fun lt!187481 () array!23979)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23979 (_ BitVec 32)) Bool)

(assert (=> b!400346 (= res!230383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187481 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400346 (= lt!187481 (array!23980 (store (arr!11439 _keys!709) i!563 k0!794) (size!11792 _keys!709)))))

(declare-fun b!400347 () Bool)

(assert (=> b!400347 (= e!241540 (not true))))

(declare-fun e!241541 () Bool)

(assert (=> b!400347 e!241541))

(declare-fun c!54630 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400347 (= c!54630 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14499)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14499)

(declare-datatypes ((Unit!12106 0))(
  ( (Unit!12107) )
))
(declare-fun lt!187480 () Unit!12106)

(declare-fun v!412 () V!14499)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!316 (array!23979 array!23981 (_ BitVec 32) (_ BitVec 32) V!14499 V!14499 (_ BitVec 32) (_ BitVec 64) V!14499 (_ BitVec 32) Int) Unit!12106)

(assert (=> b!400347 (= lt!187480 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!316 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400348 () Bool)

(declare-fun res!230380 () Bool)

(assert (=> b!400348 (=> (not res!230380) (not e!241542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400348 (= res!230380 (validMask!0 mask!1025))))

(declare-fun b!400349 () Bool)

(declare-fun res!230385 () Bool)

(assert (=> b!400349 (=> (not res!230385) (not e!241542))))

(assert (=> b!400349 (= res!230385 (or (= (select (arr!11439 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11439 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!230379 () Bool)

(assert (=> start!38612 (=> (not res!230379) (not e!241542))))

(assert (=> start!38612 (= res!230379 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11792 _keys!709))))))

(assert (=> start!38612 e!241542))

(declare-fun tp_is_empty!10045 () Bool)

(assert (=> start!38612 tp_is_empty!10045))

(assert (=> start!38612 tp!32613))

(assert (=> start!38612 true))

(declare-fun e!241544 () Bool)

(declare-fun array_inv!8394 (array!23981) Bool)

(assert (=> start!38612 (and (array_inv!8394 _values!549) e!241544)))

(declare-fun array_inv!8395 (array!23979) Bool)

(assert (=> start!38612 (array_inv!8395 _keys!709)))

(declare-fun b!400350 () Bool)

(assert (=> b!400350 (= e!241545 tp_is_empty!10045)))

(declare-fun b!400351 () Bool)

(declare-fun res!230386 () Bool)

(assert (=> b!400351 (=> (not res!230386) (not e!241542))))

(declare-fun arrayContainsKey!0 (array!23979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400351 (= res!230386 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400352 () Bool)

(declare-fun e!241539 () Bool)

(assert (=> b!400352 (= e!241539 tp_is_empty!10045)))

(declare-fun b!400353 () Bool)

(declare-fun res!230388 () Bool)

(assert (=> b!400353 (=> (not res!230388) (not e!241540))))

(assert (=> b!400353 (= res!230388 (arrayNoDuplicates!0 lt!187481 #b00000000000000000000000000000000 Nil!6600))))

(declare-fun mapIsEmpty!16689 () Bool)

(assert (=> mapIsEmpty!16689 mapRes!16689))

(declare-fun b!400354 () Bool)

(declare-fun res!230377 () Bool)

(assert (=> b!400354 (=> (not res!230377) (not e!241542))))

(assert (=> b!400354 (= res!230377 (and (= (size!11793 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11792 _keys!709) (size!11793 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28125 () Bool)

(declare-datatypes ((tuple2!6696 0))(
  ( (tuple2!6697 (_1!3359 (_ BitVec 64)) (_2!3359 V!14499)) )
))
(declare-datatypes ((List!6604 0))(
  ( (Nil!6601) (Cons!6600 (h!7456 tuple2!6696) (t!11769 List!6604)) )
))
(declare-datatypes ((ListLongMap!5599 0))(
  ( (ListLongMap!5600 (toList!2815 List!6604)) )
))
(declare-fun call!28129 () ListLongMap!5599)

(declare-fun getCurrentListMapNoExtraKeys!1034 (array!23979 array!23981 (_ BitVec 32) (_ BitVec 32) V!14499 V!14499 (_ BitVec 32) Int) ListLongMap!5599)

(assert (=> bm!28125 (= call!28129 (getCurrentListMapNoExtraKeys!1034 (ite c!54630 lt!187481 _keys!709) (ite c!54630 (array!23982 (store (arr!11440 _values!549) i!563 (ValueCellFull!4679 v!412)) (size!11793 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!28128 () ListLongMap!5599)

(declare-fun b!400355 () Bool)

(declare-fun +!1125 (ListLongMap!5599 tuple2!6696) ListLongMap!5599)

(assert (=> b!400355 (= e!241541 (= call!28129 (+!1125 call!28128 (tuple2!6697 k0!794 v!412))))))

(declare-fun b!400356 () Bool)

(declare-fun res!230382 () Bool)

(assert (=> b!400356 (=> (not res!230382) (not e!241540))))

(assert (=> b!400356 (= res!230382 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11792 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400357 () Bool)

(declare-fun res!230378 () Bool)

(assert (=> b!400357 (=> (not res!230378) (not e!241542))))

(assert (=> b!400357 (= res!230378 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11792 _keys!709))))))

(declare-fun b!400358 () Bool)

(assert (=> b!400358 (= e!241544 (and e!241539 mapRes!16689))))

(declare-fun condMapEmpty!16689 () Bool)

(declare-fun mapDefault!16689 () ValueCell!4679)

(assert (=> b!400358 (= condMapEmpty!16689 (= (arr!11440 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4679)) mapDefault!16689)))))

(declare-fun bm!28126 () Bool)

(assert (=> bm!28126 (= call!28128 (getCurrentListMapNoExtraKeys!1034 (ite c!54630 _keys!709 lt!187481) (ite c!54630 _values!549 (array!23982 (store (arr!11440 _values!549) i!563 (ValueCellFull!4679 v!412)) (size!11793 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400359 () Bool)

(assert (=> b!400359 (= e!241541 (= call!28128 call!28129))))

(declare-fun b!400360 () Bool)

(declare-fun res!230384 () Bool)

(assert (=> b!400360 (=> (not res!230384) (not e!241542))))

(assert (=> b!400360 (= res!230384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38612 res!230379) b!400348))

(assert (= (and b!400348 res!230380) b!400354))

(assert (= (and b!400354 res!230377) b!400360))

(assert (= (and b!400360 res!230384) b!400344))

(assert (= (and b!400344 res!230381) b!400357))

(assert (= (and b!400357 res!230378) b!400345))

(assert (= (and b!400345 res!230387) b!400349))

(assert (= (and b!400349 res!230385) b!400351))

(assert (= (and b!400351 res!230386) b!400346))

(assert (= (and b!400346 res!230383) b!400353))

(assert (= (and b!400353 res!230388) b!400356))

(assert (= (and b!400356 res!230382) b!400347))

(assert (= (and b!400347 c!54630) b!400355))

(assert (= (and b!400347 (not c!54630)) b!400359))

(assert (= (or b!400355 b!400359) bm!28125))

(assert (= (or b!400355 b!400359) bm!28126))

(assert (= (and b!400358 condMapEmpty!16689) mapIsEmpty!16689))

(assert (= (and b!400358 (not condMapEmpty!16689)) mapNonEmpty!16689))

(get-info :version)

(assert (= (and mapNonEmpty!16689 ((_ is ValueCellFull!4679) mapValue!16689)) b!400350))

(assert (= (and b!400358 ((_ is ValueCellFull!4679) mapDefault!16689)) b!400352))

(assert (= start!38612 b!400358))

(declare-fun m!394023 () Bool)

(assert (=> b!400344 m!394023))

(declare-fun m!394025 () Bool)

(assert (=> b!400353 m!394025))

(declare-fun m!394027 () Bool)

(assert (=> b!400351 m!394027))

(declare-fun m!394029 () Bool)

(assert (=> b!400348 m!394029))

(declare-fun m!394031 () Bool)

(assert (=> bm!28126 m!394031))

(declare-fun m!394033 () Bool)

(assert (=> bm!28126 m!394033))

(declare-fun m!394035 () Bool)

(assert (=> b!400355 m!394035))

(declare-fun m!394037 () Bool)

(assert (=> b!400347 m!394037))

(declare-fun m!394039 () Bool)

(assert (=> b!400360 m!394039))

(declare-fun m!394041 () Bool)

(assert (=> b!400345 m!394041))

(assert (=> bm!28125 m!394031))

(declare-fun m!394043 () Bool)

(assert (=> bm!28125 m!394043))

(declare-fun m!394045 () Bool)

(assert (=> b!400349 m!394045))

(declare-fun m!394047 () Bool)

(assert (=> b!400346 m!394047))

(declare-fun m!394049 () Bool)

(assert (=> b!400346 m!394049))

(declare-fun m!394051 () Bool)

(assert (=> mapNonEmpty!16689 m!394051))

(declare-fun m!394053 () Bool)

(assert (=> start!38612 m!394053))

(declare-fun m!394055 () Bool)

(assert (=> start!38612 m!394055))

(check-sat (not b!400347) b_and!16523 (not b!400353) (not mapNonEmpty!16689) (not b!400351) (not b_next!9163) (not bm!28126) tp_is_empty!10045 (not b!400348) (not b!400355) (not b!400344) (not b!400360) (not start!38612) (not b!400345) (not b!400346) (not bm!28125))
(check-sat b_and!16523 (not b_next!9163))
