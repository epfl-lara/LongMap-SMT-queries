; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20350 () Bool)

(assert start!20350)

(declare-fun b_free!5009 () Bool)

(declare-fun b_next!5009 () Bool)

(assert (=> start!20350 (= b_free!5009 (not b_next!5009))))

(declare-fun tp!18059 () Bool)

(declare-fun b_and!11755 () Bool)

(assert (=> start!20350 (= tp!18059 b_and!11755)))

(declare-fun b!200790 () Bool)

(declare-fun e!131644 () Bool)

(declare-fun tp_is_empty!4865 () Bool)

(assert (=> b!200790 (= e!131644 tp_is_empty!4865)))

(declare-fun b!200791 () Bool)

(declare-fun e!131647 () Bool)

(declare-fun e!131646 () Bool)

(assert (=> b!200791 (= e!131647 e!131646)))

(declare-fun res!95768 () Bool)

(assert (=> b!200791 (=> res!95768 e!131646)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!200791 (= res!95768 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6133 0))(
  ( (V!6134 (val!2477 Int)) )
))
(declare-datatypes ((tuple2!3746 0))(
  ( (tuple2!3747 (_1!1884 (_ BitVec 64)) (_2!1884 V!6133)) )
))
(declare-datatypes ((List!2662 0))(
  ( (Nil!2659) (Cons!2658 (h!3300 tuple2!3746) (t!7593 List!2662)) )
))
(declare-datatypes ((ListLongMap!2659 0))(
  ( (ListLongMap!2660 (toList!1345 List!2662)) )
))
(declare-fun lt!99514 () ListLongMap!2659)

(declare-fun lt!99513 () ListLongMap!2659)

(assert (=> b!200791 (= lt!99514 lt!99513)))

(declare-fun lt!99517 () ListLongMap!2659)

(declare-fun lt!99516 () tuple2!3746)

(declare-fun +!372 (ListLongMap!2659 tuple2!3746) ListLongMap!2659)

(assert (=> b!200791 (= lt!99513 (+!372 lt!99517 lt!99516))))

(declare-fun lt!99519 () ListLongMap!2659)

(declare-datatypes ((Unit!6044 0))(
  ( (Unit!6045) )
))
(declare-fun lt!99510 () Unit!6044)

(declare-fun v!520 () V!6133)

(declare-fun zeroValue!615 () V!6133)

(declare-fun addCommutativeForDiffKeys!93 (ListLongMap!2659 (_ BitVec 64) V!6133 (_ BitVec 64) V!6133) Unit!6044)

