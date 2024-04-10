; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40572 () Bool)

(assert start!40572)

(declare-fun b_free!10583 () Bool)

(declare-fun b_next!10583 () Bool)

(assert (=> start!40572 (= b_free!10583 (not b_next!10583))))

(declare-fun tp!37569 () Bool)

(declare-fun b_and!18591 () Bool)

(assert (=> start!40572 (= tp!37569 b_and!18591)))

(declare-fun b!447287 () Bool)

(declare-fun res!265621 () Bool)

(declare-fun e!262668 () Bool)

(assert (=> b!447287 (=> (not res!265621) (not e!262668))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447287 (= res!265621 (validMask!0 mask!1025))))

(declare-fun b!447288 () Bool)

(declare-fun res!265620 () Bool)

(assert (=> b!447288 (=> (not res!265620) (not e!262668))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16999 0))(
  ( (V!17000 (val!6005 Int)) )
))
(declare-datatypes ((ValueCell!5617 0))(
  ( (ValueCellFull!5617 (v!8260 V!16999)) (EmptyCell!5617) )
))
(declare-datatypes ((array!27649 0))(
  ( (array!27650 (arr!13270 (Array (_ BitVec 32) ValueCell!5617)) (size!13622 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27649)

(declare-datatypes ((array!27651 0))(
  ( (array!27652 (arr!13271 (Array (_ BitVec 32) (_ BitVec 64))) (size!13623 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27651)

(assert (=> b!447288 (= res!265620 (and (= (size!13622 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13623 _keys!709) (size!13622 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447289 () Bool)

(declare-fun res!265614 () Bool)

(assert (=> b!447289 (=> (not res!265614) (not e!262668))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447289 (= res!265614 (or (= (select (arr!13271 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13271 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447290 () Bool)

(declare-fun res!265623 () Bool)

(assert (=> b!447290 (=> (not res!265623) (not e!262668))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447290 (= res!265623 (validKeyInArray!0 k!794))))

(declare-fun b!447291 () Bool)

(declare-fun e!262670 () Bool)

(assert (=> b!447291 (= e!262668 e!262670)))

(declare-fun res!265622 () Bool)

(assert (=> b!447291 (=> (not res!265622) (not e!262670))))

(declare-fun lt!203937 () array!27651)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27651 (_ BitVec 32)) Bool)

(assert (=> b!447291 (= res!265622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203937 mask!1025))))

(assert (=> b!447291 (= lt!203937 (array!27652 (store (arr!13271 _keys!709) i!563 k!794) (size!13623 _keys!709)))))

(declare-fun b!447292 () Bool)

(declare-fun res!265617 () Bool)

(assert (=> b!447292 (=> (not res!265617) (not e!262670))))

(declare-datatypes ((List!7940 0))(
  ( (Nil!7937) (Cons!7936 (h!8792 (_ BitVec 64)) (t!13702 List!7940)) )
))
(declare-fun arrayNoDuplicates!0 (array!27651 (_ BitVec 32) List!7940) Bool)

(assert (=> b!447292 (= res!265617 (arrayNoDuplicates!0 lt!203937 #b00000000000000000000000000000000 Nil!7937))))

(declare-fun mapNonEmpty!19515 () Bool)

(declare-fun mapRes!19515 () Bool)

(declare-fun tp!37568 () Bool)

(declare-fun e!262666 () Bool)

(assert (=> mapNonEmpty!19515 (= mapRes!19515 (and tp!37568 e!262666))))

(declare-fun mapValue!19515 () ValueCell!5617)

(declare-fun mapKey!19515 () (_ BitVec 32))

(declare-fun mapRest!19515 () (Array (_ BitVec 32) ValueCell!5617))

(assert (=> mapNonEmpty!19515 (= (arr!13270 _values!549) (store mapRest!19515 mapKey!19515 mapValue!19515))))

(declare-fun res!265612 () Bool)

(assert (=> start!40572 (=> (not res!265612) (not e!262668))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40572 (= res!265612 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13623 _keys!709))))))

(assert (=> start!40572 e!262668))

(declare-fun tp_is_empty!11921 () Bool)

(assert (=> start!40572 tp_is_empty!11921))

(assert (=> start!40572 tp!37569))

(assert (=> start!40572 true))

(declare-fun e!262669 () Bool)

(declare-fun array_inv!9624 (array!27649) Bool)

(assert (=> start!40572 (and (array_inv!9624 _values!549) e!262669)))

(declare-fun array_inv!9625 (array!27651) Bool)

(assert (=> start!40572 (array_inv!9625 _keys!709)))

(declare-fun mapIsEmpty!19515 () Bool)

(assert (=> mapIsEmpty!19515 mapRes!19515))

(declare-fun b!447293 () Bool)

(declare-fun res!265613 () Bool)

(assert (=> b!447293 (=> (not res!265613) (not e!262668))))

(assert (=> b!447293 (= res!265613 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7937))))

(declare-fun b!447294 () Bool)

(declare-fun res!265616 () Bool)

(assert (=> b!447294 (=> (not res!265616) (not e!262668))))

(declare-fun arrayContainsKey!0 (array!27651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447294 (= res!265616 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!447295 () Bool)

(declare-fun res!265615 () Bool)

(assert (=> b!447295 (=> (not res!265615) (not e!262668))))

(assert (=> b!447295 (= res!265615 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13623 _keys!709))))))

(declare-fun b!447296 () Bool)

(declare-fun res!265618 () Bool)

(assert (=> b!447296 (=> (not res!265618) (not e!262670))))

(assert (=> b!447296 (= res!265618 (bvsle from!863 i!563))))

(declare-fun b!447297 () Bool)

(declare-fun e!262665 () Bool)

(assert (=> b!447297 (= e!262669 (and e!262665 mapRes!19515))))

(declare-fun condMapEmpty!19515 () Bool)

(declare-fun mapDefault!19515 () ValueCell!5617)

