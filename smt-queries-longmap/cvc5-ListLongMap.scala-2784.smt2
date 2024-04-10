; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40592 () Bool)

(assert start!40592)

(declare-fun b_free!10603 () Bool)

(declare-fun b_next!10603 () Bool)

(assert (=> start!40592 (= b_free!10603 (not b_next!10603))))

(declare-fun tp!37629 () Bool)

(declare-fun b_and!18611 () Bool)

(assert (=> start!40592 (= tp!37629 b_and!18611)))

(declare-fun b!447737 () Bool)

(declare-fun e!262847 () Bool)

(assert (=> b!447737 (= e!262847 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17027 0))(
  ( (V!17028 (val!6015 Int)) )
))
(declare-datatypes ((ValueCell!5627 0))(
  ( (ValueCellFull!5627 (v!8270 V!17027)) (EmptyCell!5627) )
))
(declare-datatypes ((array!27689 0))(
  ( (array!27690 (arr!13290 (Array (_ BitVec 32) ValueCell!5627)) (size!13642 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27689)

(declare-fun zeroValue!515 () V!17027)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!7888 0))(
  ( (tuple2!7889 (_1!3955 (_ BitVec 64)) (_2!3955 V!17027)) )
))
(declare-datatypes ((List!7953 0))(
  ( (Nil!7950) (Cons!7949 (h!8805 tuple2!7888) (t!13715 List!7953)) )
))
(declare-datatypes ((ListLongMap!6801 0))(
  ( (ListLongMap!6802 (toList!3416 List!7953)) )
))
(declare-fun lt!204027 () ListLongMap!6801)

(declare-fun v!412 () V!17027)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!17027)

(declare-datatypes ((array!27691 0))(
  ( (array!27692 (arr!13291 (Array (_ BitVec 32) (_ BitVec 64))) (size!13643 (_ BitVec 32))) )
))
(declare-fun lt!204026 () array!27691)

(declare-fun getCurrentListMapNoExtraKeys!1602 (array!27691 array!27689 (_ BitVec 32) (_ BitVec 32) V!17027 V!17027 (_ BitVec 32) Int) ListLongMap!6801)

(assert (=> b!447737 (= lt!204027 (getCurrentListMapNoExtraKeys!1602 lt!204026 (array!27690 (store (arr!13290 _values!549) i!563 (ValueCellFull!5627 v!412)) (size!13642 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204025 () ListLongMap!6801)

(declare-fun _keys!709 () array!27691)

(assert (=> b!447737 (= lt!204025 (getCurrentListMapNoExtraKeys!1602 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447738 () Bool)

(declare-fun res!265981 () Bool)

(declare-fun e!262846 () Bool)

(assert (=> b!447738 (=> (not res!265981) (not e!262846))))

(declare-datatypes ((List!7954 0))(
  ( (Nil!7951) (Cons!7950 (h!8806 (_ BitVec 64)) (t!13716 List!7954)) )
))
(declare-fun arrayNoDuplicates!0 (array!27691 (_ BitVec 32) List!7954) Bool)

(assert (=> b!447738 (= res!265981 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7951))))

(declare-fun b!447739 () Bool)

(declare-fun res!265977 () Bool)

(assert (=> b!447739 (=> (not res!265977) (not e!262847))))

(assert (=> b!447739 (= res!265977 (bvsle from!863 i!563))))

(declare-fun b!447740 () Bool)

(declare-fun res!265979 () Bool)

(assert (=> b!447740 (=> (not res!265979) (not e!262847))))

(assert (=> b!447740 (= res!265979 (arrayNoDuplicates!0 lt!204026 #b00000000000000000000000000000000 Nil!7951))))

(declare-fun b!447741 () Bool)

(declare-fun res!265976 () Bool)

(assert (=> b!447741 (=> (not res!265976) (not e!262846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447741 (= res!265976 (validMask!0 mask!1025))))

(declare-fun b!447742 () Bool)

(declare-fun e!262850 () Bool)

(declare-fun e!262849 () Bool)

(declare-fun mapRes!19545 () Bool)

(assert (=> b!447742 (= e!262850 (and e!262849 mapRes!19545))))

(declare-fun condMapEmpty!19545 () Bool)

(declare-fun mapDefault!19545 () ValueCell!5627)

