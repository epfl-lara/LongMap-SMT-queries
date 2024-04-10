; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38722 () Bool)

(assert start!38722)

(declare-fun b_free!9259 () Bool)

(declare-fun b_next!9259 () Bool)

(assert (=> start!38722 (= b_free!9259 (not b_next!9259))))

(declare-fun tp!32900 () Bool)

(declare-fun b_and!16645 () Bool)

(assert (=> start!38722 (= tp!32900 b_and!16645)))

(declare-fun b!403063 () Bool)

(declare-fun res!232237 () Bool)

(declare-fun e!242722 () Bool)

(assert (=> b!403063 (=> (not res!232237) (not e!242722))))

(declare-datatypes ((array!24187 0))(
  ( (array!24188 (arr!11543 (Array (_ BitVec 32) (_ BitVec 64))) (size!11895 (_ BitVec 32))) )
))
(declare-fun lt!188002 () array!24187)

(declare-datatypes ((List!6717 0))(
  ( (Nil!6714) (Cons!6713 (h!7569 (_ BitVec 64)) (t!11891 List!6717)) )
))
(declare-fun arrayNoDuplicates!0 (array!24187 (_ BitVec 32) List!6717) Bool)

(assert (=> b!403063 (= res!232237 (arrayNoDuplicates!0 lt!188002 #b00000000000000000000000000000000 Nil!6714))))

(declare-fun e!242724 () Bool)

(declare-fun b!403064 () Bool)

(declare-datatypes ((V!14627 0))(
  ( (V!14628 (val!5115 Int)) )
))
(declare-datatypes ((tuple2!6796 0))(
  ( (tuple2!6797 (_1!3409 (_ BitVec 64)) (_2!3409 V!14627)) )
))
(declare-datatypes ((List!6718 0))(
  ( (Nil!6715) (Cons!6714 (h!7570 tuple2!6796) (t!11892 List!6718)) )
))
(declare-datatypes ((ListLongMap!5709 0))(
  ( (ListLongMap!5710 (toList!2870 List!6718)) )
))
(declare-fun call!28441 () ListLongMap!5709)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun call!28442 () ListLongMap!5709)

(declare-fun v!412 () V!14627)

(declare-fun +!1146 (ListLongMap!5709 tuple2!6796) ListLongMap!5709)

(assert (=> b!403064 (= e!242724 (= call!28442 (+!1146 call!28441 (tuple2!6797 k!794 v!412))))))

(declare-fun b!403065 () Bool)

(declare-fun res!232234 () Bool)

(declare-fun e!242727 () Bool)

(assert (=> b!403065 (=> (not res!232234) (not e!242727))))

(declare-fun _keys!709 () array!24187)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24187 (_ BitVec 32)) Bool)

(assert (=> b!403065 (= res!232234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4727 0))(
  ( (ValueCellFull!4727 (v!7362 V!14627)) (EmptyCell!4727) )
))
(declare-datatypes ((array!24189 0))(
  ( (array!24190 (arr!11544 (Array (_ BitVec 32) ValueCell!4727)) (size!11896 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24189)

(declare-fun zeroValue!515 () V!14627)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54845 () Bool)

(declare-fun minValue!515 () V!14627)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun bm!28438 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1080 (array!24187 array!24189 (_ BitVec 32) (_ BitVec 32) V!14627 V!14627 (_ BitVec 32) Int) ListLongMap!5709)

(assert (=> bm!28438 (= call!28441 (getCurrentListMapNoExtraKeys!1080 (ite c!54845 _keys!709 lt!188002) (ite c!54845 _values!549 (array!24190 (store (arr!11544 _values!549) i!563 (ValueCellFull!4727 v!412)) (size!11896 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16833 () Bool)

(declare-fun mapRes!16833 () Bool)

(assert (=> mapIsEmpty!16833 mapRes!16833))

(declare-fun bm!28439 () Bool)

(assert (=> bm!28439 (= call!28442 (getCurrentListMapNoExtraKeys!1080 (ite c!54845 lt!188002 _keys!709) (ite c!54845 (array!24190 (store (arr!11544 _values!549) i!563 (ValueCellFull!4727 v!412)) (size!11896 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403066 () Bool)

(declare-fun res!232241 () Bool)

(assert (=> b!403066 (=> (not res!232241) (not e!242727))))

(assert (=> b!403066 (= res!232241 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11895 _keys!709))))))

(declare-fun mapNonEmpty!16833 () Bool)

(declare-fun tp!32901 () Bool)

(declare-fun e!242721 () Bool)

(assert (=> mapNonEmpty!16833 (= mapRes!16833 (and tp!32901 e!242721))))

(declare-fun mapValue!16833 () ValueCell!4727)

(declare-fun mapRest!16833 () (Array (_ BitVec 32) ValueCell!4727))

(declare-fun mapKey!16833 () (_ BitVec 32))

(assert (=> mapNonEmpty!16833 (= (arr!11544 _values!549) (store mapRest!16833 mapKey!16833 mapValue!16833))))

(declare-fun b!403067 () Bool)

(declare-fun res!232243 () Bool)

(assert (=> b!403067 (=> (not res!232243) (not e!242727))))

(assert (=> b!403067 (= res!232243 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6714))))

(declare-fun b!403068 () Bool)

(declare-fun res!232236 () Bool)

(assert (=> b!403068 (=> (not res!232236) (not e!242727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403068 (= res!232236 (validMask!0 mask!1025))))

(declare-fun res!232238 () Bool)

(assert (=> start!38722 (=> (not res!232238) (not e!242727))))

(assert (=> start!38722 (= res!232238 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11895 _keys!709))))))

(assert (=> start!38722 e!242727))

(declare-fun tp_is_empty!10141 () Bool)

(assert (=> start!38722 tp_is_empty!10141))

(assert (=> start!38722 tp!32900))

(assert (=> start!38722 true))

(declare-fun e!242726 () Bool)

(declare-fun array_inv!8446 (array!24189) Bool)

(assert (=> start!38722 (and (array_inv!8446 _values!549) e!242726)))

(declare-fun array_inv!8447 (array!24187) Bool)

(assert (=> start!38722 (array_inv!8447 _keys!709)))

(declare-fun b!403069 () Bool)

(declare-fun res!232235 () Bool)

(assert (=> b!403069 (=> (not res!232235) (not e!242727))))

(assert (=> b!403069 (= res!232235 (or (= (select (arr!11543 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11543 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403070 () Bool)

(assert (=> b!403070 (= e!242727 e!242722)))

(declare-fun res!232239 () Bool)

(assert (=> b!403070 (=> (not res!232239) (not e!242722))))

(assert (=> b!403070 (= res!232239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188002 mask!1025))))

(assert (=> b!403070 (= lt!188002 (array!24188 (store (arr!11543 _keys!709) i!563 k!794) (size!11895 _keys!709)))))

(declare-fun b!403071 () Bool)

(declare-fun res!232245 () Bool)

(assert (=> b!403071 (=> (not res!232245) (not e!242727))))

(assert (=> b!403071 (= res!232245 (and (= (size!11896 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11895 _keys!709) (size!11896 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403072 () Bool)

(assert (=> b!403072 (= e!242721 tp_is_empty!10141)))

(declare-fun b!403073 () Bool)

(declare-fun res!232242 () Bool)

(assert (=> b!403073 (=> (not res!232242) (not e!242722))))

(assert (=> b!403073 (= res!232242 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11895 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403074 () Bool)

(declare-fun e!242723 () Bool)

(assert (=> b!403074 (= e!242723 tp_is_empty!10141)))

(declare-fun b!403075 () Bool)

(declare-fun res!232244 () Bool)

(assert (=> b!403075 (=> (not res!232244) (not e!242727))))

(declare-fun arrayContainsKey!0 (array!24187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403075 (= res!232244 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!403076 () Bool)

(assert (=> b!403076 (= e!242724 (= call!28441 call!28442))))

(declare-fun b!403077 () Bool)

(declare-fun res!232240 () Bool)

(assert (=> b!403077 (=> (not res!232240) (not e!242727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403077 (= res!232240 (validKeyInArray!0 k!794))))

(declare-fun b!403078 () Bool)

(assert (=> b!403078 (= e!242726 (and e!242723 mapRes!16833))))

(declare-fun condMapEmpty!16833 () Bool)

(declare-fun mapDefault!16833 () ValueCell!4727)

