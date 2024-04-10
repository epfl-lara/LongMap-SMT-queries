; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40902 () Bool)

(assert start!40902)

(declare-fun b_free!10837 () Bool)

(declare-fun b_next!10837 () Bool)

(assert (=> start!40902 (= b_free!10837 (not b_next!10837))))

(declare-fun tp!38338 () Bool)

(declare-fun b_and!18979 () Bool)

(assert (=> start!40902 (= tp!38338 b_and!18979)))

(declare-fun b!454457 () Bool)

(declare-fun res!270782 () Bool)

(declare-fun e!265888 () Bool)

(assert (=> b!454457 (=> (not res!270782) (not e!265888))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17339 0))(
  ( (V!17340 (val!6132 Int)) )
))
(declare-datatypes ((ValueCell!5744 0))(
  ( (ValueCellFull!5744 (v!8398 V!17339)) (EmptyCell!5744) )
))
(declare-datatypes ((array!28155 0))(
  ( (array!28156 (arr!13521 (Array (_ BitVec 32) ValueCell!5744)) (size!13873 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28155)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!28157 0))(
  ( (array!28158 (arr!13522 (Array (_ BitVec 32) (_ BitVec 64))) (size!13874 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28157)

(assert (=> b!454457 (= res!270782 (and (= (size!13873 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13874 _keys!709) (size!13873 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454458 () Bool)

(declare-fun res!270789 () Bool)

(assert (=> b!454458 (=> (not res!270789) (not e!265888))))

(declare-datatypes ((List!8139 0))(
  ( (Nil!8136) (Cons!8135 (h!8991 (_ BitVec 64)) (t!13967 List!8139)) )
))
(declare-fun arrayNoDuplicates!0 (array!28157 (_ BitVec 32) List!8139) Bool)

(assert (=> b!454458 (= res!270789 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8136))))

(declare-fun b!454459 () Bool)

(declare-fun e!265890 () Bool)

(declare-fun tp_is_empty!12175 () Bool)

(assert (=> b!454459 (= e!265890 tp_is_empty!12175)))

(declare-fun b!454460 () Bool)

(declare-fun res!270783 () Bool)

(assert (=> b!454460 (=> (not res!270783) (not e!265888))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454460 (= res!270783 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!270781 () Bool)

(assert (=> start!40902 (=> (not res!270781) (not e!265888))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40902 (= res!270781 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13874 _keys!709))))))

(assert (=> start!40902 e!265888))

(assert (=> start!40902 tp_is_empty!12175))

(assert (=> start!40902 tp!38338))

(assert (=> start!40902 true))

(declare-fun e!265887 () Bool)

(declare-fun array_inv!9794 (array!28155) Bool)

(assert (=> start!40902 (and (array_inv!9794 _values!549) e!265887)))

(declare-fun array_inv!9795 (array!28157) Bool)

(assert (=> start!40902 (array_inv!9795 _keys!709)))

(declare-fun mapNonEmpty!19903 () Bool)

(declare-fun mapRes!19903 () Bool)

(declare-fun tp!38337 () Bool)

(assert (=> mapNonEmpty!19903 (= mapRes!19903 (and tp!38337 e!265890))))

(declare-fun mapValue!19903 () ValueCell!5744)

(declare-fun mapRest!19903 () (Array (_ BitVec 32) ValueCell!5744))

(declare-fun mapKey!19903 () (_ BitVec 32))

(assert (=> mapNonEmpty!19903 (= (arr!13521 _values!549) (store mapRest!19903 mapKey!19903 mapValue!19903))))

(declare-fun b!454461 () Bool)

(declare-fun res!270786 () Bool)

(assert (=> b!454461 (=> (not res!270786) (not e!265888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454461 (= res!270786 (validKeyInArray!0 k!794))))

(declare-fun b!454462 () Bool)

(declare-fun res!270784 () Bool)

(assert (=> b!454462 (=> (not res!270784) (not e!265888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454462 (= res!270784 (validMask!0 mask!1025))))

(declare-fun b!454463 () Bool)

(declare-fun e!265889 () Bool)

(assert (=> b!454463 (= e!265888 e!265889)))

(declare-fun res!270787 () Bool)

(assert (=> b!454463 (=> (not res!270787) (not e!265889))))

(declare-fun lt!206139 () array!28157)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28157 (_ BitVec 32)) Bool)

(assert (=> b!454463 (= res!270787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206139 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454463 (= lt!206139 (array!28158 (store (arr!13522 _keys!709) i!563 k!794) (size!13874 _keys!709)))))

(declare-fun b!454464 () Bool)

(declare-fun res!270780 () Bool)

(assert (=> b!454464 (=> (not res!270780) (not e!265889))))

(assert (=> b!454464 (= res!270780 (bvsle from!863 i!563))))

(declare-fun b!454465 () Bool)

(declare-fun res!270791 () Bool)

(assert (=> b!454465 (=> (not res!270791) (not e!265889))))

(assert (=> b!454465 (= res!270791 (arrayNoDuplicates!0 lt!206139 #b00000000000000000000000000000000 Nil!8136))))

(declare-fun b!454466 () Bool)

(declare-fun res!270785 () Bool)

(assert (=> b!454466 (=> (not res!270785) (not e!265888))))

(assert (=> b!454466 (= res!270785 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13874 _keys!709))))))

(declare-fun b!454467 () Bool)

(declare-fun e!265886 () Bool)

(assert (=> b!454467 (= e!265887 (and e!265886 mapRes!19903))))

(declare-fun condMapEmpty!19903 () Bool)

(declare-fun mapDefault!19903 () ValueCell!5744)

