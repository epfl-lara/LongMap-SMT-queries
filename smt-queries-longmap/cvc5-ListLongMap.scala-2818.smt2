; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40872 () Bool)

(assert start!40872)

(declare-fun b_free!10807 () Bool)

(declare-fun b_next!10807 () Bool)

(assert (=> start!40872 (= b_free!10807 (not b_next!10807))))

(declare-fun tp!38248 () Bool)

(declare-fun b_and!18949 () Bool)

(assert (=> start!40872 (= tp!38248 b_and!18949)))

(declare-fun b!453782 () Bool)

(declare-fun res!270244 () Bool)

(declare-fun e!265616 () Bool)

(assert (=> b!453782 (=> (not res!270244) (not e!265616))))

(declare-datatypes ((array!28097 0))(
  ( (array!28098 (arr!13492 (Array (_ BitVec 32) (_ BitVec 64))) (size!13844 (_ BitVec 32))) )
))
(declare-fun lt!206005 () array!28097)

(declare-datatypes ((List!8115 0))(
  ( (Nil!8112) (Cons!8111 (h!8967 (_ BitVec 64)) (t!13943 List!8115)) )
))
(declare-fun arrayNoDuplicates!0 (array!28097 (_ BitVec 32) List!8115) Bool)

(assert (=> b!453782 (= res!270244 (arrayNoDuplicates!0 lt!206005 #b00000000000000000000000000000000 Nil!8112))))

(declare-fun b!453783 () Bool)

(declare-fun res!270251 () Bool)

(declare-fun e!265619 () Bool)

(assert (=> b!453783 (=> (not res!270251) (not e!265619))))

(declare-fun _keys!709 () array!28097)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28097 (_ BitVec 32)) Bool)

(assert (=> b!453783 (= res!270251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!453784 () Bool)

(declare-fun res!270240 () Bool)

(assert (=> b!453784 (=> (not res!270240) (not e!265619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453784 (= res!270240 (validMask!0 mask!1025))))

(declare-fun b!453785 () Bool)

(declare-fun res!270242 () Bool)

(assert (=> b!453785 (=> (not res!270242) (not e!265619))))

(assert (=> b!453785 (= res!270242 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8112))))

(declare-fun b!453787 () Bool)

(declare-fun res!270243 () Bool)

(assert (=> b!453787 (=> (not res!270243) (not e!265619))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453787 (= res!270243 (validKeyInArray!0 k!794))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun b!453788 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!453788 (= e!265616 (and (not (= from!863 i!563)) (bvslt from!863 i!563) (or (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13844 _keys!709)))))))

(declare-datatypes ((V!17299 0))(
  ( (V!17300 (val!6117 Int)) )
))
(declare-datatypes ((tuple2!8058 0))(
  ( (tuple2!8059 (_1!4040 (_ BitVec 64)) (_2!4040 V!17299)) )
))
(declare-datatypes ((List!8116 0))(
  ( (Nil!8113) (Cons!8112 (h!8968 tuple2!8058) (t!13944 List!8116)) )
))
(declare-datatypes ((ListLongMap!6971 0))(
  ( (ListLongMap!6972 (toList!3501 List!8116)) )
))
(declare-fun lt!206004 () ListLongMap!6971)

(declare-fun minValue!515 () V!17299)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5729 0))(
  ( (ValueCellFull!5729 (v!8383 V!17299)) (EmptyCell!5729) )
))
(declare-datatypes ((array!28099 0))(
  ( (array!28100 (arr!13493 (Array (_ BitVec 32) ValueCell!5729)) (size!13845 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28099)

(declare-fun zeroValue!515 () V!17299)

(declare-fun v!412 () V!17299)

(declare-fun getCurrentListMapNoExtraKeys!1684 (array!28097 array!28099 (_ BitVec 32) (_ BitVec 32) V!17299 V!17299 (_ BitVec 32) Int) ListLongMap!6971)

(assert (=> b!453788 (= lt!206004 (getCurrentListMapNoExtraKeys!1684 lt!206005 (array!28100 (store (arr!13493 _values!549) i!563 (ValueCellFull!5729 v!412)) (size!13845 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206006 () ListLongMap!6971)

(assert (=> b!453788 (= lt!206006 (getCurrentListMapNoExtraKeys!1684 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!453789 () Bool)

(declare-fun res!270245 () Bool)

(assert (=> b!453789 (=> (not res!270245) (not e!265619))))

(assert (=> b!453789 (= res!270245 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13844 _keys!709))))))

(declare-fun b!453790 () Bool)

(declare-fun res!270246 () Bool)

(assert (=> b!453790 (=> (not res!270246) (not e!265619))))

(assert (=> b!453790 (= res!270246 (or (= (select (arr!13492 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13492 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453791 () Bool)

(declare-fun e!265617 () Bool)

(declare-fun tp_is_empty!12145 () Bool)

(assert (=> b!453791 (= e!265617 tp_is_empty!12145)))

(declare-fun b!453792 () Bool)

(declare-fun res!270241 () Bool)

(assert (=> b!453792 (=> (not res!270241) (not e!265619))))

(assert (=> b!453792 (= res!270241 (and (= (size!13845 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13844 _keys!709) (size!13845 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!453793 () Bool)

(declare-fun res!270249 () Bool)

(assert (=> b!453793 (=> (not res!270249) (not e!265619))))

(declare-fun arrayContainsKey!0 (array!28097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453793 (= res!270249 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19858 () Bool)

(declare-fun mapRes!19858 () Bool)

(assert (=> mapIsEmpty!19858 mapRes!19858))

(declare-fun b!453786 () Bool)

(assert (=> b!453786 (= e!265619 e!265616)))

(declare-fun res!270248 () Bool)

(assert (=> b!453786 (=> (not res!270248) (not e!265616))))

(assert (=> b!453786 (= res!270248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206005 mask!1025))))

(assert (=> b!453786 (= lt!206005 (array!28098 (store (arr!13492 _keys!709) i!563 k!794) (size!13844 _keys!709)))))

(declare-fun res!270247 () Bool)

(assert (=> start!40872 (=> (not res!270247) (not e!265619))))

(assert (=> start!40872 (= res!270247 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13844 _keys!709))))))

(assert (=> start!40872 e!265619))

(assert (=> start!40872 tp_is_empty!12145))

(assert (=> start!40872 tp!38248))

(assert (=> start!40872 true))

(declare-fun e!265620 () Bool)

(declare-fun array_inv!9772 (array!28099) Bool)

(assert (=> start!40872 (and (array_inv!9772 _values!549) e!265620)))

(declare-fun array_inv!9773 (array!28097) Bool)

(assert (=> start!40872 (array_inv!9773 _keys!709)))

(declare-fun b!453794 () Bool)

(declare-fun res!270250 () Bool)

(assert (=> b!453794 (=> (not res!270250) (not e!265616))))

(assert (=> b!453794 (= res!270250 (bvsle from!863 i!563))))

(declare-fun b!453795 () Bool)

(declare-fun e!265618 () Bool)

(assert (=> b!453795 (= e!265618 tp_is_empty!12145)))

(declare-fun b!453796 () Bool)

(assert (=> b!453796 (= e!265620 (and e!265617 mapRes!19858))))

(declare-fun condMapEmpty!19858 () Bool)

(declare-fun mapDefault!19858 () ValueCell!5729)

