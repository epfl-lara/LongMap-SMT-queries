; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39328 () Bool)

(assert start!39328)

(declare-fun b_free!9595 () Bool)

(declare-fun b_next!9595 () Bool)

(assert (=> start!39328 (= b_free!9595 (not b_next!9595))))

(declare-fun tp!34314 () Bool)

(declare-fun b_and!17065 () Bool)

(assert (=> start!39328 (= tp!34314 b_and!17065)))

(declare-fun b!416840 () Bool)

(declare-fun e!248785 () Bool)

(declare-datatypes ((V!15435 0))(
  ( (V!15436 (val!5418 Int)) )
))
(declare-datatypes ((tuple2!7070 0))(
  ( (tuple2!7071 (_1!3546 (_ BitVec 64)) (_2!3546 V!15435)) )
))
(declare-datatypes ((List!7088 0))(
  ( (Nil!7085) (Cons!7084 (h!7940 tuple2!7070) (t!12348 List!7088)) )
))
(declare-datatypes ((ListLongMap!5983 0))(
  ( (ListLongMap!5984 (toList!3007 List!7088)) )
))
(declare-fun call!28963 () ListLongMap!5983)

(declare-fun call!28964 () ListLongMap!5983)

(assert (=> b!416840 (= e!248785 (= call!28963 call!28964))))

(declare-fun b!416841 () Bool)

(declare-fun res!242681 () Bool)

(declare-fun e!248784 () Bool)

(assert (=> b!416841 (=> (not res!242681) (not e!248784))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25349 0))(
  ( (array!25350 (arr!12124 (Array (_ BitVec 32) (_ BitVec 64))) (size!12476 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25349)

(assert (=> b!416841 (= res!242681 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12476 _keys!709))))))

(declare-fun b!416842 () Bool)

(declare-fun res!242679 () Bool)

(assert (=> b!416842 (=> (not res!242679) (not e!248784))))

(declare-datatypes ((List!7089 0))(
  ( (Nil!7086) (Cons!7085 (h!7941 (_ BitVec 64)) (t!12349 List!7089)) )
))
(declare-fun arrayNoDuplicates!0 (array!25349 (_ BitVec 32) List!7089) Bool)

(assert (=> b!416842 (= res!242679 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7086))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun b!416843 () Bool)

(declare-fun v!412 () V!15435)

(declare-fun +!1209 (ListLongMap!5983 tuple2!7070) ListLongMap!5983)

(assert (=> b!416843 (= e!248785 (= call!28964 (+!1209 call!28963 (tuple2!7071 k!794 v!412))))))

(declare-fun minValue!515 () V!15435)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5030 0))(
  ( (ValueCellFull!5030 (v!7665 V!15435)) (EmptyCell!5030) )
))
(declare-datatypes ((array!25351 0))(
  ( (array!25352 (arr!12125 (Array (_ BitVec 32) ValueCell!5030)) (size!12477 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25351)

(declare-fun zeroValue!515 () V!15435)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!190899 () array!25349)

(declare-fun c!55106 () Bool)

(declare-fun bm!28960 () Bool)

(declare-fun lt!190900 () array!25351)

(declare-fun getCurrentListMapNoExtraKeys!1212 (array!25349 array!25351 (_ BitVec 32) (_ BitVec 32) V!15435 V!15435 (_ BitVec 32) Int) ListLongMap!5983)

(assert (=> bm!28960 (= call!28964 (getCurrentListMapNoExtraKeys!1212 (ite c!55106 lt!190899 _keys!709) (ite c!55106 lt!190900 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17742 () Bool)

(declare-fun mapRes!17742 () Bool)

(declare-fun tp!34313 () Bool)

(declare-fun e!248782 () Bool)

(assert (=> mapNonEmpty!17742 (= mapRes!17742 (and tp!34313 e!248782))))

(declare-fun mapValue!17742 () ValueCell!5030)

(declare-fun mapRest!17742 () (Array (_ BitVec 32) ValueCell!5030))

(declare-fun mapKey!17742 () (_ BitVec 32))

(assert (=> mapNonEmpty!17742 (= (arr!12125 _values!549) (store mapRest!17742 mapKey!17742 mapValue!17742))))

(declare-fun b!416844 () Bool)

(declare-fun res!242678 () Bool)

(assert (=> b!416844 (=> (not res!242678) (not e!248784))))

(assert (=> b!416844 (= res!242678 (and (= (size!12477 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12476 _keys!709) (size!12477 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416845 () Bool)

(declare-fun e!248788 () Bool)

(declare-fun tp_is_empty!10747 () Bool)

(assert (=> b!416845 (= e!248788 tp_is_empty!10747)))

(declare-fun b!416846 () Bool)

(declare-fun e!248787 () Bool)

(assert (=> b!416846 (= e!248784 e!248787)))

(declare-fun res!242684 () Bool)

(assert (=> b!416846 (=> (not res!242684) (not e!248787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25349 (_ BitVec 32)) Bool)

(assert (=> b!416846 (= res!242684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190899 mask!1025))))

(assert (=> b!416846 (= lt!190899 (array!25350 (store (arr!12124 _keys!709) i!563 k!794) (size!12476 _keys!709)))))

(declare-fun b!416847 () Bool)

(declare-fun e!248786 () Bool)

(assert (=> b!416847 (= e!248786 (and e!248788 mapRes!17742))))

(declare-fun condMapEmpty!17742 () Bool)

(declare-fun mapDefault!17742 () ValueCell!5030)

