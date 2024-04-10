; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38690 () Bool)

(assert start!38690)

(declare-fun b_free!9227 () Bool)

(declare-fun b_next!9227 () Bool)

(assert (=> start!38690 (= b_free!9227 (not b_next!9227))))

(declare-fun tp!32804 () Bool)

(declare-fun b_and!16613 () Bool)

(assert (=> start!38690 (= tp!32804 b_and!16613)))

(declare-fun b!402247 () Bool)

(declare-fun res!231663 () Bool)

(declare-fun e!242387 () Bool)

(assert (=> b!402247 (=> (not res!231663) (not e!242387))))

(declare-datatypes ((array!24123 0))(
  ( (array!24124 (arr!11511 (Array (_ BitVec 32) (_ BitVec 64))) (size!11863 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24123)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24123 (_ BitVec 32)) Bool)

(assert (=> b!402247 (= res!231663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16785 () Bool)

(declare-fun mapRes!16785 () Bool)

(assert (=> mapIsEmpty!16785 mapRes!16785))

(declare-fun b!402248 () Bool)

(declare-fun res!231669 () Bool)

(assert (=> b!402248 (=> (not res!231669) (not e!242387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402248 (= res!231669 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16785 () Bool)

(declare-fun tp!32805 () Bool)

(declare-fun e!242385 () Bool)

(assert (=> mapNonEmpty!16785 (= mapRes!16785 (and tp!32805 e!242385))))

(declare-datatypes ((V!14583 0))(
  ( (V!14584 (val!5099 Int)) )
))
(declare-datatypes ((ValueCell!4711 0))(
  ( (ValueCellFull!4711 (v!7346 V!14583)) (EmptyCell!4711) )
))
(declare-datatypes ((array!24125 0))(
  ( (array!24126 (arr!11512 (Array (_ BitVec 32) ValueCell!4711)) (size!11864 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24125)

(declare-fun mapRest!16785 () (Array (_ BitVec 32) ValueCell!4711))

(declare-fun mapValue!16785 () ValueCell!4711)

(declare-fun mapKey!16785 () (_ BitVec 32))

(assert (=> mapNonEmpty!16785 (= (arr!11512 _values!549) (store mapRest!16785 mapKey!16785 mapValue!16785))))

(declare-fun res!231664 () Bool)

(assert (=> start!38690 (=> (not res!231664) (not e!242387))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38690 (= res!231664 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11863 _keys!709))))))

(assert (=> start!38690 e!242387))

(declare-fun tp_is_empty!10109 () Bool)

(assert (=> start!38690 tp_is_empty!10109))

(assert (=> start!38690 tp!32804))

(assert (=> start!38690 true))

(declare-fun e!242388 () Bool)

(declare-fun array_inv!8424 (array!24125) Bool)

(assert (=> start!38690 (and (array_inv!8424 _values!549) e!242388)))

(declare-fun array_inv!8425 (array!24123) Bool)

(assert (=> start!38690 (array_inv!8425 _keys!709)))

(declare-fun b!402249 () Bool)

(declare-fun res!231667 () Bool)

(assert (=> b!402249 (=> (not res!231667) (not e!242387))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!402249 (= res!231667 (and (= (size!11864 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11863 _keys!709) (size!11864 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402250 () Bool)

(declare-fun res!231661 () Bool)

(declare-fun e!242386 () Bool)

(assert (=> b!402250 (=> (not res!231661) (not e!242386))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402250 (= res!231661 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11863 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402251 () Bool)

(declare-fun e!242389 () Bool)

(declare-datatypes ((tuple2!6772 0))(
  ( (tuple2!6773 (_1!3397 (_ BitVec 64)) (_2!3397 V!14583)) )
))
(declare-datatypes ((List!6695 0))(
  ( (Nil!6692) (Cons!6691 (h!7547 tuple2!6772) (t!11869 List!6695)) )
))
(declare-datatypes ((ListLongMap!5685 0))(
  ( (ListLongMap!5686 (toList!2858 List!6695)) )
))
(declare-fun call!28345 () ListLongMap!5685)

(declare-fun call!28346 () ListLongMap!5685)

(assert (=> b!402251 (= e!242389 (= call!28345 call!28346))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!14583)

(declare-fun b!402252 () Bool)

(declare-fun +!1137 (ListLongMap!5685 tuple2!6772) ListLongMap!5685)

(assert (=> b!402252 (= e!242389 (= call!28346 (+!1137 call!28345 (tuple2!6773 k!794 v!412))))))

(declare-fun b!402253 () Bool)

(declare-fun res!231659 () Bool)

(assert (=> b!402253 (=> (not res!231659) (not e!242387))))

(declare-fun arrayContainsKey!0 (array!24123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402253 (= res!231659 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!402254 () Bool)

(assert (=> b!402254 (= e!242387 e!242386)))

(declare-fun res!231666 () Bool)

(assert (=> b!402254 (=> (not res!231666) (not e!242386))))

(declare-fun lt!187906 () array!24123)

(assert (=> b!402254 (= res!231666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187906 mask!1025))))

(assert (=> b!402254 (= lt!187906 (array!24124 (store (arr!11511 _keys!709) i!563 k!794) (size!11863 _keys!709)))))

(declare-fun b!402255 () Bool)

(declare-fun res!231660 () Bool)

(assert (=> b!402255 (=> (not res!231660) (not e!242386))))

(declare-datatypes ((List!6696 0))(
  ( (Nil!6693) (Cons!6692 (h!7548 (_ BitVec 64)) (t!11870 List!6696)) )
))
(declare-fun arrayNoDuplicates!0 (array!24123 (_ BitVec 32) List!6696) Bool)

(assert (=> b!402255 (= res!231660 (arrayNoDuplicates!0 lt!187906 #b00000000000000000000000000000000 Nil!6693))))

(declare-fun b!402256 () Bool)

(declare-fun e!242390 () Bool)

(assert (=> b!402256 (= e!242390 tp_is_empty!10109)))

(declare-fun b!402257 () Bool)

(assert (=> b!402257 (= e!242385 tp_is_empty!10109)))

(declare-fun b!402258 () Bool)

(declare-fun res!231662 () Bool)

(assert (=> b!402258 (=> (not res!231662) (not e!242387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402258 (= res!231662 (validKeyInArray!0 k!794))))

(declare-fun b!402259 () Bool)

(declare-fun res!231668 () Bool)

(assert (=> b!402259 (=> (not res!231668) (not e!242387))))

(assert (=> b!402259 (= res!231668 (or (= (select (arr!11511 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11511 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402260 () Bool)

(assert (=> b!402260 (= e!242386 (not true))))

(assert (=> b!402260 e!242389))

(declare-fun c!54797 () Bool)

(assert (=> b!402260 (= c!54797 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14583)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14583)

(declare-datatypes ((Unit!12178 0))(
  ( (Unit!12179) )
))
(declare-fun lt!187907 () Unit!12178)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!347 (array!24123 array!24125 (_ BitVec 32) (_ BitVec 32) V!14583 V!14583 (_ BitVec 32) (_ BitVec 64) V!14583 (_ BitVec 32) Int) Unit!12178)

(assert (=> b!402260 (= lt!187907 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!347 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402261 () Bool)

(assert (=> b!402261 (= e!242388 (and e!242390 mapRes!16785))))

(declare-fun condMapEmpty!16785 () Bool)

(declare-fun mapDefault!16785 () ValueCell!4711)

