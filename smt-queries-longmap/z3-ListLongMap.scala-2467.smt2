; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38606 () Bool)

(assert start!38606)

(declare-fun b_free!9157 () Bool)

(declare-fun b_next!9157 () Bool)

(assert (=> start!38606 (= b_free!9157 (not b_next!9157))))

(declare-fun tp!32595 () Bool)

(declare-fun b_and!16557 () Bool)

(assert (=> start!38606 (= tp!32595 b_and!16557)))

(declare-fun b!400413 () Bool)

(declare-fun res!230398 () Bool)

(declare-fun e!241622 () Bool)

(assert (=> b!400413 (=> (not res!230398) (not e!241622))))

(declare-datatypes ((array!23964 0))(
  ( (array!23965 (arr!11431 (Array (_ BitVec 32) (_ BitVec 64))) (size!11783 (_ BitVec 32))) )
))
(declare-fun lt!187715 () array!23964)

(declare-datatypes ((List!6498 0))(
  ( (Nil!6495) (Cons!6494 (h!7350 (_ BitVec 64)) (t!11664 List!6498)) )
))
(declare-fun arrayNoDuplicates!0 (array!23964 (_ BitVec 32) List!6498) Bool)

(assert (=> b!400413 (= res!230398 (arrayNoDuplicates!0 lt!187715 #b00000000000000000000000000000000 Nil!6495))))

(declare-fun b!400414 () Bool)

(declare-datatypes ((V!14491 0))(
  ( (V!14492 (val!5064 Int)) )
))
(declare-datatypes ((tuple2!6578 0))(
  ( (tuple2!6579 (_1!3300 (_ BitVec 64)) (_2!3300 V!14491)) )
))
(declare-datatypes ((List!6499 0))(
  ( (Nil!6496) (Cons!6495 (h!7351 tuple2!6578) (t!11665 List!6499)) )
))
(declare-datatypes ((ListLongMap!5493 0))(
  ( (ListLongMap!5494 (toList!2762 List!6499)) )
))
(declare-fun call!28122 () ListLongMap!5493)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!241624 () Bool)

(declare-fun call!28123 () ListLongMap!5493)

(declare-fun v!412 () V!14491)

(declare-fun +!1109 (ListLongMap!5493 tuple2!6578) ListLongMap!5493)

(assert (=> b!400414 (= e!241624 (= call!28123 (+!1109 call!28122 (tuple2!6579 k0!794 v!412))))))

(declare-fun mapIsEmpty!16680 () Bool)

(declare-fun mapRes!16680 () Bool)

(assert (=> mapIsEmpty!16680 mapRes!16680))

(declare-fun b!400416 () Bool)

(declare-fun res!230401 () Bool)

(declare-fun e!241623 () Bool)

(assert (=> b!400416 (=> (not res!230401) (not e!241623))))

(declare-fun _keys!709 () array!23964)

(assert (=> b!400416 (= res!230401 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6495))))

(declare-fun minValue!515 () V!14491)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14491)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!54669 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4676 0))(
  ( (ValueCellFull!4676 (v!7312 V!14491)) (EmptyCell!4676) )
))
(declare-datatypes ((array!23966 0))(
  ( (array!23967 (arr!11432 (Array (_ BitVec 32) ValueCell!4676)) (size!11784 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23966)

(declare-fun bm!28119 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1019 (array!23964 array!23966 (_ BitVec 32) (_ BitVec 32) V!14491 V!14491 (_ BitVec 32) Int) ListLongMap!5493)

(assert (=> bm!28119 (= call!28123 (getCurrentListMapNoExtraKeys!1019 (ite c!54669 lt!187715 _keys!709) (ite c!54669 (array!23967 (store (arr!11432 _values!549) i!563 (ValueCellFull!4676 v!412)) (size!11784 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400417 () Bool)

(assert (=> b!400417 (= e!241622 (not true))))

(assert (=> b!400417 e!241624))

(assert (=> b!400417 (= c!54669 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12103 0))(
  ( (Unit!12104) )
))
(declare-fun lt!187716 () Unit!12103)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!319 (array!23964 array!23966 (_ BitVec 32) (_ BitVec 32) V!14491 V!14491 (_ BitVec 32) (_ BitVec 64) V!14491 (_ BitVec 32) Int) Unit!12103)

(assert (=> b!400417 (= lt!187716 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!319 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400418 () Bool)

(assert (=> b!400418 (= e!241624 (= call!28122 call!28123))))

(declare-fun b!400419 () Bool)

(declare-fun res!230405 () Bool)

(assert (=> b!400419 (=> (not res!230405) (not e!241623))))

(assert (=> b!400419 (= res!230405 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11783 _keys!709))))))

(declare-fun b!400420 () Bool)

(declare-fun res!230403 () Bool)

(assert (=> b!400420 (=> (not res!230403) (not e!241623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400420 (= res!230403 (validKeyInArray!0 k0!794))))

(declare-fun bm!28120 () Bool)

(assert (=> bm!28120 (= call!28122 (getCurrentListMapNoExtraKeys!1019 (ite c!54669 _keys!709 lt!187715) (ite c!54669 _values!549 (array!23967 (store (arr!11432 _values!549) i!563 (ValueCellFull!4676 v!412)) (size!11784 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400421 () Bool)

(declare-fun e!241619 () Bool)

(declare-fun tp_is_empty!10039 () Bool)

(assert (=> b!400421 (= e!241619 tp_is_empty!10039)))

(declare-fun b!400422 () Bool)

(declare-fun res!230400 () Bool)

(assert (=> b!400422 (=> (not res!230400) (not e!241623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23964 (_ BitVec 32)) Bool)

(assert (=> b!400422 (= res!230400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!230395 () Bool)

(assert (=> start!38606 (=> (not res!230395) (not e!241623))))

(assert (=> start!38606 (= res!230395 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11783 _keys!709))))))

(assert (=> start!38606 e!241623))

(assert (=> start!38606 tp_is_empty!10039))

(assert (=> start!38606 tp!32595))

(assert (=> start!38606 true))

(declare-fun e!241620 () Bool)

(declare-fun array_inv!8444 (array!23966) Bool)

(assert (=> start!38606 (and (array_inv!8444 _values!549) e!241620)))

(declare-fun array_inv!8445 (array!23964) Bool)

(assert (=> start!38606 (array_inv!8445 _keys!709)))

(declare-fun b!400415 () Bool)

(assert (=> b!400415 (= e!241620 (and e!241619 mapRes!16680))))

(declare-fun condMapEmpty!16680 () Bool)

(declare-fun mapDefault!16680 () ValueCell!4676)

(assert (=> b!400415 (= condMapEmpty!16680 (= (arr!11432 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4676)) mapDefault!16680)))))

(declare-fun b!400423 () Bool)

(declare-fun e!241618 () Bool)

(assert (=> b!400423 (= e!241618 tp_is_empty!10039)))

(declare-fun mapNonEmpty!16680 () Bool)

(declare-fun tp!32594 () Bool)

(assert (=> mapNonEmpty!16680 (= mapRes!16680 (and tp!32594 e!241618))))

(declare-fun mapKey!16680 () (_ BitVec 32))

(declare-fun mapValue!16680 () ValueCell!4676)

(declare-fun mapRest!16680 () (Array (_ BitVec 32) ValueCell!4676))

(assert (=> mapNonEmpty!16680 (= (arr!11432 _values!549) (store mapRest!16680 mapKey!16680 mapValue!16680))))

(declare-fun b!400424 () Bool)

(declare-fun res!230406 () Bool)

(assert (=> b!400424 (=> (not res!230406) (not e!241622))))

(assert (=> b!400424 (= res!230406 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11783 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400425 () Bool)

(declare-fun res!230402 () Bool)

(assert (=> b!400425 (=> (not res!230402) (not e!241623))))

(assert (=> b!400425 (= res!230402 (and (= (size!11784 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11783 _keys!709) (size!11784 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400426 () Bool)

(declare-fun res!230399 () Bool)

(assert (=> b!400426 (=> (not res!230399) (not e!241623))))

(declare-fun arrayContainsKey!0 (array!23964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400426 (= res!230399 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400427 () Bool)

(declare-fun res!230396 () Bool)

(assert (=> b!400427 (=> (not res!230396) (not e!241623))))

(assert (=> b!400427 (= res!230396 (or (= (select (arr!11431 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11431 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400428 () Bool)

(declare-fun res!230404 () Bool)

(assert (=> b!400428 (=> (not res!230404) (not e!241623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400428 (= res!230404 (validMask!0 mask!1025))))

(declare-fun b!400429 () Bool)

(assert (=> b!400429 (= e!241623 e!241622)))

(declare-fun res!230397 () Bool)

(assert (=> b!400429 (=> (not res!230397) (not e!241622))))

(assert (=> b!400429 (= res!230397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187715 mask!1025))))

(assert (=> b!400429 (= lt!187715 (array!23965 (store (arr!11431 _keys!709) i!563 k0!794) (size!11783 _keys!709)))))

(assert (= (and start!38606 res!230395) b!400428))

(assert (= (and b!400428 res!230404) b!400425))

(assert (= (and b!400425 res!230402) b!400422))

(assert (= (and b!400422 res!230400) b!400416))

(assert (= (and b!400416 res!230401) b!400419))

(assert (= (and b!400419 res!230405) b!400420))

(assert (= (and b!400420 res!230403) b!400427))

(assert (= (and b!400427 res!230396) b!400426))

(assert (= (and b!400426 res!230399) b!400429))

(assert (= (and b!400429 res!230397) b!400413))

(assert (= (and b!400413 res!230398) b!400424))

(assert (= (and b!400424 res!230406) b!400417))

(assert (= (and b!400417 c!54669) b!400414))

(assert (= (and b!400417 (not c!54669)) b!400418))

(assert (= (or b!400414 b!400418) bm!28119))

(assert (= (or b!400414 b!400418) bm!28120))

(assert (= (and b!400415 condMapEmpty!16680) mapIsEmpty!16680))

(assert (= (and b!400415 (not condMapEmpty!16680)) mapNonEmpty!16680))

(get-info :version)

(assert (= (and mapNonEmpty!16680 ((_ is ValueCellFull!4676) mapValue!16680)) b!400423))

(assert (= (and b!400415 ((_ is ValueCellFull!4676) mapDefault!16680)) b!400421))

(assert (= start!38606 b!400415))

(declare-fun m!394875 () Bool)

(assert (=> b!400417 m!394875))

(declare-fun m!394877 () Bool)

(assert (=> start!38606 m!394877))

(declare-fun m!394879 () Bool)

(assert (=> start!38606 m!394879))

(declare-fun m!394881 () Bool)

(assert (=> bm!28119 m!394881))

(declare-fun m!394883 () Bool)

(assert (=> bm!28119 m!394883))

(declare-fun m!394885 () Bool)

(assert (=> b!400427 m!394885))

(declare-fun m!394887 () Bool)

(assert (=> b!400416 m!394887))

(declare-fun m!394889 () Bool)

(assert (=> b!400429 m!394889))

(declare-fun m!394891 () Bool)

(assert (=> b!400429 m!394891))

(declare-fun m!394893 () Bool)

(assert (=> b!400428 m!394893))

(declare-fun m!394895 () Bool)

(assert (=> b!400426 m!394895))

(declare-fun m!394897 () Bool)

(assert (=> mapNonEmpty!16680 m!394897))

(declare-fun m!394899 () Bool)

(assert (=> b!400420 m!394899))

(assert (=> bm!28120 m!394881))

(declare-fun m!394901 () Bool)

(assert (=> bm!28120 m!394901))

(declare-fun m!394903 () Bool)

(assert (=> b!400414 m!394903))

(declare-fun m!394905 () Bool)

(assert (=> b!400413 m!394905))

(declare-fun m!394907 () Bool)

(assert (=> b!400422 m!394907))

(check-sat (not b!400417) (not bm!28119) (not b!400422) (not b!400420) (not b!400413) (not mapNonEmpty!16680) (not b!400416) (not bm!28120) (not b!400428) (not b!400414) (not start!38606) (not b!400426) (not b_next!9157) b_and!16557 tp_is_empty!10039 (not b!400429))
(check-sat b_and!16557 (not b_next!9157))
