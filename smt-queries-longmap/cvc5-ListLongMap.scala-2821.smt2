; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40890 () Bool)

(assert start!40890)

(declare-fun b_free!10825 () Bool)

(declare-fun b_next!10825 () Bool)

(assert (=> start!40890 (= b_free!10825 (not b_next!10825))))

(declare-fun tp!38302 () Bool)

(declare-fun b_and!18967 () Bool)

(assert (=> start!40890 (= tp!38302 b_and!18967)))

(declare-fun b!454187 () Bool)

(declare-fun res!270572 () Bool)

(declare-fun e!265780 () Bool)

(assert (=> b!454187 (=> (not res!270572) (not e!265780))))

(declare-datatypes ((array!28131 0))(
  ( (array!28132 (arr!13509 (Array (_ BitVec 32) (_ BitVec 64))) (size!13861 (_ BitVec 32))) )
))
(declare-fun lt!206086 () array!28131)

(declare-datatypes ((List!8129 0))(
  ( (Nil!8126) (Cons!8125 (h!8981 (_ BitVec 64)) (t!13957 List!8129)) )
))
(declare-fun arrayNoDuplicates!0 (array!28131 (_ BitVec 32) List!8129) Bool)

(assert (=> b!454187 (= res!270572 (arrayNoDuplicates!0 lt!206086 #b00000000000000000000000000000000 Nil!8126))))

(declare-fun b!454188 () Bool)

(declare-fun res!270574 () Bool)

(declare-fun e!265782 () Bool)

(assert (=> b!454188 (=> (not res!270574) (not e!265782))))

(declare-fun _keys!709 () array!28131)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17323 0))(
  ( (V!17324 (val!6126 Int)) )
))
(declare-datatypes ((ValueCell!5738 0))(
  ( (ValueCellFull!5738 (v!8392 V!17323)) (EmptyCell!5738) )
))
(declare-datatypes ((array!28133 0))(
  ( (array!28134 (arr!13510 (Array (_ BitVec 32) ValueCell!5738)) (size!13862 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28133)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!454188 (= res!270574 (and (= (size!13862 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13861 _keys!709) (size!13862 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454189 () Bool)

(declare-fun e!265781 () Bool)

(declare-fun tp_is_empty!12163 () Bool)

(assert (=> b!454189 (= e!265781 tp_is_empty!12163)))

(declare-fun b!454190 () Bool)

(declare-fun res!270569 () Bool)

(assert (=> b!454190 (=> (not res!270569) (not e!265782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28131 (_ BitVec 32)) Bool)

(assert (=> b!454190 (= res!270569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454191 () Bool)

(declare-fun res!270566 () Bool)

(assert (=> b!454191 (=> (not res!270566) (not e!265782))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454191 (= res!270566 (or (= (select (arr!13509 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13509 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454192 () Bool)

(declare-fun res!270570 () Bool)

(assert (=> b!454192 (=> (not res!270570) (not e!265782))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454192 (= res!270570 (validKeyInArray!0 k!794))))

(declare-fun b!454193 () Bool)

(declare-fun e!265778 () Bool)

(assert (=> b!454193 (= e!265778 tp_is_empty!12163)))

(declare-fun mapIsEmpty!19885 () Bool)

(declare-fun mapRes!19885 () Bool)

(assert (=> mapIsEmpty!19885 mapRes!19885))

(declare-fun b!454194 () Bool)

(declare-fun res!270564 () Bool)

(assert (=> b!454194 (=> (not res!270564) (not e!265782))))

(assert (=> b!454194 (= res!270564 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8126))))

(declare-fun b!454195 () Bool)

(declare-fun res!270567 () Bool)

(assert (=> b!454195 (=> (not res!270567) (not e!265782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454195 (= res!270567 (validMask!0 mask!1025))))

(declare-fun res!270568 () Bool)

(assert (=> start!40890 (=> (not res!270568) (not e!265782))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40890 (= res!270568 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13861 _keys!709))))))

(assert (=> start!40890 e!265782))

(assert (=> start!40890 tp_is_empty!12163))

(assert (=> start!40890 tp!38302))

(assert (=> start!40890 true))

(declare-fun e!265779 () Bool)

(declare-fun array_inv!9784 (array!28133) Bool)

(assert (=> start!40890 (and (array_inv!9784 _values!549) e!265779)))

(declare-fun array_inv!9785 (array!28131) Bool)

(assert (=> start!40890 (array_inv!9785 _keys!709)))

(declare-fun mapNonEmpty!19885 () Bool)

(declare-fun tp!38301 () Bool)

(assert (=> mapNonEmpty!19885 (= mapRes!19885 (and tp!38301 e!265781))))

(declare-fun mapValue!19885 () ValueCell!5738)

(declare-fun mapKey!19885 () (_ BitVec 32))

(declare-fun mapRest!19885 () (Array (_ BitVec 32) ValueCell!5738))

(assert (=> mapNonEmpty!19885 (= (arr!13510 _values!549) (store mapRest!19885 mapKey!19885 mapValue!19885))))

(declare-fun b!454196 () Bool)

(declare-fun res!270571 () Bool)

(assert (=> b!454196 (=> (not res!270571) (not e!265782))))

(assert (=> b!454196 (= res!270571 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13861 _keys!709))))))

(declare-fun b!454197 () Bool)

(declare-fun res!270565 () Bool)

(assert (=> b!454197 (=> (not res!270565) (not e!265780))))

(assert (=> b!454197 (= res!270565 (bvsle from!863 i!563))))

(declare-fun b!454198 () Bool)

(assert (=> b!454198 (= e!265779 (and e!265778 mapRes!19885))))

(declare-fun condMapEmpty!19885 () Bool)

(declare-fun mapDefault!19885 () ValueCell!5738)

