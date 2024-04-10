; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20814 () Bool)

(assert start!20814)

(declare-fun b_free!5467 () Bool)

(declare-fun b_next!5467 () Bool)

(assert (=> start!20814 (= b_free!5467 (not b_next!5467))))

(declare-fun tp!19442 () Bool)

(declare-fun b_and!12213 () Bool)

(assert (=> start!20814 (= tp!19442 b_and!12213)))

(declare-fun b!208670 () Bool)

(declare-fun res!101562 () Bool)

(declare-fun e!136063 () Bool)

(assert (=> b!208670 (=> (not res!101562) (not e!136063))))

(declare-datatypes ((array!9861 0))(
  ( (array!9862 (arr!4681 (Array (_ BitVec 32) (_ BitVec 64))) (size!5006 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9861)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9861 (_ BitVec 32)) Bool)

(assert (=> b!208670 (= res!101562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208671 () Bool)

(declare-fun res!101557 () Bool)

(assert (=> b!208671 (=> (not res!101557) (not e!136063))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6753 0))(
  ( (V!6754 (val!2709 Int)) )
))
(declare-datatypes ((ValueCell!2321 0))(
  ( (ValueCellFull!2321 (v!4679 V!6753)) (EmptyCell!2321) )
))
(declare-datatypes ((array!9863 0))(
  ( (array!9864 (arr!4682 (Array (_ BitVec 32) ValueCell!2321)) (size!5007 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9863)

(assert (=> b!208671 (= res!101557 (and (= (size!5007 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5006 _keys!825) (size!5007 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208672 () Bool)

(assert (=> b!208672 (= e!136063 false)))

(declare-fun v!520 () V!6753)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6753)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6753)

(declare-datatypes ((tuple2!4102 0))(
  ( (tuple2!4103 (_1!2062 (_ BitVec 64)) (_2!2062 V!6753)) )
))
(declare-datatypes ((List!2998 0))(
  ( (Nil!2995) (Cons!2994 (h!3636 tuple2!4102) (t!7929 List!2998)) )
))
(declare-datatypes ((ListLongMap!3015 0))(
  ( (ListLongMap!3016 (toList!1523 List!2998)) )
))
(declare-fun lt!106832 () ListLongMap!3015)

(declare-fun getCurrentListMapNoExtraKeys!464 (array!9861 array!9863 (_ BitVec 32) (_ BitVec 32) V!6753 V!6753 (_ BitVec 32) Int) ListLongMap!3015)

(assert (=> b!208672 (= lt!106832 (getCurrentListMapNoExtraKeys!464 _keys!825 (array!9864 (store (arr!4682 _values!649) i!601 (ValueCellFull!2321 v!520)) (size!5007 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106833 () ListLongMap!3015)

(assert (=> b!208672 (= lt!106833 (getCurrentListMapNoExtraKeys!464 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208673 () Bool)

(declare-fun res!101560 () Bool)

(assert (=> b!208673 (=> (not res!101560) (not e!136063))))

(declare-datatypes ((List!2999 0))(
  ( (Nil!2996) (Cons!2995 (h!3637 (_ BitVec 64)) (t!7930 List!2999)) )
))
(declare-fun arrayNoDuplicates!0 (array!9861 (_ BitVec 32) List!2999) Bool)

(assert (=> b!208673 (= res!101560 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2996))))

(declare-fun b!208674 () Bool)

(declare-fun res!101559 () Bool)

(assert (=> b!208674 (=> (not res!101559) (not e!136063))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!208674 (= res!101559 (= (select (arr!4681 _keys!825) i!601) k!843))))

(declare-fun b!208675 () Bool)

(declare-fun res!101563 () Bool)

(assert (=> b!208675 (=> (not res!101563) (not e!136063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208675 (= res!101563 (validKeyInArray!0 k!843))))

(declare-fun res!101561 () Bool)

(assert (=> start!20814 (=> (not res!101561) (not e!136063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20814 (= res!101561 (validMask!0 mask!1149))))

(assert (=> start!20814 e!136063))

(declare-fun e!136061 () Bool)

(declare-fun array_inv!3107 (array!9863) Bool)

(assert (=> start!20814 (and (array_inv!3107 _values!649) e!136061)))

(assert (=> start!20814 true))

(declare-fun tp_is_empty!5329 () Bool)

(assert (=> start!20814 tp_is_empty!5329))

(declare-fun array_inv!3108 (array!9861) Bool)

(assert (=> start!20814 (array_inv!3108 _keys!825)))

(assert (=> start!20814 tp!19442))

(declare-fun b!208676 () Bool)

(declare-fun e!136064 () Bool)

(declare-fun mapRes!9062 () Bool)

(assert (=> b!208676 (= e!136061 (and e!136064 mapRes!9062))))

(declare-fun condMapEmpty!9062 () Bool)

(declare-fun mapDefault!9062 () ValueCell!2321)

