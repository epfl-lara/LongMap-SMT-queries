; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38620 () Bool)

(assert start!38620)

(declare-fun b_free!9157 () Bool)

(declare-fun b_next!9157 () Bool)

(assert (=> start!38620 (= b_free!9157 (not b_next!9157))))

(declare-fun tp!32594 () Bool)

(declare-fun b_and!16543 () Bool)

(assert (=> start!38620 (= tp!32594 b_and!16543)))

(declare-fun b!400462 () Bool)

(declare-fun res!230409 () Bool)

(declare-fun e!241652 () Bool)

(assert (=> b!400462 (=> (not res!230409) (not e!241652))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400462 (= res!230409 (validMask!0 mask!1025))))

(declare-fun b!400463 () Bool)

(declare-fun res!230399 () Bool)

(assert (=> b!400463 (=> (not res!230399) (not e!241652))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400463 (= res!230399 (validKeyInArray!0 k!794))))

(declare-fun b!400464 () Bool)

(declare-datatypes ((V!14491 0))(
  ( (V!14492 (val!5064 Int)) )
))
(declare-datatypes ((tuple2!6716 0))(
  ( (tuple2!6717 (_1!3369 (_ BitVec 64)) (_2!3369 V!14491)) )
))
(declare-datatypes ((List!6638 0))(
  ( (Nil!6635) (Cons!6634 (h!7490 tuple2!6716) (t!11812 List!6638)) )
))
(declare-datatypes ((ListLongMap!5629 0))(
  ( (ListLongMap!5630 (toList!2830 List!6638)) )
))
(declare-fun call!28136 () ListLongMap!5629)

(declare-fun e!241651 () Bool)

(declare-fun call!28135 () ListLongMap!5629)

(declare-fun v!412 () V!14491)

(declare-fun +!1115 (ListLongMap!5629 tuple2!6716) ListLongMap!5629)

(assert (=> b!400464 (= e!241651 (= call!28135 (+!1115 call!28136 (tuple2!6717 k!794 v!412))))))

(declare-fun b!400465 () Bool)

(assert (=> b!400465 (= e!241651 (= call!28136 call!28135))))

(declare-fun b!400466 () Bool)

(declare-fun res!230400 () Bool)

(assert (=> b!400466 (=> (not res!230400) (not e!241652))))

