; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40574 () Bool)

(assert start!40574)

(declare-fun b_free!10585 () Bool)

(declare-fun b_next!10585 () Bool)

(assert (=> start!40574 (= b_free!10585 (not b_next!10585))))

(declare-fun tp!37574 () Bool)

(declare-fun b_and!18593 () Bool)

(assert (=> start!40574 (= tp!37574 b_and!18593)))

(declare-fun b!447332 () Bool)

(declare-fun res!265654 () Bool)

(declare-fun e!262686 () Bool)

(assert (=> b!447332 (=> (not res!265654) (not e!262686))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27653 0))(
  ( (array!27654 (arr!13272 (Array (_ BitVec 32) (_ BitVec 64))) (size!13624 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27653)

(assert (=> b!447332 (= res!265654 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13624 _keys!709))))))

(declare-fun b!447333 () Bool)

(declare-fun res!265652 () Bool)

(declare-fun e!262687 () Bool)

(assert (=> b!447333 (=> (not res!265652) (not e!262687))))

(declare-fun lt!203946 () array!27653)

(declare-datatypes ((List!7941 0))(
  ( (Nil!7938) (Cons!7937 (h!8793 (_ BitVec 64)) (t!13703 List!7941)) )
))
(declare-fun arrayNoDuplicates!0 (array!27653 (_ BitVec 32) List!7941) Bool)

(assert (=> b!447333 (= res!265652 (arrayNoDuplicates!0 lt!203946 #b00000000000000000000000000000000 Nil!7938))))

(declare-fun b!447334 () Bool)

(declare-fun res!265650 () Bool)

(assert (=> b!447334 (=> (not res!265650) (not e!262687))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!447334 (= res!265650 (bvsle from!863 i!563))))

(declare-fun b!447335 () Bool)

(declare-fun res!265655 () Bool)

(assert (=> b!447335 (=> (not res!265655) (not e!262686))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17003 0))(
  ( (V!17004 (val!6006 Int)) )
))
(declare-datatypes ((ValueCell!5618 0))(
  ( (ValueCellFull!5618 (v!8261 V!17003)) (EmptyCell!5618) )
))
(declare-datatypes ((array!27655 0))(
  ( (array!27656 (arr!13273 (Array (_ BitVec 32) ValueCell!5618)) (size!13625 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27655)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!447335 (= res!265655 (and (= (size!13625 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13624 _keys!709) (size!13625 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447336 () Bool)

(declare-fun res!265657 () Bool)

(assert (=> b!447336 (=> (not res!265657) (not e!262686))))

(assert (=> b!447336 (= res!265657 (or (= (select (arr!13272 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13272 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19518 () Bool)

(declare-fun mapRes!19518 () Bool)

(declare-fun tp!37575 () Bool)

(declare-fun e!262685 () Bool)

(assert (=> mapNonEmpty!19518 (= mapRes!19518 (and tp!37575 e!262685))))

(declare-fun mapRest!19518 () (Array (_ BitVec 32) ValueCell!5618))

(declare-fun mapValue!19518 () ValueCell!5618)

(declare-fun mapKey!19518 () (_ BitVec 32))

(assert (=> mapNonEmpty!19518 (= (arr!13273 _values!549) (store mapRest!19518 mapKey!19518 mapValue!19518))))

(declare-fun b!447337 () Bool)

(declare-fun e!262683 () Bool)

(declare-fun e!262688 () Bool)

(assert (=> b!447337 (= e!262683 (and e!262688 mapRes!19518))))

(declare-fun condMapEmpty!19518 () Bool)

(declare-fun mapDefault!19518 () ValueCell!5618)

