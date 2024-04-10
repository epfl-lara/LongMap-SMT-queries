; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40246 () Bool)

(assert start!40246)

(declare-fun b_free!10513 () Bool)

(declare-fun b_next!10513 () Bool)

(assert (=> start!40246 (= b_free!10513 (not b_next!10513))))

(declare-fun tp!37067 () Bool)

(declare-fun b_and!18481 () Bool)

(assert (=> start!40246 (= tp!37067 b_and!18481)))

(declare-fun res!261507 () Bool)

(declare-fun e!260034 () Bool)

(assert (=> start!40246 (=> (not res!261507) (not e!260034))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27141 0))(
  ( (array!27142 (arr!13020 (Array (_ BitVec 32) (_ BitVec 64))) (size!13372 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27141)

(assert (=> start!40246 (= res!261507 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13372 _keys!709))))))

(assert (=> start!40246 e!260034))

(declare-fun tp_is_empty!11665 () Bool)

(assert (=> start!40246 tp_is_empty!11665))

(assert (=> start!40246 tp!37067))

(assert (=> start!40246 true))

(declare-datatypes ((V!16659 0))(
  ( (V!16660 (val!5877 Int)) )
))
(declare-datatypes ((ValueCell!5489 0))(
  ( (ValueCellFull!5489 (v!8124 V!16659)) (EmptyCell!5489) )
))
(declare-datatypes ((array!27143 0))(
  ( (array!27144 (arr!13021 (Array (_ BitVec 32) ValueCell!5489)) (size!13373 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27143)

(declare-fun e!260029 () Bool)

(declare-fun array_inv!9448 (array!27143) Bool)

(assert (=> start!40246 (and (array_inv!9448 _values!549) e!260029)))

(declare-fun array_inv!9449 (array!27141) Bool)

(assert (=> start!40246 (array_inv!9449 _keys!709)))

(declare-fun mapIsEmpty!19119 () Bool)

(declare-fun mapRes!19119 () Bool)

(assert (=> mapIsEmpty!19119 mapRes!19119))

(declare-fun b!441668 () Bool)

(declare-fun res!261495 () Bool)

(assert (=> b!441668 (=> (not res!261495) (not e!260034))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441668 (= res!261495 (or (= (select (arr!13020 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13020 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441669 () Bool)

(declare-fun res!261501 () Bool)

(assert (=> b!441669 (=> (not res!261501) (not e!260034))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441669 (= res!261501 (validMask!0 mask!1025))))

(declare-fun b!441670 () Bool)

(declare-fun res!261497 () Bool)

(assert (=> b!441670 (=> (not res!261497) (not e!260034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27141 (_ BitVec 32)) Bool)

(assert (=> b!441670 (= res!261497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441671 () Bool)

(declare-fun res!261506 () Bool)

(assert (=> b!441671 (=> (not res!261506) (not e!260034))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441671 (= res!261506 (validKeyInArray!0 k!794))))

(declare-fun b!441672 () Bool)

(declare-fun res!261496 () Bool)

(assert (=> b!441672 (=> (not res!261496) (not e!260034))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!441672 (= res!261496 (and (= (size!13373 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13372 _keys!709) (size!13373 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19119 () Bool)

(declare-fun tp!37068 () Bool)

(declare-fun e!260033 () Bool)

(assert (=> mapNonEmpty!19119 (= mapRes!19119 (and tp!37068 e!260033))))

(declare-fun mapValue!19119 () ValueCell!5489)

(declare-fun mapKey!19119 () (_ BitVec 32))

(declare-fun mapRest!19119 () (Array (_ BitVec 32) ValueCell!5489))

(assert (=> mapNonEmpty!19119 (= (arr!13021 _values!549) (store mapRest!19119 mapKey!19119 mapValue!19119))))

(declare-fun b!441673 () Bool)

(declare-fun res!261503 () Bool)

(assert (=> b!441673 (=> (not res!261503) (not e!260034))))

(assert (=> b!441673 (= res!261503 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13372 _keys!709))))))

(declare-fun b!441674 () Bool)

(declare-fun e!260030 () Bool)

(assert (=> b!441674 (= e!260034 e!260030)))

(declare-fun res!261505 () Bool)

(assert (=> b!441674 (=> (not res!261505) (not e!260030))))

(declare-fun lt!202966 () array!27141)

(assert (=> b!441674 (= res!261505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202966 mask!1025))))

(assert (=> b!441674 (= lt!202966 (array!27142 (store (arr!13020 _keys!709) i!563 k!794) (size!13372 _keys!709)))))

(declare-fun b!441675 () Bool)

(declare-fun e!260031 () Bool)

(assert (=> b!441675 (= e!260031 (not true))))

(declare-fun minValue!515 () V!16659)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16659)

(declare-fun v!412 () V!16659)

(declare-fun lt!202968 () array!27143)

(declare-datatypes ((tuple2!7820 0))(
  ( (tuple2!7821 (_1!3921 (_ BitVec 64)) (_2!3921 V!16659)) )
))
(declare-datatypes ((List!7816 0))(
  ( (Nil!7813) (Cons!7812 (h!8668 tuple2!7820) (t!13572 List!7816)) )
))
(declare-datatypes ((ListLongMap!6733 0))(
  ( (ListLongMap!6734 (toList!3382 List!7816)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1571 (array!27141 array!27143 (_ BitVec 32) (_ BitVec 32) V!16659 V!16659 (_ BitVec 32) Int) ListLongMap!6733)

(declare-fun +!1518 (ListLongMap!6733 tuple2!7820) ListLongMap!6733)

(assert (=> b!441675 (= (getCurrentListMapNoExtraKeys!1571 lt!202966 lt!202968 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1518 (getCurrentListMapNoExtraKeys!1571 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7821 k!794 v!412)))))

(declare-datatypes ((Unit!13140 0))(
  ( (Unit!13141) )
))
(declare-fun lt!202969 () Unit!13140)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!687 (array!27141 array!27143 (_ BitVec 32) (_ BitVec 32) V!16659 V!16659 (_ BitVec 32) (_ BitVec 64) V!16659 (_ BitVec 32) Int) Unit!13140)

(assert (=> b!441675 (= lt!202969 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!687 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441676 () Bool)

(assert (=> b!441676 (= e!260033 tp_is_empty!11665)))

(declare-fun b!441677 () Bool)

(declare-fun res!261500 () Bool)

(assert (=> b!441677 (=> (not res!261500) (not e!260034))))

(declare-fun arrayContainsKey!0 (array!27141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441677 (= res!261500 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!441678 () Bool)

(assert (=> b!441678 (= e!260030 e!260031)))

(declare-fun res!261504 () Bool)

(assert (=> b!441678 (=> (not res!261504) (not e!260031))))

(assert (=> b!441678 (= res!261504 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202970 () ListLongMap!6733)

(assert (=> b!441678 (= lt!202970 (getCurrentListMapNoExtraKeys!1571 lt!202966 lt!202968 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441678 (= lt!202968 (array!27144 (store (arr!13021 _values!549) i!563 (ValueCellFull!5489 v!412)) (size!13373 _values!549)))))

(declare-fun lt!202967 () ListLongMap!6733)

(assert (=> b!441678 (= lt!202967 (getCurrentListMapNoExtraKeys!1571 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441679 () Bool)

(declare-fun res!261499 () Bool)

(assert (=> b!441679 (=> (not res!261499) (not e!260030))))

(declare-datatypes ((List!7817 0))(
  ( (Nil!7814) (Cons!7813 (h!8669 (_ BitVec 64)) (t!13573 List!7817)) )
))
(declare-fun arrayNoDuplicates!0 (array!27141 (_ BitVec 32) List!7817) Bool)

(assert (=> b!441679 (= res!261499 (arrayNoDuplicates!0 lt!202966 #b00000000000000000000000000000000 Nil!7814))))

(declare-fun b!441680 () Bool)

(declare-fun e!260032 () Bool)

(assert (=> b!441680 (= e!260032 tp_is_empty!11665)))

(declare-fun b!441681 () Bool)

(declare-fun res!261502 () Bool)

(assert (=> b!441681 (=> (not res!261502) (not e!260030))))

(assert (=> b!441681 (= res!261502 (bvsle from!863 i!563))))

(declare-fun b!441682 () Bool)

(assert (=> b!441682 (= e!260029 (and e!260032 mapRes!19119))))

(declare-fun condMapEmpty!19119 () Bool)

(declare-fun mapDefault!19119 () ValueCell!5489)