(assert (=> b!200791 (= lt!99510 (addCommutativeForDiffKeys!93 lt!99519 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99518 () ListLongMap!2659)

(declare-fun lt!99509 () tuple2!3746)

(assert (=> b!200791 (= lt!99518 (+!372 lt!99514 lt!99509))))

(declare-fun lt!99507 () ListLongMap!2659)

(declare-fun lt!99506 () tuple2!3746)

(assert (=> b!200791 (= lt!99514 (+!372 lt!99507 lt!99506))))

(declare-fun lt!99504 () ListLongMap!2659)

(declare-fun lt!99511 () ListLongMap!2659)

(assert (=> b!200791 (= lt!99504 lt!99511)))

(assert (=> b!200791 (= lt!99511 (+!372 lt!99517 lt!99509))))

(assert (=> b!200791 (= lt!99517 (+!372 lt!99519 lt!99506))))

(declare-fun lt!99512 () ListLongMap!2659)

(assert (=> b!200791 (= lt!99518 (+!372 (+!372 lt!99512 lt!99506) lt!99509))))

(declare-fun minValue!615 () V!6133)

(assert (=> b!200791 (= lt!99509 (tuple2!3747 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200791 (= lt!99506 (tuple2!3747 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8366 () Bool)

(declare-fun mapRes!8366 () Bool)

(declare-fun tp!18058 () Bool)

(assert (=> mapNonEmpty!8366 (= mapRes!8366 (and tp!18058 e!131644))))

(declare-fun mapKey!8366 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2089 0))(
  ( (ValueCellFull!2089 (v!4447 V!6133)) (EmptyCell!2089) )
))
(declare-fun mapValue!8366 () ValueCell!2089)

(declare-datatypes ((array!8961 0))(
  ( (array!8962 (arr!4231 (Array (_ BitVec 32) ValueCell!2089)) (size!4556 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8961)

(declare-fun mapRest!8366 () (Array (_ BitVec 32) ValueCell!2089))

(assert (=> mapNonEmpty!8366 (= (arr!4231 _values!649) (store mapRest!8366 mapKey!8366 mapValue!8366))))

(declare-fun res!95765 () Bool)

(declare-fun e!131643 () Bool)

(assert (=> start!20350 (=> (not res!95765) (not e!131643))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20350 (= res!95765 (validMask!0 mask!1149))))

(assert (=> start!20350 e!131643))

(declare-fun e!131645 () Bool)

(declare-fun array_inv!2783 (array!8961) Bool)

(assert (=> start!20350 (and (array_inv!2783 _values!649) e!131645)))

(assert (=> start!20350 true))

(assert (=> start!20350 tp_is_empty!4865))

(declare-datatypes ((array!8963 0))(
  ( (array!8964 (arr!4232 (Array (_ BitVec 32) (_ BitVec 64))) (size!4557 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8963)

(declare-fun array_inv!2784 (array!8963) Bool)

(assert (=> start!20350 (array_inv!2784 _keys!825)))

(assert (=> start!20350 tp!18059))

(declare-fun b!200792 () Bool)

(declare-fun res!95767 () Bool)

(assert (=> b!200792 (=> (not res!95767) (not e!131643))))

(declare-datatypes ((List!2663 0))(
  ( (Nil!2660) (Cons!2659 (h!3301 (_ BitVec 64)) (t!7594 List!2663)) )
))
(declare-fun arrayNoDuplicates!0 (array!8963 (_ BitVec 32) List!2663) Bool)

(assert (=> b!200792 (= res!95767 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2660))))

(declare-fun b!200793 () Bool)

(declare-fun res!95772 () Bool)

(assert (=> b!200793 (=> (not res!95772) (not e!131643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8963 (_ BitVec 32)) Bool)

(assert (=> b!200793 (= res!95772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200794 () Bool)

(assert (=> b!200794 (= e!131643 (not e!131647))))

(declare-fun res!95769 () Bool)

(assert (=> b!200794 (=> res!95769 e!131647)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200794 (= res!95769 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!934 (array!8963 array!8961 (_ BitVec 32) (_ BitVec 32) V!6133 V!6133 (_ BitVec 32) Int) ListLongMap!2659)

(assert (=> b!200794 (= lt!99504 (getCurrentListMap!934 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99508 () array!8961)

(assert (=> b!200794 (= lt!99518 (getCurrentListMap!934 _keys!825 lt!99508 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200794 (and (= lt!99512 lt!99507) (= lt!99507 lt!99512))))

(assert (=> b!200794 (= lt!99507 (+!372 lt!99519 lt!99516))))

(assert (=> b!200794 (= lt!99516 (tuple2!3747 k!843 v!520))))

(declare-fun lt!99505 () Unit!6044)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!47 (array!8963 array!8961 (_ BitVec 32) (_ BitVec 32) V!6133 V!6133 (_ BitVec 32) (_ BitVec 64) V!6133 (_ BitVec 32) Int) Unit!6044)

(assert (=> b!200794 (= lt!99505 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!47 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!308 (array!8963 array!8961 (_ BitVec 32) (_ BitVec 32) V!6133 V!6133 (_ BitVec 32) Int) ListLongMap!2659)

(assert (=> b!200794 (= lt!99512 (getCurrentListMapNoExtraKeys!308 _keys!825 lt!99508 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200794 (= lt!99508 (array!8962 (store (arr!4231 _values!649) i!601 (ValueCellFull!2089 v!520)) (size!4556 _values!649)))))

(assert (=> b!200794 (= lt!99519 (getCurrentListMapNoExtraKeys!308 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200795 () Bool)

(declare-fun res!95773 () Bool)

(assert (=> b!200795 (=> (not res!95773) (not e!131643))))

(assert (=> b!200795 (= res!95773 (and (= (size!4556 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4557 _keys!825) (size!4556 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200796 () Bool)

(declare-fun res!95770 () Bool)

(assert (=> b!200796 (=> (not res!95770) (not e!131643))))

(assert (=> b!200796 (= res!95770 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4557 _keys!825))))))

(declare-fun b!200797 () Bool)

(declare-fun e!131648 () Bool)

(assert (=> b!200797 (= e!131645 (and e!131648 mapRes!8366))))

(declare-fun condMapEmpty!8366 () Bool)

(declare-fun mapDefault!8366 () ValueCell!2089)

