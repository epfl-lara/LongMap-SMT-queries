; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38614 () Bool)

(assert start!38614)

(declare-fun b_free!9151 () Bool)

(declare-fun b_next!9151 () Bool)

(assert (=> start!38614 (= b_free!9151 (not b_next!9151))))

(declare-fun tp!32577 () Bool)

(declare-fun b_and!16537 () Bool)

(assert (=> start!38614 (= tp!32577 b_and!16537)))

(declare-fun b!400309 () Bool)

(declare-fun e!241588 () Bool)

(assert (=> b!400309 (= e!241588 (not true))))

(declare-fun e!241591 () Bool)

(assert (=> b!400309 e!241591))

(declare-fun c!54683 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400309 (= c!54683 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14483 0))(
  ( (V!14484 (val!5061 Int)) )
))
(declare-fun minValue!515 () V!14483)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4673 0))(
  ( (ValueCellFull!4673 (v!7308 V!14483)) (EmptyCell!4673) )
))
(declare-datatypes ((array!23975 0))(
  ( (array!23976 (arr!11437 (Array (_ BitVec 32) ValueCell!4673)) (size!11789 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23975)

(declare-fun zeroValue!515 () V!14483)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12128 0))(
  ( (Unit!12129) )
))
(declare-fun lt!187679 () Unit!12128)

(declare-fun v!412 () V!14483)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23977 0))(
  ( (array!23978 (arr!11438 (Array (_ BitVec 32) (_ BitVec 64))) (size!11790 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23977)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!322 (array!23977 array!23975 (_ BitVec 32) (_ BitVec 32) V!14483 V!14483 (_ BitVec 32) (_ BitVec 64) V!14483 (_ BitVec 32) Int) Unit!12128)

(assert (=> b!400309 (= lt!187679 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!322 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400310 () Bool)

(declare-fun e!241587 () Bool)

(declare-fun tp_is_empty!10033 () Bool)

(assert (=> b!400310 (= e!241587 tp_is_empty!10033)))

(declare-fun b!400311 () Bool)

(declare-fun res!230298 () Bool)

(assert (=> b!400311 (=> (not res!230298) (not e!241588))))

(assert (=> b!400311 (= res!230298 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11790 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400312 () Bool)

(declare-fun res!230296 () Bool)

(declare-fun e!241593 () Bool)

(assert (=> b!400312 (=> (not res!230296) (not e!241593))))

(assert (=> b!400312 (= res!230296 (or (= (select (arr!11438 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11438 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400313 () Bool)

(declare-datatypes ((tuple2!6710 0))(
  ( (tuple2!6711 (_1!3366 (_ BitVec 64)) (_2!3366 V!14483)) )
))
(declare-datatypes ((List!6632 0))(
  ( (Nil!6629) (Cons!6628 (h!7484 tuple2!6710) (t!11806 List!6632)) )
))
(declare-datatypes ((ListLongMap!5623 0))(
  ( (ListLongMap!5624 (toList!2827 List!6632)) )
))
(declare-fun call!28118 () ListLongMap!5623)

(declare-fun call!28117 () ListLongMap!5623)

(assert (=> b!400313 (= e!241591 (= call!28118 call!28117))))

(declare-fun b!400314 () Bool)

(declare-fun res!230301 () Bool)

(assert (=> b!400314 (=> (not res!230301) (not e!241593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400314 (= res!230301 (validKeyInArray!0 k!794))))

(declare-fun b!400315 () Bool)

(declare-fun res!230295 () Bool)

(assert (=> b!400315 (=> (not res!230295) (not e!241593))))

(declare-datatypes ((List!6633 0))(
  ( (Nil!6630) (Cons!6629 (h!7485 (_ BitVec 64)) (t!11807 List!6633)) )
))
(declare-fun arrayNoDuplicates!0 (array!23977 (_ BitVec 32) List!6633) Bool)

(assert (=> b!400315 (= res!230295 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6630))))

(declare-fun mapNonEmpty!16671 () Bool)

(declare-fun mapRes!16671 () Bool)

(declare-fun tp!32576 () Bool)

(assert (=> mapNonEmpty!16671 (= mapRes!16671 (and tp!32576 e!241587))))

(declare-fun mapValue!16671 () ValueCell!4673)

(declare-fun mapRest!16671 () (Array (_ BitVec 32) ValueCell!4673))

(declare-fun mapKey!16671 () (_ BitVec 32))

(assert (=> mapNonEmpty!16671 (= (arr!11437 _values!549) (store mapRest!16671 mapKey!16671 mapValue!16671))))

(declare-fun bm!28114 () Bool)

(declare-fun lt!187678 () array!23977)

(declare-fun getCurrentListMapNoExtraKeys!1040 (array!23977 array!23975 (_ BitVec 32) (_ BitVec 32) V!14483 V!14483 (_ BitVec 32) Int) ListLongMap!5623)

(assert (=> bm!28114 (= call!28117 (getCurrentListMapNoExtraKeys!1040 (ite c!54683 lt!187678 _keys!709) (ite c!54683 (array!23976 (store (arr!11437 _values!549) i!563 (ValueCellFull!4673 v!412)) (size!11789 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400316 () Bool)

(declare-fun res!230291 () Bool)

(assert (=> b!400316 (=> (not res!230291) (not e!241593))))

(declare-fun arrayContainsKey!0 (array!23977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400316 (= res!230291 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!230292 () Bool)

(assert (=> start!38614 (=> (not res!230292) (not e!241593))))

(assert (=> start!38614 (= res!230292 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11790 _keys!709))))))

(assert (=> start!38614 e!241593))

(assert (=> start!38614 tp_is_empty!10033))

(assert (=> start!38614 tp!32577))

(assert (=> start!38614 true))

(declare-fun e!241590 () Bool)

(declare-fun array_inv!8376 (array!23975) Bool)

(assert (=> start!38614 (and (array_inv!8376 _values!549) e!241590)))

(declare-fun array_inv!8377 (array!23977) Bool)

(assert (=> start!38614 (array_inv!8377 _keys!709)))

(declare-fun b!400317 () Bool)

(declare-fun res!230300 () Bool)

(assert (=> b!400317 (=> (not res!230300) (not e!241593))))

(assert (=> b!400317 (= res!230300 (and (= (size!11789 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11790 _keys!709) (size!11789 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400318 () Bool)

(declare-fun res!230299 () Bool)

(assert (=> b!400318 (=> (not res!230299) (not e!241593))))

(assert (=> b!400318 (= res!230299 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11790 _keys!709))))))

(declare-fun b!400319 () Bool)

(declare-fun res!230293 () Bool)

(assert (=> b!400319 (=> (not res!230293) (not e!241593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400319 (= res!230293 (validMask!0 mask!1025))))

(declare-fun b!400320 () Bool)

(declare-fun e!241589 () Bool)

(assert (=> b!400320 (= e!241589 tp_is_empty!10033)))

(declare-fun mapIsEmpty!16671 () Bool)

(assert (=> mapIsEmpty!16671 mapRes!16671))

(declare-fun b!400321 () Bool)

(assert (=> b!400321 (= e!241593 e!241588)))

(declare-fun res!230297 () Bool)

(assert (=> b!400321 (=> (not res!230297) (not e!241588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23977 (_ BitVec 32)) Bool)

(assert (=> b!400321 (= res!230297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187678 mask!1025))))

(assert (=> b!400321 (= lt!187678 (array!23978 (store (arr!11438 _keys!709) i!563 k!794) (size!11790 _keys!709)))))

(declare-fun b!400322 () Bool)

(declare-fun res!230294 () Bool)

(assert (=> b!400322 (=> (not res!230294) (not e!241588))))

(assert (=> b!400322 (= res!230294 (arrayNoDuplicates!0 lt!187678 #b00000000000000000000000000000000 Nil!6630))))

(declare-fun b!400323 () Bool)

(declare-fun res!230290 () Bool)

(assert (=> b!400323 (=> (not res!230290) (not e!241593))))

(assert (=> b!400323 (= res!230290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400324 () Bool)

(assert (=> b!400324 (= e!241590 (and e!241589 mapRes!16671))))

(declare-fun condMapEmpty!16671 () Bool)

(declare-fun mapDefault!16671 () ValueCell!4673)

