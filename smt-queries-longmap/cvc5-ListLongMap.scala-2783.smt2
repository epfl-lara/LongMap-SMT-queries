; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40586 () Bool)

(assert start!40586)

(declare-fun b_free!10597 () Bool)

(declare-fun b_next!10597 () Bool)

(assert (=> start!40586 (= b_free!10597 (not b_next!10597))))

(declare-fun tp!37611 () Bool)

(declare-fun b_and!18605 () Bool)

(assert (=> start!40586 (= tp!37611 b_and!18605)))

(declare-fun b!447602 () Bool)

(declare-fun res!265865 () Bool)

(declare-fun e!262791 () Bool)

(assert (=> b!447602 (=> (not res!265865) (not e!262791))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27677 0))(
  ( (array!27678 (arr!13284 (Array (_ BitVec 32) (_ BitVec 64))) (size!13636 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27677)

(assert (=> b!447602 (= res!265865 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13636 _keys!709))))))

(declare-fun mapIsEmpty!19536 () Bool)

(declare-fun mapRes!19536 () Bool)

(assert (=> mapIsEmpty!19536 mapRes!19536))

(declare-fun b!447603 () Bool)

(declare-fun res!265868 () Bool)

(declare-fun e!262796 () Bool)

(assert (=> b!447603 (=> (not res!265868) (not e!262796))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!447603 (= res!265868 (bvsle from!863 i!563))))

(declare-fun b!447604 () Bool)

(declare-fun e!262795 () Bool)

(declare-fun tp_is_empty!11935 () Bool)

(assert (=> b!447604 (= e!262795 tp_is_empty!11935)))

(declare-fun b!447605 () Bool)

(assert (=> b!447605 (= e!262791 e!262796)))

(declare-fun res!265871 () Bool)

(assert (=> b!447605 (=> (not res!265871) (not e!262796))))

(declare-fun lt!204000 () array!27677)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27677 (_ BitVec 32)) Bool)

(assert (=> b!447605 (= res!265871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204000 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!447605 (= lt!204000 (array!27678 (store (arr!13284 _keys!709) i!563 k!794) (size!13636 _keys!709)))))

(declare-fun b!447606 () Bool)

(declare-fun res!265867 () Bool)

(assert (=> b!447606 (=> (not res!265867) (not e!262791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447606 (= res!265867 (validMask!0 mask!1025))))

(declare-fun b!447607 () Bool)

(declare-fun res!265874 () Bool)

(assert (=> b!447607 (=> (not res!265874) (not e!262791))))

(assert (=> b!447607 (= res!265874 (or (= (select (arr!13284 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13284 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447608 () Bool)

(declare-fun res!265864 () Bool)

(assert (=> b!447608 (=> (not res!265864) (not e!262791))))

(declare-datatypes ((List!7950 0))(
  ( (Nil!7947) (Cons!7946 (h!8802 (_ BitVec 64)) (t!13712 List!7950)) )
))
(declare-fun arrayNoDuplicates!0 (array!27677 (_ BitVec 32) List!7950) Bool)

(assert (=> b!447608 (= res!265864 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7947))))

(declare-fun b!447609 () Bool)

(declare-fun res!265869 () Bool)

(assert (=> b!447609 (=> (not res!265869) (not e!262791))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17019 0))(
  ( (V!17020 (val!6012 Int)) )
))
(declare-datatypes ((ValueCell!5624 0))(
  ( (ValueCellFull!5624 (v!8267 V!17019)) (EmptyCell!5624) )
))
(declare-datatypes ((array!27679 0))(
  ( (array!27680 (arr!13285 (Array (_ BitVec 32) ValueCell!5624)) (size!13637 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27679)

(assert (=> b!447609 (= res!265869 (and (= (size!13637 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13636 _keys!709) (size!13637 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447610 () Bool)

(declare-fun e!262792 () Bool)

(assert (=> b!447610 (= e!262792 (and e!262795 mapRes!19536))))

(declare-fun condMapEmpty!19536 () Bool)

(declare-fun mapDefault!19536 () ValueCell!5624)

