; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41056 () Bool)

(assert start!41056)

(declare-fun b_free!10969 () Bool)

(declare-fun b_next!10969 () Bool)

(assert (=> start!41056 (= b_free!10969 (not b_next!10969))))

(declare-fun tp!38737 () Bool)

(declare-fun b_and!19145 () Bool)

(assert (=> start!41056 (= tp!38737 b_and!19145)))

(declare-fun b!457720 () Bool)

(declare-fun res!273354 () Bool)

(declare-fun e!267300 () Bool)

(assert (=> b!457720 (=> (not res!273354) (not e!267300))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457720 (= res!273354 (bvsle from!863 i!563))))

(declare-fun b!457721 () Bool)

(declare-fun res!273360 () Bool)

(declare-fun e!267301 () Bool)

(assert (=> b!457721 (=> (not res!273360) (not e!267301))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457721 (= res!273360 (validKeyInArray!0 k!794))))

(declare-fun b!457722 () Bool)

(declare-fun res!273350 () Bool)

(assert (=> b!457722 (=> (not res!273350) (not e!267301))))

(declare-datatypes ((array!28415 0))(
  ( (array!28416 (arr!13650 (Array (_ BitVec 32) (_ BitVec 64))) (size!14002 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28415)

(assert (=> b!457722 (= res!273350 (or (= (select (arr!13650 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13650 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457723 () Bool)

(declare-fun res!273353 () Bool)

(assert (=> b!457723 (=> (not res!273353) (not e!267301))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17515 0))(
  ( (V!17516 (val!6198 Int)) )
))
(declare-datatypes ((ValueCell!5810 0))(
  ( (ValueCellFull!5810 (v!8468 V!17515)) (EmptyCell!5810) )
))
(declare-datatypes ((array!28417 0))(
  ( (array!28418 (arr!13651 (Array (_ BitVec 32) ValueCell!5810)) (size!14003 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28417)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!457723 (= res!273353 (and (= (size!14003 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14002 _keys!709) (size!14003 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457724 () Bool)

(declare-fun res!273355 () Bool)

(assert (=> b!457724 (=> (not res!273355) (not e!267301))))

(declare-datatypes ((List!8239 0))(
  ( (Nil!8236) (Cons!8235 (h!9091 (_ BitVec 64)) (t!14087 List!8239)) )
))
(declare-fun arrayNoDuplicates!0 (array!28415 (_ BitVec 32) List!8239) Bool)

(assert (=> b!457724 (= res!273355 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8236))))

(declare-fun b!457725 () Bool)

(declare-fun e!267299 () Bool)

(declare-fun e!267304 () Bool)

(assert (=> b!457725 (= e!267299 (not e!267304))))

(declare-fun res!273358 () Bool)

(assert (=> b!457725 (=> res!273358 e!267304)))

(assert (=> b!457725 (= res!273358 (not (validKeyInArray!0 (select (arr!13650 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8166 0))(
  ( (tuple2!8167 (_1!4094 (_ BitVec 64)) (_2!4094 V!17515)) )
))
(declare-datatypes ((List!8240 0))(
  ( (Nil!8237) (Cons!8236 (h!9092 tuple2!8166) (t!14088 List!8240)) )
))
(declare-datatypes ((ListLongMap!7079 0))(
  ( (ListLongMap!7080 (toList!3555 List!8240)) )
))
(declare-fun lt!207047 () ListLongMap!7079)

(declare-fun lt!207043 () ListLongMap!7079)

(assert (=> b!457725 (= lt!207047 lt!207043)))

(declare-fun lt!207042 () ListLongMap!7079)

(declare-fun v!412 () V!17515)

(declare-fun +!1591 (ListLongMap!7079 tuple2!8166) ListLongMap!7079)

(assert (=> b!457725 (= lt!207043 (+!1591 lt!207042 (tuple2!8167 k!794 v!412)))))

(declare-fun minValue!515 () V!17515)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17515)

(declare-fun lt!207044 () array!28417)

(declare-fun lt!207046 () array!28415)

(declare-fun getCurrentListMapNoExtraKeys!1737 (array!28415 array!28417 (_ BitVec 32) (_ BitVec 32) V!17515 V!17515 (_ BitVec 32) Int) ListLongMap!7079)

(assert (=> b!457725 (= lt!207047 (getCurrentListMapNoExtraKeys!1737 lt!207046 lt!207044 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457725 (= lt!207042 (getCurrentListMapNoExtraKeys!1737 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13302 0))(
  ( (Unit!13303) )
))
(declare-fun lt!207041 () Unit!13302)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!750 (array!28415 array!28417 (_ BitVec 32) (_ BitVec 32) V!17515 V!17515 (_ BitVec 32) (_ BitVec 64) V!17515 (_ BitVec 32) Int) Unit!13302)

(assert (=> b!457725 (= lt!207041 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457726 () Bool)

(assert (=> b!457726 (= e!267304 (or (not (= (select (arr!13650 _keys!709) from!863) k!794)) (bvslt from!863 (size!14002 _keys!709))))))

(declare-fun lt!207045 () ListLongMap!7079)

(declare-fun get!6721 (ValueCell!5810 V!17515) V!17515)

(declare-fun dynLambda!881 (Int (_ BitVec 64)) V!17515)

(assert (=> b!457726 (= lt!207045 (+!1591 lt!207043 (tuple2!8167 (select (arr!13650 _keys!709) from!863) (get!6721 (select (arr!13651 _values!549) from!863) (dynLambda!881 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457727 () Bool)

(declare-fun e!267302 () Bool)

(declare-fun tp_is_empty!12307 () Bool)

(assert (=> b!457727 (= e!267302 tp_is_empty!12307)))

(declare-fun b!457728 () Bool)

(declare-fun res!273349 () Bool)

(assert (=> b!457728 (=> (not res!273349) (not e!267300))))

(assert (=> b!457728 (= res!273349 (arrayNoDuplicates!0 lt!207046 #b00000000000000000000000000000000 Nil!8236))))

(declare-fun b!457729 () Bool)

(declare-fun res!273347 () Bool)

(assert (=> b!457729 (=> (not res!273347) (not e!267301))))

(assert (=> b!457729 (= res!273347 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14002 _keys!709))))))

(declare-fun res!273348 () Bool)

(assert (=> start!41056 (=> (not res!273348) (not e!267301))))

(assert (=> start!41056 (= res!273348 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14002 _keys!709))))))

(assert (=> start!41056 e!267301))

(assert (=> start!41056 tp_is_empty!12307))

(assert (=> start!41056 tp!38737))

(assert (=> start!41056 true))

(declare-fun e!267303 () Bool)

(declare-fun array_inv!9884 (array!28417) Bool)

(assert (=> start!41056 (and (array_inv!9884 _values!549) e!267303)))

(declare-fun array_inv!9885 (array!28415) Bool)

(assert (=> start!41056 (array_inv!9885 _keys!709)))

(declare-fun mapNonEmpty!20104 () Bool)

(declare-fun mapRes!20104 () Bool)

(declare-fun tp!38736 () Bool)

(declare-fun e!267305 () Bool)

(assert (=> mapNonEmpty!20104 (= mapRes!20104 (and tp!38736 e!267305))))

(declare-fun mapValue!20104 () ValueCell!5810)

(declare-fun mapKey!20104 () (_ BitVec 32))

(declare-fun mapRest!20104 () (Array (_ BitVec 32) ValueCell!5810))

(assert (=> mapNonEmpty!20104 (= (arr!13651 _values!549) (store mapRest!20104 mapKey!20104 mapValue!20104))))

(declare-fun b!457730 () Bool)

(assert (=> b!457730 (= e!267301 e!267300)))

(declare-fun res!273352 () Bool)

(assert (=> b!457730 (=> (not res!273352) (not e!267300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28415 (_ BitVec 32)) Bool)

(assert (=> b!457730 (= res!273352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207046 mask!1025))))

(assert (=> b!457730 (= lt!207046 (array!28416 (store (arr!13650 _keys!709) i!563 k!794) (size!14002 _keys!709)))))

(declare-fun mapIsEmpty!20104 () Bool)

(assert (=> mapIsEmpty!20104 mapRes!20104))

(declare-fun b!457731 () Bool)

(assert (=> b!457731 (= e!267305 tp_is_empty!12307)))

(declare-fun b!457732 () Bool)

(declare-fun res!273351 () Bool)

(assert (=> b!457732 (=> (not res!273351) (not e!267301))))

(assert (=> b!457732 (= res!273351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457733 () Bool)

(assert (=> b!457733 (= e!267300 e!267299)))

(declare-fun res!273359 () Bool)

(assert (=> b!457733 (=> (not res!273359) (not e!267299))))

(assert (=> b!457733 (= res!273359 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!457733 (= lt!207045 (getCurrentListMapNoExtraKeys!1737 lt!207046 lt!207044 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457733 (= lt!207044 (array!28418 (store (arr!13651 _values!549) i!563 (ValueCellFull!5810 v!412)) (size!14003 _values!549)))))

(declare-fun lt!207048 () ListLongMap!7079)

(assert (=> b!457733 (= lt!207048 (getCurrentListMapNoExtraKeys!1737 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457734 () Bool)

(assert (=> b!457734 (= e!267303 (and e!267302 mapRes!20104))))

(declare-fun condMapEmpty!20104 () Bool)

(declare-fun mapDefault!20104 () ValueCell!5810)