(declare-datatypes ((array!23987 0))(
  ( (array!23988 (arr!11443 (Array (_ BitVec 32) (_ BitVec 64))) (size!11795 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23987)

(declare-datatypes ((List!6639 0))(
  ( (Nil!6636) (Cons!6635 (h!7491 (_ BitVec 64)) (t!11813 List!6639)) )
))
(declare-fun arrayNoDuplicates!0 (array!23987 (_ BitVec 32) List!6639) Bool)

(assert (=> b!400466 (= res!230400 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6636))))

(declare-fun b!400467 () Bool)

(declare-fun e!241654 () Bool)

(declare-fun tp_is_empty!10039 () Bool)

(assert (=> b!400467 (= e!241654 tp_is_empty!10039)))

(declare-fun b!400468 () Bool)

(declare-fun e!241655 () Bool)

(assert (=> b!400468 (= e!241655 (not true))))

(assert (=> b!400468 e!241651))

(declare-fun c!54692 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400468 (= c!54692 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14491)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14491)

(declare-datatypes ((ValueCell!4676 0))(
  ( (ValueCellFull!4676 (v!7311 V!14491)) (EmptyCell!4676) )
))
(declare-datatypes ((array!23989 0))(
  ( (array!23990 (arr!11444 (Array (_ BitVec 32) ValueCell!4676)) (size!11796 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23989)

(declare-datatypes ((Unit!12132 0))(
  ( (Unit!12133) )
))
(declare-fun lt!187697 () Unit!12132)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!324 (array!23987 array!23989 (_ BitVec 32) (_ BitVec 32) V!14491 V!14491 (_ BitVec 32) (_ BitVec 64) V!14491 (_ BitVec 32) Int) Unit!12132)

(assert (=> b!400468 (= lt!187697 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!324 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400469 () Bool)

(declare-fun res!230398 () Bool)

(assert (=> b!400469 (=> (not res!230398) (not e!241652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23987 (_ BitVec 32)) Bool)

(assert (=> b!400469 (= res!230398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400470 () Bool)

(declare-fun res!230404 () Bool)

(assert (=> b!400470 (=> (not res!230404) (not e!241652))))

(declare-fun arrayContainsKey!0 (array!23987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400470 (= res!230404 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!400471 () Bool)

(declare-fun e!241653 () Bool)

(assert (=> b!400471 (= e!241653 tp_is_empty!10039)))

(declare-fun mapIsEmpty!16680 () Bool)

(declare-fun mapRes!16680 () Bool)

(assert (=> mapIsEmpty!16680 mapRes!16680))

(declare-fun bm!28132 () Bool)

(declare-fun lt!187696 () array!23987)

(declare-fun getCurrentListMapNoExtraKeys!1043 (array!23987 array!23989 (_ BitVec 32) (_ BitVec 32) V!14491 V!14491 (_ BitVec 32) Int) ListLongMap!5629)

(assert (=> bm!28132 (= call!28135 (getCurrentListMapNoExtraKeys!1043 (ite c!54692 lt!187696 _keys!709) (ite c!54692 (array!23990 (store (arr!11444 _values!549) i!563 (ValueCellFull!4676 v!412)) (size!11796 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!230408 () Bool)

(assert (=> start!38620 (=> (not res!230408) (not e!241652))))

(assert (=> start!38620 (= res!230408 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11795 _keys!709))))))

(assert (=> start!38620 e!241652))

(assert (=> start!38620 tp_is_empty!10039))

(assert (=> start!38620 tp!32594))

(assert (=> start!38620 true))

(declare-fun e!241656 () Bool)

(declare-fun array_inv!8380 (array!23989) Bool)

(assert (=> start!38620 (and (array_inv!8380 _values!549) e!241656)))

(declare-fun array_inv!8381 (array!23987) Bool)

(assert (=> start!38620 (array_inv!8381 _keys!709)))

(declare-fun b!400472 () Bool)

(declare-fun res!230403 () Bool)

(assert (=> b!400472 (=> (not res!230403) (not e!241652))))

(assert (=> b!400472 (= res!230403 (or (= (select (arr!11443 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11443 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400473 () Bool)

(declare-fun res!230406 () Bool)

(assert (=> b!400473 (=> (not res!230406) (not e!241652))))

(assert (=> b!400473 (= res!230406 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11795 _keys!709))))))

(declare-fun b!400474 () Bool)

(declare-fun res!230407 () Bool)

(assert (=> b!400474 (=> (not res!230407) (not e!241655))))

(assert (=> b!400474 (= res!230407 (arrayNoDuplicates!0 lt!187696 #b00000000000000000000000000000000 Nil!6636))))

(declare-fun b!400475 () Bool)

(declare-fun res!230405 () Bool)

(assert (=> b!400475 (=> (not res!230405) (not e!241652))))

(assert (=> b!400475 (= res!230405 (and (= (size!11796 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11795 _keys!709) (size!11796 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28133 () Bool)

(assert (=> bm!28133 (= call!28136 (getCurrentListMapNoExtraKeys!1043 (ite c!54692 _keys!709 lt!187696) (ite c!54692 _values!549 (array!23990 (store (arr!11444 _values!549) i!563 (ValueCellFull!4676 v!412)) (size!11796 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16680 () Bool)

(declare-fun tp!32595 () Bool)

(assert (=> mapNonEmpty!16680 (= mapRes!16680 (and tp!32595 e!241654))))

(declare-fun mapRest!16680 () (Array (_ BitVec 32) ValueCell!4676))

(declare-fun mapValue!16680 () ValueCell!4676)

(declare-fun mapKey!16680 () (_ BitVec 32))

(assert (=> mapNonEmpty!16680 (= (arr!11444 _values!549) (store mapRest!16680 mapKey!16680 mapValue!16680))))

(declare-fun b!400476 () Bool)

(assert (=> b!400476 (= e!241656 (and e!241653 mapRes!16680))))

(declare-fun condMapEmpty!16680 () Bool)

(declare-fun mapDefault!16680 () ValueCell!4676)

